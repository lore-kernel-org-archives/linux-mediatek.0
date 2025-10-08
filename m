Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81EECAC5BB
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G76w+kFPdmOMA0cCRispGE38I+sLsfDMcB6m6OpGKpc=; b=sTuU4R0kN6xB4Ah3Qw+hA6dezi
	WfhOQ35tWZc5fFI8cJVKZmyL0fFk1MRtkm9+YOGZ4F2zoUh2715HDtowi2y6hxrsT5vrhecg67/uf
	yT3BSLhYUEFwomdrtlMZGtSI/MiDL/H9EkqQA0eH2T6HQIWocgZ1uPy9vdzjhUynkuxvZHDr7O19G
	TqC8Vt4E4wsa76WfhOPuZjoghXHbvCIqtXJ5omNCqHH6ZRi7fD5aqvJ94UIIitYM+UB6im3kw4T44
	2JOHPxDPzx8zD6lp9utSIz/J3DizQT4aYmSfOQ1j1u16Qw1fi7xeZYwSQd5dIhpnPNeMGtAQpioiS
	lAWgGAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6O6u-00000003K5N-1oqH;
	Wed, 08 Oct 2025 06:57:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6O6t-00000003K51-0BF7
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Oct 2025 06:57:16 +0000
X-UUID: 02a463aaa41411f0a52f393f94899d25-20251007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G76w+kFPdmOMA0cCRispGE38I+sLsfDMcB6m6OpGKpc=;
	b=VM/N3IV0aAv/KHYt6FHVjd2IxotH9tGvIFScqAgdzE82zm9/UXKtm+bCKvzU1cBXX06JA34ckFF5rEBGTwjdPkIiK0k6lJWJIAtMIbgZnzZknzNPsxiuYdWvlBNlflDc6dfUJOy6yzmE0PsOLYRQ1wdXAJ321YJyllRe77y1b1U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:04327d1e-029b-4ed8-8545-e465725a62f2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:7af62a02-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 02a463aaa41411f0a52f393f94899d25-20251007
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 660676592; Tue, 07 Oct 2025 23:57:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Oct 2025 14:57:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 8 Oct 2025 14:57:06 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>, <dan.carpenter@linaro.org>
Subject: [PATCH v2] ufs: core: Fix error handler host_sem issue
Date: Wed, 8 Oct 2025 14:55:43 +0800
Message-ID: <20251008065651.1589614-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_235715_097196_1C056ECA 
X-CRM114-Status: GOOD (  12.45  )
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

Fix the issue where host_sem is not released due to a new return
patch in commit f966e02ae521. Check pm_op_in_progress before
acquiring hba->host_sem to prevent deadlocks and ensure proper
resource management during error handling. Add comment for
use ufshcd_rpm_get_noresume() to safely perform link recovery
without interfering with ongoing PM operations.

Fixes: f966e02ae521 ("scsi: ufs: core: Fix runtime suspend error deadlock")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 8185a7791923..ff7a3d60b11d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6670,6 +6670,20 @@ static void ufshcd_err_handler(struct work_struct *work)
 		 hba->saved_uic_err, hba->force_reset,
 		 ufshcd_is_link_broken(hba) ? "; link is broken" : "");
 
+	/*
+	 * Use ufshcd_rpm_get_noresume() here to safely perform link recovery
+	 * even if an error occurs during runtime suspend or runtime resume.
+	 * This avoids potential deadlocks that could happen if we tried to
+	 * resume the device while a PM operation is already in progress.
+	 */
+	ufshcd_rpm_get_noresume(hba);
+	if (hba->pm_op_in_progress) {
+		ufshcd_link_recovery(hba);
+		ufshcd_rpm_put(hba);
+		return;
+	}
+	ufshcd_rpm_put(hba);
+
 	down(&hba->host_sem);
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	if (ufshcd_err_handling_should_stop(hba)) {
@@ -6681,14 +6695,6 @@ static void ufshcd_err_handler(struct work_struct *work)
 	}
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
-	ufshcd_rpm_get_noresume(hba);
-	if (hba->pm_op_in_progress) {
-		ufshcd_link_recovery(hba);
-		ufshcd_rpm_put(hba);
-		return;
-	}
-	ufshcd_rpm_put(hba);
-
 	ufshcd_err_handling_prepare(hba);
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
-- 
2.45.2


