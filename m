Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4937EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 00:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phfhr7UAvOxb5N0dT7KSaQgIn0qWgAFnU2KUXHFHXLM=; b=Dym4gTETG0bk20
	cp2eBULFzdOaepEOqvmXL7bzFPuuo7AxyGuY9s/h7XSozUwu5IYGyy7n4TlMvRQq3aHSyw2fOExNV
	LpufXpvaLRkSPlvUVaKsZI1mCx+ot9MPcc0N1MOWSt4ARZ2NuPYTGdZUa3AMfd4eEqRJjmEc4Jd4h
	pd/n9uzJwztlHddDTzzzIXLLwwKfUr9gguuticbivUDhYWUrB5YaUNz30hlFGyx12vxTClA547DXH
	v6Kqq03b9AEm7exWKVG2JCUD3aJPhfXl9JhIfmFA+VV2aNVN7oeunXVd5t2u6gSHEppahBo1S/0Km
	DNLJPaCZyYxYQf3RQeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n203c-00HafJ-2i; Tue, 28 Dec 2021 00:09:36 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n203Z-00HaeH-PD; Tue, 28 Dec 2021 00:09:35 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n203Y-0001Lz-8X; Tue, 28 Dec 2021 01:09:32 +0100
Date: Tue, 28 Dec 2021 00:09:26 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v6 2/2] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <YcpVtjykiS7mgtT5@makrotopia.org>
References: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcnlMtninjjjPhjI@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_160933_855899_19310DEA 
X-CRM114-Status: GOOD (  12.18  )
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
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 56 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  3 ++
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 72b3ae7b5ff8d..4dc1bb521ed76 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -102,10 +102,30 @@ static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
 
 	write_data &= 0xffff;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_WRITE |
-		(phy_reg << PHY_IAC_REG_SHIFT) |
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
@@ -118,10 +138,29 @@ static int _mtk_mdio_read(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg)
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
@@ -493,6 +532,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
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
