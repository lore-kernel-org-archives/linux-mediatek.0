Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F04C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO3Z+rfhtP9zPk+uW3S74n4Yp421Xci3iN3KG5FpT1Y=; b=iLCaftt02474yqw8s6qRs37IHa
	DAgi3pQ4PVLcXz9klPb96krpLc9WlwTtFW1PJPS8uiBv3uN8VDceGVfner5SbbLbHo2SMbMybvhma
	SZbMVdH5+5Vdfa5HZTWiyvirxD5HDRgoDgHV0/tpB5relobr81orsShANiaw1gm0x+OuK8LHMVh+R
	wFEcxdn/mVmw73GSey8lLNh768ElaKCP5FiT0KiEBvqJM4HoC0OQBXNHic9xTYLWeWUddO2VklYcK
	EhwlZUrSt2PZMzdWUuxaA1xUqFN6fQyXdG1KkCBwqG1OTuWephT4sWoLRxzydESIBImULi3+a1HPU
	78cM1vNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsad-00000005ehr-3XP4;
	Mon, 17 Aug 2026 08:21:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaV-00000005eWJ-3BMw
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4956242332dso32903915e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954854; x=1787559654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VO3Z+rfhtP9zPk+uW3S74n4Yp421Xci3iN3KG5FpT1Y=;
        b=PdxgkuxiwHhTRGeXrnbcmV72K3YrJSFMFgCUfNQ3SHqrVP+WWLZ5Qkg84S/J+aZLNg
         45bsPTtuZwA+hNin/EMEpG9/yswJcPp+YjqhY08+fmKrn8KzKJOViIMhwpqgjoZvEIpi
         uEpaEDuyTLNTy6JSl59BudL/mVJ80WANq2RL5cTWAo9knRJ0rWjEi3nfHs3LJyr8fqWQ
         RXdAwpe8ZEi5g/abePtyNr4URNyQKDyM9gGupIF0hs0+wpwuiifsVmsfjXJh9ypakp7C
         toSMG7E/q+nhy4g0t4ptAjkNE5pK2diNYclhGuCW5/dPor9ul4Qjo80SQ0jRfFv6X1pL
         Xtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954854; x=1787559654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VO3Z+rfhtP9zPk+uW3S74n4Yp421Xci3iN3KG5FpT1Y=;
        b=US4vUiDeDhVuOExrOLMg71ijhd7Hihq8ehl9WN0oBJOtV4la9uGsZuN6zT5O5mxO5g
         gW5Imjm8rISeXpQ8X6ZGPpWhSz17S08K2G9Qbi7+/D/oNTbM0TadXFV8y8mrK5VwoAsi
         gSwpaZFdAapK/OfNh43ornYk2559+YcdH6zUGSMkoTQp5n6k5Fp9ZZfvPKBkcVACSh2G
         1gckCOBFSsyN6bfR2oAZVk4IMApCknVBrRlf+ON3v/UrOZeH5DfU7xsvkyhm8Ci+9KnF
         CcoxEqLtOvf9YS/3ZPDdH4djOhrNkS+FiUfZkDpAAh3A/L8bzrbvFbtsgYv0ZuUh/0y0
         v06g==
X-Forwarded-Encrypted: i=1; AHgh+Rr3YcsH6bl+Ltiqhu2HYMk1tV78ILW7YErC7o0ujSUDpaaQVjUvBH11MLdU8WHViXOr/YojiJd4/KHxKMXSLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfVfGDLzbE9eii4QBtL1frNgZslS5wdSvZ5KSVJw7NWDv9uyqZ
	BbTcNYrK58Vm23KFvXdWSzUT2xpZ7Q3k3KYX21EIg9llzh2tcLR78D11VdvVuRdL
