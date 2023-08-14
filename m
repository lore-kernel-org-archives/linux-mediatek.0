Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C976CEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 01:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EsfQjlw3DWJi8OkR80hMsVb3tkxvfhLiFIRraqdbWpk=; b=Tkzp0jMySdxh5IsEkA0axeBXv9
	uAAVUJcLBXS/yB1b/ZDDuINVWFsCvmiB8cv8ryVGJ1rVqDVU/SBrNIQX+AE9mtx5judjZuBev+Luz
	zTAXuwO+Ruci6T2DJRjbYO7ekPMcmjEuQP92F4veJrprQCawZApQIANPSWVM7CJp2IGjuh93hEm1d
	dNsCnaKabxUe2PoOOvZE/3A9MfZV+wr7mqPoQsnda1uWKDEoQxzPfpf7BglOlbrvlZYnZbsTcje3q
	PNnBTqwz0EE5Rcz3uJFl/sVg87Fk0ULSvbukUdylKEwOSPQZNDd05ufuXtumc3J6WCTS0LyM0Hk61
	zMMpIh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVMrx-00Fyba-1F;
	Mon, 14 Aug 2023 01:59:45 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVMrs-00FyaQ-1A;
	Mon, 14 Aug 2023 01:59:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qVMrL-0001Qy-2r;
	Mon, 14 Aug 2023 01:59:08 +0000
Date: Mon, 14 Aug 2023 02:58:14 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3] net: phy: mediatek-ge-soc: support PHY LEDs
Message-ID: <dc324d48c00cd7350f3a506eaa785324cae97372.1691977904.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_185940_715071_8C6D9722 
X-CRM114-Status: GOOD (  25.01  )
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

Implement netdev trigger and primitive bliking offloading as well as
simple set_brigthness function for both PHY LEDs of the in-SoC PHYs
found in MT7981 and MT7988.

For MT7988, read boottrap register and apply LED polarities accordingly
to get uniform behavior from all LEDs on MT7988.
This requires syscon phandle 'mediatek,pio' present in parenting MDIO bus
which should point to the syscon holding the boottrap register.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes since v2:
 * improve comment about 'boottrap' register
 * reorder initialization on MT7981 to avoid NULL pointer access

Changes since v1:
 * correct use of set_bit
 * cosmetics

 drivers/net/phy/mediatek-ge-soc.c | 435 +++++++++++++++++++++++++++++-
 1 file changed, 426 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index da512fab0eb0b..c5aafab660936 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
 #include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/phy.h>
+#include <linux/regmap.h>
 
 #define MTK_GPHY_ID_MT7981			0x03a29461
 #define MTK_GPHY_ID_MT7988			0x03a29481
@@ -206,9 +209,42 @@
 #define MTK_PHY_DA_TX_R50_PAIR_C		0x53f
 #define MTK_PHY_DA_TX_R50_PAIR_D		0x540
 
+/* Registers on MDIO_MMD_VEND2 */
+#define MTK_PHY_LED0_ON_CTRL			0x24
+#define MTK_PHY_LED1_ON_CTRL			0x26
+#define   MTK_PHY_LED_ON_MASK			GENMASK(6, 0)
+#define   MTK_PHY_LED_ON_LINK1000		BIT(0)
+#define   MTK_PHY_LED_ON_LINK100		BIT(1)
+#define   MTK_PHY_LED_ON_LINK10			BIT(2)
+#define   MTK_PHY_LED_ON_LINKDOWN		BIT(3)
+#define   MTK_PHY_LED_ON_FDX			BIT(4) /* Full duplex */
+#define   MTK_PHY_LED_ON_HDX			BIT(5) /* Half duplex */
+#define   MTK_PHY_LED_ON_FORCE_ON		BIT(6)
+#define   MTK_PHY_LED_ON_POLARITY		BIT(14)
+#define   MTK_PHY_LED_ON_ENABLE			BIT(15)
+
+#define MTK_PHY_LED0_BLINK_CTRL			0x25
+#define MTK_PHY_LED1_BLINK_CTRL			0x27
+#define   MTK_PHY_LED_BLINK_1000TX		BIT(0)
+#define   MTK_PHY_LED_BLINK_1000RX		BIT(1)
+#define   MTK_PHY_LED_BLINK_100TX		BIT(2)
+#define   MTK_PHY_LED_BLINK_100RX		BIT(3)
+#define   MTK_PHY_LED_BLINK_10TX		BIT(4)
+#define   MTK_PHY_LED_BLINK_10RX		BIT(5)
+#define   MTK_PHY_LED_BLINK_COLLISION		BIT(6)
+#define   MTK_PHY_LED_BLINK_RX_CRC_ERR		BIT(7)
+#define   MTK_PHY_LED_BLINK_RX_IDLE_ERR		BIT(8)
+#define   MTK_PHY_LED_BLINK_FORCE_BLINK		BIT(9)
+
+#define MTK_PHY_LED1_DEFAULT_POLARITIES		BIT(1)
+
 #define MTK_PHY_RG_BG_RASEL			0x115
 #define   MTK_PHY_RG_BG_RASEL_MASK		GENMASK(2, 0)
 
