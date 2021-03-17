Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5632EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 18:17:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C360164E31
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 18:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C360164E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S+FzTRv7FZ2j2/t6EWIV8RuOiMrEvzPLojNd3TFW5Nk=; b=IrbTr/1BqUGFuvTX+YMxm4c3h
	trpKufWWVpjfEp82/cBjbNcFKoVX9MjjigCpoTLMK0dcs7hMiBKaevhcANQR7VScO+QODGPG4BjG+
	gxIi66mt38WLAAUV3Di844nstgPtonZme79NsyMay+j96bAY4Jh0cT6KLKQwbRUkUGdlPZp3WRe26
	SABOatUJYeSmya1FzuqlF6eJmePoBy2glmYn0YDE85rOsQVYu4xzfEkWDkP/AYDC6akh1Fy0ltUsa
	bZo04jS01UxRJPinSUx1fW+oVsvuUqPPaghDV2NNpi0wXJXD4FvNj/UTXsZg6r21FT2NUrulUoZ4T
	VK4AneCsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMajm-003jMp-6a; Wed, 17 Mar 2021 18:17:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMajP-003jJi-Tn; Wed, 17 Mar 2021 18:17:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 129FC1F45486
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, drinkcat@chromium.org, hsinyi@chromium.org,
 weiyi.lu@mediatek.com, Collabora Kernel ML <kernel@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] soc: mediatek: mmsys: Use an array for setting the
 routing registers
Date: Wed, 17 Mar 2021 19:17:10 +0100
Message-Id: <20210317181711.795245-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317181711.795245-1-enric.balletbo@collabora.com>
References: <20210317181711.795245-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_181720_189907_49E265FD 
X-CRM114-Status: GOOD (  19.62  )
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

From: CK Hu <ck.hu@mediatek.com>

Actually, setting the registers for routing, use multiple 'if-else' for different
routes, but this code would be more and more complicated while we
support more and more SoCs. Change that and use a table per SoC so the
code will be more portable and clear.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2:
- Use a default table for mt2701, mt2712 and mt8173.
- Remove the mask field from routes struct as is not needed.

 drivers/soc/mediatek/mtk-mmsys.c | 273 +++----------------------------
 drivers/soc/mediatek/mtk-mmsys.h | 215 ++++++++++++++++++++++++
 2 files changed, 240 insertions(+), 248 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.h

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index da2de8f6969e..c46d8ab8b0c2 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -10,79 +10,18 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
-#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
-#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
-#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
-#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
-#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
-#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
-#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
-#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
-#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
-#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
-#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
-#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
-#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
-#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
-
-#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
-#define DISP_REG_CONFIG_OUT_SEL			0x04c
-#define DISP_REG_CONFIG_DSI_SEL			0x050
-#define DISP_REG_CONFIG_DPI_SEL			0x064
-
-#define OVL0_MOUT_EN_COLOR0			0x1
-#define OD_MOUT_EN_RDMA0			0x1
-#define OD1_MOUT_EN_RDMA1			BIT(16)
-#define UFOE_MOUT_EN_DSI0			0x1
-#define COLOR0_SEL_IN_OVL0			0x1
-#define OVL1_MOUT_EN_COLOR1			0x1
-#define GAMMA_MOUT_EN_RDMA1			0x1
-#define RDMA0_SOUT_DPI0				0x2
-#define RDMA0_SOUT_DPI1				0x3
-#define RDMA0_SOUT_DSI1				0x1
-#define RDMA0_SOUT_DSI2				0x4
-#define RDMA0_SOUT_DSI3				0x5
-#define RDMA1_SOUT_DPI0				0x2
-#define RDMA1_SOUT_DPI1				0x3
-#define RDMA1_SOUT_DSI1				0x1
-#define RDMA1_SOUT_DSI2				0x4
-#define RDMA1_SOUT_DSI3				0x5
-#define RDMA2_SOUT_DPI0				0x2
-#define RDMA2_SOUT_DPI1				0x3
-#define RDMA2_SOUT_DSI1				0x1
-#define RDMA2_SOUT_DSI2				0x4
-#define RDMA2_SOUT_DSI3				0x5
-#define DPI0_SEL_IN_RDMA1			0x1
-#define DPI0_SEL_IN_RDMA2			0x3
-#define DPI1_SEL_IN_RDMA1			(0x1 << 8)
-#define DPI1_SEL_IN_RDMA2			(0x3 << 8)
-#define DSI0_SEL_IN_RDMA1			0x1
-#define DSI0_SEL_IN_RDMA2			0x4
-#define DSI1_SEL_IN_RDMA1			0x1
-#define DSI1_SEL_IN_RDMA2			0x4
-#define DSI2_SEL_IN_RDMA1			(0x1 << 16)
-#define DSI2_SEL_IN_RDMA2			(0x4 << 16)
-#define DSI3_SEL_IN_RDMA1			(0x1 << 16)
-#define DSI3_SEL_IN_RDMA2			(0x4 << 16)
-#define COLOR1_SEL_IN_OVL1			0x1
-
-#define OVL_MOUT_EN_RDMA			0x1
-#define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
-#define BLS_TO_DPI_RDMA1_TO_DSI			0x2
-#define DSI_SEL_IN_BLS				0x0
-#define DPI_SEL_IN_BLS				0x0
-#define DSI_SEL_IN_RDMA				0x1
-
-struct mtk_mmsys_driver_data {
-	const char *clk_driver;
-};
+#include "mtk-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
+	.routes = mmsys_default_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };
 
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.clk_driver = "clk-mt2712-mm",
+	.routes = mmsys_default_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };
 
 static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
