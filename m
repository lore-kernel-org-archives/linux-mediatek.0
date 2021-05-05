Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA185C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD804613C9
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD804613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YfdJyjAqADwaNQUEi2BYAAD/lHoQWc/OATsmmpGuZzA=; b=mLB5hnMpGadjldIpu8a2lp8kmh
	miB9cRtgI0zQZql9cJ6Wjg0CPznBRfYxMoLho7ERI5Q7W0ZCldr9bA3zSQ/QXR5zG5te+3CuZ6cL2
	vXJ8d4jRUdP/NJrDYytBI6a070oatttTCJn0GlXw4pKMZkRBwxutpT9Mj5EcYVie4SPyjFv57irkg
	biJP4QobZ2BAFKfssLTk9ule46kNdcMOhfKrwwvN38hGbUbsWYiQR78rhIr/ujSSvZayVW5wAF8m1
	10dAwI/MDoPJw2KVvz/b+OJSk6TqD/c+6YOoq7LMnl3bHPVpq+CdImw5HVrRPm9URMjypR69ffwss
	lyZcZXmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leCYQ-000bNT-QG; Wed, 05 May 2021 08:06:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYL-000bM1-1c; Wed, 05 May 2021 08:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=O0unUDH7u7+Z+u4pPm6SE8zrqmLXvYqFFwIQWx1ECC8=; b=4Cn61s4mSpa7JItufVZ2Fm0eC/
 4wSRodMCYMSzZFiKrDlvpDoCi95t87k6bZDmuEyKklxL0+GzEN9fMFJhHFQw50q8rGHRgOeOJCajH
 czGdww4IQYuqTrQrBqgouKNpfYUulrazVpyYh91t+86Zt/Ss9/vxjvzHQoXKMQfav2nkGrLz3fGB+
 bA2ThgrYthI9pH4jja2K7maiKhZ6Q+DzM7Oc3ODKin0QwEYuepXeeGa7S5M+q+J5Ucxm6Lfnz4TQT
 RqQcWnt2uQqtrHCtBIvr2ZGJlDjffWJjUTBWzZ255fP9If0m4gFseKeM1vMa9uGJ96B46Qk+hx7By
 iosuso4Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYG-004YQY-73; Wed, 05 May 2021 08:06:39 +0000
X-UUID: 164e2e155575470cb67a37f543ad6c90-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O0unUDH7u7+Z+u4pPm6SE8zrqmLXvYqFFwIQWx1ECC8=; 
 b=DZ9DPCMY+FSWCko4npv4ZMQSVzvWA4Vs9atnrBdF4JDKm2RdlYRibJw2r0GshFJB6oCzoqlTPjNQC5PX8UVdsoLmtYHRoUmDMmvikR3/qKVKG5DASs5FgObGDF+zs/WGoIecQnSauoDQvu8YP5j1Pyxhgi3FYDr4xf8PE9Oesgc=;
X-UUID: 164e2e155575470cb67a37f543ad6c90-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 923671593; Wed, 05 May 2021 01:06:32 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 01:06:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 16:06:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 16:06:29 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
 <arnd@arndb.de>, <louis.kuo@mediatek.com>, <sergey.senozhatsky@gmail.com>,
 <helen.koike@collabora.com>, <niklas.soderlund+renesas@ragnatech.se>,
 <yepeilin.cs@gmail.com>
CC: <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [RFC PATCH V0 0/4] media: some framework interface extension for new
 feature of Mediatek Camsys driver 
Date: Wed, 5 May 2021 16:06:22 +0800
Message-ID: <20210505080626.15432-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_010637_677118_20D8DA29 
X-CRM114-Status: GOOD (  16.42  )
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

Hello,

This is the first version of the RFC patch series extending V4L2 and media
framework to support some advanced camera function, for example, to change
the sensor when ISP is still streaming. A typical scenario is the wide-angle
sensor and telephoto sensor switching in camera application. When the user
is using the zooming UI, the application needs to switch the sensor from
wide-angle sensor to telephoto sensor smoothly.

To finish the function, we may need to modify the links of a pipeline and
the format of pad and video device per request. Currently, the link,
pad and video device format and selection settings are not involved in
media request's design. Therefore, we try to extend the related interface
to support the request-based operations. In the early version, we added
request fd to the parameters of MEDIA_IOC_SETUP_LINK,
VIDIOC_S_FMT, VIDIOC_SUBDEV_S_SELECTION, VIDIOC_SUBDEV_S_FMT.
The driver uses media_request_get_by_fd() to retrieve the media request
and save the pending change in it, so that we can apply the pending change
in req_queue() callback then.

Here is an example:

int mtk_cam_vidioc_s_selection(struct file *file, void *fh,
				struct v4l2_selection *s)
{
	struct mtk_cam_device *cam = video_drvdata(file);
	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
	struct mtk_cam_request_stream_data *stream_data;
	struct mtk_cam_request *cam_req;
	struct media_request *req;
	s32 fd;

	fd = s->request_fd;
	if (fd < 0)
		return -EINVAL;

	req = media_request_get_by_fd(&cam->media_dev, fd);

	/* .... */
 
	cam_req = to_mtk_cam_req(req);
	stream_data = &cam_req->stream_data[node->uid.pipe_id];
	stream_data->vdev_selection_update |= (1 << node->desc.id);
	stream_data->vdev_selection[node->desc.id] = *s;

	/* .... */

	media_request_put(req);

	return 0;
}

I posted interface change as RFC to discuss first and would like some
review comments.

Thank you very much.

  media: v4l2-core: extend the v4l2 format to support request
  media: subdev: support which in v4l2_subdev_frame_interval
  media: v4l2-ctrl: Add ISP Camsys user control
  media: pixfmt: Add ISP Camsys formats

 drivers/media/mc/mc-device.c         |   7 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 153 ++++++++++++++++++++++++++-
 include/media/media-entity.h         |   3 +
 include/uapi/linux/media.h           |   3 +-
 include/uapi/linux/v4l2-controls.h   |   4 +
 include/uapi/linux/v4l2-subdev.h     |   8 +-
 include/uapi/linux/videodev2.h       | 109 ++++++++++++++++++-
 7 files changed, 275 insertions(+), 12 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
