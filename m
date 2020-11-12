Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA66C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 05:46:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A8B2076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 05:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GclRZw6B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M9FD9QBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A8B2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SO5Dp3+Af/A9rfy/BWVI1RsQvRZ7vNt7eUIRO1+Cy6Q=; b=GclRZw6BUFKYKxj+/QDkRJmPaZ
	wR1od4Qfjn++3JCTErs8GX9jztMH1+3/8sS2PR2TbLy3jXOTsULiOjg0+KR6H33K6xO41UzWKGiLB
	yzD61dkyMbBdZYE1FAO1pUaAwsBpziI8x3A1bS9NSZorvjJSfxkvHWeQ7B2z1UtNBdhJU+ABjuTfQ
	WsetYgyuuha1aauUzOafyJX36c8ccaDg2Ke429pSFTI6nkS3u/G031xZtKDGiCdL6Dp94NeoePa4g
	haRVgByPdZ1u80dwgr2OM7ZL5QOwXOiO59C/Qdy9XRx2ynB9vJG5gCOY9mT3g4c59euiM6P+QMgD1
	oI5AF8wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd5Qp-0007vT-0V; Thu, 12 Nov 2020 05:46:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd5Qh-0007uK-20; Thu, 12 Nov 2020 05:45:56 +0000
X-UUID: 8db7e6b6f090463aabb7866b3b4c197b-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OqrKcUk4CmpdKLspoHxCVsYqKCTE6kA4Jw5Wq8RDC/k=; 
 b=M9FD9QBW8IH5wERcPFQsXmwX+9jWXkC+NnU7lABkwew+diPfqF7U/nuCytx6HE2sElC6OHE8BnUxGEr6gboI1KgzZZCVzYUMQ7Mu8NXNTbHk1o94t/eBdVTGj3FqRvcQcK+Mmm0OG1Q7z98Ym3OIMwPH+V5MiEKCmxV6KCmc3tw=;
X-UUID: 8db7e6b6f090463aabb7866b3b4c197b-20201111
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1840408444; Wed, 11 Nov 2020 21:45:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 21:45:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 13:45:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 Nov 2020 13:45:38 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH] scsi: ufs: Add retry flow for failed hba enabling
Date: Thu, 12 Nov 2020 13:45:37 +0800
Message-ID: <20201112054537.22494-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 71C1B6B624CEB4EED4AABDF7C779B0B4F80EF6905439682D9094502A978056822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_004555_326419_8A868817 
X-CRM114-Status: GOOD (  11.61  )
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

Once hba enabling is failed, add retry mechanism and in the
meanwhile allow vendors to apply specific handlings before
the next retry. For example, vendors can do vendor-specific
host reset flow in variant function "ufshcd_vops_hce_enable_notify()".

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 8001bbfec5c0..9186ee01379a 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4328,8 +4328,10 @@ static inline void ufshcd_hba_stop(struct ufs_hba *hba)
  */
 static int ufshcd_hba_execute_hce(struct ufs_hba *hba)
 {
-	int retry;
+	int retry_outer = 3;
+	int retry_inner;
 
+start:
 	if (!ufshcd_is_hba_active(hba))
 		/* change controller state to "reset state" */
 		ufshcd_hba_stop(hba);
@@ -4355,13 +4357,17 @@ static int ufshcd_hba_execute_hce(struct ufs_hba *hba)
 	ufshcd_delay_us(hba->vps->hba_enable_delay_us, 100);
 
 	/* wait for the host controller to complete initialization */
-	retry = 50;
+	retry_inner = 50;
 	while (ufshcd_is_hba_active(hba)) {
-		if (retry) {
-			retry--;
+		if (retry_inner) {
+			retry_inner--;
 		} else {
 			dev_err(hba->dev,
 				"Controller enable failed\n");
+			if (retry_outer) {
+				retry_outer--;
+				goto start;
+			}
 			return -EIO;
 		}
 		usleep_range(1000, 1100);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
