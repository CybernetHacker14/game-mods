from careers.career_base import CareerBase
from careers.career_scheduler import get_career_schedule_for_level
from singletons import DEFAULT
from sims4.utils import flexmethod
import sims, sims4.log

logger = sims4.log.Logger('Careers', default_owner='ujjwal')


@flexmethod
def get_hourly_pay(cls, inst, sim_info=DEFAULT, career_track=DEFAULT, career_level=DEFAULT, overmax_level=DEFAULT):
    inst_or_cls = inst if inst is not None else cls
    sim_info = sim_info if sim_info is not DEFAULT else inst.sim_info
    career_track = career_track if career_track is not DEFAULT else inst.current_track_tuning
    career_level = career_level if career_level is not DEFAULT else inst.level
    overmax_level = overmax_level if overmax_level is not DEFAULT else inst.overmax_level
    logger.assert_raise(career_level >= 0, 'get_hourly_pay: Current Level is negative: {}, Level: {}',
                        type(inst_or_cls).__name__, career_level)
    logger.assert_raise(career_level < len(career_track.career_levels), 'get_hourly_pay: Current Level is bigger then '
                                                                        'the number of careers: {}, Level: {}',
                        type(inst_or_cls).__name__, career_level)
    level_tuning = career_track.career_levels[career_level]
    hourly_pay = level_tuning.simoleons_per_hour
    if career_track.overmax is not None:
        hourly_pay *= pow(1.6, overmax_level)
    for trait_bonus in level_tuning.simolean_trait_bonus:
        if sim_info.trait_tracker.has_trait(trait_bonus.trait):
            hourly_pay += hourly_pay * (trait_bonus.bonus * 0.5)

    hourly_pay = int(hourly_pay)
    return hourly_pay


def get_assignment_pay(self, assignments):
    sim_info = self.sim_info
    career_track = self.current_track_tuning
    level_tuning = self.current_level_tuning
    work_schedule = get_career_schedule_for_level(level_tuning)
    hourly_pay = level_tuning.simoleons_per_hour
    if hourly_pay == 0:
        return 0
    else:
        duration = 0
        for schedule_entry in work_schedule._schedule_entry_tuning:
            if schedule_entry.duration != 0:
                duration = schedule_entry.duration
                break

        assignment_pay = level_tuning.simoleons_per_hour * duration * assignments / career_track.active_assignment_amount
        if career_track.overmax is not None:
            hourly_pay *= pow(1.1, self.overmax_level)
        for trait_bonus in level_tuning.simolean_trait_bonus:
            if sim_info.trait_tracker.has_trait(trait_bonus.trait):
                hourly_pay += hourly_pay * (trait_bonus.bonus * 0.01)

        assignment_pay = assignment_pay * hourly_pay / level_tuning.simoleons_per_hour
        return assignment_pay


CareerBase.get_hourly_pay = get_hourly_pay
CareerBase.get_assignment_pay = get_assignment_pay
