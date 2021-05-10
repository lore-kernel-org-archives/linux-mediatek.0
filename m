Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8B7C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54206120D
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54206120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kej2lms//OOWGikt+KRMOzuU8jNlqsPVbeMGFhoJpt4=; b=pnA48eXght59AopekLujyg0wi
	GpnjFbXFWnLWJkK8V5KBDPsc7L0y2ntZv0mJyhA1KZ5LeIFfQ6MaGKry7IxN80MDho+IX3E7e+GOv
	+l0Rt/58JmL6emQJ9J702PCC7GcSwWWxXYJOgYiI0YfwKlHlr1B27oupYbrElMJULX3J9mCzcc1rQ
	YcP3ExXjro2UvWlsQ1QKiTd62yJIXMzIPX+1VSOFIgBDidfZ1MftrfM2IHMVGfY7E0gXWZrltr0xI
	LlNj4lm+8+WqjFGeaQczLAFEEXojp6+kIsY4jqNFbPZ7A/iBRpIIV9+3yIclkiwavgIrCclQysJPj
	3TIDdGLog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7cn-00ElMl-4G; Mon, 10 May 2021 15:15:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cj-00ElLj-L9
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=xmabILoTJH3OmG7WWafK+etxjnw0OPuyBx4jO3M86XM=; b=CklsmkVhY6+bBGuT6OAoDDAHbL
 ryX7XEVaa0xyMHrNmzUihyaki+BY97DHYM6Iq+f7NjM03xO/X8DMppdO3WoSGqcOqpmQ4gzUB70tD
 JhUNFTjs05x0eRGonBWsViOQfLkEGzjf0axfoyovnEiH/hhFK25nMonGeK15cWIpWtbmkKZbsosWD
 5aVEaSoYUYTSb1A3mgApxS94a/J5Mbprxo7ZWjJ7ZV81mnS9qBRVjTyiMIftzFed/U9L1XTcnk03S
 7kGIwXLPojlltPnXhnFcb2JDovX9Zx+q6vcjk6xRGY0m+id871XZLjMMTmoC1KxcRQ2q3j8HYeD7c
 VjsTMMwg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7cf-008rIT-G0
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:15:08 +0000
X-UUID: 4d6c0d498a734169b3b06df99e629c70-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xmabILoTJH3OmG7WWafK+etxjnw0OPuyBx4jO3M86XM=; 
 b=pSHBO0+bggwnM4H9R6F2152H70GE+jj88wQL0dsgRwpwNUWp4pXfqgLQj7FT7UPvZyjDCTGjf9BVllOMyBoBwe4X99PsJ4PWWcSYd79zoMWjTyR6yTAlyAX151W8qATSacS9ySMoT9Fz4lK/EJES/+RU53aRpzFLtvngE1otU5s=;
X-UUID: 4d6c0d498a734169b3b06df99e629c70-20210510
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 813699646; Mon, 10 May 2021 08:15:01 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:15:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:14:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:58 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 4/9] mt76: mt7921: enable deep sleep at runtime
Date: Mon, 10 May 2021 23:14:52 +0800
Message-ID: <1620659697-12048-4-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_081506_983998_73D3E9EC 
X-CRM114-Status: GOOD (  15.76  )
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

From: Sean Wang <sean.wang@mediatek.com>

Enable the deep sleep mode with that firmware is able to trap into
the doze state at runtime to reduce the power consumption further.

The deep sleep mode is not allowed in the STA state transition with
the firmware to have the fast connection experience as we've done in
the full power mode

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 20 +++++++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 ++
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  6 +++-
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 28 +++++++++++++++++--
 4 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 7b8f8e6f431d..542d7d9f1f52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1596,6 +1596,26 @@ int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable)
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_deep_sleep);
 
+int mt76_connac_sta_state_dp(struct mt76_dev *dev,
+			     enum ieee80211_sta_state old_state,
+			     enum ieee80211_sta_state new_state)
+{
+	if ((old_state == IEEE80211_STA_ASSOC &&
+	     new_state == IEEE80211_STA_AUTHORIZED) ||
+	    (old_state == IEEE80211_STA_NONE &&
+	     new_state == IEEE80211_STA_NOTEXIST))
+		mt76_connac_mcu_set_deep_sleep(dev, true);
+
+	if ((old_state == IEEE80211_STA_NOTEXIST &&
+	     new_state == IEEE80211_STA_NONE) ||
+	    (old_state == IEEE80211_STA_AUTHORIZED &&
+	     new_state == IEEE80211_STA_ASSOC))
+		mt76_connac_mcu_set_deep_sleep(dev, false);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt76_connac_sta_state_dp);
+
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 01fc9f2c2f4a..3ed2fb5e1389 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1032,6 +1032,9 @@ int mt76_connac_mcu_update_gtk_rekey(struct ieee80211_hw *hw,
 int mt76_connac_mcu_set_hif_suspend(struct mt76_dev *dev, bool suspend);
 void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif);
+int mt76_connac_sta_state_dp(struct mt76_dev *dev,
+			     enum ieee80211_sta_state old_state,
+			     enum ieee80211_sta_state new_state);
 int mt76_connac_mcu_chip_config(struct mt76_dev *dev);
 int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable);
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 6947d98287c0..cd68721314fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -250,7 +250,11 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	if (ret)
 		return ret;
 
-	return mt7921_init_debugfs(dev);
+	ret = mt7921_init_debugfs(dev);
+	if (ret)
+		return ret;
+
+	return mt76_connac_mcu_set_deep_sleep(&dev->mt76, dev->pm.enable);
 }
 
 void mt7921_unregister_device(struct mt7921_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 39b3e769925e..5dbccbefe047 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -848,6 +848,31 @@ mt7921_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			      IEEE80211_STA_NOTEXIST);
 }
 
+static int mt7921_sta_state(struct ieee80211_hw *hw,
+			    struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta,
+			    enum ieee80211_sta_state old_state,
+			    enum ieee80211_sta_state new_state)
+{
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+
+	if (dev->pm.enable) {
+		mt7921_mutex_acquire(dev);
+		mt76_connac_sta_state_dp(&dev->mt76, old_state, new_state);
+		mt7921_mutex_release(dev);
+	}
+
+	if (old_state == IEEE80211_STA_AUTH &&
+	    new_state == IEEE80211_STA_ASSOC) {
+		return mt7921_sta_add(hw, vif, sta);
+	} else if (old_state == IEEE80211_STA_ASSOC &&
+		   new_state == IEEE80211_STA_AUTH) {
+		return mt7921_sta_remove(hw, vif, sta);
+	}
+
+	return 0;
+}
+
 static int
 mt7921_get_stats(struct ieee80211_hw *hw,
 		 struct ieee80211_low_level_stats *stats)
@@ -1191,8 +1216,7 @@ const struct ieee80211_ops mt7921_ops = {
 	.conf_tx = mt7921_conf_tx,
 	.configure_filter = mt7921_configure_filter,
 	.bss_info_changed = mt7921_bss_info_changed,
-	.sta_add = mt7921_sta_add,
-	.sta_remove = mt7921_sta_remove,
+	.sta_state = mt7921_sta_state,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.set_key = mt7921_set_key,
 	.sta_set_decap_offload = mt7921_sta_set_decap_offload,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
