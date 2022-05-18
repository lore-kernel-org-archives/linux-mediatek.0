Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C930C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjyojDObsmO+oZ+IKYV8c9uNsPHi+wd6uRdKW2uofGI=; b=u+1hgiKKc9bNh7
	UiCrSPzo6hsFooBpG6ZLZhRwvDzODEqiAT/pLztq9lWtDMMO92ZU96dwhF5gCYRRiDHpmx3S5PTcl
	q3DwKFkzzRxAw1oRstQnQsd5wF6lmr5APmZf+1d0U5gWCrE6dRurWlJ2PfTaFJJBSSJTMd9iANW0u
	D2wfRawFZDkDRJzDWkEY9IM06gD92Rz4IYlbWew694KXZH0rVfV8QUCjJfx55+Oqn29MpXJ7U1EV5
	vCIYgiP0NmGNzJS5OuXdlg8VrJxvVR92Nysb4wXbBAVCC7LRD6m2F4u3ifweLl6CwjoqNz1BWc/fg
	lphbarisupMuoB94ufcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL6X-002drU-Ow; Wed, 18 May 2022 14:56:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL4g-002cnk-W8; Wed, 18 May 2022 14:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=demHlgwFvZY8uJrIohPoTQa88GYwOoZVtotweA4l1lA=; b=Wg5SKMSFMY8BCVH0wTzVvj73ZH
 WZ5wXl9s1/ul42KHkHFJvfGEJCrEhG950reyFAPvV1jJQSMx2jEsANrn33grKTxRaGbRujBLePvNZ
 ogN4V6II6/Jfa6N9j2QHyLZ1ki4+yhyVODBljFAc6eOc6lkdTPJepkibBxUbm4+2/uqVH0Vm2hyju
 TZkvDjGTAwPksGJB7SKhjgk6n3wtibHNJbxBdEKu5QmL3B0toTFBYCUB2xixvXXeMr1NoCconmeXs
 ZcbV4ZsJNF3rrH3gElVhSui8gq3iFZeBEc0zM50gMNSpwc/tUcdqWNdM6YhcjRpGW/2MO/UATjkJm
 ukVsDgUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38616 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL4e-0002Eh-DK; Wed, 18 May 2022 15:54:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL4e-00AM52-99; Wed, 18 May 2022 15:54:52 +0100
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 05/12] net: mtk_eth_soc: correct 802.3z duplex setting
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL4e-00AM52-99@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:54:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075455_134810_3CDDD341 
X-CRM114-Status: GOOD (  14.89  )
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

Phylink does not guarantee that state->duplex will be set correctly in
the mac_config() call, so it's a bug that the driver makes use of it.

Move the 802.3z PCS duplex configuration to mac_link_up().

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 +++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 22 +++++++++++++++------
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b45469ad5ce7..6c3d5f165e3d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -485,8 +485,18 @@ static void mtk_mac_link_up(struct phylink_config *config,
 {
 	struct mtk_mac *mac = container_of(config, struct mtk_mac,
 					   phylink_config);
-	u32 mcr = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
+	u32 mcr;
+
+	if (phy_interface_mode_is_8023z(interface)) {
+		struct mtk_eth *eth = mac->hw;
+
+		/* Decide how GMAC and SGMIISYS be mapped */
+		int sid = (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII)) ?
+			   0 : mac->id;
+		mtk_sgmii_link_up(eth->sgmii, sid, speed, duplex);
+	}
 
+	mcr = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
 	mcr &= ~(MAC_MCR_SPEED_100 | MAC_MCR_SPEED_1000 |
 		 MAC_MCR_FORCE_DPX | MAC_MCR_FORCE_TX_FC |
 		 MAC_MCR_FORCE_RX_FC);
@@ -2986,9 +2996,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink_config.dev = &eth->netdev[id]->dev;
 	mac->phylink_config.type = PHYLINK_NETDEV;
-	/* This driver makes use of state->speed/state->duplex in
-	 * mac_config
-	 */
+	/* This driver makes use of state->speed in mac_config */
 	mac->phylink_config.legacy_pre_march2020 = true;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 4f97195159f3..7540dcb06a72 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1017,6 +1017,7 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *np,
 int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id);
 int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 			       const struct phylink_link_state *state);
+void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex);
 void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id);
 
 int mtk_gmac_sgmii_path_setup(struct mtk_eth *eth, int mac_id);
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index d378ecdf56cc..f07a9d50a770 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -83,14 +83,10 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 	val &= ~SGMII_AN_ENABLE;
 	regmap_write(ss->regmap[id], SGMSYS_PCS_CONTROL_1, val);
 
-	/* SGMII force mode setting */
+	/* Set the speed etc but leave the duplex unchanged */
 	regmap_read(ss->regmap[id], SGMSYS_SGMII_MODE, &val);
-	val &= ~SGMII_IF_MODE_MASK;
+	val &= SGMII_DUPLEX_FULL | ~SGMII_IF_MODE_MASK;
 	val |= SGMII_SPEED_1000;
-
-	if (state->duplex == DUPLEX_FULL)
-		val |= SGMII_DUPLEX_FULL;
-
 	regmap_write(ss->regmap[id], SGMSYS_SGMII_MODE, val);
 
 	/* Release PHYA power down state */
@@ -101,6 +97,20 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 	return 0;
 }
 
+/* For 1000BASE-X and 2500BASE-X interface modes */
+void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex)
+{
+	unsigned int val;
+
+	/* SGMII force duplex setting */
+	regmap_read(ss->regmap[id], SGMSYS_SGMII_MODE, &val);
+	val &= ~SGMII_DUPLEX_FULL;
+	if (duplex == DUPLEX_FULL)
+		val |= SGMII_DUPLEX_FULL;
+
+	regmap_write(ss->regmap[id], SGMSYS_SGMII_MODE, val);
+}
+
 void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id)
 {
 	struct mtk_sgmii *ss = eth->sgmii;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
