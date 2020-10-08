Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEBEC43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:33:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F9D2145D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdzDqbDV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z8wyqZQK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F9D2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qGTa0mv5nibVF+FeKS1ljZ8T5/XvWAQEHZM+HVzjP8s=; b=tdzDqbDV9R2Xi6IQfZ6Psj/Kt
	d3Ez5h1TEUKTxcQQK03d2yjLfzrUgigs0j8B/wtOZnwH5lgoFxhIdo3lAKcdSkegvv1haAvlmlaHc
	aLSAolVo/TN5fjAl+7Rqgh3/AcMdTkO/qYd5p5RRj0+pEtCYXGiTRkhLnqlXmce/qy9kH/AQ62WW9
	nV9pDvV1oWl4FY9AMKD+f8QX/6NoTOV9zta6Dqd75cFKSPn6psiDhhd8sEcnxg+MLA078yTes4CCv
	7LlXxdWFU1F8UMWx6DXkBPDGm3dqdZi8Y2jKWNUF49YHSKQkW4ZgdCKWPUFkdqw+hthgGhYZlBCGK
	mJFCua/jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQUB6-0003Zj-QM; Thu, 08 Oct 2020 11:33:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQUAx-0003SJ-2u
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 11:33:39 +0000
X-UUID: 66c300d6b18340d4a327ad628331cbb3-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UisLcbrPlbx7LpeQVyT9OpVv91AaDRogMFoMs4nSJE8=; 
 b=Z8wyqZQKE01XtQnsUbtXc7DnuglyUS94Rm82fYW6G5uTKGEdmQhhXBtGCfutIEfuoVvfFqcgAv0lpUEy7cCJjF8e7qDPCpR1ymTR9/q5z+hXM0AZemhFJIExRcZO7cFIxN259fXWq9e+DGuVLDuFUv2tDNM49G89+ThRUXWgLOw=;
X-UUID: 66c300d6b18340d4a327ad628331cbb3-20201008
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2000530498; Thu, 08 Oct 2020 03:33:30 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 04:33:28 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 19:33:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 8 Oct 2020 19:33:14 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 07/10] mt76: mt7915: implement testmode tx support
Date: Thu, 8 Oct 2020 19:29:01 +0800
Message-ID: <20201008112904.10620-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201008112904.10620-1-shayne.chen@mediatek.com>
References: <20201008112904.10620-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F86A9544CE129FA3C8FF62FCBD9768F316A3B92F4206C69458FC30572727BC6C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_073335_355769_E27B94D9 
X-CRM114-Status: GOOD (  18.89  )
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

Support testmode tx for MT7915A, including tx streams and HE rate
settings.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/Makefile    |   2 +
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 127 ++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  40 +++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  31 +++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   5 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  14 ++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  31 +++
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 180 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/testmode.h  |  34 ++++
 10 files changed, 462 insertions(+), 6 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/testmode.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/Makefile b/drivers/net/wireless/mediatek/mt76/mt7915/Makefile
index 57fe726..cc2054d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_MT7915E) += mt7915e.o
 
 mt7915e-y := pci.o init.o dma.o eeprom.o main.o mcu.o mac.o \
 	     debugfs.o
+
+mt7915e-$(CONFIG_NL80211_TESTMODE) += testmode.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index ee69fe4..390b328 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -695,6 +695,10 @@ int mt7915_register_device(struct mt7915_dev *dev)
 	mt7915_cap_dbdc_disable(dev);
 	dev->phy.dfs_state = -1;
 
+#ifdef CONFIG_NL80211_TESTMODE
+	dev->mt76.test_ops = &mt7915_testmode_ops;
+#endif
+
 	ret = mt76_register_device(&dev->mt76, true, mt7915_rates,
 				   ARRAY_SIZE(mt7915_rates));
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index a7118df..e03e12f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -562,6 +562,118 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	return 0;
 }
 
