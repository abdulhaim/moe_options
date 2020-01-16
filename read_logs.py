import os
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator

import numpy as np
import matplotlib.pyplot as plt
from statistics import mean

if __name__=="__main__":

    d = './runs'
    folder_runs = [os.path.join(d, o) for o in os.listdir(d) 
                    if os.path.isdir(os.path.join(d,o))]

    x_axis = []
    y_axis = []

    least = []
    for file in folder_runs:
        event_acc = EventAccumulator(file)
        event_acc.Reload()
        # Show all tags in the log file
        w_times, step_nums, vals = zip(*event_acc.Scalars('episode_lengths'))
        new_vals = list(vals)
        print(len(vals))
        print(file)
        y_axis.append(new_vals)
        if(len(least) > len(step_nums)):
            least = step_nums

    new_y_axis = list(map(list, zip(*y_axis))) 
    mean_plot = np.mean(new_y_axis, axis=1)
    std_plot = np.std(new_y_axis, axis = 1)
    print(len(least))
    print(len(mean_plot))
    print(len(std_plot))
    x_axis = range(0, len(mean_plot))
    plt.errorbar(x_axis, mean_plot, yerr=2*std_plot)
    plt.ylabel('steps')
    plt.xlabel('episodes')

    plt.show()





