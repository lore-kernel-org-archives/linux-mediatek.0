Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMwpcPhhL9ohoALIHWyLrTUbM6BehiF9NpiszMY1EbY=; b=bw43XVwx9lb9TN
	kKsXajaS57eYCa0vbHwWKChYGVEafCGpWjzlLQOM8zDQ+bpMU5SCN/L/9Ivzi6QVJUnAY65bFtvFt
	wAbcGsYSyn2ITRShQ1IW41+NqSQA6/nl8ynO0XyC5/iEIl80HziAoZWRXMIIAZQYZszPb9KsEm+Yv
	j40LhMKpqcFypqjQrEfkrc92E0m52pJSpDgh4MDETbfc5CmGWah5EdI9n9gTLxzrfJD2UiXntoPRG
	Gm+dyhIdkOu++RL41ePnlIWSdMHPlHukEi3JHyfWBrMn4qJjcP39jDruf8pYLIo2VuYQGTxbfxk5P
	OMNa5ZDC6hL195fYW/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6mc-006YlH-FL; Wed, 06 Apr 2022 14:37:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6kl-006Xpk-33; Wed, 06 Apr 2022 14:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oqe5W/YFbOBMN4vY9PN0fb0OS5WRh0LTSsST1Vzy05w=; b=rnQshrRRf5/+IvGg4KNdegvTU0
 7U/+Nmb9Mry4lPWQgxO5tSu6RkzKmsEQJHJNlhrhEcEpmcOrfQeEX11XLDli5bTn2T8pPhuqPYlFm
 XfF/1cQMfEdD6zMdMpBi8SmdpPrXmjK1WGzvveTpckXdmDhdbvU3255pHLpsKg0IKIIylK5I4JEja
 WZ9SrAvFsdBb0gDC4wwNu4avpbYLov7A3YP99X2dQ5yhKGXqU2KpbFHHtAofww65TUYq8b4BdjUvk
 QXOUC4UQSXNPScF1WFDT3bpefYX1pmllHCcj5dNhUZGeuQnKnPOq+mATA7UK6zjy1BnaxO145dsEm
 yINT155w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60668 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6kd-0002uh-QW; Wed, 06 Apr 2022 15:35:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6kc-004ijq-U0; Wed, 06 Apr 2022 15:35:14 +0100
In-Reply-To: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
References: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 04/12] net: mtk_eth_soc: correct 802.3z speed
 setting
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6kc-004ijq-U0@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:14 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073523_198048_80F8AC7D 
X-CRM114-Status: GOOD (  11.87  )
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

Phylink does not guarantee that state->speed will be set correctly in
the mac_config() call, so it's a bug that the driver makes use of it.
Moreover, it is making use of it in a function that is only ever called
for 1000BASE-X and 2500BASE-X which operate at a fixed speed which
happens to be the same setting irrespective of the interface mode. We
can simply remove the switch statement and just set the SGMII interface
speed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 32d83421226a..16e66c0cb557 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -33,6 +33,7 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
 	return 0;
 }
 
+/* For SGMII interface mode */
 int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
 {
 	unsigned int val;
@@ -59,6 +60,9 @@ int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
 	return 0;
 }
 
+/* For 1000BASE-X and 2500BASE-X interface modes, which operate at a
+ * fixed speed.
+ */
 int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 			       const struct phylink_link_state *state)
 {
@@ -81,19 +85,7 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 	/* SGMII force mode setting */
 	regmap_read(ss->regmap[id], SGMSYS_SGMII_MODE, &val);
 	val &= ~SGMII_IF_MODE_MASK;
-
-	switch (state->speed) {
-	case SPEED_10:
-		val |= SGMII_SPEED_10;
-		break;
-	case SPEED_100:
-		val |= SGMII_SPEED_100;
-		break;
-	case SPEED_2500:
-	case SPEED_1000:
-		val |= SGMII_SPEED_1000;
-		break;
-	}
+	val |= SGMII_SPEED_1000;
 
 	if (state->duplex == DUPLEX_FULL)
 		val |= SGMII_DUPLEX_FULL;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
