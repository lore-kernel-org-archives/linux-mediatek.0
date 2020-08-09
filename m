Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BB7C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 12:17:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6693206A2
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 12:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iUaRdHjJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6693206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0UtYEhk1Ju6/KsKOu4kylqMPJDblpRGHUZKwdfoAfE=; b=iUaRdHjJLj0rs77TkTpDcks32o
	BH7DjmJ9Ws6zmtrDXJFPecEtlmZFlcA5OAfzwrVK02HvTPs6DrEyK1IpaS3+Gy7sA749KMNwD+BVI
	jN0QUBglOGOvgrY+X5TiCRgrYTOZsdcQVYHF3Gd4I3Hyuh8WiBbQzcM0Tuk12aOCQf93JCcA9Vie0
	VKo143ynJZlhOdemtEPfzj3Ws/8/uBQ19FOIlxpbDyy5TsaWHQWrxiUixR2ybl9cIRi6cRi4g2/1H
	JoAsAKyfHfMkz98El9k219hK8hMPaqoBFpxIO6GAQPrLQ5me4bEWW/hubqXBWGvkkLSjdcxkJ4KAQ
	gsf5ovgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4kFz-0003wh-RK; Sun, 09 Aug 2020 12:16:55 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4kFm-0003tn-ST; Sun, 09 Aug 2020 12:16:47 +0000
IronPort-SDR: LGtwLggFm7bdvWQZv4QnsBdU0SHOyp3iOfCkzJz9Ol7nAZpJUXAYyBdeyTJxVJf4JBfFW5Y3wm
 ezYemsHDkPRd0gQoQ4/SglRgklFvlOUpNd7wWiee2nkxL3lnvrsj2RYgESjfxRTIokK6YmIOFN
 ALYUR+WyL7IILdGZ5jEB4Mh9tpPp9qGlYpk8M9v+U3AAjHF+FL0pHQU9CLAYdBgoHKq1pSWsCh
 LoGtCMl5gEGqQzCk9uWTWbC4hu8pvjD+AXhb2Lt83LY5P1/Aq6wPc9dQDrljmZ4ccPpb2QDZYW
 Ki4=
