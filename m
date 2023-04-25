Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF95CC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4FvWSqMiOBPOzhODz7wI+80TVwIjGjbEnBS1kGAvbo=; b=yGuq3zIwFtD0aHc2SzjFDsCrlw
	OWO5TWkpfY+qdQPWikUplP4YShYO+kT1N7XOyKzap3bWV1cAMVwI0I8Cc9vVXebPbEfxCBt7Rdk4z
	bTDnMtkF0lJxCOELjBtj1oT4FYqZDbuJsHJrkwdaf4ueD+mfHNRBu1iyztgsTU/p2fKsdQxo4fnpO
	XBK4X6M6W3DR0PRWOMuvNa7l8vjeUHxZpx1Bq+xvS0s/5OAvEjuYz0RvheUswXEZrMmcYy924VWh8
	Lkiy//Zh1wveiadTPMUZ8F8WDZ6/dM8eaaZFDY2lHpAFIX7bXOrqxlP6E88U/g0lL9IsN28QMyE3Q
	8UgOyzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prNTF-001xBX-2X;
	Tue, 25 Apr 2023 18:32:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prNTC-001xB2-1k
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 18:32:55 +0000
X-UUID: 954e65cee39711edb7d8d11f642b8e78-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s4FvWSqMiOBPOzhODz7wI+80TVwIjGjbEnBS1kGAvbo=;
	b=l8BaiqUj1e7cgLT5rXqEliiSHAUklFpAjYaZtWhiEliKOvsXjJ0yQdjRJVM6YjUthkninA0JCgTKgG8K5zm2Iz/4qEtM8LTccop1mr089EN4pAVPYfe3d+WkRNa61PPn/E05401kADU46NwoGFp0CmqxUW88wkUtRitlRPyqK48=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:338eedc8-f78a-4987-9516-e171c5bb8e30,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:338eedc8-f78a-4987-9516-e171c5bb8e30,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:ecbb3785-cd9c-45f5-8134-710979e3df0e,B
	ulkID:230426023224SYFO5X4A,BulkQuantity:4,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 954e65cee39711edb7d8d11f642b8e78-20230425
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1754987251; Tue, 25 Apr 2023 11:32:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Apr 2023 02:32:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 02:32:17 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 3/3] wifi: mt76: report non-binding skb tx rate when WED is active
Date: Wed, 26 Apr 2023 02:32:15 +0800
Message-ID: <f03e33083a828466106da818fb0d9c1e074b418d.1682446940.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <8febf5d1f44e7f0b1e9f6ca099bd5ffcc8816f86.1682446940.git.ryder.lee@mediatek.com>
References: <8febf5d1f44e7f0b1e9f6ca099bd5ffcc8816f86.1682446940.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_113254_748522_70D3CD50 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Chiu <chui-hao.chiu@mediatek.com>

AQL relies on accurate tx rate reporting, so add this patch for
non-binding skb rate when WED is enabled.

Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 99d395bd1bba..37337595c65d 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -269,8 +269,22 @@ void __mt76_tx_complete_skb(struct mt76_dev *dev, u16 wcid_idx, struct sk_buff *
 #endif
 
 	if (cb->pktid < MT_PACKET_ID_FIRST) {
+		struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+		struct ieee80211_rate_status rs = {};
+
 		hw = mt76_tx_status_get_hw(dev, skb);
 		status.sta = wcid_to_sta(wcid);
+		if (mtk_wed_device_active(&dev->mmio.wed) &&
+		    (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS)) {
+			info->status.rates[0].idx = -1;
+			if (status.sta && (wcid->rate.flags || wcid->rate.legacy)) {
+				rs.rate_idx = wcid->rate;
+				status.rates = &rs;
+				status.n_rates = 1;
+			} else {
+				status.n_rates = 0;
+			}
+		}
 		spin_lock_bh(&dev->rx_lock);
 		ieee80211_tx_status_ext(hw, &status);
 		spin_unlock_bh(&dev->rx_lock);
-- 
2.18.0


