Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D29C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N97Vk4nuEZlmrW0JyiHDyQvQiT5eAYuTdYKWLmRd1tc=; b=NQvic57fYSWrQiNX8GO6cGTj/L
	yxrJ5G82X/ASwP/1VdxsJeR1uUwEBa57jkY9hCdl+MAEHKHcPBNGZ1YdJpB2jNJlJHZWBovHW5MfL
	VyVSEgF0wzojyIFrHPSVGrIuhg0w91xznTvH/EquffXCgGw+U/7RsIVAt2pGs1SjAvLcXuOAMq9VG
	5o54XsVur/PSfR016U9puknFYyBOqeOsOjdrfnAL0vTafHaXoieW9WVvPeoYGaTCuaiFeu21ao0bH
	f9HD2tRiMxLqObvMNGON5R2zkoQS8Hha2GQgzcBnGeYDHff6C/qbN2aC2EB8hPnBFhv9w80ELWwma
	j+WFW+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyVhc-001srr-0O;
	Mon, 15 May 2023 10:45:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUcb-001ZyR-2k
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 09:36:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30639daee76so8046394f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684143359; x=1686735359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N97Vk4nuEZlmrW0JyiHDyQvQiT5eAYuTdYKWLmRd1tc=;
        b=afLFR4tkKbPOPuWSXBCkfyTJh6jL4j8Kv0wY7dOWD+VQXzr4Gl+d14zurwTW1qbryG
         g7ESimKQhzsRoEXcaC2U45SJZqt+yAXwlVlF8SUjODvl3PhuvI21PT/aedcR4vZq70Ic
         7KVbhMdLBL7VwR/I5BvS9kl1kDWCzQknhe9A6FwkkzJWiiA7IX0I1ff26cjHGkhDJV6C
         zOtyZ2oPUlkbrLi3Zov3MCPTh42V+W/AUd6e0OpPW6/V2/JIAX53M5bfjs4Z9ts5kWkf
         3iPcil56x+074twzPyHol4UUXmg/amimJyuWOyc74T1QSHZ5GusxFl8Wj1kaRX0+1lpr
         L3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143359; x=1686735359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N97Vk4nuEZlmrW0JyiHDyQvQiT5eAYuTdYKWLmRd1tc=;
        b=a/aOx6lfwrLrl8CNUHY/wpP3y1llJ8TfaJT0SHQWSjnFHcdmq1YrHbBgQ1aAM4w5S8
         LX7IG16VT9RCPXURWQU+DBa2QNc6SIL5kBBEj0DmxxaKCtAfot1BibDYZrWuk1xPEwX8
         uERh5Ta/pFg7z8AJtFi16kuZplDBF3eZ40PJAT9EkDUlnJwmjbOBbRA0leQlvuQP06xd
         7HR85mUNrbqVA5iIWRMSKbF4OS3dCF+dzfRmzVzL62H2/Qx22n7o3ceUVkebWCYhYx4Y
         /hALQVEyWXehdZNq+/FxF9+hmyzW+yCGNAArtXI9MQQ5Y80ro5/2eYlBUOGIYl4mRzuQ
         /aWQ==
X-Gm-Message-State: AC+VfDy8d0hWjHi+dD2+ggV91VXgpXirR4IeGQbHCTDZUMSsm8Amgqt7
	wRhQzD5YR5xuP8v78wzDiulSpw==
X-Google-Smtp-Source: ACHHUZ6GmUfRbmphiJGmS1MuVhUgvcKJEzO43Qic6xC/RbBMs33YqX7gwAuIxqtXzl+8bsCedxgZ8Q==
X-Received: by 2002:adf:e2c3:0:b0:307:9b66:f512 with SMTP id d3-20020adfe2c3000000b003079b66f512mr15451744wrj.19.1684143359690;
        Mon, 15 May 2023 02:35:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id z22-20020a7bc7d6000000b003f42813b315sm21035451wmk.32.2023.05.15.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 02:35:59 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: krzysztof.kozlowski@linaro.org,
	robh@kernel.org,
	chunkuang.hu@kernel.org,
	linux-mediatek@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR MEDIATEK)
Subject: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Date: Mon, 15 May 2023 11:05:51 +0200
Message-Id: <20230515090551.1251389-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230515090551.1251389-1-jstephan@baylibre.com>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_023601_910859_E3EF3321 
X-CRM114-Status: GOOD (  20.67  )
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

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This is a new driver that supports the MIPI CSI CD-PHY version 0.5

The number of PHYs depend on the soc.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
[Julien Stephan: use GENMASK]
[Julien Stephan: refactor code]
[Julien Stephan: update device tree support and probe function]
Co-developed-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 MAINTAINERS                                   |   1 +
 drivers/phy/mediatek/Kconfig                  |   8 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  58 ++++
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 257 ++++++++++++++++++
 5 files changed, 326 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 44f0ff11e984..fc2766cb50d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13103,6 +13103,7 @@ M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
+F:	drivers/phy/mediatek/phy-mtk-mipi-csi-0-5*
 
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 3125ecb5d119..452bc7ac5ce5 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -74,3 +74,11 @@ config PHY_MTK_DP
 	select GENERIC_PHY
 	help
 	  Support DisplayPort PHY for MediaTek SoCs.
