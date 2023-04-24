Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4496C7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 03:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cJjSUzYBS7tQHc7k1Nb/PjaSB03OxKluK5vLuchdEOM=; b=xUwNSc0ASqbOzQbhoLLLNkcdKD
	wYO4/6lHfiTEyNNOjAfSiXY5LPgDIxlAkcbYXuAEmWPOK2mnGvyhi1QOca07jMhFsVdiAT5q2FaxV
	/zidW2PgKB3TJfi/DTifAq38+0HfAFAE6I/GFf+nlCSTKauWK9kgOe+LYU8lnbY2wzXu0UtrWDHZr
	ysnMujo67EEpXSGbkW0uB1JPcByiP/KXcIXw7ueW0HJ6F39NfmEA6izLIzTrcfPduL/WFErNzhrzE
	KmQLsbOFNt8tPDEsNELgc1t6+KQULn6X6JcMbxEELsSSL7J3c3EzZ0rKDB37kp/p1+4f6MSVVomvv
	X9n33B8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqnMH-00FFjr-1v;
	Mon, 24 Apr 2023 03:59:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqnMF-00FFjJ-02;
	Mon, 24 Apr 2023 03:59:20 +0000
X-UUID: 6228cf66e25411edb7d8d11f642b8e78-20230423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cJjSUzYBS7tQHc7k1Nb/PjaSB03OxKluK5vLuchdEOM=;
	b=Gnbdezs3Dbpc9uMkiPeGsDZgwSwjb84otZ9fR7T+jLjfos37cbQ7aP+83y97ycn+l9VsbznkfCHCNUt4RYCU6GbQm9Tc3Ie3VSmbeV/6ptkFbOsoBO++58lDMAX8pHFjiRgquH4M28Hbk7lsv5pPaYMhZ7FjhCGesjGYrRTz+2Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:7280bda5-ee8d-4a62-b94a-6242e64a8b40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:9330e8eb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 6228cf66e25411edb7d8d11f642b8e78-20230423
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <alice.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1676130373; Sun, 23 Apr 2023 20:59:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Apr 2023 11:38:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 24 Apr 2023 11:38:42 +0800
From: Alice Chao <alice.chao@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>, Stanley Chu <stanley.chu@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>, Can Guo <quic_cang@quicinc.com>
CC: <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <powen.kao@mediatek.com>,
	<naomi.chu@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<wsd_upstream@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] scsi: ufs: core: Fix &hwq->cq_lock deadlock issue
Date: Mon, 24 Apr 2023 11:38:35 +0800
Message-ID: <20230424033839.20410-1-alice.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_205919_060473_75AE09CE 
X-CRM114-Status: GOOD (  13.27  )
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

[name:lockdep&]WARNING: inconsistent lock state
[name:lockdep&]--------------------------------
[name:lockdep&]inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
[name:lockdep&]kworker/u16:4/260 [HC0[0]:SC0[0]:HE1:SE1] takes:
  ffffff8028444600 (&hwq->cq_lock){?.-.}-{2:2}, at:
ufshcd_mcq_poll_cqe_lock+0x30/0xe0
[name:lockdep&]{IN-HARDIRQ-W} state was registered at:
  lock_acquire+0x17c/0x33c
  _raw_spin_lock+0x5c/0x7c
  ufshcd_mcq_poll_cqe_lock+0x30/0xe0
  ufs_mtk_mcq_intr+0x60/0x1bc [ufs_mediatek_mod]
  __handle_irq_event_percpu+0x140/0x3ec
  handle_irq_event+0x50/0xd8
  handle_fasteoi_irq+0x148/0x2b0
  generic_handle_domain_irq+0x4c/0x6c
  gic_handle_irq+0x58/0x134
  call_on_irq_stack+0x40/0x74
  do_interrupt_handler+0x84/0xe4
  el1_interrupt+0x3c/0x78
<snip>

Possible unsafe locking scenario:
       CPU0
       ----
  lock(&hwq->cq_lock);
  <Interrupt>
    lock(&hwq->cq_lock);
  *** DEADLOCK ***
2 locks held by kworker/u16:4/260:

[name:lockdep&]
 stack backtrace:
CPU: 7 PID: 260 Comm: kworker/u16:4 Tainted: G S      W  OE
6.1.17-mainline-android14-2-g277223301adb #1
Workqueue: ufs_eh_wq_0 ufshcd_err_handler

 Call trace:
  dump_backtrace+0x10c/0x160
  show_stack+0x20/0x30
  dump_stack_lvl+0x98/0xd8
  dump_stack+0x20/0x60
  print_usage_bug+0x584/0x76c
  mark_lock_irq+0x488/0x510
  mark_lock+0x1ec/0x25c
  __lock_acquire+0x4d8/0xffc
  lock_acquire+0x17c/0x33c
  _raw_spin_lock+0x5c/0x7c
  ufshcd_mcq_poll_cqe_lock+0x30/0xe0
  ufshcd_poll+0x68/0x1b0
  ufshcd_transfer_req_compl+0x9c/0xc8
  ufshcd_err_handler+0x3bc/0xea0
  process_one_work+0x2f4/0x7e8
  worker_thread+0x234/0x450
  kthread+0x110/0x134
  ret_from_fork+0x10/0x20

ufs_mtk_mcq_intr() could refer to
https://lore.kernel.org/all/20230328103423.10970-3-powen.kao@mediatek.com/

When ufshcd_err_handler() is executed, CQ event interrupt can enter
waiting for the same lock. It could happened in upstream code path
ufshcd_handle_mcq_cq_events() and also in ufs_mtk_mcq_intr(). This
warning message will be generated when &hwq->cq_lock is used in IRQ
context with IRQ enabled. Use ufshcd_mcq_poll_cqe_lock() with
spin_lock_irqsave instead of spin_lock to resolve the deadlock issue.

Fixes: ed975065c31c ("scsi: ufs: core: mcq: Add completion support in poll")
Signed-off-by: Alice Chao <alice.chao@mediatek.com>
---
Change since v1
-Change commit: Fix title
-Add commit: Add Fixes: tag
---
 drivers/ufs/core/ufs-mcq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 31df052fbc41..202ff71e1b58 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -299,11 +299,11 @@ EXPORT_SYMBOL_GPL(ufshcd_mcq_poll_cqe_nolock);
 unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
 				       struct ufs_hw_queue *hwq)
 {
-	unsigned long completed_reqs;
+	unsigned long completed_reqs, flags;
 
-	spin_lock(&hwq->cq_lock);
+	spin_lock_irqsave(&hwq->cq_lock, flags);
 	completed_reqs = ufshcd_mcq_poll_cqe_nolock(hba, hwq);
-	spin_unlock(&hwq->cq_lock);
+	spin_unlock_irqrestore(&hwq->cq_lock, flags);
 
 	return completed_reqs;
 }
-- 
2.18.0


