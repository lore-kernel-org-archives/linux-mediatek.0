Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D5DC3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5DNaqASfHVIb9MGSMByPHhB7Ozxw+7h46PhZyPOs+jc=; b=kL7aoi68H3ui+ETKqN8EjT4PPr
	yRwWKSwx2HXncMpFJ4NIFSWV6eLNty18va1ez6Cl1w/OwBe/R62Cxk1C1Nwolf1SUwKImlJyH6T6e
	ece+eq/dhC/w3Vwgbd2adevevSMzpMXMa/X+0tOrRYnPR1lQtZO7x6CrW/e6evLXXmOtxSyL+/4Ro
	7kga4foLsQ//T1mdNBYri4M5lvlTNlQfw1lHDBJnRmmwLgfZZXWqGCz1kURpYoffOMfQNJr5/9MY6
	QzJnkM3NH6xN5MGS6PREeKxRH1CnhSIOggma/094hkdmLxdTgLuYTONAQlKHq5hZoA5DJIFBgotuN
	MO+/feew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3A87-0037HI-CI; Thu, 08 Dec 2022 06:11:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3A84-00372j-0w
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 06:11:33 +0000
X-UUID: c45a6588bc2a4a67b86858eb45fbae6a-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5DNaqASfHVIb9MGSMByPHhB7Ozxw+7h46PhZyPOs+jc=;
	b=oyZVs1Xy8A1RNKHOy51YMvQPnL07bkAiMC4bKWYYP8Sf0tSm5yiUyVZyHETtV/jKxme3vzJY7g+KGykQ/WATex6znparvKyGrnOSB/IUNemd/NJo1DX7Lo80Hv938XaLvXbKzpEE2DGggQpJ/fJMsz8ui961HV8de7y25+p0m4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:0d84c723-0c2c-43ea-bfb2-2ded62c2c837,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:ba3ea924-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c45a6588bc2a4a67b86858eb45fbae6a-20221207
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 174943448; Wed, 07 Dec 2022 23:11:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 8 Dec 2022 14:10:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Dec 2022 14:10:39 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH v5] ufs: core: wlun suspend SSU/enter hibern8 fail recovery
Date: Thu, 8 Dec 2022 14:10:37 +0800
Message-ID: <20221208061037.24313-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_221132_130902_5AEBD4ED 
X-CRM114-Status: UNSURE (   8.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

When SSU/enter hibern8 fail in wlun suspend flow, trigger error
handler and return busy to break the suspend.
If not, wlun runtime pm status become error and the consumer will
stuck in runtime suspend status.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index b1f59a5fe632..c91d58d1486a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -106,6 +106,13 @@
 		       16, 4, buf, __len, false);                        \
 } while (0)
 
+#define ufshcd_force_error_recovery(hba) do {                           \
+	spin_lock_irq(hba->host->host_lock);                            \
+	hba->force_reset = true;                                        \
+	ufshcd_schedule_eh_work(hba);                                   \
+	spin_unlock_irq(hba->host->host_lock);                          \
+} while (0)
+
 int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 		     const char *prefix)
 {
@@ -9049,6 +9056,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 		if (!hba->dev_info.b_rpm_dev_flush_capable) {
 			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
+			if (ret && pm_op != UFS_SHUTDOWN_PM) {
+				/*
+				 * If return err in suspend flow, IO will hang.
+				 * Trigger error handler and break suspend for
+				 * error recovery.
+				 */
+				ufshcd_force_error_recovery(hba);
+				ret = -EBUSY;
+			}
 			if (ret)
 				goto enable_scaling;
 		}
@@ -9060,6 +9076,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 */
 	check_for_bkops = !ufshcd_is_ufs_dev_deepsleep(hba);
 	ret = ufshcd_link_state_transition(hba, req_link_state, check_for_bkops);
+	if (ret && pm_op != UFS_SHUTDOWN_PM) {
+		/*
+		 * If return err in suspend flow, IO will hang.
+		 * Trigger error handler and break suspend for
+		 * error recovery.
+		 */
+		ufshcd_force_error_recovery(hba);
+		ret = -EBUSY;
+	}
 	if (ret)
 		goto set_dev_active;
 
-- 
2.18.0


