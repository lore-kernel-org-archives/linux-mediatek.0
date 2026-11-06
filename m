Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78B606A33D
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fq+Mbedu;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=p5qR0kCi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OTcNYd43bHITQ9aI+SXoNUg8xbmtUARLlMhsg9u0TBw=; b=fq+MbeduZjUjW+YWgXVqkaYM28
	9QEVHxMiJ1STyzzVfNhycf42wr6wUFeWvZcvuEgbAqy3zcfmsJnnrdbJZ5zdLww94/I2sE08NYiUz
	K4vOKqrxzh+AIhTQ4N8Q0SthmSxELicDczWIixUhfoMOsA+gBciaAsqPbvGR5Ra9BwK3jh/P8ne/1
	6F7vyZaDwhqY4Lwf1QAHK/rylJTaD5RUeSa+RjF9+w9Zd8TUz2xhIhtMSpt5xIFz9YK/v8MDo3sCN
	qzTcmSK8LNlp8ToWVkUeSPTdF4KFSGEDbZ1IiQDpBURVXVF5htR/tnDenJbAyHbvbAgG2fFTJmW1A
	ABDn1fcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFL6-0000000BZSO-0mZl;
	Fri, 06 Nov 2026 08:30:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFL0-0000000BZGm-1ydc
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:21 +0000
X-UUID: 48f8ff26d9bc11f1afed4741b24580c9-20261106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OTcNYd43bHITQ9aI+SXoNUg8xbmtUARLlMhsg9u0TBw=;
	b=p5qR0kCiTKgbqC+lhpdt3WDbyzTG7/V/L0PvscIgQrOT5S8C5FSLkmEEYHs+6vqM1vUii1WpIO7fPRifTUtZ/1TdWZI9hHB0yia2A9FY04SfO4eoRUETuysWuBcTr5HoM5RGlPkE0wLOBFYg0Aw1KDwHAWCT8/v5zOpiYRGdY+A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e7907187-be38-4f8f-9ef8-e5488a0e7bee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3aa4dace-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48f8ff26d9bc11f1afed4741b24580c9-20261106
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <james-ly.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 713052887; Fri, 06 Nov 2026 01:30:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 16:30:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 16:30:09 +0800
From: James-LY Huang <james-ly.huang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<sean.wang@mediatek.com>, <jb.tsai@mediatek.com>, <kun.wu@mediatek.com>,
	<James-LY.Huang@mediatek.com>, james-ly huang <james-ly.huang@mediatek.com>
