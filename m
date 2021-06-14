Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3C1C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 10:57:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E5D61283
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 10:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E5D61283
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+PUfJ+lYC7yXrEhfxdOwPs+Tz9KQQQtPoHmRFtH11Hw=; b=axBlz2uT6crrIlrOB6BNPP97q/
	r2IGNsZSG0pbfc8fZnB/yQNoBe2wad7+jJyzZ6h6xOWoAtYKOntJZ2fE/i01YQHbNGJC0MaIYzeTY
	sUnvJXuDTEepRyW17yKJmJ4MDDkAUiRyBH9anGQBnMcg1ilb1QGpT8Bjl25eeI6sR8vSbR9hcNKvR
	n4nu4Wrs8D+5ilOolAKm5ii4TJ5bhcxIO0NNQW7YXD5bSIPiuNdAY0mZixPvf7LQ//7RhmxRj4up9
	ppjlfLRRA9jVfIAbfqciRCoQhUsqq3h3x41v1rpC3ZUbNBtbZ70FaYcjsrVy71Dh5lRO8orCU9CHb
	HY+j2gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lskHN-00Djbr-MH; Mon, 14 Jun 2021 10:57:17 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lskHA-00DjYV-GJ; Mon, 14 Jun 2021 10:57:06 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id skGxlbuC6hqltskH1lmf3r; Mon, 14 Jun 2021 12:56:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1623668218; bh=AOudWRCLPe9UsgRtUXZk3e9P85IPnGpiu+lL8sTi4mU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=WpH+tPXfZoAAxmVvhbpyXuGZDhMtHDxoV9uzWMe/ahG0bJGzkXBDm0LqNMdKZW6eD
 tk46WvtagNCVk9zVzgth2Yp7kGP9gLbVpvpYM+jVGJ1+iGSRjTWPAKFQEnSI3DfdZz
 ktLKkghN7vJxuc7wuIG/vgml38th5q4/rb6x4BT3932RjSp87ODFT2c4ikO2hFFte5
 HxDffyjhi2ZKiUjfVYF7wkSzYJ9jFd0TBei2NffjFGE3QA/I1Up+TGxWBSyfEZOPJy
 7/i1VRUsEssUPiW894BXlDnDtkFnh6HKdqfC6LqkwYRwEyjxCiAXMjCCjh5Ha/nnNO
 6MgCTXp+v6DoQ==
Subject: Re: [RESENT PATCH V0 0/4] media: some framework interface extension
 for new feature of Mediatek Camsys driver
To: Louis Kuo <louis.kuo@mediatek.com>, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, arnd@arndb.de, sergey.senozhatsky@gmail.com,
 helen.koike@collabora.com, niklas.soderlund+renesas@ragnatech.se,
 yepeilin.cs@gmail.com
Cc: frederic.chen@mediatek.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210507074604.15079-1-louis.kuo@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <61393c9e-6f28-a357-8ea1-3590e883f107@xs4all.nl>
Date: Mon, 14 Jun 2021 12:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210507074604.15079-1-louis.kuo@mediatek.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfBr8/FTx31r1MxngxhkwPP1xVVVhMf03l2XIhYRo2BPSAa/6h0U5CnSBJIWBPqgT9S4JoK1CocG8f/HEFIKWo9vu/E2UHlTIutuI34VPUtJJpPAKSTfg
 dZecbBEQyMcor0GktqGzldxpjMSBP2v8OwkMBlQWaiYbbbP5KcOZrL2SHqJ92XJ/YGs6knGGdPDk3bGHXUX6Bb4mdHbpY4bmbZtfT+6c3i8m5NxxogrUUpu4
 nGSUH9jt05EkW19i7UUvbg9rQzBriJwn2C7ciuw01ussUc9Ky1NL7aknTMG42vguxdCDvO5i3CRU6l2HI4nGr1h9BkHPrblBJ5KZ9CcFICi/MT4bhsimxiUM
 bILJOArkAxf4QHHgsUOTn/4Jl4+/va9SBib6tUnZ4DL8ToexgjwV+PwAfizhdipq6AZqD2xjYk09Kz3zVBJVbXdZRRNoaiv6lzLwq5FFt2KVTtnN7EylJesD
 U+S562UdDofoWQHLaXTshDrTqYSHzwU9dpQ7gSpSNvqVNj2vchvaYYIKxhbxyz7vwd5y+9sqD6+V1JmN1tJP+6RjuK8KUnMf7wy90g9w7FI/O7jpDbTs4MDr
 qrqz4ZwLi47gt3X+BWf1HLpYm3r7Iijla8sXWisBB8zLURsxLp2IHvMaa81HsZ4cFDRggsJvQ05o8DJQnJTMmqYgKyViJhOQp18Mljjd8LV8g9aQPbPRL28V
 g+/Qh8Tfk6FfZlNiQNPFIU15XS2W+Vn8qk1xQZDri5ox/FsWPZc1oipJifHShTD/XvJRgilZI/4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_035704_707498_B844357B 
