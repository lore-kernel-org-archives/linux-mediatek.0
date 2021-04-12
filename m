Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E8FC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 05:41:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089E96120B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 05:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 089E96120B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3J1HlGmTsrqKJ1UCXjgODojdH+kBDqtTYwrcGzI1//g=; b=O22OcQSUXLPmLQIC1Rik/9p5W
	Md46VpPsFL3JB3Jv6vXp5kVHVY/tiuxlLwePbkj6lAwmhr12dmb/DIqnaKwswcBoiLc8EruFnDB6N
	nZz5ZV2mmkQCXv3UIZwBJTd2J7j9K6UFSotWU+YXzKW2B84CN80oV0G+P1Qm5g7TakzL3BWa7DgMQ
	YNC34GM7UZS8ZJpNpNd8Js7HG8QRk20F50RZE07Ms6oWcTReclM8/+TG1g8Rmt0ySBo9u5BtLBuWs
	/qtcNgax0Lj0CYeiRsMHb9d5MUEyJyONxlNcRE06FS7thJ8OhSmTTtIJbn56TfCgzmpnxbkKEDO+U
	nPV57m6hg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVpJb-005kMT-Un; Mon, 12 Apr 2021 05:40:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVpJX-005kMD-Tf
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 05:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=EvNUioMPOu1eqoGAktz1vLw0fu0i4e/YhO7DqM/qQhU=; b=1jgMi5fRz3X+nGNfKRS4kgqeMo
 PtjhdFi3MFe1kLcGyTzMnKAVStwbCC213ZPxDZEvub+ClinDbwpOCYFWgGcF8Kax1dAaKO7GmlW0p
 h0lZJ6hAK74+OPCTdHwl9LE7vcbVJX8CYK83FtnLOV6KdTXIiJW2XfWKtr/B8cqz0igb5g5lq003O
 HpY/yUBdt/U78PRxwD0TRrsDquA/SJ8GHOHnHgK5AIPQail8YRaVfIE6t7wAtCl7SNwV6WybfIM5r
 yAlC4BcbT7lKhlWmt4ERj6Cn8O9Qvc/I6WrcSruhNAaIPwqmUVVaEduKuTMLs/e+5jNAeXEjsT8FF
 rWvclBew==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVpJU-005t9Y-9G
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 05:40:45 +0000
X-UUID: 9717cfaa0328407985a2911013da773f-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EvNUioMPOu1eqoGAktz1vLw0fu0i4e/YhO7DqM/qQhU=; 
 b=aywKW3UU7GwwMgSl6PDssy6LWtixf9kL84/IPDO5kUr0GHjCoeIc1JyJ0wLZpEyTeMtDDNyVKBf/e1bUrYQboTVCMYXSc8YejjzDtQdMc9QDV1AY/uTsGc0VSgQEGDyvhYoGj8evhCeD7fSs6er6f+At+Mv3L6VuaI2fyUQM8Wg=;
X-UUID: 9717cfaa0328407985a2911013da773f-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1903116664; Sun, 11 Apr 2021 22:40:37 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 22:40:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 13:40:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Apr 2021 13:40:33 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/3] mt76: mt7915: fix rate setting of tx descriptor in
 testmode
Date: Mon, 12 Apr 2021 13:39:54 +0800
Message-ID: <20210412053954.23544-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210412053954.23544-1-shayne.chen@mediatek.com>
References: <20210412053954.23544-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_224044_346184_96986F6A 
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

Fix ofdm rate index and ldpc setting in rate setting field of tx
descriptor.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 3f3bfea..f99c269 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -661,19 +661,18 @@ mt7915_mac_write_txwi_tm(struct mt7915_phy *phy, __le32 *txwi,
 {
 #ifdef CONFIG_NL80211_TESTMODE
 	struct mt76_testmode_data *td = &phy->mt76->test;
+	const struct ieee80211_rate *r;
+	u8 bw, mode, nss = td->tx_rate_nss;
 	u8 rate_idx = td->tx_rate_idx;
-	u8 nss = td->tx_rate_nss;
-	u8 bw, mode;
 	u16 rateval = 0;
 	u32 val;
+	bool cck = false;
+	int band;
 
 	if (skb != phy->mt76->test.tx_skb)
 		return;
 
 	switch (td->tx_rate_mode) {
-	case MT76_TM_TX_MODE_CCK:
-		mode = MT_PHY_TYPE_CCK;
-		break;
 	case MT76_TM_TX_MODE_HT:
 		nss = 1 + (rate_idx >> 3);
 		mode = MT_PHY_TYPE_HT;
@@ -693,7 +692,20 @@ mt7915_mac_write_txwi_tm(struct mt7915_phy *phy, __le32 *txwi,
 	case MT76_TM_TX_MODE_HE_MU:
 		mode = MT_PHY_TYPE_HE_MU;
 		break;
+	case MT76_TM_TX_MODE_CCK:
+		cck = true;
+		fallthrough;
 	case MT76_TM_TX_MODE_OFDM:
+		band = phy->mt76->chandef.chan->band;
+		if (band == NL80211_BAND_2GHZ && !cck)
+			rate_idx += 4;
+
+		r = &phy->mt76->hw->wiphy->bands[band]->bitrates[rate_idx];
+		val = cck ? r->hw_value_short : r->hw_value;
+
+		mode = val >> 8;
+		rate_idx = val & 0xff;
+		break;
 	default:
 		mode = MT_PHY_TYPE_OFDM;
 		break;
@@ -748,9 +760,10 @@ mt7915_mac_write_txwi_tm(struct mt7915_phy *phy, __le32 *txwi,
 	if (mode >= MT_PHY_TYPE_HE_SU)
 		val |= FIELD_PREP(MT_TXD6_HELTF, td->tx_ltf);
 
-	if (td->tx_rate_ldpc || bw > 0)
+	if (td->tx_rate_ldpc || (bw > 0 && mode >= MT_PHY_TYPE_HE_SU))
 		val |= MT_TXD6_LDPC;
 
+	txwi[3] &= ~cpu_to_le32(MT_TXD3_SN_VALID);
 	txwi[6] |= cpu_to_le32(val);
 	txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX,
 					  phy->test.spe_idx));
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
