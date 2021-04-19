Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19821C43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABFA60FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABFA60FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K/QuY8ig2hjQkMkOv4sfN8NaQQOXyo9rVhkxxQF0e8E=; b=S2xefeqMoPc92fahTQpMzjJqg
	5Arwm3ee91cC1CAo+9hlAH1ERjt8pDhOWgom5pC/DOzCQUEOLXkDs3GqXBBoZu/40x7BTFGoXVFS5
	oA01HTQF1yWDSGZ3IJ0iELC6fhMsBPU6UGwxS1ZbU3YxKRbQVSvpfMi/UHO9XLwsGvO1g+WIgwMRI
	mBNOSdIfC5MOTxJRXHI4dGyw5VaRIrGGKnvMGCPJLVeaziWeTxKI0tLWE+TaaiqceElR7gLRqr3Sf
	40fox5d4A5YH7euDHJIXsJv1a6OSKFxgpA58TnVz/p9rGVtG3pG09sigmga8/21OKnK0dxkBSFpZM
	dCBWDCKqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUm6-00A4ng-BV; Mon, 19 Apr 2021 14:21:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUm1-00A4ma-4N
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 14:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=7SHRDH0NyDyP8YwnE0SToYBueeET3xV7G2CupxVW55Q=; b=bhGUBMljirgOOqhxohgAeRz63E
 KUDVJSYxVHPTnXwJCQWz7weqYYKjPwhhdwRW5O/Cbw8//MrGqPJLc7tLLg6d/4SdMvMkPbBVhY1Iz
 cVdwk3nTf4IsHMqRvoUcOW01zYzzMl2egrerKvxvSXfujkUNiQOpw645fHzxo5cNtABgOfnnPoOXt
 JlfT6pz87Yl7ZF//K+h/70g0ZFPXxzrgrzLXDMVzDUxS56JfUqNIIx/QR1tAZ5x2sZC7maWdpJmd4
 3Mb74HhldCkcLXFNAhIYXP7XUYisF0+1qgnU8zoRGyapGrdmr5obkk8hPF0yRHpFnkD+UUymPUe3K
 P6rWaczg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUlx-00BRib-Jj
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 14:21:11 +0000
X-UUID: 6c2d7738a8b04b05acdd6eba6efb9d0f-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7SHRDH0NyDyP8YwnE0SToYBueeET3xV7G2CupxVW55Q=; 
 b=WW38LlVC5vQLzDYf0NyxlgB4Z4I9kw2S1anMJXMutNwsGyMgS9+J/T5y8OylHzWM8KjP6H9ufrbNrgii1EUd7EhAVc6b4JFxkXy29rHE4FqibOWlXOgFxGsXm2bI2byQjJFjxWqHChNHy2tEfWs9UWiPDNj8siDoCAHzUpvU2v8=;
X-UUID: 6c2d7738a8b04b05acdd6eba6efb9d0f-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2060685508; Mon, 19 Apr 2021 07:21:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 07:21:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 22:21:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 22:21:00 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 2/6] mt76: mt7921: introduce mt7921_wpdma_reset utility
 routine
Date: Mon, 19 Apr 2021 22:20:55 +0800
Message-ID: <1618842059-8192-3-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
References: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_072109_685280_23CA9908 
X-CRM114-Status: GOOD (  13.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

Introduce mt7921_wpdma_reset routine to reset wpdma during chip reset
or driver_own request.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 44 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 29 ++----------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
 3 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index 0c577a5bac13..af4b6cf38929 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -229,7 +229,7 @@ static int mt7921_dmashdl_disabled(struct mt7921_dev *dev)
 	return 0;
 }
 
-int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
+static int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
 {
 	int i;
 
@@ -300,6 +300,48 @@ int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
 	return 0;
 }
 
