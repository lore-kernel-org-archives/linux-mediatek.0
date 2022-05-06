Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JES4VbzZszHDifzKLs+mqR5HJvMZfOy0RiTaq3I+ric=; b=D3QdKM4sRN/Hea
	9tmDKmcsnEqqTYDFPi5vQYaslId5jGW77b8xPDB5kinDy7yfc4A5+JFUKwzklA3UFt9KLgJNmpFFk
	/kzCTKWTGoXhSAq+GxiAIkdeK3XGsR9W6LlcM+VqT/X24aF85XI9RaGnnp5v2SvsWPbVozyLYDeMe
	mU+rEz9sVNjfU322ITpUoTK3STNC86ZRDtJhqVmMH1P1gUL9wjUMXGcAC9h9wlZV1sNqqGnYmz2zm
	qszOe0iHjPmIRndDAZrxWEMSCosgBpjSqsiRwWr6fcpp5lbbacZ8jQrYJzU75kC77cU7ZB810E4wW
	DdzbnueLd8Fyz8AdevIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmuPH-002Q6V-1F; Fri, 06 May 2022 09:37:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmuKs-002Nb5-HM; Fri, 06 May 2022 09:33:21 +0000
X-UUID: 4619c912633e4a03a7b762a46dcc4d5f-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:dd5e035d-9b2d-4bd6-b5bd-f3c52c0bc958, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c2395cfd-e8ba-4988-a28f-dc105bbdc74f,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4619c912633e4a03a7b762a46dcc4d5f-20220506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 439897550; Fri, 06 May 2022 02:33:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 02:29:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 17:29:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 17:29:02 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11, 04/17] media: mediatek: vcodec: Read max resolution from
 dec_capability
Date: Fri, 6 May 2022 17:28:42 +0800
Message-ID: <20220506092855.22940-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506092855.22940-1-yunfei.dong@mediatek.com>
References: <20220506092855.22940-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_023318_627180_EFCCC81C 
X-CRM114-Status: GOOD (  14.71  )
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

Supported max resolution for different platforms are not the same: 2K
or 4K, getting it according to dec_capability.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 44 ++++++++++---------
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  4 ++
 2 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 130ecef2e766..e42d5c17d90e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -152,13 +152,15 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	q_data->coded_height = DFT_CFG_HEIGHT;
 	q_data->fmt = ctx->dev->vdec_pdata->default_cap_fmt;
 	q_data->field = V4L2_FIELD_NONE;
+	ctx->max_width = MTK_VDEC_MAX_W;
+	ctx->max_height = MTK_VDEC_MAX_H;
 
 	v4l_bound_align_image(&q_data->coded_width,
 				MTK_VDEC_MIN_W,
-				MTK_VDEC_MAX_W, 4,
+				ctx->max_width, 4,
 				&q_data->coded_height,
 				MTK_VDEC_MIN_H,
-				MTK_VDEC_MAX_H, 5, 6);
+				ctx->max_height, 5, 6);
 
 	q_data->sizeimage[0] = q_data->coded_width * q_data->coded_height;
 	q_data->bytesperline[0] = q_data->coded_width;
@@ -217,7 +219,7 @@ static int vidioc_vdec_subscribe_evt(struct v4l2_fh *fh,
 	}
 }
 
-static int vidioc_try_fmt(struct v4l2_format *f,
+static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
 			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
@@ -225,9 +227,9 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
 	pix_fmt_mp->width =
-		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, MTK_VDEC_MAX_W);
+		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, ctx->max_width);
 	pix_fmt_mp->height =
-		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, MTK_VDEC_MAX_H);
+		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, ctx->max_height);
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
@@ -245,16 +247,16 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		tmp_h = pix_fmt_mp->height;
 		v4l_bound_align_image(&pix_fmt_mp->width,
 					MTK_VDEC_MIN_W,
-					MTK_VDEC_MAX_W, 6,
+					ctx->max_width, 6,
 					&pix_fmt_mp->height,
 					MTK_VDEC_MIN_H,
-					MTK_VDEC_MAX_H, 6, 9);
+					ctx->max_height, 6, 9);
 
 		if (pix_fmt_mp->width < tmp_w &&
-			(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
+			(pix_fmt_mp->width + 64) <= ctx->max_width)
 			pix_fmt_mp->width += 64;
 		if (pix_fmt_mp->height < tmp_h &&
-			(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
+			(pix_fmt_mp->height + 64) <= ctx->max_height)
 			pix_fmt_mp->height += 64;
 
 		mtk_v4l2_debug(0,
@@ -294,7 +296,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 		fmt = mtk_vdec_find_format(f, dec_pdata);
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(ctx, f, fmt);
 }
 
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
@@ -317,7 +319,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(ctx, f, fmt);
 }
 
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
@@ -444,8 +446,14 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (fmt == NULL)
 		return -EINVAL;
 
+	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)) {
+		mtk_v4l2_debug(3, "4K is enabled");
+		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
+		ctx->max_height = VCODEC_DEC_4K_CODED_HEIGHT;
+	}
+
 	q_data->fmt = fmt;
-	vidioc_try_fmt(f, q_data->fmt);
+	vidioc_try_fmt(ctx, f, q_data->fmt);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		q_data->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
 		q_data->coded_width = pix_mp->width;
@@ -529,14 +537,9 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
-		if (!(ctx->dev->dec_capability &
-				VCODEC_CAPABILITY_4K_DISABLED)) {
-			mtk_v4l2_debug(3, "4K is enabled");
-			fsize->stepwise.max_width =
-					VCODEC_DEC_4K_CODED_WIDTH;
-			fsize->stepwise.max_height =
-					VCODEC_DEC_4K_CODED_HEIGHT;
-		}
+
+		fsize->stepwise.max_width = ctx->max_width;
+		fsize->stepwise.max_height = ctx->max_height;
 		mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
 				ctx->dev->dec_capability,
 				fsize->stepwise.min_width,
@@ -545,6 +548,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 				fsize->stepwise.min_height,
 				fsize->stepwise.max_height,
 				fsize->stepwise.step_height);
+
 		return 0;
 	}
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index bb7b8e914d24..6d27e4d41ede 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -284,6 +284,8 @@ struct vdec_pic_info {
  *	  mtk_video_dec_buf.
  * @hw_id: hardware index used to identify different hardware.
  *
+ * @max_width: hardware supported max width
+ * @max_height: hardware supported max height
  * @msg_queue: msg queue used to store lat buffer information.
  */
 struct mtk_vcodec_ctx {
@@ -329,6 +331,8 @@ struct mtk_vcodec_ctx {
 	struct mutex lock;
 	int hw_id;
 
+	unsigned int max_width;
+	unsigned int max_height;
 	struct vdec_msg_queue msg_queue;
 };
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
