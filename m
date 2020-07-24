Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08666C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:06:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BB220674
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oZIYtkHp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pVnHDUPN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BB220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y6eD0p9NX9p+fv3DOtRwEtZC5CnSGBsfqUX5Ni3HxIw=; b=oZIYtkHponxNLwClXlumDKfaFw
	D95RzZiaApx1TL4XpgFKnTXJa/XMtAp5yuCRUDMmhT1HtPKm3UYBR6KaRjxYaKv8CZtVL1mpFf7xa
	0nOJSNs7Sb8yoiAlnO55EdeTIn3Rhsd2+sKSHlHvMsTvhcLexduzdZh0MvgZwKbsm54fTO627uQlZ
	zTsKonjaZ3q5/vltHMhvJyvLJZG8XuI28hg7kgmacdkqdK0/8pzOKXEvL9iQYBT7g1UvweeydVHsk
	3bD8JSEKlKc9Ezm5EMPitXhfMph2iRyzUrBgUb73xEHF48H072xyZiUnJj0XtcukNQHfWOFWZ/qdi
	qJyZHBig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyL8-0002QQ-OS; Fri, 24 Jul 2020 14:06:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyL1-0002Nr-BK; Fri, 24 Jul 2020 14:06:16 +0000
X-UUID: 8f229a291c374281a6c5bd721e860fa0-20200724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IfOVClM/Lv4VLM52AY8HzEWSy/KLqQSwlIy6ABrgbPI=; 
 b=pVnHDUPNe2rI05GE1gssxsjxBFQc1J/M9qCklXmrCrgjFS8gDa+Zpufkg+qwjlWWWQRSxMJWQ3ivxE/1wVlKXL+56WPERUEf4KymBPszwRTrb+8a8wQnu8xiYl1+glQzo9Pduu3lHjH1wsy5c0jh+5hWcFfCpMshDohfIbX1IAU=;
X-UUID: 8f229a291c374281a6c5bd721e860fa0-20200724
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 239991410; Fri, 24 Jul 2020 06:01:46 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 07:01:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 22:01:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Jul 2020 22:01:45 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v4] scsi: ufs: Quiesce all scsi devices before shutdown
Date: Fri, 24 Jul 2020 22:01:40 +0800
Message-ID: <20200724140140.18186-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_100615_691035_4879169C 
X-CRM114-Status: GOOD (  11.69  )
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
 drivers/scsi/ufs/ufshcd.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 9d180da77488..2e18596f3a8e 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -159,6 +159,12 @@ struct ufs_pm_lvl_states ufs_pm_lvl_states[] = {
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
@@ -8620,6 +8626,13 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
 }
 EXPORT_SYMBOL(ufshcd_runtime_idle);
 
+static void ufshcd_quiesce_sdev(struct scsi_device *sdev, void *data)
+{
+	/* Suspended devices are already quiesced so can be skipped */
+	if (!pm_runtime_suspended(&sdev->sdev_gendev))
+		scsi_device_quiesce(sdev);
+}
+
 /**
  * ufshcd_shutdown - shutdown routine
  * @hba: per adapter instance
@@ -8631,6 +8644,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
 	int ret = 0;
+	struct scsi_target *starget;
 
 	if (!hba->is_powered)
 		goto out;
@@ -8644,6 +8658,21 @@ int ufshcd_shutdown(struct ufs_hba *hba)
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
+	ufshcd_scsi_for_each_sdev(ufshcd_quiesce_sdev);
+
 	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
 out:
 	if (ret)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
