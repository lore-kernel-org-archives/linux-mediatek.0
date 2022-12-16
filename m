Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B491AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 03:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2mEp0WUODIj5kqMh7KIiuG3LhKqtAh/A0pYoODwnxvo=; b=yL4uoWJukzrY2WCgZ/wDrwNEWv
	XvBQSlUNHqczpmbY6l+7ope1d/UVJB0CDPSZCmfGwPWwVOLFxhyUiwyBdtDHngoDEkm0GTz5zdtw0
	Ns/+QI2Vbb5EPkdp5Zmdlv3qSFAR9IB++OWouB+/J6Qh8+1l8bZF0487AYQSpt31uyRqye7ojDmea
	eXl27RuZJPHJZnJJ6LcRZ+rEm3LUbg05LbOU+uMaHZ3VDRTyoenJmlrTIW95V0t20I2oxRZTqGnF0
	iSpV0g+gNhKQGs0H7soblZiODm0LBLZU4eQDFkmhIcN74SpaPQvKfoE79W5BEcEzHAbFta+XIJeGn
	ibWg2Agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p61aH-00CcWl-0S; Fri, 16 Dec 2022 03:40:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p61aE-00CcUz-B0; Fri, 16 Dec 2022 03:40:27 +0000
X-UUID: b15bf2ccee624c24a844e66e9e5cf247-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2mEp0WUODIj5kqMh7KIiuG3LhKqtAh/A0pYoODwnxvo=;
	b=lf0awVcrPxcEiPYwpvOUKpgNM6b4SYn93zh8CqcisLxmswYIQ3o6BWojRCEUkvScLWehpgpUg225tiYwmVmfqA3uuTpkjWKrMcHWe490vOfnlhVdijyAI6q4IlyQAJYq4b7AM5wytFE18Hdum4Iz9PO4NZ/5tPTRIiW08ZFxN14=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:696d0c2e-5029-467e-80b4-46bf292e3483,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:696d0c2e-5029-467e-80b4-46bf292e3483,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:5017ccaf-9f02-4d44-9c44-6e4bb4e4f412,B
	ulkID:2212161140013RBL2DEL,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: b15bf2ccee624c24a844e66e9e5cf247-20221215
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mason.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2018244316; Thu, 15 Dec 2022 20:40:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Dec 2022 11:39:41 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Dec 2022 11:39:40 +0800
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
Subject: [PATCH v4 1/1] scsi: ufs: core: fix device management cmd timeout flow
Date: Fri, 16 Dec 2022 11:25:33 +0800
Message-ID: <20221216032532.1280-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_194026_405122_9AE20A36 
X-CRM114-Status: GOOD (  12.80  )
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
Changes since v3:
* Not clear outstanding_reqs if clear cmds fail.
  Updated the patch in v4.
Changes since v2:
* Modified comment after clear doorbell.
Changes since v1:
* Remove change id.
---
 drivers/ufs/core/ufshcd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index b1f59a5fe632..fa86ce80f350 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3008,6 +3008,22 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 		} else {
 			dev_err(hba->dev, "%s: failed to clear tag %d\n",
 				__func__, lrbp->task_tag);
+
+			spin_lock_irqsave(&hba->outstanding_lock, flags);
+			pending = test_bit(lrbp->task_tag,
+					   &hba->outstanding_reqs);
+			if (pending)
+				hba->dev_cmd.complete = NULL;
+			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+
+			if (!pending) {
+				/*
+				 * The completion handler ran while we tried to
+				 * clear the command.
+				 */
+				time_left = 1;
+				goto retry;
+			}
 		}
 	}
 
-- 
2.18.0


