Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33C3C3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8oVfLaW56c/kNrNce8+es3cYvqc2J6QaPeCdRq6UxJs=; b=Ym97LmwmloE/3EhWSDC2BPJNeQ
	Qstw0OeSfaiJOS24zZyAMARCTCQGpGnrVA5x5eUJR61Qca34tzrplF4qM2j8AS1pY7EzMSAOm2ZYh
	I9aU7lIHCcWZ7aufEorLB3klPOMtXXjEPy3msmoNzceQqxsdAng1xSCqi4NC8RJMWp0p/bFvkoqFL
	hiUboczIcEOUUd0HuhnEBc725iM30vRZFwT6HW1ntk7G85n0TFaoPHlDExVAeU3HXe0/G7CyAEvdY
	o8SNzUx72JuhOtLYOsM82kHMYTlWsEkqBH0RyVeWRHUYDwCbqZ1nRW+ufU+PxZTAOA73wjzwiGJMD
	SYVj6CtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHiKh-00DaZA-Lk; Tue, 17 Jan 2023 09:32:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHiKg-00DaYK-K9
	for linux-mediatek@bombadil.infradead.org; Tue, 17 Jan 2023 09:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8oVfLaW56c/kNrNce8+es3cYvqc2J6QaPeCdRq6UxJs=; b=qDwpSJRizQCKvlqvusUXsei+uL
	eOcY7IbPpkFP/CNwkJaxBlD8J4dBuQ1wjd6gxJMQPbz1S6kkoB/GCdR9+q2w5PmqgsSpZj001u+BZ
	/yBjV64GfLe21c7B9VmCk0ZBVB808zWonw5UZLYp/CH3BHh2hRxg7nu4t+Cxishz3gC+6lu3t3d0x
	bqokn3AEFLo8A1g0J36UZJrAKy4c90gNdY9OgtlEA1GPYei2i8OdRMrFbQSZkh3nUBWT5qNwsNYy9
	mfaO/WAf06fZoWEve+o0dBBQASk+XofRtwJ084c55gY7NJMSbMZPDVK6LHttpf1/hw32M6cp2TS6D
	oVFih0sA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHiKP-005t5n-2L
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jan 2023 09:32:30 +0000
X-UUID: d0b1f84c964911edbbe3f76fe852e059-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8oVfLaW56c/kNrNce8+es3cYvqc2J6QaPeCdRq6UxJs=;
	b=IxMI8gT0e8z7+P6lur2X4AXS4XgtyW6DDsEepLgyj6Gs6SNsPfNA261gIfvLbhLTdzj8mxE2YV/pNAxd1DklsvnILTXq9kfqztmD81bzPLmN4xhJ3Nfz5GQlrsh7GIB23g+xocIrOmtytaE0iuCp0+W1lFxVHJ8YC7f0K21Erck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:46c263d6-b9ad-4beb-8a5b-a4c1dd2492fb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:19dd0df6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: d0b1f84c964911edbbe3f76fe852e059-20230117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 318099195; Tue, 17 Jan 2023 02:32:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 17 Jan 2023 17:31:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Jan 2023 17:31:32 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Neil Chen <yn.chen@mediatek.com>,
	"Deren Wu" <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix rx filter incorrect by drv/fw inconsistent
Date: Tue, 17 Jan 2023 17:30:59 +0800
Message-ID: <b9ebeda5d445f66fceb17c48c8251093dfe94c57.1673947063.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_093226_632646_15037AAD 
X-CRM114-Status: GOOD (  16.38  )
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

From: Neil Chen <yn.chen@mediatek.com>