+static u16
+mt7915_mac_tx_rate_val(struct mt76_phy *mphy, u8 mode, u8 rate_idx,
+		       u8 nss, u8 stbc, u8 *bw)
+{
+	u16 rateval;
+
+	switch (mphy->chandef.width) {
+	case NL80211_CHAN_WIDTH_40:
+		*bw = 1;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		*bw = 2;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+	case NL80211_CHAN_WIDTH_160:
+		*bw = 3;
+		break;
+	default:
+		*bw = 0;
+		break;
+	}
+
+	if (mode == MT_PHY_TYPE_HT || mode == MT_PHY_TYPE_HT_GF)
+		nss = 1 + (rate_idx >> 3);
+
+	rateval = FIELD_PREP(MT_TX_RATE_IDX, rate_idx) |
+		  FIELD_PREP(MT_TX_RATE_MODE, mode) |
+		  FIELD_PREP(MT_TX_RATE_NSS, nss - 1);
+
+	if (stbc && nss == 1) {
+		nss++;
+		rateval |= MT_TX_RATE_STBC;
+	}
+
+	return rateval;
+}
+
+static void
+mt7915_mac_write_txwi_tm(struct mt7915_dev *dev, struct mt76_phy *mphy,
+			 __le32 *txwi, struct sk_buff *skb)
+{
+#ifdef CONFIG_NL80211_TESTMODE
+	struct mt76_testmode_data *td = &dev->mt76.test;
+	u8 bw, mode;
+	u16 rateval;
+	u32 val;
+
+	if (skb != dev->mt76.test.tx_skb)
+		return;
+
+	switch (td->tx_rate_mode) {
+	case MT76_TM_TX_MODE_CCK:
+		mode = MT_PHY_TYPE_CCK;
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
+	case MT76_TM_TX_MODE_OFDM:
+	default:
+		mode = MT_PHY_TYPE_OFDM;
+		break;
+	}
+
+	rateval = mt7915_mac_tx_rate_val(mphy, mode, td->tx_rate_idx,
+					 td->tx_rate_nss, td->tx_rate_stbc, &bw);
+
+	txwi[2] |= cpu_to_le32(MT_TXD2_FIX_RATE);
+	if (td->tx_rate_mode < MT76_TM_TX_MODE_HT)
+		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
+
+	val = MT_TXD6_FIXED_BW |
+	      FIELD_PREP(MT_TXD6_BW, bw) |
+	      FIELD_PREP(MT_TXD6_TX_RATE, rateval) |
+	      FIELD_PREP(MT_TXD6_SGI, td->tx_rate_sgi);
+
+	/* for HE_SU/HE_EXT_SU PPDU
+	 * - 1x, 2x, 4x LTF + 0.8us GI
+	 * - 2x LTF + 1.6us GI, 4x LTF + 3.2us GI
+	 * for HE_MU PPDU
+	 * - 2x, 4x LTF + 0.8us GI
+	 * - 2x LTF + 1.6us GI, 4x LTF + 3.2us GI
+	 * for HE_TB PPDU
+	 * - 1x, 2x LTF + 1.6us GI
+	 * - 4x LTF + 3.2us GI
+	 */
+	if (mode >= MT_PHY_TYPE_HE_SU)
+		val |= FIELD_PREP(MT_TXD6_HELTF, td->tx_ltf);
+
+	if (td->tx_rate_ldpc)
+		val |= MT_TXD6_LDPC;
+
+	txwi[6] |= cpu_to_le32(val);
+	txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX,
+					  dev->test.spe_idx));
+#endif
+}
+
 static void
 mt7915_mac_write_txwi_8023(struct mt7915_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid)
@@ -761,6 +873,9 @@ void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 		txwi[6] |= cpu_to_le32(val);
 		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
 	}
+
+	if (mt76_testmode_enabled(&dev->mt76))
+		mt7915_mac_write_txwi_tm(dev, mphy, txwi, skb);
 }
 
 int mt7915_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
