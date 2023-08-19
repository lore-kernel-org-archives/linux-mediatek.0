Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E72EE499C
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Aug 2023 05:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjYIvJUW6kj0gfWEEIRsvjngePbsuzLpK5n6nOUcYr8=; b=38RN3anpGsBR15mZTN4fRMSvdZ
	RMnfgMXELbYhgFAc/DK5u2mpSqH/nl8BgexLkvjEcFIOkfk50VQEAUlM8NzQ8mgDyAb//MF5ddH2Q
	09P3czcJo2MFiTJcdKr0eALC6EIpVxVcBqMoVTGh/wAHsAJj/BvZ70Sjp0yCahSIWF92sh8yHMo8+
	jyrb/8/h8wZ+2Y/9tOtC8o8SKrlmRQPhjUIgUHJ4mw/RJY+3eSt5ej+w6r5s2is95OzfMK7ZCdaCH
	koU0GmVLEALijoGx8CTm52JraR2v2nv/ocpPY2zub+y/rNJCnN4OrllWkoWtU/LUlCSNa2WY3N9s8
	zg6rxywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXElP-00AS0y-0e;
	Sat, 19 Aug 2023 05:44:43 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXElK-00ARza-1d;
	Sat, 19 Aug 2023 05:44:41 +0000
Received: from [192.168.0.2] (ip5f5aed0d.dynamic.kabel-deutschland.de [95.90.237.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 26D4661E5FE01;
	Sat, 19 Aug 2023 07:43:38 +0200 (CEST)
Message-ID: <7f8cb8c7-cbf2-40c9-ac8f-c3c9b97919d7@molgen.mpg.de>
Date: Sat, 19 Aug 2023 07:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
 tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
 yuzhao@chromium.org, zwisler@chromium.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Sean.Cheng@mediatek.com, sj.huang@mediatek.com, christie.yu@mediatek.com,
 holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org, shik@chromium.org,
 suleiman@chromium.org, Allan.Yang@mediatek.com,
 Sakari Ailus <sakari.ailus@iki.fi>, Guenter Roeck <groeck@chromium.org>
Subject: Re: [RFC PATCH V3 0/5] media: platform: Add support for Digital Image
 Processing (DIP) on mt8183 SoC
Content-Language: en-US
To: Frederic Chen <frederic.chen@mediatek.com>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20190909192244.9367-1-frederic.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_224438_852100_671D89FE 
X-CRM114-Status: GOOD (  29.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[Cc: +Sakari, +Guenter]


Dear Frederic, dear Linux folks,


Am 09.09.19 um 21:22 schrieb frederic.chen@mediatek.com:

> This RFC patch series added Digital Image Processing (DIP) driver on Mediatek
> mt8183 SoC. It belongs to the Mediatek's ISP driver series based on V4L2 and
> media controller framework. I posted the main part of the DIP driver as RFC to
> discuss first and would like some review comments.
> 
> I appreciate the comment of Tomasz in RFC V2. The RFC V3 patch addressed on all
> issues reviewed in V2 except the one about Mediatek proprietary MDP stride,
> depth and raw depth usage which is still under discussion. I will refactor
> the related parts once we come to the conclusion.
> 
> You can check the following URL for the detail.
> http://lists.infradead.org/pipermail/linux-mediatek/2019-September/023254.html
> 
> 
> In V3, I also removed all workaround solution about the following V4L2
> compliance tool issues so that we got the related failed result.
> 
> 1. Request API test doesn't know which buffers of the video devices are
> required so we got failed in testRequests()
> 
> 2. V4L2 compliance test check if the driver return error when passing an
> invalid image size, but in vb2_create_bufs() case, we don't know if the
> size check is required or not.
> 
> Please see the following URL for the detail.
> http://lists.infradead.org/pipermail/linux-mediatek/2019-June/020884.html
> 
> 
> Besides that, we got a new issue about the test case. When receiving the
> VIDIOC_SUBDEV_G_FMT ioctl on a DIP sub device's pad which connects with a
> meta video device, we return -EINVEL since it doesn't represent an image
> data flow (no width and height information), but the test case expects
> that the driver return some media format information.
> 
> 	Sub-Device ioctls (Sink Pad 1):
> 	fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
> 	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
> 
> 
> ==============
>   Introduction
> ==============
> 
> Digital Image Processing (DIP) unit can accept the tuning parameters and
> adjust the image content in Mediatek ISP system. Furthermore, it performs
> demosaicing and noise reduction on the image to support the advanced camera
> features of the application. The DIP driver also support image format
> conversion, resizing and rotation with its hardware path.
> 
> The driver is implemented with V4L2 and media controller framework. We
> have the following entities describing the DIP path. Since a DIP frame has
> multiple buffers, the driver uses Request API to control the multiple
> buffer's enqueue flow.
> 
> 1. Meta (output video device): connects to DIP sub device. It accepts the
> input tuning buffer from userspace. The metadata interface used currently
> is only a temporary solution to kick off driver development and is not
> ready for reviewed yet.
> 
> 2. RAW (output video device): connects to DIP sub device. It accepts input
> image buffer from userspace.
> 
> 3. DIP (sub device): connects to MDP-0 and MDP-1. When processing an image,
> DIP hardware support multiple output images with different size and format
> so it needs two capture video devices to return the streaming data to the
> user.
> 
> 4. MDP-0 (capture video device): return the processed image data.
> 
> 5. MDP-1 (capture video device): return the processed image data, the
> image size and format can be different from the ones of MDP-0.
> 
> The overall file structure of the DIP driver is as following:
> 
> * mtk_dip-v4l2.c: implements DIP platform driver, V4L2 and vb2 operations.
> 
> * mtk_dip-sys.c: implements the hardware job handling flow including the part of
> interaction with the SCP and MDP.
> 
> * mtk_dip-dev.c: implements dip pipe utilities. DIP driver supports 3 software
> pipes (preview, capture and reprocessing) at the same time. All
> the pipes share the same DIP hardware to process the images.

Thank you for your work. I use the Lenovo IdeaPad Duet Chromebook 
(google/kukui variant of google/krane), and noticed the messages below 
using the camera in the browser with recent ChromeOS:

     [    0.000000] Linux version 5.10.180-22631-gc8e37fc5f0ab 
(chrome-bot@chromeos-release-builder-us-central1-b-x32-66-okmh) 
(Chromium OS 17.0_pre496208_p20230501-r6 clang version 17.0.0 
(/mnt/host/source/src/third_party/llvm-project 
98f5a340975bc00197c57e39eb4ca26e2da0e8a2), LLD 17.0.0) #1 SMP PREEMPT 
Wed Jul 26 19:01:55 PDT 2023
     […]
     [ 2766.733517] mtk-cam-dip 15022000.dip: req(0xffffff8e5fdc9800), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.737034] req(0xffffff8e5fdc9800), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.772352] mtk-cam-dip 15022000.dip: req(0xffffff8d88002000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.775906] req(0xffffff8d88002000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.788790] mtk-cam-dip 15022000.dip: req(0xffffff8d88000000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.792327] req(0xffffff8d88000000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.830257] mtk-cam-dip 15022000.dip: req(0xffffff8e5ff46000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.833806] req(0xffffff8e5ff46000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.869589] mtk-cam-dip 15022000.dip: req(0xffffff8e5ff44000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.873104] req(0xffffff8e5ff44000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.889804] mtk-cam-dip 15022000.dip: req(0xffffff8e5ff41000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.893351] req(0xffffff8e5ff41000), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.939293] mtk-cam-dip 15022000.dip: req(0xffffff8e5ff43800), 
req->dip_pipe(0xffffff8d829a0398)
     [ 2766.942827] req(0xffffff8e5ff43800), 
req->dip_pipe(0xffffff8d829a0398)

Search for that in the upstream Linux kernel, I found out, the the DIP 
support is not upstreamed yet, and also has not been added to the 
Chromium OS Linux kernel branches chromeos-5.15 and chromeos-6.1 [1].

Were you able to come to a conclusion regarding the two(?) issues 
mentioned in your cover letter, so this series can be re-posted as 
non-RFC? The driver seems to work well on millions(?) of devices, so 
it’d be great to have it upstream.

[…]


Kind regards,

Paul


[1]: 
https://chromium-review.googlesource.com/q/I1d1ba58cbdcdcc161b140398fc26b24ec2134cdb

