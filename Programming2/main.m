%% Clear Variables & Load Data 
clear all;
close all;
clc;
load('PA2-cluster-data\cluster_data.mat');
addpath('PA2-cluster-images\');

%% PA-2-1-k-means
% [center result]= kmean(dataA_X, 4);
% plotf(result, dataA_Y, center);

%% PA-2-1-EM-GMM
% [center,result] = em_gaussian(dataA_X, 4);
% plotf(result, dataA_Y, center);

%% PA-2-1-Mean-Shift
% [center,result] = meanshift(dataA_X);
% plotf(result, dataA_Y, center);

%% PA-2-1-Mean-Shift-BANDWIDTH
% [center,result] = meanshift(dataC_X);
% plotf(result, dataC_Y, center);

%% PA-2-2 Image Segmentation - k-means
% img = imread('PA2-cluster-images\images\208001.jpg');
% subplot(1,3,1); imagesc(img); axis image;
% 
% [X, L] = getfeatures(img, 7);
% XX = [X(1:2,:) ; X(3:4,:)/10];
% 
% [C, result] = kmean(XX, 2);
% Y = result(:,5);
% 
% segm = labels2segm(Y, L);
% subplot(1,3,2); imagesc(segm); axis image;
% 
% csegm = colorsegm(segm, img);
% subplot(1,3,3); imagesc(csegm); axis image


%% PA-2-2 Image Segmentation - EM-GMM
% img = imread('PA2-cluster-images\images\208001.jpg');
% subplot(1,3,1); imagesc(img); axis image;
% 
% [X, L] = getfeatures(img, 7);
% XX = [X(1:2,:) ; X(3:4,:)/10];
% 
% [C, result] = em_gaussian(XX, 8);
% Y = result(:,5);
% 
% segm = labels2segm(Y, L);
% subplot(1,3,2); imagesc(segm); axis image;
% 
% csegm = colorsegm(segm, img);
% subplot(1,3,3); imagesc(csegm); axis image

%% PA-2-2 Image Segmentation - Mean-Shift
% img = imread('PA2-cluster-images\images\208001.jpg');
% subplot(1,3,1); imagesc(img); axis image;
% 
% [X, L] = getfeatures(img, 7);
% XX = [X(1:2,:) ; X(3:4,:)/10];
% 
% [C, result] = meanshift(XX);
% Y = result(:,5);
% 
% segm = labels2segm(Y, L);
% subplot(1,3,2); imagesc(segm); axis image;
% 
% csegm = colorsegm(segm, img);
% subplot(1,3,3); imagesc(csegm); axis image

%% PA-2-3 Image Segmentation - k-means-scaling
% img = imread('PA2-cluster-images\images\208001.jpg');
% subplot(1,3,1); imagesc(img); axis image;
% 
% [X, L] = getfeatures(img, 7);
% XX = [X(1:2,:) ; X(3:4,:)/10];
% 
% [C, result] = kmean2(XX, 5);
% Y = result(:,5);
% 
% segm = labels2segm(Y, L);
% subplot(1,3,2); imagesc(segm); axis image;
% 
% csegm = colorsegm(segm, img);
% subplot(1,3,3); imagesc(csegm); axis image

%% PA-2-2 Image Segmentation - Mean-Shift-Scaling
img = imread('PA2-cluster-images\images\208001.jpg');
subplot(1,3,1); imagesc(img); axis image;

[X, L] = getfeatures(img, 7);
k = 3;
XX = [X(1:2,:) ; k.*X(3:4,:)/10];

[C, result] = meanshift(XX);
Y = result(:,5);

segm = labels2segm(Y, L);
subplot(1,3,2); imagesc(segm); axis image;

csegm = colorsegm(segm, img);
subplot(1,3,3); imagesc(csegm); axis image