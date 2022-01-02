Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973FAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jan 2022 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKXzpM+xqAXcytyZEJKBriKbvpNoZDc4wYXjcXA0+nA=; b=TvZJnZffSfl3+y
	aiawMSkBiZk1vboShUTmZy07u5J9+VOOSYpP1FsfTUqZtdPMM6gH+5PWtXIXiZvlCKyXZD0UfimQN
	+VlrcBFgXsF+4VFwb0wnU/uor+6WdAe/jlQndpY9yRPCJKdWzlt1CINHOWaA5iCtecrRt2YasZx9B
	C8THJm2pFRbHuxWuxsNYO8rI0H3UCufONWf+GoeFj1k8ltnW87IKsX6zbLkxlEWBJdHRmAAb+0eOE
	wLYRQvyj10hsALsqbeU4oSq8BIF7T57Fjkw+Dy9WX7zubhSsoKxhx8hRFQOW+8gkhrXQWvRrfhCh+
	Sn22+EqUCM4JYUEfHcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n43fF-007weB-FH; Sun, 02 Jan 2022 16:24:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n43f3-007wbO-Tc; Sun, 02 Jan 2022 16:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EFCC1DrFRpOilIEomPY0aFqpm+7e00nCTrkgBMHqDLs=; b=FjefIGNhfbdcR5H5I4fPdwsb5a
 KxVz+RwYTHwQeAiqrrhYoc9XQYX0sHaR5CLN07TUl0T4/3/t4yVIbw1C84YS6Qz10FNrU7L6dvbyM
 6pEI9dv2FGYteSWsgv4TIAlwI+C6ODmbBsDSAR/2xaWD8V6utssHK7dqYFipueXpDvjsL5CHyAVt1
 1BwJ8/eC6ZGMckmmj7fZxZiYGyDZ90u7X2yYNeZVeELZZ2s47gMdnYmVV+4R7VKzFxfR0KAqyCvuE
 yt+Bfiu5/Y/7yHwJdsdAK5oLJyQQE2asd8eyRoYAHnBqgyeZY8v2LvWogusYlWwijEPJVFikfL1Hu
 qVGTlD2A==;
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n436x-004xYr-0D; Sun, 02 Jan 2022 15:50:05 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n436o-00018x-8a; Sun, 02 Jan 2022 16:49:22 +0100
Date: Sun, 2 Jan 2022 15:49:16 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Michael Lee <igvtee@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v10 3/3] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <YdHJfPVBHUlIs3Yp@makrotopia.org>
References: <YdCNZh5PsBwbfMtp@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdCNZh5PsBwbfMtp@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_154931_166470_0F475B17 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Implement read and write access to IEEE 802.3 Clause 45 Ethernet
phy registers while making use of new mdiobus_c45_regad and
mdiobus_c45_devad helpers.
Improve readability by using bitfield helper macros which makes the
register definitions in the header file resemble the exact values
stated in the Reference Manual.

Tested on the Ubiquiti UniFi 6 LR access point featuring
MediaTek MT7622BV WiSoC with Aquantia AQR112C.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v10: unchanged
v9: improved formatting and Cc missing maintainer
v8: switch to bitfield helper macros, incl. newly introduced ones
v7: remove unneeded variables and order OR-ed call parameters
v6: further clean up functions and more cleanly separate patches
v5: fix wrong variable name in first patch covered by follow-up patch
v4: clean-up return values and types, split into two commits
v3: return -1 instead of 0xffff on error in _mtk_mdio_write
v2: use MII_DEVADDR_C45_SHIFT and MII_REGADDR_C45_MASK to extract
    device id and register address. Unify read and write functions to
    have identical types and parameter names where possible as we are
    anyway already replacing both function bodies.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 68 +++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  3 +
 2 files changed, 58 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0806688567d8b..786f3d63ec78c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -100,13 +100,34 @@ static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
 
