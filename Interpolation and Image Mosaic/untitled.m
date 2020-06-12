function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 01-Dec-2018 17:45:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function LoadImage1_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LoadImage1 as text
%        str2double(get(hObject,'String')) returns contents of LoadImage1 as a double
    a1=get(handles.LoadImage1,'string');
    a1
    
% --- Executes during object creation, after setting all properties.
function LoadImage1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoadImage1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LoadImage2_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LoadImage2 as text
%        str2double(get(hObject,'String')) returns contents of LoadImage2 as a double


% --- Executes during object creation, after setting all properties.
function LoadImage2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoadImage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function SetGlobalVar1(value)
global var1
var1 = value;
function v1 = GetGlobalVar1
global var1
v1 = var1;
function SetGlobalVar2(value)
global var2
var2 = value;
function v2 = GetGlobalVar2
global var2
v2 = var2;
function SetGlobalx(x)
global var_x
var_x= x;
function vx = GetGlobalx
global var_x
vx = var_x;
function SetGlobaly(y)
global var_y
var_y= y;
function vy = GetGlobaly
global var_y
vy = var_y;

function output=calhomography(x,y,homography)
    l=[x;y;1];
    output=homography*l;
    
function img2=ChangeExceptLinePixel(image,orgimg)
    for i=1:1:size(orgimg,1)
        for j=1:1:size(orgimg,2)
            if(orgimg(i,j)~=96)
                orgimg(i,j)=image(i,j);
            end       
        end
    end
    img2=orgimg;

function img1=ChangeBlueIfSame(myimg)
    for i=1:1:size(myimg,1)
        for j=1:1:size(myimg,2)
            if(myimg(i,j)==96)
                myimg(i,j)=95;
            end
        end
    end
    img1=myimg;
    

% --- Executes on button press in LoadImage1Button.
function LoadImage1Button_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        question=get(handles.listbox1,'Value');
        if(question==1)
            orgimg=imread(get(handles.LoadImage1,'String'));
            axes(handles.axes1); 
            imshow(orgimg);
            f=getframe(handles.axes1);
            orgimg=frame2im(f);
            myimg=double(orgimg);

            myimg=ChangeBlueIfSame(myimg);%change blue
            x_coor=[];
            y_coor=[];

            axes(handles.axes2);
            imshow(uint8(myimg));
            h = imfreehand('Closed',false);setColor(h,'blue');       
            f=getframe(handles.axes2);
            org=frame2im(f);
            orgimg=rgb2gray(org);


            for i=2:1:size(orgimg,1)-1
                for j=2:1:size(orgimg,2)-1
                    if(orgimg(i,j)==255)
                        y_coor=[y_coor() j];
                        y_coor=[y_coor() j+1];
                        y_coor=[y_coor() j-1];
                        %saving points of lines from imfreehand
                        x_coor=[x_coor() i];   
                        x_coor=[x_coor() i+1];
                        x_coor=[x_coor() i-1];
                    end       
                end
            end

            image=double(myimg);
            orgimg=ChangeExceptLinePixel(image,orgimg); 
            matrix=[x_coor(:) y_coor(:)];

            SetGlobalVar1(matrix);
            SetGlobalVar2(orgimg);
            SetGlobalx(x_coor);
            SetGlobaly(y_coor);
        elseif(question==2)
            img1=imread(get(handles.LoadImage1,'String'));
            img2=imread(get(handles.LoadImage2,'String'));
            img1=rgb2gray(img1);
            img2=rgb2gray(img2);
            SetGlobalVar1(img1);
            SetGlobalVar2(img2);
            axes(handles.axes1);
            imshow(GetGlobalVar1);
            axes(handles.axes2);
            imshow(GetGlobalVar2);
        end

