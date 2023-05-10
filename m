Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D50C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 04:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt2hHib5mf6xyYGxVJ/P2VnqopjDuIJovEZBziMyC5s=; b=PZvSoKdP1n2SGm4OZzjp4oY+RY
	HSoHvSKBB0L8/4CJ/uKjooNJGUxBvqV9Og4atiLov+VhrxDawSBQTPQg/hQyAItxAG6xpeOqB4oER
	LNBAVZBeSLI5edmRaP+oVAMdarN7I4wx36/DaNN6mm1z0riUBnrFWCaVfY4vK+Skr02qFFg91TKIx
	XWlOAKEWos1EcCRlxFRDjQtN7BARs6MDhlBxwMihK+ZVvk1KShQ8NsO1Isp1e5/3yz3oOw3iXWIKO
	mQGJ71bcp+gzE+5G3C1ZQ6WzA01ULpbF4F+2YXLYob4HsOpd/MZF42+A59W2uQBUtLx9VTS8Z02gi
	VkJocbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpV-0054Tz-12;
	Wed, 10 May 2023 04:53:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpS-0054Sn-1Z
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 04:53:31 +0000
X-UUID: 99c681ceeeee11ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Nt2hHib5mf6xyYGxVJ/P2VnqopjDuIJovEZBziMyC5s=;
	b=MI7iQj2IJfUiUjT3LjAhkhGbo1LcAqyHEMKc6AjasYXx9nAv/5BWUxpeuDZFIqRqmcTHC19QVfjl+7PsNmiQ1sKwQEjYWEcyHAmwJqqlmDSHB0+l9YX016jkPVlhssJZFSqeE6HLS9MwEvyf92vjT+LxZmKA/l5eb7Gm6rKyToU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:c2be4bdb-6f8d-44e3-b14d-7bacd8b7f689,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.24,REQID:c2be4bdb-6f8d-44e3-b14d-7bacd8b7f689,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:178d4d4,CLOUDID:6ea4526b-2f20-4998-991c-3b78627e4938,B
	ulkID:230510125329VBGB7AJ1,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 99c681ceeeee11ed83ed1395ce914268-20230509
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1898103018; Tue, 09 May 2023 21:53:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 12:53:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 12:53:24 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3 4/6] wifi: mt76: report non-binding skb tx rate when WED is active
Date: Wed, 10 May 2023 12:53:19 +0800
Message-ID: <a5d4f6959300fed02c558eaad85ad1f6522712f5.1683681135.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683681134.git.ryder.lee@mediatek.com>
References: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683681134.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215330_553362_550A0FA5 
X-CRM114-Status: GOOD (  11.13  )
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
v3: fill rate info when cb->pktid < MT_PACKET_ID_FIRST
---
 drivers/net/wireless/mediatek/mt76/tx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 99d395bd1bba..54c2beff16aa 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -269,8 +269,17 @@ void __mt76_tx_complete_skb(struct mt76_dev *dev, u16 wcid_idx, struct sk_buff *
 #endif
 
 	if (cb->pktid < MT_PACKET_ID_FIRST) {
+		struct ieee80211_rate_status rs = {};
+
 		hw = mt76_tx_status_get_hw(dev, skb);
 		status.sta = wcid_to_sta(wcid);
+		if (status.sta && (wcid->rate.flags || wcid->rate.legacy)) {
+			rs.rate_idx = wcid->rate;
+			status.rates = &rs;
+			status.n_rates = 1;
+		} else {
+			status.n_rates = 0;
+		}
 		spin_lock_bh(&dev->rx_lock);
 		ieee80211_tx_status_ext(hw, &status);
 		spin_unlock_bh(&dev->rx_lock);
-- 
2.18.0


