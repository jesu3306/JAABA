% saveaspdf(fig,filename)
function saveaspdf(varargin)

if nargin < 1,
  error('Usage: saveaspdf(fig,filename)');
end

if ischar(varargin{1}),
  fig = gcf;
  filename = varargin{1};
  args = varargin(2:end);
elseif nargin < 2,
  error('Usage: saveaspdf(fig,filename)');
else
  fig = varargin{1};
  filename = varargin{2};
  args = varargin(3:end);
end

set(fig,'PaperPositionMode','auto');
print(sprintf('-f%d',fig),'-r300','-depsc',filename,args{:});
unix(sprintf('epstopdf %s',filename));