Subject: [PATCH v2 4/9] wifi: mt76: mt7925: harden the ROC channel-grant handshake
Date: Fri, 6 Nov 2026 16:29:59 +0800
Message-ID: <20261106083004.3156085-5-james-ly.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261106083004.3156085-1-james-ly.huang@mediatek.com>
References: <20261106083004.3156085-1-james-ly.huang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003018_532705_B275686F 
X-CRM114-Status: GOOD (  23.56  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: james-ly huang <james-ly.huang@mediatek.com>

A ROC grant is bound to the request it answers, and the expiry
path must not hand the channel to a newer request:

  - validate the grant token (mt7925_mcu_roc_handle_grant):
    a late grant for an already-aborted request must not
    overwrite band_idx nor wake the waiter of a newer request;
  - latch the token in mt7925_roc_work() (mt7925_roc_token_iter)
    and report the expiry to mac80211 BEFORE the UNI_ROC_ABORT
    round trip, so a mgmt_tx arriving while the abort is in
    flight cannot get coalesced onto the dead ROC;
  - reclaim a stale ROC in mt7925_set_roc() when
    MT76_STATE_ROC is set but its roc_timer already expired:
    the caller gets a fresh grant instead of -EBUSY for a
    channel it does not own (mgd_prepare_tx ignores -EBUSY);
  - skip the mgd_prepare_tx/complete_tx ROC pair for the
    deauth/disassoc that tears a link down (info->was_assoc):
    the associated link already holds a grant, and aborting it
    would flush the still-pending deauth.

Signed-off-by: james-ly huang <james-ly.huang@mediatek.com>
---
v2: no change
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 85 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 10 +++
 2 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3fa6c48c6549..b82360da9791 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -527,6 +527,25 @@ static void mt7925_roc_iter(void *priv, u8 *mac,
 	mt7925_mcu_abort_roc(phy, &mvif->bss_conf, phy->roc_token_id);
 }
 
+struct mt7925_roc_abort_data {
+	struct mt792x_phy *phy;
+	u8 token;
+};
+
+/* Same as mt7925_roc_iter(), except that the token to abort is latched by the
+ * caller instead of read from phy->roc_token_id. Needed wherever a newer ROC
+ * may already have bumped roc_token_id while the old one is still being torn
+ * down - aborting with the newer token would revoke the wrong grant.
+ */
+static void mt7925_roc_token_iter(void *priv, u8 *mac,
+				  struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt7925_roc_abort_data *data = priv;
+
+	mt7925_mcu_abort_roc(data->phy, &mvif->bss_conf, data->token);
+}
+
 void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 {
 	struct mt792x_phy *phy = &dev->phy;
@@ -546,6 +565,7 @@ EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
 void mt7925_roc_work(struct work_struct *work)
 {
+	struct mt7925_roc_abort_data data;
 	struct mt792x_phy *phy;
 
 	phy = (struct mt792x_phy *)container_of(work, struct mt792x_phy,
@@ -554,12 +574,28 @@ void mt7925_roc_work(struct work_struct *work)
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
 
+	data.phy = phy;
+	data.token = phy->roc_token_id;
+
+	/* Report the expiry to mac80211 first, before the UNI_ROC_ABORT round
+	 * trip below. ieee80211_remain_on_channel_expired() only queues
+	 * mac80211's own hw_roc_done work, while mt792x_mutex_acquire() (which
+	 * also wakes the chip from PM) plus waiting for the MCU reply can take
+	 * tens of ms. Notifying afterwards keeps the finished ROC in
+	 * mac80211's roc_list for that whole window, and a mgmt_tx arriving in
+	 * it gets coalesced onto that dead ROC.
+	 *
+	 * The token is latched above because mac80211 may start the next ROC
+	 * (mt7925_set_roc() -> ++roc_token_id) as soon as it is notified, and
+	 * this abort must still revoke the old grant, not the new one.
+	 */
+	ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
 	mt792x_mutex_acquire(phy->dev);
 	ieee80211_iterate_active_interfaces(phy->mt76->hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7925_roc_iter, phy);
+					    mt7925_roc_token_iter, &data);
 	mt792x_mutex_release(phy->dev);
-	ieee80211_remain_on_channel_expired(phy->mt76->hw);
 }
 
 static int mt7925_abort_roc(struct mt792x_phy *phy,
@@ -585,14 +621,39 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 			  enum mt7925_roc_req type)
 {
 	int err;
+	u8 token;
+
+	/* Every granted ROC arms phy->roc_timer (mt7925_mcu_roc_handle_grant()),
+	 * and an ungranted one holds the mt76 mutex for its whole 4s wait, so
+	 * "MT76_STATE_ROC set but roc_timer no longer pending" can only mean
+	 * the previous ROC's hold time is already over in the FW and just
+	 * mt7925_roc_work() has not run yet. Returning -EBUSY for that stale
+	 * ROC would hand the caller a channel it does not own -
+	 * mt7925_mgd_prepare_tx() ignores the return value, so auth/assoc
+	 * would go out off-channel. Finish the stale one here instead and
+	 * request the channel again.
+	 *
+	 * cancel_work() (not the _sync variant) is mandatory: every caller
+	 * holds the mt76 mutex and mt7925_roc_work() takes that same mutex.
+	 */
+	if (test_bit(MT76_STATE_ROC, &phy->mt76->state) &&
+	    !timer_pending(&phy->roc_timer)) {
+		cancel_work(&phy->roc_work);
+
+		if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state)) {
+			mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
+			ieee80211_remain_on_channel_expired(phy->mt76->hw);
+		}
+	}
 
 	if (test_and_set_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return -EBUSY;
 
 	phy->roc_grant = false;
 
-	err = mt7925_mcu_set_roc(phy, mconf, chan, duration, type,
-				 ++phy->roc_token_id);
+	token = ++phy->roc_token_id;
+
+	err = mt7925_mcu_set_roc(phy, mconf, chan, duration, type, token);
 	if (err < 0) {
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
 		goto out;
@@ -2117,6 +2178,14 @@ static void mt7925_mgd_prepare_tx(struct ieee80211_hw *hw,
 	u16 duration = info->duration ? info->duration :
 		       jiffies_to_msecs(HZ);
 
+	/* info->was_assoc is set only by ieee80211_set_disassoc(), i.e. this is
+	 * the deauth/disassoc that tears the link down. That frame goes out on
+	 * the link we are already associated on, so the FW already holds a
+	 * channel grant for it and the ROC below is redundant.
+	 */
+	if (info->was_assoc)
+		return;
+
 	mt792x_mutex_acquire(dev);
 	mt7925_set_roc(mvif->phy, &mvif->bss_conf,
 		       mvif->bss_conf.mt76.ctx->def.chan, duration,
@@ -2130,6 +2199,14 @@ static void mt7925_mgd_complete_tx(struct ieee80211_hw *hw,
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 
+	/* Paired with the was_assoc early return in mt7925_mgd_prepare_tx():
+	 * no ROC was requested for the deauth/disassoc, so there is nothing to
+	 * abort here. Aborting anyway would revoke the still-needed channel
+	 * grant (and could kill an unrelated userspace ROC).
+	 */
+	if (info->was_assoc)
+		return;
+
 	/* Keep the join ROC until the station is authorized, so that it
 	 * covers the 4-way handshake. mt7925_mac_sta_event() releases it.
 	 * On MLD, the active ROC is the MLO ROC, which must be released
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 3eadea1bb453..2ce403000765 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -393,6 +393,16 @@ static void mt7925_mcu_roc_handle_grant(struct mt792x_dev *dev,
 	/* should never happen */
 	WARN_ON_ONCE((le16_to_cpu(grant->tag) != UNI_EVENT_ROC_GRANT));
 
+	duration = le32_to_cpu(grant->max_interval);
+
+	/* Drop a grant that does not belong to the outstanding request:
+	 * validate the token before acting on the grant, because a late
+	 * grant for an already-aborted request would otherwise overwrite
+	 * band_idx and wake the waiter of a newer request.
+	 */
+	if (grant->tokenid != dev->phy.roc_token_id)
+		return;
+
 	if (grant->reqtype == MT7925_ROC_REQ_ROC)
 		ieee80211_ready_on_channel(hw);
 	else if (grant->reqtype == MT7925_ROC_REQ_JOIN)
-- 
2.45.2


