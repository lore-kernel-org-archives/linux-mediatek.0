Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62689C2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jx3ue8Ar3TfZ8NOq5r90AdDZ1RkmWQmSLiAuCfau2zY=; b=TGYRNQWlBnM/5GgQ1xXt6/twHh
	eqAs1vGRpIZUdTj9om9lbCP3eP73T2FCRlxbyacwhNGl3lLfoqHyFeDVLxcrdVRaJzjCprfGW0dcf
	dWhIIaJmjq4i2jSvelXiJdsjYqCaqc+2uDKlOiy0C105HD1QOHZVZhFSPGitEHG+WEg8HsNBROSPc
	mf2HQ6N0sYbZsNyJW4NpCQjq6jqGoNv9p35Jsf9kvx8ZtmpJsnN4QOrHdSvzj68dYdEAt6TqrXx3H
	dED41AL98M7Mgm3ErwCeYph+mx/QLVDEdnodcETTkiipYxddHT59FWRZ4XHz3KYmg+4tqA3ODeXtn
	XCpzEfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcU0-00000008ww6-1eqQ;
	Fri, 21 Jun 2024 11:31:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcTw-00000008wti-2ayz
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jun 2024 11:31:07 +0000
X-UUID: ba43d0862fc111efb2966dae1f787272-20240621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Jx3ue8Ar3TfZ8NOq5r90AdDZ1RkmWQmSLiAuCfau2zY=;
	b=DIBWxHUZzgXVfVnsUFYXuktW+2fRI5eXDIyByHTUQQk3RUK4XBojT1gvezFDEJqc/4oG9auh7yBhuRqpJU6pLMWJfqrOy31ZGPO5lTx5oMtkYKo4MYmtPcBPSCx+yQ6Q9aelCB96hztWvmcpOBGatXScYKkxDOaM35ErNesF7bw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:5b1072d8-04a3-4930-af45-572228cc0f17,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:90955f85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ba43d0862fc111efb2966dae1f787272-20240621
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 825183786; Fri, 21 Jun 2024 04:30:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jun 2024 19:30:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jun 2024 19:30:53 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1] ufs: core: fix ufshcd_abort_all racing issue
Date: Fri, 21 Jun 2024 19:30:51 +0800
Message-ID: <20240621113051.29523-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.140500-8.000000
X-TMASE-MatchedRID: B6j6C829dRoMQLXc2MGSbEKcYi5Qw/RVFJFr2qlKix/FJnEpmt9OE34U
	OBQdfZJqNhxcj7T04bO1ONGFQGwumuV35K+BqYWNGVyS87Wb4lx+tO36GYDlsk04B0iWfKSh+oA
	N6qKcRV8Sz/bGxf+BBjB+UUO5j2rBb3gilrWi3GiQOktEo73GFFV+08YFNHSuw01zN1c0miKta8
	DXVXWIqS/rjK1CMnpugDLqnrRlXrZLA5JD98yI6t0H8LFZNFG7bkV4e2xSge4yADhXDNGAIQ2iQ
	dawUz6dGwR9SxBnBcu95FVNTq1SdLAUyUg9ogFt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.140500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4BE08DA094D3E70E7AA5F455192B14E04C44E67A2A183599B6F75E2299A121B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_043104_720715_23240D71 
X-CRM114-Status: GOOD (  12.49  )
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

When ufshcd_abort_all racing with complete ISR,
the completed tag of request will be release by ISR.
And ufshca_abort_all call ufshcd_mcq_req_to_hwq will
get NULL pointer KE.
Also change the return value success when request is
completed by ISR beacuse sq dosen't need cleanup.

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

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 5 +++--
 drivers/ufs/core/ufshcd.c  | 9 +++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 8944548c30fa..3b2e5bcb08a7 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -512,8 +512,9 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 		return -ETIMEDOUT;
 
 	if (task_tag != hba->nutrs - UFSHCD_NUM_RESERVED) {
-		if (!cmd)
-			return -EINVAL;
+		/* Should return 0 if cmd is already complete by irq */
+		if (!cmd || !ufshcd_cmd_inflight(cmd))
+			return 0;
 		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
 	} else {
 		hwq = hba->dev_cmd_queue;
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e5e9da61f15d..e8bca62ceed8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6455,11 +6455,12 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 
 	/* Release cmd in MCQ mode if abort succeeds */
 	if (is_mcq_enabled(hba) && (*ret == 0)) {
-		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(lrbp->cmd));
-		spin_lock_irqsave(&hwq->cq_lock, flags);
-		if (ufshcd_cmd_inflight(lrbp->cmd))
+		if (ufshcd_cmd_inflight(lrbp->cmd)) {
+			hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(lrbp->cmd));
+			spin_lock_irqsave(&hwq->cq_lock, flags);
 			ufshcd_release_scsi_cmd(hba, lrbp);
-		spin_unlock_irqrestore(&hwq->cq_lock, flags);
+			spin_unlock_irqrestore(&hwq->cq_lock, flags);
+		}
 	}
 
 	return *ret == 0;
-- 
2.18.0


