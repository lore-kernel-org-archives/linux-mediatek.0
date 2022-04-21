Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE23C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UhXYE3i60wWRnypMYNgL/6n75yvEwqRg5TVHwGOJYo0=; b=yn97VYe5QwR12M
	VAcLgUueUB9WRDF6aqevlc6UMAm9s9WwBlpr8lPDEvEMlE+etJh2xQs+J5kuokc/aBSL7gnaL93BP
	gzlOAqZlfoHyhK7KhxJmqTVeNAOB49Oh+CoaDsx9dV8D6rJnN0hhPgs87aRxxrYVSgSlAUK30hYcw
	K8zITO0OHK+2IfoDNcwrPGGo0Xqv37IaP7eKlMAAnqxfQI2jdob/GMxz3lIMYLFbF6GKheDfV+2sN
	LEhg6F+lcgc2ysgujUJzE9/wpvMwIxBNVN6vXsFsseF3Io3mZKd4yakgY75VfZE4LMI2uhkQZHf+w
	tl+it7ZG3a/cpbjlsQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhY0e-00Dpyo-8B; Thu, 21 Apr 2022 14:42:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhY0Z-00Dpx4-Uc
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 14:42:14 +0000
X-UUID: 2dd6a0467f8d45c0976541079aa9b278-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:36cfef56-7a55-4e2c-9763-dca4b5945f8f, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:82f8a9ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2dd6a0467f8d45c0976541079aa9b278-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 206017466; Thu, 21 Apr 2022 07:42:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 07:42:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 21 Apr 2022 22:42:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Apr 2022 22:42:02 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
 <powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
 <mikebi@micron.com>, <beanhuo@micron.com>
Subject: [PATCH v1] scsi: ufs: fix rpm racing issue
Date: Thu, 21 Apr 2022 22:41:52 +0800
Message-ID: <20220421144152.23888-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_074212_031490_4824D801 
X-CRM114-Status: GOOD (  11.66  )
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

Device WLun may enter RPM_SUSPENDED and the consumer is RPM_ACTIVE.

The error state is
Device Wlun RPM: status:2, usage_count:0
Consumer: 0:0:0:49476 Link: rpm_active:1, RPM: status:2, usage_count:0
Consumer: 0:0:0:49456 Link: rpm_active:1, RPM: status:2, usage_count:0
Consumer: 0:0:0:0 Link: rpm_active:1, RPM: status:2, usage_count:0
Consumer: 0:0:0:1 Link: rpm_active:1, RPM: status:2, usage_count:0
Consumer: 0:0:0:2 Link: rpm_active:1, RPM: status:0, usage_count:0

Because rpm enable before rpm delay set, scsi_autopm_put_device
invoke by scsi_sysfs_add_sdev may cause consumer enter suspend immediately.
Thas will always set rpm_active to 1.
If driver_probe_device invoke pm_runtime_get_suppliers just befor
previous scsi_autopm_put_device, the rpm_active will change to 1
after pm_runtime_put_suppliers.
Set this delay to avoid scsi_autopm_put_device enter suspend immediately.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 3f9caafa91bf..1250792d16be 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5024,10 +5024,14 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
 	 * Block runtime-pm until all consumers are added.
 	 * Refer ufshcd_setup_links().
 	 */
-	if (is_device_wlun(sdev))
+	if (is_device_wlun(sdev)) {
 		pm_runtime_get_noresume(&sdev->sdev_gendev);
-	else if (ufshcd_is_rpm_autosuspend_allowed(hba))
+	} else if (ufshcd_is_rpm_autosuspend_allowed(hba)) {
 		sdev->rpm_autosuspend = 1;
+		pm_runtime_set_autosuspend_delay(&sdev->sdev_gendev,
+			RPM_AUTOSUSPEND_DELAY_MS);
+	}
+
 	/*
 	 * Do not print messages during runtime PM to avoid never-ending cycles
 	 * of messages written back to storage by user space causing runtime
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
