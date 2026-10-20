% inputs
l1 = input("Valor de longitud de eslabon 1: ");
l2 = input("Valor de longitud de eslabon 2: ");
xf = input("Valor de coordenada x final: ");
yf = input("Valor de coordenada y final: ");
config = input('¿Qué configuración deseas? Escribe "arriba" para codo arriba o "abajo" para codo abajo: ', 's');

r2 = xf^2 + yf^2;
r = sqrt(r2);

if r > (l1 + l2) || r < abs(l1 - l2)
    error('El punto objetivo (xf, yf) está fuera del alcance del robot.');
end

sigma = atan(yf/xf);
cos_beta = ((l1^2 + r2 - l2^2) / (2 * l1 * r));
beta = acos(cos_beta);
gamma = acos((r2 - l1^2 -l2^2)/(l1*r));
cos_theta2 = ((r2 - l1^2 - l2^2)/(2*l1*l2));

    if strcmp((config), 'abajo')
        theta1 = sigma - beta;
        theta2 = acos(cos_theta2);
        
    

    elseif strcmp((config), 'arriba')
        theta1 = beta + sigma;
        theta2 = -acos(cos_theta2);
        
    end

lim = l1 + l2 + 1;


%bucle animkacion

for i = 0:0.05:1  % Reduje el paso a 0.05 para que se vea más fluido
    clf % Limpia la pantalla
    
    % 1. Configuración fija de los ejes para evitar parpadeos
    grid on; hold on; axis equal;
    xlim([-lim, lim]); 
    ylim([-lim, lim]);
    line([-lim lim], [0 0], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje X
    line([0 0], [-lim lim], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje Y

    % 2. Movimiento incremental del ángulo 1
    angulo1 = theta1 * i;
    % En este primer ciclo, el ángulo 2 se mantiene en 0 respecto al eslabón 1
    angulo2 = 0; 

    % 3. Cálculo de posiciones (Cinemática Directa)
    % Articulación 1 (Origen)
    joint1 =[0 0]';
    
    % Articulación 2 (Codo)
    l1x = l1 * cos(angulo1);
    l1y = l1 * sin(angulo1);
    joint2 = [l1x, l1y];
    
    % Efector Final (EF) -> Se suma angulo1 + angulo2
    EF_x = l1x + l2 * cos(angulo1 + angulo2);
    EF_y = l1y + l2 * sin(angulo1 + angulo2);
    EF = [EF_x, EF_y];

    % 4. Dibujar elementos en pantalla
    scatter(joint1(1), joint1(2), 50, 'filled', 'r');
    scatter(joint2(1), joint2(2), 50, 'filled', 'k');
    scatter(EF(1), EF(2), 50, 'filled', 'b');

    line([joint1(1), joint2(1)], [joint1(2), joint2(2)], 'LineWidth', 3, 'Color', 'k');
    line([joint2(1), EF(1)], [joint2(2), EF(2)], 'LineWidth', 3, 'Color', 'b');
   
    drawnow
    pause(0.05); % Pausa más corta para una animación fluida
end

%% SEGUNDO MOVIMIENTO: El eslabón 1 se queda fijo, se mueve el eslabón 2
for i = 0:0.05:1
    clf 
    
    % 1. Configuración fija de los ejes
    grid on; hold on; axis equal;
    xlim([-lim, lim]); 
    ylim([-lim, lim]);
    line([-lim lim], [0 0], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje X
    line([0 0], [-lim lim], 'LineWidth', 1, 'Color', [0.8 0.8 0.8]); % Eje Y

    % 2. El ángulo 1 ya llegó a su destino; el ángulo 2 empieza a crecer
    angulo1 = theta1;
    angulo2 = theta2 * i;

    % 3. Cálculo de posiciones
    joint1 =[0 0]';
    
    l1x = l1 * cos(angulo1);
    l1y = l1 * sin(angulo1);
    joint2 = [l1x, l1y];
    
    EF_x = l1x + l2 * cos(angulo1 + angulo2);
    EF_y = l1y + l2 * sin(angulo1 + angulo2);
    EF = [EF_x, EF_y];

    % 4. Dibujar elementos en pantalla
    scatter(joint1(1), joint1(2), 50, 'filled', 'r');
    scatter(joint2(1), joint2(2), 50, 'filled', 'k');
    scatter(EF(1), EF(2), 50, 'filled', 'b');

    line([joint1(1), joint2(1)], [joint1(2), joint2(2)], 'LineWidth', 3, 'Color', 'k');
    line([joint2(1), EF(1)], [joint2(2), EF(2)], 'LineWidth', 3, 'Color', 'b');
   
    drawnow
    pause(0.05);
end