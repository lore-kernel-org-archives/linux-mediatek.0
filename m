Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AFEC47DD6
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QfBJh/G27e2/TM1jxbBhY/qC7WJr1g5LZzWtbcjgAfw=; b=xKs6bXLVBjAhDyRsAiVl2y8wf3
	fHXF1OrS4DTBBSZzkA1o65tWsjUahI+HNi2JDS5Bf//eQSGSIKDumGtd3L1JeriRCb7RlyHfAUQ8F
	KO/eq2OyJgz32yYPb/rqV6Nq6idb8OYJF5TDSJ8td/4/6pxz0VvTlYKeEcTMGjrjfLSPWmTuo8BA1
	YE3iNUeHFR/s7bqhuRjdZXf7X5YXt6B4qbi5lvuSfr2sf0bOcz/+P1+5XX7lQx2HNK3Ta6X/6/fJz
	yxR7bNDeNc00+cpem5PSJmxBCUXFhU4f4WQzU7nAPGmrXgwWRW/8gIH7EN8gk4nnTJ/gh0Re3Z6x+
	dd4FcG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkhk-004uK3-0o;
	Fri, 19 Jan 2024 08:58:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkhh-004uI9-1Q
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jan 2024 08:58:22 +0000
X-UUID: e16decc4b6a811eea0bf134e88e6c2dc-20240119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QfBJh/G27e2/TM1jxbBhY/qC7WJr1g5LZzWtbcjgAfw=;
	b=N3f9ml0/WZu7P1F6eqpfQXvavxnkJRceCQjkFmvBuNshR7mwCS0mqxUDi1ynU+7+Qfi06PnHTyKDxH96qc4hxdVgOAKAbYygrMB+ntRrxt1b0471B9ypitDL/8eOP1oKYAD+u1HVRG4z4hYCOxgjfdvOHb1qYULDi4z94wp6caI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:10237308-10af-4472-a2ad-868bd137f2de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:246d0783-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e16decc4b6a811eea0bf134e88e6c2dc-20240119
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1701614729; Fri, 19 Jan 2024 01:58:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jan 2024 16:57:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jan 2024 16:57:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 01/12] wifi: mt76: mt7996: check txs format before getting skb by pid
Date: Fri, 19 Jan 2024 16:56:57 +0800
Message-ID: <20240119085708.23592-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_005821_494583_5F43D588 
X-CRM114-Status: GOOD (  12.82  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

The PPDU TXS does not include the error bit so it cannot use to report
status to mac80211. This patch fixes issue that STA wrongly detects if AP
is still alive.

Fixes: 2569ea5326e2 ("wifi: mt76: mt7996: enable PPDU-TxS to host")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 53258488d49f..a8414fbb07c8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1188,25 +1188,28 @@ mt7996_mac_add_txs_skb(struct mt7996_dev *dev, struct mt76_wcid *wcid,
 	struct ieee80211_tx_info *info;
 	struct sk_buff_head list;
 	struct rate_info rate = {};
-	struct sk_buff *skb;
+	struct sk_buff *skb = NULL;
 	bool cck = false;
 	u32 txrate, txs, mode, stbc;
 
 	txs = le32_to_cpu(txs_data[0]);
 
 	mt76_tx_status_lock(mdev, &list);
-	skb = mt76_tx_status_skb_get(mdev, wcid, pid, &list);
 
-	if (skb) {
-		info = IEEE80211_SKB_CB(skb);
-		if (!(txs & MT_TXS0_ACK_ERROR_MASK))
-			info->flags |= IEEE80211_TX_STAT_ACK;
+	/* only report MPDU TXS */
+	if (le32_get_bits(txs_data[0], MT_TXS0_TXS_FORMAT) == 0) {
+		skb = mt76_tx_status_skb_get(mdev, wcid, pid, &list);
+		if (skb) {
+			info = IEEE80211_SKB_CB(skb);
+			if (!(txs & MT_TXS0_ACK_ERROR_MASK))
+				info->flags |= IEEE80211_TX_STAT_ACK;
 
-		info->status.ampdu_len = 1;
-		info->status.ampdu_ack_len =
-			!!(info->flags & IEEE80211_TX_STAT_ACK);
+			info->status.ampdu_len = 1;
+			info->status.ampdu_ack_len =
+				!!(info->flags & IEEE80211_TX_STAT_ACK);
 
-		info->status.rates[0].idx = -1;
+			info->status.rates[0].idx = -1;
+		}
 	}
 
 	if (mtk_wed_device_active(&dev->mt76.mmio.wed) && wcid->sta) {
-- 
2.39.2