-	mtk_w32(eth, PHY_IAC_ACCESS |
-		     PHY_IAC_START_C22 |
-		     PHY_IAC_CMD_WRITE |
-		     PHY_IAC_REG(phy_reg) |
-		     PHY_IAC_ADDR(phy_addr) |
-		     PHY_IAC_DATA(write_data),
-		MTK_PHY_IAC);
+	if (phy_reg & MII_ADDR_C45) {
+		mtk_w32(eth, PHY_IAC_ACCESS |
+			     PHY_IAC_START_C45 |
+			     PHY_IAC_CMD_C45_ADDR |
+			     PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			     PHY_IAC_ADDR(phy_addr) |
+			     PHY_IAC_DATA(mdiobus_c45_regad(phy_reg)),
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return -EBUSY;
+
+		mtk_w32(eth, PHY_IAC_ACCESS |
+			     PHY_IAC_START_C45 |
+			     PHY_IAC_CMD_WRITE |
+			     PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			     PHY_IAC_ADDR(phy_addr) |
+			     PHY_IAC_DATA(write_data),
+			MTK_PHY_IAC);
+	} else {
+		mtk_w32(eth, PHY_IAC_ACCESS |
+			     PHY_IAC_START_C22 |
+			     PHY_IAC_CMD_WRITE |
+			     PHY_IAC_REG(phy_reg) |
+			     PHY_IAC_ADDR(phy_addr) |
+			     PHY_IAC_DATA(write_data),
+			MTK_PHY_IAC);
+	}
 
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
@@ -119,12 +140,32 @@ static int _mtk_mdio_read(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg)
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
 
-	mtk_w32(eth, PHY_IAC_ACCESS |
-		     PHY_IAC_START_C22 |
-		     PHY_IAC_CMD_C22_READ |
-		     PHY_IAC_REG(phy_reg) |
-		     PHY_IAC_ADDR(phy_addr),
-		MTK_PHY_IAC);
+	if (phy_reg & MII_ADDR_C45) {
+		mtk_w32(eth, PHY_IAC_ACCESS |
+			     PHY_IAC_START_C45 |
+			     PHY_IAC_CMD_C45_ADDR |
+			     PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			     PHY_IAC_ADDR(phy_addr) |
+			     PHY_IAC_DATA(mdiobus_c45_regad(phy_reg)),
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return -EBUSY;
+
+		mtk_w32(eth, PHY_IAC_ACCESS |
+			     PHY_IAC_START_C45 |
+			     PHY_IAC_CMD_C45_READ |
+			     PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			     PHY_IAC_ADDR(phy_addr),
+			MTK_PHY_IAC);
+	} else {
+		mtk_w32(eth, PHY_IAC_ACCESS |
+			     PHY_IAC_START_C22 |
+			     PHY_IAC_CMD_C22_READ |
+			     PHY_IAC_REG(phy_reg) |
+			     PHY_IAC_ADDR(phy_addr),
+			MTK_PHY_IAC);
+	}
 
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
@@ -496,6 +537,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 	eth->mii_bus->name = "mdio";
 	eth->mii_bus->read = mtk_mdio_read;
 	eth->mii_bus->write = mtk_mdio_write;
+	eth->mii_bus->probe_capabilities = MDIOBUS_C22_C45;
 	eth->mii_bus->priv = eth;
 	eth->mii_bus->parent = eth->dev;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index f2d90639d7ed1..c9d42be314b5a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -346,9 +346,12 @@
 #define PHY_IAC_ADDR_MASK	GENMASK(24, 20)
 #define PHY_IAC_ADDR(x)		FIELD_PREP(PHY_IAC_ADDR_MASK, (x))
 #define PHY_IAC_CMD_MASK	GENMASK(19, 18)
+#define PHY_IAC_CMD_C45_ADDR	FIELD_PREP(PHY_IAC_CMD_MASK, 0)
 #define PHY_IAC_CMD_WRITE	FIELD_PREP(PHY_IAC_CMD_MASK, 1)
 #define PHY_IAC_CMD_C22_READ	FIELD_PREP(PHY_IAC_CMD_MASK, 2)
+#define PHY_IAC_CMD_C45_READ	FIELD_PREP(PHY_IAC_CMD_MASK, 3)
 #define PHY_IAC_START_MASK	GENMASK(17, 16)
+#define PHY_IAC_START_C45	FIELD_PREP(PHY_IAC_START_MASK, 0)
 #define PHY_IAC_START_C22	FIELD_PREP(PHY_IAC_START_MASK, 1)
 #define PHY_IAC_DATA_MASK	GENMASK(15, 0)
 #define PHY_IAC_DATA(x)		FIELD_PREP(PHY_IAC_DATA_MASK, (x))
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
