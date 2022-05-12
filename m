Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3AFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eu7o0uZlhYXCIFlZ7vzgi+oQky0YVnj6PLvfnxd4Axs=; b=0IXB5XymG3jVpl
	ZVRxm+otJSeE8VGuwQraI2AO0tivLP3w4v+hDHCUDIW1BskKmAxBIkfspMZ1Z49hD5yAZrCBAIGZl
	nbRmP8WcxBXwFRlAlo+e/k9YjtyvyEW2s2g2Mt610AflVkGSUkRzVaeVJPVME9nWDyqF7G9lUzeHd
	OG92cb0XawWUlQ+W3hXXqWYTVtuKnL79D/YrWJSlju4LnSoD5WZ15D2Svhm7XxfvQGLqRk+JK0uxh
	6fk3NRDxrojDaUPZb7RkpAA5/p41RS15B4+vYvoGFpliiwjhiEpg0f2LwGqrL3/azsXFQiVlf6OWx
	KzJGXKnNg1NcpoOZ1i5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyUO-009QQ7-6l; Thu, 12 May 2022 02:23:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyRj-009Oko-Ui; Thu, 12 May 2022 02:20:58 +0000
X-UUID: f8e531a2af484fa7bb5e25444ef7d2a7-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2310eef3-7e44-4dc0-adc9-38bbbe672144, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:96254125-b432-452e-9e03-2bf3148aed85,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f8e531a2af484fa7bb5e25444ef7d2a7-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 800304635; Wed, 11 May 2022 19:20:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:20:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 12 May 2022 10:20:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 10:20:02 +0800
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
Subject: [PATCH v12,
 07/17] media: mediatek: vcodec: Refactor supported vdec formats and
 framesizes
Date: Thu, 12 May 2022 10:19:40 +0800
Message-ID: <20220512021950.29087-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512021950.29087-1-yunfei.dong@mediatek.com>
References: <20220512021950.29087-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_192056_044477_3B14749D 
X-CRM114-Status: GOOD (  17.19  )
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

Supported output and capture format types for mt8192 are different
with mt8183. Redefine parameters to store them.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec.c |  8 ++++----
 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c       | 13 ++++++++-----
 .../mediatek/vcodec/mtk_vcodec_dec_stateless.c      | 13 +++++++------
 .../media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 13 +++++++++++--
 4 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index c1c3f439d7d1..1fb49a779c5d 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -26,7 +26,7 @@ mtk_vdec_find_format(struct v4l2_format *f,
 	const struct mtk_video_fmt *fmt;
 	unsigned int k;
 
-	for (k = 0; k < dec_pdata->num_formats; k++) {
+	for (k = 0; k < *dec_pdata->num_formats; k++) {
 		fmt = &dec_pdata->vdec_formats[k];
 		if (fmt->fourcc == f->fmt.pix_mp.pixelformat)
 			return fmt;
@@ -531,7 +531,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < dec_pdata->num_framesizes; ++i) {
+	for (i = 0; i < *dec_pdata->num_framesizes; ++i) {
 		if (fsize->pixel_format != dec_pdata->vdec_framesizes[i].fourcc)
 			continue;
 
@@ -563,7 +563,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
 
-	for (i = 0; i < dec_pdata->num_formats; i++) {
+	for (i = 0; i < *dec_pdata->num_formats; i++) {
 		if (output_queue &&
 		    dec_pdata->vdec_formats[i].type != MTK_FMT_DEC)
 			continue;
@@ -576,7 +576,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 		++j;
 	}
 
-	if (i == dec_pdata->num_formats)
+	if (i == *dec_pdata->num_formats)
 		return -EINVAL;
 
 	fmt = &dec_pdata->vdec_formats[i];
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
index e7fd39180123..9c7e6145cebb 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
@@ -37,7 +37,9 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
 	},
 };
 
-#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+static const unsigned int num_supported_formats =
+	ARRAY_SIZE(mtk_video_formats);
+
 #define DEFAULT_OUT_FMT_IDX 0
 #define DEFAULT_CAP_FMT_IDX 3
 
@@ -59,7 +61,8 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 	},
 };
 
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
+static const unsigned int num_supported_framesize =
+	ARRAY_SIZE(mtk_vdec_framesizes);
 
 /*
  * This function tries to clean all display buffers, the buffers will return
@@ -230,7 +233,7 @@ static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
 	unsigned int k;
 
 	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
-	for (k = 0; k < NUM_FORMATS; k++) {
+	for (k = 0; k < num_supported_formats; k++) {
 		fmt = &mtk_video_formats[k];
 		if (fmt->fourcc == pixelformat) {
 			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
@@ -612,11 +615,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
+	.num_formats = &num_supported_formats,
 	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
 	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_supported_framesize,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index c61df1f51185..0034b2ee9259 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -94,7 +94,8 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
 	},
 };
 
-#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+static const unsigned int num_supported_formats = ARRAY_SIZE(mtk_video_formats);
+
 #define DEFAULT_OUT_FMT_IDX    0
 #define DEFAULT_CAP_FMT_IDX    1
 
@@ -106,7 +107,7 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 	},
 };
 
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
+static const unsigned int num_supported_framesize = ARRAY_SIZE(mtk_vdec_framesizes);
 
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx, int error,
 					   struct media_request *src_buf_req)
@@ -362,11 +363,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
+	.num_formats = &num_supported_formats,
 	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
 	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_supported_framesize,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
@@ -382,11 +383,11 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
+	.num_formats = &num_supported_formats,
 	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
 	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_supported_framesize,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index c06463142182..d74a9e0e74fe 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -344,6 +344,15 @@ enum mtk_vdec_hw_arch {
 	MTK_VDEC_LAT_SINGLE_CORE,
 };
 
+/*
+ * struct mtk_vdec_format_types - Structure used to get supported
+ *		  format types according to decoder capability
+ */
+enum mtk_vdec_format_types {
+	MTK_VDEC_FORMAT_MM21 = 0x20,
+	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -380,12 +389,12 @@ struct mtk_vcodec_dec_pdata {
 	struct vb2_ops *vdec_vb2_ops;
 
 	const struct mtk_video_fmt *vdec_formats;
-	const int num_formats;
+	const int *num_formats;
 	const struct mtk_video_fmt *default_out_fmt;
 	const struct mtk_video_fmt *default_cap_fmt;
 
 	const struct mtk_codec_framesizes *vdec_framesizes;
-	const int num_framesizes;
+	const int *num_framesizes;
 
 	enum mtk_vdec_hw_arch hw_arch;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
