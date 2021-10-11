Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF42D60F5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF42D60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6GDmVUcCdWKPZ76RoT2RCwvvqhzls3OKu+q1aVZ/o7M=; b=YcilG8Q7QbE6yR/F71Hiuj3qIM
	+r7j6s7qrte4+MeTd8+s/v9azR1aHtfOvpMRKl84rD3B8Z4zPuLmjVMfdsWHu8wKJZwJ9PQFklLxv
	lrvthirW1MVx6JKkg/DXBVGCK4bLivOtMSx5Be8UkxGyEekSlPusF0eFsj87CGkPWWGD03LknhrZz
	EuAIImtAyDaHyDFfQVpjB+JSUG+yBGLXTCgvhUhdLwJAgqIjGi3mkah2Tqeyv7QZdeanFA8Zo6n4I
	JFecv40c1AntNbPEneW7UQUU3SUHeTixwF8uqxDvmPSUmZxX1Mxhfj7705wZoJos/Vn5+jCptcDgI
	JPWd9f3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZs70-008imp-5Q; Mon, 11 Oct 2021 10:00:50 +0000
Received: from lb1-smtp-cloud7.xs4all.net ([2001:888:0:108::1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZs2x-008gsT-LW; Mon, 11 Oct 2021 09:56:42 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id Zs2qmxezZk3b0Zs2tmLyFv; Mon, 11 Oct 2021 11:56:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1633946196; bh=LG8kagaKuABxfT0AH2KzGKN8lZd+955tYJGlfULwuEM=;
 h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=FAWXWuFGc4FXI+oc1huK5f+QRuMsVep8QBV+wiUgK8b7OY0EZBJjk7gmOqs64lzqx
 vYhsBI9A4IrPmbfsUKJ81mLRtKEi47hVkeqbPNIz4NvheuAOkD+yuiwVbVas+NvNXH
 13zXTuaq5C8w2haRhsAxdAhytBpkCUNHZikvEd0yfRRMzStjG0T3vQ/JtRGj3uNBJe
 fcxbl5aLT5qOHfYMAlH4FjpXD4HbDe/ASxpofFZTwk3Y/sgG/ORI3O7X2hX+ylgaQV
 oyniUHdDdBIT3/CfKqeSINKPU99jMHipextB4O1pMbcQlNVx2GqdOziqvM7aENqHCs
 +LcJ6rpNSKELA==
Subject: Re: [RESENT PATCH V0 0/4] media: some framework interface extension
 for new feature of Mediatek Camsys driver
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Louis Kuo <louis.kuo@mediatek.com>, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, arnd@arndb.de, sergey.senozhatsky@gmail.com,
 helen.koike@collabora.com, niklas.soderlund+renesas@ragnatech.se,
 yepeilin.cs@gmail.com
Cc: frederic.chen@mediatek.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210507074604.15079-1-louis.kuo@mediatek.com>
 <61393c9e-6f28-a357-8ea1-3590e883f107@xs4all.nl>
Message-ID: <4109bf9b-7210-6b1c-1614-abb1bbd74c6c@xs4all.nl>
Date: Mon, 11 Oct 2021 11:56:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <61393c9e-6f28-a357-8ea1-3590e883f107@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4xfH4GmGFpw4AelMZ2xke1e8WqwMh2XTbSad9xxewZIIjI+sAPk6WMnJOZRxBsAhuiDitwhJn0KvEp3M9tTPq16AJJCLhi+0hdwBIxCAf08bkfaWArKNM7
 +6yukj4sV4Ev1dwni52GzkMex74U43WPzhajZCw0+7pgoP7LZM17k0MSvRo4VFNqFgpCHSopQaWeD2a0l/zSgKhJcpOXgpyqp4393uZD6h1lJ+XgA6v5nxME
 ihDZWZ2fig2zqbe9x+i4GAbamVy50WeQqlkcQyOpxYHLXLaZ8cHgtRR6Omerp8TI2cS+wW55R5TOpyxRrLsZN76MnV6vYwklthsJL+BxakUGtKSUkehrADdp
 zxMr2/5G14E9fzaxGnWhUv7FUb1YAxuyRPTh1VbQwG3/Y3nIlW2GGFJjMd0eKm0TuhaR/jFQfFbdVR4uEVdwG48Z/gZneoZEANsorBl4VMwxJ7KKL04zI/rk
 I6hPwd6fFVKn4izpHN7OHgrWQ895JOsrtHvOv0XGTH+WcWERZJcG6Nx8z+i+fGKeytQkMq7E+eR7X0wWU2QrmOtmbFXNVoFLepSZ0lUl6sLVGiTGICoIw1Y7
 TBf7nKoPn6n7bkTwKiStwTo64sVyv1bgwPG7qamBtrNVZH2M6KxOqF8XlqrAEn9Cbu8TDW/fBRg70l72OjvjtI+L0J+KNspQGNeJ2RfQbYkNDTw5elNpeY+m
 RL+0Qx7DIOFNK7nQ0qQ93WhBuPk3HSKmy8ahR803QfbQet6ycA5eIldHNoGkmR0xlLojO+QLN7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_025640_121774_70D3F06B 
X-CRM114-Status: GOOD (  39.98  )
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

On 14/06/2021 12:56, Hans Verkuil wrote:
> Hi Louis,
> 
> On 07/05/2021 09:46, Louis Kuo wrote:
>> Hello,
>>
>> This is the first version of the patch series extending V4L2 and media
>> framework to support some advanced camera function, for example, to change
>> the sensor when ISP is still streaming. A typical scenario is the wide-angle
>> sensor and telephoto sensor switching in camera application. When the user
>> is using the zooming UI, the application needs to switch the sensor from
>> wide-angle sensor to telephoto sensor smoothly.
>>
>> To finish the function, we may need to modify the links of a pipeline and
>> the format of pad and video device per request. Currently, the link,
>> pad and video device format and selection settings are not involved in
>> media request's design. Therefore, we try to extend the related interface
>> to support the request-based operations. In the early version, we added
>> request fd to the parameters of MEDIA_IOC_SETUP_LINK,
>> VIDIOC_S_FMT, VIDIOC_SUBDEV_S_SELECTION, VIDIOC_SUBDEV_S_FMT.
>> The driver uses media_request_get_by_fd() to retrieve the media request
>> and save the pending change in it, so that we can apply the pending change
>> in req_queue() callback then.
>>
>> Here is an example:
>>
>> int mtk_cam_vidioc_s_selection(struct file *file, void *fh,
>> 				struct v4l2_selection *s)
>> {
>> 	struct mtk_cam_device *cam = video_drvdata(file);
>> 	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>> 	struct mtk_cam_request_stream_data *stream_data;
>> 	struct mtk_cam_request *cam_req;
>> 	struct media_request *req;
>> 	s32 fd;
>>
>> 	fd = s->request_fd;
>> 	if (fd < 0)
>> 		return -EINVAL;
>>
>> 	req = media_request_get_by_fd(&cam->media_dev, fd);
>>
>> 	/* .... */
>>  
>> 	cam_req = to_mtk_cam_req(req);
>> 	stream_data = &cam_req->stream_data[node->uid.pipe_id];
>> 	stream_data->vdev_selection_update |= (1 << node->desc.id);
>> 	stream_data->vdev_selection[node->desc.id] = *s;
>>
>> 	/* .... */
>>
>> 	media_request_put(req);
>>
>> 	return 0;
>> }
>>
>> I posted interface change to discuss first and would like some
>> review comments.
>>
>> Thank you very much.
> 
> Just adding a request_fd in several places is the easy bit. The much
> harder part is where to store that information, and even harder is an
> outstanding issue with the request framework:
> 
> Currently the request framework is only used with decoder drivers, so
> there are no subdev drivers involved. I suspect that there is a fair
> amount of work to do to make it work well if part of the request configuration
> is for subdev drivers.
> 
> Ideally I would like to see a proof-of-concept with the vimc driver.
> 
> I think getting this right is quite a lot of work. The public API part
> is just a minor part of that since the public API was designed with support
> for this in mind. It's the internal kernel support that is lacking.
> 
> If you want to pursue this (and that would be great!), then start with
> vimc and initially just support controls in a request. The core problem
> is likely to be how to keep track of the request data if it is spread
> out between the bridge driver and subdev drivers, and that can be tested
> with just supporting controls.
> 
> Adding support for formats and selection rectangles is, I think, much less
> difficult and can be addressed later. Changing the topology in a request
> is a separate issue as well, and I would suggest that you postpone that.
> There is some low-level work going on that might make this easier in the
> near future (1), we'll have to wait and see.

Just FYI: I have not heard anything about this since my reply, so I am marking
this series as RFC in patchwork.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
> (1): https://patchwork.linuxtv.org/project/linux-media/cover/20210524104408.599645-1-tomi.valkeinen@ideasonboard.com/
> 
>>
>>   media: v4l2-core: extend the v4l2 format to support request
>>   media: subdev: support which in v4l2_subdev_frame_interval
>>   media: v4l2-ctrl: Add ISP Camsys user control
>>   media: pixfmt: Add ISP Camsys formats
>>
>>  drivers/media/mc/mc-device.c         |   7 +-
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 153 ++++++++++++++++++++++++++-
>>  include/media/media-entity.h         |   3 +
>>  include/uapi/linux/media.h           |   3 +-
>>  include/uapi/linux/v4l2-controls.h   |   4 +
>>  include/uapi/linux/v4l2-subdev.h     |   8 +-
>>  include/uapi/linux/videodev2.h       | 109 ++++++++++++++++++-
>>  7 files changed, 275 insertions(+), 12 deletions(-)
>>
>>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
