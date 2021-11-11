Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26910C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 10:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E073961241
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 10:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E073961241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7b0fmy/XbxsN3x3uZ9WVKVVG4TqeOscka8yunxmOiB4=; b=Xv7d1Moth/1bXP
	CVfdI0GSIVEGfuylp8aFXsmnbN4xIS3y6//1goltl/1ZLEBBzcOlhr6iMhlwAu8tvMQoFwZdYoi72
	KNJ6lWsKDpCYvMFf8AEmOf6YyWfSXkSOtzmH+a15y1tBg3avipUe/Gua4RkRyr9nslYPaZ6ZDFy1v
	KAH1i4KNBBZZYgk97RxOgCuEbePVKXTPnwWqfcOhBssp40N2kZVWXLlTdNZIsqm4ymLmKnYnmL9rt
	K/28bpzZMlESB/4dkGdsrRWvPhofetzRhYXNhmnGSzDm4NUCywpeXXQm8cdaC6RSaHmogcs+dnMS3
	8C+Hqr8drOCE4irjB9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml6s7-007dpw-D4; Thu, 11 Nov 2021 09:59:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml6s3-007dpG-Iu
 for linux-mediatek@lists.infradead.org; Thu, 11 Nov 2021 09:59:54 +0000
X-UUID: 2a45727f42a445368760eab4de85a946-20211111
X-UUID: 2a45727f42a445368760eab4de85a946-20211111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 138066411; Thu, 11 Nov 2021 02:59:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 01:49:45 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 11 Nov 2021 17:49:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 11 Nov 2021 17:49:43 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
 <powen.kao@mediatek.com>, <jonathan.hsu@mediatek.com>,
 <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <mikebi@micron.com>
Subject: [PATCH v1] scsi: ufs: fix tm cmd timeout/ISR racing issue
Date: Thu, 11 Nov 2021 17:49:39 +0800
Message-ID: <20211111094939.14991-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_015951_652860_86C6FAA3 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

When tmc 100 ms timeout and recevied tmc complete ISR concurrently,
Bug happen because complete NULL poiner and KE.
Fix this racing issue by check NULL and use host_lock protect.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 5c6a58a666d2..6821ceb6783e 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6442,7 +6442,8 @@ static irqreturn_t ufshcd_tmc_handler(struct ufs_hba *hba)
 		struct request *req = hba->tmf_rqs[tag];
 		struct completion *c = req->end_io_data;
 
-		complete(c);
+		if (c)
+			complete(c);
 		ret = IRQ_HANDLED;
 	}
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
@@ -6597,7 +6598,10 @@ static int __ufshcd_issue_tm_cmd(struct ufs_hba *hba,
 		 * Make sure that ufshcd_compl_tm() does not trigger a
 		 * use-after-free.
 		 */
+		spin_lock_irqsave(hba->host->host_lock, flags);
 		req->end_io_data = NULL;
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+
 		ufshcd_add_tm_upiu_trace(hba, task_tag, UFS_TM_ERR);
 		dev_err(hba->dev, "%s: task management cmd 0x%.2x timed-out\n",
 				__func__, tm_function);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
