Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ED2C4741F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:24:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792F823787
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOe6laRd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F1BHQVqC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792F823787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rpshd4AoUgWjAXH/Bd6v4qHczZXqIdPIkO6qmSLjcIU=; b=TOe6laRdDmZ0HN3PQ2a2YWMM/
	+Z0FfcHtzmw7SKzqnQ3JDT3YHrVCYFVCimmzLItawghh8MYWVKjGcph3FMd1BwkhkUgGfdtE6qs0b
	h0DerVNztD7zrAJ6ee830zIl9ao5EXmHyB5c/VCiwm5C0UAz0XxV3x2Whnxcpy9i/wjUSpkz2zhz0
	Y44q4pK02yXX+m9ww4E4DD0cACHgSUQ7ATIUnpTHUDiwF5/9tMGpps/HxkfSu4AoV967dqyd+RndA
	xsvJxcMJG1ge3YQbh8N+J5fam504KIihHQdep0YluXpR3VAz0DlxBABmrFjwJKTMUTAUSQ3+1eV//
	J4Qqyk+QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLT6N-0002dW-PA; Thu, 24 Sep 2020 15:24:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLT6K-0002bc-Hq
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 15:24:05 +0000
X-UUID: 7d92e7177372467cb8e53509ac4d4b5b-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LmgvGuej7fW84C6X2+Aw7a3cm/HXAiGlJjhjzE8CYXs=; 
 b=F1BHQVqCB4ed24ksXq9kknq6dbMu5Y1MSajP+aCOKBDSrgAgX8MTDuiU7pwykgsE1ZZSVEQee4oeBk1SIkJO3iFrDyq59IaRwj+TzJ0ps+SM61QDqajOQFOv5AKfzTXCqwMidvQhYCQ8PR5anwBDRP5ljWBe6GDox/wOKQjwtWA=;
X-UUID: 7d92e7177372467cb8e53509ac4d4b5b-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 97147378; Thu, 24 Sep 2020 07:23:33 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 08:23:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:23:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Sep 2020 23:23:14 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7915: fix VHT LDPC capability
Date: Thu, 24 Sep 2020 23:23:14 +0800
Message-ID: <891f34b8f6b9bf16413514ee054e6e6185e0f12c.1600960534.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <670fe8dcb9e1308041047718af241225ff5614bb.1600960534.git.ryder.lee@mediatek.com>
References: <670fe8dcb9e1308041047718af241225ff5614bb.1600960534.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EBBF17836A4C1B03E52A209B24B98C02C15AE1D64FD20977D621CF462077636E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_112404_729495_96F812AD 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MCU field should contain a boolean 0/1, not the flag itself.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
https://github.com/openwrt/mt76/commit/b1f425686125149eb585d5c3e05f96a1f7dab2db
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e54454fc05b9..a54eb831c0a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1662,7 +1662,7 @@ mt7915_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		tlv = mt7915_mcu_add_nested_tlv(skb, WTBL_HT, sizeof(*ht),
 						wtbl_tlv, sta_wtbl);
 		ht = (struct wtbl_ht *)tlv;
-		ht->ldpc = sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING;
+		ht->ldpc = !!(sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING);
 		ht->af = sta->ht_cap.ampdu_factor;
 		ht->mm = sta->ht_cap.ampdu_density;
 		ht->ht = true;
@@ -1676,7 +1676,7 @@ mt7915_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		tlv = mt7915_mcu_add_nested_tlv(skb, WTBL_VHT, sizeof(*vht),
 						wtbl_tlv, sta_wtbl);
 		vht = (struct wtbl_vht *)tlv;
-		vht->ldpc = sta->vht_cap.cap & IEEE80211_VHT_CAP_RXLDPC,
+		vht->ldpc = !!(sta->vht_cap.cap & IEEE80211_VHT_CAP_RXLDPC);
 		vht->vht = true;
 
 		af = FIELD_GET(IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK,
@@ -2858,7 +2858,7 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 	};
 	int ret;
 
-	dev->mt76.mcu_ops = &mt7915_mcu_ops,
+	dev->mt76.mcu_ops = &mt7915_mcu_ops;
 
 	ret = mt7915_driver_own(dev);
 	if (ret)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
