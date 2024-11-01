Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC433E674AC
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2024 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6AqGcsri7zwJ/2h2Z5MTFdBRd/tfwRbvqw31kzTsa6U=; b=MTXbVt7s8+/IFCmVT05MQWvlXs
	UDmLP29lMBLAnKAOIltVFQ2RnQxd0JlUMpe6hyPnNjZjAotY3O0JyR510N1xliblNIoGpturZMgTy
	2HSlIclhBvRl0IonGOjf4/v0IP8yFFo8ZIdXRoNNim0W/13+77w2BXi1i8BUV0AC0y59vxfjnNUlh
	A6l1fsxT+wPtic6C2S0ZDpHjrCObKNxEX4yH8W6MXXYw8Y2VI8emwnMF9ebKW6dX0DJSD7zEceBZd
	bEStSq00qZAimmIf50co6Ffer8brQz17BagMrpobLmAx5YWmwFwExRwW/QvGMNJZ7eByClkPMFaM5
	e3QqJJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mK1-000000069YK-2tMP;
	Fri, 01 Nov 2024 07:43:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mJx-000000069XH-2C7w
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Nov 2024 07:43:50 +0000
X-UUID: 065949f8982511ef82ff63e91e7eb18c-20241101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6AqGcsri7zwJ/2h2Z5MTFdBRd/tfwRbvqw31kzTsa6U=;
	b=HChLYq/gebXVLGVu3Zm+xTg9fSa21OTRIqardhQxXzBUKC3DyzZ9qxPSWOHA+0dIH/+EZtJqBa4Bz2OwX7Fh8gBDoOXFN0qFdQDCgGpPfOx+5N9upj/DQTc7UnbQTrUDgvnPaMh87pKQJuXLpZ7Fb3kPIvqDK8a2FxgK1ZVliX4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:420b4beb-3eb8-4427-bc93-8a57887f10a9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:4c1e6107-7990-429c-b1a0-768435f03014,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 065949f8982511ef82ff63e91e7eb18c-20241101
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1062058812; Fri, 01 Nov 2024 00:43:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Nov 2024 00:43:43 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Nov 2024 15:43:43 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Eric-SY Chang
	<eric-sy.chang@mediatek.com>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix wrong band_idx setting when enable sniffer mode
Date: Fri, 1 Nov 2024 15:43:40 +0800
Message-ID: <20241101074340.26176-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_004349_608482_ACEEB137 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

From: Eric-SY Chang <eric-sy.chang@mediatek.com>

Currently, sniffer mode does not support band auto,
so set band_idx to the default 0.

Fixes: 0cb349d742d1 ("wifi: mt76: mt7925: update mt7925_mac_link_bss_add for MLO")
Signed-off-by: Eric-SY Chang <eric-sy.chang@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0c2a2337c313..a78883d4d6df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1976,8 +1976,6 @@ int mt7925_get_txpwr_info(struct mt792x_dev *dev, u8 band_idx, struct mt7925_txp
 int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			   bool enable)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-
 	struct {
 		struct {
 			u8 band_idx;
@@ -1991,7 +1989,7 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		} __packed enable;
 	} __packed req = {
 		.hdr = {
-			.band_idx = mvif->bss_conf.mt76.band_idx,
+			.band_idx = 0,
 		},
 		.enable = {
 			.tag = cpu_to_le16(UNI_SNIFFER_ENABLE),
@@ -2050,7 +2048,7 @@ int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
 		} __packed tlv;
 	} __packed req = {
 		.hdr = {
-			.band_idx = vif->bss_conf.mt76.band_idx,
+			.band_idx = 0,
 		},
 		.tlv = {
 			.tag = cpu_to_le16(UNI_SNIFFER_CONFIG),
-- 
2.45.2


