Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B9BC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 17:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0375220671
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 17:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+j3v7T6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PQvpDA+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0375220671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEq6WbXQz2jIjkbJsqLjGWTfO8CJmrzTM1LxeOwhC+g=; b=i+j3v7T67cqxNz
	HvXQxXMoG8M+1t5wHjdhhvINexoFlheflcx8YIlqZZxzKRZvJ5FCsTijxrGfULqWOrxqDyFNfvRHD
	bPE971kXgr/4NwtIDHwvBNd4kvnpQ/zdzxJBBlJHZLw5bPAFvHtTym6vbJzM4hDHZgg0pUCy/lVAb
	g6O12I73ploxu2w2jiX3gtWCI8gA19hEhiiOwrYfPd+VJRZpWSgFKqEfb3LW6Nq3FNQEmSgGYBLxV
	8Hq2aeffOzQbtbobWdNIvNzxYFZPaoEWWr7T4Z3sa7aBO7np5cIptv5FQ1g6jRxmEBrXjqF3z9iga
	dD1jPUQtmnCbtjqZ9epg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ja0tO-0005pu-8b; Sat, 16 May 2020 17:46:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ja0tE-0005h6-Rj; Sat, 16 May 2020 17:46:26 +0000
X-UUID: 235f95205bda4cc2afbfcd48a0d1bf96-20200516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4IaOyLlQZGyeNSnvBaLa6LhW98XLGWgoCec01Wi7230=; 
 b=PQvpDA+Ecm5/QHEBBk7LV6fo1lc/kVstFlRBXDGYUcPDGEaHxr/sC+UG6YTGC3L3UbQU23O7pAy8ZvSflpU7YpZRNNT9SqyINETkletK6oNFqrN+9OyNbWil0+dKxImXyQClWELImF1N3Ag+9pHprsgWQ99O9eeiIxAvXUWS2SU=;
X-UUID: 235f95205bda4cc2afbfcd48a0d1bf96-20200516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1634646143; Sat, 16 May 2020 09:46:29 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 May 2020 10:46:16 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 May 2020 01:46:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 17 May 2020 01:46:14 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v3 5/5] scsi: ufs: Fix possible VCC power drain during runtime
 suspend
Date: Sun, 17 May 2020 01:46:15 +0800
Message-ID: <20200516174615.15445-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200516174615.15445-1-stanley.chu@mediatek.com>
References: <20200516174615.15445-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_104624_903905_3ADC57F2 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The commit "scsi: ufs: Fix WriteBooster flush during runtime
suspend" promises essential resource, i.e., for UFS devices doing
WriteBooster buffer flush and Auto BKOPs. However if device
finishes its job but not resumed for a very long time, system
will have unnecessary power drain because VCC is still supplied.

To fix this, a method to recheck the threshold of keeping VCC
supply is required. However, the threshold recheck needs to
re-activate the link because the decision depends on the device
status.

Introduce a delayed work to force runtime resume after a certain
delay during runtime suspend. This makes threshold recheck simpler
which will be done in the next runtime-suspend.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs.h    |  1 +
 drivers/scsi/ufs/ufshcd.c | 43 ++++++++++++++++++++++++++++++++++-----
 drivers/scsi/ufs/ufshcd.h |  1 +
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
index db07eedfed96..c70845d41449 100644
--- a/drivers/scsi/ufs/ufs.h
+++ b/drivers/scsi/ufs/ufs.h
@@ -574,6 +574,7 @@ struct ufs_dev_info {
 	u32 d_ext_ufs_feature_sup;
 	u8 b_wb_buffer_type;
 	u32 d_wb_alloc_units;
+	bool b_rpm_dev_flush_capable;
 	u8 b_presrv_uspc_en;
 };
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index f4f2c7b5ab0a..a137553f9b41 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -94,6 +94,9 @@
 /* default delay of autosuspend: 2000 ms */
 #define RPM_AUTOSUSPEND_DELAY_MS 2000
 
+/* Default delay of RPM device flush delayed work */
+#define RPM_DEV_FLUSH_RECHECK_WORK_DELAY_MS 5000
+
 /* Default value of wait time before gating device ref clock */
 #define UFSHCD_REF_CLK_GATING_WAIT_US 0xFF /* microsecs */
 
@@ -5310,7 +5313,7 @@ static bool ufshcd_wb_presrv_usrspc_keep_vcc_on(struct ufs_hba *hba,
 	return false;
 }
 
