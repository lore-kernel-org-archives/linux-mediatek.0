Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51CAC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 19:11:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAB221556
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 19:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QeXFsFmw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EAB221556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NHeOSVWDEWdLxgwq7UkvlDw3EMUjMa7chytHyIyZQGU=; b=QeXFsFmwzH+jEy2bLNGRQ+pbBJ
	ofe1wjOFDfZ4uQsbwOliPWiXfzeqk/sAc8QWSN171EqNMQxB3/eIjylyulPLweKhIKGMpllgnpxnD
	fCYgEpGx3wSdv/k6MUfQ7bBfV4MAnb8lGqshHh50qIDWNGZ7zmKEmlL/9Y/y32dPb55MktTyxuZTB
	l5knJWxBiL0qAUc/mvFs/SGKqqP8ovUXwOMMWQFTmTWhdcOxcZQKIX+DPxuAlDX/7krpwQKmAykZt
	/XBVTbZprLYdpGpJxDyb9i5A/xZzsSjN7gWYjjaTMbz7+25IrRs2ki1MRlgkgiUSoxx5kUpDkhKEy
	s2jMHvZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXUMy-0002ju-GG; Tue, 27 Oct 2020 19:10:56 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXUMt-0002iV-TF; Tue, 27 Oct 2020 19:10:53 +0000
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2020 12:10:48 -0700
X-QCInternal: smtphost
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
 by ironmsg01-sd.qualcomm.com with ESMTP; 27 Oct 2020 12:10:47 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
 id B146220F57; Tue, 27 Oct 2020 12:10:47 -0700 (PDT)
From: Asutosh Das <asutoshd@codeaurora.org>
To: cang@codeaurora.org, martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Subject: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Date: Tue, 27 Oct 2020 12:10:36 -0700
Message-Id: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_151052_113996_8BFA34E0 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: Bean Huo <beanhuo@micron.com>, Bart Van Assche <bvanassche@acm.org>,
 linux-arm-msm@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Asutosh Das <asutoshd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Can Guo <cang@codeaurora.org>

During clock gating, after clocks are disabled,
put hba into LPM to save more power.

Acked-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c |  9 +++++++--
 drivers/scsi/ufs/ufshcd.h | 13 +++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 47c544d..9fc1bac 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -245,6 +245,8 @@ static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba);
 static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
 static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set);
 static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable);
+static void ufshcd_hba_vreg_set_lpm(struct ufs_hba *hba);
+static void ufshcd_hba_vreg_set_hpm(struct ufs_hba *hba);
 
 static inline bool ufshcd_valid_tag(struct ufs_hba *hba, int tag)
 {
@@ -1548,6 +1550,7 @@ static void ufshcd_ungate_work(struct work_struct *work)
 	}
 
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
+	ufshcd_hba_vreg_set_hpm(hba);
 	ufshcd_setup_clocks(hba, true);
 
 	ufshcd_enable_irq(hba);
@@ -1713,6 +1716,8 @@ static void ufshcd_gate_work(struct work_struct *work)
 		/* If link is active, device ref_clk can't be switched off */
 		__ufshcd_setup_clocks(hba, false, true);
 
+	/* Put the host controller in low power mode if possible */
+	ufshcd_hba_vreg_set_lpm(hba);
 	/*
 	 * In case you are here to cancel this work the gating state
 	 * would be marked as REQ_CLKS_ON. In this case keep the state
@@ -8405,13 +8410,13 @@ static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 
 static void ufshcd_hba_vreg_set_lpm(struct ufs_hba *hba)
 {
-	if (ufshcd_is_link_off(hba))
+	if (ufshcd_is_link_off(hba) || ufshcd_can_aggressive_pc(hba))
 		ufshcd_setup_hba_vreg(hba, false);
 }
 
 static void ufshcd_hba_vreg_set_hpm(struct ufs_hba *hba)
 {
-	if (ufshcd_is_link_off(hba))
+	if (ufshcd_is_link_off(hba) || ufshcd_can_aggressive_pc(hba))
 		ufshcd_setup_hba_vreg(hba, true);
 }
 
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 47eb143..0fbb735 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -592,6 +592,13 @@ enum ufshcd_caps {
 	 * inline crypto engine, if it is present
 	 */
 	UFSHCD_CAP_CRYPTO				= 1 << 8,
+
+	/*
+	 * This capability allows the controller regulators to be put into
+	 * lpm mode aggressively during clock gating.
+	 * This would increase power savings.
+	 */
+	UFSHCD_CAP_AGGR_POWER_COLLAPSE			= 1 << 9,
 };
 
 struct ufs_hba_variant_params {
@@ -829,6 +836,12 @@ return true;
 #endif
 }
 
+static inline bool ufshcd_can_aggressive_pc(struct ufs_hba *hba)
+{
+	return !!(ufshcd_is_link_hibern8(hba) &&
+		  (hba->caps & UFSHCD_CAP_AGGR_POWER_COLLAPSE));
+}
+
 static inline bool ufshcd_is_auto_hibern8_supported(struct ufs_hba *hba)
 {
 	return (hba->capabilities & MASK_AUTO_HIBERN8_SUPPORT) &&
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