X-CRM114-Status: GOOD (  34.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Louis,

On 07/05/2021 09:46, Louis Kuo wrote:
> Hello,
> 
> This is the first version of the patch series extending V4L2 and media
> framework to support some advanced camera function, for example, to change
> the sensor when ISP is still streaming. A typical scenario is the wide-angle
> sensor and telephoto sensor switching in camera application. When the user
> is using the zooming UI, the application needs to switch the sensor from
> wide-angle sensor to telephoto sensor smoothly.
> 
> To finish the function, we may need to modify the links of a pipeline and
> the format of pad and video device per request. Currently, the link,
> pad and video device format and selection settings are not involved in
> media request's design. Therefore, we try to extend the related interface
> to support the request-based operations. In the early version, we added
> request fd to the parameters of MEDIA_IOC_SETUP_LINK,
> VIDIOC_S_FMT, VIDIOC_SUBDEV_S_SELECTION, VIDIOC_SUBDEV_S_FMT.
> The driver uses media_request_get_by_fd() to retrieve the media request
> and save the pending change in it, so that we can apply the pending change
> in req_queue() callback then.
> 
> Here is an example:
> 
> int mtk_cam_vidioc_s_selection(struct file *file, void *fh,
> 				struct v4l2_selection *s)
> {
> 	struct mtk_cam_device *cam = video_drvdata(file);
> 	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> 	struct mtk_cam_request_stream_data *stream_data;
> 	struct mtk_cam_request *cam_req;
> 	struct media_request *req;
> 	s32 fd;
> 
> 	fd = s->request_fd;
> 	if (fd < 0)
> 		return -EINVAL;
> 
> 	req = media_request_get_by_fd(&cam->media_dev, fd);
> 
> 	/* .... */
>  
> 	cam_req = to_mtk_cam_req(req);
> 	stream_data = &cam_req->stream_data[node->uid.pipe_id];
> 	stream_data->vdev_selection_update |= (1 << node->desc.id);
> 	stream_data->vdev_selection[node->desc.id] = *s;
> 
> 	/* .... */
> 
> 	media_request_put(req);
> 
> 	return 0;
> }
> 
> I posted interface change to discuss first and would like some
> review comments.
> 
> Thank you very much.

Just adding a request_fd in several places is the easy bit. The much
harder part is where to store that information, and even harder is an
outstanding issue with the request framework:

Currently the request framework is only used with decoder drivers, so
there are no subdev drivers involved. I suspect that there is a fair
amount of work to do to make it work well if part of the request configuration
is for subdev drivers.

Ideally I would like to see a proof-of-concept with the vimc driver.

I think getting this right is quite a lot of work. The public API part
is just a minor part of that since the public API was designed with support
for this in mind. It's the internal kernel support that is lacking.

If you want to pursue this (and that would be great!), then start with
vimc and initially just support controls in a request. The core problem
is likely to be how to keep track of the request data if it is spread
out between the bridge driver and subdev drivers, and that can be tested
with just supporting controls.

Adding support for formats and selection rectangles is, I think, much less
difficult and can be addressed later. Changing the topology in a request
is a separate issue as well, and I would suggest that you postpone that.
There is some low-level work going on that might make this easier in the
near future (1), we'll have to wait and see.

Regards,

	Hans

(1): https://patchwork.linuxtv.org/project/linux-media/cover/20210524104408.599645-1-tomi.valkeinen@ideasonboard.com/

> 
>   media: v4l2-core: extend the v4l2 format to support request
>   media: subdev: support which in v4l2_subdev_frame_interval
>   media: v4l2-ctrl: Add ISP Camsys user control
>   media: pixfmt: Add ISP Camsys formats
> 
>  drivers/media/mc/mc-device.c         |   7 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c | 153 ++++++++++++++++++++++++++-
>  include/media/media-entity.h         |   3 +
>  include/uapi/linux/media.h           |   3 +-
>  include/uapi/linux/v4l2-controls.h   |   4 +
>  include/uapi/linux/v4l2-subdev.h     |   8 +-
>  include/uapi/linux/videodev2.h       | 109 ++++++++++++++++++-
>  7 files changed, 275 insertions(+), 12 deletions(-)
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
