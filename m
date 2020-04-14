Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D612C2BB85
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E300F2074D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lXvUQbwy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MAY8ybAX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E300F2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKZBkJm0QE6eTL/32YUj5dkAN3eQ1aLscGaF1avh1Tk=; b=lXvUQbwy8qQA2j
	kqoMyJ2FDW/gLUR7WWdF3Q8/8GzN02zILntCZt9CLCw5XCBxijYxkEwauQyik4LnrGSKez7MCRBV8
	auybzTfkOub/Vxef0jE1Pzg1zWCmM+ikm85kzZxkZC8IeJK8D7V2+Ldi3uiEjIIk5Vnzoj3mJsLI4
	/6MR0tbfsvkglpSHWyZ2s8j9XB2k0MzgrXFVwnlADwd5NN8iZzlyAIjij3i4dWG6GaGo9yOMF9FwL
	dWvH9dbPditKM5GRsyml4YrvtKmMGfvd+LkWUw9xmt24qMNZhtnN0ToWlQ1A+tkpbJshdQe+H3SQO
	SEs77IgilLwUbtAWfdqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOSgc-0007op-KF; Tue, 14 Apr 2020 21:01:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOSgT-0007cp-AO
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 21:01:31 +0000
X-UUID: 4369aaa951bf4ca1acf509133bc4c978-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=R4UNxlS3PDE1UfNxbLRmAkrZkGkj9T94n61g04lPjas=; 
 b=MAY8ybAXTwo8Ec27E44IQyJCdQeEO8o4e3Ndg57HdzkVau7+Fl5pHUmNFbPPvh9eoCrKVPVevUYFZfm3tzCDWf52bUZqCzobI5ZzdN6eGfZcf91zOdIjNEvYWFkFjfSEAcJpaw/0mWXv8QbZJsztkKbwqlVU+usKQe99Vbcpzqs=;
X-UUID: 4369aaa951bf4ca1acf509133bc4c978-20200414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 725806404; Tue, 14 Apr 2020 13:01:24 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 14:01:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 05:01:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Apr 2020 05:01:18 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 03/18] mt76: add Rx stats support for radiotap
Date: Wed, 15 Apr 2020 05:01:01 +0800
Message-ID: <264f97d8ccbf3f4c28adc1c5751d8b8dd635cbf0.1586895593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586895593.git.ryder.lee@mediatek.com>
References: <cover.1586895593.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_140129_382656_7B2FB084 
X-CRM114-Status: UNSURE (   9.32  )
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

HE deivces need to add Rx radiotap header.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c   |  4 ++--
 drivers/net/wireless/mediatek/mt76/mac80211.c |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index acdbe6f8248d..df25c00d9e06 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -119,7 +119,7 @@ static void
 mt76_rx_aggr_check_ctl(struct sk_buff *skb, struct sk_buff_head *frames)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
-	struct ieee80211_bar *bar = (struct ieee80211_bar *)skb->data;
+	struct ieee80211_bar *bar = mt76_skb_get_hdr(skb);
 	struct mt76_wcid *wcid = status->wcid;
 	struct mt76_rx_tid *tid;
 	u16 seqno;
@@ -147,7 +147,7 @@ mt76_rx_aggr_check_ctl(struct sk_buff *skb, struct sk_buff_head *frames)
 void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *frames)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
 	struct mt76_wcid *wcid = status->wcid;
 	struct ieee80211_sta *sta;
 	struct mt76_rx_tid *tid;
diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 5e795e849990..b76dee2c9632 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -727,7 +727,7 @@ mt76_check_ccmp_pn(struct sk_buff *skb)
 		 * Validate the first fragment both here and in mac80211
 		 * All further fragments will be validated by mac80211 only.
 		 */
-		hdr = (struct ieee80211_hdr *)skb->data;
+		hdr = mt76_skb_get_hdr(skb);
 		if (ieee80211_is_frag(hdr) &&
 		    !ieee80211_is_first_frag(hdr->frame_control))
 			return 0;
@@ -800,7 +800,7 @@ mt76_airtime_flush_ampdu(struct mt76_dev *dev)
 static void
 mt76_airtime_check(struct mt76_dev *dev, struct sk_buff *skb)
 {
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct mt76_wcid *wcid = status->wcid;
 
@@ -837,7 +837,7 @@ static void
 mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
 	struct ieee80211_sta *sta;
 	struct ieee80211_hw *hw;
 	struct mt76_wcid *wcid = status->wcid;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 4f99804ff902..8d27af61b62e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -742,6 +742,25 @@ static inline struct mt76_tx_cb *mt76_tx_skb_cb(struct sk_buff *skb)
 	return ((void *)IEEE80211_SKB_CB(skb)->status.status_driver_data);
 }
 
+static inline void *mt76_skb_get_hdr(struct sk_buff *skb)
+{
+	struct mt76_rx_status mstat;
+	u8 *data = skb->data;
+
+	/* Alignment concerns */
+	BUILD_BUG_ON(sizeof(struct ieee80211_radiotap_he) % 4);
+	BUILD_BUG_ON(sizeof(struct ieee80211_radiotap_he_mu) % 4);
+
+	mstat = *((struct mt76_rx_status *)skb->cb);
+
+	if (mstat.flag & RX_FLAG_RADIOTAP_HE)
+		data += sizeof(struct ieee80211_radiotap_he);
+	if (mstat.flag & RX_FLAG_RADIOTAP_HE_MU)
+		data += sizeof(struct ieee80211_radiotap_he_mu);
+
+	return data;
+}
+
 static inline void mt76_insert_hdr_pad(struct sk_buff *skb)
 {
 	int len = ieee80211_get_hdrlen_from_skb(skb);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
