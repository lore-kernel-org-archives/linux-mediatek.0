Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10D1C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 04:15:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5EA20706
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 04:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPh234Om";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M3rjIGmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5EA20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ePG4vTFv8n43+ERzd9BhVRZ99Lc4HUkTJL3ygZrU3mc=; b=bPh234OmFsmuRi79BiwnIfOMxM
	NPbYTtsMxhcOs8IIc7vJpPRE5gH11Cy8xbNZNrJniXUEDi2K8mWmzz0bv1zq9u65w1iFuUKPpkUS+
	Ww2/3CAcs77jTkSDo81UY2FBIkHIiZHT8rVpvPfsSAkjZgpCK10kzodAb/Vu5Nk7q6dyc4RSw0DF1
	wMsD8kWI1fybfUKo0SzNz8frcXzeK9e2/A/tAM/9Nu8e5HuYltAXw6228p44GBKpceXf6pJFIyexe
	PfCOtCyS8zwHRfmaJrqMOt2NiZs5/MxR/rU9+Z7bvpnEgJSfx0/lR0r1hhWokGeifF1fwhSt5PNXz
	DTY5CuaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7t1y-0001Yt-UF; Tue, 18 Aug 2020 04:15:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7t1v-0001YP-Kr
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 04:15:25 +0000
X-UUID: 5d0817fc690944df920e1639380a6c5c-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=l59+GLaNjaqnA2PhlUq66s9CLlMDA+ihi7hNkqvW1iY=; 
 b=M3rjIGmWgAdOlWIvKsROHKRA9hWCFcfUOA908o/+ko8s6F9mcy5PH6s1FlAThULHNKracYBFmi215mE5nzrrEHXwXxCh3a/DrYvayH6XsJe/rGbWFRGhfMtH7sp/OQgNSTWPM7LlRSw3qa6T51G8WRR6LzyTtZaYMQXF+Srtk4A=;
