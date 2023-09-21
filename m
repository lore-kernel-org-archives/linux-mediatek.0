Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ED1E7D0AA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vKWek7dONjnAspukrkloUbp5Uh/V78O7fefRiKFW1I8=; b=zGN6Y89n/jpJCs1hyLz7Kv8/it
	6R1ogNHxQv2WMWxxFpX1V0BowXSOLoh0QsQVcY24D/xxDKmEiiQxBW/Wdb/4RmsBSCd4cEICg3oXU
	lGA0U8XEO5yZIFkR2Er4GYZFh2JOhB7RvoHNmS/GIT9uQF8ijg/jO/aqeNo1DKOhHYjzX4UkUeJYt
	UPdciUTK1Gm6gDikrwMw8Ay7mUzPoyrJJUhBpbeKfomPVB6dWxvbh7Db/Lsnfrq3+cLQraqUcZzUL
	YvmtQ8tFRzt3RCYtzLk0PD9Fl705sroI+R+GNe8LHmxOtIk0wgdnDLh/LbObZWJ3s6Rx4PZyYCnks
	Q1txHx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQrE-0079Xg-0N;
	Thu, 21 Sep 2023 21:05:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQrB-0079X7-1J
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 21:05:06 +0000
X-UUID: 872d0e6e58c211ee86758d4a7c00f3a0-20230921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vKWek7dONjnAspukrkloUbp5Uh/V78O7fefRiKFW1I8=;
	b=ed3SnLAdoN/lm/WPmmDeuZ4HtZN9zdkqhsBbowdtLPSZCMN62ZvNHxGhofXI1Ncmg4txMdRCdHUwwX1hfKYM17MJjqYxa7lx4as1nruf0DfS0KTsoLDD+HX+HAMWkjBBb4HejBpzJFQYzlZ+OQEDe95vfB7lsc+qItkaVK/PoFg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:5bbde8e1-058e-45d2-8211-c8e0593dc8fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:db324fc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 872d0e6e58c211ee86758d4a7c00f3a0-20230921
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 303904588; Thu, 21 Sep 2023 14:05:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 05:04:57 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 05:04:55 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>, Money Wang
	<Money.Wang@mediatek.com>
Subject: [PATCH v3] wifi: mac80211: add exported tpt_led_trig function for softmac driver
Date: Thu, 21 Sep 2023 14:04:53 -0700
Message-ID: <038706d9bbf434642013e880300d4f597f13b514.1695329290.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.250600-8.000000
X-TMASE-MatchedRID: +k55+NgUc6YLazoQyrpm0lVN8laWo90MXzuf6CMHFBtUFL8kNivfsBlN
	xiPQSlnnxILoPou7rql2etPL9FEV3h9NAFnVs2NuGfRQPgZTkipP2RIvtLAHWACGaccd4ae9cHj
	giTON9jLaFM5TPGLdCPSOC/eQVqddNLV8+yUR4KdH+PTjR9EWkpdhffisWXfH6dkNekyzYll91D
	unZtIaFuLzNWBegCW2wgn7iDBesS3CttcwYNipX8KVf7avePdYeJUA+tazrYR9t5CQ0a4zA3EE3
	X8vPDWHZjfkNwILovatJ9hPQP9PFP0ST08qTwdEiL4lZclYiDqEIoC1m6hGEBvGwqtTOzCBdmtR
	sRmKkASJZPT2ZDPuzPD2QfzMDLjhIh26TkmSN3fAvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.250600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FCFCCEBC287D7F1181AEEE65EDE7A9361EB493E7D8A782D1DB33E5D5C963C6D22000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_140505_446686_4418AF8E 
X-CRM114-Status: GOOD (  11.55  )
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

Add a new function __ieee80211_tpt_led_trig_trx. It is exported and
takes ieee80211_hw as argument so that softmac driver can use. This
can be helpful when traffic runs in HW path and mac80211 is not
aware of the traffic.

Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Signed-off-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: split series
---
v3: retitle, keep the original API and combine double-underscore functions
---
 include/net/mac80211.h |  2 ++
 net/mac80211/led.c     | 12 ++++++++++++
 net/mac80211/led.h     |  6 ++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 8d993f6ab919..c32f614acb3d 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4733,6 +4733,8 @@ __ieee80211_create_tpt_led_trigger(struct ieee80211_hw *hw,
 				   unsigned int flags,
 				   const struct ieee80211_tpt_blink *blink_table,
 				   unsigned int blink_table_len);
+void __ieee80211_tpt_led_trig_trx(struct ieee80211_hw *hw,
+				  int tx_bytes, int rx_bytes);
 #endif
 /**
  * ieee80211_get_tx_led_name - get name of TX LED
diff --git a/net/mac80211/led.c b/net/mac80211/led.c
index 2dc732147e85..1c18ebcaac20 100644
--- a/net/mac80211/led.c
+++ b/net/mac80211/led.c
@@ -319,6 +319,18 @@ __ieee80211_create_tpt_led_trigger(struct ieee80211_hw *hw,
 }
 EXPORT_SYMBOL(__ieee80211_create_tpt_led_trigger);
 
+void __ieee80211_tpt_led_trig_trx(struct ieee80211_hw *hw,
+				  int tx_bytes, int rx_bytes)
+{
+	struct ieee80211_local *local = hw_to_local(hw);
+
+	if (atomic_read(&local->tpt_led_active)) {
+		local->tpt_led_trigger->tx_bytes += tx_bytes;
+		local->tpt_led_trigger->rx_bytes += rx_bytes;
+	}
+}
+EXPORT_SYMBOL(__ieee80211_tpt_led_trig_trx);
+
 static void ieee80211_start_tpt_led_trig(struct ieee80211_local *local)
 {
 	struct tpt_led_trigger *tpt_trig = local->tpt_led_trigger;
diff --git a/net/mac80211/led.h b/net/mac80211/led.h
index d25f13346b82..6d3212443d35 100644
--- a/net/mac80211/led.h
+++ b/net/mac80211/led.h
@@ -71,8 +71,7 @@ static inline void
 ieee80211_tpt_led_trig_tx(struct ieee80211_local *local, int bytes)
 {
 #ifdef CONFIG_MAC80211_LEDS
-	if (atomic_read(&local->tpt_led_active))
-		local->tpt_led_trigger->tx_bytes += bytes;
+	__ieee80211_tpt_led_trig_trx(&local->hw, bytes, 0);
 #endif
 }
 
@@ -80,7 +79,6 @@ static inline void
 ieee80211_tpt_led_trig_rx(struct ieee80211_local *local, int bytes)
 {
 #ifdef CONFIG_MAC80211_LEDS
-	if (atomic_read(&local->tpt_led_active))
-		local->tpt_led_trigger->rx_bytes += bytes;
+	__ieee80211_tpt_led_trig_trx(&local->hw, 0, bytes);
 #endif
 }
-- 
2.39.0


