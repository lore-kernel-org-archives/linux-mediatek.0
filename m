Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2345FC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 16:36:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7CAA2082F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 16:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VMw+dSZD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItwQnqwi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7CAA2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvrE3SesMJ77knbG40iSG0UTV0OpgX6rmSxJeB5jIsI=; b=VMw+dSZDnP2/gz
	yKmm8C6gc57nOE24f8mXHj0BsZSorOTlHadSY/nD96iRbHKVgnTg5pdS8rbcj8u98yc51xrq6z6UN
	vcbyIVHf3t7VRmIzolP0IwUdC1IC9EVl6sGDBsHerdPfK2UwBh55IBYHLrwz/yX5tNYqDQr6odIF1
	wfvHjO3WoYLAKLmCdNJV9l2Rq95GNRJg4E+lhrYRaAQTedLgORJdjotqYiQDC/cslMTtN2Z4SBm4I
	oySZ1zCazm74WIGyFDltShG8cAUOtsAkH/Awzw/39MPHeBsvQc/H2VB+XSN94X1M49eZb9FAoSP2K
	qq3ZGIeR9vwhI4pyw3JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2dwa-0005Jo-2g; Fri, 14 Feb 2020 16:35:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dWL-0008Ns-PL; Fri, 14 Feb 2020 16:08:51 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 349372467E;
 Fri, 14 Feb 2020 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696528;
 bh=q4EdpRHX6qN+pRnRnD2WAQZKAT7OGxsqDKUeGBk3ws0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItwQnqwimK1ImTYAB4urye8Ht8J9JyGGasn1lRe1lOIxM4h5vU8JsuYzseQWuKKtg
 e7jbj0U7iuGTmwxuO82gUIIiIWOcksjPqYnI+yeCNIMJKLg/siy2XOj772IFSr0Jg1
 PaDUjlw9BntwxWO5P+S/b9kP+wr0KN09RC+nfyCM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 327/459] scsi: ufs: pass device information to
 apply_dev_quirks
Date: Fri, 14 Feb 2020 10:59:37 -0500
Message-Id: <20200214160149.11681-327-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_080849_884566_7B1D4EBA 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: Sasha Levin <sashal@kernel.org>, Bart Van Assche <bvanassche@acm.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-arm-msm@vger.kernel.org, Asutosh Das <asutoshd@codeaurora.org>,
 Avri Altman <avri.altman@wdc.com>, Can Guo <cang@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Stanley Chu <stanley.chu@mediatek.com>

[ Upstream commit c40ad6b7fcd35bc4d36db820c7737e1aa18d5d41 ]

Pass UFS device information to vendor-specific variant callback
"apply_dev_quirks" because some platform vendors need to know such
information to apply special handling or quirks in specific devices.

At the same time, modify existing vendor implementations according to the
new interface for those vendor drivers which will be built-in or built as a
module alone with UFS core driver.

[mkp: clarified commit desc]

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Link: https://lore.kernel.org/r/1578726707-6596-2-git-send-email-stanley.chu@mediatek.com
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 3 ++-
 drivers/scsi/ufs/ufshcd.c   | 8 ++++----
 drivers/scsi/ufs/ufshcd.h   | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index a5b71487a2065..411ef60b2c145 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -905,7 +905,8 @@ static int ufs_qcom_quirk_host_pa_saveconfigtime(struct ufs_hba *hba)
 	return err;
 }
 
-static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
+static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba,
+				     struct ufs_dev_desc *card)
 {
 	int err = 0;
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 6b5ec4bbcdb02..d9ea0ae4f374f 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6721,7 +6721,8 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
 	return ret;
 }
 
-static void ufshcd_tune_unipro_params(struct ufs_hba *hba)
+static void ufshcd_tune_unipro_params(struct ufs_hba *hba,
+				      struct ufs_dev_desc *card)
 {
 	if (ufshcd_is_unipro_pa_params_tuning_req(hba)) {
 		ufshcd_tune_pa_tactivate(hba);
@@ -6735,7 +6736,7 @@ static void ufshcd_tune_unipro_params(struct ufs_hba *hba)
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE)
 		ufshcd_quirk_tune_host_pa_tactivate(hba);
 
-	ufshcd_vops_apply_dev_quirks(hba);
+	ufshcd_vops_apply_dev_quirks(hba, card);
 }
 
 static void ufshcd_clear_dbg_ufs_stats(struct ufs_hba *hba)
@@ -6898,10 +6899,9 @@ static int ufshcd_probe_hba(struct ufs_hba *hba)
 	}
 
 	ufs_fixup_device_setup(hba, &card);
+	ufshcd_tune_unipro_params(hba, &card);
 	ufs_put_device_desc(&card);
 
-	ufshcd_tune_unipro_params(hba);
-
 	/* UFS device is also active now */
 	ufshcd_set_ufs_dev_active(hba);
 	ufshcd_force_reset_auto_bkops(hba);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 089013b758a19..5260e594e0b95 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -322,7 +322,7 @@ struct ufs_hba_variant_ops {
 	void	(*setup_task_mgmt)(struct ufs_hba *, int, u8);
 	void    (*hibern8_notify)(struct ufs_hba *, enum uic_cmd_dme,
 					enum ufs_notify_change_status);
-	int	(*apply_dev_quirks)(struct ufs_hba *);
+	int	(*apply_dev_quirks)(struct ufs_hba *, struct ufs_dev_desc *);
 	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op);
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
@@ -1047,10 +1047,11 @@ static inline void ufshcd_vops_hibern8_notify(struct ufs_hba *hba,
 		return hba->vops->hibern8_notify(hba, cmd, status);
 }
 
-static inline int ufshcd_vops_apply_dev_quirks(struct ufs_hba *hba)
+static inline int ufshcd_vops_apply_dev_quirks(struct ufs_hba *hba,
+					       struct ufs_dev_desc *card)
 {
 	if (hba->vops && hba->vops->apply_dev_quirks)
-		return hba->vops->apply_dev_quirks(hba);
+		return hba->vops->apply_dev_quirks(hba, card);
 	return 0;
 }
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
