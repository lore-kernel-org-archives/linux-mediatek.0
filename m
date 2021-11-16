Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C47CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3143C619E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3143C619E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZc2sIpxwFEZTfJBINjbOLqe/+ExdQTXkrd8KtfFBCI=; b=hscmhHvBWkJyXS
	wzrATcfyccxiZq2+82vVyTzQurFbZQxa4pljxTyG3RcA3Ll6zVOlvo6a5iBxTXKXqKmvsw/J64ixG
	0GHSrD0jZ2JJge75e58+hmHFxsN5lnrinANTqcrZ2FGr6lH3iCCtHXpNkKTM3EGRCw4AKddEbQ/PH
	9J1jKCjuy7tE5qOdn98PJ8JHQQxp65KpuJb3K25vs+C6JFlN5fhrV3ahja0q7CBfE+taOI57EYwjF
	XM4hLPp4i8CrYNNN89Zm0ZakrABWBmFjPis5GFvPU6cg+PAg6AzAisp6Nvlr4fYbcd6y92b9+m4vs
	SyThyYjfsVa+B4RXKltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvNP-0015xQ-7O; Tue, 16 Nov 2021 10:07:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvMa-0015Zz-A5; Tue, 16 Nov 2021 10:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FS4ajOcnofb6bnRQXQZpb59B3t3pfaH82+SxdC9NXcU=; b=eZZ0bvcAdeo0g/tAZTPnhqCEqE
 im5eeP2xeZFqx+8RFO8+xrmKNBbOYKX4IhhDcZw4M1wc0CfnHhOjo+FMaV9HfyEl/ekZ056uhXuTH
 erYQEBPHALHxyLk0q6n/QibduyiaOLlP1n1Ax25jst7z1d7b67InAJwrAsp2cI8xBX/sMwziHpxsE
 OqK2Z1Zwy7APbyJcVrC2d7i66vKNpw3SleCkP1WV/MBCjbYGB7cMy0uuemyJZVNf1xMm9e/rolo/+
 EzR2he6DsLRCcalwn25E+gEm9+pkm3Tgu+zExoUi88v3KNVvQMKF24zO5Zh2x8uOzQPLkw2lsHBDh
 4/WG4Qqg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39840 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMX-0000M0-2V; Tue, 16 Nov 2021 10:06:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMW-0078bO-LN; Tue, 16 Nov 2021 10:06:48 +0000
In-Reply-To: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
References: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 2/4] net: mtk_eth_soc: remove interface checks in
 mtk_validate()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mmvMW-0078bO-LN@rmk-PC.armlinux.org.uk>
Date: Tue, 16 Nov 2021 10:06:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_020652_416060_9AA91505 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

As phylink checks the interface mode against the supported_interfaces
bitmap, we no longer need to validate the interface mode, nor handle
PHY_INTERFACE_MODE_NA in the validation function. Remove these to
simplify the implementation.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 34 ---------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7f62298bc983..31872594c790 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -467,24 +467,8 @@ static void mtk_validate(struct phylink_config *config,
 			 unsigned long *supported,
 			 struct phylink_link_state *state)
 {
-	struct mtk_mac *mac = container_of(config, struct mtk_mac,
-					   phylink_config);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
 
-	if (state->interface != PHY_INTERFACE_MODE_NA &&
-	    state->interface != PHY_INTERFACE_MODE_MII &&
-	    state->interface != PHY_INTERFACE_MODE_GMII &&
-	    !(MTK_HAS_CAPS(mac->hw->soc->caps, MTK_RGMII) &&
-	      phy_interface_mode_is_rgmii(state->interface)) &&
-	    !(MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII) &&
-	      !mac->id && state->interface == PHY_INTERFACE_MODE_TRGMII) &&
-	    !(MTK_HAS_CAPS(mac->hw->soc->caps, MTK_SGMII) &&
-	      (state->interface == PHY_INTERFACE_MODE_SGMII ||
-	       phy_interface_mode_is_8023z(state->interface)))) {
-		linkmode_zero(supported);
-		return;
-	}
-
 	phylink_set_port_modes(mask);
 	phylink_set(mask, Autoneg);
 
@@ -511,7 +495,6 @@ static void mtk_validate(struct phylink_config *config,
 	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RMII:
 	case PHY_INTERFACE_MODE_REVMII:
-	case PHY_INTERFACE_MODE_NA:
 	default:
 		phylink_set(mask, 10baseT_Half);
 		phylink_set(mask, 10baseT_Full);
@@ -520,23 +503,6 @@ static void mtk_validate(struct phylink_config *config,
 		break;
 	}
 
-	if (state->interface == PHY_INTERFACE_MODE_NA) {
-		if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_SGMII)) {
-			phylink_set(mask, 1000baseT_Full);
-			phylink_set(mask, 1000baseX_Full);
-			phylink_set(mask, 2500baseX_Full);
-		}
-		if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_RGMII)) {
-			phylink_set(mask, 1000baseT_Full);
-			phylink_set(mask, 1000baseT_Half);
-			phylink_set(mask, 1000baseX_Full);
-		}
-		if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_GEPHY)) {
-			phylink_set(mask, 1000baseT_Full);
-			phylink_set(mask, 1000baseT_Half);
-		}
-	}
-
 	phylink_set(mask, Pause);
 	phylink_set(mask, Asym_Pause);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
