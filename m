Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32701C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlscBP1NxB+7QVNH3H5DNe+j3qfqaJeAAmMB2ZN+gQQ=; b=UnaNbPrYcdznXk
	fsEtQSflSGrpqWgyqHadHYNXYz5d4Ov0JpzOPYboipwLX06zAF+hvkGKshvVPvLEeapNBi62NgEF1
	vj8JTWw/G9mt/I2DWgKZM3JP8P5dhWRf4t6LOWpSw0EbNkiXcdlnqb7F+chdSmx4DBAMfrBOViqdM
	71L32RuUwyMviVN/BZtRiDbod1EV8QZalLqyarv3nzxXNvnW+YJnBxKJujjmhvTJrKQo4RCEVRUxr
	7ivcjl+D5jU49baF/uppd0bpBZzjkQAG8F8jhDFERzUPHIcvU15hkUF6JyS1P97lyIHTSxZwMORmV
	YxuJOuzRxTHfNEh54zXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6rm-006bMK-N6; Wed, 06 Apr 2022 14:42:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6lQ-006Y8Q-1Z; Wed, 06 Apr 2022 14:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=InOuFeKOhi5b+0cenuAkGRX26M4ti/ZbX6nZ1bpPm4Y=; b=oJTnZq9X1Mejotk2iNTQt4VvWB
 vy1nFNPQAlQFE2MTgCJj/+YQpEs+U/UXUa1oSaI6M0EwSuvRTL7Oglz6HSlc+I+SlcEszevllejBR
 aBqcst3wgeXWeovia2fAOklYIyT7z6fu2OvmSXNmc+OCFF4JzA/o3TJI/UFj+L7HxhP9Z8MM/oIHr
 wx014y3XAxM2bIMZcGPe6D+ra1nQaMQsW0PFvHlaI9sviXrlzpsRmVNbZr3WZLW/E8MZU4kc6ap3f
 ttC1c9eDqyQuBIFqD2NNQhfXdV17ubjZm43qs84h0YUUq9LneKbnuz8hCbnu4gknHMRG7/BlBBKH8
 819wQ+OQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60686 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6lI-0002wy-Om; Wed, 06 Apr 2022 15:35:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6lH-004iki-Rb; Wed, 06 Apr 2022 15:35:55 +0100
In-Reply-To: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
References: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 12/12] net: mtk_eth_soc: partially convert to
 phylink_pcs
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6lH-004iki-Rb@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:55 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073604_285113_44D2EEDE 
X-CRM114-Status: GOOD (  19.71  )
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

Partially convert mtk_eth_soc to phylink_pcs, moving the configuration,
link up and AN restart over. However, it seems mac_pcs_get_state()
doesn't actually get the state from the PCS, so we can't convert that
over without a better understanding of the hardware.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 49 ++++++++----------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  7 ++-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 55 +++++++++++----------
 3 files changed, 53 insertions(+), 58 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0db2341f399f..874fec43fb35 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -260,6 +260,25 @@ static void mtk_gmac0_rgmii_adjust(struct mtk_eth *eth,
 	mtk_w32(eth, val, TRGMII_TCK_CTRL);
 }
 
+static struct phylink_pcs *mtk_mac_select_pcs(struct phylink_config *config,
+					      phy_interface_t interface)
+{
+	struct mtk_mac *mac = container_of(config, struct mtk_mac,
+					   phylink_config);
+	struct mtk_eth *eth = mac->hw;
+	unsigned int sid;
+
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    phy_interface_mode_is_8023z(interface)) {
+		sid = (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII)) ?
+		       0 : mac->id;
+
+		return mtk_sgmii_select_pcs(eth->sgmii, sid);
+	}
+
+	return NULL;
+}
+
 static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 			   const struct phylink_link_state *state)
 {
@@ -267,7 +286,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 					   phylink_config);
 	struct mtk_eth *eth = mac->hw;
 	int val, ge_mode, err = 0;
-	u32 sid, i;
+	u32 i;
 
 	/* MT76x8 has no hardware settings between for the MAC */
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
@@ -388,15 +407,6 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 				   SYSCFG0_SGMII_MASK,
 				   ~(u32)SYSCFG0_SGMII_MASK);
 
