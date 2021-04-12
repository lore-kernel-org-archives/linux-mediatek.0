Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A20EC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:47:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE7FE6109F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE7FE6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n6DDv1Y3hBpQYN4abO5PWwkUJeCUSS+BJ3lSfFJ+BdM=; b=Rw5qI/lPBpvEO5E/aqDjJOxhu
	Gz8fYmvcLgzNddwNy0SLo6M62yDBefVPrg0ZhnE/zV9mow/02lIBmIYXue5hPPg1gX6SvBEuMkc/g
	0Xj5T1aHwdHbGd44Qywwew9kuL+AxmMu+OZbWtUDHoEuxvGdVdYHifxjkjKjGOArgpyAs11oDjeN1
	B3W9uwL3e5iUE99dOmbayMo5llE6Oa/AkDVVtvFeiZcE3ELNG68mvK9UjStPdak/WcUafYWIgP6Zw
	cppqFBWFbEWHpRtWVWCxhfSM9c1Y4uc7y+CP0zB8n/+d+dCo47glYdjysfuaHR9Ri3+SxQR9QUccE
	QgJhJZJ6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVvyI-006jn6-N9; Mon, 12 Apr 2021 12:47:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvxU-006jZE-PP; Mon, 12 Apr 2021 12:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=GKB1Y30n/5Dh6tP5rg9zdm5RA/FlZOf7VuVIgnAzGfE=; b=i1x93/DspDJK1JwjLZnNBgnYTb
 PVjdJqFtNPfR6eRD33Rr+//8iZrngteIs5Q96j4C5NxG0qPBRSXiSJyCLe3OWFQlIecDwb+sA75Nm
 U13MyBNK1GmGRFU5F8hA+2xcv/D+UJtNwfakSlnqUrcsxT1BYWi5y7zrL6jxoqDahbZPUnpPL5Nmz
 xPz2/Cm5DcaPKm5NdPleEBwH0ZlwHIN/GtNDC77gJjqaSfJ8kXWbR4SIZcOPPhuxAhgJzq0eeNyVU
 MKNKaGrzWA6U0ncSHU8XoV1uTapoY61/M8V2RCYhYpJCQHaNPv8EW+o9SiLZS6Of+DzT/CULox0hm
 lvtlUNjQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvxR-006ET2-Sq; Mon, 12 Apr 2021 12:46:27 +0000
X-UUID: 7a1fcb9715f8439eaf4a5a642adaaa94-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GKB1Y30n/5Dh6tP5rg9zdm5RA/FlZOf7VuVIgnAzGfE=; 
 b=huCz25ilriHioGHA9mMuDc7MyEevNKQdEUpzl3dQWe+ZoaAzyDdlsU/ptl2q7oMqZqjmnLtwG2kdOk52XLM+z/DEaJYw2DRsik7TZg3HvFIgGhjnrAHYX3J9hYJXSG+c27/05GWvv63jsGyRo+EbJhBRqGbveE6tJ0wZxhTXcwk=;
X-UUID: 7a1fcb9715f8439eaf4a5a642adaaa94-20210412
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 735055619; Mon, 12 Apr 2021 05:46:23 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 05:46:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 20:46:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 20:46:17 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Tiffany Lin <tiffany.lin@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3,6/6] media: mtk-vcodec: Support MT8192 H264 4K encoding
Date: Mon, 12 Apr 2021 20:45:55 +0800
Message-ID: <20210412124555.26897-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210412124555.26897-1-irui.wang@mediatek.com>
References: <20210412124555.26897-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_054625_962450_056AEB21 
X-CRM114-Status: GOOD (  19.80  )
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

MT8192 H264 support 4k(3840x2176) and Level 5.1 encoding,
add related path according to enc_capability.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 75 ++++++++++++-------
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 +
 2 files changed, 54 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 42ff13867940..7396a5050b45 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -19,23 +19,32 @@
 
 #define MTK_VENC_MIN_W	160U
 #define MTK_VENC_MIN_H	128U
-#define MTK_VENC_MAX_W	1920U
-#define MTK_VENC_MAX_H	1088U
+#define MTK_VENC_HD_MAX_W	1920U
+#define MTK_VENC_HD_MAX_H	1088U
+#define MTK_VENC_4K_MAX_W	3840U
+#define MTK_VENC_4K_MAX_H	2176U
+
 #define DFT_CFG_WIDTH	MTK_VENC_MIN_W
 #define DFT_CFG_HEIGHT	MTK_VENC_MIN_H
 #define MTK_MAX_CTRLS_HINT	20
 
 #define MTK_DEFAULT_FRAMERATE_NUM 1001
 #define MTK_DEFAULT_FRAMERATE_DENOM 30000
+#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
 
 static void mtk_venc_worker(struct work_struct *work);
 
-static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
-	MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
-	MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16,
+static const struct v4l2_frmsize_stepwise mtk_venc_hd_framesizes = {
+	MTK_VENC_MIN_W, MTK_VENC_HD_MAX_W, 16,
+	MTK_VENC_MIN_H, MTK_VENC_HD_MAX_H, 16,
+};
+
+static const struct v4l2_frmsize_stepwise mtk_venc_4k_framesizes = {
+	MTK_VENC_MIN_W, MTK_VENC_4K_MAX_W, 16,
+	MTK_VENC_MIN_H, MTK_VENC_4K_MAX_H, 16,
 };
 
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_framesizes)
+#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_hd_framesizes)
 
 static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
 {
@@ -151,17 +160,20 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	const struct mtk_video_fmt *fmt;
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(fh);
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
 	fmt = mtk_venc_find_format(fsize->pixel_format,
-				   fh_to_ctx(fh)->dev->venc_pdata);
+				   ctx->dev->venc_pdata);
 	if (!fmt)
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise = mtk_venc_framesizes;
+	fsize->stepwise =
+		(ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
+		mtk_venc_4k_framesizes : mtk_venc_hd_framesizes;
 
 	return 0;
 }
