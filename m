Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD3EFA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SHl2/Tf5+E3hJQsavoW5pAz+OylafQ4Wg/oQ1E55oA=; b=APTDkGD9AdVgBln54qpHP85EMQ
	3Ces97GcJyaY5FIknqD6JeMlqipJepHpSTfqZNvcG9DvakNefFza+uGumKEa8DcbIdOWoEmAI7cvp
	gpay1vTadqiUcQIB2MTQhYRK9FW4eW6tcWuMIq+L7HrLsmzr6WRkgYRpCekVLnLA8ehffmLqITWyr
	YABnPMKWZWXtOWUkkq93BAesMbz/H/4FkD3Y1zSpgBrPIBn4qO94onBYpuNi93vCovvSz5xrR965y
	uZ4wpsTfm+8pF7s8zM9V0aG1o8zdPXYz0q+tskya/O8OpCLsCssiOCxbK3RwuoGEf1AVjnZJoxH4B
	AJaz0VZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2pR-00DS5N-QP; Thu, 27 Oct 2022 13:21:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2fJ-00DN4u-ME; Thu, 27 Oct 2022 13:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0SHl2/Tf5+E3hJQsavoW5pAz+OylafQ4Wg/oQ1E55oA=; b=eZsMcFNUKbAnnNoAMDsrLQi5G2
	RtFBb3px3Gc90kn9K/juzJKdxACKtox1Qk80bAvkaTaq/AtRqmpa9kPTHB9cIG86EKYzk2s+Q7Mi0
	1LWliid+3DEKvD5HbrxN7Z0rRaA9JlrvD1PxyyOZsEfSkNvsnlnCFyWGbhmgD4U1E6sXzR7w/iFAZ
	5PKnka8hnoIfdWPj0pC8ztvJncUUeyLhz7MBlh8WcVx0XLXMHAJ3lBc1Kzn2ZAirTBfogXlEgUI4R
	HM/MNdbfBvAH1UKPpVSKNSfw7vsdIkRIkOxqGV5avgaNnf9efl728DqJf7uDhhiyD7TgC1J9WUfYC
	eNu04axw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33350 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2fH-0006zf-43; Thu, 27 Oct 2022 14:11:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2fG-00HF8Q-Fd; Thu, 27 Oct 2022 14:11:18 +0100
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
Subject: [PATCH net-next 09/11] net: mtk_eth_soc: add advertisement
 programming
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2fG-00HF8Q-Fd@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:11:18 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061121_829075_4058C5B2 
X-CRM114-Status: GOOD (  12.72  )
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

Program the advertisement into the mtk PCS block.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index c590d5847e2e..1f6e58cba162 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -70,16 +70,27 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 {
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
 	unsigned int rgc3;
+	int advertise;
+	bool changed;
 
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
 		rgc3 = RG_PHY_SPEED_3_125G;
 	else
 		rgc3 = 0;
 
+	advertise = phylink_mii_c22_pcs_encode_advertisement(interface,
+							     advertising);
+	if (advertise < 0)
+		return advertise;
+
 	/* Configure the underlying interface speed */
 	regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
 			   RG_PHY_SPEED_3_125G, rgc3);
 
+	/* Update the advertisement, noting whether it has changed */
+	regmap_update_bits_check(mpcs->regmap, SGMSYS_PCS_ADVERTISE,
+				 SGMII_ADVERTISE, advertise, &changed);
+
 	/* Setup SGMIISYS with the determined property */
 	if (interface != PHY_INTERFACE_MODE_SGMII)
 		mtk_pcs_setup_mode_force(mpcs, interface);
@@ -90,7 +101,7 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
 			   SGMII_PHYA_PWD, 0);
 
-	return 0;
+	return changed;
 }
 
 static void mtk_pcs_restart_an(struct phylink_pcs *pcs)
-- 
2.30.2


