Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkeL3Uba06lGczQ/hL8uhfoNjL6723uU908KGaVNDiI=; b=tvtenGzTlMci35
	TwTnreQW+G6d00n9kmTOPFDSqsijOsaa91RUiiBZ7j5tG64AeTbx2DEzB85RrHmKBRpvbwrDeXeFR
	fwnZCQcrq+D2R3biuBKuq+ZCUxgCw0JWSzG1kj0JDvxqlRuIhDPdtGcZBtk+3Ttlxl11iVG4a/60H
	m5ipouWoVDTEDyHF5TJPwEYQVf/l6VP/cdIey0vbm2z8u35RV9ovoeABH/nUEtqSIE+EeExTW5zPh
	/8ijGC4Jwu3GVfmNqOqDAkzw3OqiLKWVU5mhxkc/k1Oig2c/0D5rzPmbMyQX8wcye47/qfoZZz74k
	ZEIjMPvK420Q6TQkcwsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VVu-00FlE2-A5; Mon, 17 Jan 2022 17:09:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VPJ-00FhOl-V0; Mon, 17 Jan 2022 17:03:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D6B4611C2;
 Mon, 17 Jan 2022 17:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AFDC36AE3;
 Mon, 17 Jan 2022 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438980;
 bh=MQZNKsIA8dH2rECRUuLDz3Ofvj0Sz2YQD2ogUS2SVoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BHAJ/UuibtWdG3xbACjATHQxdJUtw9PuD3xwFiXoslyo/nJdSCj++VGCISm2ocEiM
 CMlty7hriBpEoZJEMFrEfy96YLK0Qyotu1uzhaQVddJcANRN1HcUwWrK04IoMA/hkl
 7XYEBUf3EZLPut+owT3Tj5ulz6DQYRLFBwH0bxdbRPMBUTWni2fSQ/fc+k6NeANhqf
 mNHDOiPXSDDAOpQOhhMKATdh4ihqutzu8y9N0LhES+0Nq9A/cRNX3hMplAwGHjWF96
 3pLb00Jj7GEtJ19NkTqCmrDTsMX6nbZ92MXOhc/omx1hV+MpZiF+Xl2ZYsSnrOx9cn
 1TuU0IlKKY2HA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Sasha Levin <sashal@kernel.org>, kishon@ti.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 38/44] phy: phy-mtk-tphy: add support efuse
 setting
Date: Mon, 17 Jan 2022 12:01:21 -0500
Message-Id: <20220117170127.1471115-38-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090302_102423_2D7E3742 
X-CRM114-Status: GOOD (  21.74  )
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

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

[ Upstream commit 6f2b033cb883f64ad084a75f13634242c7e179a6 ]

Due to some SoCs have a bit shift issue that will drop a bit for usb3
phy or pcie phy, fix it by adding software efuse reading and setting,
but only support it optionally for version 2/3.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/20211218082802.5256-2-chunfeng.yun@mediatek.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 162 ++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index cdcef865fe9e5..98a942c607a67 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -12,6 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
@@ -41,6 +42,9 @@
 #define SSUSB_SIFSLV_V2_U3PHYD		0x200
 #define SSUSB_SIFSLV_V2_U3PHYA		0x400
 
+#define U3P_MISC_REG1		0x04
+#define MR1_EFUSE_AUTO_LOAD_DIS		BIT(6)
+
 #define U3P_USBPHYACR0		0x000
 #define PA0_RG_U2PLL_FORCE_ON		BIT(15)
 #define PA0_USB20_PLL_PREDIV		GENMASK(7, 6)
@@ -133,6 +137,8 @@
 #define P3C_RG_SWRST_U3_PHYD_FORCE_EN	BIT(24)
 
 #define U3P_U3_PHYA_REG0	0x000
+#define P3A_RG_IEXT_INTR		GENMASK(15, 10)
+#define P3A_RG_IEXT_INTR_VAL(x)		((0x3f & (x)) << 10)
 #define P3A_RG_CLKDRV_OFF		GENMASK(3, 2)
 #define P3A_RG_CLKDRV_OFF_VAL(x)	((0x3 & (x)) << 2)
 
@@ -187,6 +193,19 @@
 #define P3D_RG_FWAKE_TH		GENMASK(21, 16)
 #define P3D_RG_FWAKE_TH_VAL(x)	((0x3f & (x)) << 16)
 
