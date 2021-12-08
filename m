Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA83FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 03:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZC6g5e/puLuyOo6qzs9BctHX4B1OtYgp/ByELn/Z2dA=; b=dVZJLHVb/xrYGU
	zMvpWIS3ddFG5lQkqq4JvwAndwic544uvIiBq4t7dYHhtlEMRi+evf0BoGP18YGWCMp0/N3cVNog5
	/0O3B2h/scfiYVAe7sZzutgvFTskfvxUzejsRGrtTkPTcyQh6QGYoIqzUUm9aYBMh24v8uwtsGu3T
	aJm4K8jYZ5r7ykAXpKZiOB46tsCj9F0Fl6J30IBt/l1e9qjz+iYnqBZq4kI/jPiPJCH1eU6lKAK3p
	VNkMJT8//ZiQlBrnbXfsBzdBQlynFjyJ3gOmB9dIyP84oV/RIIkrVC+Gw0op/aAYiHXxaHjmouSng
	7Bus+LQoirEfhOOCuaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1munKy-00Ass0-Uq; Wed, 08 Dec 2021 03:09:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mun6N-00Amvb-3k; Wed, 08 Dec 2021 02:54:41 +0000
X-UUID: d965c415a2674bfca21eb06f43c9961f-20211207
X-UUID: d965c415a2674bfca21eb06f43c9961f-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2013690484; Tue, 07 Dec 2021 19:54:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 18:44:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 8 Dec 2021 10:44:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 10:44:29 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v10 08/22] soc: mediatek: mmsys: modify reset controller for
 MT8195 vdosys1
Date: Wed, 8 Dec 2021 10:44:12 +0800
Message-ID: <20211208024426.15595-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211208024426.15595-1-nancy.lin@mediatek.com>
References: <20211208024426.15595-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_185439_238411_DDF4E583 
X-CRM114-Status: GOOD (  15.99  )
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

MT8195 vdosys1 has more than 32 reset bits and a different reset base
than other chips. Modify mmsys for support 64 bit and different reset
base.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h |  1 +
 drivers/soc/mediatek/mtk-mmsys.c    | 21 ++++++++++++++++-----
 drivers/soc/mediatek/mtk-mmsys.h    |  2 ++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 11ba79e3275e..628098260f61 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -229,6 +229,7 @@
 #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
 
+#define MT8195_VDO1_SW0_RST_B		0x1d0
 #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
 #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
 #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1b0024ee47a9..3f85171c980e 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -19,6 +19,8 @@
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -49,12 +51,16 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
+	.sw_reset_start = MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
+	.sw_reset_start = MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -75,6 +81,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 	.config = mmsys_mt8195_config_table,
 	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
+	.sw_reset_start = MT8195_VDO1_SW0_RST_B,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
@@ -133,18 +141,22 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
+	u32 offset;
 	u32 reg;
 
+	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
+	id = id % MMSYS_SW_RESET_PER_REG;
+
 	spin_lock_irqsave(&mmsys->lock, flags);
 
-	reg = readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
+	reg = readl_relaxed(mmsys->regs + mmsys->data->sw_reset_start + offset);
 
 	if (assert)
 		reg &= ~BIT(id);
 	else
 		reg |= BIT(id);
 
-	writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
+	writel_relaxed(reg, mmsys->regs + mmsys->data->sw_reset_start + offset);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -240,10 +252,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mmsys->data = of_device_get_match_data(&pdev->dev);
 	spin_lock_init(&mmsys->lock);
 
 	mmsys->rcdev.owner = THIS_MODULE;
-	mmsys->rcdev.nr_resets = 32;
+	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
 	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
 	mmsys->rcdev.of_node = pdev->dev.of_node;
 	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
@@ -252,8 +265,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mmsys->data = of_device_get_match_data(&pdev->dev);
-
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
 	if (ret)
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 2694021435d2..4842102cd451 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -102,6 +102,8 @@ struct mtk_mmsys_driver_data {
 	const unsigned int num_routes;
 	const struct mtk_mmsys_config *config;
 	const unsigned int num_configs;
+	u32 sw_reset_start;
+	u32 num_resets;
 };
 
 /*
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
