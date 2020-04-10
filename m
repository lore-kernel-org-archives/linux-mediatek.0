Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475A4C2BB85
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B672083E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yd61Wg/J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mRLxP2O2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15B672083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqd8kK86QxNS13Emuqg/n5MSxFw0v4SnggYi8b0bbec=; b=Yd61Wg/JlvXH2p
	AjMnOt41AHuR4Ba9HZO1IB1/96cBC2ngCQfNI4v7SQ/vbfJtIW3FCpe7LrfnffaDH0J4r041Ul/W+
	qR3Bw+oMEtCtJn73AV+7KrkiqHZeWheGYUZN1Ay8yNlaPR/GSgir4zEvFdScz4lIVAM9h+PjPusxu
	EQBOljfEKWRjS3geEvPtckWWx5AQ7P82RvHR65VwraHQYd5EdnBbiWd0ce4lfcowGP0LKbDb9S+Rn
	4zum7GCGO+qpos8pwZR5NBDG+uVY8aruv5t9dgKrOcfdOuVVxVc9SKYWe5NO0rRPblRs41XLX6QhE
	oG+3ZJk0pHSdG6weRXnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2VC-0002yM-D1; Fri, 10 Apr 2020 22:51:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2V8-0002vh-GP
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 22:51:55 +0000
X-UUID: 1d630acb6c6d41a5a29c3cff9cdfd22f-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oObplImmavcTva7D2A2N6IVXbjIf17SETkg9WgxQcH4=; 
 b=mRLxP2O2TJWvGUKHhEj+yiUkFNjxwTOOq0I69W/utL5YJabgWW5Q9wjeYRq16CZal7E4XYc/0nYyIRC7s6m2tek8/NPolqk1hp6gTfO6GUqJQ6+HEJMGWcec0/CO8TT9Creogx6TAQw6VtUnwFJmLMCYBr/cOGE9XUWPhKo9xOI=;
X-UUID: 1d630acb6c6d41a5a29c3cff9cdfd22f-20200410
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 804197159; Fri, 10 Apr 2020 14:51:53 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:33 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 02/16] mt76: add support for HE RX rate reporting
Date: Sat, 11 Apr 2020 06:51:17 +0800
Message-ID: <4c05d871befdad461c56d090ddf06bbd3954ef35.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_155154_544657_D652563C 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for encoding and reporting HE RX rates.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt76.h     | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index f44f99184c10..5e795e849990 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -677,7 +677,6 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 		struct ieee80211_hw **hw,
 		struct ieee80211_sta **sta)
 {
-
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct mt76_rx_status mstat;
 
@@ -689,6 +688,9 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 	status->enc_flags = mstat.enc_flags;
 	status->encoding = mstat.encoding;
 	status->bw = mstat.bw;
+	status->he_ru = mstat.he_ru;
+	status->he_gi = mstat.he_gi;
+	status->he_dcm = mstat.he_dcm;
 	status->rate_idx = mstat.rate_idx;
 	status->nss = mstat.nss;
 	status->band = mstat.band;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 36fe163889b8..4f99804ff902 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -458,7 +458,8 @@ struct mt76_rx_status {
 	u16 freq;
 	u32 flag;
 	u8 enc_flags;
-	u8 encoding:2, bw:3;
+	u8 encoding:2, bw:3, he_ru:3;
+	u8 he_gi:2, he_dcm:1;
 	u8 rate_idx;
 	u8 nss;
 	u8 band;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
