Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5592AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWJo4loWXCfCqgb/ok/5FFgWZuSCMuCn0e9JkM4sHgc=; b=ur6FI81W9zGCPe
	b3sPK9izzKEuR2h4iA2phbihT1M9aWVnOWNX1nlYwcfFgPjYEXNZoIGkAoItn1MrvOyEpvYzyF6M/
	bxkj424gQdGn/kXHUpHLaLCREGfzyLXZCtR+utFdA2Q+/qVWqohbrpMg+CzWg2okJWa9csIfmdWnl
	sRUVQ/RxkjO+d2/QGgG0I3GaTXpCHoEN6bN276DNFhKp2GDBq+CKDDYRR7y8i0qrH4lrIxPB3TaoK
	kcWpXmFHSbiLjMHlFyeV3UBRh1+BsLA58hhhYBhdPpA436JTpc62QkFt4EsajqD3i7qksMw3q9qnR
	IRtSOr63ORCgNbAcfbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL7D-002eHh-1A; Wed, 18 May 2022 14:57:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL4t-002cts-72; Wed, 18 May 2022 14:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HbolTbU71PwGrjrYUUqTIX87mDyGzw3Qcfgdv4lmj/0=; b=i6GhToCfhnA2Cn0t75TlkbInCm
 0tVeGpkL7v6/tdRREwF8JFpd4VxHaQOCglc2cyar54ky38mSaxRIZyjUsS51/Be0h2MaWca2kAsxW
 PojR3k+5EU4t4Cm7eognaNvz95n4as8+RGvR/x946iJPTuroKxhUilh3yuTBCuz2efls7UFvLY8m5
 fXIeA/09A878SlT3cwLigFZSuUKCDNwEnvzB8T16oihIm801iHbQe6zWnHHRxSiwuvo1NLE6fdNZI
 mKgO7rpHthvFEy39gYHHTN43e8AHxtSNDkGud/36pmhyuOoh6N0Yf1dnsVIsijJ/z2omRaw2g9WyY
 DWvHVvbA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38622 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL4o-0002Fm-KD; Wed, 18 May 2022 15:55:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL4o-00AM5E-Go; Wed, 18 May 2022 15:55:02 +0100
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
Subject: [PATCH net-next 07/12] net: mtk_eth_soc: provide mtk_sgmii_config()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL4o-00AM5E-Go@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:55:02 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075507_321773_E77444BB 
X-CRM114-Status: GOOD (  12.07  )
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

Provide mtk_sgmii_config() to wrap up the decisions about which SGMII
configuration will be called.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |  7 +------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 ++---
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 20 +++++++++++++++++---
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 080f7e356591..87b5a837695f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -388,12 +388,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		       0 : mac->id;
 
 		/* Setup SGMIISYS with the determined property */
-		if (state->interface != PHY_INTERFACE_MODE_SGMII)
-			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
-							 state->interface);
-		else if (phylink_autoneg_inband(mode))
-			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
-
+		err = mtk_sgmii_config(eth->sgmii, sid, mode, state->interface);
 		if (err)
 			goto init_err;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 455b1460160e..fa3c085bf7ed 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1014,9 +1014,8 @@ u32 mtk_r32(struct mtk_eth *eth, unsigned reg);
 
 int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *np,
 		   u32 ana_rgc3);
-int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id);
-int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       phy_interface_t interface);
+int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
+		     phy_interface_t interface);
 void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex);
 void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 38d52386c88f..4defc1ca41b6 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -35,7 +35,7 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
 }
 
 /* For SGMII interface mode */
-int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
+static int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
 {
 	unsigned int val;
 
@@ -64,8 +64,8 @@ int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
 /* For 1000BASE-X and 2500BASE-X interface modes, which operate at a
  * fixed speed.
  */
-int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       phy_interface_t interface)
+static int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
+				      phy_interface_t interface)
 {
 	unsigned int val;
 
@@ -97,6 +97,20 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 	return 0;
 }
 
+int mtk_sgmii_config(struct mtk_sgmii *ss, int id, unsigned int mode,
+		     phy_interface_t interface)
+{
+	int err = 0;
+
+	/* Setup SGMIISYS with the determined property */
+	if (interface != PHY_INTERFACE_MODE_SGMII)
+		err = mtk_sgmii_setup_mode_force(ss, id, interface);
+	else if (phylink_autoneg_inband(mode))
+		err = mtk_sgmii_setup_mode_an(ss, id);
+
+	return err;
+}
+
 /* For 1000BASE-X and 2500BASE-X interface modes */
 void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex)
 {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
