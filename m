Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43345C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udaJzJcXBtF9HXQL9SO4E06LQMqDnfMQot223Kq/+rM=; b=rAnUD1xZ4uCv8q
	j9TzN0Vj76hWbecLq6oaCcQab1y8fjZjwrwWKacK7lDETYnMNSSeImwY33V0PCESpgoGUT08pJKNe
	DHjy7Y2sSF7EeqriSl3nEeZbvEImj119x3m5JSzL6gUaeTet2k3MZxUUnD3dbmCWg6riGrffqOLoS
	fZUocNnsIOLArj3KQ5vey+gOMcNnQYR5uRwU1GmXHkFT+OUWoXqAqPOVCFIVd2rSLYan1pBHsXQtV
	OgcxcYF1K8Ndk7EeB8ED/o4D/BMr7wNoc2cKzpS5Wn90KeevkrHFqFnzdcfP96q9wCDNlAHrPc7dC
	DNfl/J/c4aMbGcE2TeEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2113-0003ZO-KY; Tue, 28 Dec 2021 01:11:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2110-0003Xc-8T; Tue, 28 Dec 2021 01:10:59 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n210y-0001T5-Qe; Tue, 28 Dec 2021 02:10:57 +0100
Date: Tue, 28 Dec 2021 01:10:50 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 1/2] net: ethernet: mtk_eth_soc: fix return value of MDIO
 ops
Message-ID: <YcpkGlt+AvEY6JjH@makrotopia.org>
References: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcpVmlb1jFavCBpS@makrotopia.org> <YcpVtjykiS7mgtT5@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcpVmlb1jFavCBpS@makrotopia.org>
 <YcpVtjykiS7mgtT5@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_171058_330564_C20284D4 
X-CRM114-Status: GOOD (  12.04  )
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
appropriate -EBUSY. Also fix return type to int instead of u32
and remove an unneeded variable.

Fixes: 656e705243fd0 ("net-next: mediatek: add support for MT7623 ethernet")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v7: remove unneeded variable
v6: further clean up functions and more cleanly separate patches
v5: fix wrong variable name in first patch covered by follow-up patch
v4: clean-up return values and types, split into two commits

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 +++++++++------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index bcb91b01e69f5..72b3ae7b5ff8d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -94,31 +94,29 @@ static int mtk_mdio_busy_wait(struct mtk_eth *eth)
 	return -1;
 }
 
-static u32 _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr,
-			   u32 phy_register, u32 write_data)
+static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
+			   u32 write_data)
 {
 	if (mtk_mdio_busy_wait(eth))
-		return -1;
+		return -EBUSY;
 
 	write_data &= 0xffff;
 
 	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_WRITE |
-		(phy_register << PHY_IAC_REG_SHIFT) |
+		(phy_reg << PHY_IAC_REG_SHIFT) |
 		(phy_addr << PHY_IAC_ADDR_SHIFT) | write_data,
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
 
 	mtk_w32(eth, PHY_IAC_ACCESS | PHY_IAC_START | PHY_IAC_READ |
 		(phy_reg << PHY_IAC_REG_SHIFT) |
@@ -126,11 +124,9 @@ static u32 _mtk_mdio_read(struct mtk_eth *eth, int phy_addr, int phy_reg)
 		MTK_PHY_IAC);
 
 	if (mtk_mdio_busy_wait(eth))
-		return 0xffff;
-
-	d = mtk_r32(eth, MTK_PHY_IAC) & 0xffff;
+		return -EBUSY;
 
-	return d;
+	return mtk_r32(eth, MTK_PHY_IAC) & 0xffff;
 }
 
 static int mtk_mdio_write(struct mii_bus *bus, int phy_addr,
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
