Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28B6606A31D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zx+7qHV5;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Jxcgmkeh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y7hmqCw1gCI3F+lKJo+60hsoMoL3Lp/xNtSnOd4UKmo=; b=Zx+7qHV5/0r8/a6e03c14LhQKr
	WxWp520HCz2r1MUmUwoBNq23W/eGaljWmenJa/PJcRwYiDGXRwyp6gQJMuJLR3ySNwp3Rjo/VeE2g
	Jg39CpHrsujEEiM7E6BUw5ieA9TIJYpGW2QMoel6iCt/BCBXz/qvtUz6CVHUKtFNjGuw+ziuIG3ct
	Xccygo2ge4WXaWLG39vNNe0fDwAb/ZpWLyAZSicH1+mK/z2CzrYmnyuWxq1Sko4haEBjAddIc2FJ0
	WylRNfYZdkxhxV+geL1/Ol6bDRoXCzSVueDOpDo3Xc4HFnTZDKOuUC1IfLXAsDaakBSgqyv5MQacl
	OIXKOMkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Oj-0000000FHWV-1dfb;
	Fri, 23 Oct 2026 01:48:45 +0000
Received: from out-250.mta1.migadu.com ([2001:41d0:203:375::fa] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Of-0000000FHW5-21qO
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 01:48:44 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UzeWU/Wa88XK/oJoJqM7yCGkUyFCG9Jv8jwwR7Jh4V0=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792720115; v=1; x=1793324915;
 b=JxcgmkehPCE2CFCRrDt8qHn36OO+gb5yBs9ydmSYmpjaqOmZZJUX4tfQGHe2nS4E02Kgw2Kh
 SKjYr/h1Xo/VH4Geako0BEH7PWP+uY8CQedZUqf5E6UtmHD2/qViGmJwv3GTzeqNoRqhEzyamUT
 AfNgCf7ahZ6DpRvOOeL1OP+NT67CQOl9pZcR3UtExrFPK+eipqrcdkaCYMMSlPyP1suhHgtsevU
 wdG+a84TtrHyiSKm0C5EL/Oi7i87rKwwAvRYk1Vhc2wRb0Q2uvo/6rSsgDuKpDJ8Rtz3iPXtQ0c
 jDyke06H/f6yDbGrsZOB82fbRp5iOfnOggRW5yegeLvOw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 173adff547ff4ada;
	Fri, 23 Oct 2026 01:48:34 +0000
X-Mizu-Trace-ID: 173adff547ff4ada
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: mt792x: tell mac80211 when a disconnect cancels its ROC
Date: Thu, 22 Oct 2026 18:48:27 -0700
Message-ID: <20261023014827.57411-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_184841_875936_B21024F5 
X-CRM114-Status: GOOD (  12.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A disconnect during a remain-on-channel (ROC) cancels the ROC in
firmware without telling mac80211, which then waits for a ROC that is
already gone. Scans stall, and after an AP deauth the station does not
reconnect.

Tell mac80211 when the driver cancels a ROC that mac80211 started.

Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
Fixes: 5ed54896b6bd ("wifi: mt76: mt7921: fix a potential scan no APs")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Fixes: 45064d19fd3a ("wifi: mt76: mt7925: fix a potential association failure upon resuming")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Tested on an MT7922 and an MT7925U: without this, scans stall after a
disconnect during a ROC. With it they work, and the station is back
about 4 s after an AP deauth. mac80211's own cancel stays silent, since
it ends that ROC itself.

 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 14 +++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 15 ++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 09574d4417cd..019c1ff5b0a3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -381,6 +381,9 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 	ieee80211_iterate_interfaces(mt76_hw(dev),
 				     IEEE80211_IFACE_ITER_RESUME_ALL,
 				     mt7921_roc_iter, (void *)phy);
+
+	if (phy->roc_mac80211)
+		ieee80211_remain_on_channel_expired(mt76_hw(dev));
 }
 EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
 
@@ -405,16 +408,21 @@ void mt7921_roc_work(struct work_struct *work)
 
 static int mt7921_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif)
 {
+	bool aborted;
 	int err = 0;
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
 	mt792x_mutex_acquire(phy->dev);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+	aborted = test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+	if (aborted)
 		err = mt7921_mcu_abort_roc(phy, vif, phy->roc_token_id);
 	mt792x_mutex_release(phy->dev);
 
+	if (aborted && phy->roc_mac80211)
+		ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
 	return err;
 }
 
@@ -430,6 +438,7 @@ static int mt7921_set_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	phy->roc_grant = false;
+	phy->roc_mac80211 = type == MT7921_ROC_REQ_ROC;
 
 	err = mt7921_mcu_set_roc(phy, vif, chan, duration, type,
 				 ++phy->roc_token_id);
@@ -471,6 +480,9 @@ static int mt7921_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
+	/* mac80211 ends this ROC itself */
+	phy->roc_mac80211 = false;
+
 	return mt7921_abort_roc(phy, mvif);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 22cc5b49da0a..0394250d46e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -527,6 +527,9 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 	ieee80211_iterate_interfaces(mt76_hw(dev),
 				     IEEE80211_IFACE_ITER_RESUME_ALL,
 				     mt7925_roc_iter, (void *)phy);
+
+	if (phy->roc_mac80211)
+		ieee80211_remain_on_channel_expired(mt76_hw(dev));
 }
 EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
@@ -551,16 +554,21 @@ void mt7925_roc_work(struct work_struct *work)
 static int mt7925_abort_roc(struct mt792x_phy *phy,
 			    struct mt792x_bss_conf *mconf)
 {
+	bool aborted;
 	int err = 0;
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
 	mt792x_mutex_acquire(phy->dev);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+	aborted = test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+	if (aborted)
 		err = mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
 	mt792x_mutex_release(phy->dev);
 
+	if (aborted && phy->roc_mac80211)
+		ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
 	return err;
 }
 
@@ -576,6 +584,7 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	phy->roc_grant = false;
+	phy->roc_mac80211 = type == MT7925_ROC_REQ_ROC;
 
 	err = mt7925_mcu_set_roc(phy, mconf, chan, duration, type,
 				 ++phy->roc_token_id);
@@ -604,6 +613,7 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	phy->roc_grant = false;
+	phy->roc_mac80211 = false;
 
 	err = mt7925_mcu_set_mlo_roc(phy, mconf, sel_links, 5, ++phy->roc_token_id);
 	if (err < 0) {
@@ -645,6 +655,9 @@ static int mt7925_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
+	/* mac80211 ends this ROC itself */
+	phy->roc_mac80211 = false;
+
 	return mt7925_abort_roc(phy, &mvif->bss_conf);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index a7d71e007da0..1cc8475dc608 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -240,6 +240,7 @@ struct mt792x_phy {
 	wait_queue_head_t roc_wait;
 	u8 roc_token_id;
 	bool roc_grant;
+	bool roc_mac80211;
 };
 
 struct mt792x_irq_map {
-- 
2.56.0


