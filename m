Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30CAC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:46:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2250361057
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2250361057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GRGCOoyJgyt7uJezLJnArzriQ3p6jynh4DarU0pLQd0=; b=Y7bnnsGuSHbiPEacQuKDuaoEl
	hdVg5ZQ74osYjcafHvc7ghD8T7Vk6bantrLaF4fm586ZUIYc1r/khrUN+ltAEobP2qpm9FL4teaEz
	7Mm7zu/yZWFzfdfQEidpVzpEN0dmdNLlSLNn64ZW5DW9QzCquhnACQb6abgwAG/8RVSSqZtjvv4nD
	LamceknJeNjTxZfCcQ+UvHOpzdaSMKamAMNYYlXtN4IKGZQsS52hrtuj142G3XV4KdiHHpthcUoiZ
	avWhEZAvW6n3y/EAqA03j+lFD1ijQfASc0i4/j1KA5+qwKt+sMlgbprCvsILNdm9I+8CynOMgeVgb
	Wbu4G6rAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1levBx-006Q06-FH; Fri, 07 May 2021 07:46:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levBp-006Pxo-Rb; Fri, 07 May 2021 07:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=WwMYQ2IuiYVaDlQUEYh1u+hDNYgPvb8T4Zs2rw57VZw=; b=n4aD+tFxyo2ZJWtc9IXrUJ4VU3
 FsITtIp33sohNrI9xVq8/Sr/c8Eyu6Sw2hguCf9V46/MC/BeIoHAhIf3CNCGH+iXgD/mrxS+R0qF4
 9prS+Y0NliWNcWrf2LAzp3E6aPiahtXBx99smVeAu37hFm5AkTSHOkui1pRjyfm+uWXgnmGGun2Yp
 W1Jd00WHJ2fR46GbpwR7mIgyAKLrDBMriTyc4EeKd+/gLIdnqXHJpTcQVDogsqHGWGjPi1vKUGhrc
 19EJ3ZBEX3ZsAs1bhh5fRyyyROCDlS5sbFl/5CkKdbBTW659h8wN9bk5/VvlHC5NkXbyAciJkfUnI
 vE+xwzbg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levBm-006f9W-WF; Fri, 07 May 2021 07:46:24 +0000
X-UUID: 48893fd57db2479fae033508726af7a8-20210507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WwMYQ2IuiYVaDlQUEYh1u+hDNYgPvb8T4Zs2rw57VZw=; 
 b=Ugz0I89edS+cnnkVTk5k/CUCJ68A6hqQI5/SsuOl+Ma8nLFlKsnr2Kraa8Y3w5SbVvZg569WL3LlDnSucFyFtnGN66YPK5N98C50N0A+WI6m6exZ5pcXpJEdSv7aTq6+AAJgtz5OdsrUlHTScftrpnYlktimDDcrliLO/0CXpc0=;
X-UUID: 48893fd57db2479fae033508726af7a8-20210507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 497224842; Fri, 07 May 2021 00:46:14 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 00:46:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 15:46:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 15:46:11 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
 <arnd@arndb.de>, <louis.kuo@mediatek.com>, <sergey.senozhatsky@gmail.com>,
 <helen.koike@collabora.com>, <niklas.soderlund+renesas@ragnatech.se>,
 <yepeilin.cs@gmail.com>
CC: <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [RESENT PATCH V0 1/4] media: v4l2-core: extend the v4l2 format to
 support request
Date: Fri, 7 May 2021 15:46:01 +0800
Message-ID: <20210507074604.15079-2-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210507074604.15079-1-louis.kuo@mediatek.com>
References: <20210507074604.15079-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1590EAC639185F97FF7E7A490355A9923F682F90A2528AD627AE965E692FF2B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_004623_072701_F2B90D57 
X-CRM114-Status: GOOD (  17.27  )
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

This patch is to extend the related interface to support the request-based
operations. We added request fd to the parameters of MEDIA_IOC_SETUP_LINK,
VIDIOC_S_FMT, VIDIOC_SUBDEV_S_SELECTION, VIDIOC_SUBDEV_S_FMT.
The driver uses media_request_get_by_fd() to retrieve the media request and
save the pending change in it, so that we can apply the pending change in
req_queue() callback then.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 drivers/media/mc/mc-device.c         | 7 ++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
 include/media/media-entity.h         | 3 +++
 include/uapi/linux/media.h           | 3 ++-
 include/uapi/linux/v4l2-subdev.h     | 3 ++-
 include/uapi/linux/videodev2.h       | 8 ++++++--
 6 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 9e56d2ad6b94..f46ae4c38102 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -203,6 +203,7 @@ static long media_device_setup_link(struct media_device *mdev, void *arg)
 	struct media_link *link = NULL;
 	struct media_entity *source;
 	struct media_entity *sink;
