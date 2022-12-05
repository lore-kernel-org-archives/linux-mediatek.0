Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F4BC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 02:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9BsRHMoVPm+BDBuWg0FYyhlA3PQRobIouKG13VEGoA=; b=KaPAqkrKAelXNeLedix0vZ6frt
	1PDp73BaVKIBxVWp3QPglZSX6Uyh+K//go65U4yezgstnY2z8p/Yt3J4wzH7J8o+xhYocT/S3PmYt
	8haw0bfcfasZMVjBgb6GQCQjSPiVisFli889hjuokWJFda3Lf1+qajofF1Mwpp9jzgYOqYbTSLERB
	bMKiDsTPto0D1P3zLz1btGN7eE0ic84h2eWapTN2nc9FR0ZKGTwNHOwvMaMWIPBMZyln58UNyIRqX
	qCCDxb5/P7aGRu0PkiixDqXEUZnzTvLQ030fBihVsVOaUOk1lTdnno54u7DkRhjhMAqI04Ce3N0re
	uvvYpcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p21aR-00CofO-HW; Mon, 05 Dec 2022 02:52:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p21aO-00CoYv-Gi; Mon, 05 Dec 2022 02:52:06 +0000
X-UUID: 7b07d9ffb19144a690b383e4d3e54a44-20221204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g9BsRHMoVPm+BDBuWg0FYyhlA3PQRobIouKG13VEGoA=;
	b=DMZ3WnpTUv1rQqtHCswAtQPL8L+UvNwrjYzAEWtkV2KqgDbHQb0CxvoJBgzbAIz5D803xklFTAD1oFvRPWJe4jC5RncV2ip7QzCneZ5Pgux09odcQN++mo7mczCZOLkH7CFUKzwYx/Uy48yniWuwCDaJXmHxT3yJXJF1c68aqJc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:72bf2623-2b6d-431b-8193-d7f9e9a1f4ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:436b886c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7b07d9ffb19144a690b383e4d3e54a44-20221204
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mason.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 875071423; Sun, 04 Dec 2022 19:33:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 5 Dec 2022 09:52:41 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 5 Dec 2022 09:52:40 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E . J . Bottomley"
	<jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
	Stanley Chu <stanley.chu@mediatek.com>, Jinyoung Choi
	<j-young.choi@samsung.com>
CC: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Peter Wang <peter.wang@mediatek.com>, Peng Zhou <peng.zhou@mediatek.com>,
	<wsd_upstream@mediatek.com>, Mason Zhang <Mason.Zhang@mediatek.com>
Subject: [PATCH v2 1/1] scsi: ufs: core: fix device management cmd timeout flow
Date: Mon, 5 Dec 2022 09:42:03 +0800
Message-ID: <20221205014202.2672-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_185204_745604_EA485A6E 
X-CRM114-Status: GOOD (  15.07  )
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

From: Mason Zhang <Mason.Zhang@mediatek.com>

In ufs error handler flow, host will send device management cmd(NOP OUT)
to device for recovery link. If cmd response timeout, and clear doorbell
fail, ufshcd_wait_for_dev_cmd will do nothing and return,
hba->dev_cmd.complete struct not set to null.

In this time, if cmd has been responsed by device, then it will
call complete() in __ufshcd_transfer_req_compl, because of complete
struct is alloced in stack, then the KE will occur.

Fix the following crash:
  ipanic_die+0x24/0x38 [mrdump]
  die+0x344/0x748
  arm64_notify_die+0x44/0x104
  do_debug_exception+0x104/0x1e0
  el1_dbg+0x38/0x54
  el1_sync_handler+0x40/0x88
  el1_sync+0x8c/0x140
  queued_spin_lock_slowpath+0x2e4/0x3c0
  __ufshcd_transfer_req_compl+0x3b0/0x1164
  ufshcd_trc_handler+0x15c/0x308
  ufshcd_host_reset_and_restore+0x54/0x260
  ufshcd_reset_and_restore+0x28c/0x57c
  ufshcd_err_handler+0xeb8/0x1b6c
  process_one_work+0x288/0x964
  worker_thread+0x4bc/0xc7c
  kthread+0x15c/0x264
  ret_from_fork+0x10/0x30

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 46 ++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index b1f59a5fe632..2b4934a562a6 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2979,35 +2979,31 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 		err = -ETIMEDOUT;
 		dev_dbg(hba->dev, "%s: dev_cmd request timedout, tag %d\n",
 			__func__, lrbp->task_tag);
-		if (ufshcd_clear_cmds(hba, 1U << lrbp->task_tag) == 0) {
+		if (ufshcd_clear_cmds(hba, 1U << lrbp->task_tag) == 0)
 			/* successfully cleared the command, retry if needed */
 			err = -EAGAIN;
+		/*
+		 * Since clearing the command succeeded we also need to
+		 * clear the task tag bit from the outstanding_reqs
+		 * variable.
+		 */
+		spin_lock_irqsave(&hba->outstanding_lock, flags);
+		pending = test_bit(lrbp->task_tag,
+				   &hba->outstanding_reqs);
+		if (pending) {
+			hba->dev_cmd.complete = NULL;
+			__clear_bit(lrbp->task_tag,
+				    &hba->outstanding_reqs);
+		}
+		spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+
+		if (!pending) {
 			/*
-			 * Since clearing the command succeeded we also need to
-			 * clear the task tag bit from the outstanding_reqs
-			 * variable.
+			 * The completion handler ran while we tried to
+			 * clear the command.
 			 */
-			spin_lock_irqsave(&hba->outstanding_lock, flags);
-			pending = test_bit(lrbp->task_tag,
-					   &hba->outstanding_reqs);
-			if (pending) {
-				hba->dev_cmd.complete = NULL;
-				__clear_bit(lrbp->task_tag,
-					    &hba->outstanding_reqs);
-			}
-			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
-
-			if (!pending) {
-				/*
-				 * The completion handler ran while we tried to
-				 * clear the command.
-				 */
-				time_left = 1;
-				goto retry;
-			}
-		} else {
-			dev_err(hba->dev, "%s: failed to clear tag %d\n",
-				__func__, lrbp->task_tag);
+			time_left = 1;
+			goto retry;
 		}
 	}
 
-- 
2.18.0


