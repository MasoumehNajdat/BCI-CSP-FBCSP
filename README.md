# BCI-CSP-FBCSP

---
---

Classification of BCI competition IV dataset using CSP and Filter-Bank CSP For Ml-Based BCI In Python


## Dataset
### Dataset 1 :

Using BCI Competition IV Dataset consist of continuous signals of 59 EEG channels of 7 subjects and, for the calibration data, markers that indicate the time points of cue presentation and the corresponding target classes.

--Time Duration-- 

1 Trial : 4s

--Data Shape--

(Signal len, channels, Trials)


Data are provided in Matlab format (*.mat) containing variables:

- cnt: the continuous EEG signals, size [time x channels]. The array is stored in datatype INT16. To convert it to uV values, used cnt= 0.1*double(cnt); in Matlab.
- mrk: structure of target cue information with fields (the file of evaluation data does not contain this variable)   
- pos: vector of positions of the cue in the EEG signals given in unit sample, length #cues 
- y: vector of target classes
 (-1 for class one or 1 for class two), length #cues
- nfo: structure providing additional information with fields   
- fs: sampling rate is 100 Hz   
- clab: cell array of channel labels,  
- classes: cell array of the names of the motor imagery classes,  
- xpos: x-position of electrodes in a 2d-projection,
- ypos: y-position of electrodes in a 2d-projection.


### Dataset 2 for Multi Class:
Link is available in Reference

4 Classes : 
Left hand : class 1
Right hand : class 2
Both feet : class 3
Tongue : class 4

25 electrodes are used, first 22 are EEG, last 3 are EOG
Sampling frequency (fs) is 250Hz
- 9 subjects


1 trials : 6s
1 run : 48 trials = 336-384s
1 session = 6 runs = 288 trials = 2016-2304s


## Bandpass Filtering

First, decompose EEG into multiple frequencies bands, using Butterworth Filter.

The frequency range of 8 - 30 Hz is used.

## Common Average Reference Filter

Re-referencing channels' electrical activity by creating an average of all scalp channels and subtracting the resulting signal from each channel.


## CSP Algorithm 

The common spatial patterns (CSP) algorithm is a feature extraction method that uses spatial filters to maximize the discriminability of two classes.

- normalizing data 
- decomposing average covariance matrix of each class of each subject into 
eigenvalues and eigenvectors 
- sorting eignvectors by descending order
- Choosing n column of common spatial filters and apply it to data.

## References

- https://ieeexplore.ieee.org/document/1615701
- https://link.springer.com/article/10.1007/s11517-017-1611-4
- https://lampx.tugraz.at/~bci/database/001-2014/description.pdf