+#define U3P_U3_PHYD_IMPCAL0		0x010
+#define P3D_RG_FORCE_TX_IMPEL		BIT(31)
+#define P3D_RG_TX_IMPEL			GENMASK(28, 24)
+#define P3D_RG_TX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
+
+#define U3P_U3_PHYD_IMPCAL1		0x014
+#define P3D_RG_FORCE_RX_IMPEL		BIT(31)
+#define P3D_RG_RX_IMPEL			GENMASK(28, 24)
+#define P3D_RG_RX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
+
+#define U3P_U3_PHYD_RSV			0x054
+#define P3D_RG_EFUSE_AUTO_LOAD_DIS	BIT(12)
+
 #define U3P_U3_PHYD_CDR1		0x05c
 #define P3D_RG_CDR_BIR_LTD1		GENMASK(28, 24)
 #define P3D_RG_CDR_BIR_LTD1_VAL(x)	((0x1f & (x)) << 24)
@@ -307,6 +326,11 @@ struct mtk_phy_pdata {
 	 * 48M PLL, fix it by switching PLL to 26M from default 48M
 	 */
 	bool sw_pll_48m_to_26m;
+	/*
+	 * Some SoCs (e.g. mt8195) drop a bit when use auto load efuse,
+	 * support sw way, also support it for v2/v3 optionally.
+	 */
+	bool sw_efuse_supported;
 	enum mtk_phy_version version;
 };
 
@@ -336,6 +360,10 @@ struct mtk_phy_instance {
 	struct regmap *type_sw;
 	u32 type_sw_reg;
 	u32 type_sw_index;
+	u32 efuse_sw_en;
+	u32 efuse_intr;
+	u32 efuse_tx_imp;
+	u32 efuse_rx_imp;
 	int eye_src;
 	int eye_vrt;
 	int eye_term;
@@ -1040,6 +1068,130 @@ static int phy_type_set(struct mtk_phy_instance *instance)
 	return 0;
 }
 
