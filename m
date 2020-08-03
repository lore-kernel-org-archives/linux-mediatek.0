Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F425C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 04:15:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5068320775
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 04:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MZDEJbfc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PgOd+GHW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5068320775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rt960gJaBTFeL3R3aHm/o7nn8TdukI/wW19POGScssI=; b=MZDEJbfcdOmjQ401Ompyd+Z9my
	OVfT8eH4MJnNWs5cDyu7qvkXmg5wpSD1WWZSfMm2+yBXPPpseHmVRQ9ZCMZ3dEN8W8CyqrBbsa2vZ
	FAdjVFZ6nIzOve+1TlzkUdzUnWr2JNaT72QL25moGxvoy0BUm905znExmmtB48pp7ob4wgmHafcZN
	yQWM8ydclM6UvuAC9obJO0vXSIahF1Qggh+SbwrKorB1H60t2rWRl3SbCcMxgbNILOgVaGof9QHuN
	MEUK0pKeCvOUersMI2RScpFwqLwXTeo/fW+QtSgRS3Eesc+e5pMRZ9ZpSJ5OGXVn7YIrx/lRtbuuC
	ikRoqbhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Rt4-0007oo-St; Mon, 03 Aug 2020 04:15:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Rt0-0007o2-CP; Mon, 03 Aug 2020 04:15:43 +0000
X-UUID: 1287c51b1cff426a9de2402d73dfa68b-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pnVyHtm1kZIK8iFHc2H0Nggm6hcXfQ0T1tugUK4dLkI=; 
 b=PgOd+GHWtTHElIt8Kj9BCXan9eCf1V+qineVTxVWU7xKGENxFXT7fJsocQyhlvB/wULQZaAK2iEXOs1rNzNYuDJPSoJcHTaIbcSCW3WZBtP+YAUowuMsqclZm3tmmqev9Z0C2AIDCnw/O8/Y6jTPQrHGJU8xAj6nbDT9g/aonHo=;
X-UUID: 1287c51b1cff426a9de2402d73dfa68b-20200802
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1906574755; Sun, 02 Aug 2020 20:15:38 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 21:15:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 12:15:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 12:15:36 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v5] scsi: ufs: Quiesce all scsi devices before shutdown
Date: Mon, 3 Aug 2020 12:15:36 +0800
Message-ID: <20200803041536.6575-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1FB26CA140231F142D06814CF4C037385A0CA463E7871E07C06AEF6C4CC617842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_001542_555633_18581A76 
X-CRM114-Status: GOOD (  16.09  )
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
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
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

To fix this kind of issues, in ufshcd_shutdown(),

1. Use pm_runtime_get_sync() instead of resuming UFS device by
   ufshcd_runtime_resume() "internally" to let runtime PM framework
   manage and prevent concurrent runtime operations by incoming I/O
   requests.

2. Specifically quiesce all SCSI devices to block all I/O requests
   after device is resumed.

Example of racing scenario: While UFS device is runtime-suspended

Thread #1: Executing UFS shutdown flow, e.g.,
           ufshcd_suspend(UFS_SHUTDOWN_PM)

Thread #2: Executing runtime resume flow triggered by I/O request,
           e.g., ufshcd_resume(UFS_RUNTIME_PM)

This breaks the assumption that UFS PM flows can not be running
concurrently and some unexpected racing behavior may happen.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 40 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 307622284239..e5b99f1b826a 100644
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
@@ -8629,6 +8635,13 @@ int ufshcd_runtime_idle(struct ufs_hba *hba)
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
@@ -8640,6 +8653,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
 	int ret = 0;
+	struct scsi_target *starget;
 
 	if (!hba->is_powered)
 		goto out;
@@ -8647,11 +8661,27 @@ int ufshcd_shutdown(struct ufs_hba *hba)
 	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
 		goto out;
 
-	if (pm_runtime_suspended(hba->dev)) {
-		ret = ufshcd_runtime_resume(hba);
-		if (ret)
-			goto out;
-	}
+	/*
+	 * Let runtime PM framework manage and prevent concurrent runtime
+	 * operations with shutdown flow.
+	 */
+	if (pm_runtime_get_sync(hba->dev))
+		pm_runtime_put_noidle(hba->dev);
+
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
 
 	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
 out:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
