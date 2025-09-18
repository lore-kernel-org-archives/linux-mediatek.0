Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BDACAC5AA
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toU0P22Jm/x0Gj0jIhwkoxtEoQOm15Pmx+DS4gZemx8=; b=KmxQeJtT14nXf1YrDx3YjO1kOA
	AWYabzRJiO0tQC6InfcbB69UtsTcijDdKspE9oDRN84iaEg51U3KtNLUbLfYy5oYEWMiT+a14jJIZ
	EoFQ7yGYcJ+tdpfDRDQScOAYcSBJJbLE23Ss5/TPilzx4Gu8hr+MZoyiN2hx61fl7e8vqDDDc5qAC
	VAzlmARe18SK8SIdw/uAoFgX8qykOTYX8v+vQL9LutEYpoCkvaxQvFzXpWGHYWoCXywbA+QrlROa5
	v6o8mUyO8BLzapiziR8IhIFRN4VUZVElCtp0Uhb3kXckdfd2H4/eZ4W7S56zcjD6KhHU/5emraBK3
	KqBzP0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3l-0000000H78t-0xaF;
	Thu, 18 Sep 2025 10:40:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3h-0000000H70g-1lGs
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 10:40:14 +0000
X-UUID: d940e6e8947b11f09f706fa2197c6ceb-20250918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=toU0P22Jm/x0Gj0jIhwkoxtEoQOm15Pmx+DS4gZemx8=;
	b=EEFmXq6G0IdzlczDtDEjTNm2KIwUVj1jaH64eAQT3+cKrNZg8GC8ETAXJ2zQUwy3UL7sZqUJjsUkCmMmhhRHa54zUYSMhXp1ibEr+rxNKTYYwx3OhP47+OGzi9qov32+eoPhs2miYuGuoT0E7kwIZYYBs5KxZaYTDbPcmSi4kIE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:6d109292-eb49-4abc-aa32-c1cefaa9756b,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:1ca6b93,CLOUDID:65c170f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d940e6e8947b11f09f706fa2197c6ceb-20250918
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 866559373; Thu, 18 Sep 2025 03:40:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 18 Sep 2025 18:40:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 18 Sep 2025 18:40:03 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 07/10] ufs: host: mediatek: Fix shutdown/suspend race condition
Date: Thu, 18 Sep 2025 18:36:17 +0800
Message-ID: <20250918104000.208856-8-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250918104000.208856-1-peter.wang@mediatek.com>
References: <20250918104000.208856-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034013_465396_C5081ED1 
X-CRM114-Status: GOOD (  12.10  )
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

Address a race condition between shutdown and suspend
operations in the UFS Mediatek driver. Before entering
suspend, check if a shutdown is in progress to prevent
conflicts and ensure system stability.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd-priv.h  | 5 -----
 drivers/ufs/host/ufs-mediatek.c | 6 ++++++
 include/ufs/ufshcd.h            | 5 +++++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index d0a2c963a27d..3ab50ece5abf 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -6,11 +6,6 @@
 #include <linux/pm_runtime.h>
 #include <ufs/ufshcd.h>
 
-static inline bool ufshcd_is_user_access_allowed(struct ufs_hba *hba)
-{
-	return !hba->shutting_down;
-}
-
 void ufshcd_schedule_eh_work(struct ufs_hba *hba);
 
 static inline bool ufshcd_keep_autobkops_enabled_except_suspend(
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 18ce985970f3..c56c85b55ba4 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2433,6 +2433,12 @@ static int ufs_mtk_system_suspend(struct device *dev)
 	struct arm_smccc_res res;
 	int ret;
 
+	/* Check if shutting down */
+	if (!ufshcd_is_user_access_allowed(hba)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	ret = ufshcd_system_suspend(dev);
 	if (ret)
 		goto out;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 109cbb36c02d..7df475ebd06d 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1436,6 +1436,11 @@ static inline int ufshcd_disable_host_tx_lcc(struct ufs_hba *hba)
 	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
 }
 
+static inline bool ufshcd_is_user_access_allowed(struct ufs_hba *hba)
+{
+	return !hba->shutting_down;
+}
+
 void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
 void ufshcd_fixup_dev_quirks(struct ufs_hba *hba,
 			     const struct ufs_dev_quirk *fixups);
-- 
2.45.2