The rx filter, in mt7921 series, may be changed in fw operation. There is
a racing problem if rx filter controlled by both driver and firmware at
the same time. To avoid this issue, let mt7921 driver set rx filter by new
command MCU_CE_CMD_SET_RX_FILTER and allow the firmware controlling it
only.

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Neil Chen <yn.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  2 -
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 48 ++-----------------
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 36 +++++++++++++-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
 .../wireless/mediatek/mt76/mt7921/testmode.c  |  1 -
 6 files changed, 40 insertions(+), 50 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index f1e942b9a887..1baea5d5bdb1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1238,6 +1238,7 @@ enum {
 	MCU_CE_CMD_TEST_CTRL = 0x01,
 	MCU_CE_CMD_START_HW_SCAN = 0x03,
 	MCU_CE_CMD_SET_PS_PROFILE = 0x05,
+	MCU_CE_CMD_SET_RX_FILTER = 0x0a,
 	MCU_CE_CMD_SET_CHAN_DOMAIN = 0x0f,
 	MCU_CE_CMD_SET_BSS_CONNECTED = 0x16,
 	MCU_CE_CMD_SET_BSS_ABORT = 0x17,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index d4b681d7e1d2..4b935867c2b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -229,8 +229,6 @@ int mt7921_mac_init(struct mt7921_dev *dev)
 	for (i = 0; i < 2; i++)
 		mt7921_mac_init_band(dev, i);
 
-	dev->mt76.rxfilter = mt76_rr(dev, MT_WF_RFCR(0));
-
 	return mt76_connac_mcu_set_rts_thresh(&dev->mt76, 0x92b, 0);
 }
 EXPORT_SYMBOL_GPL(mt7921_mac_init);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 76ac5069638f..df7bd84b28d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -681,7 +681,6 @@ static int mt7921_config(struct ieee80211_hw *hw, u32 changed)
 		ieee80211_iterate_active_interfaces(hw,
 						    IEEE80211_IFACE_ITER_RESUME_ALL,
 						    mt7921_sniffer_interface_iter, dev);
-		dev->mt76.rxfilter = mt76_rr(dev, MT_WF_RFCR(0));
 	}
 
 out:
