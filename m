Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17775C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 16:40:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F5523B00
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 16:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F5523B00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GccRP6Zn2o95vNSOjBHh+EtjHSAhrbacmvjEWFSsMhg=; b=1iQO947pTENEL2w4yZobcXZW3V
	OJCJ/ztEXeqNlvq/U1KZSKv+L60o6M78BMyq49I5B3l4cnAqp1D0m4erqebYoXS70JtmzI4y3hzp3
	x269WfVmESl1S64k+oAbYLbYKKLccXbohbwnbn4Z3usdW/4ybHK4atVK0GYGkmay1ing7i4Qfg0Jn
	V4Ux2IFB/jab+bL2yKXeSdOs3cYoENQ4Tup3csAP53a1uto2Lzb/AOuMUHcmQ3e4KHIh+kWaIaYzi
	iZQpc9Ozs61R6qzRPOQgNlmwwYhqutJdke7At4UClgl2EVwBN44ky7UwIdNUBt9++1KcO12DQKUlC
	M4d0YBIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmg27-0003mG-DD; Tue, 08 Dec 2020 16:40:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmg1W-0003Px-BY
 for linux-mediatek@lists.infradead.org; Tue, 08 Dec 2020 16:39:36 +0000
X-UUID: d8c7732ac83a49e9a5011eb24895da0d-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kT8hxy/hPZULKfF8w2oBXC+bLhv3ZK7qZp+AT8tlsV0=; 
 b=pqwthTivWlzPUxdM3ewnCmLMasDl2dMabteQsIeQEo5yaESMhyW98+Wuci/VsbQpKfgu69NOzZDv9Ml4Zdy7hZyIunOemLk3VcFQeIZvZzrSgfGM37bwy34YnL1IZ+TB0y6MYE//HH4+38VQm087TbgVuwq42LkzXxHovspQ+iM=;
X-UUID: d8c7732ac83a49e9a5011eb24895da0d-20201208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1976642232; Tue, 08 Dec 2020 08:39:22 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 08:39:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:39:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Dec 2020 00:39:05 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: fix MT_CIPHER_BIP_CMAC_128 setkey
Date: Wed, 9 Dec 2020 00:39:04 +0800
Message-ID: <fc6abcd810a74bb4e8568b0f46bfc851fdcfd800.1607445161.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: C0C557279579C781CBF29A7B5D208ABA8F1597C2BB9689007CBEA438C2709D8B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_113935_211314_5CD7B1B0 
X-CRM114-Status: GOOD (  11.58  )
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

MCU expects to set WLAN_CIPHER_SUITE_CCMP and WLAN_CIPHER_SUITE_AES_CMAC
at the same time, so adding an intermediate buffer for batch update.

Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 20 +++++++++++++------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  7 +++++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6097653abda4..6f242d55dba3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1016,9 +1016,10 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 
 /** starec & wtbl **/
 static int
-mt7915_mcu_sta_key_tlv(struct sk_buff *skb, struct ieee80211_key_conf *key,
-		       enum set_key_cmd cmd)
+mt7915_mcu_sta_key_tlv(struct mt7915_sta *msta, struct sk_buff *skb,
+		       struct ieee80211_key_conf *key, enum set_key_cmd cmd)
 {
+	struct mt7915_sta_key_conf *bip = &msta->bip;
 	struct sta_rec_sec *sec;
 	struct tlv *tlv;
 	u32 len = sizeof(*sec);
@@ -1038,22 +1039,23 @@ mt7915_mcu_sta_key_tlv(struct sk_buff *skb, struct ieee80211_key_conf *key,
 
 		sec_key = &sec->key[0];
 		sec_key->cipher_len = sizeof(*sec_key);
-		sec_key->key_id = key->keyidx;
 
 		if (cipher == MT_CIPHER_BIP_CMAC_128) {
 			sec_key->cipher_id = MT_CIPHER_AES_CCMP;
+			sec_key->key_id = bip->keyidx;
 			sec_key->key_len = 16;
-			memcpy(sec_key->key, key->key, 16);
+			memcpy(sec_key->key, bip->key, 16);
 
 			sec_key = &sec->key[1];
 			sec_key->cipher_id = MT_CIPHER_BIP_CMAC_128;
 			sec_key->cipher_len = sizeof(*sec_key);
 			sec_key->key_len = 16;
-			memcpy(sec_key->key, key->key + 16, 16);
+			memcpy(sec_key->key, key->key, 16);
 
 			sec->n_cipher = 2;
 		} else {
 			sec_key->cipher_id = cipher;
+			sec_key->key_id = key->keyidx;
 			sec_key->key_len = key->keylen;
 			memcpy(sec_key->key, key->key, key->keylen);
 
@@ -1063,6 +1065,12 @@ mt7915_mcu_sta_key_tlv(struct sk_buff *skb, struct ieee80211_key_conf *key,
 				memcpy(sec_key->key + 24, key->key + 16, 8);
 			}
 
+			/* sotre key_conf for BIP batch update */
+			if (cipher == MT_CIPHER_AES_CCMP) {
+				memcpy(bip->key, key->key, key->keylen);
+				bip->keyidx = key->keyidx;
+			}
+
 			len -= sizeof(*sec_key);
 			sec->n_cipher = 1;
 		}
@@ -1088,7 +1096,7 @@ int mt7915_mcu_add_key(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	ret = mt7915_mcu_sta_key_tlv(skb, key, cmd);
+	ret = mt7915_mcu_sta_key_tlv(msta, skb, key, cmd);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 30e53a0f01fb..5bf76c74373f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -71,6 +71,11 @@ struct mt7915_sta_stats {
 	unsigned long jiffies;
 };
 
+struct mt7915_sta_key_conf {
+	s8 keyidx;
+	u8 key[16];
+};
+
 struct mt7915_sta {
 	struct mt76_wcid wcid; /* must be first */
 
@@ -84,6 +89,8 @@ struct mt7915_sta {
 	struct mt7915_sta_stats stats;
 
 	unsigned long ampdu_state;
+
+	struct mt7915_sta_key_conf bip;
 };
 
 struct mt7915_vif {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
