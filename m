Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353E4FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwRx3hvs+0T47VE5Oc94f6PsAxK95EdNX2ogWTFiGPg=; b=GlsaSJK9ePqnqi2iDTXbWWhTe4
	FWAk6hRwTIrwukd9577A77Lrv5lOmFGHgDzRKUs137nAh/W+1G2lDGeCGKeRfti6xJgAc8jJvXvDT
	zL7aCB1kFcY+qYCMW6VVcu+8tCbk2o5+wn6CZSlePWwRXjQeVF7F3VTJEAJD8x4jo7V0SAuyCb2zU
	7ntTvi6loO/UQ1rJBuRcTgQOdm6QAb/O42GN633zgF1pnlXquG6TcKPUjqJEC9NPtrPFPEFohQNGu
	3oeZdZlvg1knAt7sdz6g9UC9k9F4+ic9k9LkF9aJ0KOJHLqOfu21eTLD/motBHbph22nzO4bKzwPa
	ywgUR39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2qP-00DSXS-Fu; Thu, 27 Oct 2022 13:22:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2fO-00DN6T-7f; Thu, 27 Oct 2022 13:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iwRx3hvs+0T47VE5Oc94f6PsAxK95EdNX2ogWTFiGPg=; b=kCEvDruXnQdCepGj7OSKs8ebKK
	h8Guaioz8GCMpir3bPVvsVD7gKRcnYx/GFyj5ZdpflekD/azZyKcbK0S+ecBOhicJwF+vjmVG0ez6
	j6GEtusK7mAaIigVDdPuARrrDZs7ndxGEYHzwfc1wfN1nS+Nst+NlxtzDHgLREcYZfatNduDnGvEP
	gPJ85vsfGXj11gMtkX6gjo2ng40Vyb6I96U7J1EOekO8NnSXS4NmvqpAUjn/cBlEKaWflT9NvZ0PG
	P3D+eTJuQ1b9mO146kMqEcxqKhkLqMRNTMHlWRc1mo/er9IdfH5uexdG4RRA0xAq0K2pPiRByDtPb
	yEPSCZ6Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38416 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2fM-0006zv-6w; Thu, 27 Oct 2022 14:11:24 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2fL-00HF8W-JF; Thu, 27 Oct 2022 14:11:23 +0100
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
Subject: [PATCH net-next 10/11] net: mtk_eth_soc: move and correct link timer
 programming
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2fL-00HF8W-JF@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:11:23 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061126_339133_94CEA01D 
X-CRM114-Status: GOOD (  12.63  )
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

Program the link timer appropriately for the interface mode being
used, using the newly introduced phylink helper that provides the
nanosecond link timer interval.

The intervals are 1.6ms for SGMII based protocols and 10ms for
802.3z based protocols.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 1f6e58cba162..12e01d0ef52d 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -36,10 +36,6 @@ static void mtk_pcs_get_state(struct phylink_pcs *pcs,
 /* For SGMII interface mode */
 static void mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 {
-	/* Setup the link timer and QPHY power up inside SGMIISYS */
-	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
-		     SGMII_LINK_TIMER_DEFAULT);
-
 	regmap_update_bits(mpcs->regmap, SGMSYS_SGMII_MODE,
 			   SGMII_REMOTE_FAULT_DIS, SGMII_REMOTE_FAULT_DIS);
 
@@ -69,8 +65,8 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 			  bool permit_pause_to_mac)
 {
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
+	int advertise, link_timer;
 	unsigned int rgc3;
-	int advertise;
 	bool changed;
 
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -83,6 +79,10 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	if (advertise < 0)
 		return advertise;
 
+	link_timer = phylink_get_link_timer_ns(interface);
+	if (link_timer < 0)
+		return link_timer;
+
 	/* Configure the underlying interface speed */
 	regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
 			   RG_PHY_SPEED_3_125G, rgc3);
@@ -91,6 +91,9 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	regmap_update_bits_check(mpcs->regmap, SGMSYS_PCS_ADVERTISE,
 				 SGMII_ADVERTISE, advertise, &changed);
 
+	/* Setup the link timer and QPHY power up inside SGMIISYS */
+	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER, link_timer / 2 / 8);
+
 	/* Setup SGMIISYS with the determined property */
 	if (interface != PHY_INTERFACE_MODE_SGMII)
 		mtk_pcs_setup_mode_force(mpcs, interface);
-- 
2.30.2


