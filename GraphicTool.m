function [] = GraphicTool()
    close all ;
    global gui;
    gui.fig = figure();
    gui.p = plot(1,1);
    gui.p.Parent.Position = [0.2 0.25 0.7 0.7];
    
    gui.buttonGroup = uibuttongroup('visible','on','units','normalized','position',[0 0.4 .15 .25]);
    gui.a = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[0 0.8 1 0.20],'string','solidline');
    gui.b = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[0 0.5 1 0.20],'string','dashline');
    gui.c = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[0 0.2 1 0.20],'string','dotline');
    gui.d = uicontrol('style','pushbutton','string','solve','units','normalized','position',[0 0 1 .20],'callback',{@solve_Callback}); 
    set(gui.buttonGroup,'SelectionChangedFcn',@typeChange);
    %the buttons to the three different lines a user can crate with the
    %solve butoon 
    
    gui.e = uicontrol('style','edit','units','normalized','position',[0 0.9 0.10 0.05]);
    gui.f = uicontrol('style','edit','units','normalized','position',[0 0.8 0.10 0.05]);
    gui.g = uicontrol('style','edit','units','normalized','position',[0 0.7 0.10 0.05]);
    %those are the empty boxes that the figure displays after running the code
    
    gui.h = uicontrol('style','text','units','normalized','position',[0.12 0.9 0.01 0.05],'string','a');
    gui.i = uicontrol('style','text','units','normalized','position',[0.12 0.8 0.01 0.05],'string','b');
    gui.j=  uicontrol('style','text','units','normalized','position',[0.12 0.7 0.01 0.05],'string','c');
    %just the text lable for each empty box for the line ax+by=c 
    gui.type = '-'
end 


function [] = solve_Callback(hObject, eventdata)
global gui
a = str2num(gui.e.String)
b = str2num(gui.f.String)
c = str2num(gui.g.String)

%the equation code for the straight line that the code should display
x=0:10;
y = (c/b) -(a/b).*x;

plot(x,y,gui.type);
xlabel('x');
ylabel('y');
guidata(hObject,gui)
end 



function [] = radioselect(~,~)
     global gui;
     type = gui.buttonGroup.selectedObject.String;

end

function [] = typeChange(source,event)

global gui;

%the user will be able to switch between 3 different buttons to create what
%ever line the want. The three types are solid line, dashed line, and
%doted line

if strcmp('solidline',event.NewValue.String)    
      gui.type = '-'
end 

    
if strcmp('dashline',event.NewValue.String)
      gui.type = '--'
end 

if strcmp('dotline',event.NewValue.String)
      gui.type = ':'
      
end 

end 