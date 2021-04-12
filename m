Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EAEC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 05:51:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E9961207
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 05:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E9961207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NmneNiNHzQCnoL4VoGVeXpPhkzwGYFX58Vo6QeolPaU=; b=WbDlIwSA1lBy7k6C7pUFTlbia
	3dfxqAI8oWNux52ruQQK7JLBk9cuRGfBbDMo9BHwIfLFkfhddTPjQ9/zTuA3P3CmzXnBWwC23QexY
	P5Itx29YnHv/EoX1QOG/d3NUEuf6F69NLqUBx95PvnT1T4E82yV/KChzOGyDtUoq25H73PUunr+kk
	JDo/EHxuVZKH/XTDYQicM4fwHLXYi1il2MiZ3IQHqGqyqJlgw3HqAkJFqsZ0EEvjU3exLbtM1eIPJ
	EsRg5Elb/tMT1lljsZGIzLlFhXeh9RO0ava3iK3NPx/EYw7RRmRSErjEmLmCg/iOCSQGpPe7rbgb2
	GWHmaogLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVpTE-005lAC-6i; Mon, 12 Apr 2021 05:50:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVpTB-005l9e-Cn
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 05:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=yBy/htwvq1uqVNGV1wzEH1/hAEd6vwy4yTdXSEVlkpw=; b=0Y0sjQ+Ee393XlNj7WS0wio15O
 w1togtx/WFr6q75AWV+Wz4odSC92Sw2WqMRtv/ysIlTf6S1NjI/eYG1YcRRnGh6rcYZidXk4Xyiq8
 xGgu0Y+f5n2KaxybRe2unWz4vwpianTNjXjCVMUhKwcaVY/pp+rxmYXNKKzQp8y94F/kJWcj4yWCF
 qFXhbXPSeWcjZkqDN55ZAG/y5LIS+kM8LTVihOptijzu0uqjCqas5SHLfueX1C+Ls8NYhIrmVNR1f
 vxPT/klMS2TGdXq5oTbRuEwOHeqaEFUpzYKa0W0zf6htztQHUQGWYdEg75bpE40GvYHRPZY3Uu6JP
 2UTDiRaw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVpT6-005tJV-UG
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 05:50:42 +0000
X-UUID: 2e13a18db28b475ea3ebbe314d96fcdf-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yBy/htwvq1uqVNGV1wzEH1/hAEd6vwy4yTdXSEVlkpw=; 
 b=DSzQ+PF1fW5CvPyPsr1bLuFoW5SHh11O7Z8eSZoo7wU3vpgynX3IXt7jDO3QjcFXxvVhsYwyE+luw+89IMQ1bdWNhBzp6QMWFkE3/qslpUT5aDbeGPKEg2pbE/PtL7aQrPz3355X9KTe3LvptZodyBGvlYdbUGRIHQ0ZT/rCwDQ=;
X-UUID: 2e13a18db28b475ea3ebbe314d96fcdf-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 163001982; Sun, 11 Apr 2021 22:50:37 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 22:40:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH 2/3] mt76: mt7915: rework mt7915_tm_set_tx_len()
Date: Mon, 12 Apr 2021 13:39:53 +0800
Message-ID: <20210412053954.23544-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210412053954.23544-1-shayne.chen@mediatek.com>
References: <20210412053954.23544-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_225041_002807_653381E7 
X-CRM114-Status: GOOD (  11.31  )
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

Rework mt7915_tm_set_tx_len() with mt76_testmode_alloc_skb() to support
larger packet based on a longer tx_time.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index bd798df..f9d81e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -257,13 +257,13 @@ mt7915_tm_set_tx_len(struct mt7915_phy *phy, u32 tx_time)
 {
 	struct mt76_phy *mphy = phy->mt76;
 	struct mt76_testmode_data *td = &mphy->test;
-	struct sk_buff *old = td->tx_skb, *new;
 	struct ieee80211_supported_band *sband;
 	struct rate_info rate = {};
 	u16 flags = 0, tx_len;
 	u32 bitrate;
+	int ret;
 
-	if (!tx_time || !old)
+	if (!tx_time)
 		return 0;
 
 	rate.mcs = td->tx_rate_idx;
@@ -323,21 +323,9 @@ mt7915_tm_set_tx_len(struct mt7915_phy *phy, u32 tx_time)
 	bitrate = cfg80211_calculate_bitrate(&rate);
 	tx_len = bitrate * tx_time / 10 / 8;
 
-	if (tx_len < sizeof(struct ieee80211_hdr))
-		tx_len = sizeof(struct ieee80211_hdr);
-	else if (tx_len > IEEE80211_MAX_FRAME_LEN)
-		tx_len = IEEE80211_MAX_FRAME_LEN;
-
-	new = alloc_skb(tx_len, GFP_KERNEL);
-	if (!new)
-		return -ENOMEM;
-
-	skb_copy_header(new, old);
-	__skb_put_zero(new, tx_len);
-	memcpy(new->data, old->data, sizeof(struct ieee80211_hdr));
-
-	dev_kfree_skb(old);
-	td->tx_skb = new;
+	ret = mt76_testmode_alloc_skb(phy->mt76, tx_len);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
