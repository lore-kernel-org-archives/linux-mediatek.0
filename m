Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76862C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 06:08:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E3820774
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 06:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QzE4qdL3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dDPeR2Bv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E3820774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MYbHRcVRnL2uWD4V7FxnnhUxiKUdycvSWq8bDdQZfhs=; b=QzE4qdL3Z8cqElirBOT90pEOF
	VwHZvrTjjd3cV6XBw2X3mCK8AZ12/pAqiIgVTZYerIReLr2e64cC5gNUqBFFIJk3cC1MKpYofYEDZ
	XQKvAIya15Si2tewnq1LogjCDBBzTHrCZrnj9p4Xum25RdzKGdCAPo0XCxG4UX73SG8TDf4reLZhZ
	oEjwsXu/Qyo0ZWBF69tqOjj4uzXDBLPeb9u4f73Ruvxx5NYG22W6/m689NtakJuy9+8CCNUHj1XoI
	VpfdX2SfUd4G9yXv5zxGuhApabAKITd2irvKr/whSlqHZYFCTNF8oBeQB6QeirRjhdhPAcfAFca7D
	WlaJhE4eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsKIM-0007HI-4V; Mon, 06 Jul 2020 06:08:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsKIH-0007GN-PZ; Mon, 06 Jul 2020 06:07:58 +0000
X-UUID: 3c0c196f062b432297c7e722530ad537-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K3vnY4vJ20RrpHZtSxjh1pS6uvuzwjSGdbDQC5YzlTA=; 
 b=dDPeR2BvQbtjE/+YK0FSLimrPno8x7S5Jf1ZGUc2W5G6KLxFk50rGl15/Ir2nuE34E4MsYF/l0oa087yGm8qI4/kHGnrkiftOChWILMLy2bhKyLpbcv8yON/j03OkM59MkG7dZufY9XZpS1fzVEFQa8xjO4b9+u+WwOKn43mVEQ=;
X-UUID: 3c0c196f062b432297c7e722530ad537-20200705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1266626824; Sun, 05 Jul 2020 22:07:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 23:07:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 14:07:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Jul 2020 14:07:05 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v1 2/2] scsi: ufs: Fix and simplify setup_xfer_req variant
 operation
Date: Mon, 6 Jul 2020 14:07:07 +0800
Message-ID: <20200706060707.32608-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200706060707.32608-1-stanley.chu@mediatek.com>
References: <20200706060707.32608-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3B79C800335062181EE35A37B171FE0DD4A7E7E504399B0E527962A6C9E7EB602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_020757_991651_34A45D86 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add missing "setup_xfer_req" call in ufshcd_issue_devman_upiu_cmd()
by ufs-bsg path, and collect all "setup_xfer_req" calls to an unified
place, i.e., ufshcd_send_command(), to simplify the driver.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 71e8d7c782bd..8603b07045a6 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1925,8 +1925,11 @@ static void ufshcd_clk_scaling_update_busy(struct ufs_hba *hba)
 static inline
 void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag)
 {
-	hba->lrb[task_tag].issue_time_stamp = ktime_get();
-	hba->lrb[task_tag].compl_time_stamp = ktime_set(0, 0);
+	struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
+
+	lrbp->issue_time_stamp = ktime_get();
+	lrbp->compl_time_stamp = ktime_set(0, 0);
+	ufshcd_vops_setup_xfer_req(hba, task_tag, (lrbp->cmd ? true : false));
 	ufshcd_add_command_trace(hba, task_tag, "send");
 	ufshcd_clk_scaling_start_busy(hba);
 	__set_bit(task_tag, &hba->outstanding_reqs);
@@ -2544,7 +2547,6 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 
 	/* issue command to the controller */
 	spin_lock_irqsave(hba->host->host_lock, flags);
-	ufshcd_vops_setup_xfer_req(hba, tag, true);
 	ufshcd_send_command(hba, tag);
 out_unlock:
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
@@ -2731,7 +2733,6 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
 	/* Make sure descriptors are ready before ringing the doorbell */
 	wmb();
 	spin_lock_irqsave(hba->host->host_lock, flags);
-	ufshcd_vops_setup_xfer_req(hba, tag, false);
 	ufshcd_send_command(hba, tag);
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
