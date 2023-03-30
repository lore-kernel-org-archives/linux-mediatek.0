Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7133C77B60
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueVsOrlnsUq4isdzmA9y8wwcBu7jE8ImfSY8yDeNehk=; b=Pf43qdiQS+Bc6tpzTxNgJ5H3cj
	KXj0xM6gkEnrD5GyIvYHdJC8xLOjJHQWJwaURfQuRBIhxzGKky8m+2cAe1wQZvR8iR8sFLoE+EPDH
	n1PYY2VUDFvTu6FRUuOfP8Lvc4BKQ9jIky+OKMbv2W6eV75PwUhAzJN3xiZR8T4Kv+NsboDaSEAz5
	y8AYcjUBA8FjNJJvFvoIAUxCz1CyekH2AXmqozHN1qKKi6WSnipUl5hY3nqZytbdN3OFy2zzf094e
	qsw02L/h6lrMASacJ2OyjjtnC8QFTkWzMxErZlXJtLShSe0hnHBGRJ0njJQCNsCVmiTnPHKnxNsVs
	I8tbjovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu6P-004E3y-0L;
	Thu, 30 Mar 2023 15:22:13 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phu6J-004E0e-0W;
	Thu, 30 Mar 2023 15:22:11 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phu6H-0006gr-2h;
	Thu, 30 Mar 2023 17:22:06 +0200
Date: Thu, 30 Mar 2023 16:22:01 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH net-next 08/15] net: dsa: mt7530: introduce
 mt7530_probe_common helper function
Message-ID: <00aeabce9dc11d37342a57b3e19cfd8bdf92b4b1.1680180959.git.daniel@makrotopia.org>
References: <cover.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_082207_199215_75EFDAAE 
X-CRM114-Status: GOOD (  17.27  )
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

Move commonly used parts from mt7530_probe into new mt7530_probe_common
helper function which will be used by both, mt7530_probe and the
to-be-introduced mt7988_probe.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 98 ++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 44 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 4993e36c2f507..b3a9eb40e45a9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3147,44 +3147,21 @@ static const struct of_device_id mt7530_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt7530_of_match);
 
 static int
-mt7530_probe(struct mdio_device *mdiodev)
+mt7530_probe_common(struct mt7530_priv *priv)
 {
-	static struct regmap_config *regmap_config;
-	struct mt7530_priv *priv;
-	struct device_node *dn;
-	int ret;
-
-	dn = mdiodev->dev.of_node;
-
-	priv = devm_kzalloc(&mdiodev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	struct device *dev = priv->dev;
 
-	priv->ds = devm_kzalloc(&mdiodev->dev, sizeof(*priv->ds), GFP_KERNEL);
+	priv->ds = devm_kzalloc(dev, sizeof(*priv->ds), GFP_KERNEL);
 	if (!priv->ds)
 		return -ENOMEM;
 
-	priv->ds->dev = &mdiodev->dev;
+	priv->ds->dev = dev;
 	priv->ds->num_ports = MT7530_NUM_PORTS;
 
-	/* Use medatek,mcm property to distinguish hardware type that would
-	 * casues a little bit differences on power-on sequence.
-	 */
-	priv->mcm = of_property_read_bool(dn, "mediatek,mcm");
-	if (priv->mcm) {
-		dev_info(&mdiodev->dev, "MT7530 adapts as multi-chip module\n");
-
-		priv->rstc = devm_reset_control_get(&mdiodev->dev, "mcm");
-		if (IS_ERR(priv->rstc)) {
-			dev_err(&mdiodev->dev, "Couldn't get our reset line\n");
-			return PTR_ERR(priv->rstc);
-		}
-	}
-
 	/* Get the hardware identifier from the devicetree node.
 	 * We will need it for some of the clock and regulator setup.
 	 */
-	priv->info = of_device_get_match_data(&mdiodev->dev);
+	priv->info = of_device_get_match_data(dev);
 	if (!priv->info)
 		return -EINVAL;
 
@@ -3198,23 +3175,53 @@ mt7530_probe(struct mdio_device *mdiodev)
 		return -EINVAL;
 
 	priv->id = priv->info->id;
+	priv->dev = dev;
+	priv->ds->priv = priv;
+	priv->ds->ops = &mt7530_switch_ops;
+	mutex_init(&priv->reg_mutex);
+	dev_set_drvdata(dev, priv);
 
-	if (priv->id == ID_MT7530) {
-		priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
-		if (IS_ERR(priv->core_pwr))
-			return PTR_ERR(priv->core_pwr);
+	return 0;
+}
 
-		priv->io_pwr = devm_regulator_get(&mdiodev->dev, "io");
-		if (IS_ERR(priv->io_pwr))
-			return PTR_ERR(priv->io_pwr);
-	}
+static int
+mt7530_probe(struct mdio_device *mdiodev)
+{
+	static struct regmap_config *regmap_config;
+	struct mt7530_priv *priv;
+	struct device_node *dn;
+	int ret;
+
+	dn = mdiodev->dev.of_node;
 
-	/* Not MCM that indicates switch works as the remote standalone
+	priv = devm_kzalloc(&mdiodev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->bus = mdiodev->bus;
+	priv->dev = &mdiodev->dev;
+
+	ret = mt7530_probe_common(priv);
+	if (ret)
+		return ret;
+
+	/* Use medatek,mcm property to distinguish hardware type that would
+	 * cause a little bit differences on power-on sequence.
+	 * Not MCM that indicates switch works as the remote standalone
 	 * integrated circuit so the GPIO pin would be used to complete
 	 * the reset, otherwise memory-mapped register accessing used
 	 * through syscon provides in the case of MCM.
 	 */
-	if (!priv->mcm) {
+	priv->mcm = of_property_read_bool(dn, "mediatek,mcm");
+	if (priv->mcm) {
+		dev_info(&mdiodev->dev, "MT7530 adapts as multi-chip module\n");
+
+		priv->rstc = devm_reset_control_get(&mdiodev->dev, "mcm");
+		if (IS_ERR(priv->rstc)) {
+			dev_err(&mdiodev->dev, "Couldn't get our reset line\n");
+			return PTR_ERR(priv->rstc);
+		}
+	} else {
 		priv->reset = devm_gpiod_get_optional(&mdiodev->dev, "reset",
 						      GPIOD_OUT_LOW);
 		if (IS_ERR(priv->reset)) {
@@ -3223,12 +3230,15 @@ mt7530_probe(struct mdio_device *mdiodev)
 		}
 	}
 
-	priv->bus = mdiodev->bus;
-	priv->dev = &mdiodev->dev;
-	priv->ds->priv = priv;
-	priv->ds->ops = &mt7530_switch_ops;
-	mutex_init(&priv->reg_mutex);
-	dev_set_drvdata(&mdiodev->dev, priv);
+	if (priv->id == ID_MT7530) {
+		priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
+		if (IS_ERR(priv->core_pwr))
+			return PTR_ERR(priv->core_pwr);
+
+		priv->io_pwr = devm_regulator_get(&mdiodev->dev, "io");
+		if (IS_ERR(priv->io_pwr))
+			return PTR_ERR(priv->io_pwr);
+	}
 
 	regmap_config = devm_kzalloc(&mdiodev->dev, sizeof(*regmap_config),
 				     GFP_KERNEL);
-- 
2.39.2


