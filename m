Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD939C77B61
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6oly2xRWX9QImtXrd+etwvRvcekLzfKBndnbaLLUFM=; b=ZO08RhzfV9lJyRvJmuWECbjAGG
	vvFutE7m4Yny3vuZxQFoDzMNZK4F8nVRXQaXOneWxdwA382OzMotm7anwCDemhd0YzgI1FSCAfjCv
	hq4F/NytZTv1+UVxmzFvB0OPm2ExTfK3D5CugrLoxHkTB+3fjb6PrX11+37WYOi05HXYBJJmtHigf
	8uymA31A48GB2sKwuYnbnxo8cJdNZLhizQ99GyKvrv5PjqHYQNTqL3UvE5Td5ScZNdjofVqQeAO+A
	nxCm6CZzck6hii02is4m6k//V2JWinKyzl6NOZsZ1iE/02qjcZZEOQVe8gBLN7+xY0I3ySqaqFbaF
	9IQJYZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYBB-000vGH-2K;
	Wed, 29 Mar 2023 15:57:41 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYB8-000vCZ-0E;
	Wed, 29 Mar 2023 15:57:39 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phYB6-0003Kc-2a;
	Wed, 29 Mar 2023 17:57:36 +0200
Date: Wed, 29 Mar 2023 16:57:32 +0100
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
Subject: [RFC PATCH net-next v3 02/15] net: dsa: mt7530: use unlocked regmap
 accessors
Message-ID: <1b79468f3043810ff8ec06a66cf8571738a13f72.1680105013.git.daniel@makrotopia.org>
References: <cover.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085738_128351_FA27E456 
X-CRM114-Status: GOOD (  12.92  )
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

Instead of wrapping the locked register accessor functions, use the
unlocked variants and add wrappers to let regmap handle the locking.
This is a preparation towards being able to always use regmap to
access switch registers instead of open-coded accessor functions.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9b88ce5cee5bd..deb0b338b22c2 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2899,7 +2899,7 @@ static int mt7530_regmap_read(void *context, unsigned int reg, unsigned int *val
 {
 	struct mt7530_priv *priv = context;
 
-	*val = mt7530_read(priv, reg);
+	*val = mt7530_mii_read(priv, reg);
 	return 0;
 };
 
@@ -2907,23 +2907,25 @@ static int mt7530_regmap_write(void *context, unsigned int reg, unsigned int val
 {
 	struct mt7530_priv *priv = context;
 
-	mt7530_write(priv, reg, val);
+	mt7530_mii_write(priv, reg, val);
 	return 0;
 };
 
-static int mt7530_regmap_update_bits(void *context, unsigned int reg,
-				     unsigned int mask, unsigned int val)
+static void
+mt7530_mdio_regmap_lock(void *mdio_lock)
 {
-	struct mt7530_priv *priv = context;
+	mutex_lock_nested(mdio_lock, MDIO_MUTEX_NESTED);
+}
 
-	mt7530_rmw(priv, reg, mask, val);
-	return 0;
-};
+static void
+mt7530_mdio_regmap_unlock(void *mdio_lock)
+{
+	mutex_unlock(mdio_lock);
+}
 
 static const struct regmap_bus mt7531_regmap_bus = {
 	.reg_write = mt7530_regmap_write,
 	.reg_read = mt7530_regmap_read,
-	.reg_update_bits = mt7530_regmap_update_bits,
 };
 
 static int
@@ -2949,6 +2951,9 @@ mt7531_create_sgmii(struct mt7530_priv *priv)
 		mt7531_pcs_config[i]->reg_stride = 4;
 		mt7531_pcs_config[i]->reg_base = MT7531_SGMII_REG_BASE(5 + i);
 		mt7531_pcs_config[i]->max_register = 0x17c;
+		mt7531_pcs_config[i]->lock = mt7530_mdio_regmap_lock;
+		mt7531_pcs_config[i]->unlock = mt7530_mdio_regmap_unlock;
+		mt7531_pcs_config[i]->lock_arg = &priv->bus->mdio_lock;
 
 		regmap = devm_regmap_init(priv->dev,
 					  &mt7531_regmap_bus, priv,
-- 
2.39.2


