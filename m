Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31667C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA99123356
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA99123356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4AWNLlRnNCmBUcztO5ViyxoibB6MMfe6QOGVwUN7m80=; b=FizmASJrG0HIIHY51GXPJkJc1
	NNnSPxFDEAyMpUqs/fEA0+AlBhkAp97uYZSkJn3rCgggI34pRyP3NE4WnUMYNufdyeg1H/yYuMCSR
	cRn9rbJ6IcyU9RmUUdLz/igcpNxMYBKqRM/r0EA6lgTrN67nKXOuMR6Goj7ZB4/5QkWEw3w1sS+zc
	dCHdUcyCUq7JQunhnHRSeIT75RBKsAfSZwMJv134Kard1vCPeAz+MS4RcRkwHnMtIZ8tB2wejRhFv
	3Ok7ExXzQq8VbG3DDlmGguovhg5yhXRPAl3ZQcvH3E/5MZ+7mdXEr/QSmcdKR/3ViTeZNnLH6u3j8
	0u1Kvz6Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Ezm-0002Dm-KJ; Wed, 20 Jan 2021 15:02:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Ezi-0002Cu-8c; Wed, 20 Jan 2021 15:02:03 +0000
X-UUID: bdc117c99bf344bcab22aa91792054ae-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K9i1IcxSwcx5J5O3jdYkHgxk3eKKqSRMgN6V3ik9ens=; 
 b=V2q7ifdw3vocMFInztwDkkQP5Gf9X/N5gjnPII+QwyK/RFeFjTJRELwYv/9sKYGFCTu6tjxlZ2c9n27FDFWWLZrOzRJcXhV1ty9iYmpekLWJpCWTKUQeYpb8UBOX4C8AqxgAgUHPmWeY/k2yVIykDsQ6A9eqF0EqXC+1AaYeUnw=;
X-UUID: bdc117c99bf344bcab22aa91792054ae-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1873564207; Wed, 20 Jan 2021 07:01:56 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 07:01:54 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 23:01:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Jan 2021 23:01:52 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 3/3] scsi: ufs: Cleanup and refactor clk-scaling feature
Date: Wed, 20 Jan 2021 23:01:42 +0800
Message-ID: <20210120150142.5049-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210120150142.5049-1-stanley.chu@mediatek.com>
References: <20210120150142.5049-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_100202_487528_FC1EB6AC 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Manipulate clock scaling related stuff only if the host capability
supports clock scaling feature to avoid redundant code execution.

Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 63 ++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index f707234580ea..edfac8752d33 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1500,9 +1500,6 @@ static void ufshcd_suspend_clkscaling(struct ufs_hba *hba)
 	unsigned long flags;
 	bool suspend = false;
 
-	if (!ufshcd_is_clkscaling_supported(hba))
-		return;
-
 	cancel_work_sync(&hba->clk_scaling.suspend_work);
 	cancel_work_sync(&hba->clk_scaling.resume_work);
 
@@ -1522,9 +1519,6 @@ static void ufshcd_resume_clkscaling(struct ufs_hba *hba)
 	unsigned long flags;
 	bool resume = false;
 
-	if (!ufshcd_is_clkscaling_supported(hba))
-		return;
-
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	if (hba->clk_scaling.is_suspended) {
 		resume = true;
@@ -5759,6 +5753,26 @@ static inline void ufshcd_schedule_eh_work(struct ufs_hba *hba)
 	}
 }
 
+static void ufshcd_clk_scaling_allow(struct ufs_hba *hba, bool allow)
+{
+	down_write(&hba->clk_scaling_lock);
+	hba->clk_scaling.is_allowed = allow;
+	up_write(&hba->clk_scaling_lock);
+}
+
+static void ufshcd_clk_scaling_suspend(struct ufs_hba *hba, bool suspend)
+{
+	if (suspend) {
+		if (hba->clk_scaling.is_enabled)
+			ufshcd_suspend_clkscaling(hba);
+		ufshcd_clk_scaling_allow(hba, false);
+	} else {
+		ufshcd_clk_scaling_allow(hba, true);
+		if (hba->clk_scaling.is_enabled)
+			ufshcd_resume_clkscaling(hba);
+	}
+}
+
 static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 {
 	pm_runtime_get_sync(hba->dev);
@@ -5783,22 +5797,18 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 		ufshcd_vops_resume(hba, pm_op);
 	} else {
 		ufshcd_hold(hba, false);
-		if (hba->clk_scaling.is_enabled)
+		if (ufshcd_is_clkscaling_supported(hba) &&
+		    hba->clk_scaling.is_enabled)
 			ufshcd_suspend_clkscaling(hba);
-		down_write(&hba->clk_scaling_lock);
-		hba->clk_scaling.is_allowed = false;
-		up_write(&hba->clk_scaling_lock);
+		ufshcd_clk_scaling_allow(hba, false);
 	}
 }
 
 static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
 {
 	ufshcd_release(hba);
-	down_write(&hba->clk_scaling_lock);
-	hba->clk_scaling.is_allowed = true;
-	up_write(&hba->clk_scaling_lock);
-	if (hba->clk_scaling.is_enabled)
-		ufshcd_resume_clkscaling(hba);
+	if (ufshcd_is_clkscaling_supported(hba))
+		ufshcd_clk_scaling_suspend(hba, false);
 	pm_runtime_put(hba->dev);
 }
 
@@ -8703,12 +8713,8 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	ufshcd_hold(hba, false);
 	hba->clk_gating.is_suspended = true;
 
-	if (hba->clk_scaling.is_enabled)
-		ufshcd_suspend_clkscaling(hba);
-
-	down_write(&hba->clk_scaling_lock);
-	hba->clk_scaling.is_allowed = false;
-	up_write(&hba->clk_scaling_lock);
+	if (ufshcd_is_clkscaling_supported(hba))
+		ufshcd_clk_scaling_suspend(hba, true);
 
 	if (req_dev_pwr_mode == UFS_ACTIVE_PWR_MODE &&
 			req_link_state == UIC_LINK_ACTIVE_STATE) {
@@ -8828,11 +8834,9 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (!ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE))
 		ufshcd_disable_auto_bkops(hba);
 enable_gating:
-	down_write(&hba->clk_scaling_lock);
-	hba->clk_scaling.is_allowed = true;
-	up_write(&hba->clk_scaling_lock);
-	if (hba->clk_scaling.is_enabled)
-		ufshcd_resume_clkscaling(hba);
+	if (ufshcd_is_clkscaling_supported(hba))
+		ufshcd_clk_scaling_suspend(hba, false);
+
 	hba->clk_gating.is_suspended = false;
 	hba->dev_info.b_rpm_dev_flush_capable = false;
 	ufshcd_release(hba);
@@ -8934,11 +8938,8 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	hba->clk_gating.is_suspended = false;
 
-	down_write(&hba->clk_scaling_lock);
-	hba->clk_scaling.is_allowed = true;
-	up_write(&hba->clk_scaling_lock);
-	if (hba->clk_scaling.is_enabled)
-		ufshcd_resume_clkscaling(hba);
+	if (ufshcd_is_clkscaling_supported(hba))
+		ufshcd_clk_scaling_suspend(hba, false);
 
 	/* Enable Auto-Hibernate if configured */
 	ufshcd_auto_hibern8_enable(hba);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
