Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB2606A321
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yEazv2LZ;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=NF1T6Bsk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u04SRyNcqVFW8YXYCrjpPkRGRSi9BWWTbi+e83j+9Ng=; b=yEazv2LZk+jFeZn5gRhWG4kf52
	u6yxRnbP8hw5SVHzMk+do3tZfJ/s64r1nVe8xgKz7j9tnagNg3CfMAXhaJgEDf4+EqFighruSKvKJ
	fq4DkJuddlrA1eAxVUTl1JmrzitCVb6uDoBUHo7sozWpxoorNrtxEwHqmtDLc3PCTYfaRupBdKL+d
	Xk9KEy7A7bObIiRuhmck8OBlWFtP6F+PahDIWbK/kPAAcoWnvPSJQGCNiP711SMNuGIb4h/8UgBrr
	yUrYU65cksOHDZvPay7R9sdjwncvxlbNxz3OyiWNr5sYqBQgCSTJBk48w9m2qdrwl2ERMaLk+pJ3c
	ZzWCbhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF54-00000000dLd-0G84;
	Sat, 28 Nov 2026 09:50:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF4h-00000000d5T-1Jpn;
	Sat, 28 Nov 2026 09:50:36 +0000
X-UUID: 222cd83eeb1111f1a170bf5142e12a73-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u04SRyNcqVFW8YXYCrjpPkRGRSi9BWWTbi+e83j+9Ng=;
	b=NF1T6Bskgy5dHZdfJzt3QmX1USfY9116Y10K6GFxxz+oE6Sg+M2lb7PVsiPJARd+qj6OA+LyV7Qfug025XJZAy7NZeFN7bl9+CQZmWf7UXCn0oA6mX3KRdq2pmQSeTYEyzPMwqjJbh8hLKM68dxTTDf4W7zCglEGv9tRsD7Ck+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f2418b62-d634-4330-9978-597b4dcba313,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:7ce07531-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 222cd83eeb1111f1a170bf5142e12a73-20261128
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 704089844; Sat, 28 Nov 2026 02:50:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 17:50:21 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 17:50:20 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v13 04/10] media: mediatek: vcodec: Refactor Decoder profile & level Handling
Date: Sat, 28 Nov 2026 17:50:08 +0800
Message-ID: <20261128095014.3128536-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
References: <20261128095014.3128536-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_015032_240978_AF9C5390 
X-CRM114-Status: GOOD (  14.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This commit refactors the handling of decoder parameters for H264,
H265, and VP9 codecs by introducing a new structure to standardize
supported level and profile information. By leveraging this change,
chipset-specific conditional logic in the codec configuration
functions is significantly reduced.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  16 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  12 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 165 ++++++++++--------
 3 files changed, 118 insertions(+), 75 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index d7ed7bfe7..bbfa6954d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -78,6 +78,16 @@ struct vdec_pic_info {
 	unsigned int reserved;
 };
 
+/**
+ * struct mtk_vcodec_dec_params - decoder supported parameters
+ * @level: decoder supported vcodec level
+ * @profile: decoder supported vcodec profile
+ */
+struct mtk_vcodec_dec_params {
+	s64 level;
+	s64 profile;
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -100,6 +110,9 @@ struct vdec_pic_info {
  * @fw_type: firmware type (VPU, SCP, or VCP)
  * @fw_init: firmware-specific initialization callback
  * @chip_model: platforms configuration values
+ * @h264_params: H264 decoder default supported params
+ * @h265_params: H265 decoder default supported params
+ * @vp9_params: VP9 decoder default supported params
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -125,6 +138,9 @@ struct mtk_vcodec_dec_pdata {
 	struct mtk_vcodec_fw *(*fw_init)(void *priv,
 					 enum mtk_vcodec_fw_use fw_use);
 	unsigned int chip_model;
+	struct mtk_vcodec_dec_params h264_params;
+	struct mtk_vcodec_dec_params h265_params;
+	struct mtk_vcodec_dec_params vp9_params;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index e7ae90e82..bf3569e6b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -621,4 +621,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.fw_type = VPU,
 	.fw_init = mtk_vcodec_fw_vpu_init,
 	.chip_model = 8173,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 2a03395ab..5f2797971 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -571,106 +571,49 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
-		break;
-	case 8183:
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
-		break;
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.level;
 }
 
 static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 					    struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.profile;
 }
 
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
@@ -938,6 +881,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8183,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -979,6 +934,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8188,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
@@ -987,6 +954,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8192,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
@@ -995,6 +974,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8195,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
@@ -1003,6 +994,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	.fw_type = VCP,
 	.fw_init = mtk_vcodec_fw_vcp_init,
 	.chip_model = 8196,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
@@ -1028,4 +1031,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	.fw_type = SCP,
 	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8186,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
-- 
2.51.0.windows.2


