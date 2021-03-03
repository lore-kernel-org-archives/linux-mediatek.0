Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90984C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:02:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08ABE64EDC
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08ABE64EDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=do9kElI1gTlkp2AvgFpezbFPJTIta716Ll6aAaFeZP0=; b=TnHAmZC7E9GO9luRWJt7WIgzx
	Cj2JYP3xAI43Sys1U/BcCcNe5FkMpyCqh8Ov4GxsHfSjEdRs9+GQwPgGFR6OzWGapzb7+VAcAet8A
	cmTU3KHKbrslHi6jpvg4HYg7oERtWD8Mj4FuddVKR4SeAYQSi6Qa9Sw3qHP+PgONAMgIjSs/pQhMk
	h+TziIn/7pgu/7HktCAadmqcCL/HpHBgDLevPi7a4neVLbQfnJ4nO8tDh0IJ5J3phMPG1EVxWoAxQ
	Mm1TA+cv1EFcCd861gZVzLqoVxUqy60nTFkCfGT05t+E0YNhTGL0idZWrJvU7zVjF+ZVQuRJE+gX6
	DdcxHBIig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXh3-006L60-Ab; Wed, 03 Mar 2021 20:02:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT4i-005IU9-A8
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 15:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=VbkmEodI3g4VKWVmyh+4DMKrGLIuqUjCs2AJ4Dspi74=; b=uH+Aa6v+rmJXpxEx76MMAVBjyj
 xFZTzEZrs5DphT7Z8HJILLQ6voMMA61wHTzIGSJpEgUMXQ07Jptj/Maro3z/RzH4I15R5j0QUyrBs
 FVZgjthh+RNi74U/+/GanijB8PTUFZxTWX6xYthwPENit9o3/h/QpoLz+9fhDwJ89D+KnfDKrEziH
 oRTc4JqikwRjvKFnTQOGa6voreV55J+NvlJDhZwA/ux6HdffudVRhyb4uDFYhG6TKWL0HBQJ8Ir51
 qnQl4yQGKZYa7WZLxcKz2RpIHpY7tvUmCD8nAWf65zKyWkvOm+Iyp1WqiND/ROVLPPLT05mT4CWKI
 ko/KGsnA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOtc-002D0f-U7
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 10:38:25 +0000
X-UUID: 76c4d3f6f2c84160825917b806075c26-20210303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VbkmEodI3g4VKWVmyh+4DMKrGLIuqUjCs2AJ4Dspi74=; 
 b=F58divCS6aQ2FkLg/8g+sDi8k6IC43QZLMoa8K1rjjypS+w7QrF0jxfitC/58z0Uleogmtn7VFw7I4VEV3mQrj34yUnIYxl9RyR+/j8daVuqYALgKmDaYZdSTb2G7zbNPaIduNG96ycxVYxYNEO63e0iw3SdXTtuBaHi6mQwjpU=;
X-UUID: 76c4d3f6f2c84160825917b806075c26-20210303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1290039415; Wed, 03 Mar 2021 02:38:14 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 02:38:12 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 18:38:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Mar 2021 18:38:04 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/4] mt76: mt7915: check mcu returned values in mt7915_ops
Date: Wed, 3 Mar 2021 18:38:01 +0800
Message-ID: <76a1830344d468e229e2b16badaabe707c8756b3.1614753100.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <a379bb8534b2b8c24e30313b97aa8cfdf79c315b.1614753100.git.ryder.lee@mediatek.com>
References: <a379bb8534b2b8c24e30313b97aa8cfdf79c315b.1614753100.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_103825_613271_890DA8E4 
X-CRM114-Status: GOOD (  10.31  )
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
mt7915_ops.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 58 ++++++++++++++-----
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index bb49ea9307e0..255f87aa1830 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -25,6 +25,7 @@ static int mt7915_start(struct ieee80211_hw *hw)
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 	bool running;
+	int ret;
 
 	flush_work(&dev->init_work);
 