@@ -710,53 +709,12 @@ static void mt7921_configure_filter(struct ieee80211_hw *hw,
 				    u64 multicast)
 {
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
-	u32 ctl_flags = MT_WF_RFCR1_DROP_ACK |
-			MT_WF_RFCR1_DROP_BF_POLL |
-			MT_WF_RFCR1_DROP_BA |
-			MT_WF_RFCR1_DROP_CFEND |
-			MT_WF_RFCR1_DROP_CFACK;
-	u32 flags = 0;
-
-#define MT76_FILTER(_flag, _hw) do {					\
-		flags |= *total_flags & FIF_##_flag;			\
-		dev->mt76.rxfilter &= ~(_hw);				\
-		dev->mt76.rxfilter |= !(flags & FIF_##_flag) * (_hw);	\
-	} while (0)
 
 	mt7921_mutex_acquire(dev);
-
-	dev->mt76.rxfilter &= ~(MT_WF_RFCR_DROP_OTHER_BSS |
-				MT_WF_RFCR_DROP_OTHER_BEACON |
-				MT_WF_RFCR_DROP_FRAME_REPORT |
-				MT_WF_RFCR_DROP_PROBEREQ |
-				MT_WF_RFCR_DROP_MCAST_FILTERED |
-				MT_WF_RFCR_DROP_MCAST |
-				MT_WF_RFCR_DROP_BCAST |
-				MT_WF_RFCR_DROP_DUPLICATE |
-				MT_WF_RFCR_DROP_A2_BSSID |
-				MT_WF_RFCR_DROP_UNWANTED_CTL |
-				MT_WF_RFCR_DROP_STBC_MULTI);
-
-	MT76_FILTER(OTHER_BSS, MT_WF_RFCR_DROP_OTHER_TIM |
-			       MT_WF_RFCR_DROP_A3_MAC |
-			       MT_WF_RFCR_DROP_A3_BSSID);
-
-	MT76_FILTER(FCSFAIL, MT_WF_RFCR_DROP_FCSFAIL);
-
-	MT76_FILTER(CONTROL, MT_WF_RFCR_DROP_CTS |
-			     MT_WF_RFCR_DROP_RTS |
-			     MT_WF_RFCR_DROP_CTL_RSV |
-			     MT_WF_RFCR_DROP_NDPA);
-
-	*total_flags = flags;
-	mt76_wr(dev, MT_WF_RFCR(0), dev->mt76.rxfilter);
-
-	if (*total_flags & FIF_CONTROL)
-		mt76_clear(dev, MT_WF_RFCR1(0), ctl_flags);
-	else
-		mt76_set(dev, MT_WF_RFCR1(0), ctl_flags);
-
+	mt7921_mcu_set_rxfilter(dev, *total_flags, 0, 0);
 	mt7921_mutex_release(dev);
+
+	*total_flags &= (FIF_OTHER_BSS | FIF_FCSFAIL | FIF_CONTROL);
 }
 
 static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 8930b5a4467c..8aeb030fb763 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1019,6 +1019,8 @@ int mt7921_mcu_set_beacon_filter(struct mt7921_dev *dev,
 				 struct ieee80211_vif *vif,
 				 bool enable)
 {
+#define MT7921_FIF_BIT_CLR		BIT(1)
+#define MT7921_FIF_BIT_SET		BIT(0)
 	int err;
 
 	if (enable) {
@@ -1026,7 +1028,11 @@ int mt7921_mcu_set_beacon_filter(struct mt7921_dev *dev,
 		if (err)
 			return err;
 
-		mt76_set(dev, MT_WF_RFCR(0), MT_WF_RFCR_DROP_OTHER_BEACON);
+		err = mt7921_mcu_set_rxfilter(dev, 0,
+					      MT7921_FIF_BIT_SET,
+					      MT_WF_RFCR_DROP_OTHER_BEACON);
+		if (err)
+			return err;
 
 		return 0;
 	}
@@ -1035,7 +1041,11 @@ int mt7921_mcu_set_beacon_filter(struct mt7921_dev *dev,
 	if (err)
 		return err;
 
-	mt76_clear(dev, MT_WF_RFCR(0), MT_WF_RFCR_DROP_OTHER_BEACON);
+	err = mt7921_mcu_set_rxfilter(dev, 0,
+				      MT7921_FIF_BIT_CLR,
+				      MT_WF_RFCR_DROP_OTHER_BEACON);
+	if (err)
+		return err;
 
 	return 0;
 }
@@ -1255,3 +1265,25 @@ int mt7921_mcu_set_clc(struct mt7921_dev *dev, u8 *alpha2,
 	}
 	return 0;
 }
+
+int mt7921_mcu_set_rxfilter(struct mt7921_dev *dev, u32 fif,
+			    u8 bit_op, u32 bit_map)
+{
+	struct {
+		u8 rsv[4];
+		u8 mode;
+		u8 rsv2[3];
+		__le32 fif;
+		__le32 bit_map; /* bit_* for bitmap update */
+		u8 bit_op;
+		u8 pad[51];
+	} __packed data = {
+		.mode = fif ? 1 : 2,
+		.fif = cpu_to_le32(fif),
+		.bit_map = cpu_to_le32(bit_map),
+		.bit_op = bit_op,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_CE_CMD(SET_RX_FILTER),
+				 &data, sizeof(data), false);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index efff4d43d796..248a4bc30955 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -383,6 +383,8 @@ int mt7921_mcu_get_rx_rate(struct mt7921_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7921_mcu_fw_log_2_host(struct mt7921_dev *dev, u8 ctrl);
 void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb);
+int mt7921_mcu_set_rxfilter(struct mt7921_dev *dev, u32 fif,
+			    u8 bit_op, u32 bit_map);
 
 static inline void mt7921_irq_enable(struct mt7921_dev *dev, u32 mask)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
index bdec8684ce94..7f408212e716 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
@@ -59,7 +59,6 @@ mt7921_tm_set(struct mt7921_dev *dev, struct mt7921_tm_cmd *req)
 		cancel_work_sync(&pm->wake_work);
 		__mt7921_mcu_drv_pmctrl(dev);
 
-		mt76_wr(dev, MT_WF_RFCR(0), dev->mt76.rxfilter);
 		phy->test.state = MT76_TM_STATE_ON;
 	}
 
-- 
2.18.0


