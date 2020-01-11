Return-Path: <SRS0=lRAH=3A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AADAC33C9E
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jan 2020 07:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA350206DA
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jan 2020 07:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AMgwly+Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KVTS/lUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA350206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOdSWy2PCq7UsexoIVeds973/PnO9qWdQmIWsWPVrZ8=; b=AMgwly+ZwqgRp5
	ndcCD4owawhh0Vcn+soTYW6uY5Y0Xy8Ln/OaPgO756uNlBwC1Io2gZkglH1sE0YIXGZwXHs+BfYcr
	I8LxVTvb4hfqq6GYY0HHs7o4IHTAFmTMIc+0ihX5B6qSLK3ywNUnHWthfZdWSqOWIPcECf19LIu21
	OvA8TW+2lFi06XJjXlHKG3pUxK1Nm7Ygs5/4+1OONAJugFAlA9OPynpTrj65b7GvZ6BHBJXBLWReQ
	k4glD9hDEFkHBvlJx5FTpHWmsC9qqUsVj4usexlz+MVq3FkGCc5k1NJ4Sk5N/3Z9M6dJyD0XN7+0N
	dzewAnIRyO9x5sDf5VpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqAxE-00048W-Vl; Sat, 11 Jan 2020 07:13:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqAwW-0003Lx-CO; Sat, 11 Jan 2020 07:12:21 +0000
X-UUID: 9be20e77684c45388e26c475cab07da4-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=em9nzz50IukwOwj7HIQQvdNwwvlDjKEtqMCz2bjE7bg=; 
 b=KVTS/lUNGb59sN7zDhciA1+1FB+shxFEy6TZ0L1pMfp8yjagDQu2Xow3tNksuf8OBhg4CojlcTfDqr1kTdKgMmV0MMEvnINIyLtte8vatDKANQRBD2AA00c2iCxh2XAgIZ3aKNBSR26sm5P6Ob0DwT+A+72HLUMXAL5VFAUEvFI=;
X-UUID: 9be20e77684c45388e26c475cab07da4-20200110
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 108038451; Fri, 10 Jan 2020 23:12:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 23:12:53 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 11 Jan 2020 15:10:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 11 Jan 2020 15:12:37 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 1/2] scsi: ufs: pass device information to apply_dev_quirks
Date: Sat, 11 Jan 2020 15:11:46 +0800
Message-ID: <1578726707-6596-2-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1578726707-6596-1-git-send-email-stanley.chu@mediatek.com>
References: <1578726707-6596-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_231220_424847_510DB37A 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Pass UFS device information to vendor-specific variant callback
"apply_dev_quirks" because some platform vendors need to know such
information to apply special handlings or quirks in specific devices.

In the same time, modify existed vendor implementations according to
the new interface for those vendor drivers which will be built-in
or built as a module alone with UFS core driver.

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 3 ++-
 drivers/scsi/ufs/ufshcd.c   | 8 ++++----
 drivers/scsi/ufs/ufshcd.h   | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index c69c29a1ceb9..ebb5c66e069f 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -949,7 +949,8 @@ static int ufs_qcom_quirk_host_pa_saveconfigtime(struct ufs_hba *hba)
 	return err;
 }
 
-static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
+static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba,
+				     struct ufs_dev_desc *card)
 {
 	int err = 0;
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 1b97f2dc0b63..7c85c890594c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6803,7 +6803,8 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
 	return ret;
 }
 
-static void ufshcd_tune_unipro_params(struct ufs_hba *hba)
+static void ufshcd_tune_unipro_params(struct ufs_hba *hba,
+				      struct ufs_dev_desc *card)
 {
 	if (ufshcd_is_unipro_pa_params_tuning_req(hba)) {
 		ufshcd_tune_pa_tactivate(hba);
@@ -6817,7 +6818,7 @@ static void ufshcd_tune_unipro_params(struct ufs_hba *hba)
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE)
 		ufshcd_quirk_tune_host_pa_tactivate(hba);
 
-	ufshcd_vops_apply_dev_quirks(hba);
+	ufshcd_vops_apply_dev_quirks(hba, card);
 }
 
 static void ufshcd_clear_dbg_ufs_stats(struct ufs_hba *hba)
@@ -6980,10 +6981,9 @@ static int ufshcd_probe_hba(struct ufs_hba *hba)
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
index e05cafddc87b..4f3fa71303da 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -320,7 +320,7 @@ struct ufs_hba_variant_ops {
 	void	(*setup_task_mgmt)(struct ufs_hba *, int, u8);
 	void    (*hibern8_notify)(struct ufs_hba *, enum uic_cmd_dme,
 					enum ufs_notify_change_status);
-	int	(*apply_dev_quirks)(struct ufs_hba *);
+	int	(*apply_dev_quirks)(struct ufs_hba *, struct ufs_dev_desc *);
 	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op);
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
@@ -1052,10 +1052,11 @@ static inline void ufshcd_vops_hibern8_notify(struct ufs_hba *hba,
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
