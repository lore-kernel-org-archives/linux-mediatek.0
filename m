Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92280C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 02:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DC620B1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 02:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QEZMhv1Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DC620B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFlTGBu7ZdXOeZgC8UKc/fH8N6DsOFcC3btaL+uaCus=; b=QEZMhv1Zur3uPV4wOeX0FrTZL2
	OpFkE8uF6RJwzFk5/9ri2Mn/ppJ5bR9GU++KemXAgo1V2Q6RG5a5He8DiyWICGgh7jWBrHql0CQ7O
	1B5uopk9vXBlax85eCs8+h/Yafg7YoFo0pgBRxwtbdM3PxQC77niF/jIo9Eo/8CdkO2tRbSbMT8GW
	rR6qC8F47+PqPB5mU7neZ3SAi3fZRT1plJuoOlMDBHDnQVXMvxlefjLfmOYCzhqk4JCHSgKlFS0vC
	s8rFXezqk8k8SEvMw4BJsGyVS2fxR4gmS58J+t7qsaZlKTskgdW15uPsQXKeXyzcLzZeZcSUCsPcj
	5NG0TOww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki6de-0003Br-6V; Thu, 26 Nov 2020 02:04:02 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki6dR-00039J-IR; Thu, 26 Nov 2020 02:03:50 +0000
IronPort-SDR: dPsj4gQUgXbV+W/lS9gr8qIYVenc2d0AU0iCbqA1UzloUHvIJQlnKpiEBQnj9YI/rd+oCx1zNh
 8VO3TMH571uZr5Detn3f+qZvLJccFQL2CklszEeHw5GQwY77J+I0E6qSviKa1IyOo+NvIdcspz
 3KyF7TDKx+w90gHMtFuNhjDRIRX0t8eEl1/YXv0uDN5bIPYxM6lsaGvAeqinxI/7tnNBC+FAgz
 FWjU9U3A1U9ObF9EdvFxzMRQP+ABcvjLo8SS/GEiMXAzO8Xydq6iprlTmtaAy53KV9uQmy9tWj
 JQo=
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="29302446"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 25 Nov 2020 18:03:36 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 25 Nov 2020 18:03:35 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 85B1121858; Wed, 25 Nov 2020 18:03:35 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 ziqichen@codeaurora.org, rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
 cang@codeaurora.org
Subject: [PATCH v3 1/2] scsi: ufs: Refactor ufshcd_setup_clocks() to remove
 skip_ref_clk
Date: Wed, 25 Nov 2020 18:01:00 -0800
Message-Id: <1606356063-38380-2-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606356063-38380-1-git-send-email-cang@codeaurora.org>
References: <1606356063-38380-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_210349_790487_F35AFA8C 
X-CRM114-Status: GOOD (  18.08  )
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
 Tomas Winkler <tomas.winkler@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove the param skip_ref_clk from __ufshcd_setup_clocks(), but keep a flag
in struct ufs_clk_info to tell whether a clock can be disabled or not while
the link is active.

Reviewed-by: Hongwu Su<hongwus@codeaurora.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c |  2 ++
 drivers/scsi/ufs/ufshcd.c        | 29 +++++++++--------------------
 drivers/scsi/ufs/ufshcd.h        |  3 +++
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 3db0af6..873ef14 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -92,6 +92,8 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 		clki->min_freq = clkfreq[i];
 		clki->max_freq = clkfreq[i+1];
 		clki->name = kstrdup(name, GFP_KERNEL);
+		if (!strcmp(name, "ref_clk"))
+			clki->keep_link_active = true;
 		dev_dbg(dev, "%s: min %u max %u name %s\n", "freq-table-hz",
 				clki->min_freq, clki->max_freq, clki->name);
 		list_add_tail(&clki->list, &hba->clk_list_head);
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index a7857f6..44254c9 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -221,8 +221,6 @@ static int ufshcd_eh_host_reset_handler(struct scsi_cmnd *cmd);
 static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag);
 static void ufshcd_hba_exit(struct ufs_hba *hba);
 static int ufshcd_probe_hba(struct ufs_hba *hba, bool async);
-static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
-				 bool skip_ref_clk);
 static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on);
 static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
 static inline void ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba);
@@ -1707,11 +1705,7 @@ static void ufshcd_gate_work(struct work_struct *work)
 
 	ufshcd_disable_irq(hba);
 
-	if (!ufshcd_is_link_active(hba))
-		ufshcd_setup_clocks(hba, false);
-	else
-		/* If link is active, device ref_clk can't be switched off */
-		__ufshcd_setup_clocks(hba, false, true);
+	ufshcd_setup_clocks(hba, false);
 
 	/*
 	 * In case you are here to cancel this work the gating state
@@ -7990,8 +7984,7 @@ static int ufshcd_init_hba_vreg(struct ufs_hba *hba)
 	return 0;
 }
 
-static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
-					bool skip_ref_clk)
+static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
 {
 	int ret = 0;
 	struct ufs_clk_info *clki;
@@ -8009,7 +8002,12 @@ static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
 
 	list_for_each_entry(clki, head, list) {
 		if (!IS_ERR_OR_NULL(clki->clk)) {
-			if (skip_ref_clk && !strcmp(clki->name, "ref_clk"))
+			/*
+			 * Don't disable clocks which are needed
+			 * to keep the link active.
+			 */
+			if (ufshcd_is_link_active(hba) &&
+			    clki->keep_link_active)
 				continue;
 
 			clk_state_changed = on ^ clki->enabled;
@@ -8054,11 +8052,6 @@ static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
 	return ret;
 }
 
-static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
-{
-	return  __ufshcd_setup_clocks(hba, on, false);
-}
-
 static int ufshcd_init_clocks(struct ufs_hba *hba)
 {
 	int ret = 0;
@@ -8577,11 +8570,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 */
 	ufshcd_disable_irq(hba);
 
-	if (!ufshcd_is_link_active(hba))
-		ufshcd_setup_clocks(hba, false);
-	else
-		/* If link is active, device ref_clk can't be switched off */
-		__ufshcd_setup_clocks(hba, false, true);
+	ufshcd_setup_clocks(hba, false);
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
 		hba->clk_gating.state = CLKS_OFF;
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 66e5338..6f0f2d4 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -229,6 +229,8 @@ struct ufs_dev_cmd {
  * @max_freq: maximum frequency supported by the clock
  * @min_freq: min frequency that can be used for clock scaling
  * @curr_freq: indicates the current frequency that it is set to
+ * @keep_link_active: indicates that the clk should not be disabled if
+		      link is active
  * @enabled: variable to check against multiple enable/disable
  */
 struct ufs_clk_info {
@@ -238,6 +240,7 @@ struct ufs_clk_info {
 	u32 max_freq;
 	u32 min_freq;
 	u32 curr_freq;
+	bool keep_link_active;
 	bool enabled;
 };
 
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