% --- Executes on button press in LoadImage2Button.
function LoadImage2Button_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img2=imread(get(handles.LoadImage2,'String'));
    img2=rgb2gray(img2);
    SetGlobalVar2(img2);
    axes(handles.axes2);
    imshow(GetGlobalVar2);

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply.
function Apply_Callback(hObject, eventdata, handles)
% hObject    handle to Apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    question=get(handles.listbox1,'Value');
    if(question==1)
        orgimg=GetGlobalVar2;
        mat=GetGlobalVar1;
        uniqueimg = unique( mat, 'rows');
        mat=uniqueimg;
        newimg=zeros(size(orgimg,1),size(orgimg,2));
        for iteration=1:3                   %iteration loop for bilinear
            for f=1:1:size(mat,1)
                r=mat(f,1);
                c=mat(f,2);
                for i=1:size(orgimg,1)
                    for j=1:size(orgimg,2)    
                       if(c==j)&&(r==i)
                       a=0.5;
                       b=0.5;  
                            if(r==size(orgimg,1) && c==size(orgimg,2))
                                   value=orgimg(r,c)*(1-b)*(1-a);
                            elseif(r==size(orgimg,1))
                                value=orgimg(r,c+1)*(1-b)*a;
                            elseif (c==size(orgimg,2))
                                value=orgimg(r+1,c)*(1-a)*b;
                            else
                                value=orgimg(r,c)*(1-b)*(1-a)+orgimg(r+1,c)*(1-a)*b+orgimg(r,c+1)*(1-b)*a+orgimg(r+1,c+1)*b*a;
                            end
                         newimg(r,c)=round(value);
                       else
                           newimg(i,j)=orgimg(i,j); %if not the line pixel
                       end
                    end
                end
               orgimg=newimg; %update image on every pixel change from loop
            end
        end
        axes(handles.axes3);
        imshow(uint8(newimg));
    elseif(question==2)
        axes(handles.axes1);
        imshow(GetGlobalVar1);
        img1=GetGlobalVar1;
        axes(handles.axes2);
        imshow(GetGlobalVar2);
        img2=GetGlobalVar2;
        [x,y]=getpts(handles.axes1);
        [xd,yd]=getpts(handles.axes2);
        
        eqs=[x(1),y(1),1,0,0,0,-xd(1)*x(1),-xd(1)*y(1),-xd(1);...
            0,0,0,x(1),y(1),1,-yd(1)*x(1),-yd(1)*y(1),-yd(1);...
            x(2),y(2),1,0,0,0,-xd(2)*x(2),-xd(2)*y(2),-xd(2);...
            0,0,0,x(2),y(2),1,-yd(2)*x(2),-yd(2)*y(2),-yd(2);...
            x(3),y(3),1,0,0,0,-xd(3)*x(3),-xd(3)*y(3),-xd(3);...
            0,0,0,x(3),y(3),1,-yd(3)*x(3),-yd(3)*y(3),-yd(3);...
            x(4),y(4),1,0,0,0,-xd(4)*x(4),-xd(4)*y(4),-xd(4);...
            0,0,0,x(4),y(4),1,-yd(4)*x(4),-yd(4)*y(4),-yd(4);0,0,0,0,0,0,0,0,1];
        
        B=[0;0;0;0;0;0;0;0;1];
        X=linsolve(eqs,B);
        homographymatrix=[X(1),X(2),X(3);X(4),X(5),X(6);X(7),X(8),1];
        image1=double(img1);
        image2=double(img2);
        corner1=calhomography(0,0,homographymatrix);
        corner2=calhomography(size(image1,1),0,homographymatrix);
        corner3=calhomography(0,size(image1,2),homographymatrix);
        corner4=calhomography(size(image1,1),size(image1,2),homographymatrix); 
        corner5=calhomography(0,0,homographymatrix);
        corner6=calhomography(size(image2,1),0,homographymatrix);
        corner7=calhomography(0,size(image2,2),homographymatrix);
        corner8=calhomography(size(image2,1),size(image2,2),homographymatrix); 
        homographymatrix
        invhomography=inv(homographymatrix);
        display=zeros(1000,1000);
        
        %1n5 2n6 3n7 4n8
        %%%%%%%%%%%%%%%%%%%%%%
        for i=1:size(img1,1)
            for j=1:size(img1,2)
                    display(i+200,j+200)=img1(i,j);
            end
        end
        jj=0
        if(abs(round(corner1(1,1)))>abs(round(corner2(1,1))))
            jj=abs(round(corner2(1,1)));
        else
            jj=abs(round(corner1(1,1)))
        end
        for i=1:size(img2,1)
             for j=1:size(img2,1)
                    display(i+215,j+size(img2,1)+200)=img2(i,j);
             end
        end
       %inV(H) A*H resultant point replace with x n y
      % for i=1:1:700
       %     for j=1:1:700
        %       val=calculatehomography(i,j,homographymatrix);
         %      x=floor(val(1,1));
          %     y=floor(val(2,1));
           %    display(i,j)=img1(x,y);
          %  end
      % end
        figure, imshow(uint8(display));
      % axes(handles.axes1);
       %imshow(uint8(display));
    end
   % end



function ArgumentAlpha_Callback(hObject, eventdata, handles)
% hObject    handle to ArgumentAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ArgumentAlpha as text
%        str2double(get(hObject,'String')) returns contents of ArgumentAlpha as a double


% --- Executes during object creation, after setting all properties.
function ArgumentAlpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ArgumentAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ArgumentGamma_Callback(hObject, eventdata, handles)
% hObject    handle to ArgumentGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ArgumentGamma as text
%        str2double(get(hObject,'String')) returns contents of ArgumentGamma as a double


% --- Executes during object creation, after setting all properties.
function ArgumentGamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ArgumentGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ArgumentOther_Callback(hObject, eventdata, handles)
% hObject    handle to ArgumentOther (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ArgumentOther as text
%        str2double(get(hObject,'String')) returns contents of ArgumentOther as a double


% --- Executes during object creation, after setting all properties.
function ArgumentOther_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ArgumentOther (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RangeX1_Callback(hObject, eventdata, handles)
% hObject    handle to RangeX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeX1 as text
%        str2double(get(hObject,'String')) returns contents of RangeX1 as a double


% --- Executes during object creation, after setting all properties.
function RangeX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RangeY1_Callback(hObject, eventdata, handles)
% hObject    handle to RangeY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeY1 as text
%        str2double(get(hObject,'String')) returns contents of RangeY1 as a double


% --- Executes during object creation, after setting all properties.
function RangeY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RangeX2_Callback(hObject, eventdata, handles)
% hObject    handle to RangeX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeX2 as text
%        str2double(get(hObject,'String')) returns contents of RangeX2 as a double


% --- Executes during object creation, after setting all properties.
function RangeX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RangeY2_Callback(hObject, eventdata, handles)
% hObject    handle to RangeY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeY2 as text
%        str2double(get(hObject,'String')) returns contents of RangeY2 as a double


% --- Executes during object creation, after setting all properties.
function RangeY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Apply and none of its controls.
function Apply_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Apply (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