+
+config PHY_MTK_MIPI_CSI_0_5
+	tristate "MediaTek CSI CD-PHY v 0.5 Driver"
+	depends on ARCH_MEDIATEK && OF
+	select GENERIC_PHY
+	help
+	  Enable this to support the MIPI CSI CD-PHY receiver version 0.5.
+	  The driver supports multiple CSI cdphy ports simultaneously.
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index fb1f8edaffa7..8eb7b8747c67 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -18,3 +18,5 @@ phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
 obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
+
+obj-$(CONFIG_PHY_MTK_MIPI_CSI_0_5)	+= phy-mtk-mipi-csi-0-5.o
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
new file mode 100644
index 000000000000..e9a7f1ab3e2f
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __PHY_MTK__MIPI_CSI__C_0_5_RX_REG_H__
+#define __PHY_MTK__MIPI_CSI__C_0_5_RX_REG_H__
+
+/*
+ * CSI1 and CSI2 are identical, and similar to CSI0. All CSIx macros are
+ * applicable to the three PHYs. Where differences exist, they are denoted by
+ * macro names using CSI0 and CSI1, the latter being applicable to CSI1 and
+ * CSI2 alike.
+ */
+
+#define MIPI_RX_ANA00_CSIxA			0x0000
+#define RG_CSI0A_CPHY_EN			BIT(0)
+#define RG_CSIxA_EQ_PROTECT_EN			BIT(1)
+#define RG_CSIxA_BG_LPF_EN			BIT(2)
+#define RG_CSIxA_BG_CORE_EN			BIT(3)
+#define RG_CSIxA_DPHY_L0_CKMODE_EN		BIT(5)
+#define RG_CSIxA_DPHY_L0_CKSEL			BIT(6)
+#define RG_CSIxA_DPHY_L1_CKMODE_EN		BIT(8)
+#define RG_CSIxA_DPHY_L1_CKSEL			BIT(9)
+#define RG_CSIxA_DPHY_L2_CKMODE_EN		BIT(11)
+#define RG_CSIxA_DPHY_L2_CKSEL			BIT(12)
+
+#define MIPI_RX_ANA18_CSIxA			0x0018
+#define RG_CSI0A_L0_T0AB_EQ_IS			GENMASK(5, 4)
+#define RG_CSI0A_L0_T0AB_EQ_BW			GENMASK(7, 6)
+#define RG_CSI0A_L1_T1AB_EQ_IS			GENMASK(21, 20)
+#define RG_CSI0A_L1_T1AB_EQ_BW			GENMASK(23, 22)
+#define RG_CSI0A_L2_T1BC_EQ_IS			GENMASK(21, 20)
+#define RG_CSI0A_L2_T1BC_EQ_BW			GENMASK(23, 22)
+#define RG_CSI1A_L0_EQ_IS			GENMASK(5, 4)
+#define RG_CSI1A_L0_EQ_BW			GENMASK(7, 6)
+#define RG_CSI1A_L1_EQ_IS			GENMASK(21, 20)
+#define RG_CSI1A_L1_EQ_BW			GENMASK(23, 22)
+#define RG_CSI1A_L2_EQ_IS			GENMASK(5, 4)
+#define RG_CSI1A_L2_EQ_BW			GENMASK(7, 6)
+
+#define MIPI_RX_ANA1C_CSIxA			0x001c
+#define MIPI_RX_ANA20_CSI0A			0x0020
+
+#define MIPI_RX_ANA24_CSIxA			0x0024
+#define RG_CSIxA_RESERVE			GENMASK(31, 24)
+
+#define MIPI_RX_ANA40_CSIxA			0x0040
+#define RG_CSIxA_CPHY_FMCK_SEL			GENMASK(1, 0)
+#define RG_CSIxA_ASYNC_OPTION			GENMASK(7, 4)
+#define RG_CSIxA_CPHY_SPARE			GENMASK(31, 16)
+
+#define MIPI_RX_WRAPPER80_CSIxA			0x0080
+#define CSR_CSI_RST_MODE			GENMASK(17, 16)
+
+#define MIPI_RX_ANAA8_CSIxA			0x00a8
+#define RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT	BIT(0)
+#define RG_CSIxA_DPHY_L1_BYTECK_INVERT		BIT(1)
+#define RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT	BIT(2)
+
+#endif
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
new file mode 100644
index 000000000000..ae2d3dc9631d
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "phy-mtk-io.h"
+#include "phy-mtk-mipi-csi-0-5-rx-reg.h"
+
+#define CSIxB_OFFSET		0x1000
+
+struct mtk_mipi_dphy;
+
+struct mtk_mipi_dphy_port {
+	struct device *dev;
+	void __iomem *base;
+	struct phy *phy;
+	bool is_cdphy;
+};
+
+static int mtk_mipi_phy_power_on(struct phy *phy)
+{
+	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
+	void __iomem *base = port->base;
+
+	/*
+	 * Only DPHY is supported for now,
+	 * so set analog phy mode to DPHY in CDPHY compatible PHYs
+	 */
+	if (port->is_cdphy) {
+		mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+				     RG_CSI0A_CPHY_EN, 0);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+				     RG_CSI0A_CPHY_EN, 0);
+	}
+
+	/*
+	 * Lane configuration:
+	 *
+	 * Only 4 data + 1 clock is supported for now with the following mapping:
+	 *
+	 * CSIxA_LNR0 --> D2
+	 * CSIxA_LNR1 --> D0
+	 * CSIxA_LNR2 --> C
+	 * CSIxB_LNR0 --> D1
+	 * CSIxB_LNR1 --> D3
+	 */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L0_CKSEL, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L1_CKSEL, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L2_CKMODE_EN, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L2_CKSEL, 1);
+
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L0_CKSEL, 1);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L1_CKSEL, 1);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L2_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_DPHY_L2_CKSEL, 1);
+
+	/* Byte clock invert */
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIxA,
+			     RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIxA,
+			     RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIxA,
+			     RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANAA8_CSIxA,
+			     RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANAA8_CSIxA,
+			     RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANAA8_CSIxA,
+			     RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+
+	/* Start ANA EQ tuning */
+	if (port->is_cdphy) {
+		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI0A_L0_T0AB_EQ_IS, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI0A_L0_T0AB_EQ_BW, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI0A_L1_T1AB_EQ_IS, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI0A_L1_T1AB_EQ_BW, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A,
+				     RG_CSI0A_L2_T1BC_EQ_IS, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A,
+				     RG_CSI0A_L2_T1BC_EQ_BW, 1);
+
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI0A_L0_T0AB_EQ_IS, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI0A_L0_T0AB_EQ_BW, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI0A_L1_T1AB_EQ_IS, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI0A_L1_T1AB_EQ_BW, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA20_CSI0A,
+				     RG_CSI0A_L2_T1BC_EQ_IS, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA20_CSI0A,
+				     RG_CSI0A_L2_T1BC_EQ_BW, 1);
+	} else {
+		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L0_EQ_IS, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L0_EQ_BW, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L1_EQ_IS, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L1_EQ_BW, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI1A_L2_EQ_IS, 1);
+		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI1A_L2_EQ_BW, 1);
+
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L0_EQ_IS, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L0_EQ_BW, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L1_EQ_IS, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
+				     RG_CSI1A_L1_EQ_BW, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI1A_L2_EQ_IS, 1);
+		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
+				     RG_CSI1A_L2_EQ_BW, 1);
+	}
+
+	/* End ANA EQ tuning */
+	mtk_phy_set_bits(base + MIPI_RX_ANA40_CSIxA, 0x90);
+
+	mtk_phy_update_field(base + MIPI_RX_ANA24_CSIxA,
+			     RG_CSIxA_RESERVE, 0x40);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA24_CSIxA,
+			     RG_CSIxA_RESERVE, 0x40);
+	mtk_phy_update_field(base + MIPI_RX_WRAPPER80_CSIxA,
+			     CSR_CSI_RST_MODE, 0);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_WRAPPER80_CSIxA,
+			     CSR_CSI_RST_MODE, 0);
+	/* ANA power on */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_CORE_EN, 1);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_CORE_EN, 1);
+	usleep_range(20, 40);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_LPF_EN, 1);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_LPF_EN, 1);
+
+	return 0;
+}
+
+static int mtk_mipi_phy_power_off(struct phy *phy)
+{
+	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
+	void __iomem *base = port->base;
+
+	/* Disable MIPI BG. */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_CORE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_LPF_EN, 0);
+
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_CORE_EN, 0);
+	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
+			     RG_CSIxA_BG_LPF_EN, 0);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_dphy_ops = {
+	.power_on	= mtk_mipi_phy_power_on,
+	.power_off	= mtk_mipi_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int mtk_mipi_dphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct mtk_mipi_dphy_port *port;
+	struct phy *phy;
+
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, port);
+
+	port->dev = dev;
+
+	port->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(port->base))
+		return PTR_ERR(port->base);
+
+	port->is_cdphy = of_property_read_bool(dev->of_node, "mediatek,is_cdphy");
+
+	phy = devm_phy_create(dev, NULL, &mtk_dphy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "Failed to create PHY: %ld\n", PTR_ERR(phy));
+		return PTR_ERR(phy);
+	}
+
+	port->phy = phy;
+	phy_set_drvdata(phy, port);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "Failed to register PHY provider: %ld\n",
+			PTR_ERR(phy_provider));
+		return PTR_ERR(phy_provider);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mtk_mipi_dphy_of_match[] = {
+	{.compatible = "mediatek,phy-mipi-csi-0-5"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
+
+static struct platform_driver mipi_dphy_pdrv = {
+	.probe = mtk_mipi_dphy_probe,
+	.driver	= {
+		.name	= "mtk-mipi-csi-0-5",
+		.of_match_table = mtk_mipi_dphy_of_match,
+	},
+};
+
+module_platform_driver(mipi_dphy_pdrv);
+
+MODULE_DESCRIPTION("MTK mipi csi cdphy driver");
+MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.40.0


