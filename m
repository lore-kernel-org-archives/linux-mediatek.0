Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7947FC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 13:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DFA023A53
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DFA023A53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QhjpOpTbIxAxUtmjogOjDfDMc2Ie2KBQwkStmX6ECBA=; b=RHStM8lrr1ZdSUU+06J1bUeVM
	agfcoTPNBcgokvsernFxn6z8ZrRfYxuTla82gOdQ+GYJdoHVi9zFfCi7d2m7MbIBbnfhn6GCPNzkG
	wxp92JdK30Kinkofq/tujyqYyth5i9Zr53NNW4LHamIvglmUFhb6Pai+C6qTL09GSdCXo4YYvsGLt
	iTKsgURtSDrC8O3zp25ZCwcBGJl/oGV4zanaK7w9+LWitNC+3YDKf/XgG3BiZ0ai9wR/R4w/myKXN
	Fg2tbifKVWSXmPeqk+P0K07Ogkqu/hCcHAeVB16ZlXScvA5elDw8oO92xjuZiLkukdG6+1fMEMekt
	wCN9Sp0Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmdU8-0000kF-Th; Tue, 08 Dec 2020 13:56:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdU1-0000gf-8c; Tue, 08 Dec 2020 13:56:51 +0000
X-UUID: 8db0898cfe1546d9832a60b44fb20b7b-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EL/dTh3+MV76YrpZ0hQlMNZ9TinMZvRKCQSB7x5kuh4=; 
 b=VTO54mfTv9MgIsZcerzmQyu3U+dRBet8fsRoHWLp5jr95CvJ3dUrhWrNS75RXXBpbH1ujXrSN2nRgJfD0xAobmdaLpmFzAN1jtUBvrbs7qKtYAftMpwBj/gr1Po1uUaCe4l3ku+8E96yu3ewqsvHbLmxJ0dre7nmfE2bqCdkYVo=;
X-UUID: 8db0898cfe1546d9832a60b44fb20b7b-20201208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 586411431; Tue, 08 Dec 2020 05:56:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 05:56:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 21:56:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Dec 2020 21:56:34 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 2/2] scsi: ufs: Uninline ufshcd_vops_device_reset function
Date: Tue, 8 Dec 2020 21:56:35 +0800
Message-ID: <20201208135635.15326-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201208135635.15326-1-stanley.chu@mediatek.com>
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 101DC9A9E8D7F51DCEBAB7D3E09A549AADA7E869E7FE7D2790AA99B6101A000D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_085649_555705_B00123F9 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: bjorn.andersson@linaro.org, Stanley Chu <stanley.chu@mediatek.com>,
 alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, nguyenb@codeaurora.org, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since more and more statements showing up in ufshcd_vops_device_reset(),
uninline it to allow compiler making possibly better optimization.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 27 ++++++++++++++++++++++-----
 drivers/scsi/ufs/ufshcd.h | 19 +++++--------------
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index c1c401b2b69d..b2ca1a6ad426 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -580,6 +580,23 @@ static void ufshcd_print_pwr_info(struct ufs_hba *hba)
 		 hba->pwr_info.hs_rate);
 }
 
+static void ufshcd_device_reset(struct ufs_hba *hba)
+{
+	int err;
+
+	err = ufshcd_vops_device_reset(hba);
+
+	if (!err) {
+		ufshcd_set_ufs_dev_active(hba);
+		if (ufshcd_is_wb_allowed(hba)) {
+			hba->wb_enabled = false;
+			hba->wb_buf_flush_enabled = false;
+		}
+	}
+	if (err != -EOPNOTSUPP)
+		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
+}
+
 void ufshcd_delay_us(unsigned long us, unsigned long tolerance)
 {
 	if (!us)
@@ -3932,7 +3949,7 @@ int ufshcd_link_recovery(struct ufs_hba *hba)
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
 	/* Reset the attached device */
-	ufshcd_vops_device_reset(hba);
+	ufshcd_device_reset(hba);
 
 	ret = ufshcd_host_reset_and_restore(hba);
 
@@ -6933,7 +6950,7 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
 
 	do {
 		/* Reset the attached device */
-		ufshcd_vops_device_reset(hba);
+		ufshcd_device_reset(hba);
 
 		err = ufshcd_host_reset_and_restore(hba);
 	} while (err && --retries);
@@ -8712,7 +8729,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 * further below.
 	 */
 	if (ufshcd_is_ufs_dev_deepsleep(hba)) {
-		ufshcd_vops_device_reset(hba);
+		ufshcd_device_reset(hba);
 		WARN_ON(!ufshcd_is_link_off(hba));
 	}
 	if (ufshcd_is_link_hibern8(hba) && !ufshcd_uic_hibern8_exit(hba))
@@ -8722,7 +8739,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 set_dev_active:
 	/* Can also get here needing to exit DeepSleep */
 	if (ufshcd_is_ufs_dev_deepsleep(hba)) {
-		ufshcd_vops_device_reset(hba);
+		ufshcd_device_reset(hba);
 		ufshcd_host_reset_and_restore(hba);
 	}
 	if (!ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE))
@@ -9321,7 +9338,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	}
 
 	/* Reset the attached device */
-	ufshcd_vops_device_reset(hba);
+	ufshcd_device_reset(hba);
 
 	ufshcd_init_crypto(hba);
 
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 36d367eb8139..9bb5f0ed4124 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -1216,21 +1216,12 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 		hba->vops->dbg_register_dump(hba);
 }
 
-static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
+static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
 {
-	if (hba->vops && hba->vops->device_reset) {
-		int err = hba->vops->device_reset(hba);
-
-		if (!err) {
-			ufshcd_set_ufs_dev_active(hba);
-			if (ufshcd_is_wb_allowed(hba)) {
-				hba->wb_enabled = false;
-				hba->wb_buf_flush_enabled = false;
-			}
-		}
-		if (err != -EOPNOTSUPP)
-			ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
-	}
+	if (hba->vops && hba->vops->device_reset)
+		return hba->vops->device_reset(hba);
+
+	return -EOPNOTSUPP;
 }
 
 static inline void ufshcd_vops_config_scaling_param(struct ufs_hba *hba,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
