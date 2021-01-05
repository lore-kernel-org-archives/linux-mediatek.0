Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC2DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:33:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CBA4229C5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CBA4229C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lRjy8DUP+eWQlFMZ+f0q+6D3T0W2IJYcjoifycxNt/Y=; b=kHKGm263tYCCB8RR2K2GBfCmA
	mo2+qUEuIbvcmfwvpjRxj0EsIH46/Is0XCPJgbCW4y+c3mzTTVt/AMGSfPjAnSe5CRJ+EHjDua+vu
	/wWUieNwhxHpE3YIwAzEFCPSRTPgXXI1MffR5CvnyUzqKnMDm2gr3uP3DGmVj5z1aUDsfgzxCzVpA
	AmxiqhpmrjCaPb6OOKxJgoZWamQJ1y6HMi7AWt0pVPPJTu51n9XklzziiQ5P5t2/OZtWTvMW8cEr9
	D5Ji3q7u9DO6iOqkg57MLDI/V1r30bOwNG+e0jTGXPbxTGauwrvYsueS1rzsWPGuKH+wCxf4kcLhU
	w467nZtkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwkae-0006Wu-QR; Tue, 05 Jan 2021 11:33:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwkac-0006WL-Cf
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 11:33:27 +0000
X-UUID: 019a7650e53c482ba1b29ed69f36b166-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wobue7CbJUoRyQQ3SZKaw4p4O09wVEMuneUXlIARpf4=; 
 b=lpl5SDa+lpzU1bJbbWxn1o/RATWiNLXr8Q1+ddt8TsU0UfdHvvIOBP3RIBVAdBGV//8fi/t3LOoMuSFObgnaqDBXy0RD13lbJ7IEbOnOGlfcCBPFXoQatf5RfYTjqnoomrlhzy+OwUWXR19jDjvuuHUDGXDZgQ92dp6pFgXg+OQ=;
