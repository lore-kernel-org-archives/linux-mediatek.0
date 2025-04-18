Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780DC369AB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Apr 2025 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ydMgbscZ3RVyz9X2bdzPUjHCncx3ITVkaSqSsS39GR8=; b=lN8aBxyORS8FDv4S1PghUmTN20
	C/VJWXUoSsRIHBd5SMhAfRRs1/nB3PyG+ENgF0HrYbUB4EphPX2zpkMnWLrKM73ByyvB/9sQMTNUM
	/tbnmpShOyX7Dg/gA+Lzx/iYgYSywJrQgl9c1tnHHLe3DjWY1Db4dJufAlJot8cfLBf086qnIULEa
	udJolDkykDhSfAFPIYkX4GRURqN5lElrJ53pSYepFsOXSyFneWAicz/xPgZDQr+yFTWrtKWnRqaLM
	dBU/Ye4gtkN05MuSmu9o/hbqNVLCTQ8ozIat+EA5DwvReZDVhOVtBSXbo9NqxlSfH5V6u1r5guZT9
	aB5cp/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iAU-0000000Flwl-0AHW;
	Fri, 18 Apr 2025 09:37:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iAR-0000000Flv6-2jHy
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Apr 2025 09:37:52 +0000
X-UUID: c7d7dbb61c3811f0a1e849db4cc18d44-20250418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ydMgbscZ3RVyz9X2bdzPUjHCncx3ITVkaSqSsS39GR8=;
	b=EKz2t2tFoD8XucfbQoO3J128Xjc60m0BIBUwTnWwPhh4b+L7fZReXPbX3l45R/AvSu8ftbmNhtWD2+q/lsxSwQmFCyX5deTih6g8BZ455Nk9but3CkQ/rbbWxmUi607AAHko8h4AP5zZiauTB7kh3jqEYpiJn0pael/vYK8jiOk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ce7ffb96-ebf7-4ee4-9b76-749b22337cbc,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-35
X-CID-META: VersionHash:0ef645f,CLOUDID:0973bbc7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7d7dbb61c3811f0a1e849db4cc18d44-20250418
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 323069230; Fri, 18 Apr 2025 02:37:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 17:37:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 17:37:42 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>, Ming
 Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921s: Introduce SDIO WiFi/BT combo module card reset
Date: Fri, 18 Apr 2025 17:37:40 +0800
Message-ID: <20250418093740.3814909-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_023751_707937_72B210A2 
X-CRM114-Status: GOOD (  15.44  )
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

From: Leon Yen <leon.yen@mediatek.com>

Add a hardware reset method to recover from the SDIO bus error that cannot
be resolved by the current WiFi/BT subsystem reset.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c      |  4 ++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  2 +
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  | 58 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/sdio_txrx.c    |  6 +-
 6 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 3353012e8542..65d4c2adb538 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -78,6 +78,10 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	unsigned long expires;
 	int ret, seq;
 
+	if (mt76_is_sdio(dev))
+		if (test_bit(MT76_RESET, &dev->phy.state) && atomic_read(&dev->bus_hung))
+			return -EIO;
+
 	if (ret_skb)
 		*ret_skb = NULL;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index a56d179d8cf3..e5ffe3ffd2ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -984,6 +984,8 @@ struct mt76_dev {
 		struct mt76_usb usb;
 		struct mt76_sdio sdio;
 	};
+
+	atomic_t bus_hung;
 };
 
 /* per-phy stats.  */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index ec822ff513b3..e78224ad2517 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -675,6 +675,8 @@ void mt7921_mac_reset_work(struct work_struct *work)
 		if (!ret)
 			break;
 	}
+	if (mt76_is_sdio(&dev->mt76) && atomic_read(&dev->mt76.bus_hung))
+		return;
 
 	if (i == 10)
 		dev_err(dev->mt76.dev, "chip reset failed\n");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 45b9f35aab17..d8d36b3c3068 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -150,6 +150,8 @@ static int mt7921s_probe(struct sdio_func *func,
 	if (ret)
 		goto error;
 
+	atomic_set(&mdev->bus_hung, false);
+
 	mdev->rev = (mt76_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt76_rr(dev, MT_HW_REV) & 0xff);
 	dev_dbg(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index 1f77cf71ca70..a9eb6252a904 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -6,6 +6,8 @@
 #include "mt7921.h"
 #include "../mt76_connac2_mac.h"
 #include "../sdio.h"
+#include <linux/mmc/host.h>
+#include <linux/kallsyms.h>
 
 static void mt7921s_enable_irq(struct mt76_dev *dev)
 {
@@ -35,6 +37,9 @@ int mt7921s_wfsys_reset(struct mt792x_dev *dev)
 	struct mt76_sdio *sdio = &dev->mt76.sdio;
 	u32 val, status;
 
+	if (atomic_read(&dev->mt76.bus_hung))
+		return 0;
+
 	mt7921s_mcu_drv_pmctrl(dev);
 
 	sdio_claim_host(sdio->func);
@@ -91,11 +96,64 @@ int mt7921s_init_reset(struct mt792x_dev *dev)
 	return 0;
 }
 
+static struct mt76_sdio *msdio;
+static void mt7921s_card_reset(struct work_struct *work)
+{
+	struct mmc_host *sdio_host = msdio->func->card->host;
+
+	sdio_claim_host(msdio->func);
+	sdio_release_irq(msdio->func);
+	sdio_release_host(msdio->func);
+
+	mmc_remove_host(sdio_host);
+	msleep(50);
+	mmc_add_host(sdio_host);
+}
+
+static DECLARE_WORK(sdio_reset_work, mt7921s_card_reset);
+static int mt7921s_check_bus(struct mt76_dev *dev)
+{
+	struct mt76_sdio *sdio = &dev->sdio;
+	int err;
+
+	sdio_claim_host(sdio->func);
+	sdio_readl(dev->sdio.func, MCR_WHCR, &err);
+	sdio_release_host(sdio->func);
+
+	return err;
+}
+
+static int mt7921s_host_reset(struct mt792x_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	int err = -1;
+
+	if (!atomic_read(&mdev->bus_hung))
+		err = mt7921s_check_bus(&dev->mt76);
+
+	if (err) {
+		atomic_set(&mdev->bus_hung, true);
+		msdio = &dev->mt76.sdio;
+		dev_err(mdev->dev, "SDIO bus problem detected(%d), resetting card!!\n", err);
+		schedule_work(&sdio_reset_work);
+		return err;
+	}
+
+	atomic_set(&mdev->bus_hung, false);
+
+	return 0;
+}
+
 int mt7921s_mac_reset(struct mt792x_dev *dev)
 {
 	int err;
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
+
+	mt7921s_host_reset(dev);
+	if (atomic_read(&dev->mt76.bus_hung))
+		return 0;
+
 	mt76_txq_schedule_all(&dev->mphy);
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 0a927a7313a6..f882d21c9f63 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -112,6 +112,7 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 
 	if (err < 0) {
 		dev_err(dev->dev, "sdio read data failed:%d\n", err);
+		atomic_set(&dev->bus_hung, true);
 		put_page(page);
 		return err;
 	}
@@ -234,9 +235,10 @@ static int __mt76s_xmit_queue(struct mt76_dev *dev, u8 *data, int len)
 	err = sdio_writesb(sdio->func, MCR_WTDR1, data, len);
 	sdio_release_host(sdio->func);
 
-	if (err)
+	if (err) {
 		dev_err(dev->dev, "sdio write failed: %d\n", err);
-
+		atomic_set(&dev->bus_hung, true);
+	}
 	return err;
 }
 
-- 
2.34.1


