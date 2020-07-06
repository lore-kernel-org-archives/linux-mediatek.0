Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B765C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 13:22:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18EBA2070C
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 13:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1vd4L28";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qC7hcFS+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18EBA2070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9gdj/qRa1QpfQptpAgY+FZ0FAJKSO/aIDY2GyEa0X4g=; b=N1vd4L28ZFoT219DFdj4Zy2ZJ4
	fRoIPQrsYSSsF090W7cwwDJChMj12kegD4cg6JDiUEsyNUKtstL9TAvfvzM4u3Mi+qTrRyjkyYYIN
	8wSk3drj7YkcMX6tQr2UmwvGzfRP0yQz7f7wlRcx38a2idxuC/M2s9dSsKV1owjwesfn6moOy5CBs
	n4KukroeU7HC5lWti0FFiII3pULeq6TOYwJTdLlmAkt1PlM6esWT73uqxs56aVqRGn+OdNGqaqq9c
	Bk5mK0Jd3jsBqGH3Gx5No4D/VnAC2nXSnnOJyTruGPZ8Y4hSYBj2+YpPC2sFBxLXc1T+lkL13TBKJ
	bnyUdOFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsR4u-0006UP-3F; Mon, 06 Jul 2020 13:22:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsR4q-0006TQ-2j; Mon, 06 Jul 2020 13:22:33 +0000
X-UUID: 5fee842ed2b3447b80b410d8db3b8e1b-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hH72iy737LTFZ8Jp12sRADIb3rpiyBdOegJpRLwFXpA=; 
 b=qC7hcFS+yAxMi8qqonesIQDxXohAHIbTQQASwkOcxTUCVKY6qN6eU/Ad9hfyywxZoqCIOw5YmVgrgRdE9/69R4yvOjlRnUaAcNdFYKVHJ3iiz4LQJitkeUgDg7/st2ljWhn1Uz/az+OMqRd0f1SZ0d+krlrRSynQOOSLRLXac+E=;
X-UUID: 5fee842ed2b3447b80b410d8db3b8e1b-20200706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1528229900; Mon, 06 Jul 2020 05:22:09 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 06:22:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 21:22:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Jul 2020 21:22:15 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [RFC PATCH v3] scsi: ufs: Quiesce all scsi devices before shutdown
Date: Mon, 6 Jul 2020 21:22:18 +0800
Message-ID: <20200706132218.21171-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_092232_291518_C1B39C07 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently I/O request could be still submitted to UFS device while
UFS is working on shutdown flow. This may lead to racing as below
scenarios and finally system may crash due to unclocked register
accesses.

To fix this kind of issues, specifically quiesce all SCSI devices
before UFS shutdown to block all I/O request sending from block
layer.

Example of racing scenario: While UFS device is runtime-suspended

Thread #1: Executing UFS shutdown flow, e.g.,
           ufshcd_suspend(UFS_SHUTDOWN_PM)
Thread #2: Executing runtime resume flow triggered by I/O request,
           e.g., ufshcd_resume(UFS_RUNTIME_PM)

This breaks the assumption that UFS PM flows can not be running
concurrently and some unexpected racing behavior may happen.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 59358bb75014..104173c03492 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -158,6 +158,12 @@ struct ufs_pm_lvl_states ufs_pm_lvl_states[] = {
 	{UFS_POWERDOWN_PWR_MODE, UIC_LINK_OFF_STATE},
 };
 
+#define ufshcd_scsi_for_each_sdev(fn) \
+	list_for_each_entry(starget, &hba->host->__targets, siblings) { \
+		__starget_for_each_device(starget, NULL, \
+					  fn); \
+	}
+
 static inline enum ufs_dev_pwr_mode
 ufs_get_pm_lvl_to_dev_pwr_mode(enum ufs_pm_level lvl)
 {
@@ -8588,6 +8594,19 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
 }
 EXPORT_SYMBOL(ufshcd_runtime_idle);
 
+static void ufshcd_cleanup_queue(struct scsi_device *sdev, void *data)
+{
+	if (sdev->request_queue)
+		blk_cleanup_queue(sdev->request_queue);
+}
+
+static void ufshcd_quiece_sdev(struct scsi_device *sdev, void *data)
+{
+	/* Suspended devices are already quiecsed and shall be skipped */
+	if (!pm_runtime_suspended(&sdev->sdev_gendev))
+		scsi_device_quiesce(sdev);
+}
+
 /**
  * ufshcd_shutdown - shutdown routine
  * @hba: per adapter instance
@@ -8599,6 +8618,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
 	int ret = 0;
+	struct scsi_target *starget;
 
 	if (!hba->is_powered)
 		goto out;
@@ -8612,7 +8632,25 @@ int ufshcd_shutdown(struct ufs_hba *hba)
 			goto out;
 	}
 
+	/*
+	 * Quiesce all SCSI devices to prevent any non-PM requests sending
+	 * from block layer during and after shutdown.
+	 *
+	 * Here we can not use blk_cleanup_queue() since PM requests
+	 * (with BLK_MQ_REQ_PREEMPT flag) are still required to be sent
+	 * through block layer. Therefore SCSI command queued after the
+	 * scsi_target_quiesce() call returned will block until
+	 * blk_cleanup_queue() is called.
+	 *
+	 * Besides, scsi_target_"un"quiesce (e.g., scsi_target_resume) can
+	 * be ignored since shutdown is one-way flow.
+	 */
+	ufshcd_scsi_for_each_sdev(ufshcd_quiece_sdev);
+
 	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
+
+	/* Set queue as dying to not block queueing commands */
+	ufshcd_scsi_for_each_sdev(ufshcd_cleanup_queue);
 out:
 	if (ret)
 		dev_err(hba->dev, "%s failed, err %d\n", __func__, ret);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
