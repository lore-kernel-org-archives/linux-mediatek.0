Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F5AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 02:51:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1ABF20874
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 02:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0oxMpWqS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sntOimsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1ABF20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8twOYSja99LC/OFcO3MUB4Yh5dhghspTHZwLoV8Cksw=; b=0oxMpWqSO7SE9AoA9MnZOI3RGy
	dokRutDOXS+1wpcnNviJXMRfvpAXbKNdo07mkBk89PtKZk7FZglU35Ll0751F8Is+/0PXtIUTcjve
	J6OIx2AphJw9nuUEAOnfeii30ds2lSxqy8AtZUUOGuK0ZfWVtJjkrEqydejvDfLoVy71HnLt0XT/W
	TzZMti4h5/HAphe2Jq4Sna06Nc4XvH6CjjN69weOc3lgTj5N/j+wHgAduyWxhNzAQ2HGR5u0YbMpF
	G7/M+twLGoyXYtNiXM429CLX20mPdVRzu3x1OLr1Z4HFdfWcTrQDLGv9J5//A5+tXfJmm5ohakbeq
	ZP3yAYww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnvVl-0002H6-EZ; Wed, 24 Jun 2020 02:51:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnvVf-0002EL-Jn; Wed, 24 Jun 2020 02:51:37 +0000
X-UUID: ae78b57adefc45ff999cc437fe2b0a64-20200623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nmBWhNWVW28atJNu3hD30DB04FycNq3CbGhifj2PNUM=; 
 b=sntOimsZs6Z8MWONa8lblO0kx5VZsgFe/sHozNiR/vvEgqEG8/m8oQCHlu65eVeKDf3mNFG4tQUUbY94IjW0oCLHlyvJnFfXxMh/T62oB0eHgUWeL0YDDPC/Kyu0IfM/wWVrUGfOgwt/x7oVt4iAQOwaP3gz7ZbD7EH7ZCRtOAM=;
X-UUID: ae78b57adefc45ff999cc437fe2b0a64-20200623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 180866949; Tue, 23 Jun 2020 18:51:29 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Jun 2020 19:51:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 10:51:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 24 Jun 2020 10:51:19 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1] scsi: ufs: Disable WriteBooster capability in
 non-supported UFS device
Date: Wed, 24 Jun 2020 10:51:19 +0800
Message-ID: <20200624025119.6509-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7B2E197A1814C3A1321B9BF57C653697187545A33AF642CD635F385EF2542AB02000:8
X-MTK: N
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
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If UFS device is not qualified to enter the detection of WriteBooster
probing by disallowed UFS version or device quirks, then WriteBooster
capability in host shall be disabled to prevent any WriteBooster
operations in the future.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index f173ad1bd79f..c62bd47beeaa 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6847,21 +6847,31 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
 
 static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 {
+	struct ufs_dev_info *dev_info = &hba->dev_info;
 	u8 lun;
 	u32 d_lu_wb_buf_alloc;
 
 	if (!ufshcd_is_wb_allowed(hba))
 		return;
+	/*
+	 * Probe WB only for UFS-2.2 and UFS-3.1 (and later) devices or
+	 * UFS devices with quirk UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES
+	 * enabled
+	 */
+	if (!(dev_info->wspecversion >= 0x310 ||
+	      dev_info->wspecversion == 0x220 ||
+	     (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES)))
+		goto wb_disabled;
 
 	if (hba->desc_size[QUERY_DESC_IDN_DEVICE] <
 	    DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 4)
 		goto wb_disabled;
 
-	hba->dev_info.d_ext_ufs_feature_sup =
+	dev_info->d_ext_ufs_feature_sup =
 		get_unaligned_be32(desc_buf +
 				   DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
 
-	if (!(hba->dev_info.d_ext_ufs_feature_sup & UFS_DEV_WRITE_BOOSTER_SUP))
+	if (!(dev_info->d_ext_ufs_feature_sup & UFS_DEV_WRITE_BOOSTER_SUP))
 		goto wb_disabled;
 
 	/*
@@ -6870,17 +6880,17 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 	 * a max of 1 lun would have wb buffer configured.
 	 * Now only shared buffer mode is supported.
 	 */
-	hba->dev_info.b_wb_buffer_type =
+	dev_info->b_wb_buffer_type =
 		desc_buf[DEVICE_DESC_PARAM_WB_TYPE];
 
-	hba->dev_info.b_presrv_uspc_en =
+	dev_info->b_presrv_uspc_en =
 		desc_buf[DEVICE_DESC_PARAM_WB_PRESRV_USRSPC_EN];
 
-	if (hba->dev_info.b_wb_buffer_type == WB_BUF_MODE_SHARED) {
-		hba->dev_info.d_wb_alloc_units =
+	if (dev_info->b_wb_buffer_type == WB_BUF_MODE_SHARED) {
+		dev_info->d_wb_alloc_units =
 		get_unaligned_be32(desc_buf +
 				   DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS);
-		if (!hba->dev_info.d_wb_alloc_units)
+		if (!dev_info->d_wb_alloc_units)
 			goto wb_disabled;
 	} else {
 		for (lun = 0; lun < UFS_UPIU_MAX_WB_LUN_ID; lun++) {
@@ -6891,7 +6901,7 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 					(u8 *)&d_lu_wb_buf_alloc,
 					sizeof(d_lu_wb_buf_alloc));
 			if (d_lu_wb_buf_alloc) {
-				hba->dev_info.wb_dedicated_lu = lun;
+				dev_info->wb_dedicated_lu = lun;
 				break;
 			}
 		}
@@ -6977,14 +6987,7 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 
 	ufs_fixup_device_setup(hba);
 
-	/*
-	 * Probe WB only for UFS-3.1 devices or UFS devices with quirk
-	 * UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES enabled
-	 */
-	if (dev_info->wspecversion >= 0x310 ||
-	    dev_info->wspecversion == 0x220 ||
-	    (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES))
-		ufshcd_wb_probe(hba, desc_buf);
+	ufshcd_wb_probe(hba, desc_buf);
 
 	/*
 	 * ufshcd_read_string_desc returns size of the string
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
