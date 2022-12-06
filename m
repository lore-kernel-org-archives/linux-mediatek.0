Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366E8C47089
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 02:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf2xlHbnDoi+Wpwgi2HpILhMqC3GA1rq9G2fhy9H4X4=; b=bhEUoNmWokMXuyuBLvO74msHLO
	kRvso3np9iMKipbT7GB7adQ7qmWZeMSr0J4gbPmS/WVhEIHUEM8pMqsjJDGU3oPCXvfrEt/RDPc7C
	FUX+zmDB8CseRIhJE77/0X+ZiUb2HOHg6bzBvVASO/S9Xywy9IZEtEvaz0zqNv5v+31OHgpove7x9
	cS8hRz+jKjxC7/tencpvVnmPImtXNOHGVEdARlJvWLmDTV7fZLlNAqCFSb1GzpfnnWUbDKEaTR/cW
	3t/1UrI1QGgD8YA0RjRA/UXpusF/Yd7u1YQdVD1Q6eMACckd/AFmboIbDY0CY//BMODQnM6mFPp47
	ncmWSRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Nay-00FRs5-HM; Tue, 06 Dec 2022 02:22:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Naw-00FRqf-4N
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 02:22:07 +0000
X-UUID: ac259e5120db4d149dc1ee4ba81d0144-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rf2xlHbnDoi+Wpwgi2HpILhMqC3GA1rq9G2fhy9H4X4=;
	b=tkQ8Jtd662x3QmtmTYhDzSZ6cK6SHT92ApiHeYOlCfr+UT0kQa/ZDgoF4jYEgYERRi+QDKVPaT2UhAjfl+OpgRUbU6lm6PaiX9f9jADuQtZYjCjbh3qJx8mDnjX3cMzD3L+B2D2eXnOWU6fp3wIC2ANQe0lGNMpDVGPtKJL5AcY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5b0b009a-4eea-4ad9-9e7a-0917b796db9b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:a30dbcd1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ac259e5120db4d149dc1ee4ba81d0144-20221205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1267624612; Mon, 05 Dec 2022 19:22:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 6 Dec 2022 09:31:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 09:31:22 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt7915: rework mt7915_mcu_set_thermal_throttling()
Date: Tue, 6 Dec 2022 09:29:51 +0800
Message-ID: <20221206012951.10719-4-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221206012951.10719-1-howard-yh.hsu@mediatek.com>
References: <20221206012951.10719-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_182206_217269_078C0B7D 
X-CRM114-Status: UNSURE (   8.61  )
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

Firmware expects to disable thermal protect first before reconfiguring.

Fixes: afab0e8202ff ("mt76: mt7915: add thermal cooling device support")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b2652de082ba..e1b6d644cc14 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3070,18 +3070,22 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
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
 
 		req.ctrl.ctrl_id = THERMAL_PROTECT_DUTY_CONFIG;
 		req.ctrl.duty.duty_level = level;
@@ -3101,7 +3105,6 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 	req.trigger_temp = cpu_to_le32(phy->throttle_temp[1]);
 	req.sustain_time = cpu_to_le16(10);
 
-out:
 	req.ctrl.type.protect_type = 1;
 	req.ctrl.type.trigger_type = 1;
 
-- 
2.18.0


