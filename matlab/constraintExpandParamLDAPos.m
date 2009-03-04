function model = constraintExpandParamLDAPos(model,X)

M_i = zeros(model.numClass,model.numDim);
N_i = zeros(model.numClass,1);
M_0 = zeros(1,model.numDim);
N_0 = zeros(1);
for(i = 1:1:model.numClass)
  M_i(i,:) = mean(X(model.indices{i},model.dim));
  N_i(i) = length(model.indices{i});
  M_0 = M_0 + sum(X(model.indices{i},model.dim));
  N_0 = N_0 + N_i(i);
end
M_0 = M_0./N_0;

S_w = zeros(model.numDim);
S_b = zeros(model.numDim);
for(i = 1:1:model.numClass)
  S_w = S_w + N_i(i)/N_0*(M_i(i,:)-M_0)'*(M_i(i,:)-M_0);
  for(j = 1:1:length(model.indices{i}))
    S_b = S_b + (X(model.indices{i}(j),model.dim)-M_i(i,:))'*(X(model.indices{i}(j),model.dim)-M_i(i,:));
  end
end
% expand over full latent space
A = zeros(model.q);
A(model.dim,model.dim) = S_w;
S_w = A;
A(model.dim,model.dim) = S_b;
S_b = A;
clear A;

S_b = S_b./N_0;
S_b_inv = zeros(model.q);
S_b_inv(model.dim,model.dim) = pdinv(S_b(model.dim,model.dim));
model.A = S_b_inv*S_w;
model.S_w = S_w;
model.S_b = S_b;
model.S_b_inv = S_b_inv;

% separate
N_acum = 1;
N_s = [];
Ox = [];
for(i = 1:1:model.numClass)
  index = N_acum:1:N_acum+N_i(i)-1;
  W(index,index) = eye(N_i(i))-1 - 1/N_i(i)*ones(N_i(i),N_i(i));
  N_s = [N_s, N_i(i)];
  G(index,i) = 1/N_i(i)*ones(N_i(i),1);
  Ox = [Ox,X(model.indices{i},:)'];
  N_acum = N_acum + N_i(i);
end

B_p = diag(N_s);
G = G-(1./model.numLabled)*ones(model.numLabled,model.numClass);
B = G*B_p*G';

model.B = B;
model.W = W;
model.Ox = Ox;

return
