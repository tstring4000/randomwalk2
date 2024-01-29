%Programmer: Tyler Stringer                             Date: 4-27-15
%Description: This program generates a random walk.

1; %The "1" ensures Octave doesn't think that this script is a function.

r = 1;  %Radius.

%Generate initial point.
plot(0,0)
hold on;

n = 1;
nn = 1E3; %Number of iterations user wants.
x1_old = 0;
y1_old = 0;
x2_old = 0;
y2_old = 0;
j = 1; %Counter for cycling through color options.
rainbow = ['r', 'm', 'y', 'g', 'c', 'b', 'k'];
k = 1;
tslow = 1;  %Time in seconds for the pause time before plotting new line.
tfast = 0.02;   %Faster time for later on in the plotting.
tthreshold = 20;    %The iteration of the loop where we want to start speeding up the plotting.
h = axes;

while n <= nn && ishandle(h) %Do loop while n <= nn and if there is a figure present.
  theta1 = randi([0,359]); %Random integer degree between 0 and 359.
  theta2 = randi([0,359]); %Random integer degree between 0 and 359.
  x1_comp = r*cosd(theta1); %x1 component
  y1_comp = r*sind(theta1); %y1 component
  x2_comp = r*cosd(theta2); %x2 component
  y2_comp = r*sind(theta2); %y2 component
  x1 = x1_old + x1_comp;
  y1 = y1_old + y1_comp;
  x2 = x2_old + x2_comp;
  y2 = y2_old + y2_comp;

  hold all;
  line([x1_old x1],[y1_old y1],'Color','r') %For a 3D line:   line([.3 .7],[.4 .9],[1 1],'Marker','.','LineStyle','-')
  line([x2_old x2],[y2_old y2],'Color','b') %For a 3D line:   line([.3 .7],[.4 .9],[1 1],'Marker','.','LineStyle','-')
  plot(x1,y1)
  plot(x2,y2)
  figure = plot(x1,y1);
  set(h,'XTick',zeros(1,0),'XTickLabel',{},'YTick',zeros(1,0),...
    'YTickLabel',{});   %Remove labels on axes so it doesn't get muddied over time with new labels on each iteration of loop.
  %hold on;
  n = n+1;
  x1_old = x1; %New x value becomes the old.
  y1_old = y1; %Same for y.
  x2_old = x2; %New x value becomes the old.
  y2_old = y2; %Same for y.
  %sim(n) = theta1; %Array of simulation's theta values.
  if n < tthreshold
    pause(tslow); %Wait half a second (or however long the user wants). Comment out if you only want to see the final result (takes longer for larger nn).
  else
    pause(tfast); %Plot the lines faster now ... we don't want to wait all day.
  end
  %filename = sprintf('output/fig%0.4d.png',k);
  %saveas(figure,filename); %Uncomment if you want to save the figures (later you can make an animated gif, etc.).
  %k++;
end
