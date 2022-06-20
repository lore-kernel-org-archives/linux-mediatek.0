Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2071BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BhLkvxIwFsfa3F7RgNxeKt5uzuq3HveNOLuoxbMckJY=; b=nJZk4p+SopfVrgtNgyONOBvFIV
	ZyxZaeMTuCol1BsexyHWNMDIvf/GsygZ9xiFl/RqxeUP01K/8Ncf9sm5/efbvzQRYfcAidQwdn+rz
	1sxe3nNg1q5EfhYn4WB+NWaJCCZyLn9nZHAuKdW/pcBGg1tP4TNyA2WKwdlFvUFFlAlMUXzxNZX3l
	wiFmuqc+sFm+R3INU4N1mnv+ux+GUm5GNY9boB2PpE1ctZWPMEe8UQAZxZlEfo/ORrYuL5I8kz4EA
	WVUPuyYcM+dJIufCWFQQU8N9vHlwIia+iom6AdH+s29kzZa3SNXFI76juA3F/kCBpxJqtZ9i/6wQI
	sEdJejgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Ar3-00GQzT-Tg; Mon, 20 Jun 2022 06:25:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Ar1-00GQyb-7S
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 06:25:44 +0000
X-UUID: bf2b4e68556b48ef8b274f5576bcb725-20220619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:c51b930d-0454-4a93-8cba-9e6ea2403bb9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:1a1afae9-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bf2b4e68556b48ef8b274f5576bcb725-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 765335344; Sun, 19 Jun 2022 23:25:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 23:17:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 20 Jun 2022 14:17:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jun 2022 14:17:19 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix incorrect testmode ipg on band 1 caused by wmm_idx
Date: Mon, 20 Jun 2022 14:17:17 +0800
Message-ID: <20220620061717.23216-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_232543_309080_878909C5 
X-CRM114-Status: UNSURE (   9.10  )
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

Fix the issue that the measured inter packet gap didn't fit its
setting value.

Fixes: c2d3b1926f30 ("mt76: mt7915: add support for ipg in testmode")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 20f63644e929..2888e4e9ff72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -168,13 +168,14 @@ mt7915_tm_set_tam_arb(struct mt7915_phy *phy, bool enable, bool mu)
 }
 
 static int
-mt7915_tm_set_wmm_qid(struct mt7915_dev *dev, u8 qid, u8 aifs, u8 cw_min,
+mt7915_tm_set_wmm_qid(struct mt7915_phy *phy, u8 qid, u8 aifs, u8 cw_min,
 		      u16 cw_max, u16 txop)
 {
+	struct mt7915_vif *mvif = (struct mt7915_vif *)phy->monitor_vif->drv_priv;
 	struct mt7915_mcu_tx req = { .total = 1 };
 	struct edca *e = &req.edca[0];
 
-	e->queue = qid;
+	e->queue = qid + mvif->mt76.wmm_idx * MT7915_MAX_WMM_SETS;
 	e->set = WMM_PARAM_SET;
 
 	e->aifs = aifs;
@@ -182,7 +183,7 @@ mt7915_tm_set_wmm_qid(struct mt7915_dev *dev, u8 qid, u8 aifs, u8 cw_min,
 	e->cw_max = cpu_to_le16(cw_max);
 	e->txop = cpu_to_le16(txop);
 
-	return mt7915_mcu_update_edca(dev, &req);
+	return mt7915_mcu_update_edca(phy->dev, &req);
 }
 
 static int
@@ -244,7 +245,7 @@ mt7915_tm_set_ipg_params(struct mt7915_phy *phy, u32 ipg, u8 mode)
 
 	mt7915_tm_set_slot_time(phy, slot_time, sifs);
 
-	return mt7915_tm_set_wmm_qid(dev,
+	return mt7915_tm_set_wmm_qid(phy,
 				     mt76_connac_lmac_mapping(IEEE80211_AC_BE),
 				     aifsn, cw, cw, 0);
 }
-- 
2.25.1


