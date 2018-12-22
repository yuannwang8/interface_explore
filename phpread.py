
import random

def ranintgen(npick, nrun):

    #### Update this to change integer selection range

    Imin = 1
    Imax = 50

    #### Update this to change integer selection range

    x1 = list()
    for i in range(nrun):
        xi = random.sample( range(Imin,Imax+1), npick) # range inclusive
        x1 = x1 + xi

    x1.sort()

    x0 = [x for x in list( range(Imin, Imax + 1)) if x not in x1]
    x0.sort()

    countx = dict()
    for x in x1:
        if x not in countx:
            countx[x] = 1
        else:
            countx[x] += 1
    for x in x0:
        countx[x] = 0

    countxkey = dict()
    for key in sorted( countx.keys()):
        countxkey[key] = countx[key]

    histheight = list()
    histbar = list()
    for key, val in countxkey.items(): # get pairs from dictionary
        histheight.append(val) # histogram height
        histbar.append(key) #histogram bars

    countxval = list()
    for key, val in countx.items(): # get pairs from dictionary
        countxval.append( (val, key)) # as a tuple
        countxval.sort(reverse = True)
        
    kcutoffvalue = countxval[npick - 1][0]

    mostfreqpicks = list()
    xc2 = list()
    for val, key in countxval:
        if val > kcutoffvalue:
            mostfreqpicks.append(key)
        elif val == kcutoffvalue:
            xc2.append(key)
        else:
            continue

    xc3 = list()
    if len(xc2) == 1:
        mostfreqpicks = mostfreqpicks + xc2
    else:
        xc3 = random.sample( xc2, npick - len(mostfreqpicks) )
        mostfreqpicks = mostfreqpicks + xc3

    mostfreqpicks.sort()

    abline_h = (npick*nrun)/(Imax - Imin)

    return(npick, nrun, abline_h, mostfreqpicks, histbar, histheight, Imin, Imax)

#######

import sys

npick = int(str(sys.argv[1]))
nrun = int(str(sys.argv[2]))

lst_data = ranintgen(npick, nrun)
# lst_data = ranintgen(5, 1000)

#######  

write_to_files = True
make_chart = True

####### Write results to text logs

if write_to_files:
    output_line = str ( lst_data[3] )
    fout_line = open('outputpy.txt','w')
    fout_line.write(output_line)
    fout_line.close()

##    from datetime import datetime
##    from datetime import timezone
##    timestr = datetime.now(timezone.utc)
##    output_log = str ( (lst_data[0], lst_data[1], lst_data[6], lst_data[7] , lst_data[3] , timestr) )
##    output_log = '\n' + output_log
##    fout_log = open('randomintpylog.txt','a') 
##    fout_log.write(output_log)
##    fout_log.close()
    
####### Make pretty chart

if make_chart:
    import numpy as np
    import matplotlib.pyplot as plt

    maintitle = 'Picking %d integers between %d and %d %d times' % ( lst_data[0], lst_data[6], lst_data[7], lst_data[1])
    xlab = 'Most picked: ' + str(lst_data[3])
    ylab = 'Count'

    heights = lst_data[5]
    bars = [str(x) for x in lst_data[4] ]
    y_pos = np.arange(len (bars))

    plt.bar(y_pos, heights, color = "lightcoral") 
    plt.axhline(lst_data[2], color = "red") 
    plt.title(maintitle) 
    plt.ylabel(ylab) 
    plt.xlabel(xlab) 
    plt.xticks( [] ) # pass empty list to disable names and ticks on x-axis; else plt.xticks(y_pos, bars)

    plt.gca().set_facecolor('whitesmoke')
    # Get rid of most of the frame
    plt.gca().spines['top'].set_visible(False)
    plt.gca().spines['right'].set_visible(False)
    plt.gca().spines['bottom'].set_visible(False)
    plt.gca().spines['left'].set_visible(True)


    for i in y_pos:
        plt.text( x = y_pos[i]-0.5, y = heights[i] + 0.03*max(heights), s = bars[i],
                  verticalalignment='center',
                  size = 6)

    # plt.savefig('test.svg') # weird white spaces around svg
    plt.savefig('tempp.png', bbox_inches = 'tight', formt = 'png', dpi = 100)

