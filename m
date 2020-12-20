Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A913C4361B
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 05:43:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2BE233CE
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 05:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB2BE233CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2THQ9k8oB7XbLWDgUdWLD03WLENxFluEFTGmcT/oTLU=; b=nWJOXh7L/DkN/iOwcMrv3pjXXZ
	oefZHEl23lI1C6xnxJNgQt+uP7nkeOJ8hyOkj3P4a7U6051tvKY5ntCCNZyrZK2DX2STG1Eyn0Rf0
	YncvkEKUcmUdKyzI48xhIi4mDKJtdTuA0RtBhm2Kw+jD96L4Glz1kNgVI8e2Hhgf8dtDYR/10d7hf
	is0aNtHP3/qFH2erIhZYCqtFv9ra4wK/+QHZuExG8uPLIUWZQGgu7vcXTFkqAaYdUi7wtmEiXWVvs
	7Ezm6ld1a5VyeENBRcuV0y4AlRvvJdvbuAB4MR+FhOpjVZCWqHw/ySLD2oMEdw7b6qn/3jCMwus1z
	rPNK473A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqrV3-0007WC-Be; Sun, 20 Dec 2020 05:43:21 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqrUo-0007Ta-G0; Sun, 20 Dec 2020 05:43:07 +0000
IronPort-SDR: RCN3T0Uid7HhfOQilNLdImPJtMoutoSW4oODCDaA5dqXhd0Tz4MrYGo7jkjVNMakN7bfiij6xk
 LbxmgqkqKOivwQUCiHtyIIN/QmInTYGuM9SuwLTww42V5WaGPOVW2/jtEkJ6ukbXnXOYC1KEDP
 EYbfDMIsu/WHPWmnpK8nEbyMIX4vyCzZdpVYKMSb2LxV2rxiTCo3RZERiR/7NtlkbxYLH3DK4v
 6B8jmu23ViY2FrcS+Kf6O4MjJT6HW7scwx+0Tl/yyEivgMFROS4Ij9Gsl8TqbmWZdmFxWNHEVy
 jDo=
X-IronPort-AV: E=Sophos;i="5.78,434,1599548400"; d="scan'208";a="47599281"
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by labrats.qualcomm.com with ESMTP; 19 Dec 2020 21:43:06 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg04-sd.qualcomm.com with ESMTP; 19 Dec 2020 21:43:05 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 1FB79212A8; Sat, 19 Dec 2020 21:43:05 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH v6 3/3] scsi: ufs: Revert "Make sure clk scaling happens only
 when HBA is runtime ACTIVE"
Date: Sat, 19 Dec 2020 21:42:47 -0800
Message-Id: <1608442968-38560-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608442968-38560-1-git-send-email-cang@codeaurora.org>
References: <1608442968-38560-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_004306_915723_34876ED6 
X-CRM114-Status: UNSURE (   9.78  )
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

Commit 73cc291c27024 ("Make sure clk scaling happens only when HBA is
runtime ACTIVE") is no longer needed since commit f7a42540928a8 ("scsi:
ufs: Protect some contexts from unexpected clock scaling") is a more
mature fix to protect UFS LLD stability from clock scaling invoked through
sysfs nodes by users.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 2dee21e..7229a1b 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1300,15 +1300,8 @@ static int ufshcd_devfreq_target(struct device *dev,
 	}
 	spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
 
-	pm_runtime_get_noresume(hba->dev);
-	if (!pm_runtime_active(hba->dev)) {
-		pm_runtime_put_noidle(hba->dev);
-		ret = -EAGAIN;
-		goto out;
-	}
 	start = ktime_get();
 	ret = ufshcd_devfreq_scale(hba, scale_up);
-	pm_runtime_put(hba->dev);
 
 	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
 		(scale_up ? "up" : "down"),
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
