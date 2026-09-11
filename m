Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F10C88E5A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO3Z+rfhtP9zPk+uW3S74n4Yp421Xci3iN3KG5FpT1Y=; b=O3K7Qfq0nFBmO7cqdKyjiFWpiC
	MMVOAn3d9g4Igz3YeViU7yLOq5It0UvJgYAO231WWfH1Qz3SQyAP7wXOGwc+yRjzIaqPRaNzfjnUl
	4xIk+iUsU+YBBXFmloRiign+3Eng3mmIe6OeWWMiBFlxSSUFX+zEdJErseTSQtS0R1wrfFBfKLxq7
	GRxWEg8npNHOfFoJN8W3dTDtHAsUYz9pnhPs76blPfFIxrGUG/Sr1oZJdI6/C9TNxjajFsUK6/YJF
	MxADJ+9diGmOe7COpuzMxoJ9EGJwqetNzVu/O3QKDWRhwXydyXLrGIAFYvJAmz29RZ8wGbG+pB0aA
	cVjYnHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A93-00000000JEP-0iyt;
	Fri, 11 Sep 2026 22:54:57 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8q-00000000IzK-0mLu
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 22:54:46 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so1130905e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 15:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167282; x=1789772082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VO3Z+rfhtP9zPk+uW3S74n4Yp421Xci3iN3KG5FpT1Y=;
        b=M4NfA3gGD0INAg2D+kEcvuqm93+M689ZK+rL+JlSRIZiS9yq3U37U4fe4NQj+IbuEI
         GyHhdRTbpEdZlEdZUnXUyEWzW36jVi6WiupcPZCKa8Hmbk8jdOqSAzreCKwdVBbcvF6F
         q4CMNLA3Wl+SyhCIbPGrod9ab6kQcbElFLCkyY0OA7FD4QaZnTsZLTQRnZNFk8bEeluY
         glzufKm8RX0dQEiEdbKhADsTvHL9N0KEjPRendEO7yGCy3zurYm/QLajv9fbim+7FOjP
         4oRHKdZrr1CO4whYFZ3Ti2ZEK72Ijm2/0H1tarOaURBC0oB9EL+IQqulzwBNl7HomRgW
         XdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167282; x=1789772082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VO3Z+rfhtP9zPk+uW3S74n4Yp421Xci3iN3KG5FpT1Y=;
        b=avJ5hfzGfj9SsJ4bDIOvn6otNUyDllSwSTte8Alof4ghegXirTpUvDud06CwoQyfD/
         i/3Djvhp8PgY33nQ6PKgwef00CEh15BzkRzxD40N7mXBhmfRXuA31b+trBFEfMPN/tOy
         iJBmOPc254Hill51ixFI68yGArdqMQKktxMZv9VjopgyIPm57HPV8e+Q/hwPbmK+LMzN
         rcBIzBIXQAQfOOcLrWqm42DNO9oeKgTMgKm7rLMqVN5Etx2qlt2KdAeLJ4nscs0HISoe
         1Wo6s4/Mgzd65e8hxSPyPwunzuJRlrqnKt2VZH0WpRM3hRx33gbD6l0MTV6aJhiTql/p
         WDXA==
X-Forwarded-Encrypted: i=1; AKwUvBzjyeAtmI5JdFF16hVzas/lRTCn/hkEeKpClIYFwKuarjaEROY82n/2oGHR1VAvV/O8pg+zfUSvvufIKv3niw==@lists.infradead.org
X-Gm-Message-State: AFuF++nU521GL+d8/u/Y85BhBb1+n72GxzdPUQ/IZP4tq3kyNLv2SAgC
	NDck/gyvh2TM52dzDRr9iLEH3ol2TZv3vdiUv3rmaoxDYA7yfet3uwSK
X-Gm-Gg: AYBFou2VSNS1JXRWz6ZDsaBHM8okeuq+QGRzZqBovbl8jmgxlI0jPNTsMbdCkA6OBwE
	oYnx7dGkQoWfHEYLHlzdSzOJwpCE2H7Ze9nRdDlk42cTQ/51stegVZoMdxMii3WwUVE0Lll1DyT
	sXcezWUusjbwOWTR63bQGuQbHGtvMzJtNWNNFBdttdGnlWFBy8tkR/gkTgsiqyyD5aTvx5/THr+
	iWwbXfe9AW6ndBIWyjSVdl9kUPyD0/ul028Debd7YZnwTbOlM+FO1Ne1aWxPUnJd7PpMJcoxaAv
	3OPFuqryq7ubk6R1M4XWu1r0jucZyYkLccILM+RFv95a28atRmK207nfNSVF08+JzY9sbWUhJfF
	iBjLW4NeLwKhnjAfU0TupCW1PRODor4bWUL4MpCXy25APIQSFgH0mutOVVBi4eqSrwU4jlk6szZ
	uxt0JkAnjmw/mNCp2DzBZneM5sAkgC+V1BCAkfIAZNijQxOH5/8gamiPpIpPJHF99vpGY5PB38o
	dydEX4iGlG+Bmsh09X5JapAqeqULrxarJD2JXDpFodH4RAZxJ970xltjUZRQGIivmepAR2JlA==
X-Received: by 2002:a05:600c:34d0:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-49e6861515bmr34431535e9.5.1789167282034;
        Fri, 11 Sep 2026 15:54:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:40 -0700 (PDT)
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
Subject: [PATCH net-next v21 5/9] net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
Date: Sat, 12 Sep 2026 00:53:29 +0200
Message-ID: <20260911225414.225980-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_155444_314089_FC0C3592 
X-CRM114-Status: GOOD (  23.25  )
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


