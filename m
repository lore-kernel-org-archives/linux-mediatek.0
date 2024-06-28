Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFA4C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh6uNj3A7Ko+zRphreOKDq542cH5AqTU7W1dJNkr1vw=; b=L6hS+V4kXYJBMm8aiXjFIJL/4J
	VMfuk/8p/qic6mlXrTvIRB8yFddoBEnXi9yKMja8Xdy3yBx7AchQ/FQQz6QyrNFGOIl05U1cg+1Vi
	DleTg6v+4Jm2lWITgL1+JiJZxT3Es1JibgmLfzi5MyDdTqOToQD3TrOUWQ+DTfpT6cuU5nTSFhQ5C
	5tVOhO+qJwdI9bsg5jGm7DZXmj5GdX/uVG98cu0MctmPQcPTthv2KBsmWneiZA0r49rMj3gtCw7s8
	SIKbDnUNt0fV60/pTtpVTBYGxU6bJqSn/4cnkaaHqWhRlH1xBjuvkm0tZ4pNv4Y934I9lrWyKzQba
	t/ALHMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5bf-0000000Cpys-0mmD;
	Fri, 28 Jun 2024 07:01:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5bc-0000000CpyT-0oMT
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 07:01:13 +0000
X-UUID: 320f4640351c11efb2966dae1f787272-20240628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wh6uNj3A7Ko+zRphreOKDq542cH5AqTU7W1dJNkr1vw=;
	b=YCWSAZSOWJNCwtfqveVaE+8Wi+xbl+x9Boplwikz3qf4iUUJhjTwlGT40sE4H8ZdvTWqotjM0aX7/qubhitRZ4lpYZfvfhWKiBoi64mVykv0uSgLkVx+SHCkR28MGyQ8sUxGu2r8ZS7A724Nsg+LM6E6z6faUHZYbl4HQN/JjaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:4d4cfa6f-85a6-4be0-a71a-0e3d49d55222,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:ccded20c-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 320f4640351c11efb2966dae1f787272-20240628
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1789821517; Fri, 28 Jun 2024 00:01:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v3 2/2] ufs: core: fix ufshcd_abort_one racing issue
Date: Fri, 28 Jun 2024 15:00:30 +0800
Message-ID: <20240628070030.30929-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240628070030.30929-1-peter.wang@mediatek.com>
References: <20240628070030.30929-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.795300-8.000000
X-TMASE-MatchedRID: B6j6C829dRoMQLXc2MGSbEKcYi5Qw/RVFJFr2qlKix9nerzbhugqsuzz
	FwuJC8FLEcE+LOiKuIsDmpu0GuIWwdeV00rMo+W9zfqlpbtmcWgK3n1SHen81ZOh3HiqoNeSNwa
	LRw5VVqwbUWQQYnnz4BqaNktB1R5hFkrTnESQKQL62mDKTRDEUjQAp53S718Hu6qThyrnanOVKC
	sVAPS5vMuV9ObvGZuCgDLqnrRlXrZLA5JD98yI6t0H8LFZNFG7bkV4e2xSge4AnhRo9bGPNF59t
	PEVkQsijw/8Gsb4VTkFhbaMJ2w1VzZFEgw6u+Np
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.795300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DDBB1502EC6093ED5CD2F1B8BC3959553E05698E420C7E68111624097E5F663D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_000112_246553_D43DB52A 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

When ufshcd_abort_one racing with complete ISR,
the completed tag of request's mq_hctx pointer will set NULL by ISR.
Same as previous patch race condition.
Return success when request is completed by ISR beacuse ufshcd_abort_one
dose't need do anything.

The racing flow is:

Thread A
ufshcd_err_handler					step 1
	...
	ufshcd_abort_one
		ufshcd_try_to_abort_task
			ufshcd_cmd_inflight(true)	step 3
		ufshcd_mcq_req_to_hwq
			blk_mq_unique_tag
				rq->mq_hctx->queue_num	step 5

Thread B
ufs_mtk_mcq_intr(cq complete ISR)			step 2
	scsi_done
		...
		__blk_mq_free_request
			rq->mq_hctx = NULL;		step 4

Below is KE back trace.
  ufshcd_try_to_abort_task: cmd at tag 41 not pending in the device.
  ufshcd_try_to_abort_task: cmd at tag=41 is cleared.
  Aborting tag 41 / CDB 0x28 succeeded
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000194
  pc : [0xffffffddd7a79bf8] blk_mq_unique_tag+0x8/0x14
  lr : [0xffffffddd6155b84] ufshcd_mcq_req_to_hwq+0x1c/0x40 [ufs_mediatek_mod_ise]
   do_mem_abort+0x58/0x118
   el1_abort+0x3c/0x5c
   el1h_64_sync_handler+0x54/0x90
   el1h_64_sync+0x68/0x6c
   blk_mq_unique_tag+0x8/0x14
   ufshcd_err_handler+0xae4/0xfa8 [ufs_mediatek_mod_ise]
   process_one_work+0x208/0x4fc
   worker_thread+0x228/0x438
   kthread+0x104/0x1d4
   ret_from_fork+0x10/0x20

Fixes: 93e6c0e19d5b ("scsi: ufs: core: Clear cmd if abort succeeds in MCQ mode")
Cc: <stable@vger.kernel.org> 6.6.x
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e5e9da61f15d..7214417a5ddc 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6456,6 +6456,8 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 	/* Release cmd in MCQ mode if abort succeeds */
 	if (is_mcq_enabled(hba) && (*ret == 0)) {
 		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(lrbp->cmd));
+		if (!hwq)
+			return 0;
 		spin_lock_irqsave(&hwq->cq_lock, flags);
 		if (ufshcd_cmd_inflight(lrbp->cmd))
 			ufshcd_release_scsi_cmd(hba, lrbp);
-- 
2.18.0


