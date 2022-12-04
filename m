Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C750FC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4HfwTMVIfqnxQeM/flMEBiTJlOTdLbyktmNQbCgMZLs=; b=FbQ6NGcZTx/A6E0tKGGFFUBNBW
	dQMvWCQ4U+5nj85lCOMHMBspeoTKAQZnH5YgesiVbzblu/dTemDFofkKd9FIzPNhBEmjHqhrLjFxB
	JUoIv0gbvPu38wpWd4FmazdPDc8/NAs2tc+e5bGuw3tL3dJyFmaqL72H2YyGVB2+wcPhoyVFX1WCH
	fi0pglqSAF1oChRMDcn02WWXYp652FaJM/7Bm5aDTmLZluB2dxluXUQIu6m7FxKwJ8np1LhJWgX6K
	PdCfCXskv9dREuBCc1bCi6gtqced4jOzQglV+oYS+QyXRbdtjAlJ8/pH4ICkJbXBKBkSy7iiMeUnR
	rg4Pf1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1koE-0077yv-6n; Sun, 04 Dec 2022 08:57:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1koB-0077y4-LK
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 08:57:13 +0000
X-UUID: 42c8024af37f469c84587ee7fde1ddec-20221204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4HfwTMVIfqnxQeM/flMEBiTJlOTdLbyktmNQbCgMZLs=;
	b=KWZ2wqBa3EvUKgBWo36d7HzBXuTCUjpkcwnzza3H7hu6U1v7EhrypWe3sHLq9RMel/LpxC3bN5FD9zKNk5+XunhCw+mhGjZqGcsBNzWSrKw8bK35Gt0UZZ7Nm3MiKazDwqKpCW5O44Vyhye594LqO8f5DeLZT8qr1qRlr6kUQew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:a8657f7c-ce9a-4386-801c-92386962fe3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:64e17b6c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 42c8024af37f469c84587ee7fde1ddec-20221204
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 621994360; Sun, 04 Dec 2022 01:56:59 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 4 Dec 2022 16:26:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 4 Dec 2022 16:26:55 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: linux-mmc <linux-mmc@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mmc: vub300: fix warning - do not call blocking ops when !TASK_RUNNING
Date: Sun, 4 Dec 2022 16:24:16 +0800
Message-ID: <87dc45b122d26d63c80532976813c9365d7160b3.1670140888.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_005711_884536_FCB48D29 
X-CRM114-Status: GOOD (  10.46  )
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

vub300_enable_sdio_irq() works with mutex and need TASK_RUNNING here.
Ensure that we mark current as TASK_RUNNING for sleepable context.

[   77.554641] do not call blocking ops when !TASK_RUNNING; state=1 set at [<ffffffff92a72c1d>] sdio_irq_thread+0x17d/0x5b0
[   77.554652] WARNING: CPU: 2 PID: 1983 at kernel/sched/core.c:9813 __might_sleep+0x116/0x160
[   77.554905] CPU: 2 PID: 1983 Comm: ksdioirqd/mmc1 Tainted: G           OE      6.1.0-rc5 #1
[   77.554910] Hardware name: Intel(R) Client Systems NUC8i7BEH/NUC8BEB, BIOS BECFL357.86A.0081.2020.0504.1834 05/04/2020
[   77.554912] RIP: 0010:__might_sleep+0x116/0x160
[   77.554920] RSP: 0018:ffff888107b7fdb8 EFLAGS: 00010282
[   77.554923] RAX: 0000000000000000 RBX: ffff888118c1b740 RCX: 0000000000000000
[   77.554926] RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffed1020f6ffa9
[   77.554928] RBP: ffff888107b7fde0 R08: 0000000000000001 R09: ffffed1043ea60ba
[   77.554930] R10: ffff88821f5305cb R11: ffffed1043ea60b9 R12: ffffffff93aa3a60
[   77.554932] R13: 000000000000011b R14: 7fffffffffffffff R15: ffffffffc0558660
[   77.554934] FS:  0000000000000000(0000) GS:ffff88821f500000(0000) knlGS:0000000000000000
[   77.554937] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.554939] CR2: 00007f8a44010d68 CR3: 000000024421a003 CR4: 00000000003706e0
[   77.554942] Call Trace:
[   77.554944]  <TASK>
[   77.554952]  mutex_lock+0x78/0xf0
[   77.554973]  vub300_enable_sdio_irq+0x103/0x3c0 [vub300]
[   77.554981]  sdio_irq_thread+0x25c/0x5b0
[   77.555006]  kthread+0x2b8/0x370
[   77.555017]  ret_from_fork+0x1f/0x30
[   77.555023]  </TASK>
[   77.555025] ---[ end trace 0000000000000000 ]---

Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/mmc/host/vub300.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 97beece62fec..b58a1a869ed8 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -2049,6 +2049,7 @@ static void vub300_enable_sdio_irq(struct mmc_host *mmc, int enable)
 		return;
 	kref_get(&vub300->kref);
 	if (enable) {
+		set_current_state(TASK_RUNNING);
 		mutex_lock(&vub300->irq_mutex);
 		if (vub300->irqs_queued) {
 			vub300->irqs_queued -= 1;
@@ -2064,6 +2065,7 @@ static void vub300_enable_sdio_irq(struct mmc_host *mmc, int enable)
 			vub300_queue_poll_work(vub300, 0);
 		}
 		mutex_unlock(&vub300->irq_mutex);
+		set_current_state(TASK_INTERRUPTIBLE);
 	} else {
 		vub300->irq_enabled = 0;
 	}
-- 
2.18.0


