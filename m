Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEF1C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 11:53:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD2623119
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 11:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD2623119
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC/XQKtnHfq6RevNmhlGlp0S9/GnkoYbezsY7fjOiao=; b=Bn3xyzw9++WobDmQmsYFtP65wJ
	4/AYTVyv5yTOporwMh5UBYA0fd3+dn+kUr66NxTJH/bBnbTaw6de54/sGleaelGBMTGCjmEf/WjyR
	XJlmJ3adMWBTWqlwLWelDzcX82/4DU9qLEZ113nO2AeKWmf8UBi81Dzcvz7gtRkOT+hdCd7xgnkQG
	JNhmxTAWfnOt/4oDyeNCGmbSY+9YO+ZRCltQ8RbkRy1RrnX1LnpXf0jR3ULZdE8zPhEJpHNtUi9e/
	zmEkzK8hHVQU4FpimOepjYHLHTLYQBWijyuA0MLayuxfSNBu25Z76MRwKgYr4VJ8sLxKua0e8x6b2
	aqQyThaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1pZv-00067P-P1; Tue, 19 Jan 2021 11:53:43 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1pZs-00066p-7m; Tue, 19 Jan 2021 11:53:41 +0000
IronPort-SDR: ZZoBz4pTtpQGVytKQ3DHRANApILwpfC4UkRPbn5u5bv5+HQhn0D+CC/k6a1cdnEjAXmtUGaDjI
 qkONwsi+Ef8DDZ1hb4NmrKfpZi168SI4jyFWAmHuB1N2Q8GZBcPk50i/ehk+hHl918NzqNYNF3
 lo0VYKPE8MgYPKm1QmC8rZ8LB5qSonsoXK7m33rmLR4k6o//r7osss1fO3X2m/ad4en5SsikQH
 KULvscJVKIVb+58RTjlwuXlq1ZaOPhMaO/OO2D17nJZbwNg6TMC6odm5pmmUQ63+XnYBMkLoNs
 1t4=
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="29552957"
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by labrats.qualcomm.com with ESMTP; 19 Jan 2021 03:53:35 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 19 Jan 2021 03:53:35 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 7166B218E7; Tue, 19 Jan 2021 03:53:35 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 ziqichen@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, cang@codeaurora.org
Subject: [PATCH v10 3/3] scsi: ufs: Revert "Make sure clk scaling happens only
 when HBA is runtime ACTIVE"
Date: Tue, 19 Jan 2021 03:53:01 -0800
Message-Id: <1611057183-6925-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611057183-6925-1-git-send-email-cang@codeaurora.org>
References: <1611057183-6925-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_065340_419489_A1354435 
X-CRM114-Status: UNSURE (   9.18  )
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
index df046bd..8ec41ea 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1355,15 +1355,8 @@ static int ufshcd_devfreq_target(struct device *dev,
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
