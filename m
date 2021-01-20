Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC02C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 10:05:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121372332B
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 10:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 121372332B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ64F3KyKbVpCe7Bi655FA+Fv4MwXVvyGI+h5PHqSjU=; b=GvxiPfiwTetV5BUbZ05N0LMm5N
	kRxwNkrloYS2qAxb4XTC4WXZKg4QKbeV63uB7PzyVN13JaG/c95ZY1VzCEtT8T6yxCZEuZy1j3iWR
	UMMJwtGsMjpswuannsGcmWJk6PuaonYgfBeWdDZjbE/xl7NDODefh/dLrpOVDe6LvaFjLREIcQH+l
	2Gbcv4ufbbPE19ZUjMby3HSiyEv2ATmIdXOY/ij3+V2GV4EuXLyel46PQrznVwyCIGENYHJnwATDG
	27XSdZ50bQuLsojLmzOuAQ/7Gu4jxZH9CDE66ivGDVeMX8pUZ3dcE/b5nNdoy+7TqtzyQqprkYU9p
	qZ88/+iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2AMZ-0006GP-W1; Wed, 20 Jan 2021 10:05:20 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2AMQ-0006EH-S8; Wed, 20 Jan 2021 10:05:12 +0000
IronPort-SDR: EbGbKVeIKXSlMEUYF/JLiVqv4VFBXgv1eIrzdW9r91PwqJxM2oZiiaxNtsh2cEIEVWX0Gb/qWu
 T1gQlRZYuIsR8AvTis08Oa9xhdPI7LUES+hp4YgTzB7z9T7lZZy4MmORp4hf6EfjVGagNhA0op
 bf6J9cbzvw+mnKbwYIbg6FhGLoRtHChNVcKdUcMDrNHjYdz0LP6xdavXI+7RjTok2nmnuzYmPK
 zgWgsfukK1T9GCIAyKPUYAaENYurn7/LkE7m5Gr65VyXoWSTjrxSOQUbz6n4C87A6swVwUplb9
 Clc=
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; d="scan'208";a="47682880"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by labrats.qualcomm.com with ESMTP; 20 Jan 2021 02:05:10 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg01-sd.qualcomm.com with ESMTP; 20 Jan 2021 02:05:10 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 6FCCD21941; Wed, 20 Jan 2021 02:05:10 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com, cang@codeaurora.org
Subject: [PATCH v11 3/3] scsi: ufs: Revert "Make sure clk scaling happens only
 when HBA is runtime ACTIVE"
Date: Wed, 20 Jan 2021 02:04:23 -0800
Message-Id: <1611137065-14266-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611137065-14266-1-git-send-email-cang@codeaurora.org>
References: <1611137065-14266-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_050511_126654_F870184D 
X-CRM114-Status: UNSURE (   9.23  )
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
runtime ACTIVE") is no longer needed since commit 8bd22d3c50e6f ("scsi:
ufs: Protect some contexts from unexpected clock scaling") is a more
mature fix to protect UFS LLD stability from clock scaling invoked through
sysfs nodes by users.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 750cf0d..e2517d5 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1335,15 +1335,8 @@ static int ufshcd_devfreq_target(struct device *dev,
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
