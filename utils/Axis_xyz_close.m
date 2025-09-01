function Axis_xyz_close(fs)
    set(findobj(gca, 'Type','Quiver'),'Visible','off');
    set(findobj(gca,'Layer','Middle'),'Visible','off');
    set(gca,'fontsize',fs);
end
%%