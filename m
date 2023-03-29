Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5A9C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+DkvKIc4UikUz+XgK4Ir0YY4PqE6BVizpiJNliG644=; b=JBPmz45yy2XDKF0aL31FqH5NhR
	R+LaHvrfWw6gHnrlyYN4H46MVAM8jOmXzO4jm5f3HMiB+0B5QLhnamnpFt4B5Cm+TTljqq6b0/PSf
	MPmBgMMSAokmaAof7hZ9HadzX876w4pik8RNs0O1VNa+Uv82kpGxabS7bsamoytVKUjmS9a9/XCzu
	pobOVVLauoaHvpfU/s2nn+oBqmJH5SZ2ohkcL8nfQSkZmXJd1TXDGPKb9GeG9vywk+HHI/Zl3HWYk
	BOHDqx3bYlmal2Z9lS8gLGLSpd/YFKwR7bquR/dknDbrChReNUDgQ4keGDcs2TNipv1qYTHJS9HQw
	r4S/3Wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYCe-000wJk-1L;
	Wed, 29 Mar 2023 15:59:12 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYCb-000wGt-2m;
	Wed, 29 Mar 2023 15:59:11 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phYCZ-0003PD-0M;
	Wed, 29 Mar 2023 17:59:07 +0200
Date: Wed, 29 Mar 2023 16:59:03 +0100
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
Subject: [RFC PATCH net-next v3 08/15] net: dsa: mt7530: introduce
 mt7530_remove_common helper function
Message-ID: <e417f0cd6dea15fe7a0305eeaef6b8f94d654f45.1680105013.git.daniel@makrotopia.org>
References: <cover.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085909_907700_83B6E413 
X-CRM114-Status: GOOD (  11.60  )
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

Move commonly used parts from mt7530_remove into new
mt7530_remove_common helper function which will be used by both,
mt7530_remove and the to-be-introduced mt7988_remove.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 32875762b3d96..f84cbd251d1c1 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3260,6 +3260,17 @@ mt7530_probe(struct mdio_device *mdiodev)
 	return dsa_register_switch(priv->ds);
 }
 
+static void
+mt7530_remove_common(struct mt7530_priv *priv)
+{
+	if (priv->irq)
+		mt7530_free_irq(priv);
+
+	dsa_unregister_switch(priv->ds);
+
+	mutex_destroy(&priv->reg_mutex);
+}
+
 static void
 mt7530_remove(struct mdio_device *mdiodev)
 {
@@ -3279,15 +3290,10 @@ mt7530_remove(struct mdio_device *mdiodev)
 		dev_err(priv->dev, "Failed to disable io pwr: %d\n",
 			ret);
 
-	if (priv->irq)
-		mt7530_free_irq(priv);
-
-	dsa_unregister_switch(priv->ds);
+	mt7530_remove_common(priv);
 
 	for (i = 0; i < 2; ++i)
 		mtk_pcs_lynxi_destroy(priv->ports[5 + i].sgmii_pcs);
-
-	mutex_destroy(&priv->reg_mutex);
 }
 
 static void mt7530_shutdown(struct mdio_device *mdiodev)
-- 
2.39.2


