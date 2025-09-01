function Visualization(CRF_sam, Nodes, Element, Set, Set_data, dim)
    close all;
    if dim == 1
        figure
        plot(Nodes,CRF_sam); 
        axis tight
        set(gca,'fontsize',15);
        hold on;
        plot(Nodes(1,Set),Set_data,'k.','MarkerSize',25);
    elseif dim == 2
        figure
        set(gcf,'Position',[866,436,1000,450])
      for id = 1:6   
        subplot(2,3,id)
        pdeplot(Nodes, Element,'xydata',CRF_sam(:,id),'ZData',CRF_sam(:,id));
        axis equal tight off;
        colormap jet;
        hold on;
        plot3(Nodes(1,Set),Nodes(2,Set),Set_data,'k.','MarkerSize',25);
      end
    elseif dim == 3
        figure
        set(gcf,'Position',[560,535,1300,450])
      for id = 1:6   
        subplot(2,3,id)
        pdeplot3D(Nodes, Element,'colormapdata',CRF_sam(:,id),'Mesh','on');
        colormap jet;
        Axis_xyz_close(15);
        view([-30 10])
        %
        hold on;
        plot3(Nodes(1,Set),Nodes(2,Set),Nodes(3,Set),'k.','MarkerSize',25);
      end
      % %%%%%%%
        load('Example_Input/Example_5_3D.mat');
        figure
        set(gcf,'Position',[560,35,1300,450])
      for id = 1:6   
        subplot(2,3,id)
        pdeplot3D(Nodes, Element(:,poi_y),'colormapdata',CRF_sam(:,id),'Mesh','on');
        colormap jet;
        Axis_xyz_close(15);
        view([-30 10])
        %
        hold on;
        plot3(Nodes(1,Set),Nodes(2,Set),Nodes(3,Set),'k.','MarkerSize',25);
      end
    end
end
%% END