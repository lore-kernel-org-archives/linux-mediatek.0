Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A887C41513
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lphF+UiWRmPNUr7Igo3Jp/521mtv5+NKdSm4ebic9oM=; b=dfZDT1JKBPXyB90SI5s/6JZzBa
	mweHkphkv/RkUdPUDFJCKBfn8JDFyrh5jys2Bcy9WbMPIV763//2oHgIrEmlMsnR+4AXaFlwlujA6
	zXa6Su1Tl4w7RncgR2IOvvKPcRT3jr37lCOIiLvBzZlzQweipKFgH4D+9ll8XsCIuZuXIhbWiDVAd
	CyYEkNGdZDTkVgcOA/dJYlO/LHj7E+5s+FBH5EVRG0+iEwI88OYWhpRFTrnnPcqUZirfpQoaOMxy2
	hkIhThMCbrV6oy9omyPFg6rzYbjTqGdE5Pi533RCfT4/zkeSiYduxGCb+WYsMlOy8QCBENLYgx/Dj
	ua5gfGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRt-002bfe-0b;
	Tue, 01 Aug 2023 14:34:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRm-002bYP-04
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:06 +0000
X-UUID: 71288034307811ee912e1518a6540028-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lphF+UiWRmPNUr7Igo3Jp/521mtv5+NKdSm4ebic9oM=;
	b=ZMvZStQjAPmDkPNuJXF4tnLrh3iP0HQ3YQvP7NeX4J+L1MBbtDhL6dypMUJD/15leLJjeQuMZBCRFFLa8QkMfU3Xx6aRB4/m/SBFMyuk+4nwFRxlA4HXLH28BWRm7s0trreenaCS1jO5wCwGa7B2vf0A/bhpoLJXVdJ5s7DLMUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:730d60ea-0ec5-4348-9d14-386b2ac31bc7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b76fb242-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 71288034307811ee912e1518a6540028-20230801
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1136218223; Tue, 01 Aug 2023 07:33:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:33:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:33:52 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 8/8] wifi: mt76: connac: add more unified event IDs
Date: Tue, 1 Aug 2023 22:30:32 +0800
Message-ID: <17ee8663f21087109460488bc99ebc888f4d521d.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073402_065643_E0A149D4 
X-CRM114-Status: UNSURE (   8.81  )
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

Add more unified event IDs which will be used in new chipset.

This is the preliminary patch for mt7925 support.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 6ab86b1925f5..390be6fd8862 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1013,8 +1013,15 @@ enum {
 enum {
 	MCU_UNI_EVENT_RESULT = 0x01,
 	MCU_UNI_EVENT_FW_LOG_2_HOST = 0x04,
+	MCU_UNI_EVENT_ACCESS_REG = 0x6,
 	MCU_UNI_EVENT_IE_COUNTDOWN = 0x09,
+	MCU_UNI_EVENT_COREDUMP = 0x0a,
+	MCU_UNI_EVENT_BSS_BEACON_LOSS = 0x0c,
+	MCU_UNI_EVENT_SCAN_DONE = 0x0e,
 	MCU_UNI_EVENT_RDD_REPORT = 0x11,
+	MCU_UNI_EVENT_ROC = 0x27,
+	MCU_UNI_EVENT_TX_DONE = 0x2d,
+	MCU_UNI_EVENT_NIC_CAPAB = 0x43,
 };
 
 #define MCU_UNI_CMD_EVENT			BIT(1)
-- 
2.18.0


