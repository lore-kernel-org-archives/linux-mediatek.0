Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F29CC04FFE
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 06:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00etUnq8h84295668L+7fCbakB1NovNdV7mbzC9TFgo=; b=iitEq9Ma2KUVlhuRiWxPSW3zJN
	XI/NTOpgpkafkoZpdKzRNslHZZsvOwJrWF/Y5Nr/PyA1kmjiX6TsTVtgRPzwb8/ycJ4ZMAtq3cfH+
	4iHrQ4rx83Jd6BWW8+dkxpcT1naGPLg6ps4tDMxerdUIal6ksSk8SOeyIyL5Rq9Y310scR05XVeh8
	98UDbSRP6CIYUD3wY9F7EmTqaeyWeGjpKjfbOxWajdcoR1N4ADLPo4MafvmvoaHlgOgdyZ24OELTz
	bg46dmJxO/or/dLO9E5FRQ6pSJgAwFGlRJ2xL0Om8mZbMyF4g3drheLOB8LS9Q4euxeZkHeRDm1si
	HM4j0SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvt2K-00000004jDU-2jhG;
	Sun, 14 Apr 2024 06:08:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvt28-00000004j7D-0iiB;
	Sun, 14 Apr 2024 06:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9164FCE062A;
	Sun, 14 Apr 2024 06:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5C89C32781;
	Sun, 14 Apr 2024 06:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713074884;
	bh=YQC7tIJqApyFyKNsmdhzWb9nxWLvyUKPAXMYvJOWBmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FHlJxQyu8FTYQ9i04/DWwOtkv2jY3O6nyN89jpGGfBzvu/xVVx4qZv+yuEO/Yi6Bs
	 v460nMQGR+NT8eESH5Z0YTPgHguLt42QJq0jEiVF9SKzuPkwNq4MhIIdUsUQUfKXdS
	 bz3lut+F62xh2Qdn7lCOnui2bI956FkX7o+wL0bIqTP1cP2wFrcAlbFu1NlqO2/Kd5
	 vWmG+XuvCoKFsD4OdtfB85wGrZGBI1j6PGfzrEaIQt8fXeEkA0b+XYho7OEhqqH4FU
	 M2TWDyGAqK8272BtE1TMl6o5YoVzSlfMw46tWdjM42fIXz7EYS90urCZZ58j7wdM3f
	 9pjh872IF+WyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17D9C04FFE;
	Sun, 14 Apr 2024 06:08:04 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Sun, 14 Apr 2024 09:07:41 +0300
