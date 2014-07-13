b = Brick('ioType','usb');

b.outputStop(0,Device.MotorA,0);
b.outputPower(0,Device.MotorA,0);
b.outputStart(0,Device.MotorA);
b.outputClrCount(0,Device.MotorA);
pause(1);

Kp = 0.5;
Ki = 0%.05;
Kd = 0%.01;

e = b.outputGetCount(0,Device.MotorA);
eprev = e;
eint = 0;
dt = 0.03;
dt_program_flow = 0;
tic
while abs(e) < 90
    t = b.outputGetCount(0,Device.MotorA);
    e = 0-t;
    eint = eint + e;
    de_dt = (e-eprev)/dt;
    eprev = e;
    pid = Kp*e+ Ki*eint + Kd*de_dt;
    ppid = max(-100,min(100,pid));
    disp([num2str(t) ' ' num2str(e) ' ' num2str(pid)  ' ' num2str(ppid) ' ' num2str(dt)]);
    b.outputPower(0, Device.MotorA, ppid);
    b.outputStart(0,Device.MotorA);
    pause(0.05)
    
    %% setdt
    if dt_program_flow == 0
        timer_time = toc;
        dt_program_flow = 1;
    elseif dt_program_flow == 1
        tmp = toc;
        dt = tmp - timer_time;
        timer_time = tmp;
        dt_program_flow = 2;
    elseif dt_program_flow == 2
        tmp = toc;
        dt = 0.7*dt + 0.3*(tmp-timer_time);
        timer_time = tmp;
    end

end
b.outputStop(0,Device.MotorA,0)
b.delete();
