XLabelopts.FontSize = 18;
YLabelopts.FontSize = 18;
axopts.FontSize = 14;
axopts.FontName = "Times";  % "LiberationSerif"
lgdopts.Location = "best";
lgdopts.FontSize = 14;
lgdopts.FontName = "Times";
% lgdopts.Interpreter = "latex";
lgdopts.box = "off";

t = out.Freq.time;
freq = out.Freq.signals.values;
vab = out.Vab.signals.values;
P = out.P.signals.values;
Q = out.Q.signals.values;
% 
% figure(1);
% grid on
% hold on
% plot(t, freq, LineWidth=2, Color=[0, 0, 0], LineStyle="-.");
% % xlim([0, 5]);
% ylim([49.7, 50.1]);
% xlabel("Time [s]")
% ylabel("Frequency [Hz]")
% label = ["jidi VSG sufa", "tedihashfa", "pipakozh"];
% lgd = legend(label);
% set(lgd, lgdopts);
% ax = gca;
% set(ax, axopts);
% set(ax.XLabel, XLabelopts);
% set(ax.YLabel, YLabelopts);
% exportgraphics(gcf, "./fig/freq_2.eps");
% % zp.run();
% % zp.BaseZoom();
% 
% figure(2);
% grid on
% hold on
% plot(t, vab, LineWidth=2, Color=[0, 0, 0], LineStyle="-.");
% % xlim([0, 5]);
% ylim([0, 400]);
% xlabel("Time [s]")
% ylabel("Line Voltage [V]")
% label = ["jidi VSG sufa", "tedihashfa", "pipakozh"];
% lgd = legend(label);
% set(lgd, lgdopts);
% ax = gca;
% set(ax, axopts);
% set(ax.XLabel, XLabelopts);
% set(ax.YLabel, YLabelopts);
% exportgraphics(gcf, "./fig/vab_2.eps");
% % zp.run();
% % zp.BaseZoom();
% 
% figure(3);
% grid on
% hold on
% plot(t, P, LineWidth=2, Color=[0, 0, 0], LineStyle="-.");
% % xlim([0, 5]);
% ylim([0, 150]);
% xlabel("Time [s]")
% ylabel("Active Power [kW]")
% label = ["jidi VSG sufa", "tedihashfa", "pipakozh"];
% lgd = legend(label);
% set(lgd, lgdopts);
% ax = gca;
% set(ax, axopts);
% set(ax.XLabel, XLabelopts);
% set(ax.YLabel, YLabelopts);
% exportgraphics(gcf, "./fig/p_2.eps");
% % zp.run();
% % zp.BaseZoom();

figure(4);
grid on
hold on
plot(t, Q, LineWidth=2, Color=[0, 0, 0], LineStyle="-.");
% xlim([0, 5]);
ylim([0, 100]);
xlabel("Time [s]")
ylabel("Reactive Power [kVar]")
label = ["jidi VSG sufa", "tedihashfa", "pipakozh"];
lgd = legend(label);
set(lgd, lgdopts);
ax = gca;
set(ax, axopts);
set(ax.XLabel, XLabelopts);
set(ax.YLabel, YLabelopts);
exportgraphics(gcf, "./fig/Q_0.eps");
% zp.run();
% zp.BaseZoom();

% %%
% figure(5);
% grid on
% hold on
% plot(t, out.PCC.signals.values(:, 1), LineWidth=2, Color=[0, 0, 0], LineStyle="-");
% plot(t, out.PCC.signals.values(:, 2), LineWidth=2, Color=[0, 0, 0], LineStyle="--");
% plot(t, out.PCC.signals.values(:, 3), LineWidth=2, Color=[0, 0, 0], LineStyle=":");
% xlim([4.96, 5]);
% ylim([-400, 400]);
% xlabel("Time [s]")
% ylabel("Phase Voltage [V]")
% label = ["A xi", "B xi", "C xi"];
% lgd = legend(label, NumColumns=3);
% set(lgd, lgdopts);
% ax = gca;
% set(ax, axopts);
% set(ax.XLabel, XLabelopts);
% set(ax.YLabel, YLabelopts);
% exportgraphics(gcf, "./fig/vpcc.eps");

% %%
% figure(6);
% grid on
% hold on
% plot(t, out.iPCC.signals.values(:, 1), LineWidth=2, Color=[0, 0, 0], LineStyle="-");
% plot(t, out.iPCC.signals.values(:, 2), LineWidth=2, Color=[0, 0, 0], LineStyle="--");
% plot(t, out.iPCC.signals.values(:, 3), LineWidth=2, Color=[0, 0, 0], LineStyle=":");
% xlim([4.96, 5]);
% ylim([-100, 100]);
% xlabel("Time [s]")
% ylabel("Phase Current [A]")
% label = ["A xi", "B xi", "C xi"];
% lgd = legend(label, NumColumns=3);
% set(lgd, lgdopts);
% ax = gca;
% set(ax, axopts);
% set(ax.XLabel, XLabelopts);
% set(ax.YLabel, YLabelopts);
% exportgraphics(gcf, "./fig/ipcc.eps");

% writematrix(out.tout(1:100:end, 1), "./data/time.csv");
% writematrix(out.Freq.signals.values(1:100:end, 1), "./data/freq_0.csv");
% writematrix(out.Vab.signals.values(1:100:end, 1), "./data/vab_0.csv");
