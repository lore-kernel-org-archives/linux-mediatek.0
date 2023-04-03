Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C696C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 01:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zi0gFsiHbY/GtdaTGX5dmhw/IXTGaARY+af6bqSj44=; b=39rKYLjTYhqK0jTDOU36NlbfLW
	qQ5Zow8+3YkVUYQU2XJxbC/G/dD12TuyLVurdCShzGrxOq1vRCdXembY81NIN1Q58o+iQ20NDclxH
	HHCWgNmitf/HzCAxdRMozCcqicmTSb7/UqjZaf4tI7IWub8ORmGIdUogxHcDDZAG2hpiuYv46hx/p
	+M8NEVc/NlIcT0x936VM9dqqdvigwyhqkiKG6ch/6gG/cZafTRDFdHqwpU9sLOkRexQ3SMDVQ1U76
	i0osyzhv/rxdt1IvRUk9n1vECB6DdulFGhFmzhiiQzeYmS0cNijfdHggAYgVgayPAMLZJVrim/6Cl
	KbSbclzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj8po-00Dh78-1p;
	Mon, 03 Apr 2023 01:18:12 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj8pl-00Dh48-1O;
	Mon, 03 Apr 2023 01:18:10 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pj8pk-0004ie-0n;
	Mon, 03 Apr 2023 03:18:08 +0200
Date: Mon, 3 Apr 2023 02:18:04 +0100
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH net-next v2 05/14] net: dsa: mt7530: move SGMII PCS creation
 to mt7530_probe function
Message-ID: <e974eac81e68ce38cbac65964442533cfa4ef5a7.1680483896.git.daniel@makrotopia.org>
References: <cover.1680483895.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680483895.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_181809_473294_66FB7E2A 
X-CRM114-Status: GOOD (  12.66  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/mt7530.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a0e1e2e015f0b..d285a60aaf684 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3008,12 +3008,6 @@ mt753x_setup(struct dsa_switch *ds)
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
 
@@ -3136,6 +3130,7 @@ mt7530_probe(struct mdio_device *mdiodev)
 	static struct regmap_config *regmap_config;
 	struct mt7530_priv *priv;
 	struct device_node *dn;
+	int ret;
 
 	dn = mdiodev->dev.of_node;
 
@@ -3228,6 +3223,12 @@ mt7530_probe(struct mdio_device *mdiodev)
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
2.40.0


