import json
import logging
import warnings

from btb import HyperParameter


def setup(loglevel='ERROR'):
    loglevel = getattr(logging, loglevel)
    logging.basicConfig(level=loglevel)
    logging.getLogger().setLevel(level=loglevel)

    warnings.simplefilter("ignore")


def pprint(a_dict):
    print(json.dumps(a_dict, indent=4))


def get_tunables(hyperparameters):
    tunables = list()
    for block_name, params in hyperparameters.items():
        for param_name, param_details in params.items():
            key = (block_name, param_name)
            param_type = param_details['type']
            param_type = 'string' if param_type == 'str' else param_type

            if param_type == 'bool':
                param_range = [True, False]
            else:
                param_range = param_details.get('range') or param_details.get('values')

            value = HyperParameter(param_type, param_range)
            tunables.append((key, value))

    return tunables
