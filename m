Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95361C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XAZIGrlmUnn/WOWz75diQlsOHO8YYY+kFqMm5WV6LE=; b=jg2uN3zzko6udp
	XA86KAOvWJMKmpHtYkxL+/XyIsXpaZiRB5EwGzVzGCjJCFLw9GG3u9VAaZya+II8EAwVlWmwsoawS
	SPrDTaPhjLccJSDlpv1ejllkgLw+Z6lowsYa4CzR3PeKGA2J43bbFi82xY5rcStZD552UQdPvcRm4
	SXt+nJufYH3JVacXTN9p8OVrRUefoeJDdzHxfz0Qg+34pL615ROw73ExK/nCtGjuLNOSodDHtKQCt
	UjIEvsm32aSk4tUVUbypRh8bo5AljJvlWJ+FaazCYNLWySnwSb5N1v5Bcm2E/UnM3pgGAlYMQxNi1
	X9vjrL3jsJbqSrer76aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2JfB-001qSF-FJ; Tue, 28 Dec 2021 21:05:41 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Jf7-001qQt-VU; Tue, 28 Dec 2021 21:05:39 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n2Jf6-0004JM-F2; Tue, 28 Dec 2021 22:05:36 +0100
Date: Tue, 28 Dec 2021 21:05:29 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Michael Lee <igvtee@gmail.com>
Subject: [PATCH v8 2/3] net: ethernet: mtk_eth_soc: fix return value and
 refactor MDIO ops
Message-ID: <Yct8GVTVCgltr0nj@makrotopia.org>
References: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_130538_046704_F944B8C4 
X-CRM114-Status: GOOD (  15.23  )
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

Instead of returning -1 (-EPERM) when MDIO bus is stuck busy
while writing or 0xffff if it happens while reading, return the
appropriate -EBUSY. Also fix return type to int instead of u32.
Refactor functions to use bitfield helpers instead of having various
masking and shifting constants in the code.

Fixes: 656e705243fd0 ("net-next: mediatek: add support for MT7623 ethernet")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: switch to bitfield helper macros
v7: remove unneeded variables
v6: further clean up functions and more cleanly separate patches
v5: fix wrong variable name in first patch covered by follow-up patch
v4: clean-up return values and types, split into two commits
v3: return -1 instead of 0xffff on error in _mtk_mdio_write
v2: use MII_DEVADDR_C45_SHIFT and MII_REGADDR_C45_MASK to extract
    device id and register address. Unify read and write functions to
    have identical types and parameter names where possible as we are
    anyway already replacing both function bodies.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 35 +++++++++------------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 16 +++++++---
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index bcb91b01e69f5..e3d0a617df196 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -94,43 +94,38 @@ static int mtk_mdio_busy_wait(struct mtk_eth *eth)
 	return -1;
 }
 
-static u32 _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr,
-			   u32 phy_register, u32 write_data)
+static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
+			   u32 write_data)
 {
 	if (mtk_mdio_busy_wait(eth))
-		return -1;
-
-	write_data &= 0xffff;
+		return -EBUSY;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_WRITE |
-		(phy_register << PHY_IAC_REG_SHIFT) |
-		(phy_addr << PHY_IAC_ADDR_SHIFT) | write_data,
+	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C22 | PHY_IAC_CMD_WRITE |
+		PHY_IAC_REG(phy_reg) |
+		PHY_IAC_ADDR(phy_addr) |
+		PHY_IAC_DATA(write_data),
 		MTK_PHY_IAC);
 
 	if (mtk_mdio_busy_wait(eth))
-		return -1;
+		return -EBUSY;
 
 	return 0;
 }
 
-static u32 _mtk_mdio_read(struct mtk_eth *eth, int phy_addr, int phy_reg)
+static int _mtk_mdio_read(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg)
 {
-	u32 d;
-
 	if (mtk_mdio_busy_wait(eth))
-		return 0xffff;
+		return -EBUSY;
 
-	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_READ |
-		(phy_reg << PHY_IAC_REG_SHIFT) |
-		(phy_addr << PHY_IAC_ADDR_SHIFT),
+	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START_C22 | PHY_IAC_CMD_C22_READ |
+		PHY_IAC_REG(phy_reg) |
+		PHY_IAC_ADDR(phy_addr),
 		MTK_PHY_IAC);
 
 	if (mtk_mdio_busy_wait(eth))
-		return 0xffff;
-
-	d = mtk_r32(eth, MTK_PHY_IAC) & 0xffff;
+		return -EBUSY;
 
-	return d;
+	return mtk_r32(eth, MTK_PHY_IAC) & PHY_IAC_DATA_MASK;
 }
 
 static int mtk_mdio_write(struct mii_bus *bus, int phy_addr,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 5ef70dd8b49c6..f2d90639d7ed1 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -341,11 +341,17 @@
 /* PHY Indirect Access Control registers */
 #define MTK_PHY_IAC		0x10004
 #define PHY_IAC_ACCESS		BIT(31)
-#define PHY_IAC_READ		BIT(19)
-#define PHY_IAC_WRITE		BIT(18)
-#define PHY_IAC_START		BIT(16)
-#define PHY_IAC_ADDR_SHIFT	20
-#define PHY_IAC_REG_SHIFT	25
+#define PHY_IAC_REG_MASK	GENMASK(29, 25)
+#define PHY_IAC_REG(x)		FIELD_PREP(PHY_IAC_REG_MASK, (x))
+#define PHY_IAC_ADDR_MASK	GENMASK(24, 20)
+#define PHY_IAC_ADDR(x)		FIELD_PREP(PHY_IAC_ADDR_MASK, (x))
+#define PHY_IAC_CMD_MASK	GENMASK(19, 18)
+#define PHY_IAC_CMD_WRITE	FIELD_PREP(PHY_IAC_CMD_MASK, 1)
+#define PHY_IAC_CMD_C22_READ	FIELD_PREP(PHY_IAC_CMD_MASK, 2)
+#define PHY_IAC_START_MASK	GENMASK(17, 16)
+#define PHY_IAC_START_C22	FIELD_PREP(PHY_IAC_START_MASK, 1)
+#define PHY_IAC_DATA_MASK	GENMASK(15, 0)
+#define PHY_IAC_DATA(x)		FIELD_PREP(PHY_IAC_DATA_MASK, (x))
 #define PHY_IAC_TIMEOUT		HZ
 
 #define MTK_MAC_MISC		0x1000c
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
