Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CFFC55838
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 02:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YY1AYiBRL8HDgw6XZy/C5mmkSBsBiFuSegMY6LTHl6g=; b=R5erLQpA+xGDf2NzlVj/nEVWco
	5r7dMJw3/SPsRG66c0vTVQ72svz/Y8INMeEAfh7WjhjcDP8MnUjLYwe7JjtUM/xyB5oyOmPeWaDD5
	Ky9ZeFBmqZJ+U1nvDQsa45EYXbTNFk49LXR49Ral20/unOXGGqrz5Yh3y301lewNWt3vzA9rvzj4k
	E845A9UMou0Q7NtjeSgmBDwzO/DeqFoS3NjaNy4ribbkrN6k8C4knXt0Yjqs1Man8vkhRbfQDIDW1
	dSplpHKbqHmZgedP6G/Nc84Eiy0d1I2/kU/rX6BhqasW3/HTooW5W7KYY9ivMre2nE6wMEGiv/9om
	nDChx5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRB9-000000036V8-37BC;
	Wed, 05 Aug 2026 02:16:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRB4-000000036UA-0MKK
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 02:16:19 +0000
X-UUID: 9ff59b00907311f1acbe4559397dec65-20260804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YY1AYiBRL8HDgw6XZy/C5mmkSBsBiFuSegMY6LTHl6g=;
	b=SGxB3AdjBHdbQ1QrAEh0SYfJQRyWRVza19ScoGN14vWQFfHx9yIPQvWYcRULXvgb1nagzPH4k1wlCm43HVd0XKKEcAC4hZXG020e23nG431fVlIytvVMj7D9Y7y8Wpf5gbBx3Szjnb9vl+0HZUOTQOd7zUdcivk8oq90KxP8aEA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0c0cd8fc-ddef-4b44-a521-664227e2ff99,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:c9199119-9964-441d-869e-ebbfc9ff832e,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ff59b00907311f1acbe4559397dec65-20260804
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1171436010; Tue, 04 Aug 2026 19:16:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 5 Aug 2026 10:16:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 5 Aug 2026 10:16:08 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <vick.cheng@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix REG_ACCESS command size for register type
Date: Wed, 5 Aug 2026 10:16:06 +0800
Message-ID: <20260805021606.1253882-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_191618_164053_EE8FD1CD 
X-CRM114-Status: GOOD (  11.41  )
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

From: Vick Cheng <vick.cheng@mediatek.com>

mt7925_mcu_regval() always sent sizeof(req) - the full union - regardless of which member (basic reg or RF reg) was active. The two members differ in size, so the firmware received trailing zero bytes which it parsed as extra TLV entries, causing a dead loop.

Pass the size of the active member instead of the union size.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Vick Cheng <vick.cheng@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5532e1722d17..64bba015f5f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -90,6 +90,7 @@ int mt7925_mcu_regval(struct mt792x_dev *dev, u32 regidx, u32 *val, bool set)
 		};
 	} __packed * res, req;
 	struct sk_buff *skb;
+	int cmd_len;
 	int ret;
 
 	if (u32_get_bits(regidx, MT_RF_REG_HDR) == RF_REG_PREFIX) {
@@ -98,20 +99,22 @@ int mt7925_mcu_regval(struct mt792x_dev *dev, u32 regidx, u32 *val, bool set)
 		req.rf_reg.ant = cpu_to_le16(u32_get_bits(regidx, MT_RF_REG_ANT));
 		req.rf_reg.idx = cpu_to_le32(regidx);
 		req.rf_reg.data = set ? cpu_to_le32(*val) : 0;
+		cmd_len = sizeof(req.__rsv) + sizeof(req.rf_reg);
 	} else {
 		req.reg.tag = cpu_to_le16(UNI_CMD_ACCESS_REG_BASIC);
 		req.reg.len = cpu_to_le16(sizeof(req.reg));
 		req.reg.idx = cpu_to_le32(regidx);
 		req.reg.data = set ? cpu_to_le32(*val) : 0;
+		cmd_len = sizeof(req.__rsv) + sizeof(req.reg);
 	}
 
 	if (set)
 		return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(REG_ACCESS),
-					 &req, sizeof(req), true);
+					 &req, cmd_len, true);
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
 					MCU_WM_UNI_CMD_QUERY(REG_ACCESS),
-					&req, sizeof(req), true, &skb);
+					&req, cmd_len, true, &skb);
 	if (ret)
 		return ret;
 
-- 
2.45.2