@@ -881,6 +996,18 @@ mt7915_tx_complete_status(struct mt76_dev *mdev, struct sk_buff *skb,
 
 	hw = mt76_tx_status_get_hw(mdev, skb);
 
+#ifdef CONFIG_NL80211_TESTMODE
+	if (skb == mdev->test.tx_skb) {
+		struct mt7915_phy *phy = mt7915_hw_phy(hw);
+		struct ieee80211_vif *vif = phy->monitor_vif;
+		struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+
+		mt76_tx_complete_skb(mdev, mvif->sta.wcid.idx, skb);
+
+		return;
+	}
+#endif
+
 	if (info->flags & IEEE80211_TX_CTL_AMPDU)
 		info->flags |= IEEE80211_TX_STAT_AMPDU;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 1262fb3..9ebe5af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -44,13 +44,14 @@ static int mt7915_start(struct ieee80211_hw *hw)
 		mt7915_mac_enable_nf(dev, 1);
 	}
 
-	mt7915_mcu_set_sku_en(phy, true);
+	mt7915_mcu_set_sku_en(phy, !mt76_testmode_enabled(&dev->mt76));
 	mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
-	ieee80211_queue_delayed_work(hw, &phy->mac_work,
-				     MT7915_WATCHDOG_TIME);
+	if (!mt76_testmode_enabled(&dev->mt76))
+		ieee80211_queue_delayed_work(hw, &phy->mac_work,
+					     MT7915_WATCHDOG_TIME);
 
 	if (!running)
 		mt7915_mac_reset_counters(phy);
@@ -69,6 +70,8 @@ static void mt7915_stop(struct ieee80211_hw *hw)
 
 	mutex_lock(&dev->mt76.mutex);
 
+	mt76_testmode_reset(&dev->mt76, true);
+
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
 	if (phy != &dev->phy) {
@@ -150,6 +153,12 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&dev->mt76.mutex);
 
