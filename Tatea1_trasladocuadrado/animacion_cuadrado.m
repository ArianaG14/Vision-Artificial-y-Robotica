
cuadrado = [0 3 3 0 0;
            0 0 3 3 0;
            0 0 0 0 0;
            1 1 1 1 1];


for i = 0:0.1:4
    
    clf

    axis([-1 15 -1 15]);
    grid on;
    hold on

    % cuadrado og
    plot(cuadrado(1,:), cuadrado(2,:), 'LineWidth',2)
   
    %para la animacion
    cuadradoanimado = cuadrado;
    cuadradoanimado(1,:)= cuadradoanimado(1,:) + i;
  
   % plotear el cuadradp animado
   plot(cuadradoanimado(1,:), cuadradoanimado(2,:),'LineWidth',2)
   hold on

   pause(0.1)
    
end
    
