Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311C1C83020
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 13:33:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5285206CA
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 13:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5285206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HZsNtovnbN8XGQwtNV8rmiIXxc1H9PhYADApkbUsfPM=; b=TcACt3PpvEPD30gtZWvYzHAUE
	Xo+F/eozPN5Tr5kmBinzHncEifFpOLW4PRgibOAZbQxiFfHqWtE3fviq4luFpJT+lPXwV+5j14jX+
	49bPplcdi+YAOXADP9medmqAUYq9IRsVx5D0K3vsbcLPVCFnKD9P+yI+u7fdcXJ5AKz0pEMe5ksJz
	N/IK8qL6GcjqiWrPMEYLY1P7rX71kmwyqZ94vgt9B0Q6nJSvNLnm2OFjCMWCQbSCEEEsFJkyTuIuj
	OHP92KRLmEEgwDZe+SbYn+yGzviNz//CiNMB75Nyqkc46GRh3fvxpMKGCw+NPL2LctBeCmLII1F8n
	D7kpupp6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkojf-0004vP-7v; Thu, 03 Dec 2020 13:33:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkog9-0002xH-Eg; Thu, 03 Dec 2020 13:29:50 +0000
From: Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/23] scsi: ufs: Make sure clk scaling happens
 only when HBA is runtime ACTIVE
Date: Thu,  3 Dec 2020 08:29:20 -0500
Message-Id: <20201203132935.931362-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203132935.931362-1-sashal@kernel.org>
References: <20201203132935.931362-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_082949_749189_F572769E 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Can Guo <cang@codeaurora.org>, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Can Guo <cang@codeaurora.org>

[ Upstream commit 73cc291c270248567245f084dcdf5078069af6b5 ]

If someone plays with the UFS clk scaling devfreq governor through sysfs,
ufshcd_devfreq_scale may be called even when HBA is not runtime ACTIVE.
This can lead to unexpected error. We cannot just protect it by calling
pm_runtime_get_sync() because that may cause a race condition since HBA
runtime suspend ops need to suspend clk scaling. To fix this call
pm_runtime_get_noresume() and check HBA's runtime status. Only proceed if
HBA is runtime ACTIVE, otherwise just bail.

governor_store
 devfreq_performance_handler
  update_devfreq
   devfreq_set_target
    ufshcd_devfreq_target
     ufshcd_devfreq_scale

Link: https://lore.kernel.org/r/1600758548-28576-1-git-send-email-cang@codeaurora.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index b6ce880ddd153..675e16e61ebdd 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1257,8 +1257,15 @@ static int ufshcd_devfreq_target(struct device *dev,
 	}
 	spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
 
+	pm_runtime_get_noresume(hba->dev);
+	if (!pm_runtime_active(hba->dev)) {
+		pm_runtime_put_noidle(hba->dev);
+		ret = -EAGAIN;
+		goto out;
+	}
 	start = ktime_get();
 	ret = ufshcd_devfreq_scale(hba, scale_up);
+	pm_runtime_put(hba->dev);
 
 	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
 		(scale_up ? "up" : "down"),
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
