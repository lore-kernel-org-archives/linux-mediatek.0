Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F0FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB0h6wHZwGG6CkzRFicqY/YPbAS2ounhtVu6YgW3du4=; b=0dwnbIwjw2pmtNlXlrr53GDZtU
	ma+ZGgQMgicuDBdLvfuDqJc7ZjlV0GISvNtX0JWprixKadXoMKUvj+v09iyxqofc99h+VcSCEzZ+u
	f+hlPSOkF6lZbYcpnRb/hL970qQBuwBwW6w1j90jwprHqzfBKP1Dy7ibmf7geG8oFQ4sPHG+H2s/e
	hC/MxhNVE2EYFimggSFT6kcECzvIKInuSSVQ29ssQ+BLb43MjRpVM6gfKxWbcEKVFLA0wwGS67SPR
	KgMffurCk7x1TEpxQcaotXXX4s3OGMykHZO0XGO6m6FZ9mrgaa80/YRinVI2mMEJ2C1E6wvfXja9R
	J40tuDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2mi-00DQUk-NI; Thu, 27 Oct 2022 13:19:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2f4-00DMyy-3e; Thu, 27 Oct 2022 13:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qB0h6wHZwGG6CkzRFicqY/YPbAS2ounhtVu6YgW3du4=; b=ewQqlWvPlZHwlkrPQW6P7vTqYt
	uXjj9u+lfZfkGNhmWFO2kex1sEZ8FIdrO4EURU+hVBuA2y4BZblqZXwwO6ws6+77W/99mVWmNQjjL
	p/YMSzhNdriqXV7EnXs7tm13Z6BNMVDT9kvAm+7UbYe1bFukuQR3leUPCOktKLeuU1wD4ePkncmc0
	duyy2AoItFEDmZRe4WofBGPngbvpHWkmxLewcGJ1fYqIvlAtX08pyvxzxLI8l7XrRbFGRVj9gKVQR
	5Qa3dWOv5VyynGGNdEoToLMSCKgxcguevWmeiZGr5l1xltKyzp/Y5eaa9hEQx/RzaoBUrjplSDj4i
	BoQQLNoA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36750 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2f1-0006yo-OM; Thu, 27 Oct 2022 14:11:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2f1-00HF88-4n; Thu, 27 Oct 2022 14:11:03 +0100
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
Subject: [PATCH net-next 06/11] net: mtk_eth_soc: add out of band forcing of
 speed and duplex in pcs_link_up
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2f1-00HF88-4n@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:11:03 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061106_171773_97782CE8 
X-CRM114-Status: GOOD (  13.51  )
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

Add support for forcing the link speed and duplex setting in the
pcs_link_up() method for out of band modes, which will be useful when
we finish converting the pcs_config() method. Until then, we still have
to force duplex for 802.3z modes to work correctly.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 28 ++++++++++++++---------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 868ff0b2e036..d26a0ba2e47b 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -108,17 +108,23 @@ static void mtk_pcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
 	unsigned int sgm_mode;
 
-	if (!phy_interface_mode_is_8023z(interface))
-		return;
-
-	/* SGMII force duplex setting */
-	if (duplex == DUPLEX_FULL)
-		sgm_mode = SGMII_DUPLEX_FULL;
-	else
-		sgm_mode = 0;
-
-	regmap_update_bits(mpcs->regmap, SGMSYS_SGMII_MODE,
-			   SGMII_DUPLEX_FULL, sgm_mode);
+	if (!phylink_autoneg_inband(mode) ||
+	    phy_interface_mode_is_8023z(interface)) {
+		/* Force the speed and duplex setting */
+		if (speed == SPEED_10)
+			sgm_mode = SGMII_SPEED_10;
+		else if (speed == SPEED_100)
+			sgm_mode = SGMII_SPEED_100;
+		else
+			sgm_mode = SGMII_SPEED_1000;
+
+		if (duplex == DUPLEX_FULL)
+			sgm_mode |= SGMII_DUPLEX_FULL;
+
+		regmap_update_bits(mpcs->regmap, SGMSYS_SGMII_MODE,
+				   SGMII_DUPLEX_FULL | SGMII_SPEED_MASK,
+				   sgm_mode);
+	}
 }
 
 static const struct phylink_pcs_ops mtk_pcs_ops = {
-- 
2.30.2


