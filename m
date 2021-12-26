Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A38C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Dec 2021 21:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+fhsh8X/9chyYJUgUzUt3Asue3/CUbQWU9YUjJxErQA=; b=HUtHBCW8oOHIQW
	rnCA9O5PM26zU3wBDH4lhrRtdTryXBVyFZ3JoI9IsZKo+an+MwqWAqlzacHUPB8XMkiQIO7aUM+hy
	rzJ2OPWszvOn+tzso0dtRYRSv8DhQPbfqRxDWjQ9sr51h2ufucq3QIUPGbM8kKoNv3rRSh7nNsqm7
	uhPO1sc3nk9r/M3Ld8BzlixYSUgbpgve+1F1xXdECqoTA0JMvzRBzsoKPFz32WB1es28DNiDfbNAO
	lzBvBATizV9AN0afiEHpzuVz4atW1A++td8/trkXot7mX85lU9JWwfEy8kcrITqGa+YE7erl4KDr/
	DarB643ukTvDlToI4AjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1b5D-00FsJZ-AL; Sun, 26 Dec 2021 21:29:35 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1b58-00FsJA-TA; Sun, 26 Dec 2021 21:29:32 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n1b4w-0006KZ-7T; Sun, 26 Dec 2021 22:29:18 +0100
Date: Sun, 26 Dec 2021 21:29:09 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO access
Message-ID: <YcjepQ2fmkPZ2+pE@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_132930_992096_5FBE12B3 
X-CRM114-Status: GOOD (  11.22  )
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
index bcb91b01e69f5..9f896a90a4c4c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -102,10 +102,30 @@ static u32 _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr,
 
 	write_data &= 0xffff;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_WRITE |
-		(phy_register << PHY_IAC_REG_SHIFT) |
-		(phy_addr << PHY_IAC_ADDR_SHIFT) | write_data,
-		MTK_PHY_IAC);
+	if (phy_register & MII_ADDR_C45) {
+		u8 dev_num = (phy_register >> 16) & 0x1f;
+		u16 reg = (u16)(phy_register & 0xffff);
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_SET_ADDR |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) |
+			(dev_num << PHY_IAC_REG_SHIFT) |
+			reg,
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return 0xffff;
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_WRITE |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) |
+			(dev_num << PHY_IAC_REG_SHIFT) |
+			write_data,
+			MTK_PHY_IAC);
+	} else {
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_WRITE |
+			(phy_register << PHY_IAC_REG_SHIFT) |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) | write_data,
+			MTK_PHY_IAC);
+	}
 
 	if (mtk_mdio_busy_wait(eth))
 		return -1;
@@ -120,10 +140,29 @@ static u32 _mtk_mdio_read(struct mtk_eth *eth, int phy_addr, int phy_reg)
 	if (mtk_mdio_busy_wait(eth))
 		return 0xffff;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_READ |
-		(phy_reg << PHY_IAC_REG_SHIFT) |
-		(phy_addr << PHY_IAC_ADDR_SHIFT),
-		MTK_PHY_IAC);
+	if (phy_reg & MII_ADDR_C45) {
+		u8 dev_num = (phy_reg >> 16) & 0x1f;
+		u16 reg = (u16)(phy_reg & 0xffff);
+
+		mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C45 | PHY_IAC_SET_ADDR |
+			(phy_addr << PHY_IAC_ADDR_SHIFT) |
+			(dev_num << PHY_IAC_REG_SHIFT) |
+			reg,
+			MTK_PHY_IAC);
+
+		if (mtk_mdio_busy_wait(eth))
+			return 0xffff;
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
 		return 0xffff;
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
