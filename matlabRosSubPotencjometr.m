% Init ros
rosinit();
% Subscriber 
sub = rossubscriber('/chatter');

firstCollection = true;
iteration = 1;
numberOfProbe = 50;

while 1
     analogVlv = receive(sub,2);
    
    if firstCollection
        vlvX(iteration) = analogVlv.Data;       
    else
        for i = 1 :numberOfProbe-1
            vlvX(i) = vlvX(i+1);
        end
        vlvX(numberOfProbe) = analogVlv.Data;
    end
  
    
    plot(vlvX,'-')
    axis([0 50 0 1025]);
    title('Analog read vlv');
    legend('Analog vlv');
    xlabel('Number of probe')
    ylabel('Value from arduino pin')
    grid on
    
    drawnow
    pause(0.001)
    
    if iteration < numberOfProbe         
        iteration = iteration +1;
    else 
        firstCollection = false;
    end
end


