Return-Path: <SRS0=RXhr=DS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BA3C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2020 21:26:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B872076C
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2020 21:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ol2a5ujO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bEcV4WS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B872076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y5ZNGIeWgY9+aeNFzXggTPRSafE70BeKhXjVOByYm5w=; b=Ol2a5ujO2LyieJYmnde4OeqkyE
	0NamLm9kttwhBExlTL6jLRjKh46XnWQMC9Sbtqw64z5tDBWZuZ3AIxZqv6pyxtZXEQVUYbEuB73QG
	HEaCBe/EBlCtatpD1JazBqK9HJyQS9WHVpHxRaUfgtvqSFronnFs6ZzAl7wBPYLTO68i9jI+moIdw
	wzOIeKp4aqQqU4vEAI8ggRUdibXvQgGLPAIwjW9zhGze86MzX/QXS5d+b4hqDaSAs+bB9L+ExRNOp
	pTImkR8fall1JzFQvUSK0duY9Zz8R2nbE5wAEvmOiMAx+GEb/jykqdY1ZvpJxLbZAh4+qsy7UbyFc
	2tYGZnOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRiqn-0002Zi-GR; Sun, 11 Oct 2020 21:25:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRiqi-0002Y5-SW
 for linux-mediatek@lists.infradead.org; Sun, 11 Oct 2020 21:25:50 +0000
X-UUID: d38de06b921848c6a2345b798d0ffbb9-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=e7A35TvHolYaa24KD7F+uxR2wRjdhGSprLxGOJCNFEc=; 
 b=bEcV4WS4Faa02+a8mEykhls8ffEq9XHk/cAQhLYqwa2chtu4i0mDfdMri6RDQJAXXKzwiY4n2uaoXFjUH0zgMehhI1QMz0mRyPudToBeqzuIPkmGRYlu8UgU2wppffnUbSVowzs7mMd5iESfGwawknK/3KN08gcyX5M/VnVj1HM=;
X-UUID: d38de06b921848c6a2345b798d0ffbb9-20201011
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 225579506; Sun, 11 Oct 2020 13:25:37 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 14:25:36 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 05:25:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 05:25:34 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: initialize firmware DRR settings correctly
Date: Mon, 12 Oct 2020 05:25:29 +0800
Message-ID: <be8e85b58140eadc344f63bd4c55f396396eae4a.1602443445.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_172549_076454_49490F55 
X-CRM114-Status: GOOD (  14.47  )
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

Driver uses mac80211 airtime fairness instead of hardware solution,
so initialize corresponding MCU settings to adapt it.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  7 +++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 44 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  5 +++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +
 4 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 77f7226e655d..650dcad432de 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -47,6 +47,11 @@ static int mt7915_start(struct ieee80211_hw *hw)
 	mt7915_mcu_set_sku_en(phy, true);
 	mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
 
+	/* use mac80211 airtime fairness instead of hardware solution,
+	 * hence set max deficit to 256us to force STAs round-robin.
+	 */
+	mt7915_mcu_set_drr(dev, NULL, NULL, DRR_CTRL_AIRTIME_DEFICIT_BOUND);
+
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
 	ieee80211_queue_delayed_work(hw, &phy->mac_work,
@@ -201,6 +206,8 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 		vif->offload_flags = 0;
 	vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
 
+	ret = mt7915_mcu_set_drr(dev, vif, NULL, DRR_CTRL_STA_BSS_GROUP);
+
 out:
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 94a3ccf63d0e..614d7af7cd1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2217,13 +2217,11 @@ int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				     MCU_EXT_CMD_STA_REC_UPDATE, true);
 }
 
-static int
-mt7915_mcu_add_group(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		     struct ieee80211_sta *sta)
+int mt7915_mcu_set_drr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, int cmd)
 {
-#define MT_STA_BSS_GROUP		1
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_vif *mvif = NULL;
+	struct mt7915_sta *msta = NULL;
 	struct {
 		__le32 action;
 		u8 wlan_idx_lo;
@@ -2233,12 +2231,36 @@ mt7915_mcu_add_group(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		__le32 val;
 		u8 rsv1[8];
 	} __packed req = {
-		.action = cpu_to_le32(MT_STA_BSS_GROUP),
-		.wlan_idx_lo = to_wcid_lo(msta->wcid.idx),
-		.wlan_idx_hi = to_wcid_hi(msta->wcid.idx),
-		.val = cpu_to_le32(mvif->idx % 16),
+		.action = cpu_to_le32(cmd),
 	};
 
+	if (vif && vif->type != NL80211_IFTYPE_AP)
+		return 0;
+
+	if (vif) {
+		mvif = (struct mt7915_vif *)vif->drv_priv;
+		msta = &mvif->sta;
+	}
+
+	if (sta)
+		msta = (struct mt7915_sta *)sta->drv_priv;
+
+	if (msta) {
+		req.wlan_idx_lo = to_wcid_lo(msta->wcid.idx);
+		req.wlan_idx_hi = to_wcid_hi(msta->wcid.idx);
+	}
+
+	switch (cmd) {
+	case DRR_CTRL_STA_BSS_GROUP:
+		req.val = cpu_to_le32(mvif->idx % 16);
+		break;
+	case DRR_CTRL_AIRTIME_DEFICIT_BOUND:
+		req.val = cpu_to_le32(1); /* 256us */
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_SET_DRR_CTRL, &req,
 				 sizeof(req), true);
 }
@@ -2252,7 +2274,7 @@ int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		return 0;
 
 	/* must keep the order */
-	ret = mt7915_mcu_add_group(dev, vif, sta);
+	ret = mt7915_mcu_set_drr(dev, vif, sta, DRR_CTRL_STA_BSS_GROUP);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 5f23f27f9f6c..6a0765960d7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -995,6 +995,11 @@ enum {
 	THERMAL_SENSOR_TASK_CTRL,
 };
 
+enum {
+	DRR_CTRL_STA_BSS_GROUP = 0x01,
+	DRR_CTRL_AIRTIME_DEFICIT_BOUND = 0x10,
+};
+
 enum {
 	MT_EBF = BIT(0),	/* explicit beamforming */
 	MT_IBF = BIT(1)		/* implicit beamforming */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index aee45cce35db..8f58424014b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -301,6 +301,8 @@ int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta);
 int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd);
 int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif);
+int mt7915_mcu_set_drr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, int cmd);
 int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
 			      struct ieee80211_sta *sta, u32 rate);
 int mt7915_mcu_set_eeprom(struct mt7915_dev *dev);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
