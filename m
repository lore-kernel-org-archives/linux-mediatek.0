Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2045C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9RqbeuU42uSU3WZtQPjk1ZyTz/dsc7fJSDmEy/+P0M=; b=PjFtYbvILP8ktZ
	+DHuK22qmiEMD3n4rVhuE2t8pfXgg/Uhfhxzk+BTzM0upk2FMX4IQgeZKH6cs4hbMR8bEt5vZiG2+
	KzMFSYZRrSH3I0+vQ4V5Eu3VgNEo9HfznL3eiQSSjCQ6lk6zI9VFZcbjkwdLcIJSBwt+XmzHxTHiX
	pYRyCAci+gkF1q5h9zcU10avtDLtB/a36f0ZChJc9phuXne54EgVtdrI1MZBQe6AfMN/oS0DbmoKq
	f4c+LqCLESk/wTBQzydSYxc28CdSZytTA/5u5+bZEzjuTTu/LiKS7WazVnixPYkVexdh5Ac5bf8UR
	MsixzUKju/QHJ26cL5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL6a-002dtY-HP; Wed, 18 May 2022 14:56:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL4n-002cqu-3F; Wed, 18 May 2022 14:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nLzI///Zx0CTLUc6B/QT3gulOMfiAFHlMwznq/3TPyI=; b=jen1q37Lzyr78f4pdfBJXSButv
 4ZpkI+NME6pt0wy1gEfE8Fam/7Rw21tAm7zxlZRpnpXgYqhnj/gx523Euk6Xb4G9DDEYshNdhL123
 Xj9v35kPSqjv/v8sCMNRv9SvzehyOuM2sWkiuVE853YVb7S0N0VWBc4OvY/8hgSb/BKucO181P3Ek
 8ROPSUbFdI78HetndnYuSppmt8wABlm9oNrwNT/IRMtvEySFc5CiSwZR3rpeQfJ2VcXL5Rt34kHg3
 P0LG1USSosbK4L1sV4kiCRAZ/W8P5CQO/ilAOt83l23pIIlnIN0f51T9vfBwQQOJEZW09On/BcxDP
 gri2F4SQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38620 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL4j-0002FV-H1; Wed, 18 May 2022 15:54:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL4j-00AM58-Cr; Wed, 18 May 2022 15:54:57 +0100
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 06/12] net: mtk_eth_soc: stop passing phylink state
 to sgmii setup
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL4j-00AM58-Cr@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:54:57 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075501_188369_D3326C75 
X-CRM114-Status: GOOD (  11.88  )
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

Now that mtk_sgmii_setup_mode_force() only uses the interface mode
from the phylink state, pass just the interface mode into this
function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6c3d5f165e3d..080f7e356591 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -390,7 +390,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		/* Setup SGMIISYS with the determined property */
 		if (state->interface != PHY_INTERFACE_MODE_SGMII)
 			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
-							 state);
+							 state->interface);
 		else if (phylink_autoneg_inband(mode))
 			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 7540dcb06a72..455b1460160e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1016,7 +1016,7 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *np,
 		   u32 ana_rgc3);
 int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id);
 int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       const struct phylink_link_state *state);
+			       phy_interface_t interface);
 void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex);
 void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index f07a9d50a770..38d52386c88f 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -65,7 +65,7 @@ int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
  * fixed speed.
  */
 int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       const struct phylink_link_state *state)
+			       phy_interface_t interface)
 {
 	unsigned int val;
 
@@ -74,7 +74,7 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 
 	regmap_read(ss->regmap[id], ss->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
-	if (state->interface == PHY_INTERFACE_MODE_2500BASEX)
+	if (interface == PHY_INTERFACE_MODE_2500BASEX)
 		val |= RG_PHY_SPEED_3_125G;
 	regmap_write(ss->regmap[id], ss->ana_rgc3, val);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
