function ll = constraintLogLikelihoodLDANeg(model,X)

ll = model.lambda*trace(model.A);

return;