Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CFAEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miC7CmzG9MtFEEzRMrL1rcuMOoqFJtoDWLMwaPRJqb8=; b=C153xPRCtvZApI1nRmYvHV/Vog
	SUhe7D3mKoIxzREzERlzABFZyTJVxJJ0P8D1fjacGFSCOnf7CzUKj2QLlmpoHqcgnoQ6qahcAv87L
	s6z6QXIXPzwvmrATfqmj7j2Ppturp9F0rMJx0IdaCoUvNUf9LHLHKYiaLzyXRF6370X6UA3fADazZ
	12zrshycSk+e/zHP1peec5LVcaD0JOMqHXpaOjrMptgKhdyM+B1uJvdWghtrWO6y1XBpGFUJShGnJ
	ejeGjOLyl5ZF9NC6WkSbYRzpUf1QYlYJPnQ40ubAh3MEMZpdAJfGYlvh5ceyv+j8GREZVFaHtnAVe
	z+RkkUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoP2-00DwS1-2e;
	Fri, 21 Jul 2023 11:34:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoOz-00DwQV-02;
	Fri, 21 Jul 2023 11:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=miC7CmzG9MtFEEzRMrL1rcuMOoqFJtoDWLMwaPRJqb8=; b=DMHXxpECG+EBu1tCwLHJ+nzN6c
	vR/pf9n1m5gKiFRr7KDB1MJ7ew7w4yPMNp+VfLnNrJP7H8WuFBohRSawrrHVSSTL3UmJiC6bHtanu
	47JcyKPrR75VEd+E1BENmoosHSyd13p5sc0RGIcJyqd7+Ghqb0GHT5f7R1J5DEWknX85wlb/r8HGZ
	z20H6PTkeBLl2b5nXjWPtx8R24vxDtQPmcyrd/wFTLCtGnz8rN1/pUDHu50HUbO5F6qzwCld0n0Wo
	3iAqbgOo9a4L2DmB6TKgSPNMAicn5o2gxNMQjQdagbwB0FtdZ+sCmMyM2S8HTWGvVGLFXpvgtJA8A
	Pzdu1yvA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59156 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qMoOq-0003ns-0I;
	Fri, 21 Jul 2023 12:34:20 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qMoOq-000hhL-1o; Fri, 21 Jul 2023 12:34:20 +0100
In-Reply-To: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
References: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	 Ar__n__ __NAL <arinc.unal@arinc9.com>,
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
Subject: [PATCH net-next 2/4] net: ethernet: mtk_eth_soc: remove
 mac_pcs_get_state and modernise
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qMoOq-000hhL-1o@rmk-PC.armlinux.org.uk>
Date: Fri, 21 Jul 2023 12:34:20 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_043429_046033_7DEC8EBA 
X-CRM114-Status: GOOD (  12.28  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 35 ---------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 46b80ec21b58..0d5f47e2279e 100644
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
@@ -4334,8 +4301,6 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
 	mac->phylink_config.type = PHYLINK_NETDEV;
-	/* This driver makes use of state->speed in mac_config */
-	mac->phylink_config.legacy_pre_march2020 = true;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
 
-- 
2.30.2


