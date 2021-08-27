from functools import wraps
import services
import sims.sim

def inject(target_function, new_function):
    @wraps(target_function)
    def _inject(*args, **kwargs):
        return new_function(target_function, *args, **kwargs)
    return _inject

def inject_to(target_object, target_function_name):
    def _inject_to(new_function):
        target_function = getattr(target_object, target_function_name)
        setattr(target_object, target_function_name, inject(target_function, new_function))
        return new_function
    return _inject_to

cybernethacker14_stockbroker_sa_instance_ids = (10515634417626094415, )
    
@inject_to(sims.sim.Sim, 'on_add')
def cybernethacker14_stockbroker_add_super_affordances(original, self):
    original(self)
    sa_list = []
    affordance_manager = services.affordance_manager()
    for sa_id in cybernethacker14_stockbroker_sa_instance_ids:
        tuning_class = affordance_manager.get(sa_id)
        if not tuning_class is None:
            sa_list.append(tuning_class)
    self._phone_affordances = self._phone_affordances + tuple(sa_list)