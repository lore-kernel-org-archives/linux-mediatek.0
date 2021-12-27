Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aidlz4+XWmJ9NOL1CivyJFhmz8titaCmhlyhixjzKPI=; b=gylDMENUATQTPx
	9XzrRnPxdIGl+0mevB3rrXSRnwDLrRPx6Rg7SpO00IGLKKXSdVJxqkM1V3F1bWj1ijWm0lTXoipJo
	tngh7N3tdq9heUuwyaf8jSo1bkyYuu1qfRm3Gg6y98YX7A0Yr7zqqVfPbzA2LCc8amj3xrU0GLk2K
	iBe+urIMnmrTazF/0cYFIX9hLElvbWqHuPOvmMbBshnJqKuf0+aDHLUB44o8pfhfVxOJ+SIl4ViXl
	JrjQR9kH5oVCNK1W/rVmZyScVIRqADOrhCrU/YYCq5C7M+YcS5a/NmjaMflE2sBQtCBjRv+UUz76V
	TxxxihO7bEtD5uorjH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uAU-00HB8q-46; Mon, 27 Dec 2021 17:52:18 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uAR-00HB6w-5r; Mon, 27 Dec 2021 17:52:16 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n1uAP-0000AE-5J; Mon, 27 Dec 2021 18:52:13 +0100
Date: Mon, 27 Dec 2021 17:52:07 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v4 2/2] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <Ycn9R+Cgu/cxGWvc@makrotopia.org>
References: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_095215_257586_5B9FAAF5 
X-CRM114-Status: GOOD (  13.47  )
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
phy registers.
Tested on the Ubiquiti UniFi 6 LR access point featuring
MediaTek MT7622BV WiSoC with Aquantia AQR112C.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: clean-up return values and types, split into two commits
v3: return -1 instead of 0xffff on error in _mtk_mdio_write
v2: use MII_DEVADDR_C45_SHIFT and MII_REGADDR_C45_MASK to extract
    device id and register address. Unify read and write functions to
    have identical types and parameter names where possible as we are
    anyway already replacing both function bodies.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 60 +++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  3 ++
 2 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0bf8d0a3b1781..67e3ffdf73cce 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -102,10 +102,30 @@ static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
 
 	write_data &= 0xffff;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_WRITE |
-		(phy_register << PHY_IAC_REG_SHIFT) |
-		(phy_addr << PHY_IAC_ADDR_SHIFT) | write_data,
-		MTK_PHY_IAC);
+	if (phy_reg & MII_ADDR_C45) {
+		u8 dev_num = (phy_reg >> MII_DEVADDR_C45_SHIFT) & GENMASK(4, 0);
+		u16 reg = (u16)(phy_reg & MII_REGADDR_C45_MASK);
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_SET_ADDR |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) |
+			(dev_num << PHY_IAC_REG_SHIFT) |
+			reg,
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return -EBUSY;
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_WRITE |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) |
+			(dev_num << PHY_IAC_REG_SHIFT) |
+			write_data,
+			MTK_PHY_IAC);
+	} else {
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_WRITE |
+			(phy_reg << PHY_IAC_REG_SHIFT) |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) | write_data,
+			MTK_PHY_IAC);
+	}
 
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
@@ -113,17 +133,36 @@ static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
 	return 0;
 }
 
-static int _mtk_mdio_read(struct mtk_eth *eth, int phy_addr, int phy_reg)
+static int _mtk_mdio_read(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg)
 {
-	u32 d;
+	int d;
 
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_READ |
-		(phy_reg << PHY_IAC_REG_SHIFT) |
-		(phy_addr << PHY_IAC_ADDR_SHIFT),
-		MTK_PHY_IAC);
+	if (phy_reg & MII_ADDR_C45) {
+		u8 dev_num = (phy_reg >> MII_DEVADDR_C45_SHIFT) & GENMASK(4, 0);
+		u16 reg = (u16)(phy_reg & MII_REGADDR_C45_MASK);
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_SET_ADDR |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) |
+			(dev_num << PHY_IAC_REG_SHIFT) |
+			reg,
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return -EBUSY;
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_READ_C45 |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) |
+			(dev_num << PHY_IAC_REG_SHIFT),
+			MTK_PHY_IAC);
+	} else {
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_READ |
+			(phy_reg << PHY_IAC_REG_SHIFT) |
+			(phy_addr << PHY_IAC_ADDR_SHIFT),
+			MTK_PHY_IAC);
+	}
 
 	if (mtk_mdio_busy_wait(eth))
 		return -EBUSY;
@@ -497,6 +536,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 	eth->mii_bus->name = "mdio";
 	eth->mii_bus->read = mtk_mdio_read;
 	eth->mii_bus->write = mtk_mdio_write;
+	eth->mii_bus->probe_capabilities = MDIOBUS_C22_C45;
 	eth->mii_bus->priv = eth;
 	eth->mii_bus->parent = eth->dev;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 5ef70dd8b49c6..b73d8adc9d24c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -341,9 +341,12 @@
 /* PHY Indirect Access Control registers */
 #define MTK_PHY_IAC		0x10004
 #define PHY_IAC_ACCESS		BIT(31)
+#define PHY_IAC_SET_ADDR	0
 #define PHY_IAC_READ		BIT(19)
+#define PHY_IAC_READ_C45	(BIT(18) | BIT(19))
 #define PHY_IAC_WRITE		BIT(18)
 #define PHY_IAC_START		BIT(16)
+#define PHY_IAC_START_C45	0
 #define PHY_IAC_ADDR_SHIFT	20
 #define PHY_IAC_REG_SHIFT	25
 #define PHY_IAC_TIMEOUT		HZ
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
