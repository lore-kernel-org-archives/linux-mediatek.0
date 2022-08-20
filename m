Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50F8C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRiYwROZ16kVAe/wuAeCca/SXcJ/4o6AYy4x1BePKz4=; b=D2c90qyEVFov5s6fK1DZ28BQoV
	f/Oig/ofAvSmE9rgsN/OOrEyjfEAite0f6K6TC2+MKNtBgElWQOQ4drMbM39p2nbNBSnjE3xzealB
	FDJCE1F9u/NtCPgqfapde9gjT2ReUKftwy3BrYJ+N7MPFnvcpqSmRWMhQOJ4v6hXCvDQLe8INypqp
	hXopH7qBbScHDMQAUjKkp//DaPAQddHz1XOon86c7bAzfEXMzwEgiB9gZ0NhPRnLzCYoPTrJNZfc9
	D9sBJMyCSa5XUxF1Z8H1wSPmbzuXiSalLKd+xBfFBjVpezzS0WSzRuZKIoJcVOctSpmcsAf7dkR6b
	BTRHH4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXEd-00D3fJ-5k; Sat, 20 Aug 2022 22:46:31 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXET-00D3Ua-JW
	for linux-mediatek@lists.infradead.org; Sat, 20 Aug 2022 22:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WRiYwROZ16kVAe/wuAeCca/SXcJ/4o6AYy4x1BePKz4=; b=xChpAe7GlnOU0yPSil4rYT2m4g
	h4i18+2YpWsIX9N6Ax3WCUN6oJFUtYMyoaBLZGBicAfusNdpuoV2AwHv/9dyLWObRGkWUfMEuo20j
	xYotEAFzIjqGgUZM4AlcyKbrUjxxlMQ+m3mufhepAtgYJw1aO1qOcWPaNe1eRiClc4kZ3hHdHpaLn
	GI4N3Snpx3zoD2AQXJzK2Ln6DeTA+0vIUfh0LldXHlc3f3thnXmvncvmXyZd2mVD0w85hEm4eISm5
	yyT2wMXMeRdm4Fl2AjsSMag0kVfmXIpObzlKqboHc+FJCUwZOVauZmiW0wWDwpBMWy5RZf7aHSY9E
	ALIAOu0Q==;
Received: from [2a02:2454:9869:1a:9eb6:54ff:0:fa5] (helo=cerator.lan)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oPXE6-00G2sh-JE; Sat, 20 Aug 2022 22:45:58 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 4/4] net: mediatek: sgmii: set the speed according to the phy interface in AN
Date: Sun, 21 Aug 2022 00:45:38 +0200
Message-Id: <20220820224538.59489-5-lynxis@fe80.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220820224538.59489-1-lynxis@fe80.eu>
References: <20220820224538.59489-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_154622_452207_058E80AA 
X-CRM114-Status: GOOD (  11.19  )
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

The non auto-negotiating code path is setting the correct speed for the
interface. Ensure auto-negotiation code path is doing it as well.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index aa69baf1a42f..75de2c73a048 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -21,13 +21,20 @@ static struct mtk_pcs *pcs_to_mtk_pcs(struct phylink_pcs *pcs)
 }
 
 /* For SGMII interface mode */
-static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
+static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs, phy_interface_t interface)
 {
 	unsigned int val;
 
 	/* PHYA power down */
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
 
+	/* Set SGMII phy speed */
+	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
+	val &= ~RG_PHY_SPEED_MASK;
+	if (interface == PHY_INTERFACE_MODE_2500BASEX)
+		val |= RG_PHY_SPEED_3_125G;
+	regmap_write(mpcs->regmap, mpcs->ana_rgc3, val);
+
 	/* Setup the link timer and QPHY power up inside SGMIISYS */
 	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
 		     SGMII_LINK_TIMER_DEFAULT);
@@ -100,7 +107,7 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	if (interface != PHY_INTERFACE_MODE_SGMII)
 		err = mtk_pcs_setup_mode_force(mpcs, interface);
 	else if (phylink_autoneg_inband(mode))
-		err = mtk_pcs_setup_mode_an(mpcs);
+		err = mtk_pcs_setup_mode_an(mpcs, interface);
 
 	return err;
 }
-- 
2.35.1


