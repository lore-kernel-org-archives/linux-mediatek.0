Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9F0C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 592BC207DD
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dDOywwKO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ttwi7d5U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 592BC207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1R+9fM0Dqt5EVPqbThIGW2G/0s/6PZvoveilA0gWzDA=; b=dDOywwKOked8mL
	xE++eoTZKtjQNbCnzcMy/NNDpl423ymFgs1SnrMFvm3pf91kp/JyxI/v8a4T/2C04h124telomC2F
	gRYPzdC2Qjx/TeqcpeVCEl6V2PIFSfyCxJ6Z7nlzWfxOf2MXNu/LopWlfk0DLxGmeJV6AcgZnfKtA
	zz2123n+uGtw9iyhAS7Q3tTu1aQHsdLUXZZQdtAFXX0tJkIH2WiOWl8vTd0lhWTX3swKme2vT1bMh
	neegyNOWfwwbaTbh9laM6KJkdwae3TWXMYusmcYlOYT6KLtwpHFM7jEj4mUitXXRj8bxRDhGcTr+2
	NmiPnNVmgxN5VVrWmWaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWxz9-0001w3-VY; Fri, 08 May 2020 08:03:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWxx1-0008Gj-L1; Fri, 08 May 2020 08:01:45 +0000
X-UUID: f440bed39640485fac3853a988786bb7-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8Pd0uRm3lQlcsdVh37MBSFoVODy8VZ4HotBEwpmWmFM=; 
 b=ttwi7d5UOZTxiIsl740EkPKyZqFT+LcOCNVG9z4P2n61XX6AouCkCpMkfeRpaE8RNfpgrilXPxhQiZnX7bwo7gbbqMizpd0cLx02TpvWDzbsjlXm8rygY7VsLvGoENl0BtRCp4mg5vUw0Iv0OfI1aPFPkQJDYNjxwTTCE/ec63w=;
X-UUID: f440bed39640485fac3853a988786bb7-20200508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 936209547; Fri, 08 May 2020 00:01:28 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 01:01:30 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 16:01:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 May 2020 16:01:18 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v8 1/8] scsi: ufs: enable WriteBooster on some pre-3.1 UFS
 devices
Date: Fri, 8 May 2020 16:01:08 +0800
Message-ID: <20200508080115.24233-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200508080115.24233-1-stanley.chu@mediatek.com>
References: <20200508080115.24233-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E559295C58213B0A7FFFE37A9503FC4EA8DE076ABA9840E6C6460C9D51F303C92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_010143_804462_A25040F1 
X-CRM114-Status: GOOD (  14.88  )
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

WriteBooster feature can be supported by some pre-3.1 UFS devices
by upgrading firmware.

To enable WriteBooster feature in such devices, introduce a device
quirk to relax the entrance condition of ufshcd_wb_probe() to allow
host driver to check those devices' WriteBooster capability.

WriteBooster feature can be available if below all conditions are
satisfied,

1. Host enables WriteBooster capability
2. UFS 3.1 device or UFS pre-3.1 device with quirk
   UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES enabled
3. The device descriptor shall have
   DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP field
4. WriteBooster support is specified in above field

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufs_quirks.h |  7 ++++
 drivers/scsi/ufs/ufshcd.c     | 67 ++++++++++++++++++++++-------------
 2 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/scsi/ufs/ufs_quirks.h b/drivers/scsi/ufs/ufs_quirks.h
