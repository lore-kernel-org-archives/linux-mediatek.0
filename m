Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECB2C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi14cTdYANNPEap3pqdxxJ1hsHfM+r9CN0mSG8FKdBA=; b=sr/aSTwGZm7GRDktzRTzNujRnH
	hVHuIgiDktFGm5iY8HFYiGTJdsYi9cUHk9MzvzBAk2Ippp0tS/sqPCGwEx9Iv74USiTMZGI3e6Tk5
	+w6RLFP1bgeyM6ERTRBp1FTJoT5PyOTaar63uii0lxhFsYdS6UpmwMMMRK6Amv1U8L/8MrHkQxPhb
	iD0cYN6LCS2lXuWnu/UVBncRNZQTH5iM48ug26Wecd0IVR6tsxLIrlVKMVpnQJyoLHaPF9moSt43P
	8fAw0klJ5aDQiLeVVb8uArwbeffY0JL7n/F3rHIhYb3rUX0fklZ/jLJTiD3XHmIKJ2eqFK3oVK4iT
	h3H8J4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa4W-001VAg-NI; Tue, 07 Mar 2023 16:21:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa4F-001U2B-Sh; Tue, 07 Mar 2023 16:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yi14cTdYANNPEap3pqdxxJ1hsHfM+r9CN0mSG8FKdBA=; b=lmNr0w/4ILfy8+0HYuHQPMkt+G
	Hz+k3Xho9bodsMJu8RVod+di3arGpOuTeune1MIVwOXNBbwvsg0Ee+sktL3djw7+ZwYZOsXq6mk3w
	nJSHXisLwO8nPwET//pxuoEfdysiV5/OmJpQGP1KNupiSupg5+B9q18bQAgbXYNwPVV5qbEu82itn
	+dAp9z7eWc4BrxDkVqhXjpc+tzgSdJX+fPr7oB3cmPsZZLr1/XV8yRMKBWGQDEjJReXe8bKqQ30Dp
	VqiuOHHBzpW52VAJ+xRVGuKW3yjJHuXrgsfiEoC2Wkj/+k2OkREvl1szjcBGM+fhB53Z8a1bnO3uB
	g3YGWHMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49534 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1pZa2B-0000mt-72; Tue, 07 Mar 2023 16:19:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1pZa2A-00DFfD-JI; Tue, 07 Mar 2023 16:19:26 +0000
In-Reply-To: <ZAdj9qUXcHUsK7Gt@shell.armlinux.org.uk>
References: <ZAdj9qUXcHUsK7Gt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>,
	 Felix Fietkau <nbd@nbd.name>,
	 John Crispin <john@phrozen.org>,
	 Mark Lee <Mark-MC.Lee@mediatek.com>,
	 Matthias Brugger <matthias.bgg@gmail.com>,
	 Sean Wang <sean.wang@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 1/4] net: mtk_eth_soc: tidy mtk_gmac0_rgmii_adjust()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pZa2A-00DFfD-JI@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Mar 2023 16:19:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_082135_963843_FAE875D0 
X-CRM114-Status: GOOD (  10.37  )
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

Get rid of the multiple tenary operators in mtk_gmac0_rgmii_adjust()
replacing them with a single if(), thus making the code easier to read.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 34 ++++++++++++---------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 14be6ea51b88..c63f17929ccf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -397,38 +397,42 @@ static int mt7621_gmac0_rgmii_adjust(struct mtk_eth *eth,
 static void mtk_gmac0_rgmii_adjust(struct mtk_eth *eth,
 				   phy_interface_t interface, int speed)
 {
-	u32 val;
+	unsigned long rate;
+	u32 tck, rck, intf;
 	int ret;
 
 	if (interface == PHY_INTERFACE_MODE_TRGMII) {
 		mtk_w32(eth, TRGMII_MODE, INTF_MODE);
-		val = 500000000;
-		ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], val);
+		ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], 500000000);
 		if (ret)
 			dev_err(eth->dev, "Failed to set trgmii pll: %d\n", ret);
 		return;
 	}
 
-	val = (speed == SPEED_1000) ?
-		INTF_MODE_RGMII_1000 : INTF_MODE_RGMII_10_100;
-	mtk_w32(eth, val, INTF_MODE);
+	if (speed == SPEED_1000) {
+		intf = INTF_MODE_RGMII_1000;
+		rate = 250000000;
+		rck = RCK_CTRL_RGMII_1000;
+		tck = TCK_CTRL_RGMII_1000;
+	} else {
+		intf = INTF_MODE_RGMII_10_100;
+		rate = 500000000;
+		rck = RCK_CTRL_RGMII_10_100;
+		tck = TCK_CTRL_RGMII_10_100;
+	}
+
+	mtk_w32(eth, intf, INTF_MODE);
 
 	regmap_update_bits(eth->ethsys, ETHSYS_CLKCFG0,
 			   ETHSYS_TRGMII_CLK_SEL362_5,
 			   ETHSYS_TRGMII_CLK_SEL362_5);
 
-	val = (speed == SPEED_1000) ? 250000000 : 500000000;
-	ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], val);
+	ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], rate);
 	if (ret)
 		dev_err(eth->dev, "Failed to set trgmii pll: %d\n", ret);
 
-	val = (speed == SPEED_1000) ?
-		RCK_CTRL_RGMII_1000 : RCK_CTRL_RGMII_10_100;
-	mtk_w32(eth, val, TRGMII_RCK_CTRL);
-
-	val = (speed == SPEED_1000) ?
-		TCK_CTRL_RGMII_1000 : TCK_CTRL_RGMII_10_100;
-	mtk_w32(eth, val, TRGMII_TCK_CTRL);
+	mtk_w32(eth, rck, TRGMII_RCK_CTRL);
+	mtk_w32(eth, tck, TRGMII_TCK_CTRL);
 }
 
 static struct phylink_pcs *mtk_mac_select_pcs(struct phylink_config *config,
-- 
2.30.2


