Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB23C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kQyCZso2UCI/x1Rw5dQqw6x4Lq3cc05iiLMnfMWnUg=; b=LxY3WFMA4QBmc+
	6dTVrb4VlUUVGB0yQF78agcnb1cloUySwYZwz8o/pDP8rity1xXRWSOBoPj3+k6efHlXZUzOs/iqG
	36hEdOiG9I8PfNbddjHQjctMK+6iV9Ut6MSwu7opD33NwnFAPGUV2A0lEczCKH6eelBsF9BcyA+gI
	Aq8HOOhpPhnly9zE6jFG6NI3X9P6LsZDaVDF9oAXuRrdsa19VRpTOUYG0L0TXz6Xef06X9OR3GGQV
	ecKoJr5dS0Jip/HjhuUWQ6a0P0dsZ4LGDY0XnD1drK3xu8LwFKMhojRO942hNN5erR7BRCuDnTvmw
	qcXYFsoGbPYkEc7QHlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucnS-009K8i-Fw; Tue, 07 Dec 2021 15:54:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucmt-009Jqc-Lq; Tue, 07 Dec 2021 15:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QJbci2tyW7LIVbKa/3HOS2Vah/LZWZYW+zd+y5FbNJ0=; b=uyWDSlrVCcjdw+lnykUTVQc0mO
 Frl4Uoip67o+D25ClJQkjIIcIJrYLmziMdmGyylOXJcxZuc1fwA+yBvfRZIsqc3e9VCH4QKOZp1yt
 lCQErms1zGBfDDbdqKYKiMfD/PN1Xs5AYE6a4A1y4hEUA2fY7OiLsOJxQHgSwyNVJSmgrE3UrRqsO
 ezisB67fQrCogmWP7/TFimce+g2mayzmfPMwf7J3aUUtecf213jOTEMN2IYFRPJgt/5KBXA5ktjNN
 DzG/iGWR+6r3Wd4CzTga+AQoB5Pak7W44lu57KxXCzGAfvtrItd9wroyXU0C3G5/cBUkQJL1cFSqY
 j1ELbk9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56784 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mucmq-0006PR-A9; Tue, 07 Dec 2021 15:53:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mucmp-00EyCx-SK; Tue, 07 Dec 2021 15:53:47 +0000
In-Reply-To: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
References: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 3/5] net: mtk_eth_soc: mark as a legacy_pre_march2020
 driver
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mucmp-00EyCx-SK@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Dec 2021 15:53:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_075351_758251_B2B01940 
X-CRM114-Status: GOOD (  10.44  )
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

mtk_eth_soc has not been updated for commit 7cceb599d15d ("net: phylink:
avoid mac_config calls"), and makes use of state->speed and
state->duplex in contravention of the phylink documentation. This makes
reliant on the legacy behaviours, so mark it as a legacy driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index de4152e2e3e4..a068cf5c970f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2923,6 +2923,10 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
 	mac->phylink_config.type = PHYLINK_NETDEV;
+	/* This driver makes use of state->speed/state->duplex in
+	 * mac_config
+	 */
+	mac->phylink_config.legacy_pre_march2020 = true;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