index df7a1e6805a3..e3175a63c676 100644
--- a/drivers/scsi/ufs/ufs_quirks.h
+++ b/drivers/scsi/ufs/ufs_quirks.h
@@ -101,4 +101,11 @@ struct ufs_dev_fix {
  */
 #define UFS_DEVICE_QUIRK_HOST_VS_DEBUGSAVECONFIGTIME	(1 << 9)
 
+/*
+ * Some pre-3.1 UFS devices can support extended features by upgrading
+ * the firmware. Enable this quirk to make UFS core driver probe and enable
+ * supported features on such devices.
+ */
+#define UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES (1 << 10)
+
 #endif /* UFS_QUIRKS_H_ */
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 915e963398c4..a802c5f5ec7c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6800,9 +6800,19 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
 
 static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 {
+	if (!ufshcd_is_wb_allowed(hba))
+		return;
+
+	if (hba->desc_size.dev_desc < DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 4)
+		goto wb_disabled;
+
 	hba->dev_info.d_ext_ufs_feature_sup =
 		get_unaligned_be32(desc_buf +
 				   DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
+
+	if (!(hba->dev_info.d_ext_ufs_feature_sup & UFS_DEV_WRITE_BOOSTER_SUP))
+		goto wb_disabled;
+
 	/*
 	 * WB may be supported but not configured while provisioning.
 	 * The spec says, in dedicated wb buffer mode,
@@ -6818,11 +6828,29 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 	hba->dev_info.b_presrv_uspc_en =
 		desc_buf[DEVICE_DESC_PARAM_WB_PRESRV_USRSPC_EN];
 
-	if (!((hba->dev_info.d_ext_ufs_feature_sup &
-		 UFS_DEV_WRITE_BOOSTER_SUP) &&
-		hba->dev_info.b_wb_buffer_type &&
+	if (!(hba->dev_info.b_wb_buffer_type &&
 	      hba->dev_info.d_wb_alloc_units))
-		hba->caps &= ~UFSHCD_CAP_WB_EN;
+		goto wb_disabled;
+
+	return;
+
+wb_disabled:
+	hba->caps &= ~UFSHCD_CAP_WB_EN;
+}
+
+static void ufs_fixup_device_setup(struct ufs_hba *hba)
+{
+	struct ufs_dev_fix *f;
+	struct ufs_dev_info *dev_info = &hba->dev_info;
+
+	for (f = ufs_fixups; f->quirk; f++) {
+		if ((f->wmanufacturerid == dev_info->wmanufacturerid ||
+		     f->wmanufacturerid == UFS_ANY_VENDOR) &&
+		     ((dev_info->model &&
+		       STR_PRFX_EQUAL(f->model, dev_info->model)) ||
+		      !strcmp(f->model, UFS_ANY_MODEL)))
+			hba->dev_quirks |= f->quirk;
+	}
 }
 
 static int ufs_get_device_desc(struct ufs_hba *hba)
@@ -6862,10 +6890,6 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 
 	model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
 
-	/* Enable WB only for UFS-3.1 */
-	if (dev_info->wspecversion >= 0x310)
-		ufshcd_wb_probe(hba, desc_buf);
-
 	err = ufshcd_read_string_desc(hba, model_index,
 				      &dev_info->model, SD_ASCII_STD);
 	if (err < 0) {
@@ -6874,6 +6898,16 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 		goto out;
 	}
 
+	ufs_fixup_device_setup(hba);
+
+	/*
+	 * Probe WB only for UFS-3.1 devices or UFS devices with quirk
+	 * UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES enabled
+	 */
+	if (dev_info->wspecversion >= 0x310 ||
+	    (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES))
+		ufshcd_wb_probe(hba, desc_buf);
+
 	/*
 	 * ufshcd_read_string_desc returns size of the string
 	 * reset the error value
@@ -6893,21 +6927,6 @@ static void ufs_put_device_desc(struct ufs_hba *hba)
 	dev_info->model = NULL;
 }
 
-static void ufs_fixup_device_setup(struct ufs_hba *hba)
-{
-	struct ufs_dev_fix *f;
-	struct ufs_dev_info *dev_info = &hba->dev_info;
-
-	for (f = ufs_fixups; f->quirk; f++) {
-		if ((f->wmanufacturerid == dev_info->wmanufacturerid ||
-		     f->wmanufacturerid == UFS_ANY_VENDOR) &&
-		     ((dev_info->model &&
-		       STR_PRFX_EQUAL(f->model, dev_info->model)) ||
-		      !strcmp(f->model, UFS_ANY_MODEL)))
-			hba->dev_quirks |= f->quirk;
-	}
-}
-
 /**
  * ufshcd_tune_pa_tactivate - Tunes PA_TActivate of local UniPro
  * @hba: per-adapter instance
@@ -7244,8 +7263,6 @@ static int ufshcd_device_params_init(struct ufs_hba *hba)
 
 	ufshcd_get_ref_clk_gating_wait(hba);
 
-	ufs_fixup_device_setup(hba);
-
 	if (!ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_READ_FLAG,
 			QUERY_FLAG_IDN_PWR_ON_WPE, &flag))
 		hba->dev_info.f_power_on_wp_en = flag;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
