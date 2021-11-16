Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:07:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5ED7619E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5ED7619E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOEuFjGNE752obMEQYYvNJyVmdpFZEw/P3HTLTxTtO8=; b=SBEbdj8kNNzW05
	edmr1I/FvSoL2mJS0dzjYmdd5JLecb6XNJYkxjB9IShq5gQ7lWwfRTyvUYLpdQodC+Ip4acgFS7Xu
	++LQ1rzWp/vFTWUbL+R88HOhYOEtS7fnhMu0whBdBiGMh5i4TiEFq0hHyMCnujEzvG/4EHnrfxBRZ
	/fqhsK/HSKF/drGA61HSupMbUQeQHD/O+qqBPEDvReBD41ggbYlYu4nBbY55J9Kr7tdLBAWwQbkru
	xr01tUSqDG2+StMLnU0nw2IzCTrNZhDQjCVA75+2ySW+4+gyL7yGPiOX2pIGsUoWgsbmVogISb2yQ
	0dnBD7ku1WFH329ptKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvMv-0015jV-Oh; Tue, 16 Nov 2021 10:07:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvMV-0015Y2-0P; Tue, 16 Nov 2021 10:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/xVCdcDW8Mbm2vM87DhKbJgb/YxbcKCCa5R3z5x+TQM=; b=A2CMIytkS9zbOYYtzLVOC6emci
 r6ySneX9dY8Abwi8MHJ3ieDwErIvk9Cbhfrdcx2zy4jHiqj+wjDvk/UQjIv+P9jbBGu2iQJWkrKsU
 4iXpSTZeoaXUkfiMJnDdBq06CzPVD4Qz0PnhiVyOy3QwTmI5Kbp/1mcHeDtC5cJyEvDLC87l2V0I5
 svX+dxpQsuQfkzRyz/TVurtPbUCbn7cOis4KyQXlZOV45j4vmWpxPY1le1mhba9Zm45B5uVIN9MN3
 8j9NyWQn20AC2QgvEqu87HZGr2JCpM13U9lqwb1pOZBbTgYLa897+0TH5ZCxfNcuj4oJOxq7WuEjw
 iOf3gvmA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39838 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMR-0000Ln-Ve; Tue, 16 Nov 2021 10:06:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mmvMR-0078bF-Hd; Tue, 16 Nov 2021 10:06:43 +0000
In-Reply-To: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
References: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 1/4] net: mtk_eth_soc: populate supported_interfaces
 member
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mmvMR-0078bF-Hd@rmk-PC.armlinux.org.uk>
Date: Tue, 16 Nov 2021 10:06:43 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_020647_085996_0C4DE99B 
X-CRM114-Status: UNSURE (   8.46  )
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

Populate the phy interface mode bitmap for the Mediatek driver with
interfaces modes supported by the MAC.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 75d67d1b5f6b..7f62298bc983 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3009,6 +3009,26 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
 	mac->phylink_config.type = PHYLINK_NETDEV;
+	__set_bit(PHY_INTERFACE_MODE_MII,
+		  mac->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_GMII,
+		  mac->phylink_config.supported_interfaces);
+
+	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_RGMII))
+		phy_interface_set_rgmii(mac->phylink_config.supported_interfaces);
+
+	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII) && !mac->id)
+		__set_bit(PHY_INTERFACE_MODE_TRGMII,
+			  mac->phylink_config.supported_interfaces);
+
+	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_SGMII)) {
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  mac->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  mac->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  mac->phylink_config.supported_interfaces);
+	}
 
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
