Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DFBC6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HfoUyn5+ovWJh8xz+qq6Vp7zPUUAYZvXM5HH2VsaY0=; b=F5HzjXOrFF9Utkg+an3ocU9Jtw
	pWiGQvFs9BNAsV7xtMt4k/FFK0GVJVIC1aB/rTjz8siUEOPq20wisk/RIGsD7B18JoymjfL18DG26
	QUQPF5lvstKC22yheuVeU/ZeqYtw1OxfC/b7xOJCTgL1QIr6G1Kng01uPKf+bPwE+EqGVLMVUmibo
	WH7gX04nEv/uuZC4GvDX4Wop0gPSMQVNe41JpDvEFO4ou+bXo/oSIM1v2K23sEXPXTCbYAPk9eBGe
	JSGVfqeF0Jk99jcCjRVMszZukzrAjiDGZRzlUm0HaesJZwEtQAoazTjGOowBX/F+VYqmAh7WXyGqr
	C5z5t/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZfp-001KpU-Fg; Tue, 07 Mar 2023 15:56:21 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZf7-001KJG-3u; Tue, 07 Mar 2023 15:55:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZZf5-0001rV-2X;
	Tue, 07 Mar 2023 16:55:35 +0100
Date: Tue, 7 Mar 2023 15:53:58 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Message-ID: <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678201958.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_075537_180053_4C108678 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: Alexander Couzens <lynxis@fe80.eu>, Jianhui Zhao <zhaojh329@gmail.com>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After conversion to phylink_pcs the 1000Base-X and 2500Base-X modes
would work only after `ethtool -s eth1 autoneg off`.
As ethtool autoneg and the ETHTOOL_LINK_MODE_Autoneg_BIT is supposed
to control auto-negotiation on the external interface it doesn't make
much sense to use it to control on-board SGMII auto-negotiation between
MAC and PHY.
Set correct values to really only enable SGMII auto-negotiation when
actually operating in SGMII mode. For 1000Base-X and 2500Base-X mode,
enable remote-fault detection only if in-band-status is enabled.
This fixes using 1000Base-X and 2500Base-X SFPs on the BananaPi R3
board and also makes it possible to use interface-mode-switching PHYs
operating in either SGMII mode for 10M/100M/1000M or in 2500Base-X for
2500M mode on other boards.

Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 24 +++++------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 61bd9986466a..58d8cb3aa7f4 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -38,9 +38,9 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 			  const unsigned long *advertising,
 			  bool permit_pause_to_mac)
 {
-	bool mode_changed = false, changed, use_an;
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
-	unsigned int rgc3, sgm_mode, bmcr;
+	unsigned int rgc3, sgm_mode = 0, bmcr = 0;
+	bool mode_changed = false, changed;
 	int advertise, link_timer;
 
 	advertise = phylink_mii_c22_pcs_encode_advertisement(interface,
@@ -55,27 +55,13 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	if (interface == PHY_INTERFACE_MODE_SGMII) {
 		sgm_mode = SGMII_IF_MODE_SGMII;
 		if (phylink_autoneg_inband(mode)) {
+			bmcr = SGMII_AN_ENABLE;
 			sgm_mode |= SGMII_REMOTE_FAULT_DIS |
 				    SGMII_SPEED_DUPLEX_AN;
-			use_an = true;
-		} else {
-			use_an = false;
 		}
-	} else if (phylink_autoneg_inband(mode)) {
-		/* 1000base-X or 2500base-X autoneg */
-		sgm_mode = SGMII_REMOTE_FAULT_DIS;
-		use_an = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-					   advertising);
-	} else {
+	} else if (!phylink_autoneg_inband(mode)) {
 		/* 1000base-X or 2500base-X without autoneg */
-		sgm_mode = 0;
-		use_an = false;
-	}
-
-	if (use_an) {
-		bmcr = SGMII_AN_ENABLE;
-	} else {
-		bmcr = 0;
+		sgm_mode = SGMII_REMOTE_FAULT_DIS;
 	}
 
 	if (mpcs->interface != interface) {
-- 
2.39.2


