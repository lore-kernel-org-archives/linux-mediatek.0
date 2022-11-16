Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7070C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DYZzixU+G9Z13P/mjEXm5tqsN/MuV+82bQqD6HGEpiU=; b=C91axtODdpIEO/irxJbk+Wy2RN
	M0tp/uhK7+jyhrvgNlhOuyDHmU7XMtkKLFjb2eunF3su10AGzJ0g/2JNtsFvWXZwaiMr9A7EBAv3P
	azameqFDxuQ8pbtbgfiFShIpHBpUdNJ4jTtyeOrp1PKv+MYpq7Uwf1dLduRzCdnGp1NKkZXoUgEPa
	Z5njeah+kFEfDx/6940oL2DxNCQvP5MhXqXJwQ+umBUPfBM2LOh4fsdzcbbY/J/r4iyThfgCfzFTc
	8Y8TCBKXb8q1SZS4vPdJJ0rdGSRqfYfqBt1LEGSLYuRoU2N9bQJCLkbRr4vxVIYmDfjA6nblnZeh/
	VfFYr2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovGMz-002i8v-AX; Wed, 16 Nov 2022 11:14:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovGMw-002hup-MZ
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 11:14:16 +0000
X-UUID: 638bb7c4343d4cd19af3e0ee7224e896-20221116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DYZzixU+G9Z13P/mjEXm5tqsN/MuV+82bQqD6HGEpiU=;
	b=t0pDbap9nkrC1JRWRXSf69A39HMTlv6c/R7jMl2caHhooM0wo/7+aWn18+6HUeCInimkch2jwoiZ8CZZSbt5Ud2T9L5Z/rc2UkXjlkT4WYPeQLw5y50cJc0oj/0vl2TAkZiiQIsSavJ6xWWa+WZgtqCKW94vSmuJQ6Nu2hWSkAg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:da4cf5b3-25d1-4124-bd87-332777d563e8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:d4d991e5-09aa-415c-8e59-7d84d4424d8b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 638bb7c4343d4cd19af3e0ee7224e896-20221116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1421830917; Wed, 16 Nov 2022 04:13:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Nov 2022 18:43:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Nov 2022 18:43:17 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: fix gcc warnings with sparc options
Date: Wed, 16 Nov 2022 18:42:26 +0800
Message-ID: <20221116104226.4174-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_031414_763560_272575F6 
X-CRM114-Status: GOOD (  11.10  )
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

Fix the following warnings:

>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2377:5: warning: no previous prototype for 'mt7996_mcu_restart' [-Wmissing-prototypes]
    2377 | int mt7996_mcu_restart(struct mt76_dev *dev)
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/sparc/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/qrwlock_types.h:6,
                    from arch/sparc/include/asm/spinlock_types.h:17,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:6:
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c: In function 'mt7996_mcu_set_tx':
>> include/uapi/linux/byteorder/big_endian.h:36:26: warning: conversion from 'short unsigned int' to 'u8' {aka 'unsigned char'} changes value from '2560' to '0' [-Woverflow]
      36 | #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
         |                          ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
      90 | #define cpu_to_le16 __cpu_to_le16
         |                     ^~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2546:37: note: in expansion of macro 'cpu_to_le16'
    2546 |                         e->cw_max = cpu_to_le16(10);
         |                                     ^~~~~~~~~~~

Fixes: 23c307666f69 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
@Felix, could you please help to fold this patch? Thanks.
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index adc80b9930bd..bf83d0862988 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2373,7 +2373,8 @@ mt7996_mcu_init_rx_airtime(struct mt7996_dev *dev)
 				     MCU_WM_UNI_CMD(VOW), true);
 }
 
-int mt7996_mcu_restart(struct mt76_dev *dev)
+static int
+mt7996_mcu_restart(struct mt76_dev *dev)
 {
 	struct {
 		u8 __rsv1[4];
@@ -2540,10 +2541,11 @@ int mt7996_mcu_set_tx(struct mt7996_dev *dev, struct ieee80211_vif *vif)
 			e->cw_min = 5;
 
 		if (q->cw_max)
-			e->cw_max = cpu_to_le16(fls(q->cw_max));
+			e->cw_max = fls(q->cw_max);
 		else
-			e->cw_max = cpu_to_le16(10);
+			e->cw_max = 10;
 	}
+
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_WM_UNI_CMD(EDCA_UPDATE), true);
 }
-- 
2.25.1


