Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19E9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSS1ktmT5I1ZjCDnnZK8p6JzKWfdDbKaFBQH1GqmHpI=; b=UDDsBHavPx+4jr
	rlgjP2g0sO3Xwn0OK5UKhlwB0leXn/noL1sPHr1aWMOFVPV9SsTXDd1DkzhOgVkIwYH243WCvCIE/
	cFEMfJrNGx5ZpMHtRq+FXbBbrprkpPaYyS8/LVgHcgQ9X1PU2dtrSnuK5E4EWVh99Uuy/a1rE7zxm
	s425P6mezK15UzMSuoz8iVkREbN5TUl7Jm5Wp8bNXqF15Jpgx+rVgVrhnB3DZ/sZFoURj/frLVKkv
	+k9VZ3ClZIPkJeRMBIynzkayHQl6lLDprDDzh8F++jz+MJSq3gy0VJYWfZVQUQ08JvolINW+43+6u
	EnkZvKX2Iwx7JE4Nyq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6r3-006awF-Gr; Wed, 06 Apr 2022 14:41:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6lK-006Y6C-KM; Wed, 06 Apr 2022 14:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3aELTLXSVHVJO4R6HumLWNbOhT+VYNeqFlfo7ug2NNg=; b=Nw/djBvZd/UIIuDaJ2NxqzZhXg
 ivTE/MOprwJfNGixXWgxLJNHlmKytO/RN351RT7RikuOB5DmeE5ugmJEmof6IeaaoXVu3arEP+bS5
 Gw/zMi64uxCrJ9Fj8/g7hzG4FIheoVP3/3Z1fdkJF3oUfLx+Ks6TzBSylyjVIOVWw1JoS0PClYtmb
 VBH8WIPawyDLU7QJCn5xze6BkskhF7YT22cB3fYACmuJiZY9pyuRIg84F5nT38NNQQLGxrZKFUru4
 nJXv/VqCVNBpXfawYj0ueVd+t7f255kBjboTrVkQF7cj5JVGv26vOTM1yIY+HOuXeotquYOV/nlp3
 NyRfQExA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60684 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6lD-0002wi-Ke; Wed, 06 Apr 2022 15:35:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6lC-004ikc-NR; Wed, 06 Apr 2022 15:35:50 +0100
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
Subject: [PATCH RFC net-next 11/12] net: mtk_eth_soc: convert code structure
 to suit split PCS support
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6lC-004ikc-NR@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:50 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073558_876537_69A86A4A 
X-CRM114-Status: GOOD (  20.56  )
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

Provide a mtk_pcs structure which encapsulates everything that the PCS
functions need (the regmap and ana_rgc3 offset), and use this in the
PCS functions. Provide shim functions to convert from the existing
"mtk_sgmii_*" interface to the converted PCS functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  15 ++-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 121 +++++++++++---------
 2 files changed, 78 insertions(+), 58 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 96f90e9fb9dd..7de860c9d2e3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -861,16 +861,23 @@ struct mtk_soc_data {
 /* currently no SoC has more than 2 macs */
 #define MTK_MAX_DEVS			2
 
-/* struct mtk_sgmii -  This is the structure holding sgmii regmap and its
- *                     characteristics
+/* struct mtk_pcs -    This structure holds each sgmii regmap and associated
+ *                     data
  * @regmap:            The register map pointing at the range used to setup
  *                     SGMII modes
  * @ana_rgc3:          The offset refers to register ANA_RGC3 related to regmap
  */
+struct mtk_pcs {
+	struct regmap	*regmap;
+	u32             ana_rgc3;
+};
 
+/* struct mtk_sgmii -  This is the structure holding sgmii regmap and its
+ *                     characteristics
+ * @pcs                Array of individual PCS structures
+ */
 struct mtk_sgmii {
-	struct regmap   *regmap[MTK_MAX_DEVS];
-	u32             ana_rgc3;
+	struct mtk_pcs	pcs[MTK_MAX_DEVS];
 };
 
 /* struct mtk_eth -	This is the main datasructure for holding the state
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 57925910cf80..aac71eb4ac7c 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -9,89 +9,71 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/phylink.h>
 #include <linux/regmap.h>
 
 #include "mtk_eth_soc.h"
 
-int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
-{
-	struct device_node *np;
-	int i;
-
-	ss->ana_rgc3 = ana_rgc3;
-
-	for (i = 0; i < MTK_MAX_DEVS; i++) {
-		np = of_parse_phandle(r, "mediatek,sgmiisys", i);
-		if (!np)
-			break;
-
-		ss->regmap[i] = syscon_node_to_regmap(np);
-		if (IS_ERR(ss->regmap[i]))
-			return PTR_ERR(ss->regmap[i]);
-	}
-
-	return 0;
-}
-
 /* For SGMII interface mode */
-static int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
+static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 {
 	unsigned int val;
 
-	if (!ss->regmap[id])
+	if (!mpcs->regmap)
 		return -EINVAL;
 
 	/* Setup the link timer and QPHY power up inside SGMIISYS */
-	regmap_write(ss->regmap[id], SGMSYS_PCS_LINK_TIMER,
+	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
 		     SGMII_LINK_TIMER_DEFAULT);
 
-	regmap_read(ss->regmap[id], SGMSYS_SGMII_MODE, &val);
+	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
 	val |= SGMII_REMOTE_FAULT_DIS;
-	regmap_write(ss->regmap[id], SGMSYS_SGMII_MODE, val);
+	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 
-	regmap_read(ss->regmap[id], SGMSYS_PCS_CONTROL_1, &val);
+	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
 	val |= SGMII_AN_RESTART;
-	regmap_write(ss->regmap[id], SGMSYS_PCS_CONTROL_1, val);
+	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 
-	regmap_read(ss->regmap[id], SGMSYS_QPHY_PWR_STATE_CTRL, &val);
+	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
 	val &= ~SGMII_PHYA_PWD;
-	regmap_write(ss->regmap[id], SGMSYS_QPHY_PWR_STATE_CTRL, val);
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
 
 	return 0;
+
 }
 
 /* For 1000BASE-X and 2500BASE-X interface modes, which operate at a
  * fixed speed.
  */
-static int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-				      phy_interface_t interface)
+static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
+				    phy_interface_t interface)
 {
 	unsigned int val;
 
-	if (!ss->regmap[id])
+	if (!mpcs->regmap)
 		return -EINVAL;
 
-	regmap_read(ss->regmap[id], ss->ana_rgc3, &val);
+	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
 		val |= RG_PHY_SPEED_3_125G;
-	regmap_write(ss->regmap[id], ss->ana_rgc3, val);
+	regmap_write(mpcs->regmap, mpcs->ana_rgc3, val);
 
 	/* Disable SGMII AN */
-	regmap_read(ss->regmap[id], SGMSYS_PCS_CONTROL_1, &val);
+	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
 	val &= ~SGMII_AN_ENABLE;
-	regmap_write(ss->regmap[id], SGMSYS_PCS_CONTROL_1, val);
+	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 
 	/* Set the speed etc but leave the duplex unchanged */
-	regmap_read(ss->regmap[id], SGMSYS_SGMII_MODE, &val);
+	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
 	val &= SGMII_DUPLEX_FULL | ~SGMII_IF_MODE_MASK;
 	val |= SGMII_SPEED_1000;
-	regmap_write(ss->regmap[id], SGMSYS_SGMII_MODE, val);
+	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 
 	/* Release PHYA power down state */
-	regmap_read(ss->regmap[id], SGMSYS_QPHY_PWR_STATE_CTRL, &val);
+	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
 	val &= ~SGMII_PHYA_PWD;
-	regmap_write(ss->regmap[id], SGMSYS_QPHY_PWR_STATE_CTRL, val);
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
 
 	return 0;
 }