-static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
+static bool ufshcd_wb_need_flush(struct ufs_hba *hba)
 {
 	int ret;
 	u32 avail_buf;
@@ -5348,6 +5351,21 @@ static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
 	return ufshcd_wb_presrv_usrspc_keep_vcc_on(hba, avail_buf);
 }
 
+static void ufshcd_rpm_dev_flush_recheck_work(struct work_struct *work)
+{
+	struct ufs_hba *hba = container_of(to_delayed_work(work),
+					   struct ufs_hba,
+					   rpm_dev_flush_recheck_work);
+	/*
+	 * To prevent unnecessary VCC power drain after device finishes
+	 * WriteBooster buffer flush or Auto BKOPs, force runtime resume
+	 * after a certain delay to recheck the threshold by next runtime
+	 * supsend.
+	 */
+	pm_runtime_get_sync(hba->dev);
+	pm_runtime_put_sync(hba->dev);
+}
+
 /**
  * ufshcd_exception_event_handler - handle exceptions raised by device
  * @work: pointer to work data
@@ -8164,7 +8182,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	enum ufs_pm_level pm_lvl;
 	enum ufs_dev_pwr_mode req_dev_pwr_mode;
 	enum uic_link_state req_link_state;
-	bool keep_curr_dev_pwr_mode = false;
 
 	hba->pm_op_in_progress = 1;
 	if (!ufshcd_is_shutdown_pm(pm_op)) {
@@ -8224,11 +8241,12 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		 * Hibern8, keep device power mode as "active power mode"
 		 * and VCC supply.
 		 */
-		keep_curr_dev_pwr_mode = hba->auto_bkops_enabled ||
+		hba->dev_info.b_rpm_dev_flush_capable =
+			hba->auto_bkops_enabled ||
 			(((req_link_state == UIC_LINK_HIBERN8_STATE) ||
 			((req_link_state == UIC_LINK_ACTIVE_STATE) &&
 			ufshcd_is_auto_hibern8_enabled(hba))) &&
-			ufshcd_wb_keep_vcc_on(hba));
+			ufshcd_wb_need_flush(hba));
 	}
 
 	if (req_dev_pwr_mode != hba->curr_dev_pwr_mode) {
@@ -8238,7 +8256,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 			ufshcd_disable_auto_bkops(hba);
 		}
 
-		if (!keep_curr_dev_pwr_mode) {
+		if (!hba->dev_info.b_rpm_dev_flush_capable) {
 			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
 			if (ret)
 				goto enable_gating;
@@ -8295,9 +8313,16 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (hba->clk_scaling.is_allowed)
 		ufshcd_resume_clkscaling(hba);
 	hba->clk_gating.is_suspended = false;
+	hba->dev_info.b_rpm_dev_flush_capable = false;
 	ufshcd_release(hba);
 out:
+	if (hba->dev_info.b_rpm_dev_flush_capable) {
+		schedule_delayed_work(&hba->rpm_dev_flush_recheck_work,
+			msecs_to_jiffies(RPM_DEV_FLUSH_RECHECK_WORK_DELAY_MS));
+	}
+
 	hba->pm_op_in_progress = 0;
+
 	if (ret)
 		ufshcd_update_reg_hist(&hba->ufs_stats.suspend_err, (u32)ret);
 	return ret;
@@ -8386,6 +8411,11 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	/* Enable Auto-Hibernate if configured */
 	ufshcd_auto_hibern8_enable(hba);
 
+	if (hba->dev_info.b_rpm_dev_flush_capable) {
+		hba->dev_info.b_rpm_dev_flush_capable = false;
+		cancel_delayed_work(&hba->rpm_dev_flush_recheck_work);
+	}
+
 	/* Schedule clock gating in case of no access to UFS device yet */
 	ufshcd_release(hba);
 
@@ -8859,6 +8889,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 						UFS_SLEEP_PWR_MODE,
 						UIC_LINK_HIBERN8_STATE);
 
+	INIT_DELAYED_WORK(&hba->rpm_dev_flush_recheck_work,
+			  ufshcd_rpm_dev_flush_recheck_work);
+
 	/* Set the default auto-hiberate idle timer value to 150 ms */
 	if (ufshcd_is_auto_hibern8_supported(hba) && !hba->ahit) {
 		hba->ahit = FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, 150) |
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 8db7a6101892..9acd437037e8 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -745,6 +745,7 @@ struct ufs_hba {
 	struct request_queue	*bsg_queue;
 	bool wb_buf_flush_enabled;
 	bool wb_enabled;
+	struct delayed_work rpm_dev_flush_recheck_work;
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
