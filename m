Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEF3C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:35:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2551820663
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wXbRzS5p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iN7IUOpd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2551820663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u7oDowYJllJP16iuTJyYIXus0jx3IIq55AxnRGN/a8c=; b=wXbRzS5pt9P/YUrBj5H1qTkd7i
	INzdrqMo+KEoAAns1IHtmDWzYYX7G0OIG77oCpBzaSD/KXNU0lWjBcYJYj90xpy0FuX+PasUI/KtN
	LTnu39zRlDwrKKl5BpPfuPUI6bcEJFCroqIO5qvtb/BbqMU7irjR8t0NpxEmr5Na+15wmHWgaAx/8
	sCdDxAlHTz2sEVWmMFY79srjLudpNYt6KUdK+pyMKlKQoEpxc12SRyPJ/2g7nKxkp/PqF6S6E8JDI
	SGmgL2gen+UJjEy2RSEHt/l1Y73wcLvf7RROc4DVhRPqupFqneqzsfmLU6kDeG/Z7jPBvmlYvATNe
	REiG0uLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqq09-0006FM-AT; Thu, 02 Jul 2020 03:35:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqq04-0006Dy-Uo; Thu, 02 Jul 2020 03:35:02 +0000
X-UUID: 91fac700349840b7ab8740fd40221b3a-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O8tR3m1usHUyKyTLuqtgxgifBOAcJvs4RhW300Axtyc=; 
 b=iN7IUOpdM60nFIddzEpaCCTf0nsW6aiHatJa5NusX4xna0sJey4i8wj+Ne9tc3GToHwsd/blN77dU2okKRmPY8QC54FrudvUU0yhKapvfhL6V7Ysx3PLNpPXs38eZC7ywhxc+O1SbWqTBmpSCA0ihkkDcYwYNr+FtvO373DCCB4=;
X-UUID: 91fac700349840b7ab8740fd40221b3a-20200701
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 83981050; Wed, 01 Jul 2020 19:34:53 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 20:34:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 11:34:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 11:34:52 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [RFC PATCH v2] scsi: ufs: Quiesce all scsi devices before shutdown
Date: Thu, 2 Jul 2020 11:34:51 +0800
Message-ID: <20200702033451.26635-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_233501_373542_516C1021 
X-CRM114-Status: UNSURE (   9.90  )
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
 drivers/scsi/ufs/ufshcd.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 59358bb75014..18da2d64f9fa 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8599,10 +8599,27 @@ EXPORT_SYMBOL(ufshcd_runtime_idle);
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
 	int ret = 0;
+	struct scsi_target *starget;
 
 	if (!hba->is_powered)
 		goto out;
 
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
+
 	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
 		goto out;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
