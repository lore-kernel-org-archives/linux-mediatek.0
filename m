Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE6C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKEBBk8I8E0Ib+tKnKPBklCRbMe9hUzeTsEMpA7lmoI=; b=zLpVPWHOxzWLTAw4cyjMv4GtK6
	H7tPVvPyYLjz+6FWNEjr+EM9T6i+GiBj9iNFquRJHfUBlpbR+DsOXPXxHRnydvXS7DesnvXmcOOle
	6koAFcX3WkfSl2EGb7kN6Qw0EImj7cDYQPdaNRq7GvCkYg+/AZJ5I3Vv6JAn+gSKWogH/E6Xk1Trv
	SRHLEZ8YWifaJI8+oeZ/ql+NNvwa1cfESBVfQEp/6vk+ghio2+NhLvOWzvjZTuZRUBgRsWBaezWFO
	Le8CLtzBiZ8glQrSFU9A5Jv+tY87WWwbop/LmcwXLpx47/1sXb20o6c7/fuZj7trvCen1h8BFLSpl
	dqAdXQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prEbD-000bdG-29;
	Tue, 25 Apr 2023 09:04:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prEb9-000bcp-1R
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 09:04:34 +0000
X-UUID: 2f4c09bae34811edb7d8d11f642b8e78-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GKEBBk8I8E0Ib+tKnKPBklCRbMe9hUzeTsEMpA7lmoI=;
	b=drew8+YS/GWDXqZxzzcCmPjPXo853iA5KH3w4VcLEcBQgcq6wz8TxGjJPsDa/JFbEIF2521+r38bHnmbYdeEH46CS7aKbLe++RK3lM6bZft6u5yK4zusHSc68xdFKqBMygs/nYIA0tIk4fsrTtSynYMxou21FuT01BcolRBGDpA=;
X-CID-CACHE: Type:Local,Time:202304250138-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:14b8ace9-5bb2-4ca6-9c0c-2afe0634de71,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:02d42b85-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 2f4c09bae34811edb7d8d11f642b8e78-20230425
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1281526112; Tue, 25 Apr 2023 02:04:28 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Apr 2023 16:43:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 25 Apr 2023 16:43:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: report non-binding skb tx rate when WED is active
Date: Tue, 25 Apr 2023 16:43:51 +0800
Message-ID: <04be3a596ebf25136ab2e7d9abc602b8f061a9c8.1682412180.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <d9466e4641a7db661058896f4ccd4bba4a9cdb3b.1682412179.git.ryder.lee@mediatek.com>
References: <d9466e4641a7db661058896f4ccd4bba4a9cdb3b.1682412179.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_020431_491662_52FE77E9 
X-CRM114-Status: GOOD (  10.30  )
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

AQL requires tx rate for accurate counting, but it can't work well without
non-binding skb rate reporting when WED is enabled.

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