X-UUID: 5d0817fc690944df920e1639380a6c5c-20200817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 639794356; Mon, 17 Aug 2020 20:15:14 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 21:12:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 12:12:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 12:12:29 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7663s: fix unable to handle kernel paging request
Date: Tue, 18 Aug 2020 12:12:28 +0800
Message-ID: <5941a1b4b394153fa455eab2d057f2d4cdc6889e.1597696208.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_001523_888058_EBE7C617 
X-CRM114-Status: GOOD (  17.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, YN Chen <YN.Chen@mediatek.com>,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Use buffer allocated with kmalloc instead of with stack to fix kernel
crash due to Unable to handle kernel paging request at virtual address
ffffffc0095cbce8.

[  156.977349] Unable to handle kernel paging request at virtual address ffffffc0095cbce8
[  156.985270] Mem abort info:
[  156.988059]   ESR = 0x96000045
[  156.991104]   Exception class = DABT (current EL), IL = 32 bits
[  156.997013]   SET = 0, FnV = 0
[  157.000057]   EA = 0, S1PTW = 0
[  157.003190] Data abort info:
[  157.006061]   ISV = 0, ISS = 0x00000045
[  157.009887]   CM = 0, WnR = 1
[  157.012850] swapper pgtable: 4k pages, 39-bit VAs, pgdp = 0000000042adcba2
[  157.019715] [ffffffc0095cbce8] pgd=0000000000000000, pud=0000000000000000
[  157.026499] Internal error: Oops: 96000045 [#1] PREEMPT SMP
[  157.032065] Modules linked in: mt7663s mt7663_usb_sdio_common mt7615_common

...

[  157.073007] Process CompositorTileW (pid: 1625, stack limit = 0x000000003f2389fc)
[  157.080484] CPU: 0 PID: 1625 Comm: CompositorTileW Not tainted 4.19.137 #36
[  157.092219] pstate: 80000085 (Nzcv daIf -PAN -UAO)
[  157.097012] pc : __memcpy+0xc0/0x180
[  157.100585] lr : swiotlb_tbl_unmap_single+0x84/0x14c
[  157.105540] sp : ffffff8008003cb0
[  157.108845] x29: ffffff8008003cb0 x28: ffffff9c1a211f60
[  157.114149] x27: ffffff9c19ecc018 x26: 0000000000001000
[  157.119452] x25: ffffff9c1a378000 x24: 0000000000000001
[  157.124755] x23: ffffff9c1a378000 x22: 00000000000001ff
[  157.130058] x21: 0000000000000000 x20: 00000000fbefe800
[  157.135360] x19: 0000000000000070 x18: 0000000000000000
[  157.140663] x17: 0000000000000000 x16: 0000000000000000
[  157.145965] x15: 0000000000000000 x14: 0000000000000000
[  157.151267] x13: 0000000000000000 x12: 000000000000000d
[  157.156569] x11: 000000000000000c x10: 0000000a7befe800
[  157.161873] x9 : fffffff680000000 x8 : 0000000000000000
[  157.167175] x7 : 0000000100000003 x6 : ffffffc0095cbce8
[  157.172479] x5 : 0000000000000000 x4 : 0000000000000000
[  157.177781] x3 : 0000000000000002 x2 : fffffffffffffff0
[  157.183085] x1 : ffffffca7befe810 x0 : ffffffc0095cbce8
[  157.188389] Call trace:
[  157.190832]  __memcpy+0xc0/0x180
[  157.194053]  swiotlb_unmap_sg_attrs+0xa8/0xb0
[  157.198406]  __swiotlb_unmap_sg_attrs+0x8c/0xa4
[  157.202931]  msdc_unprepare_data+0x6c/0x84
[  157.207019]  msdc_request_done+0x58/0x98
[  157.210934]  msdc_data_xfer_done+0x1a8/0x1d0
[  157.215195]  msdc_irq+0x12c/0x17c
[  157.218505]  __handle_irq_event_percpu+0xd8/0x298
[  157.223202]  handle_irq_event+0x60/0xdc
[  157.227031]  handle_fasteoi_irq+0xa4/0x1d4
[  157.231120]  __handle_domain_irq+0x84/0xc4
[  157.235210]  gic_handle_irq+0x124/0x1a4
[  157.239038]  el0_irq_naked+0x4c/0x54
[  157.242608] Code: 14000028 f1020042 5400024a a8c12027 (a88120c7)
[  157.248693] ---[ end trace 28b8090135b0a2e1 ]---
[  157.265589] Kernel panic - not syncing: Fatal exception in interrupt
[  157.271944] SMP: stopping secondary CPUs
[  157.275865] Kernel Offset: 0x1c10e00000 from 0xffffff8008000000
[  157.281779] CPU features: 0x0,2188200c
[  157.285519] Memory Limit: none

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h      |  1 +
 .../net/wireless/mediatek/mt76/mt7615/sdio.c   |  8 ++++++++
 .../wireless/mediatek/mt76/mt7615/sdio_txrx.c  | 18 +++++++++---------
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 3d5037afd5ea..94fa835e9134 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -464,6 +464,7 @@ struct mt76_sdio {
 	struct work_struct stat_work;
 
 	struct sdio_func *func;
+	void *intr_data;
 
 	struct {
 		struct mutex lock;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 56f65345d048..e0603e82e33d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -379,6 +379,14 @@ static int mt7663s_probe(struct sdio_func *func,
 		    (mt76_rr(dev, MT_HW_REV) & 0xff);
 	dev_dbg(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
+	mdev->sdio.intr_data = devm_kmalloc(mdev->dev,
+					    sizeof(struct mt76s_intr),
+					    GFP_KERNEL);
+	if (!mdev->sdio.intr_data) {
+		ret = -ENOMEM;
+		goto err_deinit;
+	}
+
 	ret = mt76s_alloc_queues(&dev->mt76);
 	if (ret)
 		goto err_deinit;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
index c945b4e0320d..a589fd5535db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
@@ -221,35 +221,35 @@ void mt7663s_rx_work(struct work_struct *work)
 	struct mt76_sdio *sdio = container_of(work, struct mt76_sdio,
 					      rx.recv_work);
 	struct mt76_dev *dev = container_of(sdio, struct mt76_dev, sdio);
-	struct mt76s_intr intr;
+	struct mt76s_intr *intr = sdio->intr_data;
 	int nframes = 0, ret;
 
 	/* disable interrupt */
 	sdio_claim_host(sdio->func);
 	sdio_writel(sdio->func, WHLPCR_INT_EN_CLR, MCR_WHLPCR, 0);
-	sdio_readsb(sdio->func, &intr, MCR_WHISR, sizeof(struct mt76s_intr));
+	sdio_readsb(sdio->func, intr, MCR_WHISR, sizeof(struct mt76s_intr));
 	sdio_release_host(sdio->func);
 
-	trace_dev_irq(dev, intr.isr, 0);
+	trace_dev_irq(dev, intr->isr, 0);
 
-	if (intr.isr & WHIER_RX0_DONE_INT_EN) {
-		ret = mt7663s_rx_run_queue(dev, 0, &intr);
+	if (intr->isr & WHIER_RX0_DONE_INT_EN) {
+		ret = mt7663s_rx_run_queue(dev, 0, intr);
 		if (ret > 0) {
 			queue_work(sdio->txrx_wq, &sdio->rx.net_work);
 			nframes += ret;
 		}
 	}
 
-	if (intr.isr & WHIER_RX1_DONE_INT_EN) {
-		ret = mt7663s_rx_run_queue(dev, 1, &intr);
+	if (intr->isr & WHIER_RX1_DONE_INT_EN) {
+		ret = mt7663s_rx_run_queue(dev, 1, intr);
 		if (ret > 0) {
 			queue_work(sdio->txrx_wq, &sdio->rx.net_work);
 			nframes += ret;
 		}
 	}
 
-	if (intr.isr & WHIER_TX_DONE_INT_EN) {
-		mt7663s_refill_sched_quota(dev, intr.tx.wtqcr);
+	if (intr->isr & WHIER_TX_DONE_INT_EN) {
+		mt7663s_refill_sched_quota(dev, intr->tx.wtqcr);
 		queue_work(sdio->txrx_wq, &sdio->tx.xmit_work);
 	}
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
