Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB60C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 22:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzEihZuc7nZIeHFPIROH9F6WkFJSDKA1FzDM086Rnks=; b=PNACeabJ/49e1T1wTzOjHByTMX
	G5MPAwJ83go0swrueXaIAHIhJzv+GSAIGX/BIOOrPo0NFmS/mcwUyneo4Ls8gcZD4zQlLy9YBg7wG
	s3mr9fkxB1PtE/1Yqv86cvWilHAVQ3TkdIEEcviGQQvZ7l+9DHwvfZtxu6LEAaPkgivb8qCfXch+a
	oS2RM2yaxg3QpbOF0L4gjciOoAKTVzZsy953UUvq3qC6zKcTQtvGTIjXp9GUf5lHFbcBvthXzRC1O
	z+6sOqTo+p6lafTdgql7f+ky5NebWqgzoDfPamDNNuMUSRMq2J3X74hCo2THWbJhOBKBTjJFasoTq
	iE/03XNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvlYb-000000043Rb-2ylt;
	Sat, 13 Apr 2024 22:09:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvlYS-000000043NX-09H0;
	Sat, 13 Apr 2024 22:09:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD1AD6068C;
	Sat, 13 Apr 2024 22:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 392D6C3277B;
	Sat, 13 Apr 2024 22:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713046138;
	bh=VxogV0yej40FmW+ihYscQHWcN9o7MWNL8mWC4P/lBH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lvCh3Zx3L5oEb3YWbl0xyy9hWZb96N35vx/xbyU9qH3S0BtC6S7feSohnfhlxtICt
	 SKS0b943VX0KS1C0MONVUQmIosyJFqse/C7kHsxaGEJ/37ZVKxuVhilWgvyXXZQAr2
	 iMllvi7+4QDS+IbnL813YSbhnhXcj4xP/nk8hTABqsomvhpe6D0uouTciNW4WcFuNu
	 +17YccKmx3AnVPhveAb6Ju1ULUKdxzjtHChDw0bFOz1Z8zr2o2mDDAWIfx0XCTKWZV
	 7hVo3YEX7IklLhdQX1zhHjJeSXOZNN61t5I7O/KFdEFIAOCkcAYGuwMqRuC78mnr2p
	 68sudnP+BFxiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E81C04FFF;
	Sat, 13 Apr 2024 22:08:58 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Sun, 14 Apr 2024 01:08:20 +0300
Subject: [PATCH net-next 2/2] net: dsa: mt7530: simplify core operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-2-b08936df2770@arinc9.com>
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-0-b08936df2770@arinc9.com>
In-Reply-To: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-0-b08936df2770@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713046128; l=5138;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=o4RCzhO0kgaRNXzb5/selbFyHUCLAME8PrfFOQLNkbw=;
 b=YgnI3He1W+EzOP8bvrmuaBZ3xJ8neD+fuPbDkiAXdS2V8tarzTVqicDpGkmMpeKkn17HZMNGA
 tU++ojNrcp6AQgGw4+x9fsRpWpe1x7Th2yod930BouoLjfCGnb0sS1K
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_150900_201856_EF0F6FEA 
X-CRM114-Status: GOOD (  13.85  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The core_rmw() function calls core_read_mmd_indirect() to read the
requested register, and then calls core_write_mmd_indirect() to write the
requested value to the register. Because Clause 22 is used to access Clause
45 registers, some operations on core_write_mmd_indirect() are
unnecessarily run. Get rid of core_read_mmd_indirect() and
core_write_mmd_indirect(), and run only the necessary operations on
core_write() and core_rmw().

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 108 +++++++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 65 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index fefa6dd151fa..2650eacf87a7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -74,116 +74,94 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0xb8, "RxArlDrop"),
 };
 
-/* Since phy_device has not yet been created and
- * phy_{read,write}_mmd_indirect is not available, we provide our own
- * core_{read,write}_mmd_indirect with core_{clear,write,set} wrappers
- * to complete this function.
- */
-static int
-core_read_mmd_indirect(struct mt7530_priv *priv, int prtad, int devad)
+static void
+mt7530_mutex_lock(struct mt7530_priv *priv)
+{
+	if (priv->bus)
+		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
+
+static void
+mt7530_mutex_unlock(struct mt7530_priv *priv)
+{
+	if (priv->bus)
+		mutex_unlock(&priv->bus->mdio_lock);
+}
+
+static void
+core_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
 	struct mii_bus *bus = priv->bus;
-	int value, ret;
+	int ret;
+
+	mt7530_mutex_lock(priv);
 
 	/* Write the desired MMD Devad */
 	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			 MII_MMD_CTRL, devad);
+			 MII_MMD_CTRL, MDIO_MMD_VEND2);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
 	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			 MII_MMD_DATA, prtad);
+			 MII_MMD_DATA, reg);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
 	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
+			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
-	/* Read the content of the MMD's selected register */
-	value = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			  MII_MMD_DATA);
-
-	return value;
+	/* Write the data into MMD's selected register */
+	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			 MII_MMD_DATA, val);
 err:
-	dev_err(&bus->dev,  "failed to read mmd register\n");
+	if (ret < 0)
+		dev_err(&bus->dev, "failed to write mmd register\n");
 
-	return ret;
+	mt7530_mutex_unlock(priv);
 }
 
-static int
-core_write_mmd_indirect(struct mt7530_priv *priv, int prtad,
-			int devad, u32 data)
+static void
+core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
 {
 	struct mii_bus *bus = priv->bus;
+	u32 val;
 	int ret;
 
+	mt7530_mutex_lock(priv);
+
 	/* Write the desired MMD Devad */
 	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			 MII_MMD_CTRL, devad);
+			 MII_MMD_CTRL, MDIO_MMD_VEND2);
 	if (ret < 0)
 		goto err;
 
 	/* Write the desired MMD register address */
 	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			 MII_MMD_DATA, prtad);
+			 MII_MMD_DATA, reg);
 	if (ret < 0)
 		goto err;
 
 	/* Select the Function : DATA with no post increment */
 	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
+			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
 	if (ret < 0)
 		goto err;
 
+	/* Read the content of the MMD's selected register */
+	val = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
+			MII_MMD_DATA);
+	val &= ~mask;
+	val |= set;
 	/* Write the data into MMD's selected register */
 	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
-			 MII_MMD_DATA, data);
+			 MII_MMD_DATA, val);
 err:
 	if (ret < 0)
-		dev_err(&bus->dev,
-			"failed to write mmd register\n");
-	return ret;
-}
-
-static void
-mt7530_mutex_lock(struct mt7530_priv *priv)
-{
-	if (priv->bus)
-		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
-}
-
-static void
-mt7530_mutex_unlock(struct mt7530_priv *priv)
-{
-	if (priv->bus)
-		mutex_unlock(&priv->bus->mdio_lock);
-}
-
-static void
-core_write(struct mt7530_priv *priv, u32 reg, u32 val)
-{
-	mt7530_mutex_lock(priv);
-
-	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
-
-	mt7530_mutex_unlock(priv);
-}
-
-static void
-core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
-{
-	u32 val;
-
-	mt7530_mutex_lock(priv);
-
-	val = core_read_mmd_indirect(priv, reg, MDIO_MMD_VEND2);
-	val &= ~mask;
-	val |= set;
-	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
+		dev_err(&bus->dev, "failed to write mmd register\n");
 
 	mt7530_mutex_unlock(priv);
 }

-- 
2.40.1



