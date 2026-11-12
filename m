Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF864606A333
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZd6kB4/;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=mmCVp/oT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EcLA/w2OQOL14GNNI4mED34N0Nl9UhxPASiy9OkhVo0=; b=wZd6kB4/5AgxxsaKdbk11ZrfnJ
	vUCSNTAOqk/TqYFk6m8zs7ZTeR6wciSmzG//B+ST/JLPttfkq4h5Rciff4aND0auOnkazj1VFSj2/
	YMMmoxGJjR2TLaGgFzucXKjhjpRg9AxmRt5Fav7mTZ6ZOoTGOvwYW6UNnIRqcVPQsdNxGM+x7BmYJ
	4ZYOFzaPXIN2ojrzYhJPBcLa1JFBUgLj6eQafaaBZeXkH8lewSv52mGAdbL4MsfJ/sxq0m2I1oc9P
	EGV8/Tq42Ju04khPWAnfVB8QrYA2h485iqua6Q6cjaTbQI7WYOuw+hAxznrrgYq+HXtDJZ+nHb5OM
	xFRuDQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPfZ-00000008zod-2DT9;
	Thu, 12 Nov 2026 07:56:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPfR-00000008zjr-10W6
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 07:56:24 +0000
X-UUID: 8880b79ade6e11f1acbe4559397dec65-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EcLA/w2OQOL14GNNI4mED34N0Nl9UhxPASiy9OkhVo0=;
	b=mmCVp/oTHNRndmv6k9uvGjLIENot0IuYjvXD/XQFLiyFs7mNE3yig8tl8zQlO0T0uTZYOe4965AjO3PG6229+K/4yDKbJQrYIYsmcJi/EiLMCCzNMBOCRsQVLZJcMs9R6CAHadVf+zetODFEWCPZj6RZYxDGxupHgzoPqo8CM4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b8bfef24-960d-4473-bb0e-db00041fad76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:0a40a58d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8880b79ade6e11f1acbe4559397dec65-20261112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1802061548; Thu, 12 Nov 2026 00:56:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:56:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:56:11 +0800
From: Michael Shih <michael.shih@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.Lai@mediatek.com>, Michael Shih <michael.shih@mediatek.com>
Subject: [PATCH v5 2/2] wifi: mt76: mt7925: support per-channel survey dump during scan
Date: Thu, 12 Nov 2026 15:55:57 +0800
Message-ID: <20261112075558.1813785-3-michael.shih@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261112075558.1813785-1-michael.shih@mediatek.com>
References: <20260831032832.83338-1-eason.lai@mediatek.com>
 <20261112075558.1813785-1-michael.shih@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235621_351958_941C97AD 
X-CRM114-Status: GOOD (  24.36  )
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

Report per-channel survey airtime (active/busy/rx/tx) so that
"iw <dev> survey dump" shows non-zero airtime not only for the
connected home channel, but also for every channel visited during
a firmware-offloaded scan.

Two accounting paths are wired up:

(1) Home/operating channel (periodic mac_work):
    mt7925 is firmware/chanctx managed and never goes through
    __mt76_set_channel(), so phy->chan_state used to stay pinned to
    its init default and the periodic survey was charged to the wrong
    channel. mt7925_survey_switch_channel() is added and called from
    assign_vif_chanctx() to settle the old channel, re-point
    chan_state/chandef to the operating channel, and re-base the
    firmware MIB snapshot so active/busy/rx/tx keep accumulating on
    the channel actually dwelt on.

(2) Scanned channels (scan-done event):
    The scan-done CHNLINFO event now carries per-channel airtime
    (firmware Ch-Survey extension). mt7925_scan_update_survey() parses
    the per-channel array and folds the airtime deltas into each
    channel's mt76_channel_state. The firmware 6G channel id is
    converted back to the real channel number before lookup.

mt76_channel_state() is exported so the mt7925 module can map a
band/channel pair to its channel state.

Usage:
(1) Connect STA to AP and generate traffic:
      dhclient ${WLAN_IF} -v
      ping 192.168.0.XXX -i0.1

