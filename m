Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD00DC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 05:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uTfZ42YMdPsc//kAzPHZ2G81y8NgAM6Sfpnm9pJXkZE=; b=iKInONwKM1nOo0uu6/BkKf7Hyt
	OAEPVTJUnGNOOTQoDE3laKqLbyj5gKWOWi1vvv/HysjSe/gCQB8FO8TJAFC3qMEMGMwexw7PUJzUg
	Dp4zx/SGWIAMzg4+hdimcod5E+wUTZdn2j1sDGbn0+0P6lRVrtHSn2JKT2EE/a2MnoIpXIu4vVxud
	quBZF5o7xCP6Tfg2YCcwgmzdBBmjwy0Jz3S++14EPwRcdqCsJ6e8mceXUumyiIqwfJSS8WLBwvI6K
	jmz8I6HvLiK7+PVV2YgU+tIguPnXQRhczf0s4WjusYKM8YVl5oCpxVDcH2m1Xjzrshy/gVfu7fdw+
	07gCcRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmxU-00AbJG-1Y;
	Mon, 22 Jan 2024 05:34:56 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmxO-00AbGA-1f;
	Mon, 22 Jan 2024 05:34:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E957240004;
	Mon, 22 Jan 2024 05:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705901683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uTfZ42YMdPsc//kAzPHZ2G81y8NgAM6Sfpnm9pJXkZE=;
	b=n/cLpFXAnCndk/5bqPBQr1sNRXHQbO3V/lGqNjaW2xLNfGvv4yW61KmF56OTU9yrw4zM92
	7yEYaETXr6L4LPi5cPhmBhPFQWKfaNaqdJ3QXdcoyLs6I1CHdPOaR13ihNO43AQ76UlfTh
	VTjzDp1CVW9VNmZEa2dZV/1tQTK1lbycsfvLYy4V7IS4hIGirRtUQqC5bmsymCjE8E49EX
	NoW88/KHNkRAz2CFkut/qcUnRxkfdY54Oc4+0WCUx7waZ+tUOT3MjOn3OKtlZFXCFWHbsf
	BaMb3OE15U3oENyr8kLkwAkez3dMEqVlL6rDyOp31VTUk8l+3UaR2eGGCsk5sg==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Bauer <mail@david-bauer.net>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: dsa: mt7530: support OF-based registration of switch MDIO bus
Date: Mon, 22 Jan 2024 08:34:31 +0300
Message-Id: <20240122053431.7751-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_213450_862911_D4744734 
X-CRM114-Status: GOOD (  18.73  )
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

Currently the MDIO bus of the switches the MT7530 DSA subdriver controls
can only be registered as non-OF-based. Bring support for registering the
bus OF-based.

The subdrivers that control switches [with MDIO bus] probed on OF must
follow this logic to support all cases properly:

No switch MDIO bus defined: Populate ds->user_mii_bus, register the MDIO
bus, set the interrupts for PHYs if "interrupt-controller" is defined at
the switch node. This case should only be covered for the switches which
their dt-bindings documentation didn't document the MDIO bus from the
start. This is to keep supporting the device trees that do not describe the
MDIO bus on the device tree but the MDIO bus is being used nonetheless.

Switch MDIO bus defined: Don't populate ds->user_mii_bus, register the MDIO
bus, set the interrupts for PHYs if ["interrupt-controller" is defined at
the switch node and "interrupts" is defined at the PHY nodes under the
switch MDIO bus node].

Switch MDIO bus defined but explicitly disabled: If the device tree says
status = "disabled" for the MDIO bus, we shouldn't need an MDIO bus at all.
Instead, just exit as early as possible and do not call any MDIO API.

The use of ds->user_mii_bus is inappropriate when the MDIO bus of the
switch is described on the device tree [1], which is why we don't populate
ds->user_mii_bus in that case.

Link: https://lore.kernel.org/netdev/20231213120656.x46fyad6ls7sqyzv@skbuf/ [1]
Suggested-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 391c4dbdff42..cf2ff7680c15 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2146,24 +2146,40 @@ mt7530_free_irq_common(struct mt7530_priv *priv)
 static void
 mt7530_free_irq(struct mt7530_priv *priv)
 {
-	mt7530_free_mdio_irq(priv);
+	struct device_node *mnp, *np = priv->dev->of_node;
+
+	mnp = of_get_child_by_name(np, "mdio");
+	if (!mnp)
+		mt7530_free_mdio_irq(priv);
+	of_node_put(mnp);
+
 	mt7530_free_irq_common(priv);
 }
 
 static int
 mt7530_setup_mdio(struct mt7530_priv *priv)
 {
+	struct device_node *mnp, *np = priv->dev->of_node;
 	struct dsa_switch *ds = priv->ds;
 	struct device *dev = priv->dev;
 	struct mii_bus *bus;
 	static int idx;
-	int ret;
+	int ret = 0;
+
+	mnp = of_get_child_by_name(np, "mdio");
+
+	if (mnp && !of_device_is_available(mnp))
+		goto out;
 
 	bus = devm_mdiobus_alloc(dev);
-	if (!bus)
-		return -ENOMEM;
+	if (!bus) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (!mnp)
+		ds->user_mii_bus = bus;
 
-	ds->user_mii_bus = bus;
 	bus->priv = priv;
 	bus->name = KBUILD_MODNAME "-mii";
 	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d", idx++);
@@ -2174,16 +2190,18 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	bus->parent = dev;
 	bus->phy_mask = ~ds->phys_mii_mask;
 
-	if (priv->irq)
+	if (priv->irq && !mnp)
 		mt7530_setup_mdio_irq(priv);
 
-	ret = devm_mdiobus_register(dev, bus);
+	ret = devm_of_mdiobus_register(dev, bus, mnp);
 	if (ret) {
 		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
-		if (priv->irq)
+		if (priv->irq && !mnp)
 			mt7530_free_mdio_irq(priv);
 	}
 
+out:
+	of_node_put(mnp);
 	return ret;
 }
 
-- 
2.40.1


