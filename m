Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE42ED12685
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSz7cs1n97k6WaksJyKwqqco8iIMeAqTrUt8H55VRcs=; b=JEv05JtFi+ghfoKrlxHSqHuUEW
	ANjWbeMWRqJ85VBruE+7xEvpc5TSCD7N+WlBWD9CAnqxaNRvKkyAln/2SI8VZEIhPCs6bux2C5PQg
	+SVaoUgqOqDcvHmsPUOe6QkYVAr7vGbpH/eluB9lMckAb48kg4rWE5Dc1AsOUj/vZE+hquDI86P7b
	OJhLWT6i/1XAOXYId+MCTmgOsXQ2bfd+CU2LYFqn5ZlqMBZEjDawc5wavErHzj+B90yPJSmJxjo3H
	M/zR2KOWsLliCs5Mpai9Wk0PWx1TQyTsY47HpGM4YFHr6PZ1w9qlEluEH4kyGLs3yv+BandMJFe1V
	ZW945okA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HS9-0000000GnUM-2ba3;
	Tue, 05 Nov 2024 11:10:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HS6-0000000GnTI-06bw
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 11:10:27 +0000
X-UUID: 8bbba5d49b6611ef9048ed6ed365623b-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RSz7cs1n97k6WaksJyKwqqco8iIMeAqTrUt8H55VRcs=;
	b=o5dssEIm7AwhLtRfbuOaAGpvmaoE61E9OP3hPOxurHwxmJYD1uROrd+rbyP22nKILG/mhwzEAT5N/0Rb9Q2lghffm2fv5/cDEB3fIy7HSoY5KIRoVzJBEJ+KSFaE1riWAhedSzRjbAVacTt05trdF9Xnqr3lQd8Z2dGddN2GjEs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:6dc1d01b-838f-40c2-94a1-7df1758c85c4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9c1097e7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8bbba5d49b6611ef9048ed6ed365623b-20241105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 802139613; Tue, 05 Nov 2024 04:10:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 19:10:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 19:10:18 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Michael Lo
	<michael.lo@mediatek.corp-partner.google.com>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: config the dwell time by firmware
Date: Tue, 5 Nov 2024 19:10:16 +0800
Message-ID: <20241105111016.23564-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_031026_107247_FBBD849F 
X-CRM114-Status: GOOD (  10.75  )
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

From: Michael Lo <michael.lo@mediatek.corp-partner.google.com>

To optimize the scan time of mt7925, remove the dwell time
setting for the scan command and let it be controlled by
the firmware as mt7921.

Signed-off-by: Michael Lo <michael.lo@mediatek.corp-partner.google.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0c2a2337c313..4226baf3cfcb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2643,14 +2643,12 @@ int mt7925_mcu_set_dbdc(struct mt76_phy *phy)
 	return err;
 }
 
-#define MT76_CONNAC_SCAN_CHANNEL_TIME		60
-
 int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_scan_request *scan_req)
 {
 	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
 	struct cfg80211_scan_request *sreq = &scan_req->req;
-	int n_ssids = 0, err, i, duration;
+	int n_ssids = 0, err, i;
 	struct ieee80211_channel **scan_list = sreq->channels;
 	struct mt76_dev *mdev = phy->dev;
 	struct mt76_connac_mcu_scan_channel *chan;
@@ -2686,14 +2684,6 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	req->scan_type = sreq->n_ssids ? 1 : 0;
 	req->probe_req_num = sreq->n_ssids ? 2 : 0;
 
-	duration = MT76_CONNAC_SCAN_CHANNEL_TIME;
-	/* increase channel time for passive scan */
-	if (!sreq->n_ssids)
-		duration *= 2;
-	req->timeout_value = cpu_to_le16(sreq->n_channels * duration);
-	req->channel_min_dwell_time = cpu_to_le16(duration);
-	req->channel_dwell_time = cpu_to_le16(duration);
-
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_SSID, sizeof(*ssid));
 	ssid = (struct scan_ssid_tlv *)tlv;
 	for (i = 0; i < sreq->n_ssids; i++) {
-- 
2.45.2


