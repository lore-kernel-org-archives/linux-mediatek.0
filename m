Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE768C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 13:57:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7731423382
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 13:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7731423382
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ntZuVJv1bBMsrT/nB3p3XCoFH5kp1eWIS0/QDcTUoQ=; b=lwTM5XAD1O05pNjnine9qp4h5O
	1SkqIuFfOo3IyER6dezf6V/mkjImtdQGPyP62E9GID6O78Sv1k4w4UcqcOKF0LuNyF2i6u3B+en2w
	eMh8J+M2q1b1mC5C1s1J5uzG/rrxq+d/UL629Py0mtAn1E/K10nCh89fIFeybSZJKeL0pTLVIw1xh
	ocs9wwJtAzUYqMTiMqedLrtO4XkdlvkQLxBw/2G9gGIv1EdW4IO9uiw888rMaIPZftQJHcVS5xBGa
	EvqyfOHNu+BT7BySU5lSftTf1ryFtwKSiN1eHSdwbfb9dCNcpm/oPsgbfHM0hdLR/l+okItUdBZer
	wvNeWgKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzgeT-00021o-VX; Wed, 13 Jan 2021 13:57:34 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzgeL-00020B-F5; Wed, 13 Jan 2021 13:57:30 +0000
IronPort-SDR: G2OWrMpnBVYEIU36IqQ9q5rCcsBn2X7PItLcCW3e/o26XxbfRQTCp/IOApGWrsu9LsZLvxST/p
 qBqe03IW1OATbotxAG9pxIJwv+8zWalGrxd211NC4NCBgw4mmlyxFZ4UuToclLrn7oY1BDtHzR
 WObXTkmb3+K9LS9pueiPg/VduWy45zgGs3kfBobx9lm+NVvyaADt2DWDeOW0WrBjYJnNS4Nm8Z
 hgdAH7+TNbL/C9QNJtURZEQDoZcjSYSr6yi+1oz0krHl4j5R//5uVutZ3hq8n1hsGbicIgMfzS
 9XE=
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="47660257"
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by labrats.qualcomm.com with ESMTP; 13 Jan 2021 05:57:22 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg04-sd.qualcomm.com with ESMTP; 13 Jan 2021 05:57:20 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 81E542191C; Wed, 13 Jan 2021 05:57:20 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH v4 1/2] scsi: ufs: Fix a possible NULL pointer issue
Date: Wed, 13 Jan 2021 05:57:08 -0800
Message-Id: <1610546230-14732-2-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610546230-14732-1-git-send-email-cang@codeaurora.org>
References: <1610546230-14732-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_085725_664841_B17E76AD 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
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

During system resume/suspend, hba could be NULL. In this case, do not touch
eh_sem.

Fixes: 88a92d6ae4fe ("scsi: ufs: Serialize eh_work with system PM events and async scan")

Acked-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 53fd59c..969aed9 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -94,6 +94,8 @@
 		       16, 4, buf, __len, false);                        \
 } while (0)
 
+static bool early_suspend;
+
 int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 		     const char *prefix)
 {
@@ -8953,8 +8955,14 @@ int ufshcd_system_suspend(struct ufs_hba *hba)
 	int ret = 0;
 	ktime_t start = ktime_get();
 
+	if (!hba) {
+		early_suspend = true;
+		return 0;
+	}
+
 	down(&hba->eh_sem);
-	if (!hba || !hba->is_powered)
+
+	if (!hba->is_powered)
 		return 0;
 
 	if ((ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl) ==
@@ -9002,9 +9010,12 @@ int ufshcd_system_resume(struct ufs_hba *hba)
 	int ret = 0;
 	ktime_t start = ktime_get();
 
-	if (!hba) {
-		up(&hba->eh_sem);
+	if (!hba)
 		return -EINVAL;
+
+	if (unlikely(early_suspend)) {
+		early_suspend = false;
+		down(&hba->eh_sem);
 	}
 
 	if (!hba->is_powered || pm_runtime_suspended(hba->dev))
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