+	int ret;
 
 	/* Find the source and sink entities and link.
 	 */
@@ -221,10 +222,14 @@ static long media_device_setup_link(struct media_device *mdev, void *arg)
 	if (link == NULL)
 		return -EINVAL;
 
+	link->request_fd = linkd->request_fd;
 	memset(linkd->reserved, 0, sizeof(linkd->reserved));
 
 	/* Setup the link on both entities. */
-	return __media_entity_setup_link(link, linkd->flags);
+	ret = __media_entity_setup_link(link, linkd->flags);
+	link->request_fd = 0;
+
+	return ret;
 }
 
 static long media_device_get_topology(struct media_device *mdev, void *arg)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2673f51aafa4..823ebd175f3a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1634,7 +1634,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (unlikely(!ops->vidioc_s_fmt_vid_cap_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
@@ -1665,7 +1665,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (unlikely(!ops->vidioc_s_fmt_vid_out_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
@@ -1736,7 +1736,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
@@ -1767,7 +1767,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (unlikely(!ops->vidioc_try_fmt_vid_out_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 09737b47881f..30ad665c4413 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -128,6 +128,8 @@ struct media_pipeline {
  *		link.
  * @flags:	Link flags, as defined in uapi/media.h (MEDIA_LNK_FL_*)
  * @is_backlink: Indicate if the link is a backlink.
+ * @request_fd: The media request triggered the media link change, it is only
+ *		meaningful in media_device_setup_link()
  */
 struct media_link {
 	struct media_gobj graph_obj;
@@ -145,6 +147,7 @@ struct media_link {
 	struct media_link *reverse;
 	unsigned long flags;
 	bool is_backlink;
+	int request_fd;
 };
 
 /**
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 200fa8462b90..a331f80afe2d 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -231,7 +231,8 @@ struct media_link_desc {
 	struct media_pad_desc source;
 	struct media_pad_desc sink;
 	__u32 flags;
-	__u32 reserved[2];
+	__s32 request_fd;
+	__u32 reserved[1];
 };
 
 struct media_links_enum {
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 658106f5b5dc..d6ffd5981c68 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -50,7 +50,8 @@ struct v4l2_subdev_format {
 	__u32 which;
 	__u32 pad;
 	struct v4l2_mbus_framefmt format;
-	__u32 reserved[8];
+	__s32 request_fd;
+	__u32 reserved[7];
 };
 
 /**
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 311a01cc5775..6641194b3fab 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1246,6 +1246,7 @@ struct v4l2_crop {
  *		defined in v4l2-common.h; V4L2_SEL_TGT_* .
  * @flags:	constraints flags, defined in v4l2-common.h; V4L2_SEL_FLAG_*.
  * @r:		coordinates of selection window
+ * @request_fd: fd of the request that trigger the set selection operation
  * @reserved:	for future use, rounds structure size to 64 bytes, set to zero
  *
  * Hardware may use multiple helper windows to process a video stream.
@@ -1257,7 +1258,8 @@ struct v4l2_selection {
 	__u32			target;
 	__u32                   flags;
 	struct v4l2_rect        r;
-	__u32                   reserved[9];
+	__s32			request_fd;
+	__u32                   reserved[8];
 };
 
 
@@ -2266,6 +2268,7 @@ struct v4l2_plane_pix_format {
  * @hsv_enc:		enum v4l2_hsv_encoding, HSV encoding
  * @quantization:	enum v4l2_quantization, colorspace quantization
  * @xfer_func:		enum v4l2_xfer_func, colorspace transfer function
+ * @request_fd:	fd of the request that trigger the set format operation
  * @reserved:		drivers and applications must zero this array
  */
 struct v4l2_pix_format_mplane {
@@ -2284,7 +2287,8 @@ struct v4l2_pix_format_mplane {
 	};
 	__u8				quantization;
 	__u8				xfer_func;
-	__u8				reserved[7];
+	__s32				request_fd;
+	__u8				reserved[3];
 } __attribute__ ((packed));
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
