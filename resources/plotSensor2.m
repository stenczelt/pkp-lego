brick = Brick('ioType','usb');
%brick = Brick('ioType','wifi','wfAddr','192.168.1.82','wfPort',5555,'wfSN','001653444434');
layer = 0;
no = Device.Port4;  
mode = Device.ColAmbient;


% create figure
hfig = figure('name','EV3 Sensor');
% init the the data
t = 0;
x = 0;
hplot = plot(t,x);
% one read to set the mode
reading = brick.inputReadSI(layer,no,mode);
% set the title
name = brick.inputDeviceGetName(layer,no);
title(['Device name: ' name]);
% set the y label
name = brick.inputDeviceSymbol(layer,no);
ylabel(['Sensor value (' name(1:end-1) ')']);
% set the x label
xlabel('Time (s)');
% set the x axis
xlim([0 20]);
% wait until the figure is closed
ylim([-50 50]);

% start timing
tic;
drift = 0;
r = 0;
while(findobj('name','EV3 Sensor') == 1)
    % get the reading
    reading = brick.inputReadSI(layer,no,mode);
    r = 0.99*r + 0.01*reading;
    t = [t toc];
    x = [x r];
    set(hplot,'Xdata',t)
    set(hplot,'Ydata',x)
    drawnow
    % reset after 10 seconds
    if (toc > 20)
        % reset
        t = 0;
        x = x(end);
        tic
    end
end

brick.delete();