Subject: [PATCH net-next v2 1/2] net: dsa: mt7530-mdio: read PHY address of
 switch from device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-1-1a7649c4d3b6@arinc9.com>
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com>
In-Reply-To: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713074874; l=8342;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=LJr+weQDs1gn0Ez7GnkPtUaVkB4Ioqodo2W/lus+HeU=;
 b=OR0HlKDRQqUwPstnz7eBxs2l0ZY5qApbFFUhvPYpZLquMp9Wlh1Yk2kmwEx3Qm7f2LrTMwPsG
 zdOSsmQg8piBObnv/xo4F5b09EJnAO0XxNj5ht1KKz4jEMZQbMBTCLI
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_230808_623747_E014FD34 
X-CRM114-Status: GOOD (  18.96  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Read the PHY address the switch listens on from the reg property of the
switch node on the device tree. This change brings support for MT7530
switches on boards with such bootstrapping configuration where the switch
listens on a different PHY address than the hardcoded PHY address on the
driver, 31.

As described on the "MT7621 Programming Guide v0.4" document, the MT7530
switch and its PHYs can be configured to listen on the range of 7-12,
15-20, 23-28, and 31 and 0-4 PHY addresses.

There are operations where the switch PHY registers are used. For the PHY
address of the control PHY, transform the MT753X_CTRL_PHY_ADDR constant
into a macro and use it. The PHY address for the control PHY is 0 when the
switch listens on 31. In any other case, it is one greater than the PHY
address the switch listens on.

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530-mdio.c | 28 ++++++++++++++--------------
 drivers/net/dsa/mt7530.c      | 35 ++++++++++++++++++++++-------------
 drivers/net/dsa/mt7530.h      |  4 +++-
 3 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index fa3ee85a99c1..599b28c8a340 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -18,7 +18,8 @@
 static int
 mt7530_regmap_write(void *context, unsigned int reg, unsigned int val)
 {
-	struct mii_bus *bus = context;
+	struct mt7530_priv *priv = context;
+	struct mii_bus *bus = priv->bus;
 	u16 page, r, lo, hi;
 	int ret;
 
@@ -27,36 +28,35 @@ mt7530_regmap_write(void *context, unsigned int reg, unsigned int val)
 	lo = val & 0xffff;
 	hi = val >> 16;
 
-	/* MT7530 uses 31 as the pseudo port */
-	ret = bus->write(bus, 0x1f, 0x1f, page);
+	ret = bus->write(bus, priv->phy_addr, 0x1f, page);
 	if (ret < 0)
 		return ret;
 
-	ret = bus->write(bus, 0x1f, r,  lo);
+	ret = bus->write(bus, priv->phy_addr, r, lo);
 	if (ret < 0)
 		return ret;
 
-	ret = bus->write(bus, 0x1f, 0x10, hi);
+	ret = bus->write(bus, priv->phy_addr, 0x10, hi);
 	return ret;
 }
 
 static int
 mt7530_regmap_read(void *context, unsigned int reg, unsigned int *val)
 {
-	struct mii_bus *bus = context;
+	struct mt7530_priv *priv = context;
+	struct mii_bus *bus = priv->bus;
 	u16 page, r, lo, hi;
 	int ret;
 
 	page = (reg >> 6) & 0x3ff;
 	r = (reg >> 2) & 0xf;
 
-	/* MT7530 uses 31 as the pseudo port */
-	ret = bus->write(bus, 0x1f, 0x1f, page);
+	ret = bus->write(bus, priv->phy_addr, 0x1f, page);
 	if (ret < 0)
 		return ret;
 
-	lo = bus->read(bus, 0x1f, r);
-	hi = bus->read(bus, 0x1f, 0x10);
+	lo = bus->read(bus, priv->phy_addr, r);
+	hi = bus->read(bus, priv->phy_addr, 0x10);
 
 	*val = (hi << 16) | (lo & 0xffff);
 
@@ -107,8 +107,7 @@ mt7531_create_sgmii(struct mt7530_priv *priv)
 		mt7531_pcs_config[i]->unlock = mt7530_mdio_regmap_unlock;
 		mt7531_pcs_config[i]->lock_arg = &priv->bus->mdio_lock;
 
-		regmap = devm_regmap_init(priv->dev,
-					  &mt7530_regmap_bus, priv->bus,
+		regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus, priv,
 					  mt7531_pcs_config[i]);
 		if (IS_ERR(regmap)) {
 			ret = PTR_ERR(regmap);
@@ -153,6 +152,7 @@ mt7530_probe(struct mdio_device *mdiodev)
 
 	priv->bus = mdiodev->bus;
 	priv->dev = &mdiodev->dev;
+	priv->phy_addr = mdiodev->addr;
 
 	ret = mt7530_probe_common(priv);
 	if (ret)
@@ -203,8 +203,8 @@ mt7530_probe(struct mdio_device *mdiodev)
 	regmap_config->reg_stride = 4;
 	regmap_config->max_register = MT7530_CREV;
 	regmap_config->disable_locking = true;
-	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus,
-					priv->bus, regmap_config);
+	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus, priv,
+					regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c0d0bce0b594..fefa6dd151fa 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -86,22 +86,26 @@ core_read_mmd_indirect(struct mt7530_priv *priv, int prtad, int devad)
 	int value, ret;
 
 	/* Write the desired MMD Devad */
-	ret = bus->write(bus, 0, MII_MMD_CTRL, devad);
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_CTRL, devad);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
-	ret = bus->write(bus, 0, MII_MMD_DATA, prtad);
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_DATA, prtad);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
-	ret = bus->write(bus, 0, MII_MMD_CTRL, (devad | MII_MMD_CTRL_NOINCR));
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
 	/* Read the content of the MMD's selected register */
