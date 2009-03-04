function ll = constraintLogLikelihoodLDA(model,X)

ll = model.lambda*trace(model.A);

return;