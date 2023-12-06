Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1032C10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkKb5yQu6eO4lpu8D+KYAkmtnU9wVZAoaiHbbjuUHtM=; b=Q6c/XkVk8bTovXTJuSyYhFLO8t
	PkAwGxoL9ya/MxtMeFbkV/4/hp45RbDO8ZiCz6vxKkpf4E9BwwO41Hy0TA9iNCv5H9EICg0oeKOjz
	aDudDKT6HLuP8iPd3cofY01kG8c7ZJzlybrAAmMJKcSQmPa4XXpFk/IvB8GqNxlC1u5hJyo8ceZVX
	2ghQfOEWY0Mvveip0Rei8ZakGQWN4Fr+NeIGMBBsVAzEr3mtvpkBkniBJCNC5Lv/fIHwHlxBoaPFO
	G/bx5mFmt5PILGiAEIaFeX4C4HiYzA1yrFDvWsuG4PZzn7Wfjbxw40fs1z6cwe6zW8YLYutyOvD6Q
	lSbOOkbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAn4w-009Nrd-25;
	Wed, 06 Dec 2023 08:16:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAn4o-009Nfg-1A;
	Wed, 06 Dec 2023 08:16:19 +0000
X-UUID: b7671330940f11ee958cff29c719f35b-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fkKb5yQu6eO4lpu8D+KYAkmtnU9wVZAoaiHbbjuUHtM=;
	b=nLsq66PVRaWr2fSoiq+WhRgjwDW/rCwuZlwIs5JLYggoaTzVhLQwjADw2bVPm9YPggr8dyI7dkWziTzXUoLtKiH9f8xuDSyUrB7rFT67CJ3ejRTZE97QdI0HuLuSrHb/GynFDsCLDUDlKq6q6t0AJZk20kUFccye8rgpYnKM/X8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:9a533353-fee0-4940-a317-2e8136cc962b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:abefa75,CLOUDID:f7863596-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b7671330940f11ee958cff29c719f35b-20231206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1975730792; Wed, 06 Dec 2023 01:16:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:16:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:16:06 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,21/21] media: mediatek: vcodec: move vdec init interface to setup callback
Date: Wed, 6 Dec 2023 16:15:38 +0800
Message-ID: <20231206081538.17056-22-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.356300-8.000000
X-TMASE-MatchedRID: EDRXIQlfXt//ybP4IWJkikKcYi5Qw/RVFpw9gj8mywrfUZT83lbkENro
	EGQiudNyiYTHezvcK04K3OrJWcpBViwmW5mXIeVjzfqlpbtmcWi50iD18ixmy/gnJH5vm2+gZ2X
	jE62VgUUxZUOt0FF52sKXwA+sRKv1Gj8XjDB40G5Na4UOfkJSNH0tCKdnhB589yM15V5aWpj6C0
	ePs7A07fhmFHnZFzVqMy6bDKK4NkHdcJT5YYQWyMMV4WK4hhsonPk1U1ip1fFxAqP9WRFBCYAqt
	ckHv8VFsP9RRQG7ErZPWfegSDaC08hohL0hluIT8jae4OD13tAV7Mc+rowcVKtX/F0pBwVJjSV5
	hDFby7ZnIxZyJs78kg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.356300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3A487E5DD73C21F27353616BBD3FB3362469D0F8B1A852A975DAB46E5A1DDCBF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_001614_426319_BE072DBC 
X-CRM114-Status: GOOD (  16.17  )
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

Getting secure video playback (svp) flag when request output buffer, then
calling init interface to init svp parameters in optee-os.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 144 ++++++++++++------
 1 file changed, 94 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index ab922e8d2d37..3639beac20cb 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -184,6 +184,74 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_dec_ctx *ctx)
 	q_data->bytesperline[1] = q_data->coded_width;
 }
 
