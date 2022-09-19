Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/qYEGwuEVapUTF3lqnvMGKfhRgLgW56QQsSQBIKfeI=; b=PqAyaPuLvwgtY+74+v4zmPF/V/
	W3c5W+Ge3pDIaQULYCSbOkUneAZxja+2UYwfanX/E5ZM4zOWTwRyC+iNz/mEDjj5lFmj7KjgOkaCc
	cuxcLQzdgc/mtJajeC8znpNr8YFmNenOSDSeSPqt2A92zbpEJqHCmImjj8GKfm+U5NqfghKT2onqI
	btaCphrx1QnD7ilOSnWJDrwx7x6Q79MrmwUEqQK4+j7lyY1T/7NY/qbvmbKlnUe8i6VVudB9WYTQ4
	k6NB56gl1JhSWRgVfhOz56Wsj5H2srQsUCA70vZGKGd7kHGICJoQyCdrk/NwH2lQVvpQRY1Jzeaq7
	j0Fj+0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCT4-00ALaR-D8; Mon, 19 Sep 2022 08:49:30 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCSP-00AL0Y-Kl; Mon, 19 Sep 2022 08:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=D/qYEGwuEVapUTF3lqnvMGKfhRgLgW56QQsSQBIKfeI=; b=vA2a0mdF0n8xHi/88ZNpodKeAt
	ITdIozAy55N2hIAXkqZhIU9ktcn0KRiLukZZwOpdkqWwGF3rmmVZqD//uzBCsnSXzE1oEG2kxnsCC
	WdnxMOsc8BKLFhB9OG2z/QvrU9Q3UB9dKlKlo+zkmIPb46THOX7cGkmxfMHke+Rmt4b7RTFiKcxZu
	vpLwcqUnvH2viOJTGDxOxCFFR7GPQYaZbsTTmX1ggRI/QIXmIVXQhsXDgrRkGiSDAkAK6U6WKUbfH
	40t+BaiVcohe0wYiUkj6qYGidrwdXHFSCnApqvH3EERYHTZw9V0rCHIfHt7inHe/6URllZAMfkuDq
	zjiQNmlg==;
Received: from dynamic-089-204-138-189.89.204.138.pool.telefonica.de ([89.204.138.189] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaCHO-0015f0-8E; Mon, 19 Sep 2022 08:37:26 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 5/5] net: mediatek: sgmii: refactor power cycling into mtk_pcs_config()
Date: Mon, 19 Sep 2022 10:37:12 +0200
Message-Id: <20220919083713.730512-6-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919083713.730512-1-lynxis@fe80.eu>
References: <20220919083713.730512-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014850_122286_4E8E46F2 
X-CRM114-Status: GOOD (  14.66  )
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

Both code paths (autonegotiated and force mode) are power cycling
the phy. Move power cycling code to the caller to remove code
duplicity.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 45 ++++++++---------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 4c8e8c7b1d32..50f605208295 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -25,9 +25,6 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs, phy_interface_t interface
 {
 	unsigned int val;
 
-	/* PHYA power down */
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
-
 	/* Set SGMII phy speed */
 	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
@@ -48,18 +45,6 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs, phy_interface_t interface
 	val |= SGMII_AN_RESTART | SGMII_AN_ENABLE;
 	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 
-	/* Release PHYA power down state
-	 * Only removing bit SGMII_PHYA_PWD isn't enough.
-	 * There are cases when the SGMII_PHYA_PWD register contains 0x9 which
-	 * prevents SGMII from working. The SGMII still shows link but no traffic
-	 * can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
-	 * taken from a good working state of the SGMII interface.
-	 * Unknown how much the QPHY needs but it is racy without a sleep.
-	 * Tested on mt7622 & mt7986.
-	 */
-	usleep_range(50, 100);
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
-
 	return 0;
 
 }
@@ -72,9 +57,6 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 {
 	unsigned int val;
 
-	/* PHYA power down */
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
-
 	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -92,18 +74,6 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	val |= SGMII_SPEED_1000;
 	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 
-	/* Release PHYA power down state
-	 * Only removing bit SGMII_PHYA_PWD isn't enough.
-	 * There are cases when the SGMII_PHYA_PWD register contains 0x9 which
-	 * prevents SGMII from working. The SGMII still shows link but no traffic
-	 * can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
-	 * taken from a good working state of the SGMII interface.
-	 * Unknown how much the QPHY needs but it is racy without a sleep.
-	 * Tested on mt7622 & mt7986.
-	 */
-	usleep_range(50, 100);
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
-
 	return 0;
 }
 
@@ -115,12 +85,27 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
 	int err = 0;
 
+	/* PHYA power down */
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
+
 	/* Setup SGMIISYS with the determined property */
 	if (interface != PHY_INTERFACE_MODE_SGMII)
 		err = mtk_pcs_setup_mode_force(mpcs, interface);
 	else if (phylink_autoneg_inband(mode))
 		err = mtk_pcs_setup_mode_an(mpcs, interface);
 
+	/* Release PHYA power down state
+	 * Only removing bit SGMII_PHYA_PWD isn't enough.
+	 * There are cases when the SGMII_PHYA_PWD register contains 0x9 which
+	 * prevents SGMII from working. The SGMII still shows link but no traffic
+	 * can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
+	 * taken from a good working state of the SGMII interface.
+	 * Unknown how much the QPHY needs but it is racy without a sleep.
+	 * Tested on mt7622 & mt7986.
+	 */
+	usleep_range(50, 100);
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
+
 	return err;
 }
 
-- 
2.37.3


