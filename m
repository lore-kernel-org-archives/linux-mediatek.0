Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0917FC3F2CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C663B20754
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aDDQnSdO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqwpVIXt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C663B20754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwxMK5AmSC1uuxhBEZ8YJETDtbPe1GSKT+VoW+sBJEg=; b=aDDQnSdOYxuiLg
	ffog8nIvdD8ybzHXv9VTPmcrlbt1XGVu9LABL8vqdvkT3z7Xdcz4q3UFGpASICHRXXl/uj2ZotYic
	ndspREdKV4bV4lbjsPLSZU9/jysiFL3ziBoWPc3SS4qu23R5kGs6tGM/t211iGCBVcMvdNNmD/i9Z
	peOSbPLJJ77bhJNXGduHvEzhHHlPLs2f1TSq5CctxC59dCfbJB1gtr7OZCW9QtyBcdLFN/6ljDQxe
	mQ3BL9EFFg1Kv7ASTtW0WFCG3vcMrc6WyA0KNkvHRiRKtuzSwdHo83nK3uj0FOq6ieHgchP3rAv0v
	eIbJSdpey1PB6w5zrOrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFI4-0006Ti-S9; Tue, 17 Mar 2020 16:42:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFI0-0006PQ-Cq
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:02 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 727F02073E;
 Tue, 17 Mar 2020 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463319;
 bh=Z5EO24ZeE5vFiNha0MJLBEq388AbzNWjLJxVHNp4O6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XqwpVIXtFe9LMHvAekFuS7uEn/e4s9R6TI6GuUz7Q8+mionrZyNJFUrC5luEBVW1/
 rp4gAe6ncOzGhpzi2hco1qAKEnqzB3jxtvcJqgeQuTZEHEV0ekcCPAuhp9a3jFn3Sm
 YKOc1Rcc+qBJNpAnuxjqTV5Gi2RBvKwAZGBIY6Ks=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 04/25] mt76: mt7615: introduce mt7615_init_device routine
Date: Tue, 17 Mar 2020 17:41:11 +0100
Message-Id: <3f86e950286181b54605c3355d08c32bff0e219f.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094200_535984_E42640BA 
X-CRM114-Status: GOOD (  10.69  )
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

Add mt7615_init_device routine in order to be reused adding support for
mt7663 in mt7615 driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 27 +++++++++++--------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  1 +
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 4c41e4048161..40e9bf5f4a35 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -429,11 +429,9 @@ void mt7615_unregister_ext_phy(struct mt7615_dev *dev)
 	ieee80211_free_hw(mphy->hw);
 }
 
-
-int mt7615_register_device(struct mt7615_dev *dev)
+void mt7615_init_device(struct mt7615_dev *dev)
 {
 	struct ieee80211_hw *hw = mt76_hw(dev);
-	int ret;
 
 	dev->phy.dev = dev;
 	dev->phy.mt76 = &dev->mt76.phy;
@@ -444,14 +442,6 @@ int mt7615_register_device(struct mt7615_dev *dev)
 	init_waitqueue_head(&dev->reset_wait);
 	INIT_WORK(&dev->reset_work, mt7615_mac_reset_work);
 
-	ret = mt7622_wmac_init(dev);
-	if (ret)
-		return ret;
-
-	ret = mt7615_init_hardware(dev);
-	if (ret)
-		return ret;
-
 	mt7615_init_wiphy(hw);
 	dev->mphy.sband_2g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
 	dev->mphy.sband_5g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
@@ -460,6 +450,13 @@ int mt7615_register_device(struct mt7615_dev *dev)
 			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
 	mt7615_cap_dbdc_disable(dev);
 	dev->phy.dfs_state = -1;
+}
+
+int mt7615_register_device(struct mt7615_dev *dev)
+{
+	int ret;
+
+	mt7615_init_device(dev);
 
 	/* init led callbacks */
 	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
@@ -467,6 +464,14 @@ int mt7615_register_device(struct mt7615_dev *dev)
 		dev->mt76.led_cdev.blink_set = mt7615_led_set_blink;
 	}
 
+	ret = mt7622_wmac_init(dev);
+	if (ret)
+		return ret;
+
+	ret = mt7615_init_hardware(dev);
+	if (ret)
+		return ret;
+
 	ret = mt76_register_device(&dev->mt76, true, mt7615_rates,
 				   ARRAY_SIZE(mt7615_rates));
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 2b7cee4da519..cc5aa2abb462 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -272,6 +272,7 @@ static inline int mt7622_wmac_init(struct mt7615_dev *dev)
 int mt7615_mmio_probe(struct device *pdev, void __iomem *mem_base, int irq);
 u32 mt7615_reg_map(struct mt7615_dev *dev, u32 addr);
 
+void mt7615_init_device(struct mt7615_dev *dev);
 int mt7615_register_device(struct mt7615_dev *dev);
 void mt7615_unregister_device(struct mt7615_dev *dev);
 int mt7615_register_ext_phy(struct mt7615_dev *dev);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
