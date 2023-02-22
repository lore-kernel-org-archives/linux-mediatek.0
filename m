Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A69DC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FFedb069aWkwSmQ3hNBAe7tyu5yMd1j1cVuc2CmL6CE=; b=0UwXE5jq8b53cGbl2xlwAGj4Cp
	DinCIz45H3GjZxrpIeAu5IQxgkwlHLw5UUv+bJemNlfVBCQo1AQ9HxTIdOkxWKCzgu6AjuiHQe4o9
	+qFfso/NbUGwMYOlZA1MqgeSFTIQupPbmUYd7PeQHEpCpS9UdYQaFoKvx3FLs9/7DBmC4mMdEE3N8
	En9vvV2mvfVb1VNdjq+Fq/tmjGXD/ctwD3O0Jk4wUs4JpnE439rFzXjWGHfeGit91Oq0MWbwNEK0V
	rlVP9IizbiAqpQeE+trp5gtEV0Edj2bk7jwoiXuac4Sa+QlcqrKwI8mzFlfFUA5mh0g0lIM8pAcuE
	/RfUG+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl7h-00BKuU-OS; Wed, 22 Feb 2023 09:09:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl7e-00BKsN-QF
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 09:09:12 +0000
X-UUID: 8e84d18eb29011eda08d4d6090ec5a5c-20230222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FFedb069aWkwSmQ3hNBAe7tyu5yMd1j1cVuc2CmL6CE=;
	b=DueGwE3c896QeT2k8B2xpp0RaD5kM+mu/Ior0CL9VMaHUTl9sMTQrxtp/pD4ahmBryNNZXWbDYhs911e9kqUDp4HXJG1UkVmHUNcVRVYHxJRc8F4leE0O+zrnzIARIhuuT38iXl0WtOlNyZMiHj8IxvPVDrYwZc/1mJh6nm8bro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:78af240c-1ca0-46b6-b260-7fe09f23af8f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:76e15a26-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 8e84d18eb29011eda08d4d6090ec5a5c-20230222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sujuan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 416505166; Wed, 22 Feb 2023 02:09:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Feb 2023 17:08:31 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 22 Feb 2023 17:08:31 +0800
From: Sujuan Chen <sujuan.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Bo Jiao
	<bo.jiao@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Sujuan Chen <sujuan.chen@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7915: add dev->hif2 support for mt7916 WED device
Date: Wed, 22 Feb 2023 17:08:25 +0800
Message-ID: <73e1988a12a60fa0c661edc8328a302b92392b94.1677056399.git.sujuan.chen@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_010910_876567_9E8FE8EF 
X-CRM114-Status: GOOD (  13.65  )
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

Enable two PCIe interfaces (dev->hif2) support for mt7916 when WED is enabled.

Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c  | 10 ++++++++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  |  4 +++-
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 10 +++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index abe17dac9996..43a5456d4b97 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -87,8 +87,14 @@ static void mt7915_dma_config(struct mt7915_dev *dev)
 				   MT7916_RXQ_BAND0);
 			RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA0, MT_INT_WED_RX_DONE_WA_MT7916,
 				   MT7916_RXQ_MCU_WA);
-			RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_WED_RX_DONE_BAND1_MT7916,
-				   MT7916_RXQ_BAND1);
+			if (dev->hif2)
+				RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0,
+					   MT_INT_RX_DONE_BAND1_MT7916,
+					   MT7916_RXQ_BAND1);
+			else
+				RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0,
+					   MT_INT_WED_RX_DONE_BAND1_MT7916,
+					   MT7916_RXQ_BAND1);
 			RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA0, MT_INT_WED_RX_DONE_WA_MAIN_MT7916,
 				   MT7916_RXQ_MCU_WA_MAIN);
 			TXQ_CONFIG(0, WFDMA0, MT_INT_WED_TX_DONE_BAND0,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5545a8bdf1d0..1dfbcc9bf755 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2370,7 +2370,9 @@ int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
-	if (mtk_wed_device_active(&dev->mt76.mmio.wed) && is_mt7915(&dev->mt76))
+	if ((mtk_wed_device_active(&dev->mt76.mmio.wed) &&
+	     is_mt7915(&dev->mt76)) ||
+	    (!mtk_wed_get_rx_capa(&dev->mt76.mmio.wed)))
 		mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(CAPABILITY), 0, 0, 0);
 
 	ret = mt7915_mcu_set_mwds(dev, 1);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 225a19604d3e..6f0c0e2ae045 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -989,13 +989,13 @@ irqreturn_t mt7915_irq_handler(int irq, void *dev_instance)
 	struct mt7915_dev *dev = dev_instance;
 	struct mtk_wed_device *wed = &dev->mt76.mmio.wed;
 
-	if (mtk_wed_device_active(wed)) {
+	if (mtk_wed_device_active(wed))
 		mtk_wed_device_irq_set_mask(wed, 0);
-	} else {
+	else
 		mt76_wr(dev, MT_INT_MASK_CSR, 0);
-		if (dev->hif2)
-			mt76_wr(dev, MT_INT1_MASK_CSR, 0);
-	}
+
+	if (dev->hif2)
+		mt76_wr(dev, MT_INT1_MASK_CSR, 0);
 
 	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
 		return IRQ_NONE;
-- 
2.18.0


