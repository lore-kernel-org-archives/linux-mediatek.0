Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1506BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DACBHOF6bWkOkqzEWq59C2Rno8KqMCb78TJcrYbS/U=; b=km/PHSNEIovh/mY8k6TnLzhWDQ
	L1nTibdfRoY48wg2rolHQdl/jN4hrd8u69kFTlAQLEMJKvU+f1I8+xZmDFuedNI6Clt/+Dtqv91vc
	u57S9X0DWqFF5rBzOHC0qYqgbiJ4gmexIm4VmLshoLvU+rOnvPTUCC1aQL2hdAT9GPEzjl3eprzxW
	3+Ur6Q4dBhxow4HEnBJTgDsbam1RKtstyfNj8pvmTcOkXiHjadN2nhUWKhXfxDyA4968lQF3e79Yl
	4PmgA76Sjb80Nb8cktJGpIp44awdyHk0OeFTOl+LyVCNpbmNi2utnV4ZCWciolkLlGTMubTEweYMI
	Kqhg1pHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCRJ-00AK2B-Ks; Mon, 19 Sep 2022 08:47:41 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCQK-00AJ5A-JI; Mon, 19 Sep 2022 08:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1DACBHOF6bWkOkqzEWq59C2Rno8KqMCb78TJcrYbS/U=; b=djnNEqg5MEYCs/Rn/KVZvcU6LU
	JBoNaHs5fAcwEVraya2ifpOQqK+exVqSGwjI+ULSNsoQm7P2BX7VW7WHQEWSoqsoiT9nw/ZxamE1N
	iwYqc4jluf6yNZDjGraFCQ2v/MZzzYNjaAEFCQYgtZ5DuMp54i4DbObQB2xbea7CxAYoRDjEpJUqg
	0W985cHB4hScOyyFkeg0ZBjuMV+SCNAX41mqpr3Nr1KHadgud8HgLtJUWmlmXt2/E0JKM6ICa5AdV
	Qy/A+7hvSmRiLEIaF6G0EuthkO38X4LmMsq77f6z4xZ1U4LUKAhDu4gDQGDgejCoVdYBOLzVhxN4+
	CVQ4R2lA==;
Received: from dynamic-089-204-138-189.89.204.138.pool.telefonica.de ([89.204.138.189] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaCHK-0015f0-MQ; Mon, 19 Sep 2022 08:37:22 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/5] net: mediatek: sgmii: ensure the SGMII PHY is powered down on configuration
Date: Mon, 19 Sep 2022 10:37:09 +0200
Message-Id: <20220919083713.730512-3-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919083713.730512-1-lynxis@fe80.eu>
References: <20220919083713.730512-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014641_497278_0FB5A5E2 
X-CRM114-Status: GOOD (  11.78  )
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
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index b9b15e1a292c..18de85709e87 100644
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
@@ -42,8 +46,10 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 	 * prevents SGMII from working. The SGMII still shows link but no traffic
 	 * can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
 	 * taken from a good working state of the SGMII interface.
+	 * Unknown how much the QPHY needs but it is racy without a sleep.
 	 * Tested on mt7622 & mt7986.
 	 */
+	usleep_range(50, 100);
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
@@ -58,6 +64,9 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 {
 	unsigned int val;
 
+	/* PHYA power down */
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
+
 	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
@@ -81,8 +90,10 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	 * prevents SGMII from working. The SGMII still shows link but no traffic
 	 * can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
 	 * taken from a good working state of the SGMII interface.
+	 * Unknown how much the QPHY needs but it is racy without a sleep.
 	 * Tested on mt7622 & mt7986.
 	 */
+	usleep_range(50, 100);
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
-- 
2.37.3


