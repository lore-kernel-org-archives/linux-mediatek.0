Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13580C32772
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Skn6knx7DWTwYsEOVvaiAtKq6ITBTeteroMRofDadYM=; b=hT9mLVT0ye/OpHhyKNaolNhuLl
	K8flJRO9UjlfT90jLsaFt9ELKDUdqii6s4l/F0NgDG5U7EZ4eG1+xaalJojrPlege3nG3cBu45gFi
	FYZg8Mq5tg7tj2QEjnmJsniypIPCC/EZLu9qjwN7wsTfaUbrYgSO2THGYSTP344R4Hq/nWrR4JyvA
	vxkIADAtB96PJfqUK2ByVXp8MrQyMfhfqoRLgADEiA6UDCFvHoMl2ZmhdjzqNBBekdMKmyBC9lIgg
	3VguuvChq3xqa1QKHwNrbnYmSkDIz1oTgTiJVjNsWw8r7jV9bP29rbz1ONpvA2Ks6KmpaUC2LVv7T
	/80BTfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXEb-00D3dT-2N; Sat, 20 Aug 2022 22:46:29 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXET-00D3UK-JW
	for linux-mediatek@lists.infradead.org; Sat, 20 Aug 2022 22:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Skn6knx7DWTwYsEOVvaiAtKq6ITBTeteroMRofDadYM=; b=spSguYHK4keCpgMbpmRvLdz+5x
	Pb9Fy+vc0wQ1M6KAG5JWjqBaJygPLJyyXjaRPkSvm1GsgPtxKYFNZEL75M9xbXQR8ywXw2em+jfD4
	CoMLAdIPdQTUrEsLitBiCE6EA9dhjJxWR5vgSThJyaGb6pmG/+4gdl5YZuvwUtv4ZxX5NzmkbtjUC
	3dHWRf014xypVG+VTMWpXyZ6HeIVMuT+mbInEu0TFsEBMHACYdQeWMem2Owv82FiMCQPHpwVJt1in
	iJSMVY0XOmbpKIf5CAcv/KCl7ucfuxVPfh/pwaMjKnvlH8/Pj//NXoxTgPp4Xtr1XMoa/FZnSZa16
	GqML8KZw==;
Received: from [2a02:2454:9869:1a:9eb6:54ff:0:fa5] (helo=cerator.lan)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oPXE5-00G2sh-Mn; Sat, 20 Aug 2022 22:45:57 +0000
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
Subject: [PATCH 2/4] net: mediatek: sgmii: ensure the SGMII PHY is powered down on configuration
Date: Sun, 21 Aug 2022 00:45:36 +0200
Message-Id: <20220820224538.59489-3-lynxis@fe80.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220820224538.59489-1-lynxis@fe80.eu>
References: <20220820224538.59489-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_154622_201060_58732AC4 
X-CRM114-Status: UNSURE (   9.84  )
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

The code expect the PHY to be in power down which is only true after reset.
Allow changes of the SGMII parameters more than once.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index a01bb20ea957..782812434367 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -7,6 +7,7 @@
  *
  */
 
+#include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/phylink.h>
@@ -24,6 +25,9 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 {
 	unsigned int val;
 
+	/* PHYA power down */
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
+
 	/* Setup the link timer and QPHY power up inside SGMIISYS */
 	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
 		     SGMII_LINK_TIMER_DEFAULT);
@@ -36,6 +40,10 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 	val |= SGMII_AN_RESTART;
 	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 
+	/* Release PHYA power down state
+	 * unknown how much the QPHY needs but it is racy without a sleep
+	 */
+	usleep_range(50, 100);
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
@@ -50,6 +58,9 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 {
 	unsigned int val;
 
+	/* PHYA power down */
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
+
 	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -67,7 +78,10 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	val |= SGMII_SPEED_1000;
 	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 
-	/* Release PHYA power down state */
+	/* Release PHYA power down state
+	 * unknown how much the QPHY needs but it is racy without a sleep
+	 */
+	usleep_range(50, 100);
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
-- 
2.35.1


