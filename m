Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0F9C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 00:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PwDNwnu45uNJkcjW3fc8b1bSVRqg7U+HFWkF444tmmY=; b=reWZcB+3sTzo7aO8UVx2tfnt6c
	bI9Css1zF2rZjFMZMShMkjP6DnIIyIyg099AmzrCHTq/kTdk6oo5M74z7Alyb1mqh1rOCbS0TQVon
	sd8+Av1jbrjyqoARguZmZsgj8QK20K1UXpBBqzrGGT7bmqUksfTj5L47tlGcMUStVEYoVUzq6UHtb
	SMomM4a6KmLBJDDyR0XTotCqmDNh2nAi9yTt5FOR0czheSXyEA4emt4bN6lDzAeO7onskHCuANt5v
	RzUNETrCyGOOAMOcL6liDyN2WscHphaoFIULQ4QmDJuOnq1SPCYnGB99jBuY12M/mwI61MT7jxgvq
	Fp6AOTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm1bb-00G8TD-2z;
	Tue, 11 Apr 2023 00:11:27 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm1bY-00G8Sb-1X;
	Tue, 11 Apr 2023 00:11:25 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pm1bP-0007rm-1O;
	Tue, 11 Apr 2023 02:11:15 +0200
Date: Tue, 11 Apr 2023 01:11:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Russell King <linux@armlinux.org.uk>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next] net: dsa: mt7530: fix support for MT7531BE
Message-ID: <ZDSlm-0gyyDZXy_k@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_171124_540103_220F1B7D 
X-CRM114-Status: GOOD (  17.07  )
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

There are two variants of the MT7531 switch IC which got different
features (and pins) regarding port 5:
 * MT7531AE: SGMII/1000Base-X/2500Base-X SerDes
 * MT7531BE: RGMII

Moving the creation of the SerDes PCS from mt753x_setup to mt7530_probe
with commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS creation to
mt7530_probe function") works fine for MT7531AE which got two instances
of mtk-pcs-lynxi, however, MT7531BE requires mt7531_pll_setup to setup
clocks before the single PCS on port 6 (usually used as CPU port)
starts to work and hence the PCS creation failed on MT7531BE.

Fix this by introducing a pointer to mt7531_create_sgmii function in
struct mt7530_priv and call it again at the end of mt753x_setup like it
was before commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS
creation to mt7530_probe function").

Fixes: 6de285229773 ("net: dsa: mt7530: move SGMII PCS creation to mt7530_probe function")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530-mdio.c | 14 +++++++-------
 drivers/net/dsa/mt7530.c      |  6 ++++++
 drivers/net/dsa/mt7530.h      |  4 ++++
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 34a547b88e497..f17eab67d15fa 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -81,14 +81,17 @@ static const struct regmap_bus mt7530_regmap_bus = {
 };
 
 static int
-mt7531_create_sgmii(struct mt7530_priv *priv)
+mt7531_create_sgmii(struct mt7530_priv *priv, bool dual_sgmii)
 {
 	struct regmap_config *mt7531_pcs_config[2];
 	struct phylink_pcs *pcs;
 	struct regmap *regmap;
 	int i, ret = 0;
 
-	for (i = 0; i < 2; i++) {
+	/* MT7531AE has two SGMII units for port 5 and port 6
+	 * MT7531BE has only one SGMII unit for port 6
+	 */
+	for (i = dual_sgmii ? 0 : 1; i < 2; i++) {
 		mt7531_pcs_config[i] = devm_kzalloc(priv->dev,
 						    sizeof(struct regmap_config),
 						    GFP_KERNEL);
@@ -208,11 +211,8 @@ mt7530_probe(struct mdio_device *mdiodev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	if (priv->id == ID_MT7531) {
-		ret = mt7531_create_sgmii(priv);
-		if (ret)
-			return ret;
-	}
+	if (priv->id == ID_MT7531)
+		priv->create_sgmii = mt7531_create_sgmii;
 
 	return dsa_register_switch(priv->ds);
 }
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e4bb5037d3525..c680873819b01 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3018,6 +3018,12 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret && priv->irq)
 		mt7530_free_irq_common(priv);
 
+	if (priv->create_sgmii) {
+		ret = priv->create_sgmii(priv, mt7531_dual_sgmii_supported(priv));
+		if (ret && priv->irq)
+			mt7530_free_irq(priv);
+	}
+
 	return ret;
 }
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 01db5c9724fa8..6e89578b4de02 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -752,6 +752,8 @@ struct mt753x_info {
  * @irq:		IRQ number of the switch
  * @irq_domain:		IRQ domain of the switch irq_chip
  * @irq_enable:		IRQ enable bits, synced to SYS_INT_EN
+ *
+ * @create_sgmii:	Pointer to function creating SGMII PCS instance(s)
  */
 struct mt7530_priv {
 	struct device		*dev;
@@ -778,6 +780,8 @@ struct mt7530_priv {
 	int irq;
 	struct irq_domain *irq_domain;
 	u32 irq_enable;
+
+	int (*create_sgmii)(struct mt7530_priv *priv, bool dual_sgmii);
 };
 
 struct mt7530_hw_vlan_entry {
-- 
2.40.0


