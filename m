Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C8C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jan 2022 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iyC4ws7KchSsBEP3PDeoH4rCkVXlj8Yi9n42Xn+4IPE=; b=GAZLYoHilEWzQV
	soGjNTsYHFcbz3ZyWgKjhpWBbAzpkniSyA3KWpfBWSnKNOzw/J43OBeEt9vMCcgW7zcSaHoKm+n1X
	T7pgO4CbDzWjfPJDoULbXhdHPkh/j0hw2tKg78OeVTcww318pBKwNPZ+23Qq6+91ylF2QHlofKVBw
	KJ6KKOb9iPaFTXTTyj95LG69AAVERFnytXog9Y00eu+0aR4P6Ay+phNv6+X/SKWY8i3IlsO6NwojL
	dbEMmP/K5jDFA6McFeSeVSzqAslRo3lHIqS+ZpyaFocsfBA6XMAO747zLaA/POmw1+tEbqnU9MDO5
	1IKL0rcIzebln2jlOLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeqf-00168x-JK; Sun, 23 Jan 2022 15:32:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBep4-0015Wn-7n; Sun, 23 Jan 2022 15:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CEE79B80D94;
 Sun, 23 Jan 2022 15:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69625C340E4;
 Sun, 23 Jan 2022 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642951827;
 bh=uvYinaDDiVnivit/GWLwfQjBAsDQfFd4lMmBFyj64bM=;
 h=From:To:Cc:Subject:Date:From;
 b=j8AOQftuduhrJE/1KmRuBbNTDHD95spI9B/x2ZvXn/5KZJEAJI1ukWZNXdDr6+/So
 C/QkaNFsJz6dwi/kRntjriDIcQX2PUc3WYYC/a/DD8Zss97IyOMN+jAZIwdY66W7h7
 5cIgiTRus9LFPYxFlxe3GQuveJbpqSAZNmdb6B8Z7dBpjLnkMK9a69BFhc7BLIcHW0
 PoZzAm0qpP3P6wq5QwKhnP8pX3LvCFQc7mpea+9gn8xTuLMfAwVi0MOMaQH122Qdpz
 NO6Ahpaqxgl9k3tzWLjsQCO7z3/OkqwB0K6TSbnqyEKur+gK76z/rl9NOH7pkT6F5k
 0PYfSySff3Etg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Byungho An <bh74.an@samsung.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] net: dsa|ethernet: use bool values to pass bool param of
 phy_init_eee
Date: Sun, 23 Jan 2022 23:22:41 +0800
Message-Id: <20220123152241.1480-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073030_619232_007A6A72 
X-CRM114-Status: GOOD (  14.82  )
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

The 2nd param of phy_init_eee(): clk_stop_enable is a bool param, use
true or false instead of 1/0.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/dsa/b53/b53_common.c                 | 2 +-
 drivers/net/dsa/mt7530.c                         | 2 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c   | 2 +-
 drivers/net/ethernet/freescale/fec_main.c        | 2 +-
 drivers/net/ethernet/marvell/mvneta.c            | 2 +-
 drivers/net/ethernet/microchip/lan743x_ethtool.c | 2 +-
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 3867f3d4545f..a3b98992f180 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2186,7 +2186,7 @@ int b53_eee_init(struct dsa_switch *ds, int port, struct phy_device *phy)
 {
 	int ret;
 
-	ret = phy_init_eee(phy, 0);
+	ret = phy_init_eee(phy, false);
 	if (ret)
 		return 0;
 
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b82512e5b33b..bc77a26c825a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2846,7 +2846,7 @@ static void mt753x_phylink_mac_link_up(struct dsa_switch *ds, int port,
 			mcr |= PMCR_RX_FC_EN;
 	}
 
-	if (mode == MLO_AN_PHY && phydev && phy_init_eee(phydev, 0) >= 0) {
+	if (mode == MLO_AN_PHY && phydev && phy_init_eee(phydev, false) >= 0) {
 		switch (speed) {
 		case SPEED_1000:
 			mcr |= PMCR_FORCE_EEE1G;
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 87f1056e29ff..cfe09117fe6c 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -1368,7 +1368,7 @@ static int bcmgenet_set_eee(struct net_device *dev, struct ethtool_eee *e)
 	if (!p->eee_enabled) {
 		bcmgenet_eee_enable_set(dev, false);
 	} else {
-		ret = phy_init_eee(dev->phydev, 0);
+		ret = phy_init_eee(dev->phydev, false);
 		if (ret) {
 			netif_err(priv, hw, dev, "EEE initialization failed\n");
 			return ret;
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 796133de527e..11227f51404c 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2797,7 +2797,7 @@ static int fec_enet_eee_mode_set(struct net_device *ndev, bool enable)
 	int ret = 0;
 
 	if (enable) {
-		ret = phy_init_eee(ndev->phydev, 0);
+		ret = phy_init_eee(ndev->phydev, false);
 		if (ret)
 			return ret;
 
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 83c8908f0cc7..7f44b73024a0 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -4169,7 +4169,7 @@ static void mvneta_mac_link_up(struct phylink_config *config,
 	mvneta_port_up(pp);
 
 	if (phy && pp->eee_enabled) {
-		pp->eee_active = phy_init_eee(phy, 0) >= 0;
+		pp->eee_active = phy_init_eee(phy, false) >= 0;
 		mvneta_set_eee(pp, pp->eee_active && pp->tx_lpi_enabled);
 	}
 }
diff --git a/drivers/net/ethernet/microchip/lan743x_ethtool.c b/drivers/net/ethernet/microchip/lan743x_ethtool.c
index 91a755efe2e6..5f1e7b8bad4f 100644
--- a/drivers/net/ethernet/microchip/lan743x_ethtool.c
+++ b/drivers/net/ethernet/microchip/lan743x_ethtool.c
@@ -750,7 +750,7 @@ static int lan743x_ethtool_set_eee(struct net_device *netdev,
 	}
 
 	if (eee->eee_enabled) {
-		ret = phy_init_eee(phydev, 0);
+		ret = phy_init_eee(phydev, false);
 		if (ret) {
 			netif_err(adapter, drv, adapter->netdev,
 				  "EEE initialization failed\n");
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
index 32161a56726c..77a0d9d7e65a 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
@@ -127,7 +127,7 @@ bool sxgbe_eee_init(struct sxgbe_priv_data * const priv)
 	/* MAC core supports the EEE feature. */
 	if (priv->hw_cap.eee) {
 		/* Check if the PHY supports EEE */
-		if (phy_init_eee(ndev->phydev, 1))
+		if (phy_init_eee(ndev->phydev, true))
 			return false;
 
 		priv->eee_active = 1;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
