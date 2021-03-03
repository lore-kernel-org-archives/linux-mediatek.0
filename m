Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80E9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:36:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7C56023B
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7C56023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u8WkploUZ/ONXNx2KGuVv0msx7pnKQy2ihD64DtJZ28=; b=AOMreDnnwRvn7Xu1wKGPAfbCE
	LuWjEHzVG1Z8ceZ3VVP7t82FdK+ZWyFaeD/ZEIld5oIJTd2p2pQsNwbgH8iPfAtBkW31pxUwjAREP
	BCbBEJ5niHDzy+McGWjIYWdi5Gzh0o+UwYfJsw8RVOBrn5WJVdC5h5FzjGYqfjh9xumSL59RLqHfE
	GsQ63igdRUxjYhjvg7eODFHF7xYp6wlOEmVk9kjuNFGBFDzaAq1n56P6TiOGmDC11+yBCdUiIzYmP
	Fkh6kgXXQ+/4zRlnijbRV+1TFgEE2x2tpWqOQuR2gM3MPFyeCroGc7yKT6C5GduTYRoZaXe53iJLS
	d9G7xNoOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTXs-005Pee-57; Wed, 03 Mar 2021 15:36:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSUY-0058Go-Ao
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 14:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=bexNpAXs/4LQX/y1AZDNLQl2oFZUSyhwGYM+RoBPJ6U=; b=OCSyCm991NSKkFCDVcG7tKymtj
 Ulp/FVQqXA5OUF1jBNKvGGY6bcf/ztFm6v+eDk3awC/Ydlw4k1Thz1v2IFDqRyQ9V2i32xEYwiUc5
 Q0k80kHBjAv2uWNhy+1SWl6kVsdN+aV/fz78q3HLJZtTWosxFqoSF0e2FFleBVd5TQKp11wZOjDoV
 ruscYO/7NOcN4fycC9Umc1qj+8RfkVNMkqjFW+SmxbbJ8Sn1JQlHpYzuVPkumBRC4zKvfJ7dV2IVL
 qEArUwzddfvsYnz0tZsOkNnccciouMJG48uuHXlnUdQYYAQM8B7Eb9Eh+HYkMD6SUtbM2VwxwS+Bu
 iyZprKpw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOtg-002D1a-45
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 10:38:28 +0000
X-UUID: f096462299244ca5a7fed123a74f2d7a-20210303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bexNpAXs/4LQX/y1AZDNLQl2oFZUSyhwGYM+RoBPJ6U=; 
 b=EmMaDO/GW5K3w0PNtrWavxa5fMflKAJi7cFp3xhhJwwvTo8hrocdf+DpfNxrxdADzERAEl1jesemJRAiRzvSKCHe+UKN000mrAKC+uE/EjFUz0BrOWvH+k52LpeytRcRttYFJlSIlvm6u/vSuoSAHVzqgPScdX7RKgaYNAiJ7Bk=;
X-UUID: f096462299244ca5a7fed123a74f2d7a-20210303
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1935323348; Wed, 03 Mar 2021 02:38:21 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 02:38:19 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 18:38:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Mar 2021 18:38:05 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 4/4] mt76: mt7615: check mcu returned values in mt7615_ops
Date: Wed, 3 Mar 2021 18:38:02 +0800
Message-ID: <4c525684a97f4316acecd1e83804d90ebb8dbe96.1614753100.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <a379bb8534b2b8c24e30313b97aa8cfdf79c315b.1614753100.git.ryder.lee@mediatek.com>
References: <a379bb8534b2b8c24e30313b97aa8cfdf79c315b.1614753100.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 34AC0F9BC6CAC3822917163FFD95B87102834EADC3CEA35DBD22757D73E366502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_103828_709516_20A1AAD8 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Properly check returned values from mcu utility routines in
mt7615_ops.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 54 +++++++++++++------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 68accb37ea28..1564bcdde2d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -29,6 +29,7 @@ static int mt7615_start(struct ieee80211_hw *hw)
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	struct mt7615_phy *phy = mt7615_hw_phy(hw);
 	bool running;
+	int ret;
 
 	if (!mt7615_wait_for_mcu_init(dev))
 		return -EIO;