(2) (Optional) Trigger a scan to collect other channels:
      iw ${WLAN_IF} scan
    or use wpa_supplicant / wpa_cli scan.

(3) Dump the survey:
      iw ${WLAN_IF} survey dump

(4) You will see per-channel airtime, e.g.:
      Survey data from wls1
          frequency:            5240 MHz
          channel active time:  163258 ms
          channel busy time:    34076 ms
          channel receive time: 32084 ms
          channel transmit time: 253 ms
    - The connected/dwelt channel keeps increasing over time.
    - Channels visited during scan accumulate airtime each scan.

Signed-off-by: Michael Shih <michael.shih@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c |   3 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   2 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  12 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  30 ++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   7 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/stats.c | 301 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/stats.h |   6 +
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   6 +
 10 files changed, 367 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 08ed3fc6d386..11301428c5f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -991,7 +991,7 @@ bool mt76_has_tx_pending(struct mt76_phy *phy)
 }
 EXPORT_SYMBOL_GPL(mt76_has_tx_pending);
 
-static struct mt76_channel_state *
+struct mt76_channel_state *
 mt76_channel_state(struct mt76_phy *phy, struct ieee80211_channel *c)
 {
 	struct mt76_sband *msband;
@@ -1007,6 +1007,7 @@ mt76_channel_state(struct mt76_phy *phy, struct ieee80211_channel *c)
 	idx = c - &msband->sband.channels[0];
 	return &msband->chan[idx];
 }
+EXPORT_SYMBOL_GPL(mt76_channel_state);
 
 void mt76_update_survey_active_time(struct mt76_phy *phy, ktime_t time)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 477d33a0022d..f74c6a4b0f9c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1565,6 +1565,8 @@ void mt76_update_survey(struct mt76_phy *phy);
 void mt76_phy_chandef_set(struct mt76_phy *phy,
 			  struct cfg80211_chan_def *chandef);
 void mt76_update_survey_active_time(struct mt76_phy *phy, ktime_t time);
+struct mt76_channel_state *
+mt76_channel_state(struct mt76_phy *phy, struct ieee80211_channel *c);
 int mt76_get_survey(struct ieee80211_hw *hw, int idx,
 		    struct survey_info *survey);
 int mt76_rx_signal(u8 chain_mask, s8 *chain_signal);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ffbc6b954632..8e48ef0cb3e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1612,6 +1612,10 @@ void mt7925_scan_work(struct work_struct *work)
 
 				mt7925_regd_change(phy, evt->alpha2);
 
+				mt7925_scan_update_survey(phy, evt,
+							  le16_to_cpu(tlv->len) -
+							  sizeof(struct tlv));
+
 				break;
 			case UNI_EVENT_SCAN_DONE_NLO:
 				ieee80211_sched_scan_results(phy->mt76->hw);
@@ -2440,7 +2444,15 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	mconf->mt76.ctx = ctx;
 	mctx->bss_conf = mconf;
+
+	/* Re-target op-channel survey accounting to the operating channel just
+	 * assigned, so cc_active/airtime accrue on the channel we actually
+	 * dwell on (mt7925 never goes through __mt76_set_channel()).
+	 */
+	mt7925_survey_switch_channel(mvif->phy, ctx->def.chan);
+
 	mt76_phy_chandef_set(mvif->phy->mt76, &ctx->def);
