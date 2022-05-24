function p = MinimosQ(x, y, g)
% Regressão por Minimos Quadrados
% Entradas:
% x - variavel independente
% y - variavel dependente
% g - grau do polimônio de regressão

% Formação do Sistema Linear
m = length(x)
n = g + 1
a = zeros(n, n)
b = zeros(n, 1)

for i  =  1:1:n
  k1 = i-1;
  k2 = i;
  for j = 1:1:n
    if j == 1
      a(1,1) = m;
    else
      s = 0;
        for k = 1:1:m
          s = s + x(k)^(k2);
        end
        a(i, j) = s;
        a(j, i) = a(i, j);
        k2 = k2 + 1;
    end
  end
  s = 0;
  if i == 1
    for k = 1:1:m
      s = s+y(k);
    end
  else
    for k = 1:1:m
      s= s + y(k)*x(k)^(k1);
    end
  end
  b(i) = s;
  k1= k1 + 1;
 end
  
  % Resolução do sistema Linear
  % Matriz triangular superior

  for k = 1:1:n-1
    for i = k+1:1:n
      m = a(i, k)/a(k,k);
      a(i, k) = 0;
      for j = k+1:1:n
        a(i,j) = a(i,j) - m*a(k,j);
      end
      b(i) = b(i) - m*b(k);
    end
  end
  
  % Solução do sistema
  x = zeros(n, 1);
  x(n) = b(n)/a(n,n);
  for k = n-1:-1:1
    s = 0;
    for j = k+1:1:n
      s = s + a(k, j)*x(j);
    end
    x(k) = (b(k)-s)/a(k,k);
  end
  p = x
end
 
   