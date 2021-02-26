Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24F8C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 16:45:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56DBE64F0D
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 16:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56DBE64F0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0KAiFH5rlypKcc2XYZD2KlA65s1ZsUL6EIKJVZ7K4Oc=; b=rKfM9z6gVjBDIpQMwnucYiNBb
	lZhX8/URTFeaGXczbQOXXt2DCc3l15w6BVI05ybsvx2EKnFQC+iLcIskYysmF8c1oNVmHMvMtrsDJ
	2tIZT7nGOcqoSlnwu4W3EfQa/blKH8gtq0dH3iPYimXW5vl6COFpBZ+gi9IUZRhC6/TPHnjcSYpGw
	SLhQtZugrs9bYffQ/YH7GoYrZx6gqs3oD/mYUI+bFNnA4ppRzsJcDiU7VCsCE9Bv7zCqnjIx8aMh/
	+4Q356BZ0EZ40FN6wF2it9eaWTgkuGpVvOJ7Nli+xPn14bhw5dkfBkVnbuC9eg4srp9pAYioCwDA+
	pg28htJyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFgEX-0004pn-4V; Fri, 26 Feb 2021 16:44:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFgEU-0004or-79
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 16:44:51 +0000
X-UUID: 632c9ecb8ec14e8f8e1e5b041d8edfca-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y27a2mx/sioEwtQ9jqiiBUAupSs2pvIadmiyucoqiUs=; 
 b=RQx35hE0lKZ8KJszYiFFWIPnYTF9k//M97NI3j95GPxvwVnLAauKgf6un+7SeeyHqA9Cbv9aG3fKdDGXoJAnmg9KdE5k7rNMcIBuqChSKFb5TAjQqlX6RuktvciXMGMAv90czs+t8I1AzqoepE5SKdDUW7I5jdcGKK2nFXifMv4=;
X-UUID: 632c9ecb8ec14e8f8e1e5b041d8edfca-20210226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 501392401; Fri, 26 Feb 2021 08:44:45 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 08:44:43 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Feb 2021 00:44:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 27 Feb 2021 00:44:29 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 2/2] mt76: mt7615: add missing capabilities for DBDC
Date: Sat, 27 Feb 2021 00:44:28 +0800
Message-ID: <b9fc368c472ab525ce967114c53bb9aa36a427a6.1614357346.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <427ab5a2a79b8bbfa05225cfe4cfb55b3f143c8c.1614357346.git.ryder.lee@mediatek.com>
References: <427ab5a2a79b8bbfa05225cfe4cfb55b3f143c8c.1614357346.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_114450_897302_CF7ED086 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Same as mt7915, this should improve performance.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - adjust setup sequence.
---
 .../net/wireless/mediatek/mt76/mt7615/init.c    | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 88a2ee7e7143..bc908514a510 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -368,6 +368,17 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 		hw->max_tx_fragments = MT_TXP_MAX_BUF_NUM;
 	else
 		hw->max_tx_fragments = MT_HW_TXP_MAX_BUF_NUM;
+
+	if (phy->mt76->cap.has_2ghz)
+		phy->mt76->sband_2g.sband.ht_cap.cap |=
+			IEEE80211_HT_CAP_LDPC_CODING;
+
+	if (phy->mt76->cap.has_5ghz) {
+		phy->mt76->sband_5g.sband.ht_cap.cap |=
+			IEEE80211_HT_CAP_LDPC_CODING;
+		phy->mt76->sband_5g.sband.vht_cap.cap |=
+			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
+	}
 }
 
 static void
@@ -424,7 +435,6 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	phy->mt76 = mphy;
 	mphy->chainmask = dev->chainmask & ~dev->mphy.chainmask;
 	mphy->antenna_mask = BIT(hweight8(mphy->chainmask)) - 1;
-	mt7615_init_wiphy(mphy->hw);
 
 	INIT_DELAYED_WORK(&mphy->mac_work, mt7615_mac_work);
 	INIT_DELAYED_WORK(&phy->scan_work, mt7615_scan_work);
@@ -448,6 +458,7 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	/* second phy can only handle 5 GHz */
 	mphy->cap.has_5ghz = true;
+	mt7615_init_wiphy(mphy->hw);
 
 	/* mt7615 second phy shares the same hw queues with the primary one */
 	for (i = 0; i <= MT_TXQ_PSD ; i++)
@@ -505,10 +516,6 @@ void mt7615_init_device(struct mt7615_dev *dev)
 
 	mt7615_init_wiphy(hw);
 	dev->pm.idle_timeout = MT7615_PM_TIMEOUT;
-	dev->mphy.sband_2g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	dev->mphy.sband_5g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	dev->mphy.sband_5g.sband.vht_cap.cap |=
-			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
 	mt7615_cap_dbdc_disable(dev);
 	dev->phy.dfs_state = -1;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
