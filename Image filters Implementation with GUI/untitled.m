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

% Last Modified by GUIDE v2.5 10-Oct-2018 20:41:28

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


% --- Executes on button press in LoadImage1Button.
function LoadImage1Button_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in LoadImage2Button.
function LoadImage2Button_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
        I=imread(get(handles.LoadImage1,'String'));
        red=str2double(get(handles.ArgumentOther,'String'));
        count=1;
        red=red*100;
        temp=red;
        for i=temp:red:100
             temp=temp+red;
             count=count+1;
        end
        [rows,columns]=size(I);
        newimg=zeros(round(rows/count),round(columns/count));
        m=1;
        n=1;
        for a=1:count:rows
            for b=1:count:columns
                newimg(m,n)=I(a,b);
                n=n+1;
            end
            m=m+1;
            n=1;
        end
        axes(handles.axes1);
        imshow(I);
        axes(handles.axes2);
        imshow(newimg/255);
        figure, imshow(I);
        figure, imshow(newimg/255);
    elseif(question==2)
        I=imread(get(handles.LoadImage1,'String'));
        q=str2double(get(handles.ArgumentOther,'String'));
        q1=2^(8-q);
        a=round((I./q1))*q1;
        axes(handles.axes1);
        imshow(I);
        axes(handles.axes2);
        imshow(uint8(a));
    elseif(question==3)
        I1=imread(get(handles.LoadImage1,'String'));
        I2=imread(get(handles.LoadImage2,'String'));
        axes(handles.axes1);
        imshow(I1);
        axes(handles.axes2);
        imshow(I2);
        axes(handles.axes3);
        imshow(I1-I2);
        axes(handles.axes4);
        imshow(I2-I1);
    elseif(question==4)
        I1=imread(get(handles.LoadImage1,'String'));
        I2=imread(get(handles.LoadImage2,'String'));
        alpha=str2double(get(handles.ArgumentAlpha,'String'));
        [rows,columns]=size(I2);
        for i=1:rows
            for j=1:columns
                newimg(i,j)=alpha*(I1(i,j))+((1-alpha)*I2(i,j));
            end
            j=1;
        end
        axes(handles.axes1);
        imshow(newimg);
    elseif(question==5)
        I=imread(get(handles.LoadImage1,'String'));
        [rows,columns]=size(I);
        for i=1:rows
            for j=1:columns
                if(I(i,j)>128)
                    newimg2(i,j)=255-I(i,j);
                elseif(I(i,j)<128)
                    newimg3(i,j)=255-I(i,j);
                end
                newimg1(i,j)=255-I(i,j);
            end
            j=1;
        end
        axes(handles.axes1);
        imshow(I);
        axes(handles.axes2);
        imshow(newimg1);
        axes(handles.axes3);
        imshow(newimg2)
        axes(handles.axes4);
        imshow(newimg3);
    elseif(question==6)
        I=double(imread(get(handles.LoadImage1,'String')));
        y=str2double(get(handles.ArgumentGamma,'String'));
        c=str2double(get(handles.ArgumentOther,'String'));
        [rows,columns]=size(I);
        for i=1:rows
            for j=1:columns
               I(i,j)=(I(i,j)^y)*c;
            end
            j=1;
        end
        axes(handles.axes1);
        imshow(uint8(I));
     elseif(question==7)
        I=imread(get(handles.LoadImage1,'String'));
        x1=str2double(get(handles.RangeX1,'String'));
        y1=str2double(get(handles.RangeY1,'String'));
        x2=str2double(get(handles.RangeX2,'String'));
        y2=str2double(get(handles.RangeY2,'String'));
        slope=(y2-y1)/(x2-x1);
        intercept=y1-(slope*x1);
        [rows,columns]=size(I);
        slope
        intercept
        for i=1:rows
            for j=1:columns
               I2(i,j)=(slope*(I(i,j)))+intercept;
            end
            j=1;
        end
        axes(handles.axes1);
        imshow(uint8(I));
        axes(handles.axes2);
        imshow(uint8(I2));
        elseif(question==8)
            I=imread(get(handles.LoadImage1,'String'));
            ss=0;
            s=0;
            t=zeros(256,1);
            frequency=zeros(256,1);
            cumfrequency=zeros(256,1);
            frequencyprob=zeros(256,1);
            [rows,columns]=size(I);
            for i=1:rows
                for j=1:columns
                    frequency(I(i,j)+1,1)=frequency(I(i,j)+1,1)+1;
                    frequencyprob(I(i,j)+1,1)=frequency(I(i,j)+1,1)/(rows*columns);
                end
                j=1;
            end

            for i=1:rows
                s=s+frequency(i,1);
                ss=s;
                cumfrequency(i,1)=ss/(rows*columns);
                t(i,1)=round(cumfrequency(i,1)*255);
                   %cumfrequency(i,1)=(cumfrequency(i,1)+frequency(i,1))/(rows*columns);
                   %t(i,1)=round(cumfrequency(i,1)*255);
            end
            for i=1:rows
                 for j=1:columns
                     I2(i,j)=t(I(i,j)+1,1);
                 end
            end
            axes(handles.axes1);
            imshow(I);
            axes(handles.axes2);
            imshow(uint8(I2));
            axes(handles.axes3);
            imhist(I);
            axes(handles.axes4);
            imhist(uint8(I2));
        elseif(question==9)
            I=imread(get(handles.LoadImage1,'String'));
            x1=str2double(get(handles.RangeX1,'String'));
            y1=str2double(get(handles.RangeY1,'String'));
            [rows,columns]=size(I);
            I2=zeros(rows,columns);
            for i=1:x1:rows
                for j=1:y1:columns
                    r_start=i;
                    r_end=min(rows,i+x1);
                    c_start=j;
                    c_end=min(columns,j+y1);
                    windo=I(r_start:r_end,c_start:c_end,:);
                    
                    [rows1,columns1]=size(windo);
                    rr=zeros(rows1,columns1);
                    freq=zeros(256,1);
                    cumfreq=zeros(256,1);
                    freqprob=zeros(256,1);
                    for ii=1:x1:rows1
                        for jj=1:y1:columns1
                             freq(I(ii,jj)+1,1)=freq(I(ii,jj)+1,1)+1;
                             freqprob(I(ii,jj)+1,1)=freq(I(ii,jj)+1,1)/(rows*columns);
                        end
                    end
                    
                    sum=0;
                    t=zeros(256,1);
                    ss=0;
                    s=0;
                    for i=1:size(probf)
                        s=s+freq(i);
                        ss=s;
                        cumfreq(i,1)=s/(rows1*columns1);
                        t(i,1)=round(cumfreq(i,1)*255);
                    
                    for a=1:rows
                       for b=1:columns
                            rr(a,b)=t(windo(a,b)+1,1);
                       end
                    end
                    I2(r_start:r_end,c_start:c_end,:)=rr;
                    
                end
                end
            end
           axes(handles.axes1);
           imshow(I);
           title('Orignal Image');
           axes(handles.axes2);
           imhist(I);
           axes(handles.axes3);
           out
           imshow(uint8(I2));
           title('Non Overlapping Equalized');
           axes(handles.axes4);
           imhist(uint8(I2))
        elseif(question==11)
            I1=imread(get(handles.LoadImage1,'String'));
            I2=imread(get(handles.LoadImage2,'String'));
            camofl=I1;
        
            [rows,cols]=size(I1);
            for i=1:rows
                 for j=1:cols
                
                 bin=de2bi(camofl(i,j));
                 bin(1)=I2(i,j);
                
                 new=bi2de(bin);  
                 camofl(i,j)=new;
                 
             end
         end
         
         axes(handles.axes1);
         imshow(I1);
         title('Gray Scale Image');
         axes(handles.axes2);
         imshow(I2);
         title('Binary Image');
         axes(handles.axes3);
         
         imshow(camofl);
         title('Embedded Image')
      elseif(question==12)
    end



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