+static int mtk_vcodec_dec_init_pic_info(struct mtk_vcodec_dec_ctx *ctx, enum v4l2_buf_type type)
+{
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
+	struct mtk_q_data *q_data;
+	int ret;
+
+	if (!ctx->current_codec)
+		return 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(type) && ctx->state == MTK_STATE_FREE) {
+		q_data = mtk_vdec_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!q_data)
+			return -EINVAL;
+
+		ret = vdec_if_init(ctx, q_data->fmt->fourcc);
+		if (ret) {
+			mtk_v4l2_vdec_err(ctx, "[%d]: vdec_if_init() fail ret=%d",
+					  ctx->id, ret);
+			return -EINVAL;
+		}
+		ctx->state = MTK_STATE_INIT;
+	}
+
+	if (!dec_pdata->uses_stateless_api)
+		return 0;
+
+	/*
+	 * If get pic info fail, need to use the default pic info params, or
+	 * v4l2-compliance will fail
+	 */
+	ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
+	if (ret) {
+		mtk_v4l2_vdec_err(ctx, "[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
+				  ctx->id);
+	}
+
+	ctx->last_decoded_picinfo = ctx->picinfo;
+
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1) {
+		ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
+			ctx->picinfo.fb_sz[0] +
+			ctx->picinfo.fb_sz[1];
+		ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
+			ctx->picinfo.buf_w;
+	} else {
+		if (ctx->is_secure_playback)
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
+				ctx->picinfo.fb_sz[0] + ctx->picinfo.fb_sz[1];
+		else
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] = ctx->picinfo.fb_sz[0];
+
+		ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] = ctx->picinfo.buf_w;
+		ctx->q_data[MTK_Q_DATA_DST].sizeimage[1] = ctx->picinfo.fb_sz[1];
+		ctx->q_data[MTK_Q_DATA_DST].bytesperline[1] = ctx->picinfo.buf_w;
+	}
+
+	ctx->q_data[MTK_Q_DATA_DST].coded_width = ctx->picinfo.buf_w;
+	ctx->q_data[MTK_Q_DATA_DST].coded_height = ctx->picinfo.buf_h;
+	mtk_v4l2_vdec_dbg(2, ctx,
+			  "[%d] init() plane:%d wxh=%dx%d pic wxh=%dx%d sz=0x%x_0x%x",
+			  ctx->id, q_data->fmt->num_planes,
+			  ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+			  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			  ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
+			  ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
+	return 0;
+}
+
 static int vidioc_vdec_qbuf(struct file *file, void *priv,
 			    struct v4l2_buffer *buf)
 {
@@ -479,17 +547,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->ycbcr_enc = pix_mp->ycbcr_enc;
 		ctx->quantization = pix_mp->quantization;
 		ctx->xfer_func = pix_mp->xfer_func;
-
 		ctx->current_codec = fmt->fourcc;
-		if (ctx->state == MTK_STATE_FREE) {
-			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
-			if (ret) {
-				mtk_v4l2_vdec_err(ctx, "[%d]: vdec_if_init() fail ret=%d",
-						  ctx->id, ret);
-				return -EINVAL;
-			}
-			ctx->state = MTK_STATE_INIT;
-		}
 	} else {
 		ctx->capture_fourcc = fmt->fourcc;
 	}
@@ -502,46 +560,11 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->picinfo.pic_w = pix_mp->width;
 		ctx->picinfo.pic_h = pix_mp->height;
 
-		/*
-		 * If get pic info fail, need to use the default pic info params, or
-		 * v4l2-compliance will fail
-		 */
-		ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
-		if (ret) {
-			mtk_v4l2_vdec_err(ctx, "[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
-					  ctx->id);
-		}
-
-		ctx->last_decoded_picinfo = ctx->picinfo;
-
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1) {
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
-				ctx->picinfo.fb_sz[0] +
-				ctx->picinfo.fb_sz[1];
-			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
-				ctx->picinfo.buf_w;
-		} else {
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
-				ctx->picinfo.fb_sz[0];
-			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
-				ctx->picinfo.buf_w;
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1] =
-				ctx->picinfo.fb_sz[1];
-			ctx->q_data[MTK_Q_DATA_DST].bytesperline[1] =
-				ctx->picinfo.buf_w;
-		}
-
-		ctx->q_data[MTK_Q_DATA_DST].coded_width = ctx->picinfo.buf_w;
-		ctx->q_data[MTK_Q_DATA_DST].coded_height = ctx->picinfo.buf_h;
-		mtk_v4l2_vdec_dbg(2, ctx,
-				  "[%d] init() plane:%d wxh=%dx%d pic wxh=%dx%d sz=0x%x_0x%x",
-				  ctx->id, pix_mp->num_planes,
-				  ctx->picinfo.buf_w, ctx->picinfo.buf_h,
-				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-				  ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
-				  ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
+		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			ret = mtk_vcodec_dec_init_pic_info(ctx, f->type);
 	}
-	return 0;
+
+	return ret;
 }
 
 static int vidioc_enum_framesizes(struct file *file, void *priv,
@@ -722,7 +745,7 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 {
 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vq);
 	struct mtk_q_data *q_data;
-	unsigned int i;
+	unsigned int i, ret;
 
 	q_data = mtk_vdec_get_q_data(ctx, vq->type);
 
@@ -731,6 +754,25 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		return -EINVAL;
 	}
 
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		ret = mtk_vcodec_dec_init_pic_info(ctx, vq->type);
+		if (ret) {
+			mtk_v4l2_vdec_err(ctx, "Failed to init picture information");
+			return ret;
+		}
+
+		if (vq->secure_mem && !ctx->is_secure_playback) {
+			ret = mtk_vcodec_dec_optee_open(ctx->dev->optee_private);
+			if (ret) {
+				mtk_v4l2_vdec_err(ctx, "Failed to open decoder optee os");
+				return ret;
+			}
+			ctx->is_secure_playback = vq->secure_mem;
+			mtk_v4l2_vdec_dbg(1, ctx, "Getting secure decoder mode:%d",
+					  ctx->is_secure_playback);
+		}
+	}
+
 	if (*nplanes) {
 		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 			if (*nplanes != q_data->fmt->num_planes)
@@ -980,6 +1022,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->lock		= &ctx->dev->dev_mutex;
 	src_vq->dev             = &ctx->dev->plat_dev->dev;
 	src_vq->allow_cache_hints = 1;
+	src_vq->allow_secure_mem = 1;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret) {
@@ -996,6 +1039,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->lock		= &ctx->dev->dev_mutex;
 	dst_vq->dev             = &ctx->dev->plat_dev->dev;
 	dst_vq->allow_cache_hints = 1;
+	dst_vq->allow_secure_mem = 1;
 
 	ret = vb2_queue_init(dst_vq);
 	if (ret)
-- 
2.18.0


