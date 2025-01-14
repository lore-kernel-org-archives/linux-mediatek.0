Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD364C02184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZz/0IpmNdfWsDGsFwwv59akzDPBITWuCxkPMSi/v5E=; b=2zeVaj+kJ6uz8ef+FaxosveXMF
	KoEVF9MN7tSaBC7IASxVAuM6i/9uDOQOROug6OoKsRzjX+1BSchur1CkIsDB28tLNwyoatp3pIzaP
	ng+3NM1WxAi1Cb7OL/pW3PsBAf47ZPiE+ohazIXVYtqhRKDQ5loqcCMhX+iJGy4JWJKi1pw+TBe8g
	WNAV+M94t9PCkG9wYVPrd6JKFE9eJHvpptgBoPfp9gTQNSZD6KqBNVNPx5h853W669v4kXqfW0QN8
	1ERP+EBA6jl6tGZB/rJ/jCkFi6ZRiwph1xRDQ0qq7KkGmKDv/KCUQv2P9AlKd20AID10ueTfi38EZ
	6BFkWYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdu1-0000000833V-41jo;
	Tue, 14 Jan 2025 10:12:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdtl-000000082xV-1gyb
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 10:11:51 +0000
X-UUID: f3a967a0d25f11ef82ff63e91e7eb18c-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hZz/0IpmNdfWsDGsFwwv59akzDPBITWuCxkPMSi/v5E=;
	b=X3+SUroY58aJOjD4ME/rNVum74pxupzDjDxnJwPS4F3lwReS9i8VTMluLHVh1mZK+sClM34F9biW5LkfqVtpuMzrBQBQYBv4UAGOI+Zc1svknb6X9Gm5N7XRU36rHHmFHP2o9ZPnC0qzGuCPkfYkNQUHRVKAW9tbl5fbioHwdRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:912cd8d0-51a5-4a1a-bfa2-6002527a43c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:96d4dc37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f3a967a0d25f11ef82ff63e91e7eb18c-20250114
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 357096134; Tue, 14 Jan 2025 03:11:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 18:11:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 18:11:39 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 4/9] wifi: mt76: mt7996: fix incorrect indexing of MIB FW event
Date: Tue, 14 Jan 2025 18:10:21 +0800
Message-ID: <20250114101026.3587702-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114101026.3587702-1-shayne.chen@mediatek.com>
References: <20250114101026.3587702-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_021149_453880_5FDA1FBE 
X-CRM114-Status: GOOD (  11.78  )
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

From: Benjamin Lin <benjamin-jw.lin@mediatek.com>

Fix wrong calculation of the channel times due to incorrect
interpretation from the FW event.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 45 ++++++++++++-------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 58fc06a69539..9fb54388d975 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3678,6 +3678,13 @@ int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap)
 
 int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 {
+	enum {
+		IDX_TX_TIME,
+		IDX_RX_TIME,
+		IDX_OBSS_AIRTIME,
+		IDX_NON_WIFI_TIME,
+		IDX_NUM
+	};
 	struct {
 		struct {
 			u8 band;
@@ -3687,16 +3694,15 @@ int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 			__le16 tag;
 			__le16 len;
 			__le32 offs;
-		} data[4];
+		} data[IDX_NUM];
 	} __packed req = {
 		.hdr.band = phy->mt76->band_idx,
 	};
-	/* strict order */
 	static const u32 offs[] = {
-		UNI_MIB_TX_TIME,
-		UNI_MIB_RX_TIME,
-		UNI_MIB_OBSS_AIRTIME,
-		UNI_MIB_NON_WIFI_TIME,
+		[IDX_TX_TIME] = UNI_MIB_TX_TIME,
+		[IDX_RX_TIME] = UNI_MIB_RX_TIME,
+		[IDX_OBSS_AIRTIME] = UNI_MIB_OBSS_AIRTIME,
+		[IDX_NON_WIFI_TIME] = UNI_MIB_NON_WIFI_TIME,
 	};
 	struct mt76_channel_state *state = phy->mt76->chan_state;
 	struct mt76_channel_state *state_ts = &phy->state_ts;
@@ -3705,7 +3711,7 @@ int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 	struct sk_buff *skb;
 	int i, ret;
 
-	for (i = 0; i < 4; i++) {
+	for (i = 0; i < IDX_NUM; i++) {
 		req.data[i].tag = cpu_to_le16(UNI_CMD_MIB_DATA);
 		req.data[i].len = cpu_to_le16(sizeof(req.data[i]));
 		req.data[i].offs = cpu_to_le32(offs[i]);
@@ -3724,17 +3730,24 @@ int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 		goto out;
 
 #define __res_u64(s) le64_to_cpu(res[s].data)
-	state->cc_tx += __res_u64(1) - state_ts->cc_tx;
-	state->cc_bss_rx += __res_u64(2) - state_ts->cc_bss_rx;
-	state->cc_rx += __res_u64(2) + __res_u64(3) - state_ts->cc_rx;
-	state->cc_busy += __res_u64(0) + __res_u64(1) + __res_u64(2) + __res_u64(3) -
+	state->cc_tx += __res_u64(IDX_TX_TIME) - state_ts->cc_tx;
+	state->cc_bss_rx += __res_u64(IDX_RX_TIME) - state_ts->cc_bss_rx;
+	state->cc_rx += __res_u64(IDX_RX_TIME) +
+			__res_u64(IDX_OBSS_AIRTIME) -
+			state_ts->cc_rx;
+	state->cc_busy += __res_u64(IDX_TX_TIME) +
+			  __res_u64(IDX_RX_TIME) +
+			  __res_u64(IDX_OBSS_AIRTIME) +
+			  __res_u64(IDX_NON_WIFI_TIME) -
 			  state_ts->cc_busy;
-
 out:
-	state_ts->cc_tx = __res_u64(1);
-	state_ts->cc_bss_rx = __res_u64(2);
-	state_ts->cc_rx = __res_u64(2) + __res_u64(3);
-	state_ts->cc_busy = __res_u64(0) + __res_u64(1) + __res_u64(2) + __res_u64(3);
+	state_ts->cc_tx = __res_u64(IDX_TX_TIME);
+	state_ts->cc_bss_rx = __res_u64(IDX_RX_TIME);
+	state_ts->cc_rx = __res_u64(IDX_RX_TIME) + __res_u64(IDX_OBSS_AIRTIME);
+	state_ts->cc_busy = __res_u64(IDX_TX_TIME) +
+			    __res_u64(IDX_RX_TIME) +
+			    __res_u64(IDX_OBSS_AIRTIME) +
+			    __res_u64(IDX_NON_WIFI_TIME);
 #undef __res_u64
 
 	dev_kfree_skb(skb);
-- 
2.39.2


