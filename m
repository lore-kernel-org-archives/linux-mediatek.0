Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC18D15D8A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sdr3q6nNRjuIKptOGau1hasFAcJEBLZMYAAhIph/2y0=; b=pjn/9pP0kOzajxTOuCJt3FrrGs
	vv5ClcxGJDr3PKvsbErhJR2wBmtMQx1ioaiVSTiqhzD1URfLnQhPjQcyKkHddYaYNYj//v2CJlwRS
	247ChNMYjA7QUyGtMY2IY6r17GRQJHm5glukU1kZEMgMbXCjBRsm2pATGwqrh0rQUiNZG6d4zm8tu
	q/UJnN8SPrTRy7NEtIxHySmkQDmneZMxa8B5SdW7svl9NokwxGqp4EvJGi16Vm9ehAbfr6YsyukZY
	eIRAOMEFTKcw2atl+Zyf8u09gR+9VQVyy51gObXMOzqXR3W3JaE4KVXuVRImPYr+aVQTrX64EBXU5
	IUGbGpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sA3-00000007NVJ-42A7;
	Mon, 21 Oct 2024 13:09:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s3b-00000007MCJ-0GSy;
	Mon, 21 Oct 2024 13:02:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so45683675e9.1;
        Mon, 21 Oct 2024 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729515765; x=1730120565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sdr3q6nNRjuIKptOGau1hasFAcJEBLZMYAAhIph/2y0=;
        b=eqPHElAtyzJWMHI/5ZhlLpu3cGJc60gZDVBUMeSWEMKicIGcuE9c6SEo0RcTjY80xt
         4DwB8n5EmGRSYtCTfcuxjCMQ+YU2ECbyo93ImMGq+9s4doIhFfrsJhS3o4aeDRtPlrP9
         8xSnrUbUyL0cIsStjDGQ840aRg+eyLjypOYDtqgYd+Jo/sPsRvLmi1i3MvI387m1kZIF
         kxrcXIYd7JkdKIkAodOeXuhpauXpqXKbEJY7DDaTx19kwLRbrM3rGI3OHWn5XgEdoVpy
         Xb9VwkRfjXF9oZG05oIwB/oZxIW6JTw3gD2WQ6NXVJPym1Rh6QzyO5ltWF+qLhjPNRHC
         KLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515765; x=1730120565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sdr3q6nNRjuIKptOGau1hasFAcJEBLZMYAAhIph/2y0=;
        b=icN+f82QqW/j9sGlJrzoyJQiSF/LyIfmd4lx/rBz8qkaZp1sdvUiRYq4lAWGJRAM4n
         jucUuIQfc42m912dXp3sGnKzOokdQHAryQq0XyiDTrX3W//hdYO9cwuY9wCGFr6Xlcf6
         iqKY5Rf3/z0wA1AiD4y/DlzbOLk8mucv0hFCwEzPe4+JhLxnIuHAEknVqnfdhs0RcIxk
         /ejCEZDfK+YYNgBB7hI9ZSzHnKaHxl8/fcnjy8wiKO4GbujWp8jF5RFk45gBJgGZnoKv
         Shn2qzm7LGKE6h8rJXv5uU/MQx45sm15+gTOajtQB+Ph4tpmPaopwyiU17Rbu99dOrky
         OWyw==
X-Forwarded-Encrypted: i=1; AJvYcCU6ElWxYLvTZMxYBe9una3TdvUu106OEqDVJCHzghE9leks/gLcmfTEiINYbv9Z9TuvvQoSCDGVQvJJ4IJBRs2o@lists.infradead.org, AJvYcCVZ4KWtYaXp32Y+VGrenUXit5wUp+RqIDkp0Arz7EvLCIF1hehXwXMOb3Rm1oIxz48ab6IuQP2ZXQx41QyoIb8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTo+5iFMLufDejDbXnYgu/PtrdLMZ8f6vexMNGv0a9lfCu7eVD
	WvyfJ6tuqZ9kxCMtOtn4JzRFZYUYHhvYizHEJUSVFN1nLlDQ5u4U
X-Google-Smtp-Source: AGHT+IEsg6uJIcXF28DD/Av+navB79ctZNPCtCYigrWk6w4cagxFR80UEX0wWiSuxMyNYrzKmytHlQ==
X-Received: by 2002:a5d:5e11:0:b0:37c:d512:d427 with SMTP id ffacd0b85a97d-37edc481847mr4040861f8f.35.1729515764285;
        Mon, 21 Oct 2024 06:02:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcfdsm4295329f8f.103.2024.10.21.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:02:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next RFC PATCH 4/4] net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
Date: Mon, 21 Oct 2024 15:01:59 +0200
Message-ID: <20241021130209.15660-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021130209.15660-1-ansuelsmth@gmail.com>
References: <20241021130209.15660-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_060247_146351_3CBAD4AA 
X-CRM114-Status: GOOD (  20.77  )
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
AN8855 Switch.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                  |   1 +
 drivers/net/phy/Kconfig      |   5 +
 drivers/net/phy/Makefile     |   1 +
 drivers/net/phy/air_an8855.c | 187 +++++++++++++++++++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 drivers/net/phy/air_an8855.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e3077d9feee2..cf34add2a0bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -726,6 +726,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 F:	drivers/net/dsa/an8855.c
 F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
 
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index ee3ea0b56d48..1d474038ea7f 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -79,6 +79,11 @@ config SFP
 
 comment "MII PHY device drivers"
 
