
f = @(x) 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5 
x0 = 0
xn = 0.8
n = 1000

if( n  == 0)
  printf("Divisao por Zero")
else
  if( n < 0)
    printf("Intervalo Invalido")
  else
    h = (xn - x0)/n;
    x = x0 + h;
    soma = 0;
    for i = 1:n-1
      soma = soma +f(x);
      x = x + h;
    endfor
  endif
    r = h * ((f(x0)+f(xn)) / 2 + soma);
    printf("O resultado da integral da funcoo f e %.100d", r);
endif