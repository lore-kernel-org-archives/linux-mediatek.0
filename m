Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7983C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+gcdaO9UiHY7GGX6wQyANF1w+C1YnJ7NUQbq09937Sg=; b=SoIKE1uAX1A9PJcx8SwqawTtdf
	zvApBVKpzOg0izZynbEQ98DpxYiPt2Jz5UhtN5rM/P8TV9rTpzjTQzz4zamGh486b/M5INaOA+Tso
	/5CKPZwxILBEcCs91plkUlKSx1+Cw5GQfR83oyWIMvTorIkGn+YHot+yBUUhibt8HciXqrqMGH+pS
	Qvmwe8xR7bvowo6ZPdFmMyYy6+duIgSXDX9TNnEAlzoQHHUJxfpvBK5udivYcssB8VPqxtkVmT2Q6
	bR5WBpz2ySadomIhlvBTV4eLvuO4m4ywetAnPINCZKGwUyj6itkShBOYAWBb/9qAURT8qjSQR50kH
	Y8+VWJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpVl-002EVR-PH; Fri, 22 Jul 2022 10:03:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpVi-002ELw-Fg
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 10:03:55 +0000
X-UUID: 5d67af4c1e1d4419bcd5205444965bac-20220722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cfe12422-0493-4c36-9844-9e76241658ed,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:2b903cb3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5d67af4c1e1d4419bcd5205444965bac-20220722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1891376049; Fri, 22 Jul 2022 03:03:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 22 Jul 2022 17:53:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Jul 2022 17:53:10 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v1] ufs: core: fix lockdep warning of clk_scaling_lock
Date: Fri, 22 Jul 2022 17:53:08 +0800
Message-ID: <20220722095308.10112-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_030354_547545_40F5B760 
X-CRM114-Status: GOOD (  12.15  )
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

There have a lockdep warning like below in current flow.
kworker/u16:0:  Possible unsafe locking scenario:

kworker/u16:0:        CPU0                    CPU1
kworker/u16:0:        ----                    ----
kworker/u16:0:   lock(&hba->clk_scaling_lock);
kworker/u16:0:                                lock(&hba->dev_cmd.lock);
kworker/u16:0:                                lock(&hba->clk_scaling_lock);
kworker/u16:0:   lock(&hba->dev_cmd.lock);
kworker/u16:0:

Because ufshcd_wb_toggle -> ufshcd_query_flag -> ufshcd_exec_dev_cmd
will get read lock of clk_scaling_lock, so ufshcd_devfreq_scale
can release read lock before call ufshcd_wb_toggle.
This patch only release write lock of clk_scaling_lock before
ufshcd_wb_toggle.

---
 drivers/ufs/core/ufshcd.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c7b337480e3e..209089bd8085 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1249,12 +1249,10 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba)
 	return ret;
 }
 
-static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, bool writelock)
+static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba)
 {
-	if (writelock)
-		up_write(&hba->clk_scaling_lock);
-	else
-		up_read(&hba->clk_scaling_lock);
+	up_write(&hba->clk_scaling_lock);
+
 	ufshcd_scsi_unblock_requests(hba);
 	ufshcd_release(hba);
 }
@@ -1271,7 +1269,7 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, bool writelock)
 static int ufshcd_devfreq_scale(struct ufs_hba *hba, bool scale_up)
 {
 	int ret = 0;
-	bool is_writelock = true;
+	bool wb_toggle = false;
 
 	ret = ufshcd_clock_scaling_prepare(hba);
 	if (ret)
@@ -1300,13 +1298,15 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, bool scale_up)
 		}
 	}
 
-	/* Enable Write Booster if we have scaled up else disable it */
-	downgrade_write(&hba->clk_scaling_lock);
-	is_writelock = false;
-	ufshcd_wb_toggle(hba, scale_up);
+	wb_toggle = true;
 
 out_unprepare:
-	ufshcd_clock_scaling_unprepare(hba, is_writelock);
+	ufshcd_clock_scaling_unprepare(hba);
+
+	/* Enable Write Booster if we have scaled up else disable it */
+	if (wb_toggle)
+		ufshcd_wb_toggle(hba, scale_up);
+
 	return ret;
 }
 
-- 
2.18.0


