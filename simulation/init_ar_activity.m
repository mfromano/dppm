function ishared_activity = init_ar_activity(n_sources, T, phi1, phi2, noise_level)

shared_activity = zeros(2*T,n_sources); % Hold the AR for each node.
for i = 3:T
    shared_activity(i,:) = phi1 .* shared_activity(i-1,:) + ...
                           phi2 .* shared_activity(i-2,:) + ...
                           noise_level * randn(1,n_sources);
end

ishared_activity_1 = interp(shared_activity(:,1),4);    %[21 Hz] 
ishared_activity_2 = interp(shared_activity(:,1),3);    %[28 Hz]
ishared_activity_3 = interp(shared_activity(:,1),2);    %[42 Hz]
ishared_activity_4 = interp(shared_activity(:,1),5);    %[17 Hz]
ishared_activity_5 = interp(shared_activity(:,1),6);    %[14 Hz]
ishared_activity_6 = interp(shared_activity(:,1),7);    %[12 Hz]

ishared_activity      = zeros(T, 3);                  %Create new shared activity
ishared_activity(:,1) = ishared_activity_1(1:T);      % ... 
ishared_activity(:,2) = ishared_activity_2(1:T);      % ... 
ishared_activity(:,3) = ishared_activity_3(1:T);      % ... 
ishared_activity(:,4) = ishared_activity_4(1:T);      % ... 
ishared_activity(:,5) = ishared_activity_5(1:T);      % ... 
ishared_activity(:,6) = ishared_activity_6(1:T);      % ... 

end
