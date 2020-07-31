Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AC2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 22:24:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C144522B3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 22:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zY1XNYGg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lQXqXmC1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C144522B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PTtxrzTdOWfi5Xu/eIwNL0xYMKU2rhDMV7ph3R10jPI=; b=zY1XNYGg87eONTadqHxCCoP9u5
	Fw1c/czSduKqOj7ZaeVcIbyWmRBJWpWSnqV2EPDCBkg0ORUuoST1Vx25npjy2l2utou20cGRiP+58
	ZxIvrfsWHg0WL12iJV7WV8+k3Kk//MZAXlXkx6EytHV9b26BDbuXXxSVPJbEwwmvl10qbBnVNufSw
	WcGmbIxfm+TEUVEHyX9TL46lXfmUJHQFL/BLK1HJaomr8ylNmjhanJfr2AQFGaoeSx/o2pzrPgDJp
	+bbudqV9RmXCpbgpsN0n8MsusnBZYfUTfxo8j5iPy31tRR/eWJhJRdUVrcvtmQtG+DFEWWICLN02g
	7RUvCaDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1dS3-0002hB-IV; Fri, 31 Jul 2020 22:24:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1dS1-0002fC-6z
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 22:24:30 +0000
X-UUID: 5ef82f0b124e41bb9e2e46b03c1409f9-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xnz7ZONKdY2puDtlW4rbgiCv9EsKBL6SG/bcd3ZFP3s=; 
 b=lQXqXmC13T42f8MJ/+rrR96mp7hTH0jM/sEw+175SzSntL4bRJx3AbKJQ1BCiufbqQGVDZ6eNiFmYCWilE918nROW7HqB5QDm220HkSAe1eW7S6/UVKRA75q6PQJWugPSrxtihTtK/ebKd1s/LgO3F2lZkVZDa3ajKWVi7jLpmQ=;
X-UUID: 5ef82f0b124e41bb9e2e46b03c1409f9-20200731
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1903940900; Fri, 31 Jul 2020 14:24:19 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 15:24:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 1 Aug 2020 06:24:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 1 Aug 2020 06:24:17 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: enable U-APSD on AP side
Date: Sat, 1 Aug 2020 06:24:15 +0800
Message-ID: <c95b963ca2fad59b73ec3b4ccf3ca109ac5e5f63.1596173828.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 543531E0BD19A8784F58EB00277F76E37F990FE80C7FC417E504666826EF4D1A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_182429_465446_9AE320F2 
X-CRM114-Status: GOOD (  11.92  )
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

Enable U-APSD support for AP interface.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 39 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 12 ++++++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 1ffb9eebcf1c..01fa9ca31d0e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1440,6 +1440,38 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	he->pkt_ext = 2;
 }
 
+static void
+mt7915_mcu_sta_uapsd_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
+		     struct ieee80211_vif *vif)
+{
+	struct sta_rec_uapsd *uapsd;
+	struct tlv *tlv;
+
+	if (vif->type != NL80211_IFTYPE_AP || !sta->wme)
+		return;
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_APPS, sizeof(*uapsd));
+	uapsd = (struct sta_rec_uapsd *)tlv;
+
+	if (sta->uapsd_queues & IEEE80211_WMM_IE_STA_QOSINFO_AC_VO) {
+		uapsd->dac_map |= BIT(3);
+		uapsd->tac_map |= BIT(3);
+	}
+	if (sta->uapsd_queues & IEEE80211_WMM_IE_STA_QOSINFO_AC_VI) {
+		uapsd->dac_map |= BIT(2);
+		uapsd->tac_map |= BIT(2);
+	}
+	if (sta->uapsd_queues & IEEE80211_WMM_IE_STA_QOSINFO_AC_BE) {
+		uapsd->dac_map |= BIT(1);
+		uapsd->tac_map |= BIT(1);
+	}
+	if (sta->uapsd_queues & IEEE80211_WMM_IE_STA_QOSINFO_AC_BK) {
+		uapsd->dac_map |= BIT(0);
+		uapsd->tac_map |= BIT(0);
+	}
+	uapsd->max_sp = sta->max_sp;
+}
+
 static void
 mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 {
@@ -1513,7 +1545,7 @@ mt7915_mcu_add_mu(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 static void
 mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
-		   struct ieee80211_sta *sta)
+		   struct ieee80211_sta *sta, struct ieee80211_vif *vif)
 {
 	struct tlv *tlv;
 
@@ -1540,6 +1572,9 @@ mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	/* starec he */
 	if (sta->he_cap.has_he)
 		mt7915_mcu_sta_he_tlv(skb, sta);
+
+	/* starec uapsd */
+	mt7915_mcu_sta_uapsd_tlv(skb, sta, vif);
 }
 
 static void
@@ -2176,7 +2211,7 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 	mt7915_mcu_sta_basic_tlv(skb, vif, sta, enable);
 	if (enable && sta)
-		mt7915_mcu_sta_tlv(dev, skb, sta);
+		mt7915_mcu_sta_tlv(dev, skb, sta, vif);
 
 	sta_wtbl = mt7915_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index cb35e718409a..a4600860fbf7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -645,6 +645,17 @@ struct sta_rec_vht {
 	u8 rsv[3];
 } __packed;
 
+struct sta_rec_uapsd {
+	__le16 tag;
+	__le16 len;
+	u8 dac_map;
+	u8 tac_map;
+	u8 max_sp;
+	u8 rsv0;
+	__le16 listen_interval;
+	u8 rsv1[2];
+} __packed;
+
 struct sta_rec_muru {
 	__le16 tag;
 	__le16 len;
@@ -951,6 +962,7 @@ enum {
 					 sizeof(struct sta_rec_he) +	\
 					 sizeof(struct sta_rec_ba) +	\
 					 sizeof(struct sta_rec_vht) +	\
+					 sizeof(struct sta_rec_uapsd) + \
 					 sizeof(struct tlv) +		\
 					 MT7915_WTBL_UPDATE_MAX_SIZE)
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