X-IronPort-AV: E=Sophos;i="5.75,453,1589266800"; d="scan'208";a="29073791"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 09 Aug 2020 05:16:11 -0700
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 09 Aug 2020 05:16:11 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 1F8702156E; Sun,  9 Aug 2020 05:16:11 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH 4/9] scsi: ufs: Add some debug infos to ufshcd_print_host_state
Date: Sun,  9 Aug 2020 05:15:50 -0700
Message-Id: <1596975355-39813-5-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
References: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_081646_129122_CC19C571 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The infos of the last interrupt status and its timestamp are very helpful
when debug system stability issues, e.g. IRQ starvation, so add them to
ufshcd_print_host_state. Meanwhile, UFS device infos like model name and
its FW version also come in handy during debug. In addition, this change
makes cleanup to some prints in ufshcd_print_host_regs as similar prints
are already available in ufshcd_print_host_state.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 5acb38c..71c650f 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -411,15 +411,6 @@ static void ufshcd_print_err_hist(struct ufs_hba *hba,
 static void ufshcd_print_host_regs(struct ufs_hba *hba)
 {
 	ufshcd_dump_regs(hba, 0, UFSHCI_REG_SPACE_SIZE, "host_regs: ");
-	dev_err(hba->dev, "hba->ufs_version = 0x%x, hba->capabilities = 0x%x\n",
-		hba->ufs_version, hba->capabilities);
-	dev_err(hba->dev,
-		"hba->outstanding_reqs = 0x%x, hba->outstanding_tasks = 0x%x\n",
-		(u32)hba->outstanding_reqs, (u32)hba->outstanding_tasks);
-	dev_err(hba->dev,
-		"last_hibern8_exit_tstamp at %lld us, hibern8_exit_cnt = %d\n",
-		ktime_to_us(hba->ufs_stats.last_hibern8_exit_tstamp),
-		hba->ufs_stats.hibern8_exit_cnt);
 
 	ufshcd_print_err_hist(hba, &hba->ufs_stats.pa_err, "pa_err");
 	ufshcd_print_err_hist(hba, &hba->ufs_stats.dl_err, "dl_err");
@@ -438,8 +429,6 @@ static void ufshcd_print_host_regs(struct ufs_hba *hba)
 	ufshcd_print_err_hist(hba, &hba->ufs_stats.host_reset, "host_reset");
 	ufshcd_print_err_hist(hba, &hba->ufs_stats.task_abort, "task_abort");
 
-	ufshcd_print_clk_freqs(hba);
-
 	ufshcd_vops_dbg_register_dump(hba);
 }
 
@@ -499,6 +488,8 @@ static void ufshcd_print_tmrs(struct ufs_hba *hba, unsigned long bitmap)
 
 static void ufshcd_print_host_state(struct ufs_hba *hba)
 {
+	struct scsi_device *sdev_ufs = hba->sdev_ufs_device;
+
 	dev_err(hba->dev, "UFS Host state=%d\n", hba->ufshcd_state);
 	dev_err(hba->dev, "outstanding reqs=0x%lx tasks=0x%lx\n",
 		hba->outstanding_reqs, hba->outstanding_tasks);
@@ -511,12 +502,24 @@ static void ufshcd_print_host_state(struct ufs_hba *hba)
 	dev_err(hba->dev, "Auto BKOPS=%d, Host self-block=%d\n",
 		hba->auto_bkops_enabled, hba->host->host_self_blocked);
 	dev_err(hba->dev, "Clk gate=%d\n", hba->clk_gating.state);
+	dev_err(hba->dev,
+		"last_hibern8_exit_tstamp at %lld us, hibern8_exit_cnt=%d\n",
+		ktime_to_us(hba->ufs_stats.last_hibern8_exit_tstamp),
+		hba->ufs_stats.hibern8_exit_cnt);
+	dev_err(hba->dev, "last intr at %lld us, last intr status=0x%x\n",
+		ktime_to_us(hba->ufs_stats.last_intr_ts),
+		hba->ufs_stats.last_intr_status);
 	dev_err(hba->dev, "error handling flags=0x%x, req. abort count=%d\n",
 		hba->eh_flags, hba->req_abort_count);
-	dev_err(hba->dev, "Host capabilities=0x%x, caps=0x%x\n",
-		hba->capabilities, hba->caps);
+	dev_err(hba->dev, "hba->ufs_version=0x%x, Host capabilities=0x%x, caps=0x%x\n",
+		hba->ufs_version, hba->capabilities, hba->caps);
 	dev_err(hba->dev, "quirks=0x%x, dev. quirks=0x%x\n", hba->quirks,
 		hba->dev_quirks);
+	if (sdev_ufs)
+		dev_err(hba->dev, "UFS dev info: %.8s %.16s rev %.4s\n",
+			sdev_ufs->vendor, sdev_ufs->model, sdev_ufs->rev);
+
+	ufshcd_print_clk_freqs(hba);
 }
 
 /**
@@ -5951,6 +5954,8 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
 
 	spin_lock(hba->host->host_lock);
 	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
+	hba->ufs_stats.last_intr_status = intr_status;
+	hba->ufs_stats.last_intr_ts = ktime_get();
 
 	/*
 	 * There could be max of hba->nutrs reqs in flight and in worst case
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index b2ef18f..b7f54af 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -409,6 +409,8 @@ struct ufs_err_reg_hist {
 
 /**
  * struct ufs_stats - keeps usage/err statistics
+ * @last_intr_status: record the last interrupt status.
+ * @last_intr_ts: record the last interrupt timestamp.
  * @hibern8_exit_cnt: Counter to keep track of number of exits,
  *		reset this after link-startup.
  * @last_hibern8_exit_tstamp: Set time after the hibern8 exit.
@@ -428,6 +430,9 @@ struct ufs_err_reg_hist {
  * @tsk_abort: tracks task abort events
  */
 struct ufs_stats {
+	u32 last_intr_status;
+	ktime_t last_intr_ts;
+
 	u32 hibern8_exit_cnt;
 	ktime_t last_hibern8_exit_tstamp;
 
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
