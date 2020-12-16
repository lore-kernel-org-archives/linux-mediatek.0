Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188F1C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 13:27:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E002339F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 13:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E002339F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mry84cm6D7fYe8b2XgONPn2AdmD7gYquILNx+JQpfmA=; b=ZSch3+pvCWuxqLE9o3rqIdNTK
	BuhKXcPHPyBg3d3G9A2X4g4h+qhgKrhujnRHiZqP1sxP3J+7OxR5ekFreoWKfbEq6G0Z3B+B52L2E
	lrKQkLzAC5en/zd0arpB5dC2VEpP/8Tz0Icax3Ez6as4n4yLgR/UEN4LkPH0zY3dd95sMlrAUWXzW
	lRLR1CeihSvzFBQxIebkLDdkHX8Wu2vL+OqV5QPJlgKIkbTMd7K6O5eRiaoj2+2rWPmLX3Yd3Pub2
	PaJuWT3XS88d627mjO8iIWXNagf+O6pjC7CXFivD/EtYyO2y96q9y1AzVR0jJKeCKThTdTw+WLLhY
	+GoPrdWig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpWpZ-0001L3-AF; Wed, 16 Dec 2020 13:27:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpWpO-0001HB-Nt; Wed, 16 Dec 2020 13:26:52 +0000
X-UUID: 5f9359c3b647428182ecc4bcbdfaa309-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RrFsO25BU1KuLjJWHpwVSJg5RCBzoyE7vOTiEUbQy2Q=; 
 b=YY4ZR0igkq2MiBmQVa6NT1dGeqZ6YRugO1Nx0tY4TxAPREp7xTedqV22DZpst/ZRq+zQxbIArpdGKpbksq2T8f5d9vH5fC6nNoPe2ICaw8uGwktMI/bYsvEkSbKwfqp+pA8Jb7mFZre9DKFkp+jHtqV+XngTXFfUiCaBiLZ/mck=;
X-UUID: 5f9359c3b647428182ecc4bcbdfaa309-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2007957847; Wed, 16 Dec 2020 05:26:45 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 05:16:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 21:16:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Dec 2020 21:16:39 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 1/4] scsi: ufs: Refactor cancelling clkscaling works
Date: Wed, 16 Dec 2020 21:16:36 +0800
Message-ID: <20201216131639.4128-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216131639.4128-1-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_082651_026033_AF98BB83 
X-CRM114-Status: GOOD (  11.36  )
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

Cancelling suspend_work and resume_work is only required while
suspending clk-scaling. Thus moving these two invokes into
ufshcd_suspend_clkscaling() function.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 052479a56a6f..a91b73a1fc48 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1451,6 +1451,9 @@ static void ufshcd_suspend_clkscaling(struct ufs_hba *hba)
 	if (!ufshcd_is_clkscaling_supported(hba))
 		return;
 
+	cancel_work_sync(&hba->clk_scaling.suspend_work);
+	cancel_work_sync(&hba->clk_scaling.resume_work);
+
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	if (!hba->clk_scaling.is_suspended) {
 		suspend = true;
@@ -1514,9 +1517,6 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 	pm_runtime_get_sync(hba->dev);
 	ufshcd_hold(hba, false);
 
-	cancel_work_sync(&hba->clk_scaling.suspend_work);
-	cancel_work_sync(&hba->clk_scaling.resume_work);
-
 	if (value) {
 		ufshcd_resume_clkscaling(hba);
 	} else {
@@ -5663,11 +5663,8 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 		ufshcd_vops_resume(hba, UFS_RUNTIME_PM);
 	} else {
 		ufshcd_hold(hba, false);
-		if (hba->clk_scaling.is_enabled) {
-			cancel_work_sync(&hba->clk_scaling.suspend_work);
-			cancel_work_sync(&hba->clk_scaling.resume_work);
+		if (hba->clk_scaling.is_enabled)
 			ufshcd_suspend_clkscaling(hba);
-		}
 	}
 	down_write(&hba->clk_scaling_lock);
 	hba->clk_scaling.is_allowed = false;
@@ -8512,11 +8509,9 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	ufshcd_hold(hba, false);
 	hba->clk_gating.is_suspended = true;
 
-	if (hba->clk_scaling.is_enabled) {
-		cancel_work_sync(&hba->clk_scaling.suspend_work);
-		cancel_work_sync(&hba->clk_scaling.resume_work);
+	if (hba->clk_scaling.is_enabled)
 		ufshcd_suspend_clkscaling(hba);
-	}
+
 	down_write(&hba->clk_scaling_lock);
 	hba->clk_scaling.is_allowed = false;
 	up_write(&hba->clk_scaling_lock);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
