% Inputs
l1 = input("Valor de longitud de eslabon 1: ");
l2 = input("Valor de longitud de eslabon 2: ");
xf = input("Valor de coordenada x final: ");
yf = input("Valor de coordenada y final: ");
config = input('¿Qué configuración deseas? Escribe "arriba" para codo arriba o "abajo" para codo abajo: ', 's');

% 1. Cinemática Inversa considerando la base en (0, 3)
x_rel = xf - 0;
y_rel = yf - 3; % Desplazamiento del origen
r2 = x_rel^2 + y_rel^2;
r = sqrt(r2);

% Verificación de alcance
if r > (l1 + l2) || r < abs(l1 - l2)
    error('El punto objetivo (xf, yf) está fuera del alcance del robot desde la base (0,3).');
end

% Ángulo desde la base (0,3) hacia el punto final
sigma = atan2(y_rel, x_rel);

% Ley de Cosenos
cos_beta = (l1^2 + r2 - l2^2) / (2 * l1 * r);
cos_beta = max(-1, min(1, cos_beta));
beta = acos(cos_beta);

cos_theta2 = (r2 - l1^2 - l2^2) / (2 * l1 * l2);
cos_theta2 = max(-1, min(1, cos_theta2));
theta2_val = acos(cos_theta2);

% Configuración de codo
if strcmpi(config, 'abajo')
    theta1 = sigma - beta;
    theta2 = theta2_val;
elseif strcmpi(config, 'arriba')
    theta1 = sigma + beta;
    theta2 = -theta2_val;
else
    error('Configuración no válida. Escribe "arriba" o "abajo".');
end

% Límites de la ventana gráfica
lim = l1 + l2 + 4;

%% PRIMER MOVIMIENTO: El eslabón 1 gira desde la base en (0,3)
for i = 0:0.05:1
    clf;
    grid on; hold on; axis equal;
    xlim([-lim, lim]); 
    ylim([-lim, lim]);
    line([-lim lim], [0 0], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje X
    line([0 0], [-lim lim], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje Y
    
    % Dibuja la columna/base fija de (0,0) a (0,3) dentro de la animación
    line([0 0], [0 3], 'LineWidth', 3, 'Color', 'k');
    
    angulo1 = theta1 * i;
    angulo2 = 0; 
    
    % Posiciones (Cinemática Directa partiendo de y = 3)
    joint1 = [0, 3];
    l1x = joint1(1) + l1 * cos(angulo1);
    l1y = joint1(2) + l1 * sin(angulo1);
    joint2 = [l1x, l1y];
    
    EF_x = l1x + l2 * cos(angulo1 + angulo2);
    EF_y = l1y + l2 * sin(angulo1 + angulo2);
    EF = [EF_x, EF_y];
    
    % Dibujo
    scatter(0, 0, 40, 'filled', 'k'); % Punto del origen (0,0)
    scatter(joint1(1), joint1(2), 50, 'filled', 'r');
    scatter(joint2(1), joint2(2), 50, 'filled', 'k');
    scatter(EF(1), EF(2), 50, 'filled', 'b');
    
    line([joint1(1), joint2(1)], [joint1(2), joint2(2)], 'LineWidth', 3, 'Color', 'k');
    line([joint2(1), EF(1)], [joint2(2), EF(2)], 'LineWidth', 3, 'Color', 'b');
   
    drawnow;
    pause(0.03);
end

%% SEGUNDO MOVIMIENTO: Mantiene eslabón 1 y mueve el eslabón 2
for i = 0:0.05:1
    clf;
    grid on; hold on; axis equal;
    xlim([-lim, lim]); 
    ylim([-lim, lim]);
    line([-lim lim], [0 0], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje X
    line([0 0], [-lim lim], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje Y
    
    % Dibuja la columna/base fija de (0,0) a (0,3) dentro de la animación
    line([0 0], [0 3], 'LineWidth', 3, 'Color', 'k');
    
    angulo1 = theta1;
    angulo2 = theta2 * i;
    
    % Posiciones (Cinemática Directa partiendo de y = 3)
    joint1 = [0, 3];
    l1x = joint1(1) + l1 * cos(angulo1);
    l1y = joint1(2) + l1 * sin(angulo1);
    joint2 = [l1x, l1y];
    
    EF_x = l1x + l2 * cos(angulo1 + angulo2);
    EF_y = l1y + l2 * sin(angulo1 + angulo2);
    EF = [EF_x, EF_y];
    
    % Dibujo
    scatter(0, 0, 40, 'filled', 'k');
    scatter(joint1(1), joint1(2), 50, 'filled', 'r');
    scatter(joint2(1), joint2(2), 50, 'filled', 'k');
    scatter(EF(1), EF(2), 50, 'filled', 'b');
    
    line([joint1(1), joint2(1)], [joint1(2), joint2(2)], 'LineWidth', 3, 'Color', 'k');
    line([joint2(1), EF(1)], [joint2(2), EF(2)], 'LineWidth', 3, 'Color', 'b');
   
    drawnow;
    pause(0.03);
end