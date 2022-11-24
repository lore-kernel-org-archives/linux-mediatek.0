Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6E0C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VJaBIExdAv6TsWksxALoLuSNn786nXWSy1I7mA+OZU=; b=Imih2/+gj/cd8gzMI9+v1ChL58
	lg1QGjXAuA0zgKfYazzMtaNr9FIRtxY/XMYnvZPL3/tMJ3ID97qA8Ef76Q+OH8TD+FPnmGHvAfVmG
	wetAbloqGR9Y9yjqJHYz7DWHy94T72V+sDA5bZLwgxdAMTw+wv3iDZbEODS0EKSslXIyxQVOz95kg
	f+7/mbAc6wcTO4W49usb8NpCXXKOZX6WNFnZxNWtu2/glsG+h65X5YIbIIm98H/WgqU6MkkF34iL5
	vpGdKPZqBKZXotn03LbiY8q8egedaoQ2UefTlbp+qVTyNuniFFPKEcsqFKQMVitkYcdsA0EQOJsCK
	NIwjhG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyC9e-008hzW-9M; Thu, 24 Nov 2022 13:20:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyC02-008dTO-7H
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 13:10:43 +0000
X-UUID: 3857531395fd46edaa5ea211a6f0a2f8-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5VJaBIExdAv6TsWksxALoLuSNn786nXWSy1I7mA+OZU=;
	b=AbXPAAJ8yInNs6Q68IeAGqj1wC3tyZrNCIRn4vcHPP69/Ver4uuRHqrwjCtsTQ1VhMbptxXzf2oQnusH14wNeOAJcSqOzcoZ2GW2WK34YNLfcr5Mu25FMCxdX9qEDA301dUrN9ePXpGZqYsJ0Hgp/YtjghFq94Q1s/V4/dmT0R4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:8bbe8ab0-9bee-40a5-b957-7084bf68a867,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:7ef025dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3857531395fd46edaa5ea211a6f0a2f8-20221124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 433881346; Thu, 24 Nov 2022 06:10:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 24 Nov 2022 20:39:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 20:39:02 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v4 5/9] media: platform: mtk-mdp3: chip config split about resolution limitations
Date: Thu, 24 Nov 2022 20:38:55 +0800
Message-ID: <20221124123859.24395-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221124123859.24395-1-moudy.ho@mediatek.com>
References: <20221124123859.24395-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_051042_288694_75965774 
X-CRM114-Status: GOOD (  14.35  )
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
moved and integrated into the chip configuration header file.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   | 19 +++++++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  5 +++--
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    | 21 +------------------
 5 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
index 1be9cc55b9b5..c541176780aa 100644
--- a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
+++ b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
@@ -380,4 +380,23 @@ static const struct mdp_format mt8183_formats[] = {
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
 #endif  /* __MDP3_PLAT_MT8183_H__ */
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index ce18cbf70e96..4b02c135b631 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -26,6 +26,7 @@ static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.comp_data_len = ARRAY_SIZE(mt8183_mdp_comp_data),
 	.format = mt8183_formats,
 	.format_len = ARRAY_SIZE(mt8183_formats),
+	.def_limit = &mt8183_mdp_def_limit,
 };
 
 static const struct of_device_id mdp_of_ids[] = {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 982438a9ab02..52f87e59ba9e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -59,6 +59,7 @@ struct mtk_mdp_driver_data {
 	unsigned int comp_data_len;
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
index cd6afbf53797..bb833ae27531 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
@@ -11,25 +11,6 @@
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
@@ -485,7 +466,7 @@ int mdp_frameparam_init(struct mdp_dev *mdp, struct mdp_frameparam *param)
 		return -EINVAL;
 
 	INIT_LIST_HEAD(&param->list);
-	param->limit = &mdp_def_limit;
+	param->limit = mdp->mdp_data->def_limit;
 	param->type = MDP_STREAM_TYPE_BITBLT;
 
 	frame = &param->output;
-- 
2.18.0


