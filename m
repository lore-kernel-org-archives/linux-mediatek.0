Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6E6FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEsr6JdL5xo8xL/pVM9/e/VJ0yZE5nTVNcivYVm6JRU=; b=O0onLDyqa09m80nUfQ0L9X15/S
	jWi82y+fKtBbBrKbd41MRh2PBNba18V1vqYTKVCdbPOI2WyNNkk+u4lNLM98MG1CYnGNHXVw319v/
	qmXmw3SaIvCu9yTSUKEmfk+0mJ4fZncv0wqTw1RxoHu2mPWyr+NM9Uw+gd9YW9pfvbnIp99pW063A
	4GdvdZTC9464j8o778DX0hVr8GdyOf4QDK2533dGMfABcXWGsNqpxOZVBfsWtjkOJNvHtwAbLmm60
	1uI2ohyIAz2TVQ6+oRjMu6thAWQu22cJ1dqVTajuDBwMuqdvrakCEE+ACHlKbCV39GdH8qSAcJWs1
	01FseYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2oZ-00DRUA-Iz; Thu, 27 Oct 2022 13:20:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2fE-00DN34-7e; Thu, 27 Oct 2022 13:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XEsr6JdL5xo8xL/pVM9/e/VJ0yZE5nTVNcivYVm6JRU=; b=OzOhu6OcYxNRPW6o76nWBb9VQ4
	03Jeq4CPB1RfzkBIHUmzcFytlMTsrPpl+2CfmXHIM/eqbzpQvHSVzvtquo94bd//Gd0B6P9WR6N7X
	x7WC2Red7DoyIpTepUtb1ecYpep+nvdbF2zxrH9jX7nRpYJGxtYuyRr0HWE/uA19TEC+gZJAvIoGo
	0cNlmrfOaxDyNjQ6jFb3WCl++XwX06Z6uHZF6Y6t6PN6sULn7sPbld3/0rZ2u3XEa/98UK4BnrrmJ
	OEUkW0DOauzbYG0ay0BjQ9LskW/NC4FUROfOwcSmBLj7RrGonVxM05dsVdwzpVzJpKm44gik/NxsX
	arrQllzw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33334 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2fB-0006zL-Vc; Thu, 27 Oct 2022 14:11:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2fB-00HF8K-CV; Thu, 27 Oct 2022 14:11:13 +0100
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
Subject: [PATCH net-next 08/11] net: mtk_eth_soc: move interface speed
 selection
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2fB-00HF8K-CV@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:11:13 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061116_350095_F81177E5 
X-CRM114-Status: GOOD (  11.11  )
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

Move the selection of the underlying interface speed to the pcs_config
function, so we always program the interface speed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 63b25574caac..c590d5847e2e 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -53,14 +53,6 @@ static void mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 static void mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 				     phy_interface_t interface)
 {
-	unsigned int rgc3;
-
-	if (interface == PHY_INTERFACE_MODE_2500BASEX)
-		rgc3 = RG_PHY_SPEED_3_125G;
-
-	regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
-			   RG_PHY_SPEED_3_125G, rgc3);
-
 	/* Disable SGMII AN */
 	regmap_update_bits(mpcs->regmap, SGMSYS_PCS_CONTROL_1,
 			   SGMII_AN_ENABLE, 0);
@@ -77,6 +69,16 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 			  bool permit_pause_to_mac)
 {
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
+	unsigned int rgc3;
+
+	if (interface == PHY_INTERFACE_MODE_2500BASEX)
+		rgc3 = RG_PHY_SPEED_3_125G;
+	else
+		rgc3 = 0;
+
+	/* Configure the underlying interface speed */
+	regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
+			   RG_PHY_SPEED_3_125G, rgc3);
 
 	/* Setup SGMIISYS with the determined property */
 	if (interface != PHY_INTERFACE_MODE_SGMII)
-- 
2.30.2


