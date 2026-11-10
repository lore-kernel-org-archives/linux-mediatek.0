Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF1606A335
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MTrPddHs;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=G7U453sM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CKjdyMDHNV6MdUd+DZ7ZTXLQmbEoceaaRG1MeMVaccE=; b=MTrPddHsWtxE3zqoETnkZvOMRr
	aI9bsMjP5a09A9khYRWXYCbBbLA+FIGlTrJ2H0PrkpUbFgm9GEyPjCdGW0ELcWia/hszAbTsAE+wl
	gE7LqtTAuMs4nDbh5oT152Tx/aFnLGz+K+8zciNgkGvyKgcZnnpwX2UqWwUTx0SufdhbofEfA0M5M
	Lq0M4TUSEg6nkR+wzQD5iwWbonJnW/0RWMVldyKRA1SHJhl/up4o/aLABah00LPij0oH88bnODG10
	1mA3cVtBnLZMXAXyKiGwhN0m2Y/T7pj6Ch80l8ZZ2GL9UeV4zKpbXUJAYDaLm48n/itp0Uchnjx9c
	6NzbWvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaCT-0000000236w-1igy;
	Tue, 10 Nov 2026 00:59:01 +0000
Received: from out-32.mta0.migadu.com ([2001:41d0:1004:224b::20] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaCQ-0000000236Y-0M0R
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 00:59:00 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=m45zSAjEHoA1c21nmbzp1R0tpgwGyte4VJOVVYxADbo=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794272334; v=1; x=1794877134;
 b=G7U453sMKJpKp41WCuKAQpNNK+OYVuy371qahkDLdGHRybdUNucvOYsoyDk1oAWHEF+WDPJl
 DMNcZjD2MRwY9SyiTrRIkXubqfv/tGqzHWk8ElvIR5sObjHHEB7Pc08DGJWcGB433sMjlgq626s
 Wr0W207B1Tz0TXwAXobhmiqE2eCBRhr7sZ4+IpORk5yUTSD5jABi0mJThcS4zdNtqvjJw+Xd7S6
 zHyTNSDP9UlFMT2b/N+bbZxKFdWCCUvpBwjJnPsBmEJjpbGrDKSfiGyEhFD3LsedHpAGpQxe60F
 J9BbdQYwpCN3B/eidDREPdNNWyb7jcMY7vMB8d6GKbTNw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id afe33ea9b8f10079;
	Tue, 10 Nov 2026 00:58:53 +0000
X-Mizu-Trace-ID: afe33ea9b8f10079
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
	James-LY Huang <james-ly.huang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect cancels its ROC
Date: Mon,  9 Nov 2026 17:58:46 -0700
Message-ID: <20261110005846.38432-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_165858_481669_CA4716CD 
X-CRM114-Status: GOOD (  12.73  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
v2: rebased on Felix's mt76 branch (8739e5b44b23), where v1 no longer
applies. There, 2466ffac172d added a flag on mt7925 for a ROC that
mac80211 is waiting to see end. This uses that flag, and sets it on
mt7921 as well.

Tested on that branch with an MT7922 and an MT7925U:

  disconnect while a ROC is held   without this         with it
  AP deauth                        no reconnect, scans  back in 4.2 s
                                   stall
  the station disconnects          scans stall          scan in 3.3 to
                                                        3.5 s
  the same, MT7925U on two links   no reconnect, scans  back in 9.1 to
                                   stall                9.4 s, 3 of 3

Each cancelled ROC is reported once, and a P2P find ends its ROCs as
before on both chips.

v1: https://lore.kernel.org/all/20261023014827.57411-1-lucid_duck@justthetip.ca/

 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 14 +++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 ++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 09574d4417cd..58df080a342e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -381,6 +381,9 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 	ieee80211_iterate_interfaces(mt76_hw(dev),
 				     IEEE80211_IFACE_ITER_RESUME_ALL,
 				     mt7921_roc_iter, (void *)phy);
+
+	if (phy->roc_notify)
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
 
+	if (aborted && phy->roc_notify)
+		ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
 	return err;
 }
 
@@ -430,6 +438,7 @@ static int mt7921_set_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	phy->roc_grant = false;
+	phy->roc_notify = type == MT7921_ROC_REQ_ROC;
 
 	err = mt7921_mcu_set_roc(phy, vif, chan, duration, type,
 				 ++phy->roc_token_id);
@@ -471,6 +480,9 @@ static int mt7921_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
+	/* mac80211 ends this ROC itself */
+	phy->roc_notify = false;
+
 	return mt7921_abort_roc(phy, mvif);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 222836699d15..01c08b80ea14 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -553,6 +553,9 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 	ieee80211_iterate_interfaces(mt76_hw(dev),
 				     IEEE80211_IFACE_ITER_RESUME_ALL,
 				     mt7925_roc_iter, (void *)phy);
+
+	if (phy->roc_notify)
+		ieee80211_remain_on_channel_expired(mt76_hw(dev));
 }
 EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
@@ -583,16 +586,21 @@ void mt7925_roc_work(struct work_struct *work)
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
 
+	if (aborted && phy->roc_notify)
+		ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
 	return err;
 }
 
@@ -712,6 +720,9 @@ static int mt7925_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
+	/* mac80211 ends this ROC itself */
+	phy->roc_notify = false;
+
 	return mt7925_abort_roc(phy, &mvif->bss_conf);
 }
 
-- 
2.56.0


