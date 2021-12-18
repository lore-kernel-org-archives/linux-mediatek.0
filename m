Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D035C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q26ccaMD9ZW4uf1YdCl9Oan1JzNIQP0Ra5FVJdZ31OI=; b=EYkWTxmfBE2K0F
	fOrgN371gQTQ/iHFd4fYKG+pPyQ3s9gqSGVJ68iMomLfPdqePNVwN3OVARKabZqJDNP1L2j4P4KQa
	oaxbsdw4DZEN3Uxe2HBEKzI6L4DlGHtOYwv7W8lP6HYJTzY2pYujCYbDEF1LxfJgDc8nmWfZYpzNB
	Pw1jW/ouq71UegI/jmnOBsTtw21m9QZNz/Djb+Ocni7YphE6jkljVb0309Td3RLRezAgEuVXS1DBm
	HTU/bTqAg5+Hoie+PiWr2aLp9Ht/ywKG9MN4BqZNQAeGgZWyNzpnjn9MOA3l0GRhjEg7CzNeYOfq9
	s7+iKGQjKqb9YmqkGhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myV4q-00DEet-BG; Sat, 18 Dec 2021 08:28:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myV4e-00DEbE-4N; Sat, 18 Dec 2021 08:28:13 +0000
X-UUID: a5b493f0961a4529a157c3f497f17039-20211218
X-UUID: a5b493f0961a4529a157c3f497f17039-20211218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1244485548; Sat, 18 Dec 2021 01:28:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 00:28:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 18 Dec 2021 16:28:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 18 Dec 2021 16:28:04 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v2 4/5] phy: phy-mtk-xsphy: use new io helpers to access
 register
Date: Sat, 18 Dec 2021 16:28:01 +0800
Message-ID: <20211218082802.5256-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
References: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_002812_213587_41DAFBCD 
X-CRM114-Status: GOOD (  12.05  )
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

Use new helpers mtk_phy_clear/set/update_bits() to access registers

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 140 +++++++++------------------
 1 file changed, 46 insertions(+), 94 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index 8c51131945c0..c0cdb78f77fa 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -10,13 +10,14 @@
 #include <dt-bindings/phy/phy.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "phy-mtk-io.h"
+
 /* u2 phy banks */
 #define SSUSB_SIFSLV_MISC		0x000
 #define SSUSB_SIFSLV_U2FREQ		0x100