+	mt76_testmode_reset(&dev->mt76, true);
+
+	if (vif->type == NL80211_IFTYPE_MONITOR &&
+	    is_zero_ether_addr(vif->addr))
+		phy->monitor_vif = vif;
+
 	mvif->idx = ffs(~phy->mt76->vif_mask) - 1;
 	if (mvif->idx >= MT7915_MAX_INTERFACES) {
 		ret = -ENOSPC;
@@ -218,6 +227,13 @@ static void mt7915_remove_interface(struct ieee80211_hw *hw,
 
 	/* TODO: disable beacon for the bss */
 
+	mutex_lock(&dev->mt76.mutex);
+	mt76_testmode_reset(&dev->mt76, true);
+	mutex_unlock(&dev->mt76.mutex);
+
+	if (vif == phy->monitor_vif)
+		phy->monitor_vif = NULL;
+
 	mt7915_mcu_add_dev_info(phy, vif, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
@@ -252,7 +268,7 @@ static void mt7915_init_dfs_state(struct mt7915_phy *phy)
 	phy->dfs_state = -1;
 }
 
-static int mt7915_set_channel(struct mt7915_phy *phy)
+int mt7915_set_channel(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	int ret;
@@ -281,8 +297,10 @@ out:
 	mutex_unlock(&dev->mt76.mutex);
 
 	mt76_txq_schedule_all(phy->mt76);
-	ieee80211_queue_delayed_work(phy->mt76->hw, &phy->mac_work,
-				     MT7915_WATCHDOG_TIME);
+
+	if (!mt76_testmode_enabled(&dev->mt76))
+		ieee80211_queue_delayed_work(phy->mt76->hw, &phy->mac_work,
+					     MT7915_WATCHDOG_TIME);
 
 	return ret;
 }
@@ -346,6 +364,13 @@ static int mt7915_config(struct ieee80211_hw *hw, u32 changed)
 	int ret;
 
 	if (changed & IEEE80211_CONF_CHANGE_CHANNEL) {
+#ifdef CONFIG_NL80211_TESTMODE
+		if (dev->mt76.test.state != MT76_TM_STATE_OFF) {
+			mutex_lock(&dev->mt76.mutex);
+			mt76_testmode_reset(&dev->mt76, false);
+			mutex_unlock(&dev->mt76.mutex);
+		}
+#endif
 		ieee80211_stop_queues(hw);
 		ret = mt7915_set_channel(phy);
 		if (ret)
@@ -370,6 +395,7 @@ static int mt7915_config(struct ieee80211_hw *hw, u32 changed)
 			phy->rxfilter &= ~MT_WF_RFCR_DROP_OTHER_UC;
 
 		mt76_rmw_field(dev, MT_DMA_DCR0, MT_DMA_DCR0_RXD_G5_EN, enabled);
+		mt76_testmode_reset(&dev->mt76, true);
 		mt76_wr(dev, MT_WF_RFCR(band), phy->rxfilter);
 	}
 
@@ -887,6 +913,8 @@ const struct ieee80211_ops mt7915_ops = {
 	.set_coverage_class = mt7915_set_coverage_class,
 	.sta_statistics = mt7915_sta_statistics,
 	.sta_set_4addr = mt7915_sta_set_4addr,
+	CFG80211_TESTMODE_CMD(mt76_testmode_cmd)
+	CFG80211_TESTMODE_DUMP(mt76_testmode_dump)
 #ifdef CONFIG_MAC80211_DEBUGFS
 	.sta_add_debugfs = mt7915_sta_add_debugfs,
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5ccde54..372f45b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3186,6 +3186,15 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 		.channel_band = chandef->chan->band,
 	};
 
+#ifdef CONFIG_NL80211_TESTMODE
+	if (dev->mt76.test.tx_antenna_mask &&
+	    (dev->mt76.test.state == MT76_TM_STATE_TX_FRAMES ||
+	     dev->mt76.test.state == MT76_TM_STATE_RX_FRAMES)) {
+		req.tx_streams_num = fls(dev->mt76.test.tx_antenna_mask);
+		req.rx_streams = dev->mt76.test.tx_antenna_mask;
+	}
+#endif
+
 	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if ((chandef->chan->flags & IEEE80211_CHAN_RADAR) &&
@@ -3330,6 +3339,28 @@ int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
 				 sizeof(req), true);
 }
 
+int mt7915_mcu_set_test_param(struct mt7915_dev *dev, u8 param, bool test_mode,
+			      u8 en)
+{
+	struct {
+		u8 test_mode_en;
+		u8 param_idx;
+		u8 _rsv[2];
+
+		u8 enable;
+		u8 _rsv2[3];
+
+		u8 pad[8];
+	} __packed req = {
+		.test_mode_en = test_mode,
+		.param_idx = param,
+		.enable = en,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_ATE_CTRL, &req,
+				 sizeof(req), false);
+}
+
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable)
 {
 	struct mt7915_dev *dev = phy->dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 5f23f27..0a7e9d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -46,6 +46,10 @@ enum {
 	MCU_EXT_EVENT_RATE_REPORT = 0x87,
 };
 
+enum {
+	MCU_ATE_SET_TRX = 0x1,
+};
+
 struct mt7915_mcu_rxd {
 	__le32 rxd[6];
 
@@ -216,6 +220,7 @@ enum {
 	MCU_EXT_CMD_WTBL_UPDATE = 0x32,
 	MCU_EXT_CMD_SET_DRR_CTRL = 0x36,
 	MCU_EXT_CMD_SET_RDD_CTRL = 0x3a,
+	MCU_EXT_CMD_ATE_CTRL = 0x3d,
 	MCU_EXT_CMD_PROTECT_CTRL = 0x3e,
 	MCU_EXT_CMD_MAC_INIT_CTRL = 0x46,
 	MCU_EXT_CMD_RX_HDR_TRANS = 0x47,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 4292153..6735915 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -108,6 +108,8 @@ struct mt7915_phy {
 
 	struct ieee80211_sband_iftype_data iftype[2][NUM_NL80211_IFTYPES];
 
+	struct ieee80211_vif *monitor_vif;
+
 	u32 rxfilter;
 	u64 omac_mask;
 
@@ -158,6 +160,14 @@ struct mt7915_dev {
 	struct idr token;
 
 	bool fw_debug;
+
+#ifdef CONFIG_NL80211_TESTMODE
+	struct {
+		u32 *reg_backup;
+
+		u8 spe_idx;
+	} test;
+#endif
 };
 
 enum {
@@ -247,6 +257,7 @@ static inline u8 mt7915_lmac_mapping(struct mt7915_dev *dev, u8 ac)
 
 extern const struct ieee80211_ops mt7915_ops;
 extern struct pci_driver mt7915_pci_driver;
+extern const struct mt76_testmode_ops mt7915_testmode_ops;
 
 u32 mt7915_reg_map(struct mt7915_dev *dev, u32 addr);
 
@@ -292,6 +303,7 @@ int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			     struct ieee80211_sta *sta);
 int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta);
+int mt7915_set_channel(struct mt7915_phy *phy);
 int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd);
 int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif);
 int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
@@ -300,6 +312,8 @@ int mt7915_mcu_set_eeprom(struct mt7915_dev *dev);
 int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset);
 int mt7915_mcu_set_mac(struct mt7915_dev *dev, int band, bool enable,
 		       bool hdr_trans);
