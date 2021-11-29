Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6145FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 23:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ioo4022iLcRGD6hJe1GNXaq9P1l+rxW/0uS6ga+I9eU=; b=NC67YQd0Md38ZV
	or+0UALOaH0vHxvI5XwY5gjD/dqcF3uteDEU3kNKLv5LnPGs19ScNT7fqpLHCu3FhNgL0hwbA8ztX
	H0fE02vUFQO39Zap3316ZhAD3zT+6lYL+yN8czFoIl3yvuSCg0fE2WsxreqR02Rbvsviuxg2t0IYt
	50I+dXCe20MY2mSyj2DR0AVwUDksf4db1Tn2/OitP3APqfPtYsDoCKX7vEKD+HKura1kVB2tPpQXk
	nj9s12pktvF8wRWSf5s12OA3VBDwVO8vINWR0RJ+o88NrIMRNiMaVb5V2RjpPHhGk+zLIReFuN9iD
	NrUZYay4VD0P33S0vPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrpia-0032ro-Gg; Mon, 29 Nov 2021 23:05:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrpiW-0032r2-5q
 for linux-mediatek@lists.infradead.org; Mon, 29 Nov 2021 23:05:51 +0000
X-UUID: a8d9aae79e584dacb5f5ae3bfc611bd7-20211129
X-UUID: a8d9aae79e584dacb5f5ae3bfc611bd7-20211129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 926840995; Mon, 29 Nov 2021 16:05:44 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 15:05:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Nov 2021 07:05:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 07:05:29 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921s: fix possible kernel crash due to invalid Rx
 count
Date: Tue, 30 Nov 2021 07:05:28 +0800
Message-ID: <46ec9ad003b425f55c75a0de76b5f98fb066508f.1638225611.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_150548_249453_BC96A5ED 
X-CRM114-Status: GOOD (  11.99  )
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

From: Sean Wang <sean.wang@mediatek.com>

Return the proper error code when out-of-range the Rx aggregation count
are reported from the hardware that would create the unreasonable extreme
large Rx buffer.

[  100.873810]  show_stack+0x20/0x2c
[  100.873823]  dump_stack+0xc4/0x140
[  100.873839]  bad_page+0x110/0x114
[  100.873854]  check_new_pages+0xf8/0xfc
[  100.873869]  rmqueue+0x5a0/0x640
[  100.873884]  get_page_from_freelist+0x124/0x20c
[  100.873898]  __alloc_pages_nodemask+0x114/0x2a4
[  100.873918]  mt76s_rx_run_queue+0xd4/0x2e4 [mt76_sdio 8280a88a0c8c9cf203f16e194f99ac293bdbb2f5]
[  100.873938]  mt76s_rx_handler+0xd4/0x2a0 [mt76_sdio 8280a88a0c8c9cf203f16e194f99ac293bdbb2f5]
[  100.873957]  mt76s_txrx_worker+0xac/0x17c [mt76_sdio 8280a88a0c8c9cf203f16e194f99ac293bdbb2f5]
[  100.873977]  mt7921s_txrx_worker+0x5c/0xd8 [mt7921s d0bdbc018082dbc8dc1407614be3c2e7bd64423b]
[  100.874003]  __mt76_worker_fn+0xe8/0x170 [mt76 b80af3483a8f9d48e916c12d8dbfaa0d3cd15337]
[  100.874018]  kthread+0x148/0x3ac
[  100.874032]  ret_from_fork+0x10/0x30
[  100.874067] Kernel Offset: 0x1fe2000000 from 0xffffffc010000000
[  100.874079] PHYS_OFFSET: 0xffffffe800000000
[  100.874090] CPU features: 0x0240002,2188200c

Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 5c88b6b8d097..84be229a899d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -62,6 +62,10 @@ static int mt7921s_parse_intr(struct mt76_dev *dev, struct mt76s_intr *intr)
 	if (err < 0)
 		return err;
 
+	if (irq_data->rx.num[0] > 16 ||
+	    irq_data->rx.num[1] > 128)
+		return -EINVAL;
+
 	intr->isr = irq_data->isr;
 	intr->rec_mb = irq_data->rec_mb;
 	intr->tx.wtqcr = irq_data->tx.wtqcr;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
