DGPLVM software
Version 0.05		Wednesday 11 Aug 2010 at 07:35

This software implements various constrained GP-LVM models.

Version 0.05
-----------

First release with little documentation.


MATLAB Files
------------

Matlab files associated with the toolbox are:

constraintCreate.m: Creates a constraint model from a options struct
constraintCreateLDA.m: Creates a LDA constraint model from a options struct
constraintCreateLDANeg.m: Creates a LDANEG constraint model from a options struct
constraintCreateLDAPos.m: Creates a LDAPOS constraint model from a options struct
constraintExpandParam.m: Expands a constraint model
constraintExpandParamLDA.m: Expands a LDA constraint model
constraintExpandParamLDANeg.m: Expands a LDANEG constraint model
constraintExpandParamLDAPos.m: Expands a LDAPOS constraint model
constraintLogLikeGradients.m: Wrapper for constraint loglike gradients
constraintLogLikeGradientsLDA.m: Returns gradients of loglikelihood
constraintLogLikeGradientsLDANeg.m: Returns gradients of loglikelihood
constraintLogLikeGradientsLDAPos.m: Returns loglikegradients for LDAPos constraint
constraintLogLikelihood.m: Wrapper for Constraint loglikelihood
constraintLogLikelihoodLDA.m: Constraint loglikelihood for LDA model
constraintLogLikelihoodLDANeg.m: Constraint loglikelihood LDA Neg model
constraintLogLikelihoodLDAPos.m: Returns loglikelihood for LDAPos constraint
constraintOptions.m: Return default options for latent constraint.