@@ -95,6 +34,8 @@ static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
+	.routes = mmsys_default_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -106,180 +47,20 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 };
 
-static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
-					  enum mtk_ddp_comp_id next,
-					  unsigned int *addr)
-{
-	unsigned int value;
-
-	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
-		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
-		value = OVL0_MOUT_EN_COLOR0;
-	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
-		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
-		value = OVL_MOUT_EN_RDMA;
-	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
-		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
-		value = OD_MOUT_EN_RDMA0;
-	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
-		value = UFOE_MOUT_EN_DSI0;
-	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
-		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
-		value = OVL1_MOUT_EN_COLOR1;
-	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
-		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
-		value = GAMMA_MOUT_EN_RDMA1;
-	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
-		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
-		value = OD1_MOUT_EN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI3;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI3;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI3;
-	} else {
-		value = 0;
-	}
-
-	return value;
-}
-
-static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
-					 enum mtk_ddp_comp_id next,
-					 unsigned int *addr)
-{
-	unsigned int value;
-
-	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
-		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
-		value = COLOR0_SEL_IN_OVL0;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI0_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI1_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI0_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI1_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI2_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI3_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI0_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI1_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI0_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI1_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI2_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI3_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
-		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
-		value = COLOR1_SEL_IN_OVL1;
-	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSI_SEL;
-		value = DSI_SEL_IN_BLS;
-	} else {
-		value = 0;
-	}
-
-	return value;
-}
-
-static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
-				   enum mtk_ddp_comp_id cur,
-				   enum mtk_ddp_comp_id next)
-{
-	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-		writel_relaxed(DSI_SEL_IN_RDMA,
-			       config_regs + DISP_REG_CONFIG_DSI_SEL);
-		writel_relaxed(DPI_SEL_IN_BLS,
-			       config_regs + DISP_REG_CONFIG_DPI_SEL);
-	}
-}
-
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
-	unsigned int addr, value, reg;
-
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) | value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
-
-	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
-
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) | value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
+	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
+	u32 reg;
+	int i;
+
+	for (i = 0; i < mmsys->data->num_routes; i++)
+		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
+			reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
+			writel_relaxed(reg, mmsys->regs + routes[i].addr);
+		}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -288,19 +69,15 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id next)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
-	unsigned int addr, value, reg;
-
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) & ~value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
-
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(mmsys->regs + addr) & ~value;
-		writel_relaxed(reg, mmsys->regs + addr);
-	}
+	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
+	u32 reg;
+	int i;
+
+	for (i = 0; i < mmsys->data->num_routes; i++)
+		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
+			reg = readl_relaxed(mmsys->regs + routes[i].addr) & ~routes[i].val;
+			writel_relaxed(reg, mmsys->regs + routes[i].addr);
+		}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
new file mode 100644
index 000000000000..a760a34e6eca
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MTK_MMSYS_H
+#define __SOC_MEDIATEK_MTK_MMSYS_H
+
+#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
+#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
+#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
+#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
+#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
+#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
+#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
+#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
+#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
+#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
+#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
+#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
+#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
+#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
+
+#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
+#define DISP_REG_CONFIG_OUT_SEL			0x04c
+#define DISP_REG_CONFIG_DSI_SEL			0x050
+#define DISP_REG_CONFIG_DPI_SEL			0x064
+
+#define OVL0_MOUT_EN_COLOR0			0x1
+#define OD_MOUT_EN_RDMA0			0x1
+#define OD1_MOUT_EN_RDMA1			BIT(16)
+#define UFOE_MOUT_EN_DSI0			0x1
+#define COLOR0_SEL_IN_OVL0			0x1
+#define OVL1_MOUT_EN_COLOR1			0x1
+#define GAMMA_MOUT_EN_RDMA1			0x1
+#define RDMA0_SOUT_DPI0				0x2
+#define RDMA0_SOUT_DPI1				0x3
+#define RDMA0_SOUT_DSI1				0x1
+#define RDMA0_SOUT_DSI2				0x4
+#define RDMA0_SOUT_DSI3				0x5
+#define RDMA1_SOUT_DPI0				0x2
+#define RDMA1_SOUT_DPI1				0x3
+#define RDMA1_SOUT_DSI1				0x1
+#define RDMA1_SOUT_DSI2				0x4
+#define RDMA1_SOUT_DSI3				0x5
+#define RDMA2_SOUT_DPI0				0x2
+#define RDMA2_SOUT_DPI1				0x3
+#define RDMA2_SOUT_DSI1				0x1
+#define RDMA2_SOUT_DSI2				0x4
+#define RDMA2_SOUT_DSI3				0x5
+#define DPI0_SEL_IN_RDMA1			0x1
+#define DPI0_SEL_IN_RDMA2			0x3
+#define DPI1_SEL_IN_RDMA1			(0x1 << 8)
+#define DPI1_SEL_IN_RDMA2			(0x3 << 8)
+#define DSI0_SEL_IN_RDMA1			0x1
+#define DSI0_SEL_IN_RDMA2			0x4
+#define DSI1_SEL_IN_RDMA1			0x1
+#define DSI1_SEL_IN_RDMA2			0x4
+#define DSI2_SEL_IN_RDMA1			(0x1 << 16)
+#define DSI2_SEL_IN_RDMA2			(0x4 << 16)
+#define DSI3_SEL_IN_RDMA1			(0x1 << 16)
+#define DSI3_SEL_IN_RDMA2			(0x4 << 16)
+#define COLOR1_SEL_IN_OVL1			0x1
+
+#define OVL_MOUT_EN_RDMA			0x1
+#define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
+#define BLS_TO_DPI_RDMA1_TO_DSI			0x2
+#define DSI_SEL_IN_BLS				0x0
+#define DPI_SEL_IN_BLS				0x0
+#define DSI_SEL_IN_RDMA				0x1
+
+struct mtk_mmsys_routes {
+	u32 from_comp;
+	u32 to_comp;
+	u32 addr;
+	u32 val;
+};
+
+struct mtk_mmsys_driver_data {
+	const char *clk_driver;
+	const struct mtk_mmsys_routes *routes;
+	const unsigned int num_routes;
+};
+
+/*
+ * Routes in mt8173, mt2701, mt2712 are different. That means
+ * in the same register address, it controls different input/output
+ * selection for each SoC. But, right now, they use the same table as
+ * default routes meet their requirements. But we don't have the complete
+ * route information for these three SoC, so just keep them in the same
+ * table. After we've more information, we could separate mt2701, mt2712
+ * to an independent table.
+ */
+static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
+	{
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_OUT_SEL, BLS_TO_DSI_RDMA1_TO_DPI1
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_BLS
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_OUT_SEL, BLS_TO_DPI_RDMA1_TO_DSI
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_RDMA
+	}, {
+		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_BLS
+	}, {
+		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
+		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1
+	}, {
+		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
+		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0
+	}, {
+		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
+		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
+		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
+		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI1
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI1
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI2
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI3
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DPI0
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DPI1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI2
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI3
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DPI0
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DPI1
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI1
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_RDMA2
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI3
+	}, {
+		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA2
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
