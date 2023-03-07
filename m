Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A444C6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyYz/AUKR8MEcdMCQ0ODdE2rUmVBnI7WjgTTUNTbSIc=; b=e6eq4QsHh0sfaIbSDcZ5HLQP6l
	stxRfFWXr3tkRn4aNDTxCULJxBpe2LkkRJV//xuoVySJS7vRNjnkq9L6MjX+USeRj2wpcY37QlQat
	0vSg+wpmPxogiYHfV2Hd7a8XJX1ZJmIUmA7WG3T8zZnbq+G4GUdDjjb6+1X9iIPiRZqXiQaKymhXa
	oHZ6M3uL5zvJhOgU5Ke9R7BymVNG5fEbeYSmqhBHST+s1tZVbwN/BXRhQBV07tEKo3Dl8FW1omnZK
	Yq0gZgLnF4OAX99wxfBZHmU8Yu4ULmRM2WbCPigWMNo7JwLmPtLOg646dNWGuwPBytMdA9uY//KEV
	j8W992tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa3b-001UgK-HB; Tue, 07 Mar 2023 16:20:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa2W-001U8l-Nk; Tue, 07 Mar 2023 16:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HyYz/AUKR8MEcdMCQ0ODdE2rUmVBnI7WjgTTUNTbSIc=; b=DJPCyKduVvrm2n6qeA5tra0Jv6
	jQYvac9gZQ5NyPjfsbeJHCh1fdLc9tKDkbuPe1HMXBhPiozXWFCZ+U+hPX7f5c/MUtz7XDCCMZ/Gg
	L8hCHhpMcvCV4muhdyT174TS2whVBG96GtzfDSEkTdbQ+TndwcbvVaaxWUyxlJs7SPZ2fJ/LuXwQ2
	9gFeXleXVovJzS5pnhAYzlusjQIt/3IE2I74CAr66PzHvDwSpvwca4BXj1MDiwb1xD6naoWh9udv2
	Fad4UNvHuILW1RdMy5hDjL/5v92YtC4IkVJj3XrLE7yf4Z3gnPbfDJwuRh1DMzsrw0vN2a67gFyIY
	U0JWrHOg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58702 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1pZa2Q-0000nX-Gs; Tue, 07 Mar 2023 16:19:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1pZa2P-00DFfX-Tm; Tue, 07 Mar 2023 16:19:41 +0000
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
Subject: [PATCH net-next 4/4] net: mtk_eth_soc: remove support for RMII and
 REVMII modes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pZa2P-00DFfX-Tm@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Mar 2023 16:19:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_081948_804186_571CEAC6 
X-CRM114-Status: GOOD (  15.98  )
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

Since the conversion of mtk_eth_soc to phylink's supported_interfaces
bitmap, these two modes have not been selectable. No one has raised
this as an issue. Checking the in-kernel DT files, none of them use
either of these modes with this hardware.

Daniel Golle concurs:

 A quick grep through the device trees of the more than 650 ramips and
 mediatek boards we support in OpenWrt has revealed that *none* of them
 uses either reduced-MII or reverse-MII PHY modes. I could imaging that
 some more specialized ramips boards may use the RMII 100M PHY mode to
 connect with exotic PHYs for industrial or automotive applications
 (think: for 100BASE-T1 PHY connected via RMII). I have never seen or
 touched such boards, but there are hints that they do exist.

 For reverse-MII there are cases in which the Ralink SoC (Rt305x, for
 example) is used in iNIC mode, ie. connected as a PHY to another SoC,
 and running only a minimal firmware rather than running Linux. Due to
 the lack of external DRAM for the Ralink SoC on this kind of boards,
 the Ralink SoC there will anyway never be able to boot Linux.
 I've seen this e.g. in multimedia devices like early WiFi-connected
 not-yet-so-smart TVs.

Consequently, the conclusion is that no one uses these modes with this
hardware, so we might as well drop support for them.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f78810717f66..b22cd160554e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -463,8 +463,6 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		case PHY_INTERFACE_MODE_RGMII_ID:
 		case PHY_INTERFACE_MODE_RGMII:
 		case PHY_INTERFACE_MODE_MII:
-		case PHY_INTERFACE_MODE_REVMII:
-		case PHY_INTERFACE_MODE_RMII:
 			if (MTK_HAS_CAPS(eth->soc->caps, MTK_RGMII)) {
 				err = mtk_gmac_rgmii_path_setup(eth, mac->id);
 				if (err)
@@ -524,21 +522,13 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 			}
 		}
 
-		ge_mode = 0;
 		switch (state->interface) {
 		case PHY_INTERFACE_MODE_MII:
 		case PHY_INTERFACE_MODE_GMII:
 			ge_mode = 1;
 			break;
-		case PHY_INTERFACE_MODE_REVMII:
-			ge_mode = 2;
-			break;
-		case PHY_INTERFACE_MODE_RMII:
-			if (mac->id)
-				goto err_phy;
-			ge_mode = 3;
-			break;
 		default:
+			ge_mode = 0;
 			break;
 		}
 
-- 
2.30.2


