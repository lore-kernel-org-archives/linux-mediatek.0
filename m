Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDA2C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 05:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jsfib5T7wSVjC6QbFl/gYrFKUGPmdooacuNRC3W5K6k=; b=hT6UON3LzHRJAVM0Vn6RQwnKW7
	tdrKZ+fjP7YliIZaUxDWu919ABMbiNHfWDJQR5lLhGTcaKEI9ez8JiAl3jeOrmh+fPBrweL0/92T0
	sLqGRzuG5SL2l7p9EwnKBMSnf8wZvOfJyYV/zwxOzJU7kDCnH+1+XY08UfdVXbbfzpdf042EFxcse
	LtQ/sfzlAK1hIcteQLiB+IhWETWg9msoCoagkdWcfnAoWlmQj04Ty4WJ2oH7S9V1McmAjhahmxaWv
	IcPVt1HDuoV2wkA/AqP6BmrElKduqWLJoUUpNu8yEXwSvVngO7RlXDwvyJG+CSEbpTlh0a53A2GBa
	9YPXtMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mwQ-00BdgM-9Y; Wed, 07 Dec 2022 05:25:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mwN-00BdMs-ND
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 05:25:57 +0000
X-UUID: c76191d8640547978a5f2dda97679839-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Jsfib5T7wSVjC6QbFl/gYrFKUGPmdooacuNRC3W5K6k=;
	b=b50//Sthinsa4tAoIu6SgH2itSAhbCtxUVtXdUtEFVJ0seStS5Lm8TCS6/Vtjpv27BI06lzPn88u7l6kn3Vc+hd4DpygxEYGrz2AeyG0alwOTMFU0vxyLLRewzM/tw/CEuDZYpDMALi0z6OUtY1yRHPY7a10WazZnA3yNGUWEiw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b4dea011-003d-4790-9f5c-c39c42747b68,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:ba7ec516-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c76191d8640547978a5f2dda97679839-20221206
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1324297913; Tue, 06 Dec 2022 22:25:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 13:25:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 13:25:40 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v2 3/3] wifi: mt76: mt7915: rework mt7915_mcu_set_thermal_throttling()
Date: Wed, 7 Dec 2022 13:25:00 +0800
Message-ID: <20221207052500.10855-4-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207052500.10855-1-howard-yh.hsu@mediatek.com>
References: <20221207052500.10855-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_212555_788288_71A30C54 
X-CRM114-Status: GOOD (  10.05  )
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

Firmware expects to disable thermal protect first before reconfiguring.

Fixes: 34b877d972be ("mt76: mt7915: add thermal cooling device support")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b2652de082ba..176d293eb32a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3070,19 +3070,22 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 	} __packed req = {
 		.ctrl = {
 			.band_idx = phy->mt76->band_idx,
+			.type.protect_type = 1,
+			.type.trigger_type = 1,
 		},
 	};
-	int level;
+	int level, ret;
 
-	if (!state) {
-		req.ctrl.ctrl_id = THERMAL_PROTECT_DISABLE;
-		goto out;
-	}
+	req.ctrl.ctrl_id = THERMAL_PROTECT_DISABLE;
+
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
+				&req, sizeof(req.ctrl), false);
+
+	if (ret || !state)
+		return ret;
 
 	/* set duty cycle and level */
 	for (level = 0; level < 4; level++) {
-		int ret;
-
 		req.ctrl.ctrl_id = THERMAL_PROTECT_DUTY_CONFIG;
 		req.ctrl.duty.duty_level = level;
 		req.ctrl.duty.duty_cycle = state;
@@ -3100,8 +3103,6 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 	req.restore_temp = cpu_to_le32(phy->throttle_temp[0] - 10);
 	req.trigger_temp = cpu_to_le32(phy->throttle_temp[1]);
 	req.sustain_time = cpu_to_le16(10);
-
-out:
 	req.ctrl.type.protect_type = 1;
 	req.ctrl.type.trigger_type = 1;
 
-- 
2.18.0


