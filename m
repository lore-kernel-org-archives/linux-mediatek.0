Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57A6C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iy33FGUyvUlXPpRSwsaMr76qb2t9aDuQIWD29E70e7U=; b=IzKYXun0x1a1gCTlIkR7FYtxmz
	55KR5vqllGYGlP6LiM1gGPyBn4rM3V8rY10GFGgSePUjP4R4NGlScOHTv/yQtTE1HVrYGp5q/6anK
	VaHhLCx2aD3ReuijYFrQ5Nx6VWeBxJw0vxUTv/ggjnoDf2OfngI3WXZiJt0s/HUdexiYWvnVxa130
	akF534A1VeOqsa1kYyVEkUmpVh6Q0pSnysMlDaxkOUXDdkLk0yeXx18RPW66Kk/FmVXpsJ+X856Pb
	FI4gYptyDCaWN6+/qbsBUGXybpzRSu1+8gLgFaGpx6gr4mcca/MPuzs4CjObizTSwVOs7Je4JiKz1
	cPeJrGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu5Y-004DhN-2Z;
	Thu, 30 Mar 2023 15:21:20 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phu5S-004De7-3D;
	Thu, 30 Mar 2023 15:21:20 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phu5R-0006dD-2W;
	Thu, 30 Mar 2023 17:21:13 +0200
Date: Thu, 30 Mar 2023 16:21:09 +0100
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
Subject: [PATCH net-next 05/15] net: dsa: mt7530: move SGMII PCS creation to
 mt7530_probe function
Message-ID: <f8f157ca470ffb54c03be821c72478b2563a1106.1680180959.git.daniel@makrotopia.org>
References: <cover.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_082115_039588_3705D0C6 
X-CRM114-Status: GOOD (  12.15  )
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

Move creating the SGMII PCS from mt753x_setup() to the more appropriate
mt7530_probe() function.
This is done also in preparation of moving all functions related to
MDIO-connected MT753x switches to a separate module.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e27a0e551cec0..803809b430c85 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3012,12 +3012,6 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret && priv->irq)
 		mt7530_free_irq_common(priv);
 
-	if (priv->id == ID_MT7531) {
-		ret = mt7531_create_sgmii(priv);
-		if (ret && priv->irq)
-			mt7530_free_irq_common(priv);
-	}
-
 	return ret;
 }
 
@@ -3140,6 +3134,7 @@ mt7530_probe(struct mdio_device *mdiodev)
 	static struct regmap_config *regmap_config;
 	struct mt7530_priv *priv;
 	struct device_node *dn;
+	int ret;
 
 	dn = mdiodev->dev.of_node;
 
@@ -3232,6 +3227,12 @@ mt7530_probe(struct mdio_device *mdiodev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
+	if (priv->id == ID_MT7531) {
+		ret = mt7531_create_sgmii(priv);
+		if (ret)
+			return ret;
+	}
+
 	return dsa_register_switch(priv->ds);
 }
 
-- 
2.39.2


