Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F931C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 12:17:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0EDD206A2
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 12:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TnHbpvs0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0EDD206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpLtJedgNjy79/pJHPdwVTTWasvZga4SdSm+dzhZkiQ=; b=TnHbpvs0w7MdgIxq3ii3k4u1RQ
	LNVj86xOUsIsJDGKk/PO7/R5tXHz9pjzEVh/Q9thIKtNfay+SCzmdN+jrpkWPn+2s393IF18qAN2t
	5xWax/XUMuLgkwQdNH9UDZYCibKG8Zw1ht+xxUyK/y6InmEp7Lc7Aa4L8aux8vDxqWc98o89OYhTq
	P1hk70NRHjk0ADmtQ/myL3Q2yIVKqq/MUbBTi4btZkn3HUOfF7xy+EmkNnSiM7Bzk/sN8FXGgS6Cb
	Ub59PJrIY/TFfJniUcmd7iJtIDVci4Nwu2OYilWT5gezEmNPMN/1TY/esBtsZ/2gzkhIJ3bcMdu/8
	RadSpqZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4kFr-0003vE-8L; Sun, 09 Aug 2020 12:16:47 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4kFi-0003tn-8j; Sun, 09 Aug 2020 12:16:39 +0000
IronPort-SDR: PaHjAOEc/LaMYHAw5/uMGJ22FDXXobzZg4L9rumAZNLAl14YSwHevEf31e5anmc2MtcPZO7UF4
 WK56S+ew/c/uK9kqlJCHQO12EIBxhL2GQlifAfi6ySJ1bMgF+9U0x7F1CGlpD4AFMKLNh2p5mD
 KV28spZLr+WtcQWCL/m7wUx++1GobycolSX+ec21GAEcKzHF0ckyRKllRW5TVE1+B0dgJf0KHp
 sExzUs7qtvwZkgmJ7j/q4OgzTj/PCd5Btq+B6YE2QNCXtGk4cO9qHgEBQvxKPoCMygMJ8MXpvR
 vcE=
X-IronPort-AV: E=Sophos;i="5.75,453,1589266800"; d="scan'208";a="29073790"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 09 Aug 2020 05:16:03 -0700
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 09 Aug 2020 05:16:01 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id ECEB32156E; Sun,  9 Aug 2020 05:16:01 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH 1/9] scsi: ufs: Add checks before setting clk-gating states
Date: Sun,  9 Aug 2020 05:15:47 -0700
Message-Id: <1596975355-39813-2-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
References: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_081638_501100_2DC87454 
X-CRM114-Status: GOOD (  10.96  )
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
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
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

Clock gating features can be turned on/off selectively which means its
state information is only important if it is enabled. This change makes
sure that we only look at state of clk-gating if it is enabled.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 3076222..5acb38c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1839,6 +1839,8 @@ static void ufshcd_init_clk_gating(struct ufs_hba *hba)
 	if (!ufshcd_is_clkgating_allowed(hba))
 		return;
 
+	hba->clk_gating.state = CLKS_ON;
+
 	hba->clk_gating.delay_ms = 150;
 	INIT_DELAYED_WORK(&hba->clk_gating.gate_work, ufshcd_gate_work);
 	INIT_WORK(&hba->clk_gating.ungate_work, ufshcd_ungate_work);
@@ -2541,7 +2543,8 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 		err = SCSI_MLQUEUE_HOST_BUSY;
 		goto out;
 	}
-	WARN_ON(hba->clk_gating.state != CLKS_ON);
+	WARN_ON(ufshcd_is_clkgating_allowed(hba) &&
+		(hba->clk_gating.state != CLKS_ON));
 
 	lrbp = &hba->lrb[tag];
 
@@ -8326,8 +8329,11 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		/* If link is active, device ref_clk can't be switched off */
 		__ufshcd_setup_clocks(hba, false, true);
 
-	hba->clk_gating.state = CLKS_OFF;
-	trace_ufshcd_clk_gating(dev_name(hba->dev), hba->clk_gating.state);
+	if (ufshcd_is_clkgating_allowed(hba)) {
+		hba->clk_gating.state = CLKS_OFF;
+		trace_ufshcd_clk_gating(dev_name(hba->dev),
+					hba->clk_gating.state);
+	}
 
 	/* Put the host controller in low power mode if possible */
 	ufshcd_hba_vreg_set_lpm(hba);
@@ -8467,6 +8473,11 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (hba->clk_scaling.is_allowed)
 		ufshcd_suspend_clkscaling(hba);
 	ufshcd_setup_clocks(hba, false);
+	if (ufshcd_is_clkgating_allowed(hba)) {
+		hba->clk_gating.state = CLKS_OFF;
+		trace_ufshcd_clk_gating(dev_name(hba->dev),
+					hba->clk_gating.state);
+	}
 out:
 	hba->pm_op_in_progress = 0;
 	if (ret)
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
