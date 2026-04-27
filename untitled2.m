clc; clear;

fprintf('Seleccione el método:\n');
fprintf('1. Bisección\n');
fprintf('2. Newton-Raphson\n');
fprintf('3. Secante\n');
fprintf('4. Comparar los tres\n');

op = input('Opción: ');

f = @(x) x.*cos(x) - 1;
df = @(x) cos(x) - x.*sin(x); % derivada

tol = 1e-6;

switch op
    case 1
        a = input('Ingrese a: ');
        b = input('Ingrese b: ');
        
        iter = 0;
        c = (a+b)/2;
        
        while abs(f(c)) > tol
            if f(a)*f(c) < 0
                b = c;
            else
                a = c;
            end
            c = (a+b)/2;
            iter = iter + 1;
        end
        
        fprintf('\nMétodo de Bisección:\n');
        fprintf('Raíz: %.8f\n', c);
        fprintf('Iteraciones: %d\n', iter);
        fprintf('Error: %.8e\n', abs(f(c)));

    case 2
        x = input('Ingrese x0: ');
        iter = 0;
        
        while abs(f(x)) > tol
            x = x - f(x)/df(x);
            iter = iter + 1;
        end
        
        fprintf('\nMétodo de Newton-Raphson:\n');
        fprintf('Raíz: %.8f\n', x);
        fprintf('Iteraciones: %d\n', iter);
        fprintf('Error: %.8e\n', abs(f(x)));

    case 3
        x0 = input('Ingrese x0: ');
        x1 = input('Ingrese x1: ');
        iter = 0;
        
        while abs(f(x1)) > tol
            x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
            x0 = x1;
            x1 = x2;
            iter = iter + 1;
        end
        
        fprintf('\nMétodo de la Secante:\n');
        fprintf('Raíz: %.8f\n', x1);
        fprintf('Iteraciones: %d\n', iter);
        fprintf('Error: %.8e\n', abs(f(x1)));

    case 4
        %% BISECCIÓN
        a = 0.6; b = 0.7;
        iter_b = 0;
        c = (a+b)/2;
        
        while abs(f(c)) > tol
            if f(a)*f(c) < 0
                b = c;
            else
                a = c;
            end
            c = (a+b)/2;
            iter_b = iter_b + 1;
        end
        
        %% NEWTON
        x = 0.5;
        iter_n = 0;
        while abs(f(x)) > tol
            x = x - f(x)/df(x);
            iter_n = iter_n + 1;
        end
        
        %% SECANTE
        x0 = 0.5; x1 = 0.7;
        iter_s = 0;
        while abs(f(x1)) > tol
            x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
            x0 = x1;
            x1 = x2;
            iter_s = iter_s + 1;
        end
        
        fprintf('\n--- COMPARACIÓN ---\n');
        
        fprintf('\nBisección:\nRaíz: %.8f | Iter: %d\n', c, iter_b);
        fprintf('Newton:\nRaíz: %.8f | Iter: %d\n', x, iter_n);
        fprintf('Secante:\nRaíz: %.8f | Iter: %d\n', x1, iter_s);
        
    otherwise
        disp('Opción inválida');
end