@@ -38,21 +39,38 @@ static int mt7615_start(struct ieee80211_hw *hw)
 	running = mt7615_dev_running(dev);
 
 	if (!running) {
-		mt7615_mcu_set_pm(dev, 0, 0);
-		mt76_connac_mcu_set_mac_enable(&dev->mt76, 0, true, false);
+		ret = mt7615_mcu_set_pm(dev, 0, 0);
+		if (ret)
+			goto out;
+
+		ret = mt76_connac_mcu_set_mac_enable(&dev->mt76, 0, true, false);
+		if (ret)
+			goto out;
+
 		mt7615_mac_enable_nf(dev, 0);
 	}
 
 	if (phy != &dev->phy) {
-		mt7615_mcu_set_pm(dev, 1, 0);
-		mt76_connac_mcu_set_mac_enable(&dev->mt76, 1, true, false);
+		ret = mt7615_mcu_set_pm(dev, 1, 0);
+		if (ret)
+			goto out;
+
+		ret = mt76_connac_mcu_set_mac_enable(&dev->mt76, 1, true, false);
+		if (ret)
+			goto out;
+
 		mt7615_mac_enable_nf(dev, 1);
 	}
 
-	if (mt7615_firmware_offload(dev))
-		mt76_connac_mcu_set_channel_domain(phy->mt76);
+	if (mt7615_firmware_offload(dev)) {
+		ret = mt76_connac_mcu_set_channel_domain(phy->mt76);
+		if (ret)
+			goto out;
+	}
 
-	mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+	ret = mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+	if (ret)
+		goto out;
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
@@ -62,6 +80,7 @@ static int mt7615_start(struct ieee80211_hw *hw)
 	if (!running)
 		mt7615_mac_reset_counters(dev);
 
+out:
 	mt7615_mutex_release(dev);
 
 	return 0;
@@ -715,13 +734,13 @@ static int mt7615_set_rts_threshold(struct ieee80211_hw *hw, u32 val)
 {
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	struct mt7615_phy *phy = mt7615_hw_phy(hw);
-	int band = phy != &dev->phy;
+	int err, band = phy != &dev->phy;
 
 	mt7615_mutex_acquire(dev);
-	mt76_connac_mcu_set_rts_thresh(&dev->mt76, val, band);
+	err = mt76_connac_mcu_set_rts_thresh(&dev->mt76, val, band);
 	mt7615_mutex_release(dev);
 
-	return 0;
+	return err;
 }
 
 static int
@@ -749,16 +768,16 @@ mt7615_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->wcid, tid, ssn,
 				   params->buf_size);
-		mt7615_mcu_add_rx_ba(dev, params, true);
+		ret = mt7615_mcu_add_rx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->wcid, tid);
-		mt7615_mcu_add_rx_ba(dev, params, false);
+		ret = mt7615_mcu_add_rx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7615_mcu_add_tx_ba(dev, params, true);
+		ret = mt7615_mcu_add_tx_ba(dev, params, true);
 		ssn = mt7615_mac_get_sta_tid_sn(dev, msta->wcid.idx, tid);
 		ieee80211_send_bar(vif, sta->addr, tid,
 				   IEEE80211_SN_TO_SEQ(ssn));
@@ -766,7 +785,7 @@ mt7615_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
-		mt7615_mcu_add_tx_ba(dev, params, false);
+		ret = mt7615_mcu_add_tx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		ssn = mt7615_mac_get_sta_tid_sn(dev, msta->wcid.idx, tid);
@@ -775,7 +794,7 @@ mt7615_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		break;
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
-		mt7615_mcu_add_tx_ba(dev, params, false);
+		ret = mt7615_mcu_add_tx_ba(dev, params, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
@@ -1085,6 +1104,7 @@ static int mt7615_cancel_remain_on_channel(struct ieee80211_hw *hw,
 					   struct ieee80211_vif *vif)
 {
 	struct mt7615_phy *phy = mt7615_hw_phy(hw);
+	int err;
 
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return 0;
@@ -1093,10 +1113,10 @@ static int mt7615_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	cancel_work_sync(&phy->roc_work);
 
 	mt7615_mutex_acquire(phy->dev);
-	mt7615_mcu_set_roc(phy, vif, NULL, 0);
+	err = mt7615_mcu_set_roc(phy, vif, NULL, 0);
 	mt7615_mutex_release(phy->dev);
 
-	return 0;
+	return err;
 }
 
 static void mt7615_sta_set_decap_offload(struct ieee80211_hw *hw,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
