# Wavelet Expansion

This was a project for my Linear Algebra class that involved using a basis of wavelets in order to approximate functions on the interval [0, 1]. The wavelet bases I was given didn't seem to work, however. This program seemed to indicate they weren't orthogonal or normal and they were unable to approximate x². To remedy this, I implemented Gram-Schmidt in order to use the wavelet family to construct a different orthonormal basis and approximate functions. This approach ended up working, but it was a lot of computational intensity that made it difficult to create more than about 10 terms. 

I am still not sure whether the issues with the orthonormality of the wavelets was due to an implementation error on my end or an incorrect wavelet basis; however, I checked over my code many times and as far as I can tell, my code is correct. 