+int mt7915_mcu_set_test_param(struct mt7915_dev *dev, u8 param, bool test_mode,
+			      u8 en);
 int mt7915_mcu_set_scs(struct mt7915_dev *dev, u8 band, bool enable);
 int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band);
 int mt7915_mcu_set_rts_thresh(struct mt7915_phy *phy, u32 val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index e4252c8..91b6356 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -51,6 +51,9 @@
 #define MT_WF_TMAC_BASE(_band)		((_band) ? 0xa1000 : 0x21000)
 #define MT_WF_TMAC(_band, ofs)		(MT_WF_TMAC_BASE(_band) + (ofs))
 
+#define MT_TMAC_TCR0(_band)		MT_WF_TMAC(_band, 0)
+#define MT_TMAC_TCR0_TBTT_STOP_CTRL	BIT(25)
+
 #define MT_TMAC_CDTR(_band)		MT_WF_TMAC(_band, 0x090)
 #define MT_TMAC_ODTR(_band)		MT_WF_TMAC(_band, 0x094)
 #define MT_TIMEOUT_VAL_PLCP		GENMASK(15, 0)
@@ -72,6 +75,9 @@
 #define MT_TMAC_FP0R18(_band)		MT_WF_TMAC(_band, 0x270)
 #define MT_TMAC_FP_MASK			GENMASK(7, 0)
 
+#define MT_TMAC_TRCR0(_band)		MT_WF_TMAC(_band, 0x09c)
+#define MT_TMAC_TFCR0(_band)		MT_WF_TMAC(_band, 0x1e0)
+
 /* DMA Band 0 */
 #define MT_WF_DMA_BASE			0x21e00
 #define MT_WF_DMA(ofs)			(MT_WF_DMA_BASE + (ofs))
@@ -171,10 +177,33 @@
 #define MT_WF_AGG_BASE(_band)		((_band) ? 0xa0800 : 0x20800)
 #define MT_WF_AGG(_band, ofs)		(MT_WF_AGG_BASE(_band) + (ofs))
 
+#define MT_AGG_AWSCR0(_band, _n)		MT_WF_AGG(_band, 0x05c + (_n) * 4)
+#define MT_AGG_PCR0(_band, _n)		MT_WF_AGG(_band, 0x06c + (_n) * 4)
+#define MT_AGG_PCR0_MM_PROT		BIT(0)
+#define MT_AGG_PCR0_GF_PROT		BIT(1)
+#define MT_AGG_PCR0_BW20_PROT		BIT(2)
+#define MT_AGG_PCR0_BW40_PROT		BIT(4)
+#define MT_AGG_PCR0_BW80_PROT		BIT(6)
+#define MT_AGG_PCR0_ERP_PROT		GENMASK(12, 8)
+#define MT_AGG_PCR0_VHT_PROT		BIT(13)
+#define MT_AGG_PCR0_PTA_WIN_DIS		BIT(15)
+
+#define MT_AGG_PCR1_RTS0_NUM_THRES	GENMASK(31, 23)
+#define MT_AGG_PCR1_RTS0_LEN_THRES	GENMASK(19, 0)
+
 #define MT_AGG_ACR0(_band)		MT_WF_AGG(_band, 0x084)
 #define MT_AGG_ACR_CFEND_RATE		GENMASK(13, 0)
 #define MT_AGG_ACR_BAR_RATE		GENMASK(29, 16)
 
+#define MT_AGG_MRCR(_band)		MT_WF_AGG(_band, 0x098)
+#define MT_AGG_MRCR_BAR_CNT_LIMIT	GENMASK(15, 12)
+#define MT_AGG_MRCR_LAST_RTS_CTS_RN	BIT(6)
+#define MT_AGG_MRCR_RTS_FAIL_LIMIT	GENMASK(11, 7)
+#define MT_AGG_MRCR_TXCMD_RTS_FAIL_LIMIT	GENMASK(28, 24)
+
+#define MT_AGG_ATCR1(_band)		MT_WF_AGG(_band, 0x0f0)
+#define MT_AGG_ATCR3(_band)		MT_WF_AGG(_band, 0x0f4)
+
 /* ARB: band 0(0x20c00), band 1(0xa0c00) */
 #define MT_WF_ARB_BASE(_band)		((_band) ? 0xa0c00 : 0x20c00)
 #define MT_WF_ARB(_band, ofs)		(MT_WF_ARB_BASE(_band) + (ofs))
@@ -183,6 +212,8 @@
 #define MT_ARB_SCR_TX_DISABLE		BIT(8)
 #define MT_ARB_SCR_RX_DISABLE		BIT(9)
 
+#define MT_ARB_DRNGR0(_band, _n)	MT_WF_ARB(_band, 0x194 + (_n) * 4)
+
 /* RMAC: band 0(0x21400), band 1(0xa1400) */
 #define MT_WF_RMAC_BASE(_band)		((_band) ? 0xa1400 : 0x21400)
 #define MT_WF_RMAC(_band, ofs)		(MT_WF_RMAC_BASE(_band) + (ofs))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
new file mode 100644
index 0000000..53fc977
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc. */
+
+#include "mt7915.h"
+#include "mac.h"
+#include "mcu.h"
+#include "testmode.h"
+
+struct reg_band {
+	u32 band[2];
+};
+
+#define REG_BAND(_reg) \
+	{ .band[0] = MT_##_reg(0), .band[1] = MT_##_reg(1) }
+#define REG_BAND_IDX(_reg, _idx) \
+	{ .band[0] = MT_##_reg(0, _idx), .band[1] = MT_##_reg(1, _idx) }
+
+static const struct reg_band reg_backup_list[] = {
+	REG_BAND_IDX(AGG_PCR0, 0),
+	REG_BAND_IDX(AGG_PCR0, 1),
+	REG_BAND_IDX(AGG_AWSCR0, 0),
+	REG_BAND_IDX(AGG_AWSCR0, 1),
+	REG_BAND_IDX(AGG_AWSCR0, 2),
+	REG_BAND_IDX(AGG_AWSCR0, 3),
+	REG_BAND(AGG_MRCR),
+	REG_BAND(TMAC_TFCR0),
+	REG_BAND(TMAC_TCR0),
+	REG_BAND(AGG_ATCR1),
+	REG_BAND(AGG_ATCR3),
+	REG_BAND(TMAC_TRCR0),
+	REG_BAND(TMAC_ICR0),
+	REG_BAND_IDX(ARB_DRNGR0, 0),
+	REG_BAND_IDX(ARB_DRNGR0, 1),
+};
+
+static int
+mt7915_tm_mode_ctrl(struct mt7915_dev *dev, bool enable)
+{
+	struct {
+		u8 format_id;
+		bool enable;
+		u8 rsv[2];
+	} req = {
+		.format_id = 0x6,
+		.enable = enable,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76,
+				 MCU_EXT_CMD_TX_POWER_FEATURE_CTRL,
+				 &req, sizeof(req), false);
+}
+
+static int
+mt7915_tm_set_trx(struct mt7915_dev *dev, struct mt7915_phy *phy,
+		  int type, bool en)
+{
+	struct mt7915_tm_cmd req = {
+		.testmode_en = 1,
+		.param_idx = MCU_ATE_SET_TRX,
+		.param.trx.type = type,
+		.param.trx.enable = en,
+		.param.trx.band = phy != &dev->phy,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_ATE_CTRL, &req,
+				 sizeof(req), false);
+}
+
+static void
+mt7915_tm_reg_backup_restore(struct mt7915_dev *dev, struct mt7915_phy *phy)
+{
+	int n_regs = ARRAY_SIZE(reg_backup_list);
+	bool ext_phy = phy != &dev->phy;
+	u32 *b = dev->test.reg_backup;
+	int i;
+
+	if (dev->mt76.test.state == MT76_TM_STATE_OFF) {
+		for (i = 0; i < n_regs; i++)
+			mt76_wr(dev, reg_backup_list[i].band[ext_phy], b[i]);
+		return;
+	}
+
+	if (b)
+		return;
+
+	b = devm_kzalloc(dev->mt76.dev, 4 * n_regs, GFP_KERNEL);
+	if (!b)
+		return;
+
+	dev->test.reg_backup = b;
+	for (i = 0; i < n_regs; i++)
+		b[i] = mt76_rr(dev, reg_backup_list[i].band[ext_phy]);
+
+	mt76_clear(dev, MT_AGG_PCR0(ext_phy, 0), MT_AGG_PCR0_MM_PROT |
+		   MT_AGG_PCR0_GF_PROT | MT_AGG_PCR0_ERP_PROT |
+		   MT_AGG_PCR0_VHT_PROT | MT_AGG_PCR0_BW20_PROT |
+		   MT_AGG_PCR0_BW40_PROT | MT_AGG_PCR0_BW80_PROT);
+	mt76_set(dev, MT_AGG_PCR0(ext_phy, 0), MT_AGG_PCR0_PTA_WIN_DIS);
+
+	mt76_wr(dev, MT_AGG_PCR0(ext_phy, 1), MT_AGG_PCR1_RTS0_NUM_THRES |
+		MT_AGG_PCR1_RTS0_LEN_THRES);
+
+	mt76_clear(dev, MT_AGG_MRCR(0), MT_AGG_MRCR_BAR_CNT_LIMIT |
+		   MT_AGG_MRCR_LAST_RTS_CTS_RN | MT_AGG_MRCR_RTS_FAIL_LIMIT |
+		   MT_AGG_MRCR_TXCMD_RTS_FAIL_LIMIT);
+
+	mt76_rmw(dev, MT_AGG_MRCR(0), MT_AGG_MRCR_RTS_FAIL_LIMIT |
+		 MT_AGG_MRCR_TXCMD_RTS_FAIL_LIMIT,
+		 FIELD_PREP(MT_AGG_MRCR_RTS_FAIL_LIMIT, 1) |
+		 FIELD_PREP(MT_AGG_MRCR_TXCMD_RTS_FAIL_LIMIT, 1));
+
+	mt76_wr(dev, MT_TMAC_TFCR0(0), 0);
+	mt76_clear(dev, MT_TMAC_TCR0(0), MT_TMAC_TCR0_TBTT_STOP_CTRL);
+}
+
+static void
+mt7915_tm_init(struct mt7915_dev *dev)
+{
+	bool en = !(dev->mt76.test.state == MT76_TM_STATE_OFF);
+
+	if (!test_bit(MT76_STATE_RUNNING, &dev->phy.mt76->state))
+		return;
+
+	mt7915_tm_mode_ctrl(dev, en);
+	mt7915_tm_reg_backup_restore(dev, &dev->phy);
+	mt7915_tm_set_trx(dev, &dev->phy, TM_MAC_TXRX, !en);
+}
+
+static void
+mt7915_tm_set_tx_frames(struct mt7915_dev *dev, bool en)
+{
+	static const u8 spe_idx_map[] = {0, 0, 1, 0, 3, 2, 4, 0,
+					 9, 8, 6, 10, 16, 12, 18, 0};
+	struct sk_buff *skb = dev->mt76.test.tx_skb;
+	struct ieee80211_tx_info *info;
+
+	mt7915_tm_set_trx(dev, &dev->phy, TM_MAC_RX_RXV, false);
+
+	if (en) {
+		u8 tx_ant = dev->mt76.test.tx_antenna_mask;
+
+		mutex_unlock(&dev->mt76.mutex);
+		mt7915_set_channel(&dev->phy);
+		mutex_lock(&dev->mt76.mutex);
+
+		mt7915_mcu_set_chan_info(&dev->phy, MCU_EXT_CMD_SET_RX_PATH);
+		dev->test.spe_idx = spe_idx_map[tx_ant];
+	}
+
+	mt7915_tm_set_trx(dev, &dev->phy, TM_MAC_TX, en);
+
+	if (!en || !skb)
+		return;
+
+	info = IEEE80211_SKB_CB(skb);
+	info->control.vif = dev->phy.monitor_vif;
+}
+
+static int
+mt7915_tm_set_state(struct mt76_dev *mdev, enum mt76_testmode_state state)
+{
+	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
+	struct mt76_testmode_data *td = &mdev->test;
+	enum mt76_testmode_state prev_state = td->state;
+
+	mdev->test.state = state;
+
+	if (prev_state == MT76_TM_STATE_TX_FRAMES)
+		mt7915_tm_set_tx_frames(dev, false);
+	else if (state == MT76_TM_STATE_TX_FRAMES)
+		mt7915_tm_set_tx_frames(dev, true);
+	else if (prev_state == MT76_TM_STATE_OFF || state == MT76_TM_STATE_OFF)
+		mt7915_tm_init(dev);
+
+	return 0;
+}
+
+const struct mt76_testmode_ops mt7915_testmode_ops = {
+	.set_state = mt7915_tm_set_state,
+};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
new file mode 100644
index 0000000..04f4a2c
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc. */
+
+#ifndef __MT7915_TESTMODE_H
+#define __MT7915_TESTMODE_H
+
+struct mt7915_tm_trx {
+	u8 type;
+	u8 enable;
+	u8 band;
+	u8 rsv;
+};
+
+struct mt7915_tm_cmd {
+	u8 testmode_en;
+	u8 param_idx;
+	u8 _rsv[2];
+	union {
+		__le32 data;
+		struct mt7915_tm_trx trx;
+		u8 test[72];
+	} param;
+} __packed;
+
+enum {
+	TM_MAC_TX = 1,
+	TM_MAC_RX,
+	TM_MAC_TXRX,
+	TM_MAC_TXRX_RXV,
+	TM_MAC_RXV,
+	TM_MAC_RX_RXV,
+};
+
+#endif
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
