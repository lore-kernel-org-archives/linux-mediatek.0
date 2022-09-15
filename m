Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C313BECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iyNKhEf01mkI1QPkYYxrp17y2Y3l4kNNw3ZTDAadyT0=; b=09yZ5K4HybeQAXP1NC/UmzmJSi
	Ml8aYE189oNCfagWEHg/gQCSOF6YnbzdRdnbQ3r7G5JJEBUSDchi0pJTBrBBNjuSLOKOPcC+X4kFH
	BV4QCmWL07zyyFbzlbJRQMCmRIw4BXKhRFDdJYk6NAJE/iEBc9D0LbkbovnwLaDaHQJjNlguWfnRZ
	QUAhlQpbNRaths38eQfmcTiaXXtTw0PO14Z2umaqRRBbdQD6FYsowx72OiGZVZX0IpMfa4JEaZGAZ
	Ev5kFWjsl54cQh2QAEWoeyVzDELmfjDRoa+Qi4EbcsJz7Y+Usc8jLAtaCMdWpqMYw3mTtV9N6CDxD
	25V54QHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYo03-008d7e-8G; Thu, 15 Sep 2022 12:29:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYo01-008d63-6d
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 12:29:46 +0000
X-UUID: b35ff35789924108a8217d234b0ec17f-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iyNKhEf01mkI1QPkYYxrp17y2Y3l4kNNw3ZTDAadyT0=;
	b=fKkA0AKzEWZ5pHV4DG/IOB9TINuBqwiN1aH5ueKewKwYn3iVZfcu6sZw+ALuDfeliCN+nKDzz1b/Mf22UWfjrbZMwbrjCqCOZCcekdcvd0+L+zAO1970M9Ae+gAeTJE7XljkxaFkgVaqetnqj5RmOmMdRoT+vZq7i4FPoJbkeuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b46dcc7e-64f0-4b4f-9f9a-4aa0ffc7823e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:b5b3c65d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b35ff35789924108a8217d234b0ec17f-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1091549272; Thu, 15 Sep 2022 05:29:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 19:59:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 19:59:00 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v1] ufs: core: bypass get rpm when err handling with pm_op_in_progress
Date: Thu, 15 Sep 2022 19:58:58 +0800
Message-ID: <20220915115858.7642-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_052945_294017_D48B420E 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

If error happened in rpm flow, get rpm will stuck because rpm is
suspending or resuming. And it cause IO hang.
This patch bypass get rpm when err handling with pm_op_in_progress.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a202d7d5240d..cc58fb585df2 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6086,9 +6086,13 @@ static void ufshcd_clk_scaling_suspend(struct ufs_hba *hba, bool suspend)
 	}
 }
 
-static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
+static void ufshcd_err_handling_prepare(struct ufs_hba *hba, bool *rpm_put)
 {
-	ufshcd_rpm_get_sync(hba);
+	if (!hba->pm_op_in_progress) {
+		ufshcd_rpm_get_sync(hba);
+		*rpm_put = true;
+	}
+
 	if (pm_runtime_status_suspended(&hba->ufs_device_wlun->sdev_gendev) ||
 	    hba->is_sys_suspended) {
 		enum ufs_pm_op pm_op;
@@ -6122,13 +6126,14 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 	cancel_work_sync(&hba->eeh_work);
 }
 
-static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
+static void ufshcd_err_handling_unprepare(struct ufs_hba *hba, bool rpm_put)
 {
 	ufshcd_scsi_unblock_requests(hba);
 	ufshcd_release(hba);
 	if (ufshcd_is_clkscaling_supported(hba))
 		ufshcd_clk_scaling_suspend(hba, false);
-	ufshcd_rpm_put(hba);
+	if (rpm_put)
+		ufshcd_rpm_put(hba);
 }
 
 static inline bool ufshcd_err_handling_should_stop(struct ufs_hba *hba)
@@ -6210,6 +6215,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 	bool err_tm;
 	int pmc_err;
 	int tag;
+	bool rpm_put = false;
 
 	hba = container_of(work, struct ufs_hba, eh_work);
 
@@ -6231,7 +6237,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 	}
 	ufshcd_set_eh_in_progress(hba);
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
-	ufshcd_err_handling_prepare(hba);
+	ufshcd_err_handling_prepare(hba, &rpm_put);
 	/* Complete requests that have door-bell cleared by h/w */
 	ufshcd_complete_requests(hba);
 	spin_lock_irqsave(hba->host->host_lock, flags);
@@ -6394,7 +6400,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 	}
 	ufshcd_clear_eh_in_progress(hba);
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
-	ufshcd_err_handling_unprepare(hba);
+	ufshcd_err_handling_unprepare(hba, rpm_put);
 	up(&hba->host_sem);
 
 	dev_info(hba->dev, "%s finished; HBA state %s\n", __func__,
-- 
2.18.0


