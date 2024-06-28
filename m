Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74322C30659
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 07:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOLZG0fPLUZI4Kx1KyCZ8oJIi2m2oDZFwUkFX6Rb94c=; b=CMoxzmUnnG6jrYOxaN13fINGLJ
	ZY37yEGmsAd9dPjpM+mCeW9uslmd5euvKNTkS+kW34uvivJAsRxcfIwx4F5sW4n9KWJJDrsrXZyDG
	Z1nQGqxvZp/2x/ZHX+fkLWt8BFcnKRQVhasID0NqUQWT/T5j6HL0dRJFVgmWmiEfSPrBreJKRYhqX
	CmmDb8kQtv2XgJtMuquLJM86jsRMGlopqizBgaFfgJymDOdyG0zP2Wtp05Ic2qN6jZ/KtmDBUBnSW
	74MTfEub0TxTVAZEBUIPxIdS0e/MOIXMoNXJ4Z+UN12FUpXrxb9zNalEHN5//u4P0iL1rVMxCyZUW
	53H8WKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5bB-0000000Cptn-0j7B;
	Fri, 28 Jun 2024 07:00:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5b8-0000000Cpt2-0i7t
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 07:00:43 +0000
X-UUID: 1f358fb6351c11efb2966dae1f787272-20240628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eOLZG0fPLUZI4Kx1KyCZ8oJIi2m2oDZFwUkFX6Rb94c=;
	b=OunPT4PnK+NByHW7unJjeebcoAG38+xUaM/qV1jZed3baa5y82RBy/apKkXmZbooH/qWOMg+/Xp7g+GbJYWrgLJQmJ0W91eJqoxOt1RpPc1p86Y2fY0wOPcc77X+CGT1QyiDLfGCaS1k5ybqeRqi/XI2RLAMTNPvXlEQ+o8st4c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:50f0d7e6-8b1f-4a41-a3b6-632f257e9aca,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:2f5eaa44-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1f358fb6351c11efb2966dae1f787272-20240628
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 863712732; Fri, 28 Jun 2024 00:00:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jun 2024 15:00:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jun 2024 15:00:32 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 1/2] ufs: core: fix ufshcd_clear_cmd racing issue
Date: Fri, 28 Jun 2024 15:00:29 +0800
Message-ID: <20240628070030.30929-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240628070030.30929-1-peter.wang@mediatek.com>
References: <20240628070030.30929-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.414900-8.000000
X-TMASE-MatchedRID: fnR2S3QqRUoMQLXc2MGSbEKcYi5Qw/RVNACnndLvXwfIvQIyugvKdaEP
	LQgibzEi9dqfQ8cn44p1Mm/bnHYgUB2P280ZiGmRnu1HSadECDWuiRuR9mCaukX2ZslDQzOjnCc
	+RLKEo8YLMCxkuTq/ZJPkifTzZWVPEd0YyW6tLbnk7k9yXJiqqoiuaoNXJrK/47E6rstCUYsQr5
	8JtEoLH4xkEcgY5pLA4Fs8REBewRHDiZmOF0V5Feuhtmmz4+rYMB97xsSzwcJbi1ZFDTzcNG19g
	M1gDJGc4vM1YF6AJbbGXyXDzkRpVAtuKBGekqUpI/NGWt0UYPBJl7pFycsuwIOU3H+O8qhagp78
	MHEGFTgd1y1FoLGxsFGUsNMK829j
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.414900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B9C48369B76D977127D7B415F5DCEC9B2060AADCEDF948C795BFF5E2B3F4ED782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_000042_245831_FEC025FE 
X-CRM114-Status: GOOD (  13.23  )
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

From: Peter Wang <peter.wang@mediatek.com>

When ufshcd_clear_cmd racing with complete ISR,
the completed tag of request's mq_hctx pointer will set NULL by ISR.
And ufshcd_clear_cmd call ufshcd_mcq_req_to_hwq will get NULL pointer KE.
Return success when request is completed by ISR beacuse sq dosen't
need cleanup.

The racing flow is:

Thread A
ufshcd_err_handler					step 1
	ufshcd_try_to_abort_task
		ufshcd_cmd_inflight(true)		step 3
		ufshcd_clear_cmd
			...
			ufshcd_mcq_req_to_hwq
			blk_mq_unique_tag
				rq->mq_hctx->queue_num	step 5

Thread B
ufs_mtk_mcq_intr(cq complete ISR)			step 2
	scsi_done
		...
		__blk_mq_free_request
			rq->mq_hctx = NULL;		step 4

Below is KE back trace:

  ufshcd_try_to_abort_task: cmd pending in the device. tag = 6
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000194
   pc : [0xffffffd589679bf8] blk_mq_unique_tag+0x8/0x14
   lr : [0xffffffd5862f95b4] ufshcd_mcq_sq_cleanup+0x6c/0x1cc [ufs_mediatek_mod_ise]
   Workqueue: ufs_eh_wq_0 ufshcd_err_handler [ufs_mediatek_mod_ise]
   Call trace:
    dump_backtrace+0xf8/0x148
    show_stack+0x18/0x24
    dump_stack_lvl+0x60/0x7c
    dump_stack+0x18/0x3c
    mrdump_common_die+0x24c/0x398 [mrdump]
    ipanic_die+0x20/0x34 [mrdump]
    notify_die+0x80/0xd8
    die+0x94/0x2b8
    __do_kernel_fault+0x264/0x298
    do_page_fault+0xa4/0x4b8
    do_translation_fault+0x38/0x54
    do_mem_abort+0x58/0x118
    el1_abort+0x3c/0x5c
    el1h_64_sync_handler+0x54/0x90
    el1h_64_sync+0x68/0x6c
    blk_mq_unique_tag+0x8/0x14
    ufshcd_clear_cmd+0x34/0x118 [ufs_mediatek_mod_ise]
    ufshcd_try_to_abort_task+0x2c8/0x5b4 [ufs_mediatek_mod_ise]
    ufshcd_err_handler+0xa7c/0xfa8 [ufs_mediatek_mod_ise]
    process_one_work+0x208/0x4fc
    worker_thread+0x228/0x438
    kthread+0x104/0x1d4
    ret_from_fork+0x10/0x20

Fixes: 8d7290348992 ("scsi: ufs: mcq: Add supporting functions for MCQ abort")
Cc: <stable@vger.kernel.org> 6.6.x
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 8944548c30fa..c532416aec22 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -105,16 +105,15 @@ EXPORT_SYMBOL_GPL(ufshcd_mcq_config_mac);
  * @hba: per adapter instance
  * @req: pointer to the request to be issued
  *
- * Return: the hardware queue instance on which the request would
- * be queued.
+ * Return: the hardware queue instance on which the request will be or has
+ * been queued. %NULL if the request has already been freed.
  */
 struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 					 struct request *req)
 {
-	u32 utag = blk_mq_unique_tag(req);
-	u32 hwq = blk_mq_unique_tag_to_hwq(utag);
+	struct blk_mq_hw_ctx *hctx = READ_ONCE(req->mq_hctx);
 
-	return &hba->uhq[hwq];
+	return hctx ? &hba->uhq[hctx->queue_num] : NULL;
 }
 
 /**
@@ -515,6 +514,8 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 		if (!cmd)
 			return -EINVAL;
 		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
+		if (!hwq)
+			return 0;
 	} else {
 		hwq = hba->dev_cmd_queue;
 	}
-- 
2.18.0


