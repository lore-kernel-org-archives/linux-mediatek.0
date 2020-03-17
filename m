Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC217C3F2CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0CA20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YYWvVk6f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwamijNy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0CA20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZGe7i7ox3eJUBjqv8ex4Qj/sUlDAUd49GTjA/K2eG0=; b=YYWvVk6fpoonbF
	dhj2VXadVJV+kxFzCIuB87zXfbWEuPayDUeTFWMgTCNmeIx1JTSv5iTd9+7NP5hA6tGd0YYvqWxuz
	CiOf8DFwFnGs1JhS69SBnX/Uq2kw8R9sj7xc3inHoXx2V5tzii7s+V4jryCM+4zcrpMzjUkIFivvS
	4H/zq2yaDpDM1AcWkiSBHPEZP1NlvHVvuxsjg1leqgpgxVKtdvVUwRYG/5GSzqB/TTHLGkcX+aJYi
	TCCNWJbtWoyW+yjEWpwrUWR6gyQKOKHgGxsUKv8ti6pv+h/TRAB+sHGZlinX6Quj2doMC02iJHUtu
	6hphjpg+QggySgppMVHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIb-0007Iw-FQ; Tue, 17 Mar 2020 16:42:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIS-000767-B9
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:30 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E45020757;
 Tue, 17 Mar 2020 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463347;
 bh=rggreeVrh9mIj7hSFnZ5vp5/8ry8nP5zHj4ICP8qoCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IwamijNyoUZbyr8QbIHyp5uc8uYkPXR7GQV5kgOh9HcwnEyU0WCUG2pEm//XmmzM1
 O5jq5azwq+z7YtkDboqW/AFoUSCnxSJqr/NvijlpxW2g4pUlvLz6S5rY9iUObUwsfF
 9yeRu1JcXcvHrtIhX4VOH08fgNRHmqhodPWHdFa0=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 19/25] mt76: mt7615: introduce mt7615_init_mac_chain routine
Date: Tue, 17 Mar 2020 17:41:26 +0100
Message-Id: <75b1da040e32a270760ed31c800646f6ca81c7c1.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094228_450239_5BB477B5 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce mt7615_init_mac_chain routine to configure per band mac
register since new devices (e.g. mt7663e) do not support dbdc

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 118 +++++++++---------
 1 file changed, 62 insertions(+), 56 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 40e9bf5f4a35..6a4b3eaa12f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -18,27 +18,66 @@ static void mt7615_phy_init(struct mt7615_dev *dev)
 	mt76_set(dev, MT_WF_PHY_WF2_RFCTRL0(1), MT_WF_PHY_WF2_RFCTRL0_LPBCN_EN);
 }
 
