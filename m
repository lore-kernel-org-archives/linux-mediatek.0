Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E6DCCA47B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 02:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpqhvdfEYK5ZZYOoJ6lhLz5ZT1YtOCDTcJ5DY0mHDSQ=; b=b88R12v9jc8zF9S53SUFr0Pj0W
	dHUE3HUgkhgkNUJNfksUhooOuktBd8kXgKJLM/pBKWiY/9UrCK/NH5GqmAM0ypLsVrDDk5Vgol60k
	GlEocbfrYy4bj2/Di6zdy3IT8iFRIioEUDOvVsOG4u3j/rmk/fDyS5INpjzTxM2zOTnoqwJ2OnnCV
	phGbUhcV0TT1LYJ7eWkpDMvZp24IX6g2IqSBRQI7DYvifmILAwD8i7ObL+MDd6ih6WU0In9qZnqAx
	vx9ERiWfLXQZle0OzFmIAOIuPRGterYbT8EXrBk5ELM2ULom7EWYRSxl3RYSwMmDcwDZ3q1nD1+jk
	S6SYXI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60pj-003etH-M5; Tue, 28 Jun 2022 02:20:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60p1-003eRm-Vo; Tue, 28 Jun 2022 02:19:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D08A617D2;
	Tue, 28 Jun 2022 02:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BFAC341CB;
	Tue, 28 Jun 2022 02:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382762;
	bh=0eEks71eq30jxvu7+hjsZIbLr6Ginp7ugJUnTaqFP2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4VGGUk5ENNNcK/gWYAJKQuo+p7R+YbKbPhJdsFmwyO44jkUIM/3ZaO/ysvyrK49F
	 AZZANAIIZe7quUSkJJR3LpMi7hPUB4sEhicjWB9EGJHuRxfEBhsdPVaVKgCLdWjJzq
	 qQEm0HwTVohGQmsNFTNjyM617zSk6m5y6COgedTj0dqftfIVylJZuKSAgYY2mbpQzy
	 HK9A2Ycmo70k0/HjhKwCLERBZAiQtMMNcWsBY3nh3zFtMNmpEmCR1X99UpbOXCzv2d
	 xEefS1DgB2yhy8Ou8yaHaUX2lFc/cBS7dsgr9Y5Mai1bvLRYxkh1eV1uVgH6f3DhY7
	 Q4zxl6RK5h0kQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	beanhuo@micron.com,
	avri.altman@wdc.com,
	daejun7.park@samsung.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 16/53] scsi: ufs: Fix a race between the interrupt handler and the reset handler
Date: Mon, 27 Jun 2022 22:18:02 -0400
Message-Id: <20220628021839.594423-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_191924_169221_094A6894 
X-CRM114-Status: GOOD (  16.39  )
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

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 2acd76e7b8596e307fcec8fc6bc5fe5ab174749a ]

Prevent that both the interrupt handler and the reset handler try to
complete a request at the same time. This patch is the result of an
analysis of the following crash:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000120
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           OE     5.10.107-android13-4-00051-g1e48e8970cca-ab8664745 #1
pc : ufshcd_release_scsi_cmd+0x30/0x46c
lr : __ufshcd_transfer_req_compl+0x4fc/0x9c0
Call trace:
 ufshcd_release_scsi_cmd+0x30/0x46c
 __ufshcd_transfer_req_compl+0x4fc/0x9c0
 ufshcd_poll+0xf0/0x208
 ufshcd_sl_intr+0xb8/0xf0
 ufshcd_intr+0x168/0x2f4
 __handle_irq_event_percpu+0xa0/0x30c
 handle_irq_event+0x84/0x178
 handle_fasteoi_irq+0x150/0x2e8
 __handle_domain_irq+0x114/0x1e4
 gic_handle_irq.31846+0x58/0x300
 el1_irq+0xe4/0x1c0
 cpuidle_enter_state+0x3ac/0x8c4
 do_idle+0x2fc/0x55c
 cpu_startup_entry+0x84/0x90
 kernel_init+0x0/0x310
 start_kernel+0x0/0x608
 start_kernel+0x4ec/0x608

Link: https://lore.kernel.org/r/20220613214442.212466-4-bvanassche@acm.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index f08586a4470c..02a122738686 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6970,14 +6970,14 @@ int ufshcd_exec_raw_upiu_cmd(struct ufs_hba *hba,
 }
 
 /**
- * ufshcd_eh_device_reset_handler - device reset handler registered to
- *                                    scsi layer.
+ * ufshcd_eh_device_reset_handler() - Reset a single logical unit.
  * @cmd: SCSI command pointer
  *
  * Returns SUCCESS/FAILED
  */
 static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 {
+	unsigned long flags, pending_reqs = 0, not_cleared = 0;
 	struct Scsi_Host *host;
 	struct ufs_hba *hba;
 	u32 pos;
@@ -6996,14 +6996,24 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 	}
 
 	/* clear the commands that were pending for corresponding LUN */
-	for_each_set_bit(pos, &hba->outstanding_reqs, hba->nutrs) {
-		if (hba->lrb[pos].lun == lun) {
-			err = ufshcd_clear_cmds(hba, 1U << pos);
-			if (err)
-				break;
-			__ufshcd_transfer_req_compl(hba, 1U << pos);
-		}
+	spin_lock_irqsave(&hba->outstanding_lock, flags);
+	for_each_set_bit(pos, &hba->outstanding_reqs, hba->nutrs)
+		if (hba->lrb[pos].lun == lun)
+			__set_bit(pos, &pending_reqs);
+	hba->outstanding_reqs &= ~pending_reqs;
+	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+
+	if (ufshcd_clear_cmds(hba, pending_reqs) < 0) {
+		spin_lock_irqsave(&hba->outstanding_lock, flags);
+		not_cleared = pending_reqs &
+			ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
+		hba->outstanding_reqs |= not_cleared;
+		spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+
+		dev_err(hba->dev, "%s: failed to clear requests %#lx\n",
+			__func__, not_cleared);
 	}
+	__ufshcd_transfer_req_compl(hba, pending_reqs & ~not_cleared);
 
 out:
 	hba->req_abort_count = 0;
-- 
2.35.1