@@ -126,26 +127,18 @@ static void u2_phy_slew_rate_calibrate(struct mtk_xsphy *xsphy,
 		return;
 
 	/* enable USB ring oscillator */
-	tmp = readl(pbase + XSP_USBPHYACR5);
-	tmp |= P2A5_RG_HSTX_SRCAL_EN;
-	writel(tmp, pbase + XSP_USBPHYACR5);
+	mtk_phy_set_bits(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCAL_EN);
 	udelay(1);	/* wait clock stable */
 
 	/* enable free run clock */
-	tmp = readl(pbase + XSP_U2FREQ_FMMONR1);
-	tmp |= P2F_RG_FRCK_EN;
-	writel(tmp, pbase + XSP_U2FREQ_FMMONR1);
+	mtk_phy_set_bits(pbase + XSP_U2FREQ_FMMONR1, P2F_RG_FRCK_EN);
 
 	/* set cycle count as 1024 */
-	tmp = readl(pbase + XSP_U2FREQ_FMCR0);
-	tmp &= ~(P2F_RG_CYCLECNT);
-	tmp |= P2F_RG_CYCLECNT_VAL(XSP_FM_DET_CYCLE_CNT);
-	writel(tmp, pbase + XSP_U2FREQ_FMCR0);
+	mtk_phy_update_bits(pbase + XSP_U2FREQ_FMCR0, P2F_RG_CYCLECNT,
+			    P2F_RG_CYCLECNT_VAL(XSP_FM_DET_CYCLE_CNT));
 
 	/* enable frequency meter */
-	tmp = readl(pbase + XSP_U2FREQ_FMCR0);
-	tmp |= P2F_RG_FREQDET_EN;
-	writel(tmp, pbase + XSP_U2FREQ_FMCR0);
+	mtk_phy_set_bits(pbase + XSP_U2FREQ_FMCR0, P2F_RG_FREQDET_EN);
 
 	/* ignore return value */
 	readl_poll_timeout(pbase + XSP_U2FREQ_FMMONR1, tmp,
@@ -154,14 +147,10 @@ static void u2_phy_slew_rate_calibrate(struct mtk_xsphy *xsphy,
 	fm_out = readl(pbase + XSP_U2FREQ_MMONR0);
 
 	/* disable frequency meter */
-	tmp = readl(pbase + XSP_U2FREQ_FMCR0);
-	tmp &= ~P2F_RG_FREQDET_EN;
-	writel(tmp, pbase + XSP_U2FREQ_FMCR0);
+	mtk_phy_clear_bits(pbase + XSP_U2FREQ_FMCR0, P2F_RG_FREQDET_EN);
 
 	/* disable free run clock */
-	tmp = readl(pbase + XSP_U2FREQ_FMMONR1);
-	tmp &= ~P2F_RG_FRCK_EN;
-	writel(tmp, pbase + XSP_U2FREQ_FMMONR1);
+	mtk_phy_clear_bits(pbase + XSP_U2FREQ_FMMONR1, P2F_RG_FRCK_EN);
 
 	if (fm_out) {
 		/* (1024 / FM_OUT) x reference clock frequency x coefficient */
@@ -177,31 +166,22 @@ static void u2_phy_slew_rate_calibrate(struct mtk_xsphy *xsphy,
 		xsphy->src_ref_clk, xsphy->src_coef);
 
 	/* set HS slew rate */
-	tmp = readl(pbase + XSP_USBPHYACR5);
-	tmp &= ~P2A5_RG_HSTX_SRCTRL;
-	tmp |= P2A5_RG_HSTX_SRCTRL_VAL(calib_val);
-	writel(tmp, pbase + XSP_USBPHYACR5);
+	mtk_phy_update_bits(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCTRL,
+			    P2A5_RG_HSTX_SRCTRL_VAL(calib_val));
 
 	/* disable USB ring oscillator */
-	tmp = readl(pbase + XSP_USBPHYACR5);
-	tmp &= ~P2A5_RG_HSTX_SRCAL_EN;
-	writel(tmp, pbase + XSP_USBPHYACR5);
+	mtk_phy_clear_bits(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCAL_EN);
 }
 
 static void u2_phy_instance_init(struct mtk_xsphy *xsphy,
 				 struct xsphy_instance *inst)
 {
 	void __iomem *pbase = inst->port_base;
-	u32 tmp;
 
 	/* DP/DM BC1.1 path Disable */
-	tmp = readl(pbase + XSP_USBPHYACR6);
-	tmp &= ~P2A6_RG_BC11_SW_EN;
-	writel(tmp, pbase + XSP_USBPHYACR6);
+	mtk_phy_clear_bits(pbase + XSP_USBPHYACR6, P2A6_RG_BC11_SW_EN);
 
-	tmp = readl(pbase + XSP_USBPHYACR0);
-	tmp |= P2A0_RG_INTR_EN;
-	writel(tmp, pbase + XSP_USBPHYACR0);
+	mtk_phy_set_bits(pbase + XSP_USBPHYACR0, P2A0_RG_INTR_EN);
 }
 
 static void u2_phy_instance_power_on(struct mtk_xsphy *xsphy,
@@ -209,16 +189,12 @@ static void u2_phy_instance_power_on(struct mtk_xsphy *xsphy,
 {
 	void __iomem *pbase = inst->port_base;
 	u32 index = inst->index;
-	u32 tmp;
 
-	tmp = readl(pbase + XSP_USBPHYACR6);
-	tmp |= P2A6_RG_OTG_VBUSCMP_EN;
-	writel(tmp, pbase + XSP_USBPHYACR6);
+	mtk_phy_set_bits(pbase + XSP_USBPHYACR6, P2A6_RG_OTG_VBUSCMP_EN);
 
-	tmp = readl(pbase + XSP_U2PHYDTM1);
-	tmp |= P2D_RG_VBUSVALID | P2D_RG_AVALID;
-	tmp &= ~P2D_RG_SESSEND;
-	writel(tmp, pbase + XSP_U2PHYDTM1);
+	mtk_phy_update_bits(pbase + XSP_U2PHYDTM1,
+			    P2D_RG_VBUSVALID | P2D_RG_AVALID | P2D_RG_SESSEND,
+			    P2D_RG_VBUSVALID | P2D_RG_AVALID);
 
 	dev_dbg(xsphy->dev, "%s(%d)\n", __func__, index);
 }
@@ -228,16 +204,12 @@ static void u2_phy_instance_power_off(struct mtk_xsphy *xsphy,
 {
 	void __iomem *pbase = inst->port_base;
 	u32 index = inst->index;
-	u32 tmp;
 
-	tmp = readl(pbase + XSP_USBPHYACR6);
-	tmp &= ~P2A6_RG_OTG_VBUSCMP_EN;
-	writel(tmp, pbase + XSP_USBPHYACR6);
+	mtk_phy_clear_bits(pbase + XSP_USBPHYACR6, P2A6_RG_OTG_VBUSCMP_EN);
 
-	tmp = readl(pbase + XSP_U2PHYDTM1);
-	tmp &= ~(P2D_RG_VBUSVALID | P2D_RG_AVALID);
-	tmp |= P2D_RG_SESSEND;
-	writel(tmp, pbase + XSP_U2PHYDTM1);
+	mtk_phy_update_bits(pbase + XSP_U2PHYDTM1,
+			    P2D_RG_VBUSVALID | P2D_RG_AVALID | P2D_RG_SESSEND,
+			    P2D_RG_SESSEND);
 
 	dev_dbg(xsphy->dev, "%s(%d)\n", __func__, index);
 }
@@ -306,63 +278,43 @@ static void u2_phy_props_set(struct mtk_xsphy *xsphy,
 			     struct xsphy_instance *inst)
 {
 	void __iomem *pbase = inst->port_base;
-	u32 tmp;
 
-	if (inst->efuse_intr) {
-		tmp = readl(pbase + XSP_USBPHYACR1);
-		tmp &= ~P2A1_RG_INTR_CAL;
-		tmp |= P2A1_RG_INTR_CAL_VAL(inst->efuse_intr);
-		writel(tmp, pbase + XSP_USBPHYACR1);
-	}
+	if (inst->efuse_intr)
+		mtk_phy_update_bits(pbase + XSP_USBPHYACR1, P2A1_RG_INTR_CAL,
+				    P2A1_RG_INTR_CAL_VAL(inst->efuse_intr));
 
-	if (inst->eye_src) {
-		tmp = readl(pbase + XSP_USBPHYACR5);
-		tmp &= ~P2A5_RG_HSTX_SRCTRL;
-		tmp |= P2A5_RG_HSTX_SRCTRL_VAL(inst->eye_src);
-		writel(tmp, pbase + XSP_USBPHYACR5);
-	}
+	if (inst->eye_src)
+		mtk_phy_update_bits(pbase + XSP_USBPHYACR5, P2A5_RG_HSTX_SRCTRL,
+				    P2A5_RG_HSTX_SRCTRL_VAL(inst->eye_src));
 
-	if (inst->eye_vrt) {
-		tmp = readl(pbase + XSP_USBPHYACR1);
-		tmp &= ~P2A1_RG_VRT_SEL;
-		tmp |= P2A1_RG_VRT_SEL_VAL(inst->eye_vrt);
-		writel(tmp, pbase + XSP_USBPHYACR1);
-	}
+	if (inst->eye_vrt)
+		mtk_phy_update_bits(pbase + XSP_USBPHYACR1, P2A1_RG_VRT_SEL,
+				    P2A1_RG_VRT_SEL_VAL(inst->eye_vrt));
 
-	if (inst->eye_term) {
-		tmp = readl(pbase + XSP_USBPHYACR1);
-		tmp &= ~P2A1_RG_TERM_SEL;
-		tmp |= P2A1_RG_TERM_SEL_VAL(inst->eye_term);
-		writel(tmp, pbase + XSP_USBPHYACR1);
-	}
+	if (inst->eye_term)
+		mtk_phy_update_bits(pbase + XSP_USBPHYACR1, P2A1_RG_TERM_SEL,
+				    P2A1_RG_TERM_SEL_VAL(inst->eye_term));
 }
 
 static void u3_phy_props_set(struct mtk_xsphy *xsphy,
 			     struct xsphy_instance *inst)
 {
 	void __iomem *pbase = inst->port_base;
-	u32 tmp;
 
-	if (inst->efuse_intr) {
-		tmp = readl(xsphy->glb_base + SSPXTP_PHYA_GLB_00);
-		tmp &= ~RG_XTP_GLB_BIAS_INTR_CTRL;
-		tmp |= RG_XTP_GLB_BIAS_INTR_CTRL_VAL(inst->efuse_intr);
-		writel(tmp, xsphy->glb_base + SSPXTP_PHYA_GLB_00);
-	}
+	if (inst->efuse_intr)
+		mtk_phy_update_bits(xsphy->glb_base + SSPXTP_PHYA_GLB_00,
+				    RG_XTP_GLB_BIAS_INTR_CTRL,
+				    RG_XTP_GLB_BIAS_INTR_CTRL_VAL(inst->efuse_intr));
 
-	if (inst->efuse_tx_imp) {
-		tmp = readl(pbase + SSPXTP_PHYA_LN_04);
-		tmp &= ~RG_XTP_LN0_TX_IMPSEL;
-		tmp |= RG_XTP_LN0_TX_IMPSEL_VAL(inst->efuse_tx_imp);
-		writel(tmp, pbase + SSPXTP_PHYA_LN_04);
-	}
+	if (inst->efuse_tx_imp)
+		mtk_phy_update_bits(pbase + SSPXTP_PHYA_LN_04,
+				    RG_XTP_LN0_TX_IMPSEL,
+				    RG_XTP_LN0_TX_IMPSEL_VAL(inst->efuse_tx_imp));
 
-	if (inst->efuse_rx_imp) {
-		tmp = readl(pbase + SSPXTP_PHYA_LN_14);
-		tmp &= ~RG_XTP_LN0_RX_IMPSEL;
-		tmp |= RG_XTP_LN0_RX_IMPSEL_VAL(inst->efuse_rx_imp);
-		writel(tmp, pbase + SSPXTP_PHYA_LN_14);
-	}
+	if (inst->efuse_rx_imp)
+		mtk_phy_update_bits(pbase + SSPXTP_PHYA_LN_14,
+				    RG_XTP_LN0_RX_IMPSEL,
+				    RG_XTP_LN0_RX_IMPSEL_VAL(inst->efuse_rx_imp));
 }
 
 static int mtk_phy_init(struct phy *phy)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
