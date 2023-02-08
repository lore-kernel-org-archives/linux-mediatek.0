Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46ABC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcTvjoD7/0jp3q0955kMTdAtMIA6h+mB3n4BhrQzLG4=; b=Jga/P2n3lRKyzzN5hosPMcfJz7
	EC9ZnxXwoKyb1sWMwuv3bbPJjsj2aqh1TW/fX9rTcOljuBqwX5jlyYmObbJI2XVgwHRYn4Y+H0s2n
	qXeIo3E4itcDO75Qg9iifp8KgRfmYcG20pCL+oClBG2wYFCWNdQLKpJ6+E55dWfaBC2Lm3Mb2yDm1
	TLIZ7qNlXmD7p/ItX0wvXVmlh8yS0j4XgB5A0XTwNa0HzWF9HHalz1w4/SmTw6AtirQ8bioAL1ORo
	Xo5kd+Sn+b8wBiUgnMjzHClOoQTb4BR62jVyjcoxCbwPVNGFonPGojXvCIgevB5ICLRrJoqy+D1HE
	Qr+yeuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgT8-00Ehx4-ES; Wed, 08 Feb 2023 09:10:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgRw-00EhFR-QL; Wed, 08 Feb 2023 09:09:13 +0000
X-UUID: 3a240836a79011edbbe3f76fe852e059-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mcTvjoD7/0jp3q0955kMTdAtMIA6h+mB3n4BhrQzLG4=;
	b=UO/5Yg5yqQyT/bR74vZho3F92L9JRyL1a+m2l+no+6ZmgmZRrbOHa3LiiFSIBkpMXfRAgtHu8jyFG2zI5lF2evKFZTFZOqyz8UyUKRDbp/QaOO4paTQR1eKYHQj7r2gOfATrhGEG46gST5ERERzaMIi/yzcVPVQTwFZO/+slZ4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:50bcb846-fd98-4428-9736-322a809892e8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:885ddb2,CLOUDID:6d21458e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 3a240836a79011edbbe3f76fe852e059-20230208
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 871526596; Wed, 08 Feb 2023 02:09:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Feb 2023 17:08:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 17:08:57 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ping-Hsun
 Wu <ping-hsun.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 06/12] media: platform: mtk-mdp3: chip config split about resolution limitations
Date: Wed, 8 Feb 2023 17:08:49 +0800
Message-ID: <20230208090855.18934-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230208090855.18934-1-moudy.ho@mediatek.com>
References: <20230208090855.18934-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_010908_906222_0F1695AA 
X-CRM114-Status: GOOD (  15.48  )
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

Due to differences in hardware design, the supported max and min
resolutions and scaling capabilities will vary, and should be
integrated into specific config file.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mdp_cfg_data.c     | 20 ++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  5 +++--
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    | 21 +------------------
 4 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
index 92e45bd72705..6fb8fd6f0bb1 100644
--- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -381,6 +381,25 @@ static const struct mdp_format mt8183_formats[] = {
 	}
 };
 
+static const struct mdp_limit mt8183_mdp_def_limit = {
+	.out_limit = {
+		.wmin	= 16,
+		.hmin	= 16,
+		.wmax	= 8176,
+		.hmax	= 8176,
+	},
+	.cap_limit = {
+		.wmin	= 2,
+		.hmin	= 2,
+		.wmax	= 8176,
+		.hmax	= 8176,
+	},
+	.h_scale_up_max = 32,
+	.v_scale_up_max = 32,
+	.h_scale_down_max = 20,
+	.v_scale_down_max = 128,
+};
+
 const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_probe_infra = mt8183_mdp_probe_infra,
 	.mdp_cfg = &mt8183_plat_cfg,
@@ -390,6 +409,7 @@ const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_sub_comp_dt_ids = mt8183_sub_comp_dt_ids,
 	.format = mt8183_formats,
 	.format_len = ARRAY_SIZE(mt8183_formats),
+	.def_limit = &mt8183_mdp_def_limit,
 };
 
 s32 mdp_cfg_get_id_inner(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id)
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 327da00dd1fc..a312c1007e96 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -59,6 +59,7 @@ struct mtk_mdp_driver_data {
 	const struct of_device_id *mdp_sub_comp_dt_ids;
 	const struct mdp_format *format;
 	unsigned int format_len;
+	const struct mdp_limit *def_limit;
 };
 
 struct mdp_dev {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 7c14679ffd78..eba181fa50ad 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -558,6 +558,7 @@ static int mdp_m2m_open(struct file *file)
 	struct device *dev = &mdp->pdev->dev;
 	int ret;
 	struct v4l2_format default_format = {};
+	const struct mdp_limit *limit = mdp->mdp_data->def_limit;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -601,8 +602,8 @@ static int mdp_m2m_open(struct file *file)
 
 	/* Default format */
 	default_format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	default_format.fmt.pix_mp.width = 32;
-	default_format.fmt.pix_mp.height = 32;
+	default_format.fmt.pix_mp.width = limit->out_limit.wmin;
+	default_format.fmt.pix_mp.height = limit->out_limit.hmin;
 	default_format.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420M;
 	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
 	default_format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
index c6fecb089687..9b436b911d92 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
@@ -12,25 +12,6 @@
 #include "mtk-mdp3-regs.h"
 #include "mtk-mdp3-m2m.h"
 
-static const struct mdp_limit mdp_def_limit = {
-	.out_limit = {
-		.wmin	= 16,
-		.hmin	= 16,
-		.wmax	= 8176,
-		.hmax	= 8176,
-	},
-	.cap_limit = {
-		.wmin	= 2,
-		.hmin	= 2,
-		.wmax	= 8176,
-		.hmax	= 8176,
-	},
-	.h_scale_up_max = 32,
-	.v_scale_up_max = 32,
-	.h_scale_down_max = 20,
-	.v_scale_down_max = 128,
-};
-
 static const struct mdp_format *mdp_find_fmt(const struct mtk_mdp_driver_data *mdp_data,
 					     u32 pixelformat, u32 type)
 {
@@ -487,7 +468,7 @@ int mdp_frameparam_init(struct mdp_dev *mdp, struct mdp_frameparam *param)
 		return -EINVAL;
 
 	INIT_LIST_HEAD(&param->list);
-	param->limit = &mdp_def_limit;
+	param->limit = mdp->mdp_data->def_limit;
 	param->type = MDP_STREAM_TYPE_BITBLT;
 
 	frame = &param->output;
-- 
2.18.0


