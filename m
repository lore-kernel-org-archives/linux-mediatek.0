Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08956C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 09:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40DF61396
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 09:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40DF61396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVe1X4vAXUXiLujzX+9vDkzKSsDu4yI2NPrCfOGJww8=; b=uEFjX2AWX5YJ3S
	UwqnjuuZFeULg4o1GuDyZXH8FmH1jwJ4uDRoCOwkok/8WNkNlZpSLGsKUTDMsdbV4wK/vINKbkTP+
	wemF7CePcTAbOPJfkuPaH2UpVQkAu3/I8ww4TMqTyGMEFqTHBiFaGiBTmFmVPG4ueFatGSJQlwD1R
	+nErwZXgEXUBJ5Msd3rtgtiWbWeSfggASCX4KFK8lUdas/i5ZgSOOZC9pV52hE9KqtHLIlt7fwh9y
	tZfTdvxvZSjaqyqwNZtwLyCyUMgR+Zl/zJI6KZv6Rhpv2R6fWQq0enxsyQewGWw3NEw8rADoLigS6
	31DTwpdN7hCAXIxLl6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3b2m-00Crrs-Ou; Wed, 14 Jul 2021 09:19:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3b2j-00Crq7-7x
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 09:19:02 +0000
X-UUID: 30afe9f4c4794814afed194ac581d524-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0oXJ0hH8UVG97s6851KwTw6Dydt9HuUrJoCfD+1WpY0=; 
 b=SikhxLVVjuWGu0XovSOm7A//thgsP9zQtbnHQw5HY6JCz0x+qYwup+KWNhOkboq1ZdTF0MFRhf3FfJr/LnPwWnE09GOMj65UD7U23n7il2TBiOiznTBCh2wuSP9vj+w7KerR2HhBTGJP4cICDjWqYsVzBJBqMCt1lgoARl9iIIs=;
X-UUID: 30afe9f4c4794814afed194ac581d524-20210714
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1762739960; Wed, 14 Jul 2021 02:18:56 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 02:18:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 17:18:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Jul 2021 17:18:53 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 4/4] mt76: mt7915: remove mt7915_sta_stats
Date: Wed, 14 Jul 2021 17:18:51 +0800
Message-ID: <017ded88cbff92fda442fff721ab3c17e82e5690.1626253921.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <50730853fe09fb75418484770a0c95c23b44deb5.1626253920.git.ryder.lee@mediatek.com>
References: <50730853fe09fb75418484770a0c95c23b44deb5.1626253920.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_021901_333863_B23A660A 
X-CRM114-Status: GOOD (  12.31  )
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

mt7915_sta_stats is no longer needed after tx rate reworking.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7915/main.c   | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h | 9 ++-------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 6de79d646ca1..45a8614c5343 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1058,9 +1058,9 @@ int mt7915_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 
 		msta = (struct mt7915_sta *)sta->drv_priv;
 
-		if (time_after(jiffies, msta->stats.jiffies + HZ / 4)) {
+		if (time_after(jiffies, msta->jiffies + HZ / 4)) {
 			info->flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
-			msta->stats.jiffies = jiffies;
+			msta->jiffies = jiffies;
 		}
 	}
 
@@ -1868,8 +1868,8 @@ void mt7915_mac_sta_rc_work(struct work_struct *work)
 	while (!list_empty(&list)) {
 		msta = list_first_entry(&list, struct mt7915_sta, rc_list);
 		list_del_init(&msta->rc_list);
-		changed = msta->stats.changed;
-		msta->stats.changed = 0;
+		changed = msta->changed;
+		msta->changed = 0;
 		spin_unlock_bh(&dev->sta_poll_lock);
 
 		sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 953d5caae5c2..825cb44c9107 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -623,7 +623,7 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	msta->wcid.idx = idx;
 	msta->wcid.ext_phy = mvif->band_idx;
 	msta->wcid.tx_info |= MT_WCID_TX_INFO_SET;
-	msta->stats.jiffies = jiffies;
+	msta->jiffies = jiffies;
 
 	mt7915_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
@@ -955,7 +955,7 @@ static void mt7915_sta_rc_work(void *data, struct ieee80211_sta *sta)
 	u32 *changed = data;
 
 	spin_lock_bh(&dev->sta_poll_lock);
-	msta->stats.changed |= *changed;
+	msta->changed |= *changed;
 	if (list_empty(&msta->rc_list))
 		list_add_tail(&msta->rc_list, &dev->sta_rc_list);
 	spin_unlock_bh(&dev->sta_poll_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index a9c36b515aa6..33be449309e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -64,11 +64,6 @@ enum mt7915_rxq_id {
 	MT7915_RXQ_MCU_WA_EXT,
 };
 
-struct mt7915_sta_stats {
-	unsigned long changed;
-	unsigned long jiffies;
-};
-
 struct mt7915_sta_key_conf {
 	s8 keyidx;
 	u8 key[16];
@@ -83,8 +78,8 @@ struct mt7915_sta {
 	struct list_head rc_list;
 	u32 airtime_ac[8];
 
-	struct mt7915_sta_stats stats;
-
+	unsigned long changed;
+	unsigned long jiffies;
 	unsigned long ampdu_state;
 
 	struct mt7915_sta_key_conf bip;
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
