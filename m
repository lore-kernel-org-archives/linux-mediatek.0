Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C6DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8LhW+vtOXh6fWFIxmRgQYe8uqrEmThHygKspEapWro=; b=mh9tIs4TkhXRvF
	c9hdlMJ17ELMtuqnI9IDuvZREvMSVR/guR1lzv1EhznuffkQzrGq1ltDIAsxoflQaZmihYeeM1hfO
	iMooEE/4ZDs1LIXkt+0T9sR1HRaNpa1Kzq+uePIVdN1I561S39ef9KDJsqmvr5awBKr+uJ9C1jS7y
	GCypT695hJDxB4npAyW+4/0vEREDl+nYN1HJswDC6PMQdJuIBOsXUzUVIvAG5oU/YNbSXwY06FQJl
	vx72o7hFNKxhM0lbjiFYMS56Oj8dxcv9iOKEcPjwzhTtY5en/8lKEzZGnGiY93bPed3C/IzO/sq1/
	Z7rFHdIcU2iMx33XS2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Jfb-001qdM-8v; Tue, 28 Dec 2021 21:06:07 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2JfY-001qbR-0t; Tue, 28 Dec 2021 21:06:05 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n2JfV-0004Ju-Vb; Tue, 28 Dec 2021 22:06:02 +0100
Date: Tue, 28 Dec 2021 21:05:54 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Michael Lee <igvtee@gmail.com>
Subject: [PATCH v8 3/3] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <Yct8MnI/J9Yqd2Zx@makrotopia.org>
References: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_130604_099269_0BB5D70E 
X-CRM114-Status: GOOD (  13.71  )
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

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 52 +++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  3 ++
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e3d0a617df196..2ce142352616c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -100,11 +100,28 @@ static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C22 | PHY_IAC_CMD_WRITE |
-		PHY_IAC_REG(phy_reg) |
-		PHY_IAC_ADDR(phy_addr) |
-		PHY_IAC_DATA(write_data),
-		MTK_PHY_IAC);
+	if (phy_reg & MII_ADDR_C45) {
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_CMD_C45_ADDR |
+			PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			PHY_IAC_ADDR(phy_addr) |
+			PHY_IAC_DATA(mdiobus_c45_regad(phy_reg)),
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return -EBUSY;
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_CMD_WRITE |
+			PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			PHY_IAC_ADDR(phy_addr) |
+			PHY_IAC_DATA(write_data),
+			MTK_PHY_IAC);
+	} else {
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C22 | PHY_IAC_CMD_WRITE |
+			PHY_IAC_REG(phy_reg) |
+			PHY_IAC_ADDR(phy_addr) |
+			PHY_IAC_DATA(write_data),
+			MTK_PHY_IAC);
+	}
 
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
@@ -117,10 +134,26 @@ static int _mtk_mdio_read(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg)
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C22 | PHY_IAC_CMD_C22_READ |
-		PHY_IAC_REG(phy_reg) |
-		PHY_IAC_ADDR(phy_addr),
-		MTK_PHY_IAC);
+	if (phy_reg & MII_ADDR_C45) {
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_CMD_C45_ADDR |
+			PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			PHY_IAC_ADDR(phy_addr) |
+			PHY_IAC_DATA(mdiobus_c45_regad(phy_reg)),
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return -EBUSY;
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_CMD_C45_READ |
+			PHY_IAC_REG(mdiobus_c45_devad(phy_reg)) |
+			PHY_IAC_ADDR(phy_addr),
+			MTK_PHY_IAC);
+	} else {
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C22 | PHY_IAC_CMD_C22_READ |
+			PHY_IAC_REG(phy_reg) |
+			PHY_IAC_ADDR(phy_addr),
+			MTK_PHY_IAC);
+	}
 
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
@@ -492,6 +525,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
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
