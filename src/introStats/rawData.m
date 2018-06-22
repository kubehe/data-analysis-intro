disp('1');
% try 
%    figure; % in case someone wants to see the image at runtime
% catch

% end

x=1:10; y=x;
disp('1');
figure;
h = plot(x, y);
saveas(h, '../../output/histMat.png');
disp('2');
