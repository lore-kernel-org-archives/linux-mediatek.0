Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1E3C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 15:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73BD9205CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 15:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeeFx5RQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c31NXb2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73BD9205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myvmztylGPj7qQ5MCyt3aex0mbhHNJrfZJtRF1SFi5o=; b=MeeFx5RQ+xJswp
	SuODwU86VFejEmAGcGPgkWBstf4Y+plt0gN+w+/tLEl6LjxeCSYue1kISaQCZlyE9Jvq4dB9XAb1l
	jbqr+3O+urqk+Tg0/juThRrf/LzpJtJLQLw9jgzMHiHHTbFIXjxhZ28hwFMc0KFCO5fi/ajJtjkAY
	9XAwz+RkL83AmUDzS60E5VW6vYgngAlpng/nr9rnO0B3KC9P2XC+63llwp2sA5Vbm1zj575UUkdMw
	lEnDgD/uLwDSXq2f0dO9pKPEL7xjAOTph2r9QcTLiiNYCIxqq4dvJ27hA/aXfMDd3tTjSGBV89msV
	1ZnFnApD75p/dV4VQAVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZFWS-0007iN-Nv; Thu, 14 May 2020 15:11:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZFWE-0007a7-V3; Thu, 14 May 2020 15:11:37 +0000
X-UUID: 0daa59a8d66145c78efbd4e6139d6186-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bo0m4IuwC/3AaIjNIjRmx35SXEKkw+0nqdXJxel0Jmo=; 
 b=c31NXb2f/PPtqpSXR00lY03bttsAoNXWidgf+gq1tpejAmuGociOJhwngPfG4w8aFZ9nACraDQpLc0TJjEyrtVaeR9mxngqmAl/P1FGKt7LOqgCUGWeQoNfB65ugrykp6xM+XN2K/XDfZNsBcU6HgVNRFYe3FUA4uMq6gRhpCac=;
X-UUID: 0daa59a8d66145c78efbd4e6139d6186-20200514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 569562355; Thu, 14 May 2020 07:11:29 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 08:01:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 23:01:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 May 2020 23:01:21 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v2 4/4] scsi: ufs: Fix WriteBooster flush during runtime
 suspend
Date: Thu, 14 May 2020 23:01:22 +0800
Message-ID: <20200514150122.32110-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514150122.32110-1-stanley.chu@mediatek.com>
References: <20200514150122.32110-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_081131_004971_C20D2B02 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently UFS host driver promises VCC supply if UFS device
needs to do WriteBooster flush during runtime suspend.

However the UFS specification mentions,

"While the flushing operation is in progress, the device is
in Active power mode."

Therefore UFS host driver needs to promise more: Keep UFS
device as "Active power mode", otherwise UFS device shall not
do any flush if device enters Sleep or PowerDown power mode.

Fix this by not changing device power mode if WriteBooster
flush is required in ufshcd_suspend().

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs.h    |  1 -
 drivers/scsi/ufs/ufshcd.c | 42 ++++++++++++++++++++-------------------
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
index b3135344ab3f..9e4bc2e97ada 100644
--- a/drivers/scsi/ufs/ufs.h
+++ b/drivers/scsi/ufs/ufs.h
@@ -577,7 +577,6 @@ struct ufs_dev_info {
 	u32 d_ext_ufs_feature_sup;
 	u8 b_wb_buffer_type;
 	u32 d_wb_alloc_units;
-	bool keep_vcc_on;
 	u8 b_presrv_uspc_en;
 };
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 169a3379e468..b9f7744ca2b4 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8101,8 +8101,7 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 	    !hba->dev_info.is_lu_power_on_wp) {
 		ufshcd_setup_vreg(hba, false);
 	} else if (!ufshcd_is_ufs_dev_active(hba)) {
-		if (!hba->dev_info.keep_vcc_on)
-			ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
+		ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
 		if (!ufshcd_is_link_active(hba)) {
 			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
 			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
@@ -8172,6 +8171,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	enum ufs_pm_level pm_lvl;
 	enum ufs_dev_pwr_mode req_dev_pwr_mode;
 	enum uic_link_state req_link_state;
+	bool keep_curr_dev_pwr_mode = false;
 
 	hba->pm_op_in_progress = 1;
 	if (!ufshcd_is_shutdown_pm(pm_op)) {
@@ -8227,27 +8227,29 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 			ufshcd_disable_auto_bkops(hba);
 		}
 		/*
-		 * With wb enabled, if the bkops is enabled or if the
-		 * configured WB type is 70% full, keep vcc ON
-		 * for the device to flush the wb buffer
+		 * If device needs to do BKOP or WB buffer flush during
+		 * Hibern8, keep device power mode as "active power mode"
+		 * and VCC supply.
 		 */
-		if ((hba->auto_bkops_enabled && ufshcd_is_wb_allowed(hba)) ||
-		    ufshcd_wb_keep_vcc_on(hba))
-			hba->dev_info.keep_vcc_on = true;
-		else
-			hba->dev_info.keep_vcc_on = false;
-	} else {
-		hba->dev_info.keep_vcc_on = false;
+		keep_curr_dev_pwr_mode = hba->auto_bkops_enabled ||
+			(((req_link_state == UIC_LINK_HIBERN8_STATE) ||
+			((req_link_state == UIC_LINK_ACTIVE_STATE) &&
+			ufshcd_is_auto_hibern8_enabled(hba))) &&
+			ufshcd_wb_keep_vcc_on(hba));
 	}
 
-	if ((req_dev_pwr_mode != hba->curr_dev_pwr_mode) &&
-	    ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
-	    !ufshcd_is_runtime_pm(pm_op))) {
-		/* ensure that bkops is disabled */
-		ufshcd_disable_auto_bkops(hba);
-		ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
-		if (ret)
-			goto enable_gating;
+	if (req_dev_pwr_mode != hba->curr_dev_pwr_mode) {
+		if ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
+		    !ufshcd_is_runtime_pm(pm_op)) {
+			/* ensure that bkops is disabled */
+			ufshcd_disable_auto_bkops(hba);
+		}
+
+		if (!keep_curr_dev_pwr_mode) {
+			ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
+			if (ret)
+				goto enable_gating;
+		}
 	}
 
 	flush_work(&hba->eeh_work);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
