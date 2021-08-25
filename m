Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E87C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B38E60FE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B38E60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnKfXMvuws4qxoX4yspQHms2oJFVC46edjAZIjNTbPk=; b=RFUI7npCHe2cFr
	L2zkKk3+mVHbUNWV06DyCbpdF/d29fT6db662uZ04X1cvNvlyQWh4U49G3VzNdgnc+Dycc368tZpe
	foC+cX//c0j0m9CCsqEQxC6dsHbQAd8c8tmLUoSzwW5Oji1DrCylKNpmSZi2UzSTm2zKM4hGsfBs2
	6u3Flw2+A/tXPnBBF5do1o+euVo7HVh+zezYPQtNorsXFM9YOfuv4de4HxLKJ+MdMof1nL46ppMsv
	p4A+ZdG8hDr+Y7L3eq8R4882N1HF/Jx+ONjP7UjfwJs+DQlYRzjzCrkwckwtluGFZ3B3zWmtnzaVb
	84zqbb2F7wkYygRDhKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIq3W-006RyW-Cq; Wed, 25 Aug 2021 10:22:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpuo-006NXw-HD; Wed, 25 Aug 2021 10:13:52 +0000
X-UUID: 1c17e9836f224f3d84b96b29ef3221f8-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zY6u97EFO2dk8fETVmBXqacNjf0JAl/525TsRLf6Ovs=; 
 b=mKe2cbmAxoArdMyJeD2V/pSZT3RRS2/uw1mUre0Etw9SG/VCw2gLYQrxswoVTvp5c+A4fCTqAhB88QQ1Kr8eJztjgRQV02mRnmc9YoCdtNagxAGOh3f+cBl9f+SVkNhSsPUfYfQ5elFp7XRAlCs4oLiIbLsm8lmUR+EzwxV7ggA=;
X-UUID: 1c17e9836f224f3d84b96b29ef3221f8-20210825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1080367988; Wed, 25 Aug 2021 03:13:27 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 03:05:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 18:05:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 18:05:35 +0800
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
Subject: [PATCH v4 10/17] soc: mediatek: mmsys: Add reset controller support
 for MT8195 vdosys1
Date: Wed, 25 Aug 2021 18:05:24 +0800
Message-ID: <20210825100531.5653-11-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210825100531.5653-1-nancy.lin@mediatek.com>
References: <20210825100531.5653-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_031350_648450_60C925A8 
X-CRM114-Status: GOOD (  19.15  )
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

For MT8195 vdosys1, many async modules need to reset after
the display pipe stops and restart.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h |  1 +
 drivers/soc/mediatek/mtk-mmsys.c    | 76 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h    |  1 +
 3 files changed, 78 insertions(+)

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
index e2bcd701ceb0..5e6c116e589a 100644
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
@@ -16,6 +18,8 @@
 #include "mt8365-mmsys.h"
 #include "mt8195-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -72,12 +76,15 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 	.config = mmsys_mt8195_config_table,
 	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
+	.sw_reset_start = MT8195_VDO1_SW0_RST_B,
 };
 
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
 	struct cmdq_client_reg cmdq_base;
+	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
+	struct reset_controller_dev rcdev;
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
@@ -158,6 +165,63 @@ void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
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
+	id = id % MMSYS_SW_RESET_PER_REG;
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
@@ -185,6 +249,18 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
 #endif
 
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
index 825857d8d7f4..d84f5cb78f8c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -100,6 +100,7 @@ struct mtk_mmsys_driver_data {
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
