function varargout = Image_Filter(varargout)



gui_Singleton=1;
gui_State= struct('gui_Name', mfilename, ...
                  'gui_Singleton', gui_Singleton, ...
                  'gui_OpeningFcn', @Image_Filter_OpeningFcn, ...
                  'gui_OutputFcn',  @Image_Filter_OutputFcn, ...
                  'gui_LayoutFcn',  [] , ...
                  'gui_Callback',   []);
if nargin && ischar(varagin{1})
    gui_State.gui_Callback= str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}= gui_mainfcn(gui_State, varargin{:});
else 
    gui_mainfcn(gui_State, varargin{:});
end %end initilazation

%Executes just before the filter is made visible 
function Image_Filter_OpeningFcn(h0gject, evendata, handles, varargin)
%this function has no output args, See out post 

handeles.output= h0bject; %deault command line output for project

guidata(h0ject, handles); %handles structure

Filter_1= imread ('BW_Filter1.jpg');
axes (handles.Filter1);
handles.Fill = Filter_1;
imshow(Filter_1);

Filter_2= imread ('BW_Filter2.jpg');
axes (handles.Filter2);
handles.Fill = Filter_2;
imshow(Filter_2);

Filter_3= imread ('BW_Filter3.jpg');
axes (handles.Filter3);
handles.Fill = Filter_3;
imshow(Filter_3);

Filter_4= imread ('BW_Filter4.jpg');
axes (handles.Filter4);
handles.Fill = Filter_4;
imshow(Filter_4);

guidata(h0bject, handles);

%UI makes image filter wait for user response

function varargout=Image_Filter_OutputFcn(h0bject, evendata, handles)

%default command line output from handles 
varargout{1}= handles.output;

%executes button in Browse Image
function Browse_Image_Callback= Browse_Image_Callback(h0bject, eventdata, handles)

[ipfilename]= uigetfile('*.*', 'Choose an input Image');
axes (handles.IPimage);
ip_image= imread(ipfilename);
imshow (ip_image);
handles.ipimg= ip_image;
guidata(h0bject, handles);

%executes button press in Apply_Filter
function Apply_Filter_Callback= (h0bject, eventdata, handles)

guidata(h0bject, handles);
ip= handles.ipimg;
switch (handles.Filter_Val)
    case 1
        fil= handles.Fil1;
    case 2 
        fil= handles.Fil2;
    case 3
        fil= handles.Fil3;
    case 4
        fil= handles.Fil4;
    otherwise 
        disp(' No Filter Selected ');
end

op= histMatch (ip, fil);
axes (handles.OPimage);
imshow (op);

%executes on selection change in Filter_List
function Filter_List_Callback= (h0bject, eventdata, handles)

handles.Filter_Val= get(h0bject, 'Value');
guidata(h0bject, handles);

%executes during object creation after setting all properties 
function Filter_List_CreateFcn= (h0bject, eventdata, handles)

if ispc && isequal(get(h0bject, 'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
   set(h0bject, 'BackgroundColor', 'white');
end

%executes on button press in exit 
function Exit_Callback(h0bject, eventdata, handles)

a= questdlg('Are you sure??, ...
                         'Yes','No', 'Default');
 switch a, 
   case 'No',
   %
   case 'Yes', 
   close all 
    case 'Default',
    %
    end





    
