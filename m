Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B56EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmMH+fMWlszjT3xrI6x6BPzn+VWGtlXNR874DKMXudU=; b=s3rgd/PpjfdQU77uTnqNQk148b
	0ByUGa/HFgTZnisGgXWfB1g+Yy5XWlueLzhjS3nVYTy6uxptN1LJWZt1KYfd5LRk4jYk8cQdFG+5M
	sgwGQr2M0V4m66OzSIuJ1atSPNLmSbF0I5C47Ik+/zk+oufq13pHHjn2RnXQ20TSvDarA51U0xpFi
	OE5vKwPXBdZ19ifSYk1sTGPuMQOSSQBNrtF9S3FvG265DClwQgLRn2SkD8iqc+jNSlZsANngzqY2B
	/bN/kfpSFhnSt/VOAJoKjc3s2IwmE1a9Z7B1f8cjA/hSyeKqNATYaaz662mb4dimpXQpae8ssEFQI
	4DTIepwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCRK-00AK3T-KG; Mon, 19 Sep 2022 08:47:42 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCQL-00AIyM-Hf; Mon, 19 Sep 2022 08:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vmMH+fMWlszjT3xrI6x6BPzn+VWGtlXNR874DKMXudU=; b=ipUxJbFlUFRufa+84syKI7F1af
	i9V6OGsjDZMWWimDJX0P00pjoiHYV2ryVuCmFqXXvCl2GCUecYTS27u+4liVMjv/L4FVVeLp1GQtf
	H6gCrZ4z46C/0exl8LN6qV2cTocNVCvT9U0v9E3NpDXkO6k6ajcVPXqQMGADwgLhEKp5GPFS7Xg4J
	nRYuqvV1HB7heRLXqPmhHSzRvsklzf3SJ8/Mi1/H1RKaAotTSN+8+skesrGEOmkK81ef9gMWCEDcI
	TsNdnAWI5B8pfU5SxIu5WMhwh1XDPFPmlQnx0qMNyW6ZsZ82bIQA+omKg0zopbMTq5IOFAQ6W5Xqz
	Lf1Ooj7Q==;
Received: from dynamic-089-204-138-189.89.204.138.pool.telefonica.de ([89.204.138.189] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaCHJ-0015f0-Hu; Mon, 19 Sep 2022 08:37:21 +0000
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
Subject: [PATCH net-next v2 1/5] net: mediatek: sgmii: fix powering up the SGMII phy
Date: Mon, 19 Sep 2022 10:37:08 +0200
Message-Id: <20220919083713.730512-2-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919083713.730512-1-lynxis@fe80.eu>
References: <20220919083713.730512-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014641_690660_99C73165 
X-CRM114-Status: GOOD (  11.02  )
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

There are cases when the SGMII_PHYA_PWD register contains 0x9 which
prevents SGMII from working. The SGMII still shows link but no traffic
can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
taken from a good working state of the SGMII interface.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 25 ++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 736839c84130..b9b15e1a292c 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -36,9 +36,15 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
 	val |= SGMII_AN_RESTART;
 	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
 
-	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
-	val &= ~SGMII_PHYA_PWD;
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
+	/* Release PHYA power down state
+	 * Only removing bit SGMII_PHYA_PWD isn't enough.
+	 * There are cases when the SGMII_PHYA_PWD register contains 0x9 which
+	 * prevents SGMII from working. The SGMII still shows link but no traffic
+	 * can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
+	 * taken from a good working state of the SGMII interface.
+	 * Tested on mt7622 & mt7986.
+	 */
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
 
@@ -69,10 +75,15 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
 	val |= SGMII_SPEED_1000;
 	regmap_write(mpcs->regmap, SGMSYS_SGMII_MODE, val);
 
-	/* Release PHYA power down state */
-	regmap_read(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, &val);
-	val &= ~SGMII_PHYA_PWD;
-	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, val);
+	/* Release PHYA power down state
+	 * Only removing bit SGMII_PHYA_PWD isn't enough.
+	 * There are cases when the SGMII_PHYA_PWD register contains 0x9 which
+	 * prevents SGMII from working. The SGMII still shows link but no traffic
+	 * can flow. Writing 0x0 to the PHYA_PWD register fix the issue. 0x0 was
+	 * taken from a good working state of the SGMII interface.
+	 * Tested on mt7622 & mt7986.
+	 */
+	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
 	return 0;
 }
-- 
2.37.3