+
 	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 11f9eac13ffc..2ed95b00e10f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -199,6 +199,36 @@ enum DMASHDL_GROUP_IDX {
 struct mt7925_mcu_scan_chinfo_event {
 	u8 nr_chan;
 	u8 alpha2[3];
+	/* Followed by nr_chan entries. The entry layout matches the firmware
+	 * UNI_EVENT_IE_CHNLINFO_T: a base part, optionally followed by the
+	 * Ch-Survey airtime extension (present when the firmware was built with
+	 * CONFIG_WIFI_RAM_CCN16_CHANNEL_SURVEY_STATS). Presence is detected at
+	 * runtime from the TLV length (see mt7925_scan_update_survey()).
+	 */
+	u8 chan_info[];
+} __packed;
+
+/* Base per-channel info (firmware SCAN_DONE_VERSION_SUPPORT_CU layout). */
+struct mt7925_mcu_scan_chinfo {
+	u8 channel_num;
+	u8 bcn_probe_cnt;
+	u8 mdrdy_cnt;
+	u8 util_val;
+	__le16 idle_time;
+	__le16 scan_time;	/* dwell time (ms) */
+} __packed;
+
+/* Ch-Survey extension appended after the base part
+ * (firmware SCAN_DONE_VERSION_SUPPORT_CH_SURVEY layout).
+ */
+struct mt7925_mcu_scan_chinfo_survey {
+	struct mt7925_mcu_scan_chinfo base;
+	u8 band;		/* 1=2G, 2=5G, 3=6G (firmware CMD_BAND_*) */
+	u8 rsv[3];
+	__le32 tx_time_us;
+	__le32 rx_time_us;	/* rx + obss */
+	__le32 busy_time_us;	/* tx + rx + obss + nonwifi */
+	__le32 active_time_us;	/* busy + idle = total */
 } __packed;
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 636efe038392..ac66c0a5daf6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -282,6 +282,13 @@ extern const struct ieee80211_ops mt7925_ops;
 int __mt7925_start(struct mt792x_phy *phy);
 int mt7925_register_device(struct mt792x_dev *dev);
 void mt7925_unregister_device(struct mt792x_dev *dev);
+void mt7925_update_channel(struct mt76_phy *mphy);
+void mt7925_survey_switch_channel(struct mt792x_phy *phy,
+				  struct ieee80211_channel *chan);
+struct mt7925_mcu_scan_chinfo_event;
+void mt7925_scan_update_survey(struct mt792x_phy *phy,
+			       struct mt7925_mcu_scan_chinfo_event *evt,
+			       int tlv_len);
 int mt7925_run_firmware(struct mt792x_dev *dev);
 int mt7925_mcu_set_bss_pm(struct mt792x_dev *dev,
 			  struct ieee80211_bss_conf *link_conf,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0d477dc1086c..939a46c0428b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -604,7 +604,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		.sta_add = mt7925_mac_sta_add,
 		.sta_event = mt7925_mac_sta_event,
 		.sta_remove = mt7925_mac_sta_remove,
-		.update_survey = mt792x_update_channel,
+		.update_survey = mt7925_update_channel,
 	};
 	static const struct mt792x_hif_ops mt7925_pcie_ops = {
 		.init_reset = mt7925e_init_reset,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/stats.c b/drivers/net/wireless/mediatek/mt76/mt7925/stats.c
index 9a47953062bc..5d2c9eb81fcd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/stats.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/stats.c
@@ -11,7 +11,7 @@
 #define MT7925_STA_STATS_VERSION 1
 #define MT7925_STA_STATS_VALID 1U
 
-#define MT7925_MIB_MAX_CNT			32
+#define MT7925_MIB_MAX_CNT			40
 #define MT7925_MIB_CNT_MAX_NUM		512  /* firmware UNI_CMD_MIB_CNT_MAX_NUM upper bound */
 
 #define MT7925_LQ_BAND_NUM	4			/* Link quality band */
@@ -519,6 +519,305 @@ int mt792x_mcu_get_wtbl_rate(struct mt792x_dev *dev, u16 wlan_idx,
 	return ret;
 }
 
+/* mt7925_mcu_get_chan_mib_info - refresh per-channel survey airtime from FW.
+ *
+ * Unlike mt7921 (which reads the MT_MIB_SDR* registers directly), MT7925/MT7935
+ * obtain channel airtime through the firmware GET_MIB_INFO query. The firmware
+ * reports *accumulated* counters (unit: microseconds), so we keep the previous
+ * snapshot in phy->state_ts and accumulate only the delta into chan_state,
+ * mirroring mt7996_mcu_get_chan_mib_info().
+ */
+int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy)
+{
+	enum {
+		IDX_TX_TIME,
+		IDX_RX_TIME,
+		IDX_OBSS_TIME,
+		IDX_NON_WIFI_TIME,
+		IDX_CHANNEL_IDLE,
+		IDX_NUM
+	};
+	static const u32 counters[IDX_NUM] = {
+		[IDX_TX_TIME]      = UNI_CMD_MIB_CNT_TX_DUR_CNT,
+		[IDX_RX_TIME]      = UNI_CMD_MIB_CNT_RX_DUR_CNT,
+		[IDX_OBSS_TIME]    = UNI_CMD_RMAC_CNT_OBSS_AIRTIME,
+		[IDX_NON_WIFI_TIME] = UNI_CMD_RMAC_CNT_NONWIFI_AIRTIME,
+		[IDX_CHANNEL_IDLE] = UNI_CMD_MIB_CNT_CHANNEL_IDLE,
+	};
+	struct mt76_channel_state *state = phy->mt76->chan_state;
+	struct mt76_channel_state *state_ts = &phy->state_ts;
+	u64 busy, active;
+	u64 val[IDX_NUM];
+	int ret;
+
+	ret = mt7925_mcu_get_mib_info(phy->dev, phy->mt76->band_idx,
+				      counters, IDX_NUM, val);
+	if (ret)
+		return ret;
+
+	/* FW counters are accumulated (us); add only the delta since the last
+	 * snapshot. busy = tx + rx + obss + nonwifi; active = busy + idle.
+	 *
+	 * active is sourced from the FW here (not the host clock) because
+	 * mt7925 runtime-suspends between activity: the host-side survey_time
+	 * accounting in mt76_update_survey_active_time() only advances while
+	 * the host is awake, which badly under-counts active and can make
+	 * active < busy. Deriving active from the FW busy/idle counters keeps
+	 * both in the same (firmware) clock domain, so busy <= active always
+	 * holds and the channel-utilisation ratio stays correct across PM
+	 * sleep. The host-clock contribution is neutralised in
+	 * mt7925_update_channel() by re-basing phy->survey_time to now.
+	 */
+	busy   = val[IDX_TX_TIME] + val[IDX_RX_TIME] +
+		 val[IDX_OBSS_TIME] + val[IDX_NON_WIFI_TIME];
+	active = busy + val[IDX_CHANNEL_IDLE];
+
+	state->cc_tx     += val[IDX_TX_TIME] - state_ts->cc_tx;
+	state->cc_bss_rx += val[IDX_RX_TIME] - state_ts->cc_bss_rx;
+	state->cc_rx     += val[IDX_RX_TIME] + val[IDX_OBSS_TIME] -
+			    state_ts->cc_rx;
+	state->cc_busy   += busy   - state_ts->cc_busy;
+	state->cc_active += active - state_ts->cc_active;
+
+	state_ts->cc_tx     = val[IDX_TX_TIME];
+	state_ts->cc_bss_rx = val[IDX_RX_TIME];
+	state_ts->cc_rx     = val[IDX_RX_TIME] + val[IDX_OBSS_TIME];
+	state_ts->cc_busy   = busy;
+	state_ts->cc_active = active;
+
+	return 0;
+}
+
+/* mt7925_update_channel - survey update_survey callback for MT7925/MT7935.
+ *
+ * Replaces mt792x_update_channel() (register-based) for chips that source
+ * channel airtime from the firmware MIB query.
+ */
+void mt7925_update_channel(struct mt76_phy *mphy)
+{
+	struct mt792x_dev *dev = container_of(mphy->dev, struct mt792x_dev,
+					      mt76);
+	struct mt792x_phy *phy = mphy->priv;
+
+	if (mt76_connac_pm_wake(mphy, &dev->pm))
+		goto out;
+
+	mt7925_mcu_get_chan_mib_info(phy);
+
+	mt76_connac_power_save_sched(mphy, &dev->pm);
+
+out:
+	/* cc_active is sourced from the FW busy/idle counters above, so
+	 * neutralise the host-clock contribution the framework is about to
+	 * add in mt76_update_survey_active_time(): re-base survey_time to now
+	 * so its delta is ~0. This must happen on every call (including the
+	 * pm_wake failure path) or the host clock would otherwise charge the
+	 * whole suspend/off-channel gap to cc_active.
+	 */
+	mphy->survey_time = ktime_get_boottime();
+}
+EXPORT_SYMBOL_GPL(mt7925_update_channel);
+
+/* mt7925_survey_switch_channel - re-target op-channel survey accounting.
+ *
+ * mt7925 is firmware/chanctx managed and never goes through
+ * __mt76_set_channel(), so phy->chan_state stays pinned to its init default
+ * and the periodic mac_work survey (both cc_active time and the FW-MIB airtime
+ * delta) is charged to the wrong channel. Call this when the operating channel
+ * is (re)assigned so that:
+ *   1) the airtime accrued so far is settled into the old channel;
+ *   2) chan_state/chandef are re-pointed to the new operating channel;
+ *   3) the FW-MIB snapshot (state_ts) is re-based to the current counters so
+ *      the first delta on the new channel is measured from now, not
+ *      underflowed.
+ */
+void mt7925_survey_switch_channel(struct mt792x_phy *phy,
+				  struct ieee80211_channel *chan)
+{
+	enum {
+		IDX_TX_TIME,
+		IDX_RX_TIME,
+		IDX_OBSS_TIME,
+		IDX_NON_WIFI_TIME,
+		IDX_CHANNEL_IDLE,
+		IDX_NUM
+	};
+	static const u32 counters[IDX_NUM] = {
+		[IDX_TX_TIME]       = UNI_CMD_MIB_CNT_TX_DUR_CNT,
+		[IDX_RX_TIME]       = UNI_CMD_MIB_CNT_RX_DUR_CNT,
+		[IDX_OBSS_TIME]     = UNI_CMD_RMAC_CNT_OBSS_AIRTIME,
+		[IDX_NON_WIFI_TIME] = UNI_CMD_RMAC_CNT_NONWIFI_AIRTIME,
+		[IDX_CHANNEL_IDLE]  = UNI_CMD_MIB_CNT_CHANNEL_IDLE,
+	};
+	struct mt76_phy *mphy = phy->mt76;
+	struct mt76_channel_state *state_ts = &phy->state_ts;
+	struct mt76_channel_state *new_state;
+	u64 val[IDX_NUM];
+
+	if (!chan)
+		return;
+
+	new_state = mt76_channel_state(mphy, chan);
+	if (new_state == mphy->chan_state)
+		return;	/* same channel, nothing to switch */
+
+	/* 1) settle the old channel with airtime accrued up to now */
+	if (mphy->chan_state)
+		mt76_update_survey(mphy);
+
+	/* 2) re-target accounting to the new operating channel */
+	mphy->chan_state = new_state;
+	mphy->chandef.chan = chan;
+
+	/* drop any stale airtime left on this channel from a previous session
+	 * so cc_active/cc_busy start fresh for this association (mt7925 never
+	 * clears per-channel state via __mt76_set_channel()).
+	 */
+	memset(new_state, 0, sizeof(*new_state));
+
+	/* 3) re-base the FW-MIB snapshot so the next delta starts from now.
+	 * active = busy + idle (see mt7925_mcu_get_chan_mib_info()).
+	 */
+	if (!mt7925_mcu_get_mib_info(phy->dev, mphy->band_idx,
+				     counters, IDX_NUM, val)) {
+		u64 busy = val[IDX_TX_TIME] + val[IDX_RX_TIME] +
+			   val[IDX_OBSS_TIME] + val[IDX_NON_WIFI_TIME];
+
+		state_ts->cc_tx     = val[IDX_TX_TIME];
+		state_ts->cc_bss_rx = val[IDX_RX_TIME];
+		state_ts->cc_rx     = val[IDX_RX_TIME] + val[IDX_OBSS_TIME];
+		state_ts->cc_busy   = busy;
+		state_ts->cc_active = busy + val[IDX_CHANNEL_IDLE];
+	}
+
+	/* reset the host-clock reference so the framework's
+	 * mt76_update_survey_active_time() does not charge the switch gap
+	 * to cc_active (which is now FW-sourced).
+	 */
+	mphy->survey_time = ktime_get_boottime();
+}
+EXPORT_SYMBOL_GPL(mt7925_survey_switch_channel);
+
+/* Map a firmware scan-done channel entry (band + channel number) back to the
+ * corresponding ieee80211_channel. The firmware band uses CMD_BAND_* encoding
+ * (1=2G, 2=5G, 3=6G).
+ *
+ * For 2G/5G, the reported number is the real channel number (== hw_value).
+ * For 6G, the firmware reports an internal channel id produced by
+ * rlmUtilGetChnlId(): chnl_id = ((real_ch - 1) >> 2) + CHNL_NUM_BASE_6G, where
+ * CHNL_NUM_BASE_6G is 181. We invert it back to the real 6G channel number
+ * (1, 5, 9, ... == hw_value) before looking it up.
+ */
+/* firmware CMD_BAND_* encoding used in scan-done per-channel entries */
+enum mt7925_fw_cmd_band {
+	MT7925_FW_CMD_BAND_2G = 1,
+	MT7925_FW_CMD_BAND_5G = 2,
+	MT7925_FW_CMD_BAND_6G = 3,
+};
+
+/* firmware rlmUtilGetChnlId() 6G base (CHNL_NUM_BASE_6G) */
+#define MT7925_FW_CHNL_NUM_BASE_6G	181
+
+/* invert rlmUtilGetChnlId() 6G encoding: chnl_id -> real 6G channel number */
+#define MT7925_FW_6G_CHNL_ID_TO_NUM(_id) \
+	((((_id) - MT7925_FW_CHNL_NUM_BASE_6G) << 2) + 1)
+
+static struct ieee80211_channel *
+mt7925_scan_survey_get_chan(struct mt76_phy *mphy, u8 fw_band, u8 chan_num)
+{
+	struct mt76_sband *msband;
+	int i;
+
+	switch (fw_band) {
+	case MT7925_FW_CMD_BAND_2G:
+		msband = &mphy->sband_2g;
+		break;
+	case MT7925_FW_CMD_BAND_5G:
+		msband = &mphy->sband_5g;
+		break;
+	case MT7925_FW_CMD_BAND_6G:
+		msband = &mphy->sband_6g;
+		if (chan_num >= MT7925_FW_CHNL_NUM_BASE_6G)
+			chan_num = MT7925_FW_6G_CHNL_ID_TO_NUM(chan_num);
+		break;
+	default:
+		return NULL;
+	}
+
+	for (i = 0; i < msband->sband.n_channels; i++) {
+		if (msband->sband.channels[i].hw_value == chan_num)
+			return &msband->sband.channels[i];
+	}
+
+	return NULL;
+}
+
+/* mt7925_scan_update_survey - fold per-channel scan airtime into survey state.
+ *
+ * The scan-done CHNLINFO event carries a per-channel array. When the firmware
+ * is built with the Ch-Survey extension, each entry also reports the airtime
+ * (tx/rx/busy/active, unit: us) accumulated while scanning that channel. We
+ * accumulate those deltas into each channel's mt76_channel_state so that
+ * "iw survey dump" shows non-zero airtime for scanned channels, not only the
+ * connected home channel.
+ *
+ * @tlv_len is the total CHNLINFO TLV payload length (after the tlv header),
+ * used to (a) detect whether the airtime extension is present from the entry
+ * stride and (b) bound the array walk safely.
+ */
+void mt7925_scan_update_survey(struct mt792x_phy *phy,
+			       struct mt7925_mcu_scan_chinfo_event *evt,
+			       int tlv_len)
+{
+	struct mt76_phy *mphy = phy->mt76;
+	struct mt76_dev *dev = mphy->dev;
+	size_t hdr_len = sizeof(*evt);
+	size_t stride, avail;
+	const u8 *p;
+	int i;
+
+	if (tlv_len <= (int)hdr_len || !evt->nr_chan)
+		return;
+
+	avail = (size_t)tlv_len - hdr_len;
+
+	/* The airtime extension is only present when each entry is at least as
+	 * large as the extended layout. Older firmware sends only the base
+	 * entry and thus reports no airtime; nothing to accumulate then.
+	 */
+	stride = avail / evt->nr_chan;
+	if (stride < sizeof(struct mt7925_mcu_scan_chinfo_survey))
+		return;
+
+	p = evt->chan_info;
+
+	spin_lock_bh(&dev->cc_lock);
+	for (i = 0; i < evt->nr_chan; i++, p += stride) {
+		const struct mt7925_mcu_scan_chinfo_survey *ci;
+		struct ieee80211_channel *chan;
+		struct mt76_channel_state *state;
+
+		ci = (const void *)p;
+
+		/* ensure the full extended entry is within the payload */
+		if ((size_t)((i + 1) * stride) > avail)
+			break;
+
+		chan = mt7925_scan_survey_get_chan(mphy, ci->band,
+						   ci->base.channel_num);
+		if (!chan)
+			continue;
+
+		state = mt76_channel_state(mphy, chan);
+		state->cc_tx     += le32_to_cpu(ci->tx_time_us);
+		state->cc_rx     += le32_to_cpu(ci->rx_time_us);
+		state->cc_busy   += le32_to_cpu(ci->busy_time_us);
+		state->cc_active += le32_to_cpu(ci->active_time_us);
+	}
+	spin_unlock_bh(&dev->cc_lock);
+}
+EXPORT_SYMBOL_GPL(mt7925_scan_update_survey);
+
 /**
  * mt7925_mcu_get_link_quality - query RSSI and TX link speed for a band
  * @dev:	device
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/stats.h b/drivers/net/wireless/mediatek/mt76/mt7925/stats.h
index a70b9eb3aa80..a4cb8c4453ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/stats.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/stats.h
@@ -291,6 +291,12 @@ int mt7925_mcu_get_mib_info(struct mt792x_dev *dev, u8 band_idx,
 			    const u32 *counters, u8 counter_num,
 			    u64 *values);
 
+/* Refresh per-channel survey airtime (TX/RX/OBSS/non-wifi) from the firmware
+ * MIB query and accumulate the delta into chan_state. Used by the MT7925/MT7935
+ * update_survey callback.
+ */
+int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy);
+
 /* GET_STAT_INFO (UNI_CMD_ID_GET_STATISTICS = 0x23),
  * sub-command UNI_CMD_GET_STATISTICS_TAG_LINK_QUALITY = 1.
  *
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index f97f787b2198..2d3bf035fdfc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -174,7 +174,7 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 		.sta_add = mt7925_mac_sta_add,
 		.sta_event = mt7925_mac_sta_event,
 		.sta_remove = mt7925_mac_sta_remove,
-		.update_survey = mt792x_update_channel,
+		.update_survey = mt7925_update_channel,
 	};
 	static const struct mt792x_hif_ops hif_ops = {
 		.mcu_init = mt7925u_mcu_init,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index a7d71e007da0..2c7170c6a99e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -222,6 +222,12 @@ struct mt792x_phy {
 
 	struct mt76_mib_stats mib;
 
+	/* survey: firmware reports accumulated airtime counters; keep the
+	 * previous snapshot so mt7925_mcu_get_chan_mib_info() can accumulate
+	 * deltas into chan_state (mirror mt7996 phy->state_ts).
+	 */
+	struct mt76_channel_state state_ts;
+
 	u8 sta_work_count;
 	u8 clc_chan_conf;
 	enum mt792x_reg_power_type power_type;
-- 
2.45.2


