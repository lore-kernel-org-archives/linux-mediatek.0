Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02139C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksd1IhO6pn3GF/aY9BBfttRz/LgbFqBS4aJVjjl5sqw=; b=boCgCSCAiL/LUUhWDFkq5XPxXW
	wBY3u43D2nmUXZI0UsmkP0Fl52iyttsBdGX0kdZ+PYz+4GxLW/3CDESfvMrcPVVzyLnlVWkorydWC
	TXfAVY3Iadu6YHuipAdMCYWK2eRNAEC3amOyskmlcO4x4mb6tfJNjme25O9qmfBiwwbu6mU9UlCk6
	kMT6KZjT5gAeSmrozgEKqW/pTpBxvPQ7g7nyUqvl1j9mdOjtV247bGngg9AQGvLQoq+uBOt+8nCR0
	/4rEQCHZMFcEXnvXCEcXG1/SWObeXbbh5tKSEjbBEWz9kJUdh8gYb3f19p5I3XILN5lfKhIpJrGr8
	e/e+MqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu49-004DAW-2c;
	Thu, 30 Mar 2023 15:19:53 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phu43-004D7o-2E;
	Thu, 30 Mar 2023 15:19:52 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phu41-0006Zz-0w;
	Thu, 30 Mar 2023 17:19:45 +0200
Date: Thu, 30 Mar 2023 16:19:41 +0100
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
Subject: [PATCH net-next 02/15] net: dsa: mt7530: refactor SGMII PCS creation
Message-ID: <a79a93ce887b792b9cfb4ef572f5eb0636e76e6e.1680180959.git.daniel@makrotopia.org>
References: <cover.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_081947_739213_8555ED5B 
X-CRM114-Status: GOOD (  16.03  )
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

Instead of macro templates use a dedidated function and allocated
regmap_config when creating the regmaps for the pcs-mtk-lynxi
instances.
This is in preparation to switching to use unlocked regmap accessors
and have regmap's locking API handle locking for us.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 74 +++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 18d4aa6bb9968..5685c71bc9173 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2927,26 +2927,56 @@ static const struct regmap_bus mt7531_regmap_bus = {
 	.reg_update_bits = mt7530_regmap_update_bits,
 };
 
-#define MT7531_PCS_REGMAP_CONFIG(_name, _reg_base) \
-	{				\
-		.name = _name,		\
-		.reg_bits = 16,		\
-		.val_bits = 32,		\
-		.reg_stride = 4,	\
-		.reg_base = _reg_base,	\
-		.max_register = 0x17c,	\
-	}
-
-static const struct regmap_config mt7531_pcs_config[] = {
-	MT7531_PCS_REGMAP_CONFIG("port5", MT7531_SGMII_REG_BASE(5)),
-	MT7531_PCS_REGMAP_CONFIG("port6", MT7531_SGMII_REG_BASE(6)),
-};
+static int
+mt7531_create_sgmii(struct mt7530_priv *priv)
+{
+	struct regmap_config *mt7531_pcs_config[2];
+	struct phylink_pcs *pcs;
+	struct regmap *regmap;
+	int i, ret = 0;
+
+	for (i = 0; i < 2; i++) {
+		mt7531_pcs_config[i] = devm_kzalloc(priv->dev,
+						    sizeof(struct regmap_config),
+						    GFP_KERNEL);
+		if (!mt7531_pcs_config[i]) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		mt7531_pcs_config[i]->name = i ? "port6" : "port5";
+		mt7531_pcs_config[i]->reg_bits = 16;
+		mt7531_pcs_config[i]->val_bits = 32;
+		mt7531_pcs_config[i]->reg_stride = 4;
+		mt7531_pcs_config[i]->reg_base = MT7531_SGMII_REG_BASE(5 + i);
+		mt7531_pcs_config[i]->max_register = 0x17c;
+
+		regmap = devm_regmap_init(priv->dev,
+					  &mt7531_regmap_bus, priv,
+					  mt7531_pcs_config[i]);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			break;
+		}
+		pcs = mtk_pcs_lynxi_create(priv->dev, regmap,
+					   MT7531_PHYA_CTRL_SIGNAL3, 0);
+		if (!pcs) {
+			ret = -ENXIO;
+			break;
+		}
+		priv->ports[5 + i].sgmii_pcs = pcs;
+	}
+
+	if (ret && i)
+		mtk_pcs_lynxi_destroy(priv->ports[5].sgmii_pcs);
+
+	return ret;
+}
 
 static int
 mt753x_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
-	struct regmap *regmap;
 	int i, ret;
 
 	/* Initialise the PCS devices */
@@ -2968,15 +2998,11 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret && priv->irq)
 		mt7530_free_irq_common(priv);
 
-	if (priv->id == ID_MT7531)
-		for (i = 0; i < 2; i++) {
-			regmap = devm_regmap_init(ds->dev,
-						  &mt7531_regmap_bus, priv,
-						  &mt7531_pcs_config[i]);
-			priv->ports[5 + i].sgmii_pcs =
-				mtk_pcs_lynxi_create(ds->dev, regmap,
-						     MT7531_PHYA_CTRL_SIGNAL3, 0);
-		}
+	if (priv->id == ID_MT7531) {
+		ret = mt7531_create_sgmii(priv);
+		if (ret && priv->irq)
+			mt7530_free_irq_common(priv);
+	}
 
 	return ret;
 }
-- 
2.39.2