+static int phy_efuse_get(struct mtk_tphy *tphy, struct mtk_phy_instance *instance)
+{
+	struct device *dev = &instance->phy->dev;
+	int ret = 0;
+
+	/* tphy v1 doesn't support sw efuse, skip it */
+	if (!tphy->pdata->sw_efuse_supported) {
+		instance->efuse_sw_en = 0;
+		return 0;
+	}
+
+	/* software efuse is optional */
+	instance->efuse_sw_en = device_property_read_bool(dev, "nvmem-cells");
+	if (!instance->efuse_sw_en)
+		return 0;
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		ret = nvmem_cell_read_variable_le_u32(dev, "intr", &instance->efuse_intr);
+		if (ret) {
+			dev_err(dev, "fail to get u2 intr efuse, %d\n", ret);
+			break;
+		}
+
+		/* no efuse, ignore it */
+		if (!instance->efuse_intr) {
+			dev_warn(dev, "no u2 intr efuse, but dts enable it\n");
+			instance->efuse_sw_en = 0;
+			break;
+		}
+
+		dev_dbg(dev, "u2 efuse - intr %x\n", instance->efuse_intr);
+		break;
+
+	case PHY_TYPE_USB3:
+	case PHY_TYPE_PCIE:
+		ret = nvmem_cell_read_variable_le_u32(dev, "intr", &instance->efuse_intr);
+		if (ret) {
+			dev_err(dev, "fail to get u3 intr efuse, %d\n", ret);
+			break;
+		}
+
+		ret = nvmem_cell_read_variable_le_u32(dev, "rx_imp", &instance->efuse_rx_imp);
+		if (ret) {
+			dev_err(dev, "fail to get u3 rx_imp efuse, %d\n", ret);
+			break;
+		}
+
+		ret = nvmem_cell_read_variable_le_u32(dev, "tx_imp", &instance->efuse_tx_imp);
+		if (ret) {
+			dev_err(dev, "fail to get u3 tx_imp efuse, %d\n", ret);
+			break;
+		}
+
+		/* no efuse, ignore it */
+		if (!instance->efuse_intr &&
+		    !instance->efuse_rx_imp &&
+		    !instance->efuse_rx_imp) {
+			dev_warn(dev, "no u3 intr efuse, but dts enable it\n");
+			instance->efuse_sw_en = 0;
+			break;
+		}
+
+		dev_dbg(dev, "u3 efuse - intr %x, rx_imp %x, tx_imp %x\n",
+			instance->efuse_intr, instance->efuse_rx_imp,instance->efuse_tx_imp);
+		break;
+	default:
+		dev_err(dev, "no sw efuse for type %d\n", instance->type);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static void phy_efuse_set(struct mtk_phy_instance *instance)
+{
+	struct device *dev = &instance->phy->dev;
+	struct u2phy_banks *u2_banks = &instance->u2_banks;
+	struct u3phy_banks *u3_banks = &instance->u3_banks;
+	u32 tmp;
+
+	if (!instance->efuse_sw_en)
+		return;
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		tmp = readl(u2_banks->misc + U3P_MISC_REG1);
+		tmp |= MR1_EFUSE_AUTO_LOAD_DIS;
+		writel(tmp, u2_banks->misc + U3P_MISC_REG1);
+
+		tmp = readl(u2_banks->com + U3P_USBPHYACR1);
+		tmp &= ~PA1_RG_INTR_CAL;
+		tmp |= PA1_RG_INTR_CAL_VAL(instance->efuse_intr);
+		writel(tmp, u2_banks->com + U3P_USBPHYACR1);
+		break;
+	case PHY_TYPE_USB3:
+	case PHY_TYPE_PCIE:
+		tmp = readl(u3_banks->phyd + U3P_U3_PHYD_RSV);
+		tmp |= P3D_RG_EFUSE_AUTO_LOAD_DIS;
+		writel(tmp, u3_banks->phyd + U3P_U3_PHYD_RSV);
+
+		tmp = readl(u3_banks->phyd + U3P_U3_PHYD_IMPCAL0);
+		tmp &= ~P3D_RG_TX_IMPEL;
+		tmp |= P3D_RG_TX_IMPEL_VAL(instance->efuse_tx_imp);
+		tmp |= P3D_RG_FORCE_TX_IMPEL;
+		writel(tmp, u3_banks->phyd + U3P_U3_PHYD_IMPCAL0);
+
+		tmp = readl(u3_banks->phyd + U3P_U3_PHYD_IMPCAL1);
+		tmp &= ~P3D_RG_RX_IMPEL;
+		tmp |= P3D_RG_RX_IMPEL_VAL(instance->efuse_rx_imp);
+		tmp |= P3D_RG_FORCE_RX_IMPEL;
+		writel(tmp, u3_banks->phyd + U3P_U3_PHYD_IMPCAL1);
+
+		tmp = readl(u3_banks->phya + U3P_U3_PHYA_REG0);
+		tmp &= ~P3A_RG_IEXT_INTR;
+		tmp |= P3A_RG_IEXT_INTR_VAL(instance->efuse_intr);
+		writel(tmp, u3_banks->phya + U3P_U3_PHYA_REG0);
+		break;
+	default:
+		dev_warn(dev, "no sw efuse for type %d\n", instance->type);
+		break;
+	}
+}
+
 static int mtk_phy_init(struct phy *phy)
 {
 	struct mtk_phy_instance *instance = phy_get_drvdata(phy);
@@ -1050,6 +1202,8 @@ static int mtk_phy_init(struct phy *phy)
 	if (ret)
 		return ret;
 
+	phy_efuse_set(instance);
+
 	switch (instance->type) {
 	case PHY_TYPE_USB2:
 		u2_phy_instance_init(tphy, instance);
@@ -1134,6 +1288,7 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 	struct mtk_phy_instance *instance = NULL;
 	struct device_node *phy_np = args->np;
 	int index;
+	int ret;
 
 	if (args->args_count != 1) {
 		dev_err(dev, "invalid number of cells in 'phy' property\n");
@@ -1174,6 +1329,10 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
+	ret = phy_efuse_get(tphy, instance);
+	if (ret)
+		return ERR_PTR(ret);
+
 	phy_parse_property(tphy, instance);
 	phy_type_set(instance);
 
@@ -1196,10 +1355,12 @@ static const struct mtk_phy_pdata tphy_v1_pdata = {
 
 static const struct mtk_phy_pdata tphy_v2_pdata = {
 	.avoid_rx_sen_degradation = false,
+	.sw_efuse_supported = true,
 	.version = MTK_PHY_V2,
 };
 
 static const struct mtk_phy_pdata tphy_v3_pdata = {
+	.sw_efuse_supported = true,
 	.version = MTK_PHY_V3,
 };
 
@@ -1210,6 +1371,7 @@ static const struct mtk_phy_pdata mt8173_pdata = {
 
 static const struct mtk_phy_pdata mt8195_pdata = {
 	.sw_pll_48m_to_26m = true,
+	.sw_efuse_supported = true,
 	.version = MTK_PHY_V3,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
