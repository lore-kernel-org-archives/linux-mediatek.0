Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCCEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Za88rYgwgKn0WiofuSK1WGYOeJU3Yac28j/dIRDh7Ew=; b=um2Tzvmrh0GJKKM87IcrG5hfeE
	CNzIq7U/q+MPPamzJ6iPPr3RNynJbAMltZnvXc/SLP4cQRSgFj5+POOu2icMeWviBg8POmGQ6ieLa
	uLG9sGKtNv9xeClYgadVlfx7P6rz1i1oq0OwOIbKKYUeGBnuefiGQPun8jkFhIIXv41J30zhgOuN+
	yqb5f0YETPEc4w2+lA6/xVfG4rAhlgHjRpXfXDkNX5Tfm8hiqj5CSogZ1yJF9lY65ubAHl9pnS0Zy
	/mGTqVxFj5DlYueLHQBBMDwBZ5XitnPV2hui/yezVT+pTv+s77oR9RJc4hRloL4foJDF+ir+jkbhN
	N83xPK0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYCT-000wAB-04;
	Wed, 29 Mar 2023 15:59:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYCO-000w4s-0e;
	Wed, 29 Mar 2023 15:58:59 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phYCM-0003O6-1l;
	Wed, 29 Mar 2023 17:58:54 +0200
Date: Wed, 29 Mar 2023 16:58:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
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
Subject: [RFC PATCH net-next v3 07/15] net: dsa: mt7530: introduce
 mt7530_probe_common helper function
Message-ID: <d5147ef8738c1425fdd4fb351c1f3d98786fc19f.1680105013.git.daniel@makrotopia.org>
References: <cover.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085856_274268_7505584E 
X-CRM114-Status: GOOD (  18.93  )
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

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 86 ++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 39 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 221d56cf9e710..32875762b3d96 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3145,44 +3145,47 @@ static const struct of_device_id mt7530_of_match[] = {
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
+	struct device_node *dn = dev->of_node;
 
-	priv->ds = devm_kzalloc(&mdiodev->dev, sizeof(*priv->ds), GFP_KERNEL);
+	priv->ds = devm_kzalloc(dev, sizeof(*priv->ds), GFP_KERNEL);
 	if (!priv->ds)
 		return -ENOMEM;
 
-	priv->ds->dev = &mdiodev->dev;
+	priv->ds->dev = dev;
 	priv->ds->num_ports = MT7530_NUM_PORTS;
 
 	/* Use medatek,mcm property to distinguish hardware type that would
-	 * casues a little bit differences on power-on sequence.
+	 * cause a little bit differences on power-on sequence.
+	 * Note MCM that indicates switch works as the remote standalone
+	 * integrated circuit so the GPIO pin would be used to complete
+	 * the reset, otherwise memory-mapped register accessing used
+	 * through syscon provides in the case of MCM.
 	 */
 	priv->mcm = of_property_read_bool(dn, "mediatek,mcm");
 	if (priv->mcm) {
-		dev_info(&mdiodev->dev, "MT7530 adapts as multi-chip module\n");
+		dev_dbg(dev, "MT7530 adapts as multi-chip module\n");
 
-		priv->rstc = devm_reset_control_get(&mdiodev->dev, "mcm");
+		priv->rstc = devm_reset_control_get(dev, "mcm");
 		if (IS_ERR(priv->rstc)) {
-			dev_err(&mdiodev->dev, "Couldn't get our reset line\n");
+			dev_err(dev, "Couldn't get our reset line\n");
 			return PTR_ERR(priv->rstc);
 		}
+	} else {
+		priv->reset = devm_gpiod_get_optional(dev, "reset",
+						      GPIOD_OUT_LOW);
+		if (IS_ERR(priv->reset)) {
+			dev_err(dev, "Couldn't get our reset line\n");
+			return PTR_ERR(priv->reset);
+		}
 	}
 
 	/* Get the hardware identifier from the devicetree node.
 	 * We will need it for some of the clock and regulator setup.
 	 */
-	priv->info = of_device_get_match_data(&mdiodev->dev);
+	priv->info = of_device_get_match_data(dev);
 	if (!priv->info)
 		return -EINVAL;
 
@@ -3196,6 +3199,32 @@ mt7530_probe(struct mdio_device *mdiodev)
 		return -EINVAL;
 
 	priv->id = priv->info->id;
+	priv->dev = dev;
+	priv->ds->priv = priv;
+	priv->ds->ops = &mt7530_switch_ops;
+	mutex_init(&priv->reg_mutex);
+	dev_set_drvdata(dev, priv);
+
+	return 0;
+}
+
+static int
+mt7530_probe(struct mdio_device *mdiodev)
+{
+	static struct regmap_config *regmap_config;
+	struct mt7530_priv *priv;
+	int ret;
+
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
 
 	if (priv->id == ID_MT7530) {
 		priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
@@ -3207,27 +3236,6 @@ mt7530_probe(struct mdio_device *mdiodev)
 			return PTR_ERR(priv->io_pwr);
 	}
 
-	/* Not MCM that indicates switch works as the remote standalone
-	 * integrated circuit so the GPIO pin would be used to complete
-	 * the reset, otherwise memory-mapped register accessing used
-	 * through syscon provides in the case of MCM.
-	 */
-	if (!priv->mcm) {
-		priv->reset = devm_gpiod_get_optional(&mdiodev->dev, "reset",
-						      GPIOD_OUT_LOW);
-		if (IS_ERR(priv->reset)) {
-			dev_err(&mdiodev->dev, "Couldn't get our reset line\n");
-			return PTR_ERR(priv->reset);
-		}
-	}
-
-	priv->bus = mdiodev->bus;
-	priv->dev = &mdiodev->dev;
-	priv->ds->priv = priv;
-	priv->ds->ops = &mt7530_switch_ops;
-	mutex_init(&priv->reg_mutex);
-	dev_set_drvdata(&mdiodev->dev, priv);
-
 	regmap_config = devm_kzalloc(&mdiodev->dev, sizeof(*regmap_config),
 				     GFP_KERNEL);
 	if (!regmap_config)
-- 
2.39.2


