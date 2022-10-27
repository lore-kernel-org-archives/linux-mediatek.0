Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5FDECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI8DaM29+IDXZMB5FejDKAyekS110HTrnSErVmAbFjc=; b=niJvEWSUxUX1WciTv+Y4PCN/n9
	4fL20AiXjDD+p7TlzmddH8tPicd+X9VOWvi41ARfTOpD0wYQdYpjs42pM6KhGCQc5i4uki1elWNXG
	cyITh5z7y6CVF3vBtoQGQRsPSEvsZPT7fhH/tnUcPs/9fn43DMkyVflpGe9eCU6SmTKlS0yWw9syW
	Gh+e5hIX4ym129Ed8gVprO+6sQk3oRfRnQmSXEz3m0U61EbvcrpZlvQU7kyeinrtTpQSJknCBJV14
	bGLTCy9Po/MdbP9sOuVmaGzAuJO7GW97ytLZ9sCPhwGOiIXncZRFse1sIrJfbolM3KBHGj3PVVIVu
	kUhxxn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2oX-00DRSx-5w; Thu, 27 Oct 2022 13:20:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2fB-00DN23-MZ; Thu, 27 Oct 2022 13:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xI8DaM29+IDXZMB5FejDKAyekS110HTrnSErVmAbFjc=; b=Wt53qdcyRJXWUb4XOMkPnIdoat
	IN4ruydk37AWUU0kt124BQ0QWM956CVHg4/649NphzVOk8++pROsE/TmHMpcvFBsOOFTGVr9OtqWB
	08xP/zEMx3JmiJX3wXl+o8++GSgThU8GCWOrNJswjXwnNHJkJWpBOXdd5l7sh5evD5Yn0Nr3ZwHc/
	Vy5wLoH2Q3s9BsH+dFwHk8eg8aV/PL5bQ3Zh5JzePO7x14jhFqocygcnmmCUFDbE+A4JEIlPFLSFB
	y+LHoazDf5ATgalkHtEeeiotr8pzDx8POuTOfFEiiIy8zHCIbtNQBaMf8TaF2uveTUcjsDelPUraf
	eiDDqKTw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36756 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2f6-0006z5-SX; Thu, 27 Oct 2022 14:11:08 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2f6-00HF8E-8U; Thu, 27 Oct 2022 14:11:08 +0100
In-Reply-To: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
References: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Dumazet <edumazet@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next 07/11] net: mtk_eth_soc: move PHY power up
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2f6-00HF8E-8U@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:11:08 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061113_839256_7BD7B27C 
X-CRM114-Status: UNSURE (   9.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The PHY power up is common to both configuration paths, so move it into
the parent function. We need to do this for all serdes modes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index d26a0ba2e47b..63b25574caac 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -45,9 +45,6 @@ static void mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 
 	regmap_update_bits(mpcs->regmap, SGMSYS_PCS_CONTROL_1,
 			   SGMII_AN_RESTART, SGMII_AN_RESTART);
-
-	regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
-			   SGMII_PHYA_PWD, 0);
 }
 
 /* For 1000BASE-X and 2500BASE-X interface modes, which operate at a
@@ -72,10 +69,6 @@ static void mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	regmap_update_bits(mpcs->regmap, SGMSYS_SGMII_MODE,
 			   SGMII_IF_MODE_MASK & ~SGMII_DUPLEX_FULL,
 			   SGMII_SPEED_1000);
-
-	/* Release PHYA power down state */
-	regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
-			   SGMII_PHYA_PWD, 0);
 }
 
 static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
@@ -91,6 +84,10 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	else if (phylink_autoneg_inband(mode))
 		mtk_pcs_setup_mode_an(mpcs);
 
+	/* Release PHYA power down state */
+	regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
+			   SGMII_PHYA_PWD, 0);
+
 	return 0;
 }
 
-- 
2.30.2


