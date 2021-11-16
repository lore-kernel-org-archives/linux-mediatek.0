Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 178E961101
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 178E961101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPTmaBQMi3zg9mYtTfduY504GZaw6SvcjuwdOJCQzjU=; b=EUG8Zhra5/l4tQ
	3BUdkRxsYg7SqAnDCQfSQ8uN3TPKKPMOnji8ZhioOhlrEDu15Z/r9cj2mOzoMtjWOGxOGCDOtqs85
	GtTFRbmklgeHawTUqehu8iDgPyZzGxxSh8ui+D6vO1RTMowE6CtPJEi2MRet1Nv7X/EFXIz9l7rnU
	KRY7u8iGHcX7mW5tGB4Zh+cXxGi3Pt9EYKt4gNK3W7eNJWE8htufOllUpmB7jCfxwOpSmTQ8eAh22
	wmZNVSY7AZzMwPJAiGhsnxaMJ+btxRakxm9jlz6MIvmAMgfvSXewHqqUGH0GiyWLE0e/pBb/M7qOo
	OEl31aQPolWE/kOq83Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvOY-0016Yo-Pi; Tue, 16 Nov 2021 10:08:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvMl-0015fP-Bf; Tue, 16 Nov 2021 10:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8TJ/OIeRdkM1oox30eLvG8HWV1qjoPaDdEdnXNcCfTY=; b=cWWKPBpeI6a1kenNYlA8SYs0Zc
 uwKjqrkch6Dxbk2fopgWlmYBwlwrPlzwOxYtOHsYWfqdi+9VpdUlof7osWXkh9zExM3obMz1ZQYJd
 R/stSYw9leyWzsalB8Ym0PyxXs2l8EWNabBhi05W3rNUbcwty6ha5x6I0wjkyvAImW1BgJef0+Cfd
 P3FV107a1SL8VdfVmwv0HvYxpUsjrTFAFuSQPdOD1EK9diTgJItnWtnFP0ymprYRjtOq1YfZ/NHrz
 Y2altkWI+3Nvf0xU6nYwGriqkQTdgkPDLvqVtpdydlu0jTOKnzA8BviUa/550Oy44o8gwZbXO9TPe
 Ih1p5+Iw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39844 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMh-0000MT-AN; Tue, 16 Nov 2021 10:06:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMg-0078ba-Se; Tue, 16 Nov 2021 10:06:58 +0000
In-Reply-To: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
References: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 4/4] net: mtk_eth_soc: use phylink_generic_validate()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mmvMg-0078ba-Se@rmk-PC.armlinux.org.uk>
Date: Tue, 16 Nov 2021 10:06:58 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_020703_454239_638657A4 
X-CRM114-Status: GOOD (  10.07  )
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

mtk_eth_soc has no special behaviour in its validation implementation,
so can be switched to phylink_generic_validate().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 53 ++-------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 98f9a6ed9584..de4152e2e3e4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -463,56 +463,8 @@ static void mtk_mac_link_up(struct phylink_config *config,
 	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
 }
 
-static void mtk_validate(struct phylink_config *config,
-			 unsigned long *supported,
-			 struct phylink_link_state *state)
-{
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
-
-	phylink_set_port_modes(mask);
-	phylink_set(mask, Autoneg);
-
-	switch (state->interface) {
-	case PHY_INTERFACE_MODE_TRGMII:
-		phylink_set(mask, 1000baseT_Full);
-		break;
-	case PHY_INTERFACE_MODE_1000BASEX:
-		phylink_set(mask, 1000baseX_Full);
-		break;
-	case PHY_INTERFACE_MODE_2500BASEX:
-		phylink_set(mask, 2500baseX_Full);
-		break;
-	case PHY_INTERFACE_MODE_GMII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		phylink_set(mask, 1000baseT_Half);
-		fallthrough;
-	case PHY_INTERFACE_MODE_SGMII:
-		phylink_set(mask, 1000baseT_Full);
-		phylink_set(mask, 1000baseX_Full);
-		fallthrough;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RMII:
-	case PHY_INTERFACE_MODE_REVMII:
-	default:
-		phylink_set(mask, 10baseT_Half);
-		phylink_set(mask, 10baseT_Full);
-		phylink_set(mask, 100baseT_Half);
-		phylink_set(mask, 100baseT_Full);
-		break;
-	}
-
-	phylink_set(mask, Pause);
-	phylink_set(mask, Asym_Pause);
-
-	linkmode_and(supported, supported, mask);
-	linkmode_and(state->advertising, state->advertising, mask);
-}
-
 static const struct phylink_mac_ops mtk_phylink_ops = {
-	.validate = mtk_validate,
+	.validate = phylink_generic_validate,
 	.mac_pcs_get_state = mtk_mac_pcs_get_state,
 	.mac_an_restart = mtk_mac_an_restart,
 	.mac_config = mtk_mac_config,
@@ -2971,6 +2923,9 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
 	mac->phylink_config.type = PHYLINK_NETDEV;
+	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
+
 	__set_bit(PHY_INTERFACE_MODE_MII,
 		  mac->phylink_config.supported_interfaces);
 	__set_bit(PHY_INTERFACE_MODE_GMII,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
