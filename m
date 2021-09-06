Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE692C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 07:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8025A60E8B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 07:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8025A60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LdD8p5MUva1KiGFlSOAqGevyDs7y7fG8c53XerMeqM=; b=mae87O63aHML8I
	eT3QMeBA6s8mKcib3NCnLoxzXygPRNMlgKLQ5j08kgKo0zXhZcnINz6ZHtDCYmjF1dEh9BhRo7rep
	hSAn9HnL0poQnOCx6OjtrxY2Me87wUH5ZSK8ppyB4EXG/rmiVYnbkkOMdeVyRAa+BxSvqMCVcUqpa
	EtZQuqrJXcqLhbDPEUTd4mFNMYkjnm9N2gjSH2TAmoCRN2iE3xwa0jZKP7DIGZnzlNjqsNBde9M1h
	HMChrpXdGbqRl2QigObFMqxG/OHf7PjnVOuDyAbERS6ppWylntJ2qqChvxgjbCRExId41TjK+z+cK
	2rhGWaMNlxB0DD7CyREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN8ry-00HXv5-Fx; Mon, 06 Sep 2021 07:16:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN8r4-00HXQI-KZ; Mon, 06 Sep 2021 07:15:49 +0000
X-UUID: 97be35d627f54b308a5656607f3a200b-20210906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=E3RIERgbqhr/xm5/6xxvQ2vVrPEQ1U6WTl6h7HDLUBY=; 
 b=QW8Wq+yFd0tNwXDhhSZMovkvgs0kkM1A++rJcDw1/h3yB72YMUnnqoW0sljHazs6tY//c5EwGsK7PlANsYUYSBlQLcLFLDUkkHkJUXKjg7gIRWLBzV9RAxMhmV+miuapGx2ng4hBVRcmFgM/dJCSf5137o/A9QW8uNwwDhZObPU=;
X-UUID: 97be35d627f54b308a5656607f3a200b-20210906
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 132380084; Mon, 06 Sep 2021 00:15:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 00:15:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 15:15:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Sep 2021 15:15:42 +0800
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
Subject: [PATCH v5 09/16] soc: mediatek: mmsys: modify reset controller for
 MT8195 vdosys1
Date: Mon, 6 Sep 2021 15:15:32 +0800
Message-ID: <20210906071539.12953-10-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210906071539.12953-1-nancy.lin@mediatek.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_001546_729600_8ED13E65 
X-CRM114-Status: GOOD (  14.05  )
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
 drivers/soc/mediatek/mtk-mmsys.c    | 15 ++++++++++++---
 drivers/soc/mediatek/mtk-mmsys.h    |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 648baaec112b..f67801c42fd9 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -123,6 +123,7 @@
 #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 << 0)
 
+#define MT8195_VDO1_SW0_RST_B           0x1d0
 #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
 #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
 #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 060065501b8a..97cb26339ef6 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -18,6 +18,8 @@
 #include "mt8365-mmsys.h"
 #include "mt8195-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -48,12 +50,14 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
+	.sw_reset_start = MMSYS_SW0_RST_B,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
+	.sw_reset_start = MMSYS_SW0_RST_B,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
@@ -74,6 +78,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 	.config = mmsys_mt8195_config_table,
 	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
+	.sw_reset_start = MT8195_VDO1_SW0_RST_B,
 };
 
 struct mtk_mmsys {
@@ -126,19 +131,23 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
+	u32 offset;
 	u32 reg;
 	int i;
 
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
 
@@ -237,7 +246,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	spin_lock_init(&mmsys->lock);
 
 	mmsys->rcdev.owner = THIS_MODULE;
-	mmsys->rcdev.nr_resets = 32;
+	mmsys->rcdev.nr_resets = 64;
 	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
 	mmsys->rcdev.of_node = pdev->dev.of_node;
 	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 8c6b57f19edb..f7f65d7adbf7 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -102,6 +102,7 @@ struct mtk_mmsys_driver_data {
 	const unsigned int num_routes;
 	const struct mtk_mmsys_config *config;
 	const unsigned int num_configs;
+	u32 sw_reset_start;
 };
 
 /*
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