+config AIR_AN8855_PHY
+	tristate "Airoha AN8855 Internal Gigabit PHY"
+	help
+	  Currently supports the internal Airoha AN8855 Switch PHY.
+
 config AIR_EN8811H_PHY
 	tristate "Airoha EN8811H 2.5 Gigabit PHY"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 90f886844381..baba7894785b 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -35,6 +35,7 @@ obj-y				+= $(sfp-obj-y) $(sfp-obj-m)
 
 obj-$(CONFIG_ADIN_PHY)		+= adin.o
 obj-$(CONFIG_ADIN1100_PHY)	+= adin1100.o
+obj-$(CONFIG_AIR_AN8855_PHY)   += air_an8855.o
 obj-$(CONFIG_AIR_EN8811H_PHY)   += air_en8811h.o
 obj-$(CONFIG_AMD_PHY)		+= amd.o
 obj-$(CONFIG_AMCC_QT2025_PHY)	+= qt2025.o
diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
new file mode 100644
index 000000000000..d40b0b17a2e4
--- /dev/null
+++ b/drivers/net/phy/air_an8855.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/phy.h>
+#include <linux/module.h>
+#include <linux/bitfield.h>
+
+#define AN8855_PHY_PAGE_CTRL			0x1f
+#define   AN8855_PHY_NORMAL_PAGE		0x0
+#define   AN8855_PHY_EXT_PAGE			0x1
+
+#define AN8855_PHY_EXT_REG_14			0x14
+#define   AN8855_PHY_EN_DOWN_SHFIT		BIT(4)
+
+/* R50 Calibration regs in MDIO_MMD_VEND1 */
+#define AN8855_PHY_R500HM_RSEL_TX_AB		0x174
+#define AN8855_PHY_R50OHM_RSEL_TX_A_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_A		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_B_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_B		GENMASK(6, 0)
+#define AN8855_PHY_R500HM_RSEL_TX_CD		0x175
+#define AN8855_PHY_R50OHM_RSEL_TX_C_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_C		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_D_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_D		GENMASK(6, 0)
+
+/* PHY TX PAIR DELAY SELECT Register */
+#define PHY_TX_PAIR_DLY_SEL_GBE			0x013
+/* PHY ADC Register */
+#define PHY_RXADC_CTRL				0x0d8
+#define PHY_RXADC_REV_0				0x0d9
+#define PHY_RXADC_REV_1				0x0da
+
+#define AN8855_PHY_ID			0xc0ff0410
+
+static int an8855_config_init(struct phy_device *phydev)
+{
+	u8 calibration_data[4];
+	int ret;
+
+	memcpy(calibration_data, &phydev->dev_flags, sizeof(u32));
+
+	/* Enable HW auto downshift */
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
+	if (ret)
+		return ret;
+	ret = phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
+			   AN8855_PHY_EN_DOWN_SHFIT);
+	if (ret)
+		return ret;
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
+	if (ret)
+		return ret;
+
+	/* Enable Asymmetric Pause Capability */
+	ret = phy_set_bits(phydev, MII_ADVERTISE, ADVERTISE_PAUSE_ASYM);
+	if (ret)
+		return ret;
+
+	/* Disable EEE */
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+	if (ret)
+		return ret;
+
+	/* Apply calibration values, if needed. */
+	if (phydev->dev_flags) {
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R500HM_RSEL_TX_AB,
+				     AN8855_PHY_R50OHM_RSEL_TX_A | AN8855_PHY_R50OHM_RSEL_TX_B,
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_A, calibration_data[0]) |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_B, calibration_data[1]));
+		if (ret)
+			return ret;
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R500HM_RSEL_TX_CD,
+				     AN8855_PHY_R50OHM_RSEL_TX_C | AN8855_PHY_R50OHM_RSEL_TX_D,
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_C, calibration_data[2]) |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_D, calibration_data[3]));
+		if (ret)
+			return ret;
+	}
+
+	/* Apply values to decude signal noise */
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_TX_PAIR_DLY_SEL_GBE, 0x4040);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_RXADC_CTRL, 0x1010);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_RXADC_REV_0, 0x100);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_RXADC_REV_1, 0x100);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val;
+	int ret;
+
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
+	if (ret)
+		return ret;
+
+	val = phy_read(phydev, AN8855_PHY_EXT_REG_14);
+	*data = val & AN8855_PHY_EXT_REG_14 ? DOWNSHIFT_DEV_DEFAULT_COUNT :
+					      DOWNSHIFT_DEV_DISABLE;
+
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	int ret;
+
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
+	if (ret)
+		return ret;
+
+	if (cnt != DOWNSHIFT_DEV_DISABLE) {
+		ret = phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
+				   AN8855_PHY_EN_DOWN_SHFIT);
+		if (ret)
+			return ret;
+	} else {
+		ret = phy_clear_bits(phydev, AN8855_PHY_EXT_REG_14,
+				     AN8855_PHY_EN_DOWN_SHFIT);
+		if (ret)
+			return ret;
+	}
+
+	return phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
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
+static struct phy_driver An8855_driver[] = {
+{
+	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),
+	.name			= "Airoha AN8855 internal PHY",
+	/* PHY_GBIT_FEATURES */
+	.flags			= PHY_IS_INTERNAL,
+	.config_init		= an8855_config_init,
+	.soft_reset		= genphy_soft_reset,
+	.get_tunable		= an8855_get_tunable,
+	.set_tunable		= an8855_set_tunable,
+	.suspend		= genphy_suspend,
+	.resume			= genphy_resume,
+}, };
+
+module_phy_driver(An8855_driver);
+
+static struct mdio_device_id __maybe_unused An8855_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(AN8855_PHY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, An8855_tbl);
+
+MODULE_DESCRIPTION("Airoha AN8855 PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.45.2


