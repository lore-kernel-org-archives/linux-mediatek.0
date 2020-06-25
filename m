Return-Path: <SRS0=1s7f=AG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96C8C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 03:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877D820656
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 03:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YG2oFiLu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YKHlBVfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877D820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kybPzG6FRi8iC9MyO90lt9p5V+mBRz86b6BJOnJsTLU=; b=YG2oFiLua5zaqpal8IPMjB4xw2
	UIJz+TPFRXlxPIx7qX/uprQ3vieJtc5LGOaBU/mt36u6qXpX5K5xXARxl/XEVngWph7Zqpr3YakYN
	gdlLP252Sb+ITodqnof5srB8SEFXxbBdzPaRghxHvNeN7AH8NrR1IYPQjNOfzpPM7agbSEMuZjOKP
	Vc8Q4u0E6VuP0DvYbLEHx9ZJR1/Rs8x9eVLtNzvGTG4j3haERrpuEnYqLEjMqdZe6i4vw3KE+6kku
	ZesJWgSuXBSKyWbbr/ehlEgwGgsiT+HamiJtwqTckB9vcssAaS4DsAbJNd8XJ2j8yIeqxqz/ZJ9A5
	CDOJ5doA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joIBz-00031h-Rx; Thu, 25 Jun 2020 03:04:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joIBs-0002vN-Rn; Thu, 25 Jun 2020 03:04:41 +0000
X-UUID: ec94776e70b94722a6746e917d893acb-20200624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PByjqIQUWUH6SDzkyUSmXg/til5Wci3J64umcljp9G4=; 
 b=YKHlBVfMp282I4YEF+buL4teBNmT4BBeEx+8djAqhhNRlNdxwkRlihkUIl2OsK5So3JnUms1gr5kCiXQ7lDbJPGUgyI9NPuytuZBY8lTSqI5WBn2PCWysD0bGmtnypWF3/mFYwt3gKJlz0etU2lnWLMvl2snHF3mP3llByXsix8=;
X-UUID: ec94776e70b94722a6746e917d893acb-20200624
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 995765185; Wed, 24 Jun 2020 19:04:32 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 20:04:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Jun 2020 11:04:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Jun 2020 11:04:29 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2] scsi: ufs: Disable WriteBooster capability in
 non-supported UFS device
Date: Thu, 25 Jun 2020 11:04:30 +0800
Message-ID: <20200625030430.25048-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
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

Fixes: 3d17b9b5ab11 ("scsi: ufs: Add write booster feature support")
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Tested-by: Steev Klimaszewski <steev@kali.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
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