X-Gm-Gg: AR+sD13sQ8f4cRPyaSobdmi+XzhLFt8/1XIZCAZ8JFM6tINKfWRUBeRc5lO6HELsfZj
	ACRGrXycm7KxfXD5KnlM1PtdSqxoNIF4XICSX28zgfIR5V2uBuzPNfGvADO61yDxhEum/pEh0Fl
	TB+MLfr6Tx/9E5q9FT1yWY0cqJblRoEl2fa4R7BDy7zPagQXo9YauBW3WQlPZGvk3DDMno0IfQe
	HN2yjZGPMZwcbKVCX8DCJvCXZGu2EuqqIEM+9lcnoFb6qhuYrGtXMg8vsll8TfGTpDv3+rOCnu5
	gDSNNol5Ge5e6y7uKHMc/2u6OXMmmfzdLb6evn6k7eN56eVUKkSm4aUQzS/uVhosxZS/32gRs8Q
	8D/hrkIky34kwb2tzs2svtJr6zABCXLvspaDhWAFFZeUlDA+WWyKDmeYxabmT0ulaV0Jj9WTDLQ
	OVahL13q5gLmpRzXOtxUCn4gIJZLAnBY7D8CNe2X19hy47dwNmRtimc+vbVWURPTC5EJm43sPKY
	Bl8Arpn+9D1O2TPKdTHa+ywpkRyEqSAoMb8wMTLj2oKnw94641IidU3HWsuUQ==
X-Received: by 2002:a7b:c4d2:0:b0:499:8191:62c7 with SMTP id 5b1f17b1804b1-499879b38dcmr270297735e9.18.1786954853881;
        Mon, 17 Aug 2026 01:20:53 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 05/10] net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
Date: Mon, 17 Aug 2026 10:20:27 +0200
Message-ID: <20260817082034.20326-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012055_862210_A47B6461 
X-CRM114-Status: GOOD (  23.16  )
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

Add support for Airoha AN8855 Internal Switch Gigabit PHY.

This is a simple PHY driver to configure and calibrate the PHY for the
AN8855 Switch with the use of NVMEM cells.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/Kconfig      |   6 +
 drivers/net/phy/Makefile     |   1 +
 drivers/net/phy/air_an8855.c | 275 +++++++++++++++++++++++++++++++++++
 3 files changed, 282 insertions(+)
 create mode 100644 drivers/net/phy/air_an8855.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index b4ef927fd4a6..b088b7eab0c3 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -96,6 +96,12 @@ config AIR_AN8801_PHY
 	help
 	  Currently supports the Airoha AN8801R PHY.
 
+config AIR_AN8855_PHY
+	tristate "Airoha AN8855 Internal Gigabit PHY"
+	depends on NVMEM || !NVMEM
+	help
+	  Currently supports the internal Airoha AN8855 Switch PHY.
+
 config AIR_EN8811H_PHY
 	tristate "Airoha EN8811H 2.5 Gigabit PHY"
 	select AIR_NET_PHYLIB
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 25c4a3c2429f..dcbc261e21ef 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_ADIN_PHY)		+= adin.o
 obj-$(CONFIG_ADIN1100_PHY)	+= adin1100.o
 obj-$(CONFIG_ADIN1140_PHY)	+= adin1140-phy.o
 obj-$(CONFIG_AIR_AN8801_PHY)	+= air_an8801.o
+obj-$(CONFIG_AIR_AN8855_PHY)	+= air_an8855.o
 obj-$(CONFIG_AIR_EN8811H_PHY)   += air_en8811h.o
 obj-$(CONFIG_AIR_NET_PHYLIB)	+= air_phy_lib.o
 obj-$(CONFIG_AMD_PHY)		+= amd.o
diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
new file mode 100644
index 000000000000..bc22256fd5f9
--- /dev/null
+++ b/drivers/net/phy/air_an8855.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+
+#define AN8855_PHY_SELECT_PAGE			0x1f
+#define   AN8855_PHY_PAGE			GENMASK(2, 0)
+#define   AN8855_PHY_PAGE_STANDARD		FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x0)
+#define   AN8855_PHY_PAGE_EXTENDED_1		FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x1)
+
+/* MII Registers Page 1 */
+#define AN8855_PHY_EXT_REG_14			0x14
+#define   AN8855_PHY_EN_DOWN_SHIFT		BIT(4)
+
+/* R50 Calibration regs in MDIO_MMD_VEND1 */
+#define AN8855_PHY_R50OHM_RSEL_TX_AB		0x174
+#define AN8855_PHY_R50OHM_RSEL_TX_A_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_A		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_B_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_B		GENMASK(6, 0)
+#define AN8855_PHY_R50OHM_RSEL_TX_CD		0x175
+#define AN8855_PHY_R50OHM_RSEL_TX_C_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_C		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_D_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_D		GENMASK(6, 0)
+
+#define AN8855_SWITCH_EFUSE_R50O		GENMASK(30, 24)
+
+/* PHY TX PAIR DELAY SELECT Register */
+#define AN8855_PHY_TX_PAIR_DLY_SEL_GBE		0x013
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE GENMASK(14, 12)
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_B_GBE GENMASK(10, 8)
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE GENMASK(6, 4)
+#define   AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_D_GBE GENMASK(2, 0)
+/* PHY ADC Register */
+#define AN8855_PHY_RXADC_CTRL			0x0d8
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_A	BIT(12)
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_B	BIT(8)
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_C	BIT(4)
+#define   AN8855_PHY_RG_AD_SAMPLE_PHSEL_D	BIT(0)
+#define AN8855_PHY_RXADC_REV_0			0x0d9
+#define   AN8855_PHY_RG_AD_RESERVE0_A		GENMASK(15, 8)
+#define   AN8855_PHY_RG_AD_RESERVE0_B		GENMASK(7, 0)
+#define AN8855_PHY_RXADC_REV_1			0x0da
+#define   AN8855_PHY_RG_AD_RESERVE0_C		GENMASK(15, 8)
+#define   AN8855_PHY_RG_AD_RESERVE0_D		GENMASK(7, 0)
+
+#define AN8855_PHY_ID				0xc0ff0410
+
+struct air_an8855_priv {
+	bool needs_calibration;
+	u8 calibration_data[4];
+};
+
+static const u8 dsa_r50ohm_table[] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 127, 127, 127, 127, 126, 122, 117,
+	112, 109, 104, 101,  97,  94,  90,  88,  84,  80,
+	78,  74,  72,  68,  66,  64,  61,  58,  56,  53,
+	51,  48,  47,  44,  42,  40,  38,  36,  34,  32,
+	31,  28,  27,  24,  24,  22,  20,  18,  16,  16,
+	14,  12,  11,   9
+};
+
+static int an8855_get_r50ohm_val(struct device *dev, const char *calib_name,
+				 u8 *dest)
+{
+	u32 shift_sel, val;
+	int ret;
+	int i;
+
+	ret = nvmem_cell_read_u32(dev, calib_name, &val);
+	if (ret)
+		return ret;
+
+	shift_sel = FIELD_GET(AN8855_SWITCH_EFUSE_R50O, val);
+	for (i = 0; i < ARRAY_SIZE(dsa_r50ohm_table); i++)
+		if (dsa_r50ohm_table[i] == shift_sel)
+			break;
+
+	if (i < 8 || i >= ARRAY_SIZE(dsa_r50ohm_table))
+		*dest = dsa_r50ohm_table[25];
+	else
+		*dest = dsa_r50ohm_table[i - 8];
+
+	return 0;
+}
+
+static int an8855_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct air_an8855_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->needs_calibration = of_property_present(dev->of_node,
+						      "nvmem-cells");
+
+	if (priv->needs_calibration) {
+		int ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_a", &priv->calibration_data[0]);
+		if (ret)
+			return ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_b", &priv->calibration_data[1]);
+		if (ret)
+			return ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_c", &priv->calibration_data[2]);
+		if (ret)
+			return ret;
+
+		ret = an8855_get_r50ohm_val(dev, "tx_d", &priv->calibration_data[3]);
+		if (ret)
+			return ret;
+	}
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
+static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val;
+
+	val = phy_read_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1, AN8855_PHY_EXT_REG_14);
+	if (val < 0)
+		return val;
+
+	*data = val & AN8855_PHY_EN_DOWN_SHIFT ? DOWNSHIFT_DEV_DEFAULT_COUNT :
+						 DOWNSHIFT_DEV_DISABLE;
+
+	return 0;
+}
+
+static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	u16 ds = cnt != DOWNSHIFT_DEV_DISABLE ? AN8855_PHY_EN_DOWN_SHIFT : 0;
+
+	return phy_modify_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
+				AN8855_PHY_EXT_REG_14, AN8855_PHY_EN_DOWN_SHIFT,
+				ds);
+}
+
+static int an8855_config_init(struct phy_device *phydev)
+{
+	struct air_an8855_priv *priv = phydev->priv;
+	int ret;
+
+	/* Enable HW auto downshift */
+	ret = an8855_set_downshift(phydev, DOWNSHIFT_DEV_DEFAULT_COUNT);
+	if (ret)
+		return ret;
+
+	if (priv->needs_calibration) {
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R50OHM_RSEL_TX_AB,
+				     AN8855_PHY_R50OHM_RSEL_TX_A_EN | AN8855_PHY_R50OHM_RSEL_TX_A |
+				     AN8855_PHY_R50OHM_RSEL_TX_B_EN | AN8855_PHY_R50OHM_RSEL_TX_B,
+				     AN8855_PHY_R50OHM_RSEL_TX_A_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_A,
+						priv->calibration_data[0]) |
+				     AN8855_PHY_R50OHM_RSEL_TX_B_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_B,
+						priv->calibration_data[1]));
+		if (ret)
+			return ret;
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R50OHM_RSEL_TX_CD,
+				     AN8855_PHY_R50OHM_RSEL_TX_C_EN | AN8855_PHY_R50OHM_RSEL_TX_C |
+				     AN8855_PHY_R50OHM_RSEL_TX_D_EN | AN8855_PHY_R50OHM_RSEL_TX_D,
+				     AN8855_PHY_R50OHM_RSEL_TX_C_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_C,
+						priv->calibration_data[2]) |
+				     AN8855_PHY_R50OHM_RSEL_TX_D_EN |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_D,
+						priv->calibration_data[3]));
+		if (ret)
+			return ret;
+	}
+
+	/* Apply values to reduce signal noise */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_TX_PAIR_DLY_SEL_GBE,
+			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE |
+			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE,
+			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE, 0x4) |
+			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE, 0x4));
+	if (ret)
+		return ret;
+	ret = phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_CTRL,
+			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_A |
+			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_C);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_0,
+			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1));
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_1,
+			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_C, 0x1));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int an8855_get_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna, void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return an8855_get_downshift(phydev, data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int an8855_set_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna, const void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return an8855_set_downshift(phydev, *(const u8 *)data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int an8855_read_page(struct phy_device *phydev)
+{
+	return __phy_read(phydev, AN8855_PHY_SELECT_PAGE);
+}
+
+static int an8855_write_page(struct phy_device *phydev, int page)
+{
+	return __phy_write(phydev, AN8855_PHY_SELECT_PAGE, page);
+}
+
+static struct phy_driver an8855_driver[] = {
+{
+	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),
+	.name			= "Airoha AN8855 internal PHY",
+	/* PHY_GBIT_FEATURES */
+	.flags			= PHY_IS_INTERNAL,
+	.probe			= an8855_probe,
+	.config_init		= an8855_config_init,
+	.soft_reset		= genphy_soft_reset,
+	.get_tunable		= an8855_get_tunable,
+	.set_tunable		= an8855_set_tunable,
+	.suspend		= genphy_suspend,
+	.resume			= genphy_resume,
+	.read_page		= an8855_read_page,
+	.write_page		= an8855_write_page,
+}, };
+
+module_phy_driver(an8855_driver);
+
+static struct mdio_device_id __maybe_unused an8855_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(AN8855_PHY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, an8855_tbl);
+
+MODULE_DESCRIPTION("Airoha AN8855 PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.53.0