@@ -99,44 +81,75 @@ static int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
 		     phy_interface_t interface)
 {
+	struct mtk_pcs *mpcs = &ss->pcs[id];
 	int err = 0;
 
 	/* Setup SGMIISYS with the determined property */
 	if (interface != PHY_INTERFACE_MODE_SGMII)
-		err = mtk_sgmii_setup_mode_force(ss, id, interface);
+		err = mtk_pcs_setup_mode_force(mpcs, interface);
 	else if (phylink_autoneg_inband(mode))
-		err = mtk_sgmii_setup_mode_an(ss, id);
+		err = mtk_pcs_setup_mode_an(mpcs);
 
 	return err;
 }
 
-/* For 1000BASE-X and 2500BASE-X interface modes */
-void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex)
+static void mtk_pcs_restart_an(struct mtk_pcs *mpcs)
+{
+	unsigned int val;
+
+	if (!mpcs->regmap)
+		return;
+
+	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
+	val |= SGMII_AN_RESTART;
+	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
+}
+
+static void mtk_pcs_link_up(struct mtk_pcs *mpcs, int speed, int duplex)
 {
 	unsigned int val;
 
 	/* SGMII force duplex setting */
-	regmap_read(ss->regmap[id], SGMSYS_SGMII_MODE, &val);
+	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
 	val &= ~SGMII_DUPLEX_FULL;
 	if (duplex == DUPLEX_FULL)
 		val |= SGMII_DUPLEX_FULL;
 
-	regmap_write(ss->regmap[id], SGMSYS_SGMII_MODE, val);
+	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
+}
+
+/* For 1000BASE-X and 2500BASE-X interface modes */
+void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex)
+{
+	mtk_pcs_link_up(&ss->pcs[id], speed, duplex);
+}
+
+int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
+{
+	struct device_node *np;
+	int i;
+
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
+		np = of_parse_phandle(r, "mediatek,sgmiisys", i);
+		if (!np)
+			break;
+
+		ss->pcs[i].ana_rgc3 = ana_rgc3;
+		ss->pcs[i].regmap = syscon_node_to_regmap(np);
+		if (IS_ERR(ss->pcs[i].regmap))
+			return PTR_ERR(ss->pcs[i].regmap);
+	}
+
+	return 0;
 }
 
 void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id)
 {
-	struct mtk_sgmii *ss = eth->sgmii;
-	unsigned int val, sid;
+	unsigned int sid;
 
 	/* Decide how GMAC and SGMIISYS be mapped */
 	sid = (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII)) ?
 	       0 : mac_id;
 
-	if (!ss->regmap[sid])
-		return;
-
-	regmap_read(ss->regmap[sid], SGMSYS_PCS_CONTROL_1, &val);
-	val |= SGMII_AN_RESTART;
-	regmap_write(ss->regmap[sid], SGMSYS_PCS_CONTROL_1, val);
+	mtk_pcs_restart_an(&eth->sgmii->pcs[sid]);
 }
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
