Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B412C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FB9617E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0FB9617E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xco1mKvRsIxEa4gBglp92fJvV5AsEeSfR75xgg4kKAU=; b=uVAO1oc7YAX0Mg
	C6iTKDJBKHU2NzyVgib7h5lc54wl02BoImo7TwBdmmNezFS+nOyQkP/syiSZzA0WkDCwS4w0GZR+R
	ObyuynqmPi718sSEuG+VnV4M6bAM5tnSoTSY3KnXYomiwuIFK4COP7Ro7ZSTlZSoR2VUUOVJxdv8T
	32Vxv+pEOZCCKJ2UE26Eq43Yr8Wgj+7wJGy5zsKEqIK7FeSz7toLFOghnlUr+s58h7A8mTmppyj6O
	CxkYhzocVhddb8CkmVcKCT/a3iiakBPV9THQyTS+wUblec3hTpjnPfhi/KmerIRyZ1FEDLbWh29tr
	o6xsUtuwJu6P8RY902AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqdu-00DDCG-Lc; Thu, 30 Sep 2021 07:38:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqdq-00DDBm-Oe
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 07:38:08 +0000
X-UUID: 11b9194e26b6418a8cfd9a4092c66943-20210930
X-UUID: 11b9194e26b6418a8cfd9a4092c66943-20210930
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xing.song@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1517599903; Thu, 30 Sep 2021 00:38:00 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 00:37:58 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Sep 2021 15:37:41 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 30 Sep 2021 15:37:41 +0800
From: Xing Song <xing.song@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Xing Song <xing.song@mediatek.com>
Subject: [PATCH] mt76: use a separate CCMP PN receive counter for management
 frames
Date: Thu, 30 Sep 2021 15:37:37 +0800
Message-ID: <20210930073737.146789-1-xing.song@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3A44D0BB44E9B51AC5356A502F2DFBDAEF6EBEC57AAB601A95621F9D3F742AC92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_003806_827158_CCFF83E2 
X-CRM114-Status: GOOD (  14.30  )
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

When received frame is decryped by hardware, CCMP PN is checked by
mt76.

When management frame protection (IEEE 802.11w) is used, we must use
a separate counter for tracking received CCMP packet number for the
management frames. The previously used counter was shared with data
frames and that can cause problems in detecting replays incorrectly
for robust management frames.

Add a new counter just for robust management frames to avoid this
issue.

Signed-off-by: Xing Song <xing.song@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 27 ++++++++++++++++---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index bbe7ba64ccd2..419b8e75739a 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -788,10 +788,17 @@ void mt76_wcid_key_setup(struct mt76_dev *dev, struct mt76_wcid *wcid,
 		return;
 
 	wcid->rx_check_pn = true;
+
+	/* data frame */
 	for (i = 0; i < IEEE80211_NUM_TIDS; i++) {
 		ieee80211_get_key_rx_seq(key, i, &seq);
 		memcpy(wcid->rx_key_pn[i], seq.ccmp.pn, sizeof(seq.ccmp.pn));
 	}
+
+	/* robust management frame */
+	ieee80211_get_key_rx_seq(key, -1, &seq);
+	memcpy(wcid->rx_key_pn[i], seq.ccmp.pn, sizeof(seq.ccmp.pn));
+
 }
 EXPORT_SYMBOL(mt76_wcid_key_setup);
 
@@ -844,7 +851,7 @@ mt76_check_ccmp_pn(struct sk_buff *skb)
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct mt76_wcid *wcid = status->wcid;
 	struct ieee80211_hdr *hdr;
-	u8 tidno = status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
+	int security_idx;
 	int ret;
 
 	if (!(status->flag & RX_FLAG_DECRYPTED))
@@ -853,24 +860,36 @@ mt76_check_ccmp_pn(struct sk_buff *skb)
 	if (!wcid || !wcid->rx_check_pn)
 		return 0;
 
+	hdr = mt76_skb_get_hdr(skb);
 	if (!(status->flag & RX_FLAG_IV_STRIPPED)) {
 		/*
 		 * Validate the first fragment both here and in mac80211
 		 * All further fragments will be validated by mac80211 only.
 		 */
-		hdr = mt76_skb_get_hdr(skb);
 		if (ieee80211_is_frag(hdr) &&
 		    !ieee80211_is_first_frag(hdr->frame_control))
 			return 0;
 	}
 
+	/* IEEE 802.11-2020, 12.5.3.4.4 "PN and replay detection" c):
+	 *
+	 * the recipient shall maintain a single replay counter for received
+	 * individually addressed robust Management frames that are received
+	 * with the To DS subfield equal to 0, [...]
+	 */
+	if (ieee80211_is_mgmt(hdr->frame_control) &&
+	    !ieee80211_has_tods(hdr->frame_control))
+		security_idx = IEEE80211_NUM_TIDS;
+	else
+		security_idx = status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
+
 	BUILD_BUG_ON(sizeof(status->iv) != sizeof(wcid->rx_key_pn[0]));
-	ret = memcmp(status->iv, wcid->rx_key_pn[tidno],
+	ret = memcmp(status->iv, wcid->rx_key_pn[security_idx],
 		     sizeof(status->iv));
 	if (ret <= 0)
 		return -EINVAL; /* replay */
 
-	memcpy(wcid->rx_key_pn[tidno], status->iv, sizeof(status->iv));
+	memcpy(wcid->rx_key_pn[security_idx], status->iv, sizeof(status->iv));
 
 	if (status->flag & RX_FLAG_IV_STRIPPED)
 		status->flag |= RX_FLAG_PN_VALIDATED;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 783ea555fa60..104a01704208 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -255,7 +255,7 @@ struct mt76_wcid {
 	u8 amsdu:1;
 
 	u8 rx_check_pn;
-	u8 rx_key_pn[IEEE80211_NUM_TIDS][6];
+	u8 rx_key_pn[IEEE80211_NUM_TIDS + 1][6];
 	u16 cipher;
 
 	u32 tx_info;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