-	value = bus->read(bus, 0, MII_MMD_DATA);
+	value = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			  MII_MMD_DATA);
 
 	return value;
 err:
@@ -118,22 +122,26 @@ core_write_mmd_indirect(struct mt7530_priv *priv, int prtad,
 	int ret;
 
 	/* Write the desired MMD Devad */
-	ret = bus->write(bus, 0, MII_MMD_CTRL, devad);
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_CTRL, devad);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
-	ret = bus->write(bus, 0, MII_MMD_DATA, prtad);
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_DATA, prtad);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
-	ret = bus->write(bus, 0, MII_MMD_CTRL, (devad | MII_MMD_CTRL_NOINCR));
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
 	/* Write the data into MMD's selected register */
-	ret = bus->write(bus, 0, MII_MMD_DATA, data);
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_DATA, data);
 err:
 	if (ret < 0)
 		dev_err(&bus->dev,
@@ -2671,16 +2679,17 @@ mt7531_setup(struct dsa_switch *ds)
 	 * phy_[read,write]_mmd_indirect is called, we provide our own
 	 * mt7531_ind_mmd_phy_[read,write] to complete this function.
 	 */
-	val = mt7531_ind_c45_phy_read(priv, MT753X_CTRL_PHY_ADDR,
+	val = mt7531_ind_c45_phy_read(priv,
+				      MT753X_CTRL_PHY_ADDR(priv->phy_addr),
 				      MDIO_MMD_VEND2, CORE_PLL_GROUP4);
 	val |= MT7531_RG_SYSPLL_DMY2 | MT7531_PHY_PLL_BYPASS_MODE;
 	val &= ~MT7531_PHY_PLL_OFF;
-	mt7531_ind_c45_phy_write(priv, MT753X_CTRL_PHY_ADDR, MDIO_MMD_VEND2,
-				 CORE_PLL_GROUP4, val);
+	mt7531_ind_c45_phy_write(priv, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+				 MDIO_MMD_VEND2, CORE_PLL_GROUP4, val);
 
 	/* Disable EEE advertisement on the switch PHYs. */
-	for (i = MT753X_CTRL_PHY_ADDR;
-	     i < MT753X_CTRL_PHY_ADDR + MT7530_NUM_PHYS; i++) {
+	for (i = MT753X_CTRL_PHY_ADDR(priv->phy_addr);
+	     i < MT753X_CTRL_PHY_ADDR(priv->phy_addr) + MT7530_NUM_PHYS; i++) {
 		mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
 					 0);
 	}
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 585db03c0548..dc48715f6534 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -625,7 +625,7 @@ enum mt7531_clk_skew {
 #define  MT7531_PHY_PLL_OFF		BIT(5)
 #define  MT7531_PHY_PLL_BYPASS_MODE	BIT(4)
 
-#define MT753X_CTRL_PHY_ADDR		0
+#define MT753X_CTRL_PHY_ADDR(phy_addr)	(phy_addr + 1 & 0x1f)
 
 #define CORE_PLL_GROUP5			0x404
 #define  RG_LCDDS_PCW_NCPO1(x)		((x) & 0xffff)
@@ -774,6 +774,7 @@ struct mt753x_info {
  * @irq_enable:		IRQ enable bits, synced to SYS_INT_EN
  * @create_sgmii:	Pointer to function creating SGMII PCS instance(s)
  * @active_cpu_ports:	Holding the active CPU ports
+ * @phy_addr:		Holding the PHY address the switch listens on
  */
 struct mt7530_priv {
 	struct device		*dev;
@@ -800,6 +801,7 @@ struct mt7530_priv {
 	u32 irq_enable;
 	int (*create_sgmii)(struct mt7530_priv *priv);
 	u8 active_cpu_ports;
+	int phy_addr;
 };
 
 struct mt7530_hw_vlan_entry {

-- 
2.40.1