-static void mt7615_mac_init(struct mt7615_dev *dev)
+static void
+mt7615_init_mac_chain(struct mt7615_dev *dev, int chain)
 {
 	u32 val, mask, set;
-	int i;
+
+	if (!chain)
+		val = MT_CFG_CCR_MAC_D0_1X_GC_EN | MT_CFG_CCR_MAC_D0_2X_GC_EN;
+	else
+		val = MT_CFG_CCR_MAC_D1_1X_GC_EN | MT_CFG_CCR_MAC_D1_2X_GC_EN;
 
 	/* enable band 0/1 clk */
-	mt76_set(dev, MT_CFG_CCR,
-		 MT_CFG_CCR_MAC_D0_1X_GC_EN | MT_CFG_CCR_MAC_D0_2X_GC_EN |
-		 MT_CFG_CCR_MAC_D1_1X_GC_EN | MT_CFG_CCR_MAC_D1_2X_GC_EN);
-
-	val = mt76_rmw(dev, MT_TMAC_TRCR(0),
-		       MT_TMAC_TRCR_CCA_SEL | MT_TMAC_TRCR_SEC_CCA_SEL,
-		       FIELD_PREP(MT_TMAC_TRCR_CCA_SEL, 2) |
-		       FIELD_PREP(MT_TMAC_TRCR_SEC_CCA_SEL, 0));
-	mt76_wr(dev, MT_TMAC_TRCR(1), val);
-
-	val = MT_AGG_ACR_PKT_TIME_EN | MT_AGG_ACR_NO_BA_AR_RULE |
-	      FIELD_PREP(MT_AGG_ACR_CFEND_RATE, MT7615_CFEND_RATE_DEFAULT) |
-	      FIELD_PREP(MT_AGG_ACR_BAR_RATE, MT7615_BAR_RATE_DEFAULT);
-	mt76_wr(dev, MT_AGG_ACR(0), val);
-	mt76_wr(dev, MT_AGG_ACR(1), val);
+	mt76_set(dev, MT_CFG_CCR, val);
+
+	mt76_rmw(dev, MT_TMAC_TRCR(chain),
+		 MT_TMAC_TRCR_CCA_SEL | MT_TMAC_TRCR_SEC_CCA_SEL,
+		 FIELD_PREP(MT_TMAC_TRCR_CCA_SEL, 2) |
+		 FIELD_PREP(MT_TMAC_TRCR_SEC_CCA_SEL, 0));
+
+	mt76_wr(dev, MT_AGG_ACR(chain),
+		MT_AGG_ACR_PKT_TIME_EN | MT_AGG_ACR_NO_BA_AR_RULE |
+		FIELD_PREP(MT_AGG_ACR_CFEND_RATE, MT7615_CFEND_RATE_DEFAULT) |
+		FIELD_PREP(MT_AGG_ACR_BAR_RATE, MT7615_BAR_RATE_DEFAULT));
+
+	mt76_wr(dev, MT_AGG_ARUCR(chain),
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), 7) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), 2) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), 2) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), 2) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), 1));
+
+	mt76_wr(dev, MT_AGG_ARDCR(chain),
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), MT7615_RATE_RETRY - 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), MT7615_RATE_RETRY - 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), MT7615_RATE_RETRY - 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), MT7615_RATE_RETRY - 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), MT7615_RATE_RETRY - 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), MT7615_RATE_RETRY - 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), MT7615_RATE_RETRY - 1) |
+		FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), MT7615_RATE_RETRY - 1));
+
+	mask = MT_DMA_RCFR0_MCU_RX_MGMT |
+	       MT_DMA_RCFR0_MCU_RX_CTL_NON_BAR |
+	       MT_DMA_RCFR0_MCU_RX_CTL_BAR |
+	       MT_DMA_RCFR0_MCU_RX_BYPASS |
+	       MT_DMA_RCFR0_RX_DROPPED_UCAST |
+	       MT_DMA_RCFR0_RX_DROPPED_MCAST;
+	set = FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_UCAST, 2) |
+	      FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_MCAST, 2);
+	mt76_rmw(dev, MT_DMA_RCFR0(chain), mask, set);
+}
+
+static void mt7615_mac_init(struct mt7615_dev *dev)
+{
+	int i;
+
+	mt7615_init_mac_chain(dev, 0);
+	mt7615_init_mac_chain(dev, 1);
 
 	mt76_rmw_field(dev, MT_TMAC_CTCR0,
 		       MT_TMAC_CTCR0_INS_DDLMT_REFTIME, 0x3f);
@@ -56,47 +95,14 @@ static void mt7615_mac_init(struct mt7615_dev *dev)
 	mt76_rmw(dev, MT_AGG_SCR, MT_AGG_SCR_NLNAV_MID_PTEC_DIS,
 		 MT_AGG_SCR_NLNAV_MID_PTEC_DIS);
 
-	mt76_wr(dev, MT_DMA_DCR0, MT_DMA_DCR0_RX_VEC_DROP |
-		FIELD_PREP(MT_DMA_DCR0_MAX_RX_LEN, 3072));
-
-	val = FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), 7) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), 2) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), 2) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), 2) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), 1);
-	mt76_wr(dev, MT_AGG_ARUCR(0), val);
-	mt76_wr(dev, MT_AGG_ARUCR(1), val);
-
-	val = FIELD_PREP(MT_AGG_ARxCR_LIMIT(0), MT7615_RATE_RETRY - 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(1), MT7615_RATE_RETRY - 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(2), MT7615_RATE_RETRY - 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(3), MT7615_RATE_RETRY - 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(4), MT7615_RATE_RETRY - 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(5), MT7615_RATE_RETRY - 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(6), MT7615_RATE_RETRY - 1) |
-	      FIELD_PREP(MT_AGG_ARxCR_LIMIT(7), MT7615_RATE_RETRY - 1);
-	mt76_wr(dev, MT_AGG_ARDCR(0), val);
-	mt76_wr(dev, MT_AGG_ARDCR(1), val);
-
 	mt76_wr(dev, MT_AGG_ARCR,
-		(FIELD_PREP(MT_AGG_ARCR_RTS_RATE_THR, 2) |
-		 MT_AGG_ARCR_RATE_DOWN_RATIO_EN |
-		 FIELD_PREP(MT_AGG_ARCR_RATE_DOWN_RATIO, 1) |
-		 FIELD_PREP(MT_AGG_ARCR_RATE_UP_EXTRA_TH, 4)));
+		FIELD_PREP(MT_AGG_ARCR_RTS_RATE_THR, 2) |
+		MT_AGG_ARCR_RATE_DOWN_RATIO_EN |
+		FIELD_PREP(MT_AGG_ARCR_RATE_DOWN_RATIO, 1) |
+		FIELD_PREP(MT_AGG_ARCR_RATE_UP_EXTRA_TH, 4));
 
-	mask = MT_DMA_RCFR0_MCU_RX_MGMT |
-	       MT_DMA_RCFR0_MCU_RX_CTL_NON_BAR |
-	       MT_DMA_RCFR0_MCU_RX_CTL_BAR |
-	       MT_DMA_RCFR0_MCU_RX_BYPASS |
-	       MT_DMA_RCFR0_RX_DROPPED_UCAST |
-	       MT_DMA_RCFR0_RX_DROPPED_MCAST;
-	set = FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_UCAST, 2) |
-	      FIELD_PREP(MT_DMA_RCFR0_RX_DROPPED_MCAST, 2);
-	mt76_rmw(dev, MT_DMA_RCFR0(0), mask, set);
-	mt76_rmw(dev, MT_DMA_RCFR0(1), mask, set);
+	mt76_wr(dev, MT_DMA_DCR0, MT_DMA_DCR0_RX_VEC_DROP |
+		FIELD_PREP(MT_DMA_DCR0_MAX_RX_LEN, 3072));
 
 	for (i = 0; i < MT7615_WTBL_SIZE; i++)
 		mt7615_mac_wtbl_update(dev, i,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
