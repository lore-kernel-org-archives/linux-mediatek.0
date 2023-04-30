Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AE1C77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PZrdgecnCo5fGxsNjAsOj3WjLrLWTWKt1EDmrlO8M4I=; b=qeDPcwUy5VqZL2aRDNtoxnfqBF
	occ2icmDEYqaDlJXAk3ree0neODEi/YhyiTQ464GZsrip1dwY1qXEsT6KunFgbOycmTwmp01pLS/c
	KIvVP5mOQJ2x/MFNs58hD0YA6ti+RHD4r1gwX/xTGt/wJtqa60CpomtKP0w3afA+k/s7mSy+WXHLb
	GR2kDguPk5cBaI9nRx4TMHoIavQXoLoxgE9ztmtYTJOS5ZpoywhYDUq6aACeIQIao9aKJzKsShx8+
	KW10+hJZaE1wzVjFuPzs7o/crzF5MgLa02OG19UU1ghWx++KI1b6aI16e+E/AJkSylV5Pl1kjhaar
	KUBZw1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt5Eu-00E56I-35;
	Sun, 30 Apr 2023 11:29:12 +0000
Received: from perseus.uberspace.de ([95.143.172.134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt5Em-00E53h-2l
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Apr 2023 11:29:09 +0000
Received: (qmail 18674 invoked by uid 988); 30 Apr 2023 11:28:52 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
From: David Bauer <mail@david-bauer.net>
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] mt7530: register OF node for internal MDIO bus
Date: Sun, 30 Apr 2023 13:28:32 +0200
Message-Id: <20230430112834.11520-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-2.999999) R_MISSING_CHARSET(0.5) MIME_GOOD(-0.1) MID_CONTAINS_FROM(1) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: -0.099999
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sun, 30 Apr 2023 13:28:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from;
	bh=1CwuYfvRbtvDggjy1KUcLv3iiE191S7uqbxY1wuyIr0=;
	b=ZbtXbBd/kO8pqErhBWiIYRRlfZkANNXqJv6XUkTRqVaZ1yUqjgL8WchfyNL9dEf6Z4cnG+WgG7
	zLNfx5NUihvGk9H5Q86mpSU1KLSQE28vE0kNSrJK1bIUV+1/RI5P3zTnsqxH+TxXpITizsg7qH0k
	vnhQhfCJ+KfDN+gqeJt9PmjXNDDatkip7ppHh4hZ0dnjKfJmwlgrxjGE71O+TWVfMqJKyR28YdbW
	kkQ0ffCvMN8QfNKwOQg3YsOFzIg6fLGuI7LoiGwnxm4suFTm+13bFep5CUFynlrB7i4Z06FdZpau
	7L0zaculLlrnKD5Dxd1ekxTIrMytJmYqajs8lt3+M8xnWcd6zqAbjIIaLX9la3SRqG3tJhjdFfPG
	TBJfYCx4nB0N9bFQO80Kq87oGJC/ioubnBiNMBgx5efBrTveLE7L3HjcjcdgJMufGfqUUg4ebTWm
	d+v7+nInuLQ19Tu3blzw6hdeYnfIGojUFqzMnnXG2bNWq1sa0JHUjmCkizBCgFcqeN3AyNTlMUJU
	fb5vBZOt/rR/hOdtDSpjpHNV/FYGXBat+htaDWouyNPHkEBVauYF7w1iIuiRVcrEwYtn2eOMpgNm
	0L5m2CoXibIYntiRa5kMt9uszM/WbeF0NKWWFLrPapQwHOEp4qo9hSff7m6bXPIAokXYYgYsiZXA
	o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_042906_003308_B056625D 
X-CRM114-Status: GOOD (  10.10  )
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

The MT753x switches provide a switch-internal MDIO bus for the embedded
PHYs.

Register a OF sub-node on the switch OF-node for this internal MDIO bus.
This allows to configure the embedded PHYs using device-tree.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/dsa/mt7530.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c680873819b0..7e8ea5b75c3e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2119,10 +2119,13 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 {
 	struct dsa_switch *ds = priv->ds;
 	struct device *dev = priv->dev;
+	struct device_node *np, *mnp;
 	struct mii_bus *bus;
 	static int idx;
 	int ret;
 
+	np = priv->dev->of_node;
+
 	bus = devm_mdiobus_alloc(dev);
 	if (!bus)
 		return -ENOMEM;
@@ -2141,7 +2144,9 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	if (priv->irq)
 		mt7530_setup_mdio_irq(priv);
 
-	ret = devm_mdiobus_register(dev, bus);
+	mnp = of_get_child_by_name(np, "mdio");
+	ret = devm_of_mdiobus_register(dev, bus, mnp);
+	of_node_put(mnp);
 	if (ret) {
 		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
 		if (priv->irq)
-- 
2.39.2


