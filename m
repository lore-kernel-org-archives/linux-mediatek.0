Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA28AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 13:31:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80FEC206F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 13:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l0IUtTF/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z7mlhbDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80FEC206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aB4P50unM5iJSHDnRGRb4gJdAZ1r4VeUAVB1P0vwnSg=; b=l0IUtTF/jsKFD7wsm/HmfUcNMr
	Kl9s3Jwt/9oEzB9VsK4zSPG11CvEljB6HDU0CuTpWuPU8/Xj8SOghAntnq+h15AF1hxDFcnxEY6zt
	m5LoON9LFb0NZ5IyKJb+pq1h97WXlVNvcu3WqKeR9iJs68Ib8AFZdcH0c8soCY+5ZcMQLI7AL/Paf
	zefziGs1epZgNHhFCXiLco3y5WGaEk2uCN8ngD5CXSQQ7IlVdkqPz9XPv2OSF2xPvbmXCVezXz7HI
	S1qz2ocSeCLy+1hzhVG6SvJXOuIu6ZncXSVnTCoeULdESsYB+WHn+b+6qSafOJ8Dk9rIRnOhEA+rM
	tQh9Z7XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsRDl-0007qs-0F; Mon, 06 Jul 2020 13:31:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsRDe-0007qC-JZ; Mon, 06 Jul 2020 13:31:42 +0000
X-UUID: fdea907791594f4cbdd7410d5b5c0170-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JEKKXzqAAcN0UvZo8mMJzoVz8sWVLl6w/CEmyd3ob10=; 
 b=Z7mlhbDj7PETj/GJWWRzSgi0r12CgWLpcAsE1nDMfqydOA/CezKOq+YsV2A6SMjjcrfu5ob/vGcHgwn1JVG7qjCOVSfbO27EnB1fzNSP/r0E12ZzbDMlwHt3ZjqII9CZB0yMA3AKH7kk31CKUXEGvCwxsf39fHYiWJrJ5RQTmks=;
X-UUID: fdea907791594f4cbdd7410d5b5c0170-20200706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1585118686; Mon, 06 Jul 2020 05:31:18 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 06:21:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 21:21:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Jul 2020 21:21:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v3] scsi: ufs: Cleanup completed request without interrupt
 notification
Date: Mon, 6 Jul 2020 21:21:13 +0800
Message-ID: <20200706132113.21096-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: ACCDC8000567A9642C17428D46DC7631AE2F5179EBF4FB271AB3B227D089DFBA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_093138_859586_6AC1CE58 
X-CRM114-Status: GOOD (  10.67  )
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

If somehow no interrupt notification is raised for a completed request
and its doorbell bit is cleared by host, UFS driver needs to cleanup
its outstanding bit in ufshcd_abort().

Otherwise, system may crash by below abnormal flow:

After this request is requeued by SCSI layer with its
outstanding bit set, the next completed request will trigger
ufshcd_transfer_req_compl() to handle all "completed outstanding
bits". In this time, the "abnormal outstanding bit" will be detected
and the "requeued request" will be chosen to execute request
post-processing flow. This is wrong and blk_finish_request() will
BUG_ON because this request is still "alive".

It is worth mentioning that before ufshcd_abort() cleans the timed-out
request, driver need to check again if this request is really not
handled by __ufshcd_transfer_req_compl() yet because it may be
possible that the interrupt comes very lately before the cleaning.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 8603b07045a6..f23fb14df9f6 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6462,7 +6462,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 			/* command completed already */
 			dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from DB.\n",
 				__func__, tag);
-			goto out;
+			goto cleanup;
 		} else {
 			dev_err(hba->dev,
 				"%s: no response from device. tag = %d, err %d\n",
@@ -6496,9 +6496,14 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 		goto out;
 	}
 
+cleanup:
+	spin_lock_irqsave(host->host_lock, flags);
+	if (!test_bit(tag, &hba->outstanding_reqs)) {
+		spin_unlock_irqrestore(host->host_lock, flags);
+		goto out;
+	}
 	scsi_dma_unmap(cmd);
 
-	spin_lock_irqsave(host->host_lock, flags);
 	ufshcd_outstanding_req_clear(hba, tag);
 	hba->lrb[tag].cmd = NULL;
 	spin_unlock_irqrestore(host->host_lock, flags);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
