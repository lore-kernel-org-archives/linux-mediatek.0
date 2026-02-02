Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB374E7C70C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XAiHFASdcnSj6/esay44eO8OXUn72eajlw6VRifcypY=; b=i+ZT+EZbwJiuFP/Ev5K1lSE1a3
	YdXCUdIRzrYuQ/4diDs2ZsutkOuic1zhjLdcoepZZWHr5cBQYwDLlXGpGjtaB/Ny2b8X8nMM6Jdo4
	ukYIscORAzW2cd+4yW7tWo7M2gBbhbpUeOwE7UyGTZLpZjk0APj1REJbXHUZL4yuGWaf7wT38wCcS
	wEVxqsOQ951kceMOam75tM0Uw5qDf0+8sampA+VUuB6gXNCZcEihJJffeARRzL8c9eyvmDFgzCxR2
	8nd4qytbbVdcKnG6ksvhrDRSO+Z/X1bV4iSCinRa2zInBt0PxsqzAM/CBJG7/tWLKWvO01J/jGQst
	rx4XL0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmolR-00000004cWe-3TzM;
	Mon, 02 Feb 2026 07:54:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmolN-00000004cUD-0oQR
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 07:54:26 +0000
X-UUID: 5fff6898000c11f1a16f0188aa809bee-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XAiHFASdcnSj6/esay44eO8OXUn72eajlw6VRifcypY=;
	b=jfBoHWisZCHbXpClPxAt7xg2rEJBEiVT/6ch+3f0ZN+8N3f9rdewimA+EFsV20374Df+/iNcNQtU8w4xl3rxGCZcuOgXoOrKOANjZSnniZ0IWtiEKh3nwGpIhEmpCIA9zUtxoBaBws5bGCLooDnso2IN8CSOScn4GmdLc2/0KOs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:befbaf94-b914-4f51-a80e-9d2d724d3fa6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:877a35e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5fff6898000c11f1a16f0188aa809bee-20260202
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 411636625; Mon, 02 Feb 2026 00:54:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 15:54:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 15:54:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
	<shayne.chen@mediatek.com>
Subject: [PATCH 1/5] wifi: mt76: fix potential deadlock caused by rx_lock
Date: Mon, 2 Feb 2026 15:53:06 +0800
Message-ID: <20260202075311.365673-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_235425_233706_BDA2CF04 
X-CRM114-Status: GOOD (  11.03  )
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

A deadlock will occur if both of the following conditions are met,
because they each attempt to acquire the rx_lock:
- mac80211 receives an unexpected BAR control frame, which triggers
  a BA deletion
- A transmission failure happens due to an abnormality in DMA

Since ieee80211_tx_status_ext() is primarily used to address AQL issues,
avoid potential deadlocks by restricting calls to ieee80211_tx_status_ext
only for data frames.

Fixes: 94e4f5794627 ("mt76: dma: use ieee80211_tx_status_ext to free packets when tx fails")
Reviewed-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 2d133ace7c33..928709f4a206 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -648,6 +648,8 @@ mt76_dma_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 		.skb = skb,
 	};
 	struct mt76_dev *dev = phy->dev;
+	struct ieee80211_tx_info *info;
+	struct ieee80211_hdr *hdr;
 	struct ieee80211_hw *hw;
 	int len, n = 0, ret = -ENOMEM;
 	struct mt76_txwi_cache *t;
@@ -736,9 +738,16 @@ mt76_dma_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 free_skb:
 	status.skb = tx_info.skb;
 	hw = mt76_tx_status_get_hw(dev, tx_info.skb);
-	spin_lock_bh(&dev->rx_lock);
-	ieee80211_tx_status_ext(hw, &status);
-	spin_unlock_bh(&dev->rx_lock);
+	hdr = (struct ieee80211_hdr *)tx_info.skb->data;
+	info = IEEE80211_SKB_CB(tx_info.skb);
+	if ((info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) ||
+	    ieee80211_is_data(hdr->frame_control)) {
+		spin_lock_bh(&dev->rx_lock);
+		ieee80211_tx_status_ext(hw, &status);
+		spin_unlock_bh(&dev->rx_lock);
+	} else {
+		ieee80211_free_txskb(hw, tx_info.skb);
+	}
 
 	return ret;
 }
-- 
2.51.0