+int mt7921_wfsys_reset(struct mt7921_dev *dev)
+{
+	mt76_set(dev, 0x70002600, BIT(0));
+	msleep(200);
+	mt76_clear(dev, 0x70002600, BIT(0));
+
+	if (!__mt76_poll_msec(&dev->mt76, MT_WFSYS_SW_RST_B,
+			      WFSYS_SW_INIT_DONE, WFSYS_SW_INIT_DONE, 500))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+int mt7921_wpdma_reset(struct mt7921_dev *dev, bool force)
+{
+	int i, err;
+
+	/* clean up hw queues */
+	for (i = 0; i < ARRAY_SIZE(dev->mt76.phy.q_tx); i++)
+		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
+
+	for (i = 0; i < ARRAY_SIZE(dev->mt76.q_mcu); i++)
+		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
+		mt76_queue_rx_cleanup(dev, &dev->mt76.q_rx[i]);
+
+	if (force) {
+		err = mt7921_wfsys_reset(dev);
+		if (err)
+			return err;
+	}
+	err = mt7921_dma_reset(dev, force);
+	if (err)
+		return err;
+
+	mt76_for_each_q_rx(&dev->mt76, i)
+		mt76_queue_rx_reset(dev, i);
+
+	return 0;
+}
+
 int mt7921_dma_init(struct mt7921_dev *dev)
 {
 	/* Increase buffer size to receive large VHT/HE MPDUs */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 9aadb598019d..98daf03884a3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1204,16 +1204,6 @@ void mt7921_update_channel(struct mt76_dev *mdev)
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
-int mt7921_wfsys_reset(struct mt7921_dev *dev)
-{
-	mt76_set(dev, 0x70002600, BIT(0));
-	msleep(200);
-	mt76_clear(dev, 0x70002600, BIT(0));
-
-	return __mt76_poll_msec(&dev->mt76, MT_WFSYS_SW_RST_B,
-				WFSYS_SW_INIT_DONE, WFSYS_SW_INIT_DONE, 500);
-}
-
 void mt7921_tx_token_put(struct mt7921_dev *dev)
 {
 	struct mt76_txwi_cache *txwi;
@@ -1273,21 +1263,11 @@ mt7921_mac_reset(struct mt7921_dev *dev)
 	mt7921_tx_token_put(dev);
 	idr_init(&dev->token);
 
-	/* clean up hw queues */
-	for (i = 0; i < ARRAY_SIZE(dev->mt76.phy.q_tx); i++)
-		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
-
-	for (i = 0; i < ARRAY_SIZE(dev->mt76.q_mcu); i++)
-		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
-
-	mt76_for_each_q_rx(&dev->mt76, i)
-		mt76_queue_rx_cleanup(dev, &dev->mt76.q_rx[i]);
-
-	mt7921_wfsys_reset(dev);
-	mt7921_dma_reset(dev, true);
+	err = mt7921_wpdma_reset(dev, true);
+	if (err)
+		return err;
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		mt76_queue_rx_reset(dev, i);
 		napi_enable(&dev->mt76.napi[i]);
 		napi_schedule(&dev->mt76.napi[i]);
 	}
@@ -1301,9 +1281,6 @@ mt7921_mac_reset(struct mt7921_dev *dev)
 
 	mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
-	mt7921_irq_enable(dev,
-			  MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
-			  MT_INT_MCU_CMD);
 
 	err = mt7921_run_firmware(dev);
 	if (err)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 58cfa2bbeba5..67cb0a647066 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -253,7 +253,7 @@ int mt7921_eeprom_get_target_power(struct mt7921_dev *dev,
 				   u8 chain_idx);
 void mt7921_eeprom_init_sku(struct mt7921_dev *dev);
 int mt7921_dma_init(struct mt7921_dev *dev);
-int mt7921_dma_reset(struct mt7921_dev *dev, bool force);
+int mt7921_wpdma_reset(struct mt7921_dev *dev, bool force);
 void mt7921_dma_cleanup(struct mt7921_dev *dev);
 int mt7921_run_firmware(struct mt7921_dev *dev);
 int mt7921_mcu_init(struct mt7921_dev *dev);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
