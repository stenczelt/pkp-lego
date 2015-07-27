% configuration
brick = Brick('ioType','usb')  % potentially change this to WiFi connection
layer = 0  % the usb chain layer (always 0 in this course)
no = Device.Port1  % the port number the sensor is attached to
mode = Device.Pushed  % the sensor mode from types.html

% start timing
tic;

% create figure
hfig = figure('name', 'EV3 Sensor');

% init the the data
t = 0;
x = 0;
hplot = plot(t,x);

% one read to set the mode
reading = brick.inputReadSI(layer, no, mode);

% set the title
name = brick.inputDeviceGetName(layer, no);
title(['Device name: ' name]);

% set the y label
name = brick.inputDeviceSymbol(layer, no);
ylabel(['Sensor value (' name(1 : end - 1) ')']);

% set the x label
xlabel('Time (s)');

% set the x axis
xlim([0 10]);

% wait until the figure is closed
while(findobj('name','EV3 Sensor') == 1)
    % get the reading
    reading = brick.inputReadSI(layer, no, mode);
    t = [t toc];
    x = [x reading];
    set(hplot, 'Xdata', t)
    set(hplot, 'Ydata', x)
    drawnow

    % reset after 10 seconds
    if (toc > 10)
       % reset
       t = 0;
       x = x(end);
       tic
    end
end

delete(brick)

