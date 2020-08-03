Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DDBC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 10:15:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FFF720678
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 10:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rg+PqgXR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z9X8s/am"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FFF720678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SHdDYfbep8KPaPhu+g6eyxTKow7vvHEc0bxNPI0f7yA=; b=rg+PqgXRGNEpd5O8YDdIjvwvBB
	EuP4cGRil2ZJ/pmg1Da74WzN7k8JNyRDYterep8hcDXlW5tI0QKtGx/eY0CTq1FzrnUxnLCLyRFnN
	jzIMtnztEsM69K5xtVCpulmFIPYSBzCJoq5Ab0EpX5tTTE5RXN4EuVO2Qu57tzdFGBOySftsd2yF5
	8gPy4p8uu8xgHMjZQqB5ceDqOC8TppWFbm1ZVtZV6LN7zFHETswzjh6k4WUx/ouXTG8EFRnVko/w0
	7X5bQEkJgfxWqFT+XhdvBYeGLrh9/TBeKE3qTDEN8OvdQsnr7z3fv8rMd9n8i9frkjXaLJD4MALWU
	Zj/fRsEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2XUj-0006y1-BF; Mon, 03 Aug 2020 10:15:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2XUf-0006wr-LC; Mon, 03 Aug 2020 10:14:58 +0000
X-UUID: 4214f54d53834de58f55ee951a94d25a-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9uXB7CfOtYtYRWovnKzlo2DYGcJuja1YS8PgGiAgL68=; 
 b=Z9X8s/amDLga6k7+LnXM2iukGWAhlzT/xf1AJmLCUmX69BC7pHY/XQjXs0cXvFcXYLkKDv2qaYzYd+Ugd6GmYQO8mz1Gr2hUUClJgcAJACrV1Gr9WLmFdcGA//iC1hhLuZHY+KCdnC6aCTp8O1iQCUDzzX8RlvlQ4C8p/UHHBjI=;
X-UUID: 4214f54d53834de58f55ee951a94d25a-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 407463696; Mon, 03 Aug 2020 02:14:44 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 03:04:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 18:04:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 18:04:47 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <cang@codeaurora.org>, <bvanassche@acm.org>
Subject: [PATCH v7] scsi: ufs: Quiesce all scsi devices before shutdown
Date: Mon, 3 Aug 2020 18:04:48 +0800
Message-ID: <20200803100448.2738-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0752CF73C08E36F99AA4AE3C4C4439F01E08ABB0F4EB780CBF1B73425E7CBCF92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_061457_900761_D1F56EEF 
X-CRM114-Status: GOOD (  14.14  )
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
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com,
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
Changes:
  - Since v6:
	- Do quiesce to all SCSI devices.
  - Since v4:
	- Use pm_runtime_get_sync() instead of resuming UFS device by ufshcd_runtime_resume() "internally".
---
 drivers/scsi/ufs/ufshcd.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 307622284239..7cb220b3fde0 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8640,6 +8640,7 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
 	int ret = 0;
+	struct scsi_target *starget;
 
 	if (!hba->is_powered)
 		goto out;
@@ -8647,11 +8648,27 @@ int ufshcd_shutdown(struct ufs_hba *hba)
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
+	pm_runtime_get_sync(hba->dev);
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
+	list_for_each_entry(starget, &hba->host->__targets, siblings)
+		scsi_target_quiesce(starget);
 
 	ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
 out:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
