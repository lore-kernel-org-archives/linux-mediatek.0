Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0815AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OjZLXYmkStH9EABwbJjLU6KYW4sA6HNHYj8sP4pBtR8=; b=39y2i5DCgOZ4iakCLwykGFI2vZ
	3SoOSXzObZkb3YPEoPMd92YEeulolxV7m+XUPIBuB3wV1ONGYc1bWA9vMa3MFsQObu1JCs6ZlCBGg
	ybJhphR0YQsNnjcsop6g/Mg4gv9pivGuj0/1FmhDubTxTA/R1IzQxRNv9kX8jPHo535tx5hvKlA9k
	wZ25dG5guIGtgEk3LQu2N5xrLfDuY319ITMJhcEtuEjDSdZMaN8pHwUMHeZEygzCdRhOtAm4l7bLX
	PU+j75SogjgpiJ+ss5JRVpv4ZdobPgg1W0qJKvgKyCxQ/e9w18V6HtiioxDCESwfxlhuKAZJLp0x+
	o04rZZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3BS0-0074MH-0P; Thu, 08 Dec 2022 07:36:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3BRr-00747d-7y
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 07:36:05 +0000
X-UUID: 06bfd208b1f4435eb199c98a07354ffc-20221208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OjZLXYmkStH9EABwbJjLU6KYW4sA6HNHYj8sP4pBtR8=;
	b=pM22wGBXCl/B+1VnxzIJBaJcDhOB4QKrKNJ/wOXT3CFSuCyoMB9jxP9w+ldXCUo7Wj+xS4UdPR+OmEDsUssZskwNft9mJAv2+qm64S88mmmc1gHgEi2KWeVH7csjo06C+IuSE/PAWx8aUnuo+JBmAduO6DokknhhqsibRwCzF/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fdac923d-8451-43d9-a039-3149bae3913b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:dac100d2-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 06bfd208b1f4435eb199c98a07354ffc-20221208
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1455084375; Thu, 08 Dec 2022 00:35:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Dec 2022 15:25:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Dec 2022 15:25:22 +0800
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
Subject: [PATCH v6] ufs: core: wlun suspend SSU/enter hibern8 fail recovery
Date: Thu, 8 Dec 2022 15:25:20 +0800
Message-ID: <20221208072520.26210-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_233603_777843_68438FCB 
X-CRM114-Status: UNSURE (   9.03  )
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
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/ufs/core/ufshcd.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index b1f59a5fe632..31ed3fdb5266 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6070,6 +6070,14 @@ void ufshcd_schedule_eh_work(struct ufs_hba *hba)
 	}
 }
 
+static void ufshcd_force_error_recovery(struct ufs_hba *hba) 
+{
+	spin_lock_irq(hba->host->host_lock);
+	hba->force_reset = true;
+	ufshcd_schedule_eh_work(hba);
+	spin_unlock_irq(hba->host->host_lock);
+}
+
 static void ufshcd_clk_scaling_allow(struct ufs_hba *hba, bool allow)
 {
 	down_write(&hba->clk_scaling_lock);
@@ -9049,6 +9057,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
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
@@ -9060,6 +9077,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
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