+/* 'boottrap' register reflecting the configuration of the 4 PHY LEDs */
+#define RG_GPIO_MISC_TPBANK0			0x6f0
+#define   RG_GPIO_MISC_TPBANK0_BOOTMODE		GENMASK(11, 8)
+
 /* These macro privides efuse parsing for internal phy. */
 #define EFS_DA_TX_I2MPB_A(x)			(((x) >> 0) & GENMASK(5, 0))
 #define EFS_DA_TX_I2MPB_B(x)			(((x) >> 6) & GENMASK(5, 0))
@@ -236,13 +272,6 @@ enum {
 	PAIR_D,
 };
 
-enum {
-	GPHY_PORT0,
-	GPHY_PORT1,
-	GPHY_PORT2,
-	GPHY_PORT3,
-};
-
 enum calibration_mode {
 	EFUSE_K,
 	SW_K
@@ -261,6 +290,19 @@ enum CAL_MODE {
 	SW_M
 };
 
+#define MTK_PHY_LED_STATE_FORCE_ON	0
+#define MTK_PHY_LED_STATE_FORCE_BLINK	1
+#define MTK_PHY_LED_STATE_NETDEV	2
+
+struct mtk_socphy_priv {
+	unsigned long		led_state;
+};
+
+struct mtk_socphy_shared {
+	u32			boottrap;
+	struct mtk_socphy_priv	priv[4];
+};
+
 static int mtk_socphy_read_page(struct phy_device *phydev)
 {
 	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
@@ -1071,6 +1113,371 @@ static int mt798x_phy_config_init(struct phy_device *phydev)
 	return mt798x_phy_calibration(phydev);
 }
 
+static int mt798x_phy_hw_led_on_set(struct phy_device *phydev, u8 index,
+				    bool on)
+{
+	unsigned int bit_on = MTK_PHY_LED_STATE_FORCE_ON + (index ? 16 : 0);
+	struct mtk_socphy_priv *priv = phydev->priv;
+	bool changed;
+
+	if (on)
+		changed = !test_and_set_bit(bit_on, &priv->led_state);
+	else
+		changed = !!test_and_clear_bit(bit_on, &priv->led_state);
+
+	changed |= !!test_and_clear_bit(MTK_PHY_LED_STATE_NETDEV +
+					(index ? 16 : 0), &priv->led_state);
+	if (changed)
+		return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
+				      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
+				      MTK_PHY_LED_ON_MASK,
+				      on ? MTK_PHY_LED_ON_FORCE_ON : 0);
+	else
+		return 0;
+}
+
+static int mt798x_phy_hw_led_blink_set(struct phy_device *phydev, u8 index,
+				       bool blinking)
+{
+	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK + (index ? 16 : 0);
+	struct mtk_socphy_priv *priv = phydev->priv;
+	bool changed;
+
+	if (blinking)
+		changed = !test_and_set_bit(bit_blink, &priv->led_state);
+	else
+		changed = !!test_and_clear_bit(bit_blink, &priv->led_state);
+
+	changed |= !!test_bit(MTK_PHY_LED_STATE_NETDEV +
+			      (index ? 16 : 0), &priv->led_state);
+	if (changed)
+		return phy_write_mmd(phydev, MDIO_MMD_VEND2, index ?
+				     MTK_PHY_LED1_BLINK_CTRL : MTK_PHY_LED0_BLINK_CTRL,
+				     blinking ? MTK_PHY_LED_BLINK_FORCE_BLINK : 0);
+	else
+		return 0;
+}
+
+static int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
+				    unsigned long *delay_on,
+				    unsigned long *delay_off)
+{
+	bool blinking = false;
+	int err = 0;
+
+	if (index > 1)
+		return -EINVAL;
+
+	if (delay_on && delay_off && (*delay_on > 0) && (*delay_off > 0)) {
+		blinking = true;
+		*delay_on = 50;
+		*delay_off = 50;
+	}
+
+	err = mt798x_phy_hw_led_blink_set(phydev, index, blinking);
+	if (err)
+		return err;
+
+	return mt798x_phy_hw_led_on_set(phydev, index, false);
+}
+
+static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
+					 u8 index, enum led_brightness value)
+{
+	int err;
+
+	err = mt798x_phy_hw_led_blink_set(phydev, index, false);
+	if (err)
+		return err;
+
+	return mt798x_phy_hw_led_on_set(phydev, index, (value != LED_OFF));
+}
+
+static const unsigned long supported_triggers = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+						 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+						 BIT(TRIGGER_NETDEV_LINK)        |
+						 BIT(TRIGGER_NETDEV_LINK_10)     |
+						 BIT(TRIGGER_NETDEV_LINK_100)    |
+						 BIT(TRIGGER_NETDEV_LINK_1000)   |
+						 BIT(TRIGGER_NETDEV_RX)          |
+						 BIT(TRIGGER_NETDEV_TX));
+
+static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
+					  unsigned long rules)
+{
+	if (index > 1)
+		return -EINVAL;
+
+	/* All combinations of the supported triggers are allowed */
+	if (rules & ~supported_triggers)
+		return -EOPNOTSUPP;
+
+	return 0;
+};
+
+static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
+					 unsigned long *rules)
+{
+	unsigned int bit_blink = MTK_PHY_LED_STATE_FORCE_BLINK + (index ? 16 : 0);
+	unsigned int bit_netdev = MTK_PHY_LED_STATE_NETDEV + (index ? 16 : 0);
+	unsigned int bit_on = MTK_PHY_LED_STATE_FORCE_ON + (index ? 16 : 0);
+	struct mtk_socphy_priv *priv = phydev->priv;
+	int on, blink;
+
+	if (index > 1)
+		return -EINVAL;
+
+	on = phy_read_mmd(phydev, MDIO_MMD_VEND2,
+			  index ? MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL);
+
+	if (on < 0)
+		return -EIO;
+
+	blink = phy_read_mmd(phydev, MDIO_MMD_VEND2,
+			     index ? MTK_PHY_LED1_BLINK_CTRL :
+				     MTK_PHY_LED0_BLINK_CTRL);
+	if (blink < 0)
+		return -EIO;
+
+	if ((on & (MTK_PHY_LED_ON_LINK1000 | MTK_PHY_LED_ON_LINK100 |
+		   MTK_PHY_LED_ON_LINK10)) ||
+	    (blink & (MTK_PHY_LED_BLINK_1000RX | MTK_PHY_LED_BLINK_100RX |
+		      MTK_PHY_LED_BLINK_10RX | MTK_PHY_LED_BLINK_1000TX |
+		      MTK_PHY_LED_BLINK_100TX | MTK_PHY_LED_BLINK_10TX)))
+		set_bit(bit_netdev, &priv->led_state);
+	else
+		clear_bit(bit_netdev, &priv->led_state);
+
+	if (on & MTK_PHY_LED_ON_FORCE_ON)
+		set_bit(bit_on, &priv->led_state);
+	else
+		clear_bit(bit_on, &priv->led_state);
+
+	if (blink & MTK_PHY_LED_BLINK_FORCE_BLINK)
+		set_bit(bit_blink, &priv->led_state);
+	else
+		clear_bit(bit_blink, &priv->led_state);
+
+	if (!rules)
+		return 0;
+
+	if (on & (MTK_PHY_LED_ON_LINK1000 | MTK_PHY_LED_ON_LINK100 | MTK_PHY_LED_ON_LINK10))
+		*rules |= BIT(TRIGGER_NETDEV_LINK);
+
+	if (on & MTK_PHY_LED_ON_LINK10)
+		*rules |= BIT(TRIGGER_NETDEV_LINK_10);
+
+	if (on & MTK_PHY_LED_ON_LINK100)
+		*rules |= BIT(TRIGGER_NETDEV_LINK_100);
+
+	if (on & MTK_PHY_LED_ON_LINK1000)
+		*rules |= BIT(TRIGGER_NETDEV_LINK_1000);
+
+	if (on & MTK_PHY_LED_ON_FDX)
+		*rules |= BIT(TRIGGER_NETDEV_FULL_DUPLEX);
+
+	if (on & MTK_PHY_LED_ON_HDX)
+		*rules |= BIT(TRIGGER_NETDEV_HALF_DUPLEX);
+
+	if (blink & (MTK_PHY_LED_BLINK_1000RX | MTK_PHY_LED_BLINK_100RX | MTK_PHY_LED_BLINK_10RX))
+		*rules |= BIT(TRIGGER_NETDEV_RX);
+
+	if (blink & (MTK_PHY_LED_BLINK_1000TX | MTK_PHY_LED_BLINK_100TX | MTK_PHY_LED_BLINK_10TX))
+		*rules |= BIT(TRIGGER_NETDEV_TX);
+
+	return 0;
+};
+
+static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
+					 unsigned long rules)
+{
+	unsigned int bit_netdev = MTK_PHY_LED_STATE_NETDEV + (index ? 16 : 0);
+	struct mtk_socphy_priv *priv = phydev->priv;
+	u16 on = 0, blink = 0;
+	int ret;
+
+	if (index > 1)
+		return -EINVAL;
+
+	if (rules & BIT(TRIGGER_NETDEV_FULL_DUPLEX))
+		on |= MTK_PHY_LED_ON_FDX;
+
+	if (rules & BIT(TRIGGER_NETDEV_HALF_DUPLEX))
+		on |= MTK_PHY_LED_ON_HDX;
+
+	if (rules & (BIT(TRIGGER_NETDEV_LINK_10) | BIT(TRIGGER_NETDEV_LINK)))
+		on |= MTK_PHY_LED_ON_LINK10;
+
+	if (rules & (BIT(TRIGGER_NETDEV_LINK_100) | BIT(TRIGGER_NETDEV_LINK)))
+		on |= MTK_PHY_LED_ON_LINK100;
+
+	if (rules & (BIT(TRIGGER_NETDEV_LINK_1000) | BIT(TRIGGER_NETDEV_LINK)))
+		on |= MTK_PHY_LED_ON_LINK1000;
+
+	if (rules & BIT(TRIGGER_NETDEV_RX)) {
+		blink |= MTK_PHY_LED_BLINK_10RX  |
+			 MTK_PHY_LED_BLINK_100RX |
+			 MTK_PHY_LED_BLINK_1000RX;
+	}
+
+	if (rules & BIT(TRIGGER_NETDEV_TX)) {
+		blink |= MTK_PHY_LED_BLINK_10TX  |
+			 MTK_PHY_LED_BLINK_100TX |
+			 MTK_PHY_LED_BLINK_1000TX;
+	}
+
+	if (blink || on)
+		set_bit(bit_netdev, &priv->led_state);
+	else
+		clear_bit(bit_netdev, &priv->led_state);
+
+	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
+				MTK_PHY_LED1_ON_CTRL :
+				MTK_PHY_LED0_ON_CTRL,
+			     MTK_PHY_LED_ON_FDX     |
+			     MTK_PHY_LED_ON_HDX     |
+			     MTK_PHY_LED_ON_LINK10  |
+			     MTK_PHY_LED_ON_LINK100 |
+			     MTK_PHY_LED_ON_LINK1000,
+			     on);
+
+	if (ret)
+		return ret;
+
+	return phy_write_mmd(phydev, MDIO_MMD_VEND2, index ?
+				MTK_PHY_LED1_BLINK_CTRL :
+				MTK_PHY_LED0_BLINK_CTRL, blink);
+};
+
+static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
+{
+	struct mtk_socphy_shared *priv = phydev->shared->priv;
+	u32 polarities;
+
+	if (led_num == 0)
+		polarities = ~(priv->boottrap);
+	else
+		polarities = MTK_PHY_LED1_DEFAULT_POLARITIES;
+
+	if (polarities & BIT(phydev->mdio.addr))
+		return true;
+
+	return false;
+}
+
+static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
+{
+	struct pinctrl *pinctrl;
+	int index;
+
+	/* Setup LED polarity according to bootstrap use of LED pins */
+	for (index = 0; index < 2; ++index)
+		phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
+				MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
+			       MTK_PHY_LED_ON_POLARITY,
+			       mt7988_phy_led_get_polarity(phydev, index) ?
+				MTK_PHY_LED_ON_POLARITY : 0);
+
+	/* Only now setup pinctrl to avoid bogus blinking */
+	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
+	if (IS_ERR(pinctrl))
+		dev_err(&phydev->mdio.bus->dev, "Failed to setup PHY LED pinctrl\n");
+
+	return 0;
+}
+
+static int mt7988_phy_probe_shared(struct phy_device *phydev)
+{
+	struct device_node *np = dev_of_node(&phydev->mdio.bus->dev);
+	struct mtk_socphy_shared *shared = phydev->shared->priv;
+	struct regmap *regmap;
+	u32 reg;
+	int ret;
+
+	/* The LED0 of the 4 PHYs in MT7988 are wired to SoC pins LED_A, LED_B,
+	 * LED_C and LED_D respectively. At the same time those pins are used to
+	 * bootstrap configuration of the reference clock source (LED_A),
+	 * DRAM DDRx16b x2/x1 (LED_B) and boot device (LED_C, LED_D).
+	 * In practise this is done using a LED and a resistor pulling the pin
+	 * either to GND or to VIO.
+	 * The detected value at boot time is accessible at run-time using the
+	 * TPBANK0 register located in the gpio base of the pinctrl, in order
+	 * to read it here it needs to be referenced by a phandle called
+	 * 'mediatek,pio' in the MDIO bus hosting the PHY.
+	 * The 4 bits in TPBANK0 are kept as package shared data and are used to
+	 * set LED polarity for each of the LED0.
+	 */
+	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,pio");
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = regmap_read(regmap, RG_GPIO_MISC_TPBANK0, &reg);
+	if (ret)
+		return ret;
+
+	shared->boottrap = FIELD_GET(RG_GPIO_MISC_TPBANK0_BOOTMODE, reg);
+
+	return 0;
+}
+
+static void mt798x_phy_leds_state_init(struct phy_device *phydev)
+{
+	int i;
+
+	for (i = 0; i < 2; ++i)
+		mt798x_phy_led_hw_control_get(phydev, i, NULL);
+}
+
+static int mt7988_phy_probe(struct phy_device *phydev)
+{
+	struct mtk_socphy_shared *shared;
+	struct mtk_socphy_priv *priv;
+	int err;
+
+	if (phydev->mdio.addr > 3)
+		return -EINVAL;
+
+	err = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
+				    sizeof(struct mtk_socphy_shared));
+	if (err)
+		return err;
+
+	if (phy_package_probe_once(phydev)) {
+		err = mt7988_phy_probe_shared(phydev);
+		if (err)
+			return err;
+	}
+
+	shared = phydev->shared->priv;
+	priv = &shared->priv[phydev->mdio.addr];
+
+	phydev->priv = priv;
+
+	mt798x_phy_leds_state_init(phydev);
+
+	err = mt7988_phy_fix_leds_polarities(phydev);
+	if (err)
+		return err;
+
+	return mt798x_phy_calibration(phydev);
+}
+
+static int mt7981_phy_probe(struct phy_device *phydev)
+{
+	struct mtk_socphy_priv *priv;
+
+	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(struct mtk_socphy_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	phydev->priv = priv;
+
+	mt798x_phy_leds_state_init(phydev);
+
+	return mt798x_phy_calibration(phydev);
+}
+
 static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
@@ -1078,11 +1485,16 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.config_init	= mt798x_phy_config_init,
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.probe		= mt798x_phy_calibration,
+		.probe		= mt7981_phy_probe,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
 		.read_page	= mtk_socphy_read_page,
 		.write_page	= mtk_socphy_write_page,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 	},
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988),
@@ -1090,11 +1502,16 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.config_init	= mt798x_phy_config_init,
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.probe		= mt798x_phy_calibration,
+		.probe		= mt7988_phy_probe,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
 		.read_page	= mtk_socphy_read_page,
 		.write_page	= mtk_socphy_write_page,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 	},
 };
 
-- 
2.41.0