@@ -248,7 +260,7 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
 /* V4L2 specification suggests the driver corrects the format struct if any of
  * the dimensions is unsupported
  */
-static int vidioc_try_fmt(struct v4l2_format *f,
+static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
 			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
@@ -260,13 +272,22 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		int tmp_w, tmp_h;
+		unsigned int max_width, max_height;
+
+		if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
+			max_width = MTK_VENC_4K_MAX_W;
+			max_height = MTK_VENC_4K_MAX_H;
+		} else {
+			max_width = MTK_VENC_HD_MAX_W;
+			max_height = MTK_VENC_HD_MAX_H;
+		}
 
 		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
 					MTK_VENC_MIN_H,
-					MTK_VENC_MAX_H);
+					max_height);
 		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
 					MTK_VENC_MIN_W,
-					MTK_VENC_MAX_W);
+					max_width);
 
 		/* find next closer width align 16, heign align 32, size align
 		 * 64 rectangle
@@ -275,16 +296,16 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		tmp_h = pix_fmt_mp->height;
 		v4l_bound_align_image(&pix_fmt_mp->width,
 					MTK_VENC_MIN_W,
-					MTK_VENC_MAX_W, 4,
+					max_width, 4,
 					&pix_fmt_mp->height,
 					MTK_VENC_MIN_H,
-					MTK_VENC_MAX_H, 5, 6);
+					max_height, 5, 6);
 
 		if (pix_fmt_mp->width < tmp_w &&
-			(pix_fmt_mp->width + 16) <= MTK_VENC_MAX_W)
+			(pix_fmt_mp->width + 16) <= max_width)
 			pix_fmt_mp->width += 16;
 		if (pix_fmt_mp->height < tmp_h &&
-			(pix_fmt_mp->height + 32) <= MTK_VENC_MAX_H)
+			(pix_fmt_mp->height + 32) <= max_height)
 			pix_fmt_mp->height += 32;
 
 		mtk_v4l2_debug(0,
@@ -405,7 +426,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	}
 
 	q_data->fmt = fmt;
-	ret = vidioc_try_fmt(f, q_data->fmt);
+	ret = vidioc_try_fmt(ctx, f, q_data->fmt);
 	if (ret)
 		return ret;
 
@@ -467,7 +488,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = fmt->fourcc;
 	}
 
-	ret = vidioc_try_fmt(f, fmt);
+	ret = vidioc_try_fmt(ctx, f, fmt);
 	if (ret)
 		return ret;
 
@@ -545,7 +566,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	f->fmt.pix_mp.quantization = ctx->quantization;
 	f->fmt.pix_mp.xfer_func = ctx->xfer_func;
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(ctx, f, fmt);
 }
 
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
@@ -567,7 +588,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(ctx, f, fmt);
 }
 
 static int vidioc_venc_g_selection(struct file *file, void *priv,
@@ -1171,16 +1192,16 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
 
 	v4l_bound_align_image(&q_data->coded_width,
 				MTK_VENC_MIN_W,
-				MTK_VENC_MAX_W, 4,
+				MTK_VENC_HD_MAX_W, 4,
 				&q_data->coded_height,
 				MTK_VENC_MIN_H,
-				MTK_VENC_MAX_H, 5, 6);
+				MTK_VENC_HD_MAX_H, 5, 6);
 
 	if (q_data->coded_width < DFT_CFG_WIDTH &&
-		(q_data->coded_width + 16) <= MTK_VENC_MAX_W)
+		(q_data->coded_width + 16) <= MTK_VENC_HD_MAX_W)
 		q_data->coded_width += 16;
 	if (q_data->coded_height < DFT_CFG_HEIGHT &&
-		(q_data->coded_height + 32) <= MTK_VENC_MAX_H)
+		(q_data->coded_height + 32) <= MTK_VENC_HD_MAX_H)
 		q_data->coded_height += 32;
 
 	q_data->sizeimage[0] =
@@ -1210,6 +1231,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 {
 	const struct v4l2_ctrl_ops *ops = &mtk_vcodec_enc_ctrl_ops;
 	struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
+	const u8 h264_max_level =
+		(ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
+		V4L2_MPEG_VIDEO_H264_LEVEL_5_1 : V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
 
 	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
 
@@ -1240,8 +1264,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 			0, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
 	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-			V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
-			0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+			       h264_max_level,
+			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+
 	if (handler->error) {
 		mtk_v4l2_err("Init control handler fail %d",
 				handler->error);
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index d0123dfc5f93..b6a4f2074fa5 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -215,6 +215,10 @@ static unsigned int h264_get_level(struct venc_h264_inst *inst,
 		return 41;
 	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
 		return 42;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 50;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		return 51;
 	default:
 		mtk_vcodec_debug(inst, "unsupported level %d", level);
 		return 31;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