@@ -33,21 +34,44 @@ static int mt7915_start(struct ieee80211_hw *hw)
 	running = mt7915_dev_running(dev);
 
 	if (!running) {
-		mt7915_mcu_set_pm(dev, 0, 0);
-		mt7915_mcu_set_mac(dev, 0, true, true);
-		mt7915_mcu_set_scs(dev, 0, true);
+		ret = mt7915_mcu_set_pm(dev, 0, 0);
+		if (ret)
+			goto out;
+
+		ret = mt7915_mcu_set_mac(dev, 0, true, true);
+		if (ret)
+			goto out;
+
+		ret = mt7915_mcu_set_scs(dev, 0, true);
+		if (ret)
+			goto out;
+
 		mt7915_mac_enable_nf(dev, 0);
 	}
 
 	if (phy != &dev->phy) {
-		mt7915_mcu_set_pm(dev, 1, 0);
-		mt7915_mcu_set_mac(dev, 1, true, true);
-		mt7915_mcu_set_scs(dev, 1, true);
+		ret = mt7915_mcu_set_pm(dev, 1, 0);
+		if (ret)
+			goto out;
+
+		ret = mt7915_mcu_set_mac(dev, 1, true, true);
+		if (ret)
+			goto out;
+
+		ret = mt7915_mcu_set_scs(dev, 1, true);
+		if (ret)
+			goto out;
+
 		mt7915_mac_enable_nf(dev, 1);
 	}
 
-	mt7915_mcu_set_sku_en(phy, true);
-	mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD(SET_RX_PATH));
+	ret = mt7915_mcu_set_sku_en(phy, true);
+	if (ret)
+		goto out;
+
+	ret = mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD(SET_RX_PATH));
+	if (ret)
+		goto out;
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
@@ -58,9 +82,10 @@ static int mt7915_start(struct ieee80211_hw *hw)
 	if (!running)
 		mt7915_mac_reset_counters(phy);
 
+out:
 	mutex_unlock(&dev->mt76.mutex);
 
-	return 0;
+	return ret;
 }
 
 static void mt7915_stop(struct ieee80211_hw *hw)
@@ -631,12 +656,13 @@ static int mt7915_set_rts_threshold(struct ieee80211_hw *hw, u32 val)
 {
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
+	int ret;
 
 	mutex_lock(&dev->mt76.mutex);
-	mt7915_mcu_set_rts_thresh(phy, val);
+	ret = mt7915_mcu_set_rts_thresh(phy, val);
 	mutex_unlock(&dev->mt76.mutex);
 
-	return 0;
+	return ret;
 }
 
 static int
@@ -663,22 +689,22 @@ mt7915_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_RX_START:
 		mt76_rx_aggr_start(&dev->mt76, &msta->wcid, tid, ssn,
 				   params->buf_size);
-		mt7915_mcu_add_rx_ba(dev, params, true);
+		ret = mt7915_mcu_add_rx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_RX_STOP:
 		mt76_rx_aggr_stop(&dev->mt76, &msta->wcid, tid);
-		mt7915_mcu_add_rx_ba(dev, params, false);
+		ret = mt7915_mcu_add_rx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_OPERATIONAL:
 		mtxq->aggr = true;
 		mtxq->send_bar = false;
-		mt7915_mcu_add_tx_ba(dev, params, true);
+		ret = mt7915_mcu_add_tx_ba(dev, params, true);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->ampdu_state);
-		mt7915_mcu_add_tx_ba(dev, params, false);
+		ret = mt7915_mcu_add_tx_ba(dev, params, false);
 		break;
 	case IEEE80211_AMPDU_TX_START:
 		set_bit(tid, &msta->ampdu_state);
@@ -687,7 +713,7 @@ mt7915_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	case IEEE80211_AMPDU_TX_STOP_CONT:
 		mtxq->aggr = false;
 		clear_bit(tid, &msta->ampdu_state);
-		mt7915_mcu_add_tx_ba(dev, params, false);
+		ret = mt7915_mcu_add_tx_ba(dev, params, false);
 		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
