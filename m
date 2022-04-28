Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E79C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JosJI297JfIolAaudP6BvWrUodzJaf0VI8cJ62LSbMc=; b=ItXBERv+EG0CdQ
	qPJaPKt3/wkYeuJ4DMHRb2jIvWQKnSCy/fimGXHJGPkZJF/cR+cubS67bM3BZtLx0F7DGx5WWG0f9
	9UbfTFEItkJSEpK8DI6NPZJa+/yl8NiBSSOyzvvhd2YlN4/RaN5mgOZVepD/HsoTbSUgHgDcrmL9j
	JbcA7/Ina/d1F3N/xbOUTtgUbQrkRqsSpj/WVdl0ay/6KFbvmxG7qfG0CwmJiWncZsJHOOdRDulCd
	3m5hz0XKwyWK60+EiSxn57CUDiEPXvd0mm7zzifv2J8hTRrQlo6MToZ1RJ3NGSQQD+L7uKgutVXtp
	c6dj5I3Rk0b8P5F9hNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk1sm-006M5o-As; Thu, 28 Apr 2022 11:00:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk1n2-006IID-Fb; Thu, 28 Apr 2022 10:54:32 +0000
X-UUID: 0d635b5716974ee58945e67cd8adb786-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2f385f2e-27ce-4ec9-ac25-7263aa55a9ac, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:d7ed0a2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0d635b5716974ee58945e67cd8adb786-20220428
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1663626189; Thu, 28 Apr 2022 03:54:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 03:54:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 18:54:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 18:54:12 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v18 07/21] soc: mediatek: mmsys: modify reset controller for
 MT8195 vdosys1
Date: Thu, 28 Apr 2022 18:53:54 +0800
Message-ID: <20220428105408.11189-8-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220428105408.11189-1-nancy.lin@mediatek.com>
References: <20220428105408.11189-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_035428_644711_67E23FB1 
X-CRM114-Status: GOOD (  16.24  )
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
base. Add the number of reset bits in mmsys private data and move the
whole "reset register code section" behind the "get mmsys->data" code
section for getting the num_resets in mmsys->data.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h |  1 +
 drivers/soc/mediatek/mtk-mmsys.c    | 39 ++++++++++++++++++-----------
 drivers/soc/mediatek/mtk-mmsys.h    |  1 +
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 5469073e3073..0a286fa5a824 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -139,6 +139,7 @@
 #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
 
+#define MT8195_VDO1_SW0_RST_B		0x1d0
 #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
 #define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
 #define MT8195_VDO1_HDR_TOP_CFG		0xd00
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 0315813b7df6..5fae31e3316f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -20,6 +20,8 @@
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
@@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
@@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.routes = mmsys_mt8186_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
@@ -148,6 +153,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.clk_driver = "clk-mt8195-vdo1",
 	.routes = mmsys_mt8195_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+	.sw0_rst_offset = MT8195_VDO1_SW0_RST_B,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
@@ -234,18 +241,22 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
+	u32 offset;
 	u32 reg;
 
+	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
+	id = id % MMSYS_SW_RESET_PER_REG;
+
 	spin_lock_irqsave(&mmsys->lock, flags);
 
-	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
+	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset + offset);
 
 	if (assert)
 		reg &= ~BIT(id);
 	else
 		reg |= BIT(id);
 
-	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
+	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset + offset);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -358,18 +369,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	spin_lock_init(&mmsys->lock);
-
-	mmsys->rcdev.owner = THIS_MODULE;
-	mmsys->rcdev.nr_resets = 32;
-	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
-	mmsys->rcdev.of_node = pdev->dev.of_node;
-	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
-	if (ret) {
-		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
-		return ret;
-	}
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(dev, "Couldn't get mmsys resource\n");
@@ -391,6 +390,18 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		mmsys->data = match_data->drv_data[0];
 	}
 
+	spin_lock_init(&mmsys->lock);
+
+	mmsys->rcdev.owner = THIS_MODULE;
+	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
+	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
+	mmsys->rcdev.of_node = pdev->dev.of_node;
+	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
+		return ret;
+	}
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
 	if (ret)
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index f01ba206481d..20a271b80b3b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	const u32 num_resets;
 };
 
 struct mtk_mmsys_match_data {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
