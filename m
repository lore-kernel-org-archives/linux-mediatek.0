Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3107AC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=poouuqyeI1m5HVOs1wvpGYZufzXSznZNfD82HnANEHw=; b=mJMdhzv2ndlGGIMjLV6n7VByJD
	imZshQtNqRDhkmid94Ri6fsHSsj+OjJRezg1VCCzCrsuv04AkzfO9M2FI4cTAEBB9NadAhTqhnWPd
	+9XXDJawnMsmuxWAmKHa8iU/8kYTOMgJai3UEfeClxZGiK56/ypG+0h/zfjt7TdWK8M/jfyPDyFfk
	YVHt0GYG83pDZGnc85O90XCyWKvnpsAF9+Oy/trLJ5bqDcOiM9ZSddkm+QjXrZM4Y6wgDfaUeacLQ
	OxblriQJA6yM7yemv3kQR/mxFYxtxWYnWCY1XbL+k/hldAeogMjZBnsmSeGB96g0+VZzXIXzwldtl
	A+qds46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ltX-008Ni2-Jp; Thu, 01 Dec 2022 15:54:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ltU-008NgN-Sr
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 15:54:38 +0000
X-UUID: 677627744a724b32b09ac18040d323c7-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=poouuqyeI1m5HVOs1wvpGYZufzXSznZNfD82HnANEHw=;
	b=VjJLkTPglransAqiAW82Q4IFpQ8wkujLJeAQfp8C/iqYWyA7ESnmV0ZZZAE79sVFgSbAIvFaX3cSCjOWumy+V+5dRA+sp7aTP1NuC2Wt/Y0dSTDmMii6WF+myZMTlLTS+I8K/Pni5iih//j8bjYwe+y90PqcXTcgt3KuZF1pzCs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:0b8025a8-5516-44bf-a1e4-655bd6fe4817,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:dcaaed0,CLOUDID:3479e21e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 677627744a724b32b09ac18040d323c7-20221201
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1620253415; Thu, 01 Dec 2022 08:54:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Dec 2022 23:53:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 23:53:54 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7921s: fix slab-out-of-bounds access in sdio host
Date: Thu, 1 Dec 2022 23:53:37 +0800
Message-ID: <0cb01834f0cbcefddfd6facc27568178c139839e.1669909513.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_075436_984752_7072DD6E 
X-CRM114-Status: GOOD (  10.69  )
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

SDIO may need addtional 511 bytes to align bus operation. If the tailroom
of this skb is not big enough, we would access invalid memory region.
For low level operation, increase skb size to keep valid memory access in
SDIO host.

Error message:
[69.951] BUG: KASAN: slab-out-of-bounds in sg_copy_buffer+0xe9/0x1a0
[69.951] Read of size 64 at addr ffff88811c9cf000 by task kworker/u16:7/451
[69.951] CPU: 4 PID: 451 Comm: kworker/u16:7 Tainted: G W  OE  6.1.0-rc5 #1
[69.951] Workqueue: kvub300c vub300_cmndwork_thread [vub300]
[69.951] Call Trace:
[69.951]  <TASK>
[69.952]  dump_stack_lvl+0x49/0x63
[69.952]  print_report+0x171/0x4a8
[69.952]  kasan_report+0xb4/0x130
[69.952]  kasan_check_range+0x149/0x1e0
[69.952]  memcpy+0x24/0x70
[69.952]  sg_copy_buffer+0xe9/0x1a0
[69.952]  sg_copy_to_buffer+0x12/0x20
[69.952]  __command_write_data.isra.0+0x23c/0xbf0 [vub300]
[69.952]  vub300_cmndwork_thread+0x17f3/0x58b0 [vub300]
[69.952]  process_one_work+0x7ee/0x1320
[69.952]  worker_thread+0x53c/0x1240
[69.952]  kthread+0x2b8/0x370
[69.952]  ret_from_fork+0x1f/0x30
[69.952]  </TASK>

[69.952] Allocated by task 854:
[69.952]  kasan_save_stack+0x26/0x50
[69.952]  kasan_set_track+0x25/0x30
[69.952]  kasan_save_alloc_info+0x1b/0x30
[69.952]  __kasan_kmalloc+0x87/0xa0
[69.952]  __kmalloc_node_track_caller+0x63/0x150
[69.952]  kmalloc_reserve+0x31/0xd0
[69.952]  __alloc_skb+0xfc/0x2b0
[69.952]  __mt76_mcu_msg_alloc+0xbf/0x230 [mt76]
[69.952]  mt76_mcu_send_and_get_msg+0xab/0x110 [mt76]
[69.952]  __mt76_mcu_send_firmware.cold+0x94/0x15d [mt76]
[69.952]  mt76_connac_mcu_send_ram_firmware+0x415/0x54d [mt76_connac_lib]
[69.952]  mt76_connac2_load_ram.cold+0x118/0x4bc [mt76_connac_lib]
[69.952]  mt7921_run_firmware.cold+0x2e9/0x405 [mt7921_common]
[69.952]  mt7921s_mcu_init+0x45/0x80 [mt7921s]
[69.953]  mt7921_init_work+0xe1/0x2a0 [mt7921_common]
[69.953]  process_one_work+0x7ee/0x1320
[69.953]  worker_thread+0x53c/0x1240
[69.953]  kthread+0x2b8/0x370
[69.953]  ret_from_fork+0x1f/0x30
[69.953] The buggy address belongs to the object at ffff88811c9ce800
             which belongs to the cache kmalloc-2k of size 2048
[69.953] The buggy address is located 0 bytes to the right of
             2048-byte region [ffff88811c9ce800, ffff88811c9cf000)

[69.953] Memory state around the buggy address:
[69.953]  ffff88811c9cef00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[69.953]  ffff88811c9cef80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[69.953] >ffff88811c9cf000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[69.953]                    ^
[69.953]  ffff88811c9cf080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[69.953]  ffff88811c9cf100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc

Fixes: 764dee47e2c1 ("mt76: sdio: move common code in mt76_sdio module")
Suggested-by: Lorenzo Bianconi <lorenzo@kernel.org>
Tested-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v2:
  - use __skb_grow to increase skb size
  - add suggested by Lorenzo
---
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index bfc4de50a4d2..ddd8c0cc744d 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -254,6 +254,10 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q)
 
 		if (!test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state)) {
 			__skb_put_zero(e->skb, 4);
+			err = __skb_grow(e->skb, roundup(e->skb->len,
+							 sdio->func->cur_blksize));
+			if (err)
+				return err;
 			err = __mt76s_xmit_queue(dev, e->skb->data,
 						 e->skb->len);
 			if (err)
-- 
2.18.0