-		/* Decide how GMAC and SGMIISYS be mapped */
-		sid = (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII)) ?
-		       0 : mac->id;
-
-		/* Setup SGMIISYS with the determined property */
-		err = mtk_sgmii_config(eth->sgmii, sid, mode, state->interface);
-		if (err)
-			goto init_err;
-
 		/* Save the syscfg0 value for mac_finish */
 		mac->syscfg0 = val;
 	} else if (phylink_autoneg_inband(mode)) {
@@ -476,14 +486,6 @@ static void mtk_mac_pcs_get_state(struct phylink_config *config,
 		state->pause |= MLO_PAUSE_TX;
 }
 
-static void mtk_mac_an_restart(struct phylink_config *config)
-{
-	struct mtk_mac *mac = container_of(config, struct mtk_mac,
-					   phylink_config);
-
-	mtk_sgmii_restart_an(mac->hw, mac->id);
-}
-
 static void mtk_mac_link_down(struct phylink_config *config, unsigned int mode,
 			      phy_interface_t interface)
 {
@@ -504,15 +506,6 @@ static void mtk_mac_link_up(struct phylink_config *config,
 					   phylink_config);
 	u32 mcr;
 
-	if (phy_interface_mode_is_8023z(interface)) {
-		struct mtk_eth *eth = mac->hw;
-
-		/* Decide how GMAC and SGMIISYS be mapped */
-		int sid = (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII)) ?
-			   0 : mac->id;
-		mtk_sgmii_link_up(eth->sgmii, sid, speed, duplex);
-	}
-
 	mcr = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
 	mcr &= ~(MAC_MCR_SPEED_100 | MAC_MCR_SPEED_1000 |
 		 MAC_MCR_FORCE_DPX | MAC_MCR_FORCE_TX_FC |
@@ -545,8 +538,8 @@ static void mtk_mac_link_up(struct phylink_config *config,
 
 static const struct phylink_mac_ops mtk_phylink_ops = {
 	.validate = phylink_generic_validate,
+	.mac_select_pcs = mtk_mac_select_pcs,
 	.mac_pcs_get_state = mtk_mac_pcs_get_state,
-	.mac_an_restart = mtk_mac_an_restart,
 	.mac_config = mtk_mac_config,
 	.mac_finish = mtk_mac_finish,
 	.mac_link_down = mtk_mac_link_down,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 7de860c9d2e3..209ab2a1433c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -866,10 +866,12 @@ struct mtk_soc_data {
  * @regmap:            The register map pointing at the range used to setup
  *                     SGMII modes
  * @ana_rgc3:          The offset refers to register ANA_RGC3 related to regmap
+ * @pcs:               Phylink PCS structure
  */
 struct mtk_pcs {
 	struct regmap	*regmap;
 	u32             ana_rgc3;
+	struct phylink_pcs pcs;
 };
 
 /* struct mtk_sgmii -  This is the structure holding sgmii regmap and its
@@ -1010,12 +1012,9 @@ void mtk_stats_update_mac(struct mtk_mac *mac);
 void mtk_w32(struct mtk_eth *eth, u32 val, unsigned reg);
 u32 mtk_r32(struct mtk_eth *eth, unsigned reg);
 
+struct phylink_pcs *mtk_sgmii_select_pcs(struct mtk_sgmii *ss, int id);
 int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *np,
 		   u32 ana_rgc3);
-int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
-		     phy_interface_t interface);
-void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex);
-void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id);
 
 int mtk_gmac_sgmii_path_setup(struct mtk_eth *eth, int mac_id);
 int mtk_gmac_gephy_path_setup(struct mtk_eth *eth, int mac_id);
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index aac71eb4ac7c..647745284318 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -14,14 +14,16 @@
 
 #include "mtk_eth_soc.h"
 
+static struct mtk_pcs *pcs_to_mtk_pcs(struct phylink_pcs *pcs)
+{
+	return container_of(pcs, struct mtk_pcs, pcs);
+}
+
 /* For SGMII interface mode */
 static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 {
 	unsigned int val;
 
-	if (!mpcs->regmap)
-		return -EINVAL;
-
 	/* Setup the link timer and QPHY power up inside SGMIISYS */
 	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
 		     SGMII_LINK_TIMER_DEFAULT);
@@ -50,9 +52,6 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 {
 	unsigned int val;
 
-	if (!mpcs->regmap)
-		return -EINVAL;
-
 	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -78,10 +77,12 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	return 0;
 }
 
-int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
-		     phy_interface_t interface)
+static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
+			  phy_interface_t interface,
+			  const unsigned long *advertising,
+			  bool permit_pause_to_mac)
 {
-	struct mtk_pcs *mpcs = &ss->pcs[id];
+	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
 	int err = 0;
 
 	/* Setup SGMIISYS with the determined property */
@@ -93,22 +94,25 @@ int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
 	return err;
 }
 
-static void mtk_pcs_restart_an(struct mtk_pcs *mpcs)
+static void mtk_pcs_restart_an(struct phylink_pcs *pcs)
 {
+	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
 	unsigned int val;
 
-	if (!mpcs->regmap)
-		return;
-
 	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
 	val |= SGMII_AN_RESTART;
 	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 }
 
-static void mtk_pcs_link_up(struct mtk_pcs *mpcs, int speed, int duplex)
+static void mtk_pcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
+			    phy_interface_t interface, int speed, int duplex)
 {
+	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
 	unsigned int val;
 
+	if (!phy_interface_mode_is_8023z(interface))
+		return;
+
 	/* SGMII force duplex setting */
 	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
 	val &= ~SGMII_DUPLEX_FULL;
@@ -118,11 +122,11 @@ static void mtk_pcs_link_up(struct mtk_pcs *mpcs, int speed, int duplex)
 	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 }
 
-/* For 1000BASE-X and 2500BASE-X interface modes */
-void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex)
-{
-	mtk_pcs_link_up(&ss->pcs[id], speed, duplex);
-}
+static const struct phylink_pcs_ops mtk_pcs_ops = {
+	.pcs_config = mtk_pcs_config,
+	.pcs_an_restart = mtk_pcs_restart_an,
+	.pcs_link_up = mtk_pcs_link_up,
+};
 
 int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
 {
@@ -138,18 +142,17 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
 		ss->pcs[i].regmap = syscon_node_to_regmap(np);
 		if (IS_ERR(ss->pcs[i].regmap))
 			return PTR_ERR(ss->pcs[i].regmap);
+
+		ss->pcs[i].pcs.ops = &mtk_pcs_ops;
 	}
 
 	return 0;
 }
 
-void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id)
+struct phylink_pcs *mtk_sgmii_select_pcs(struct mtk_sgmii *ss, int id)
 {
-	unsigned int sid;
-
-	/* Decide how GMAC and SGMIISYS be mapped */
-	sid = (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII)) ?
-	       0 : mac_id;
+	if (!ss->pcs[id].regmap)
+		return NULL;
 
-	mtk_pcs_restart_an(&eth->sgmii->pcs[sid]);
+	return &ss->pcs[id].pcs;
 }
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
