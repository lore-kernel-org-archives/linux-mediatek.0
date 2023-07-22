Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EA2C001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 20:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7o6K/jJA6ZoR8HhDQF21C/HKxRRr7+HtxLNhNXpxl0=; b=JrWK+mD0XpV9nq5kxvMPLs7RnZ
	wh+ffTxFcOwuSWFGiKHHGb1Rpzrr+NxLOpUFDmHu0gyYomh85KiBlnJ206i++vGITOdiEErJP2f2Z
	4iLoK7tirt6CWBuWGbhjKMM6WijAma0UERmo7/OXMR4QM+upcWJ/c8Au37ldgRixFT+cdwyfQKKaK
	vUvT6csrWFcM2TsMqcBMKZeaxeIH6nJRmL60Q0+eO9I90I6DuGXLEo4c4ZojxDY2o05ZRxS4yq0kJ
	mgcOVVh4RTzhlco5yruIKrZx/6CQHs2DB4W0Sxt1biKzL5DEVBNCxpR4sn7SU3EKteH6Tmikms0sg
	IPcHVvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNJHn-00HGIR-26;
	Sat, 22 Jul 2023 20:33:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNJHe-00HGEp-2q;
	Sat, 22 Jul 2023 20:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b7o6K/jJA6ZoR8HhDQF21C/HKxRRr7+HtxLNhNXpxl0=; b=wra8zcHqo7cgkMOWQn8yOl7bG5
	1Bo5ouHdNXGqNG+1d1ln7V5K4RdheSSTsKrK4+du/09H1jQjfMjrrxacxSCZ8/+sGgryXSyur/NB2
	cCMaMHbo1jjeY2yixHtM8wlRwpxkc+W2zBEN5axKDbXVGI/pIjSVcoVzZU+jMdp8bevfjVkMdky2v
	jXUZuvV7c1dYF8SL2WPi+G6LwJSpQ73d3vIcM9wNgjcQA0tsrFXjv5MEhK+W7wuio6ofdGt907XOD
	CYET3NyklfxRgR9V7iMi5HZuwoohfTZYHU2Cy+QOejTZeragsNSjVsKVB6zZus0cz/6peilnlJbVW
	vi+wTxHA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48302 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qNJHa-000666-2Y;
	Sat, 22 Jul 2023 21:32:54 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qNJHa-000kFZ-PS; Sat, 22 Jul 2023 21:32:54 +0100
In-Reply-To: <ZLw8DoRskRXLQK37@shell.armlinux.org.uk>
References: <ZLw8DoRskRXLQK37@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	 =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	 Frank Wunderlich <frank-w@public-files.de>,
	 David Woodhouse <dwmw@amazon.co.uk>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	Jakub Kicinski <kuba@kernel.org>,
	John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next v2 2/4] net: ethernet: mtk_eth_soc: remove
 mac_pcs_get_state and modernise
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qNJHa-000kFZ-PS@rmk-PC.armlinux.org.uk>
Date: Sat, 22 Jul 2023 21:32:54 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_133258_938862_19DB9457 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove the .mac_pcs_get_state function, since as far as I can tell is
never called - no DT appears to specify an in-band-status management
nor SFP support for this driver.

Removal of this, along with the previous patch to remove the incorrect
clocking configuration, means that the driver becomes non-legacy, so
we can remove the "legacy_pre_march2020" status from this driver.

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 35 ---------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index fe8b7e38decc..7490d48000c2 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -568,38 +568,6 @@ static int mtk_mac_finish(struct phylink_config *config, unsigned int mode,
 	return 0;
 }
 
-static void mtk_mac_pcs_get_state(struct phylink_config *config,
-				  struct phylink_link_state *state)
-{
-	struct mtk_mac *mac = container_of(config, struct mtk_mac,
-					   phylink_config);
-	u32 pmsr = mtk_r32(mac->hw, MTK_MAC_MSR(mac->id));
-
-	state->link = (pmsr & MAC_MSR_LINK);
-	state->duplex = (pmsr & MAC_MSR_DPX) >> 1;
-
-	switch (pmsr & (MAC_MSR_SPEED_1000 | MAC_MSR_SPEED_100)) {
-	case 0:
-		state->speed = SPEED_10;
-		break;
-	case MAC_MSR_SPEED_100:
-		state->speed = SPEED_100;
-		break;
-	case MAC_MSR_SPEED_1000:
-		state->speed = SPEED_1000;
-		break;
-	default:
-		state->speed = SPEED_UNKNOWN;
-		break;
-	}
-
-	state->pause &= (MLO_PAUSE_RX | MLO_PAUSE_TX);
-	if (pmsr & MAC_MSR_RX_FC)
-		state->pause |= MLO_PAUSE_RX;
-	if (pmsr & MAC_MSR_TX_FC)
-		state->pause |= MLO_PAUSE_TX;
-}
-
 static void mtk_mac_link_down(struct phylink_config *config, unsigned int mode,
 			      phy_interface_t interface)
 {
@@ -722,7 +690,6 @@ static void mtk_mac_link_up(struct phylink_config *config,
 
 static const struct phylink_mac_ops mtk_phylink_ops = {
 	.mac_select_pcs = mtk_mac_select_pcs,
-	.mac_pcs_get_state = mtk_mac_pcs_get_state,
 	.mac_config = mtk_mac_config,
 	.mac_finish = mtk_mac_finish,
 	.mac_link_down = mtk_mac_link_down,
@@ -4327,8 +4294,6 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
 	mac->phylink_config.type = PHYLINK_NETDEV;
-	/* This driver makes use of state->speed in mac_config */
-	mac->phylink_config.legacy_pre_march2020 = true;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
 
-- 
2.30.2


