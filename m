Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E968C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 12:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNuvrGSIwTA5NXb6MRBDQvk5XI9567Ybm3Y4p+pxJr8=; b=FLznbtlReuKXiOmBe8MUA0Jrnd
	RQMu5R+dj/u8RWik1BPiQgCkl9y1IiLd1sVxyC2RycG9Pg98b+Zd3qx5Jigng3U+trsYbJGQQj50w
	2lXrQYQisJ2L4pyXiTVY5qM+qHRG+lN3k0qjVzB1aoVelrVXNN58MO/A0mYoaIsrlPfcLqg2w2FFY
	n0WzdB39uDCp8R4vhsymO4C64e31p5mqzwDNrnsGBiocgA/vzsbm6g5EZ7EuJJ6yDmEZOA9ik0nzX
	AymACqJzmORkin0uUr5eVm3yXOVPKGEs42IIXA4ljXIXgnExJJHgDmhlTIXR9YV0HClQsBuUQzwZa
	MamZS2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXJo-002PmJ-Ch; Fri, 24 Feb 2023 12:36:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXJS-002PaS-6s; Fri, 24 Feb 2023 12:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dNuvrGSIwTA5NXb6MRBDQvk5XI9567Ybm3Y4p+pxJr8=; b=qat1waqG+EQvm+f1yKAxBEHyZP
	ozECbjI+yFfLN7bEtDbPZF8VKA5fjiiZJ7zvTo51pIa4rJParXVOIDxvhImeUDWyRORXxyOYFQz5m
	fHUkjqj4tsaV5cIz0PCfZNrw4cTUaPkHUxrDQcp8bJ7t0DBqVFWQLm2fnOkMV1SmyR8i16q9U92TS
	pWYqKVSCPcVSskQKHN2y+5bq9NpYE7HlfriL6cSwzAd0UZ6zavaRX9jOxULcr0v96B0Qx9SZGWYNY
	4/ra3IaMstM+m+CDE7VLrsKpJWZRZ8/QVWIRWDDfykoylTWCNePRgwJ/eL4c0Fsm8Tws7meBd1cSR
	CIxWlXcg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42332 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1pVXJG-0000dh-Hx; Fri, 24 Feb 2023 12:36:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1pVXJF-00CTAf-Qu; Fri, 24 Feb 2023 12:36:21 +0000
In-Reply-To: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
References: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>,
	 Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 3/4] net: mtk_eth_soc: remove unnecessary checks
 in mtk_mac_config()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pVXJF-00CTAf-Qu@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Feb 2023 12:36:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043634_282238_BE6720A7 
X-CRM114-Status: GOOD (  11.38  )
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

mtk_mac_config() checks that the interface mode is permitted for the
capabilities, but we already do these checks in mtk_add_mac() when
initialising phylink's supported_interfaces bitmap. Remove the
unnecessary tests.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 1b385dfe620f..f78810717f66 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -458,12 +458,6 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		/* Setup soc pin functions */
 		switch (state->interface) {
 		case PHY_INTERFACE_MODE_TRGMII:
-			if (mac->id)
-				goto err_phy;
-			if (!MTK_HAS_CAPS(mac->hw->soc->caps,
-					  MTK_GMAC1_TRGMII))
-				goto err_phy;
-			fallthrough;
 		case PHY_INTERFACE_MODE_RGMII_TXID:
 		case PHY_INTERFACE_MODE_RGMII_RXID:
 		case PHY_INTERFACE_MODE_RGMII_ID:
@@ -480,11 +474,9 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		case PHY_INTERFACE_MODE_1000BASEX:
 		case PHY_INTERFACE_MODE_2500BASEX:
 		case PHY_INTERFACE_MODE_SGMII:
-			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII)) {
-				err = mtk_gmac_sgmii_path_setup(eth, mac->id);
-				if (err)
-					goto init_err;
-			}
+			err = mtk_gmac_sgmii_path_setup(eth, mac->id);
+			if (err)
+				goto init_err;
 			break;
 		case PHY_INTERFACE_MODE_GMII:
 			if (MTK_HAS_CAPS(eth->soc->caps, MTK_GEPHY)) {
-- 
2.30.2


