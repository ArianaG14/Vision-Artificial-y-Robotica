



    %articulaciones
    %articulacion 1
    l1 = input("Longitud del eslabon 1(m): ");
    theta1 = input("Angulo theta 1(rad): ");
    

    %articulacion 2
    l2 = input("Longitud del eslabon 2(m): ");
    theta2 = input("Angulo theta 2(rad): ");
    
    %articulacion 3
    l3 = input("Longitud del eslabon 3(m): ");
    theta3 = input("Angulo theta (rad): ");
    

   
%bucle for para la animacion

% PRIMER MOVIMIENTO
% Los dos eslabones se mueven

for i = 0:0.1:1
    
    clf

    %ejes
line ([0 10], [0 0], 'LineWidth',2, 'Color','red');
line ([0 0], [0 10], 'LineWidth',2, 'Color', 'red');
hold on 
grid on

    angulo1 = theta1 * i;

    %eslabon1

    R1 = [cos(angulo1) -sin(angulo1);
          sin(angulo1) cos(angulo1)];

    P1 = [l1; 0];
   
    joint1 = [0 0]';
    p1_rotado = R1 * P1;
    joint2 = joint1 + p1_rotado;
    scatter(joint1(1), joint1(2), 'filled', 'red');
    scatter(joint2(1), joint2(2), 'filled', 'black');
    

    %eslabon2
     P2 = [l2; 0];
     p2_rotado = R1 * P2;

     joint3 =  joint2 + p2_rotado;
     scatter(joint3(1), joint3(2), 'filled', 'black');

     %eslabon 3
     P3 = [l3; 0];
     p3_rotado = R1 * P3;

     EF = joint3 + p3_rotado;
     scatter(EF(1), EF(2), 'filled', 'black');

     %dibujando eslabones
    line([joint1(1) joint2(1)], [joint1(2) joint2(2)], 'linewidth', 2, 'color', 'black');
    line([joint2(1) joint3(1)], [joint2(2) joint3(2)], 'linewidth', 2, 'color', 'black');
    line([joint3(1) EF(1)], [joint3(2) EF(2)], 'LineWidth',2, 'Color','black');
hold on
   
    drawnow
    pause(0.2);
end
hold on
%para el segundo eslabon
for i = 0:0.1:1
    clf


    %ejes
line ([0 10], [0 0], [0 0], 'LineWidth',2, 'Color','red');
line ([0 0], [0 10], [0 0], 'LineWidth',2, 'Color', 'red');
hold on 
grid on
    angulo1 = theta1;
    angulo2 = theta2 * i;

    %eslabon1

    R1 = [cos(angulo1) -sin(angulo1);
          sin(angulo1) cos(angulo1)];

    P1 = [l1; 0];
   
    joint1 = [0 0]';
    p1_rotado = R1 * P1;
    joint2 = joint1 + p1_rotado;
    scatter(joint1(1), joint1(2), 'filled', 'red');
    scatter(joint2(1), joint2(2), 'filled', 'black');
    

    
     %eslabon2

    R2 = [cos(angulo1 + angulo2) -sin(angulo1 + angulo2);
          sin(angulo1 + angulo2) cos(angulo1 + angulo2)];

    P2 = [l2; 0];
    p2_rotado = R2 * P2;

    joint3 =  joint2 + p2_rotado;
    scatter(joint3(1), joint3(2), 'filled', 'black');

    %eslabon3

     P3 = [l3; 0];
     p3_rotado = R2 * P3;

     EF = joint3 + p3_rotado;
     scatter(EF(1), EF(2), 'filled', 'black');

     %dibujando eslabones
    line([joint1(1) joint2(1)], [joint1(2) joint2(2)], 'linewidth', 2, 'color', 'black');
    line([joint2(1) joint3(1)], [joint2(2) joint3(2)], 'linewidth', 2, 'color', 'black');
    line([joint3(1) EF(1)], [joint3(2) EF(2)], 'LineWidth',2, 'Color','black');
hold on
   
    drawnow
    pause(0.2);
end


%3er eslabon
for i = 0:0.1:1
    clf


    %ejes
line ([0 10], [0 0], [0 0], 'LineWidth',2, 'Color','red');
line ([0 0], [0 10], [0 0], 'LineWidth',2, 'Color', 'red');
hold on 
grid on
    angulo2 = theta2;
    angulo3 = theta3 * i;

    %eslabon1

    R1 = [cos(angulo1) -sin(angulo1);
          sin(angulo1) cos(angulo1)];

    P1 = [l1; 0];
   
    joint1 = [0 0]';
    p1_rotado = R1 * P1;
    joint2 = joint1 + p1_rotado;
    scatter(joint1(1), joint1(2), 'filled', 'red');
    scatter(joint2(1), joint2(2), 'filled', 'black');
    

    
     %eslabon2

    R2 = [cos(angulo1 + angulo2) -sin(angulo1 + angulo2);
          sin(angulo1 + angulo2) cos(angulo1 + angulo2)];

    P2 = [l2; 0];
    p2_rotado = R2 * P2;

    joint3 =  joint2 + p2_rotado;
    scatter(joint3(1), joint3(2), 'filled', 'black');

    %eslabon3
     R3 = [cos(angulo1 + angulo2 + angulo3) -sin(angulo1 + angulo2 + angulo3);
          sin(angulo1 + angulo2 + angulo3) cos(angulo1 + angulo2 + angulo3)];

     P3 = [l3; 0];
     p3_rotado = R3 * P3;

     EF = joint3 + p3_rotado;
     scatter(EF(1), EF(2), 'filled', 'black');

     %dibujando eslabones
    line([joint1(1) joint2(1)], [joint1(2) joint2(2)], 'linewidth', 2, 'color', 'black');
    line([joint2(1) joint3(1)], [joint2(2) joint3(2)], 'linewidth', 2, 'color', 'black');
    line([joint3(1) EF(1)], [joint3(2) EF(2)], 'LineWidth',2, 'Color','black');
hold on
   
    drawnow
    pause(0.2);
end