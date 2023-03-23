Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0CFC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=53aoUx/eajGfKz5QbYcA0RNXDeeI1Ths6w7UfrzctiM=; b=gb4UApgu8yAWcNGNueL1O61llZ
	7xIQ4HP+/x71RdehZJNTwbGXFs7lkBwWM9ImOA69zca/BP866Pe+CYsuaKhiqyT4SE4YcuPlQpMUu
	4vNLfdKDIak2Dq4Md8GV2OGQYRe+/2y0w2eD2WwDeL+C8XTC1QudRg1vqMRSyd/c6nUqOmTg1+kfK
	tBi454PVPVGWL2GNySWG3PiHFX6oGm8G0FBbmJFFglZeLOr21yi0GHSkR8kAwQ7/XBGqy7dkbaWTj
	yv4lsO5Tw8hCIral3Y+drhjSFVvkBE543MUJv72SRdGH+1gmGeyQmSl4A3zxo1nUuKoyP5isttFHH
	PEU3fE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKxn-0022qE-2y;
	Thu, 23 Mar 2023 13:26:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKxf-0022oV-30
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Mar 2023 13:26:39 +0000
X-UUID: 4e8062a6c97e11ed8687db9d93187ff1-20230323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=53aoUx/eajGfKz5QbYcA0RNXDeeI1Ths6w7UfrzctiM=;
	b=S6mCwEE955e0WZuogwkT0f0IspgQ9VXYmky1EDlDR4FI9b2XxHLXcgAJOYmTI6dbWLYS1l1kf/M4LDl8f4dW/Fe+K2FC5dRIutQG3PKqcrETmRAeKb5ipuPYaAA1ziwS5KG1Hg/+N9E+36Qc7DCjZBTOhvIAjS81GeJYMRkh4lU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:1052a287-6d81-4d59-88d3-b642f457b900,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:e75128b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 4e8062a6c97e11ed8687db9d93187ff1-20230323
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1952796915; Thu, 23 Mar 2023 06:26:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 23 Mar 2023 21:26:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 23 Mar 2023 21:26:21 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: fix 6GHz high channel not be scanned
Date: Thu, 23 Mar 2023 21:26:12 +0800
Message-ID: <81dd14e7cf0da4ef770b807d9d8801d5ad3b2261.1679576520.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_062635_979313_7729B879 
X-CRM114-Status: GOOD (  12.11  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

mt76 scan command only support 64 channels currently. If the
channel count is larger than 64(for 2+5+6GHz), some channels will
not be scanned. Hence change the scan type to full channel scan
in case of the command cannot include proper list for chip.

Fixes: 399090ef9605 ("mt76: mt76_connac: move hw_scan and sched_scan routine in mt76_connac_mcu module")
Reported-by: Ben Greear <greearb@candelatech.com>
Tested-by: Isaac Konikoff <konikofi@candelatech.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index efb9bfaa187f..01f9c080d889 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1675,8 +1675,16 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	req->channel_min_dwell_time = cpu_to_le16(duration);
 	req->channel_dwell_time = cpu_to_le16(duration);
 
-	req->channels_num = min_t(u8, sreq->n_channels, 32);
-	req->ext_channels_num = min_t(u8, ext_channels_num, 32);
+	if (sreq->n_channels == 0 || sreq->n_channels > 64) {
+		req->channel_type = 0;
+		req->channels_num = 0;
+		req->ext_channels_num = 0;
+	} else {
+		req->channel_type = 4;
+		req->channels_num = min_t(u8, sreq->n_channels, 32);
+		req->ext_channels_num = min_t(u8, ext_channels_num, 32);
+	}
+
 	for (i = 0; i < req->channels_num + req->ext_channels_num; i++) {
 		if (i >= 32)
 			chan = &req->ext_channels[i - 32];
@@ -1696,7 +1704,6 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		}
 		chan->channel_num = scan_list[i]->hw_value;
 	}
-	req->channel_type = sreq->n_channels ? 4 : 0;
 
 	if (sreq->ie_len > 0) {
 		memcpy(req->ies, sreq->ie, sreq->ie_len);
-- 
2.18.0