X-UUID: 019a7650e53c482ba1b29ed69f36b166-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1300716728; Tue, 05 Jan 2021 03:33:23 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 03:31:01 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 19:30:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 19:30:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 3/4] mt76: mt7915: add support for continuous tx in testmode
Date: Tue, 5 Jan 2021 19:30:44 +0800
Message-ID: <20210105113045.17815-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105113045.17815-1-shayne.chen@mediatek.com>
References: <20210105113045.17815-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 656A853E28B8217C3BC481A059B40F1062BAD2880BB524975C01556B7184E97A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_063326_568979_806809E6 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Implement continuous tx state for MT7915 NIC testmode.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   3 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 160 ++++++++++++++++--
 .../wireless/mediatek/mt76/mt7915/testmode.h  |  40 +++++
 4 files changed, 192 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 9f78e4ec14c9..abf8ba2308ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3208,7 +3208,8 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 #ifdef CONFIG_NL80211_TESTMODE
 	if (phy->mt76->test.tx_antenna_mask &&
 	    (phy->mt76->test.state == MT76_TM_STATE_TX_FRAMES ||
-	     phy->mt76->test.state == MT76_TM_STATE_RX_FRAMES)) {
+	     phy->mt76->test.state == MT76_TM_STATE_RX_FRAMES ||
+	     phy->mt76->test.state == MT76_TM_STATE_TX_CONT)) {
 		req.tx_streams_num = fls(phy->mt76->test.tx_antenna_mask);
 		req.rx_streams = phy->mt76->test.tx_antenna_mask;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 163b6f330e67..95ac3c418808 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -240,6 +240,7 @@ enum {
 
 enum {
 	MCU_EXT_CMD_EFUSE_ACCESS = 0x01,
+	MCU_EXT_CMD_RF_TEST = 0x04,
 	MCU_EXT_CMD_PM_STATE_CTRL = 0x07,
 	MCU_EXT_CMD_CHANNEL_SWITCH = 0x08,
 	MCU_EXT_CMD_FW_LOG_2_HOST = 0x13,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index e5af42c70e12..68b170308c4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -409,6 +409,16 @@ mt7915_tm_init(struct mt7915_phy *phy, bool en)
 	mt7915_mcu_add_bss_info(phy, phy->monitor_vif, en);
 }
 
+static void
+mt7915_tm_update_channel(struct mt7915_phy *phy)
+{
+	mutex_unlock(&phy->dev->mt76.mutex);
+	mt7915_set_channel(phy);
+	mutex_lock(&phy->dev->mt76.mutex);
+
+	mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+}
+
 static void
 mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 {
@@ -425,11 +435,7 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 	mt7915_tm_clean_hwq(phy, dev->mt76.global_wcid.idx);
 
 	if (en) {
-		mutex_unlock(&dev->mt76.mutex);
-		mt7915_set_channel(phy);
-		mutex_lock(&dev->mt76.mutex);
-
-		mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+		mt7915_tm_update_channel(phy);
 
 		if (td->tx_spe_idx) {
 			phy->test.spe_idx = td->tx_spe_idx;
@@ -469,15 +475,144 @@ static void
 mt7915_tm_set_rx_frames(struct mt7915_phy *phy, bool en)
 {
 	struct mt7915_dev *dev = phy->dev;
-	if (en) {
-		mutex_unlock(&dev->mt76.mutex);
-		mt7915_set_channel(phy);
-		mutex_lock(&dev->mt76.mutex);
+	if (en)
+		mt7915_tm_update_channel(phy);
+
+	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, en);
+}
+
+static int
+mt7915_tm_rf_switch_mode(struct mt7915_dev *dev, u32 oper)
+{
+	struct mt7915_tm_rf_test req = {
+		.op.op_mode = cpu_to_le32(oper),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_RF_TEST, &req,
+				 sizeof(req), true);
+}
+
+static int
+mt7915_tm_set_tx_cont(struct mt7915_phy *phy, bool en)
+{
+#define TX_CONT_START	0x05
+#define TX_CONT_STOP	0x06
+	struct mt7915_dev *dev = phy->dev;
+	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
+	int freq1 = ieee80211_frequency_to_channel(chandef->center_freq1);
+	struct mt76_testmode_data *td = &phy->mt76->test;
+	u32 func_idx = en ? TX_CONT_START : TX_CONT_STOP;
+	u8 rate_idx = td->tx_rate_idx, mode;
+	u16 rateval;
+	struct mt7915_tm_rf_test req = {
+		.action = 1,
+		.icap_len = 120,
+		.op.rf.func_idx = cpu_to_le32(func_idx),
+	};
+	struct tm_tx_cont *tx_cont = &req.op.rf.param.tx_cont;
+
+	tx_cont->control_ch = chandef->chan->hw_value;
+	tx_cont->center_ch = freq1;
+	tx_cont->tx_ant = td->tx_antenna_mask;
+	tx_cont->band = phy != &dev->phy;
+
+	switch (chandef->width) {
+	case NL80211_CHAN_WIDTH_40:
+		tx_cont->bw = CMD_CBW_40MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		tx_cont->bw = CMD_CBW_80MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+		tx_cont->bw = CMD_CBW_8080MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		tx_cont->bw = CMD_CBW_160MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+		tx_cont->bw = CMD_CBW_5MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_10:
+		tx_cont->bw = CMD_CBW_10MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_20:
+		tx_cont->bw = CMD_CBW_20MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_20_NOHT:
+		tx_cont->bw = CMD_CBW_20MHZ;
+		break;
+	default:
+		break;
+	}
 
-		mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+	if (!en) {
+		req.op.rf.param.func_data = cpu_to_le32(phy != &dev->phy);
+		goto out;
 	}
 
-	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, en);
+	if (td->tx_rate_mode <= MT76_TM_TX_MODE_OFDM) {
+		struct ieee80211_supported_band *sband;
+		u8 idx = rate_idx;
+
+		if (chandef->chan->band == NL80211_BAND_5GHZ)
+			sband = &phy->mt76->sband_5g.sband;
+		else
+			sband = &phy->mt76->sband_2g.sband;
+
+		if (td->tx_rate_mode == MT76_TM_TX_MODE_OFDM)
+			idx += 4;
+		rate_idx = sband->bitrates[idx].hw_value & 0xff;
+	}
+
+	switch (td->tx_rate_mode) {
+	case MT76_TM_TX_MODE_CCK:
+		mode = MT_PHY_TYPE_CCK;
+		break;
+	case MT76_TM_TX_MODE_OFDM:
+		mode = MT_PHY_TYPE_OFDM;
+		break;
+	case MT76_TM_TX_MODE_HT:
+		mode = MT_PHY_TYPE_HT;
+		break;
+	case MT76_TM_TX_MODE_VHT:
+		mode = MT_PHY_TYPE_VHT;
+		break;
+	case MT76_TM_TX_MODE_HE_SU:
+		mode = MT_PHY_TYPE_HE_SU;
+		break;
+	case MT76_TM_TX_MODE_HE_EXT_SU:
+		mode = MT_PHY_TYPE_HE_EXT_SU;
+		break;
+	case MT76_TM_TX_MODE_HE_TB:
+		mode = MT_PHY_TYPE_HE_TB;
+		break;
+	case MT76_TM_TX_MODE_HE_MU:
+		mode = MT_PHY_TYPE_HE_MU;
+		break;
+	default:
+		break;
+	}
+
+	rateval =  mode << 6 | rate_idx;
+	tx_cont->rateval = cpu_to_le16(rateval);
+
+out:
+	if (!en) {
+		int ret;
+
+		ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_RF_TEST, &req,
+					sizeof(req), true);
+		if (ret)
+			return ret;
+
+		return mt7915_tm_rf_switch_mode(dev, RF_OPER_NORMAL);
+	}
+
+	mt7915_tm_rf_switch_mode(dev, RF_OPER_RF_TEST);
+	mt7915_tm_update_channel(phy);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_RF_TEST, &req,
+				 sizeof(req), true);
 }
 
 static void
@@ -507,6 +642,9 @@ mt7915_tm_set_state(struct mt76_phy *mphy, enum mt76_testmode_state state)
 	else if (prev_state == MT76_TM_STATE_RX_FRAMES ||
 		 state == MT76_TM_STATE_RX_FRAMES)
 		mt7915_tm_set_rx_frames(phy, state == MT76_TM_STATE_RX_FRAMES);
+	else if (prev_state == MT76_TM_STATE_TX_CONT ||
+		 state == MT76_TM_STATE_TX_CONT)
+		mt7915_tm_set_tx_cont(phy, state == MT76_TM_STATE_TX_CONT);
 	else if (prev_state == MT76_TM_STATE_OFF ||
 		 state == MT76_TM_STATE_OFF)
 		mt7915_tm_init(phy, !(state == MT76_TM_STATE_OFF));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index da92cad0aa9b..8f8533ef9859 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -56,4 +56,44 @@ enum {
 	TM_MAC_RX_RXV,
 };
 
+struct tm_tx_cont {
+	u8 control_ch;
+	u8 center_ch;
+	u8 bw;
+	u8 tx_ant;
+	__le16 rateval;
+	u8 band;
+	u8 txfd_mode;
+};
+
+struct mt7915_tm_rf_test {
+	u8 action;
+	u8 icap_len;
+	u8 _rsv[2];
+	union {
+		__le32 op_mode;
+		__le32 freq;
+
+		struct {
+			__le32 func_idx;
+			union {
+				__le32 func_data;
+				__le32 cal_dump;
+
+				struct tm_tx_cont tx_cont;
+
+				u8 _pad[80];
+			} param;
+		} rf;
+	} op;
+} __packed;
+
+enum {
+	RF_OPER_NORMAL,
+	RF_OPER_RF_TEST,
+	RF_OPER_ICAP,
+	RF_OPER_ICAP_OVERLAP,
+	RF_OPER_WIFI_SPECTRUM,
+};
+
 #endif
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
