function y = unit_impulse(n_p, m1, n2)
% Create an n sequence from n1 to n2
n = n1:n2;

y = zeros(1, length(n));
y(n == n_p) = 1;
end

n_p = 5; % Example position of the impulse
n1 = 0; % Start of the sequence
n2 = 10; % End of the sequence
y = unit_impulse(n_p, n1, n2);
stem(n1:n2, y);

% unit_step.m File
function y = unit_step(n_s, n1, n2)
% Create a sequence of n values from n1 to n2
n = n1:n2;
% Initialize y as a zero array of the same size as n
y = zeros(1, length(n));
% Set the values of y to 1 where n is greater than or equal to n_s
y(n >= n_s) = 1;
end

% Set the parameters
n_s = 0; % Step position
n1 = -10; % Start of the sequence
n2 = 10;  % End of the sequence
% Call the unit step function
y = unit_step(n_s, n1, n2);

% Plot the step sequence
n = n1:n2;
stem(n, y);
xlabel('n');
ylabel('y(n)');
title('Unit Step Sequence');

% time_shift.m file
function y = time_shift(x, n, n_d)
% Initialize y with zeros
y = zeros(size(x));
% Apply time shift by n_d samples
y((n_d + 1):end) = x(1:(end - n_d));
end

% 2.2) Define and plot x(n)
n = -10:10; % Range of n
x = 2 * n + 3; % Define x(n)

% a. Plot x(n)
figure;
stem(n, x);
title('Plot of x(n)');
xlabel('n');
ylabel('x(n)');

% b. Plot a time delayed version of x(n) delayed by 3 samples
n_d = 3; % Time delay
x_delayed = time_shift(x, n, n_d);
figure;
stem(n, x_delayed);
title('Plot of time delayed x(n) by 3 samples');
xlabel('n');
ylabel('x(n)');

% c. Plot the time-reversal of x(n)
x_reversed = fliplr(x); % Flip the array to get time-reversal
figure;
stem(n, x_reversed);
title('Time-reversal of x(n)');
xlabel('n');
ylabel('x(n)');

% 2.3) Define and plot y(n)
delta_n = unit_impulse(4, n(1), n(end));
u_n = unit_step(0, n(1), n(end));
y = 5 * delta_n - 2 * unit_impulse(-2, n(1), n(end));
figure;
stem(n, y);
title('Plot of y(n)');
xlabel('n');
ylabel('y(n)');

% 2.4) Define and plot z(n)
z = u_n - unit_step(-4, n(1), n(end));
figure;
stem(n, z);
title('Plot of z(n)');
xlabel('n');
ylabel('z(n)');

% Problem 3.1
load('ecg.mat');
x_n = ECG_Data;

% Plot x(n)
figure;
plot(x_n);
title('Original ECG Signal x(n)');
xlabel('Sample Number');
ylabel('Amplitude');
axis([0 2000 100 220]);

% Problem 3.2: Create output y(n) using a for loop
y_n = zeros(1, length(x_n)); % Initialize y(n) with zeros
for n = 1:(length(x_n) - 2)
    y_n(n) = (x_n(n) + x_n(n + 1) + x_n(n + 2)) / 3;
end

% Problem 3.3: Plot both x(n) and y(n) using subplot
figure;
subplot(2, 1, 1);
plot(x_n);
title('Original ECG Signal x(n)');
xlabel('Sample Number');
ylabel('Amplitude');
axis([0 2000 100 220]);

subplot(2, 1, 2);
plot(y_n);
title('Processed ECG Signal y(n)');
xlabel('Sample Number');
ylabel('Amplitude');
axis([0 2000 100 220]); % Set the axis limits as specified
