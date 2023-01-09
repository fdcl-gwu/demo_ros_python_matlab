% function server = matlab_server
%%
rosinit('localhost');
rosgenmsg('./src'); % Use full path if necessary
addpath('./src/matlab_msg_gen_ros1/glnxa64/install/m');
savepath;

server = rossvcserver('/matrix_vec_mul', 'demo_package/DemoSrv', {@matlab_callback},...
                      'DataFormat','struct');
test_server;
% end

function test_server
%% Test the service
client = rossvcclient('/matrix_vec_mul', 'DataFormat', 'struct');
req = rosmessage(client);
req.A = uint64(3);
req.B = uint64(3);
req.R = rand(3,3);
req.X = rand(3,1);
resp = call(client, req);
disp('Successfully tested the service')
disp(resp.Y)
end

function resp = matlab_callback(src, req, resp)
%% Custom service callback
R = reshape(req.R, req.A, req.B);
X = reshape(req.X, req.B, 1);

resp.Y = R * X;
end
