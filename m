Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB7CC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 02:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agyd91scbfZiILaa4wgYsxF17inOYh+5IrOjgfjCiCY=; b=BIR3PWafQHMmk2JAzyvxvxBEEa
	jAWmmWN8r5vKmIaGpDjLHSbDFGflgGsCUufL1ndECqc0cNSUl/3UgyHTlkEC9BtE2px+NREXYQ6Kx
	+NSUvK985VZNEwifWKVsmuEFhpjdfU/TgdUJfNJoWHT17mGg384kYxh1/kAF9E+BOfsZfkm2d8roH
	ePDhWub4GtpNFpzzfE7hPngShIHWLjeYh5VQsyNRqU+vg1Ip0pJJ2HTD1tW6pJovTXofWpn6ocG98
	7cmit8L8iWbT3Y1/1WxY2ArpBXoRlF2u0zvQ+doqU+/TiCoUepjnt7wj9FK8ZGjoSX2Y2x9ricvj0
	m3lELCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60vG-003iQs-Gi; Tue, 28 Jun 2022 02:25:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60r9-003fqi-C0; Tue, 28 Jun 2022 02:21:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD3B0617CA;
	Tue, 28 Jun 2022 02:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D63FC341CC;
	Tue, 28 Jun 2022 02:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382893;
	bh=VLOhM9jafYBwDGo4GY7GW6BnZMK0sprL/cxkYZbymZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oHarGe5CEW4UnvxzKQPMprbyUZ+FA59mYd+H8EnwdDzZ6zKld2mKhtsjuf130BREL
	 oM43fDG0zkWes8igFmPiJUFrrBIaXqHfi2f+UYWVOntb+QEQN9kfvcA9RDni5pjgtl
	 8lA0EKnsDjX91b3a6bgEC8kbXCBsqJIFekpvnNnW+I6Wxwl2HttGMWSMDmKkekCuSY
	 dWLZ73xiGV4s2PNxDxcyFGiwu88xGaIjhkXemkVBm7YC3Mf+E5U1SCy9Drujaj21eL
	 YoGrLbXcbUoV54QdcMRJFTj7GQ5cwRaeRZfXCQwn2EDx49CvTfapXRhiagHE0Y5wcC
	 B3A7a0PtuWiMQ==
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
Subject: [PATCH AUTOSEL 5.15 13/41] scsi: ufs: Support clearing multiple commands at once
Date: Mon, 27 Jun 2022 22:20:32 -0400
Message-Id: <20220628022100.595243-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022100.595243-1-sashal@kernel.org>
References: <20220628022100.595243-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_192135_541710_96480EE0 
X-CRM114-Status: GOOD (  20.26  )
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

[ Upstream commit d1a7644648b7cdacaf8d1013a4285001911e9bc8 ]

Modify ufshcd_clear_cmd() such that it supports clearing multiple commands
at once instead of one command at a time. This change will be used in a
later patch to reduce the time spent in the reset handler.

Link: https://lore.kernel.org/r/20220613214442.212466-3-bvanassche@acm.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 42 ++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 311170e63410..b5684bd32621 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -727,17 +727,28 @@ static inline int ufshcd_get_tr_ocs(struct ufshcd_lrb *lrbp)
 }
 
 /**
- * ufshcd_utrl_clear - Clear a bit in UTRLCLR register
+ * ufshcd_utrl_clear() - Clear requests from the controller request list.
  * @hba: per adapter instance
- * @pos: position of the bit to be cleared
+ * @mask: mask with one bit set for each request to be cleared
  */
-static inline void ufshcd_utrl_clear(struct ufs_hba *hba, u32 pos)
+static inline void ufshcd_utrl_clear(struct ufs_hba *hba, u32 mask)
 {
 	if (hba->quirks & UFSHCI_QUIRK_BROKEN_REQ_LIST_CLR)
-		ufshcd_writel(hba, (1 << pos), REG_UTP_TRANSFER_REQ_LIST_CLEAR);
-	else
-		ufshcd_writel(hba, ~(1 << pos),
-				REG_UTP_TRANSFER_REQ_LIST_CLEAR);
+		mask = ~mask;
+	/*
+	 * From the UFSHCI specification: "UTP Transfer Request List CLear
+	 * Register (UTRLCLR): This field is bit significant. Each bit
+	 * corresponds to a slot in the UTP Transfer Request List, where bit 0
+	 * corresponds to request slot 0. A bit in this field is set to ‘0’
+	 * by host software to indicate to the host controller that a transfer
+	 * request slot is cleared. The host controller
+	 * shall free up any resources associated to the request slot
+	 * immediately, and shall set the associated bit in UTRLDBR to ‘0’. The
+	 * host software indicates no change to request slots by setting the
+	 * associated bits in this field to ‘1’. Bits in this field shall only
+	 * be set ‘1’ or ‘0’ by host software when UTRLRSR is set to ‘1’."
+	 */
+	ufshcd_writel(hba, ~mask, REG_UTP_TRANSFER_REQ_LIST_CLEAR);
 }
 
 /**
@@ -2795,15 +2806,18 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 	return ufshcd_compose_devman_upiu(hba, lrbp);
 }
 
-static int
-ufshcd_clear_cmd(struct ufs_hba *hba, int tag)
+/*
+ * Clear all the requests from the controller for which a bit has been set in
+ * @mask and wait until the controller confirms that these requests have been
+ * cleared.
+ */
+static int ufshcd_clear_cmds(struct ufs_hba *hba, u32 mask)
 {
 	unsigned long flags;
-	u32 mask = 1 << tag;
 
 	/* clear outstanding transaction before retry */
 	spin_lock_irqsave(hba->host->host_lock, flags);
-	ufshcd_utrl_clear(hba, tag);
+	ufshcd_utrl_clear(hba, mask);
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
 	/*
@@ -2891,7 +2905,7 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 		err = -ETIMEDOUT;
 		dev_dbg(hba->dev, "%s: dev_cmd request timedout, tag %d\n",
 			__func__, lrbp->task_tag);
-		if (!ufshcd_clear_cmd(hba, lrbp->task_tag))
+		if (!ufshcd_clear_cmds(hba, 1U << lrbp->task_tag))
 			/* successfully cleared the command, retry if needed */
 			err = -EAGAIN;
 		/*
@@ -6820,7 +6834,7 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 	/* clear the commands that were pending for corresponding LUN */
 	for_each_set_bit(pos, &hba->outstanding_reqs, hba->nutrs) {
 		if (hba->lrb[pos].lun == lun) {
-			err = ufshcd_clear_cmd(hba, pos);
+			err = ufshcd_clear_cmds(hba, 1U << pos);
 			if (err)
 				break;
 			__ufshcd_transfer_req_compl(hba, 1U << pos, false);
@@ -6922,7 +6936,7 @@ static int ufshcd_try_to_abort_task(struct ufs_hba *hba, int tag)
 		goto out;
 	}
 
-	err = ufshcd_clear_cmd(hba, tag);
+	err = ufshcd_clear_cmds(hba, 1U << tag);
 	if (err)
 		dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",
 			__func__, tag, err);
-- 
2.35.1


