Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59D4C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JicQJBOXFrDWWxGLYRCrFrZzUf6exvsT/WdINPAJD5g=; b=l1fCgNG/7E0+JfjdAZ55lmZpJt
	FEcihFIlhcnDo+4pKfwnmYLesE6vbCPdfOVoLBa/l/RP2nv2W6Ii4KT+xioNy9SRlDvb0RYuIukgd
	SKxtwqshVK4OnMJocH7bMP1gPjgoqFu5eUDCDJoSGYVVWeeKhpxXqnSKhRLCM5OGvEqrhqU94d23N
	GBThscKtmA8uiVLKf++Zrq2H2KZf2c4IlVUHTPJU8T5xYtEnfA/boWepmQXBcwWvBf8HJC98s5QRs
	JrtHCcBMuqRT1SfpC4JnHB7O/qI5jYMxwMTmWfsxBB7eAydA6QeEQSAQyKZeu5/1WFvaooZx4bXT8
	xJYxpR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYC0-000vmg-06;
	Wed, 29 Mar 2023 15:58:32 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYBw-000vje-1U;
	Wed, 29 Mar 2023 15:58:30 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phYBu-0003My-26;
	Wed, 29 Mar 2023 17:58:26 +0200
Date: Wed, 29 Mar 2023 16:58:22 +0100
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
Subject: [RFC PATCH net-next v3 05/15] net: dsa: mt7530: introduce mutex
 helpers
Message-ID: <118badcdd9741d21e3d367e10c34a2d66ae04f59.1680105013.git.daniel@makrotopia.org>
References: <cover.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085828_657453_04546475 
X-CRM114-Status: GOOD (  14.04  )
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

As the MDIO bus lock only needs to be involved if actually operating
on an MDIO-connected switch we will need to skip locking for built-in
switches which are accessed via MMIO.
Create helper functions which simplify that upcoming change.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 72 ++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 42c89d4863cd5..033e70b42b12a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -143,31 +143,40 @@ core_write_mmd_indirect(struct mt7530_priv *priv, int prtad,
 }
 
 static void
-core_write(struct mt7530_priv *priv, u32 reg, u32 val)
+mt7530_mutex_lock(struct mt7530_priv *priv)
 {
-	struct mii_bus *bus = priv->bus;
+	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+static void
+mt7530_mutex_unlock(struct mt7530_priv *priv)
+{
+	mutex_unlock(&priv->bus->mdio_lock);
+}
+
+static void
+core_write(struct mt7530_priv *priv, u32 reg, u32 val)
+{
+	mt7530_mutex_lock(priv);
 
 	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
 
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 }
 
 static void
 core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 {
-	struct mii_bus *bus = priv->bus;
 	u32 val;
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	val = core_read_mmd_indirect(priv, reg, MDIO_MMD_VEND2);
 	val &= ~mask;
 	val |= set;
 	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
 
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 }
 
 static void
@@ -262,13 +271,11 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
 static void
 mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
-	struct mii_bus *bus = priv->bus;
-
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	mt7530_mii_write(priv, reg, val);
 
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 }
 
 static u32
@@ -280,14 +287,13 @@ _mt7530_unlocked_read(struct mt7530_dummy_poll *p)
 static u32
 _mt7530_read(struct mt7530_dummy_poll *p)
 {
-	struct mii_bus		*bus = p->priv->bus;
 	u32 val;
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(p->priv);
 
 	val = mt7530_mii_read(p->priv, p->reg);
 
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(p->priv);
 
 	return val;
 }
@@ -305,17 +311,16 @@ static void
 mt7530_rmw(struct mt7530_priv *priv, u32 reg,
 	   u32 mask, u32 set)
 {
-	struct mii_bus *bus = priv->bus;
 	u32 val;
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	val = mt7530_mii_read(priv, reg);
 	val &= ~mask;
 	val |= set;
 	mt7530_mii_write(priv, reg, val);
 
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 }
 
 static void
@@ -659,14 +664,13 @@ static int
 mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 			int regnum)
 {
-	struct mii_bus *bus = priv->bus;
 	struct mt7530_dummy_poll p;
 	u32 reg, val;
 	int ret;
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -699,7 +703,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 
 	return ret;
 }
@@ -708,14 +712,13 @@ static int
 mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 			 int regnum, u16 data)
 {
-	struct mii_bus *bus = priv->bus;
 	struct mt7530_dummy_poll p;
 	u32 val, reg;
 	int ret;
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -747,7 +750,7 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 	}
 
 out:
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 
 	return ret;
 }
@@ -755,14 +758,13 @@ mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
 static int
 mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 {
-	struct mii_bus *bus = priv->bus;
 	struct mt7530_dummy_poll p;
 	int ret;
 	u32 val;
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, val,
 				 !(val & MT7531_PHY_ACS_ST), 20, 100000);
@@ -785,7 +787,7 @@ mt7531_ind_c22_phy_read(struct mt7530_priv *priv, int port, int regnum)
 
 	ret = val & MT7531_MDIO_RW_DATA_MASK;
 out:
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 
 	return ret;
 }
@@ -794,14 +796,13 @@ static int
 mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 			 u16 data)
 {
-	struct mii_bus *bus = priv->bus;
 	struct mt7530_dummy_poll p;
 	int ret;
 	u32 reg;
 
 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7531_PHY_IAC);
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	ret = readx_poll_timeout(_mt7530_unlocked_read, &p, reg,
 				 !(reg & MT7531_PHY_ACS_ST), 20, 100000);
@@ -823,7 +824,7 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 	}
 
 out:
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 
 	return ret;
 }
@@ -1104,7 +1105,6 @@ static int
 mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
 	struct mt7530_priv *priv = ds->priv;
-	struct mii_bus *bus = priv->bus;
 	int length;
 	u32 val;
 
@@ -1115,7 +1115,7 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	if (!dsa_is_cpu_port(ds, port))
 		return 0;
 
-	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 
 	val = mt7530_mii_read(priv, MT7530_GMACCR);
 	val &= ~MAX_RX_PKT_LEN_MASK;
@@ -1136,7 +1136,7 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 
 	mt7530_mii_write(priv, MT7530_GMACCR, val);
 
-	mutex_unlock(&bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 
 	return 0;
 }
@@ -1937,10 +1937,10 @@ mt7530_irq_thread_fn(int irq, void *dev_id)
 	u32 val;
 	int p;
 
-	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 	val = mt7530_mii_read(priv, MT7530_SYS_INT_STS);
 	mt7530_mii_write(priv, MT7530_SYS_INT_STS, val);
-	mutex_unlock(&priv->bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 
 	for (p = 0; p < MT7530_NUM_PHYS; p++) {
 		if (BIT(p) & val) {
@@ -1976,7 +1976,7 @@ mt7530_irq_bus_lock(struct irq_data *d)
 {
 	struct mt7530_priv *priv = irq_data_get_irq_chip_data(d);
 
-	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+	mt7530_mutex_lock(priv);
 }
 
 static void
@@ -1985,7 +1985,7 @@ mt7530_irq_bus_sync_unlock(struct irq_data *d)
 	struct mt7530_priv *priv = irq_data_get_irq_chip_data(d);
 
 	mt7530_mii_write(priv, MT7530_SYS_INT_EN, priv->irq_enable);
-	mutex_unlock(&priv->bus->mdio_lock);
+	mt7530_mutex_unlock(priv);
 }
 
 static struct irq_chip mt7530_irq_chip = {
-- 
2.39.2


