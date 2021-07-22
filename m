Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3758C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C70F60D07
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C70F60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pI8q11plwwaiAKuYw3CnYoXDtZCGYx2JVq2XtYmGqGQ=; b=XvIe6NK/VcPfky
	eKnJCEYGH1MtziNpLX6+6LL3lqqnD9CACZoUpy4gXUhvuDWkHBZY5HiYRhfufSXLssm1lVj+lVSKK
	Donm5AZ1MPpLhYvjC0wR7jiIbvF7aiR+xImTySKwWD8IPOvPhxSHVngYPzw2FuU4L/p9kK7P0JcCQ
	o/9W+sdbWe6bsg0VRncuig/HtGqoi/PU6YpRO0ZZuSF1F+BBqsq6oOrRR1gumZw0OjzW3W7ivfrs9
	9oCd6g/ZS6tSwCiU5PEIKsjCS15ezZHwUMldguC6d3VmyHNLccYlp7MbLKaai4AoJjsFvHlWN6sZX
	ymCfLEemQCe2ywYzlsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VRC-0012rI-Fu; Thu, 22 Jul 2021 09:56:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VNK-0011Ej-RZ; Thu, 22 Jul 2021 09:52:20 +0000
X-UUID: ec337a139c894659977bfb6a6a0a79f9-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=THiFth8jv2ocKrkugjjxuK5+AS7coUDOfmNRc+FDNcg=; 
 b=GaLuf+nPxwF78Zjt0HvXFoCWo5d2/X8Z0EuglBBRxF9eJwCj65zrzE74/WJnda40AIFzmIQ9G6OFZ4vQuOTmMTR4MLcDiQAqrK1x0t1j+Pu6Z4wGzDbjjuHB0hW1YKQLoiNKshesKNZ36BoTRAPchJgpSZ2zpURcfSE2gqkOBVc=;
X-UUID: ec337a139c894659977bfb6a6a0a79f9-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1635585504; Thu, 22 Jul 2021 02:52:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:45:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:54 +0800
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
Subject: [PATCH v2 09/14] soc: mediatek: mmsys: Add reset controller support
 for MT8195 vdosys1
Date: Thu, 22 Jul 2021 17:45:46 +0800
Message-ID: <20210722094551.15255-10-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_025218_944654_A3C9F134 
X-CRM114-Status: GOOD (  18.43  )
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

Among other features the mmsys driver should implement a reset
controller to be able to reset different bits from their space.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h |  1 +
 drivers/soc/mediatek/mtk-mmsys.c    | 77 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h    |  1 +
 3 files changed, 79 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 4bdb2087250c..a7f6e275bfe5 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -154,6 +154,7 @@
 #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT	(1 << 0)
 #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT	(2 << 0)
 
+#define MT8195_VDO1_SW0_RST_B           0x1d0
 #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
 #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
 #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index d0f4a407f8f8..1ae04efeadab 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,10 +4,12 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
 #include "mtk-mmsys.h"
@@ -15,6 +17,8 @@
 #include "mt8183-mmsys.h"
 #include "mt8195-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -65,12 +69,15 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 	.config = mmsys_mt8195_config_table,
 	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
+	.sw_reset_start = MT8195_VDO1_SW0_RST_B,
 };
 
 struct mtk_mmsys {
 	void __iomem *regs;
 	struct cmdq_client_reg cmdq_base;
 	const struct mtk_mmsys_driver_data *data;
+	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
+	struct reset_controller_dev rcdev;
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
@@ -148,6 +155,63 @@ void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
 
+static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
+				  bool assert)
+{
+	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
+	unsigned long flags;
+	u32 reg;
+	int i;
+	u32 offset;
+
+	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
+	id = 1 << (id % MMSYS_SW_RESET_PER_REG);
+
+	spin_lock_irqsave(&mmsys->lock, flags);
+
+	reg = readl_relaxed(mmsys->regs + mmsys->data->sw_reset_start + offset);
+
+	if (assert)
+		reg &= ~BIT(id);
+	else
+		reg |= BIT(id);
+
+	writel_relaxed(reg, mmsys->regs + mmsys->data->sw_reset_start + offset);
+
+	spin_unlock_irqrestore(&mmsys->lock, flags);
+
+	return 0;
+}
+
+static int mtk_mmsys_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return mtk_mmsys_reset_update(rcdev, id, true);
+}
+
+static int mtk_mmsys_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return mtk_mmsys_reset_update(rcdev, id, false);
+}
+
+static int mtk_mmsys_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	ret = mtk_mmsys_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 1100);
+
+	return mtk_mmsys_reset_deassert(rcdev, id);
+}
+
+static const struct reset_control_ops mtk_mmsys_reset_ops = {
+	.assert = mtk_mmsys_reset_assert,
+	.deassert = mtk_mmsys_reset_deassert,
+	.reset = mtk_mmsys_reset,
+};
+
 static int mtk_mmsys_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -174,6 +238,19 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (ret)
 		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
 #endif
+
+	spin_lock_init(&mmsys->lock);
+
+	mmsys->rcdev.owner = THIS_MODULE;
+	mmsys->rcdev.nr_resets = 64;
+	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
+	mmsys->rcdev.of_node = pdev->dev.of_node;
+	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
+		return ret;
+	}
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 084b1f5f3c88..cc57c3895c51 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -87,6 +87,7 @@ struct mtk_mmsys_driver_data {
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
