Return-Path: <SRS0=uE9q=7M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905F0C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 15:14:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EFD2075A
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 15:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aXxv01Wf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Za6SzSBV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EFD2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ik/v5F3dyHz+XClK/TSg4Lfgg9wO2c+NVRKhUwGxzg=; b=aXxv01WfBoQktG
	MNipBZbZE6zqVVI8EgQfleHw3WY/1MXszpr/o3V70lHg0fQHSY9nX8eHqdPRUCDAX85IbenlIzxv6
	dGoF5S1ryNI8Q9A4zuWDbd6suc72/sQrSwX9wZkXEKWcxoMiMz7PMaaV2NVcQGj32Ph9KHAUChlTp
	TknE4Y5QNwmkMkow1zT+kBx7i6b5q+HUYIu5VjcByRkxN5WSA2Y7GIRhXsM4qiz8AEiHCmcgB4ELn
	gH6n/abJHlnr06fuKgCI6uy38fUYykuGIZqy54AtiIwLHXnRHW2IbH3RaW/Ennp26KeLjAKBNLWqI
	wZUQ8LmIr9BP9OaQAWMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jf3BR-0004xW-GE; Sat, 30 May 2020 15:14:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jf3BE-0004kq-Ha; Sat, 30 May 2020 15:13:50 +0000
X-UUID: a662cf3fce384159869f0fab3e3ce0c3-20200530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zs+0w6nLPCOoHeMZRQqu4tfYpdiCBTOiMbmuhn2fSSA=; 
 b=Za6SzSBVD07QQQKOooZ9IGD/6meVbqGw+Jkiyb3Fd5LsMazvqtiYCHGZ9safLXcV42dZR8ADnMigVDj0RgnKCiuDYgbsVHxJige64Rei9ds1NGmRTXyqsGVgBEMHZu2HlBinVuPsDkhlAFqC6B3VRYW9VEsTSB/1D6xu2uhzQnA=;
X-UUID: a662cf3fce384159869f0fab3e3ce0c3-20200530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 651918584; Sat, 30 May 2020 07:13:10 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 08:13:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 23:13:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 30 May 2020 23:13:36 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 1/2] scsi: ufs: Support WriteBooster on Samsung UFS devices
Date: Sat, 30 May 2020 23:13:36 +0800
Message-ID: <20200530151337.6182-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200530151337.6182-1-stanley.chu@mediatek.com>
References: <20200530151337.6182-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_081348_593075_ABC6A5B0 
X-CRM114-Status: GOOD (  14.32  )
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

Samsung UFS devices are widely used in the market, however these
devices need some special handling to support WriteBooster.

The major part is that Samsung UFS devices need to use specific
"selector" value for WriteBooster related query operations. Therefore,
introduce a device quirk to handle the special requirement and then
WriteBooster can be enabled on these devices.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-sysfs.c  | 12 ----------
 drivers/scsi/ufs/ufs.h        |  1 +
 drivers/scsi/ufs/ufs_quirks.h |  7 ++++++
 drivers/scsi/ufs/ufshcd.c     | 43 ++++++++++++++++++++++++++++++++++-
 drivers/scsi/ufs/ufshcd.h     | 20 ++++++++++++++++
 5 files changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index 2d71d232a69d..fa5fdfcd2611 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
@@ -622,12 +622,6 @@ static const struct attribute_group ufs_sysfs_string_descriptors_group = {
 	.attrs = ufs_sysfs_string_descriptors,
 };
 
-static inline bool ufshcd_is_wb_flags(enum flag_idn idn)
-{
-	return ((idn >= QUERY_FLAG_IDN_WB_EN) &&
-		(idn <= QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8));
-}
-
 #define UFS_FLAG(_name, _uname)						\
 static ssize_t _name##_show(struct device *dev,				\
 	struct device_attribute *attr, char *buf)			\
@@ -680,12 +674,6 @@ static const struct attribute_group ufs_sysfs_flags_group = {
 	.attrs = ufs_sysfs_device_flags,
 };
 
-static inline bool ufshcd_is_wb_attrs(enum attr_idn idn)
-{
-	return ((idn >= QUERY_ATTR_IDN_WB_FLUSH_STATUS) &&
-		(idn <= QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE));
-}
-
 #define UFS_ATTRIBUTE(_name, _uname)					\
 static ssize_t _name##_show(struct device *dev,				\
 	struct device_attribute *attr, char *buf)			\
diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
index c70845d41449..88ec87e2811c 100644
--- a/drivers/scsi/ufs/ufs.h
+++ b/drivers/scsi/ufs/ufs.h
@@ -61,6 +61,7 @@
  * This means max. LUN number reported from UFS device could be 0xC17F.
  */
 #define UFS_UPIU_MAX_UNIT_NUM_ID	0x7F
+#define UFS_UPIU_RPMB_QUERY_INDEX	0xC4
 #define UFS_MAX_LUNS		(SCSI_W_LUN_BASE + UFS_UPIU_MAX_UNIT_NUM_ID)
 #define UFS_UPIU_WLUN_ID	(1 << 7)
 
diff --git a/drivers/scsi/ufs/ufs_quirks.h b/drivers/scsi/ufs/ufs_quirks.h
index e3175a63c676..f9ed868cf330 100644
--- a/drivers/scsi/ufs/ufs_quirks.h
+++ b/drivers/scsi/ufs/ufs_quirks.h
@@ -108,4 +108,11 @@ struct ufs_dev_fix {
  */
 #define UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES (1 << 10)
 
+/*
+ * Some UFS devices need to use special selector to operate WriteBooster
+ * related flags and attributes. Enable this quirk to make these devices
+ * work normally.
+ */
+#define UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR (1 << 11)
+
 #endif /* UFS_QUIRKS_H_ */
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index f11be69e50e9..5e38c471877c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2801,11 +2801,17 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
 {
 	struct ufs_query_req *request = NULL;
 	struct ufs_query_res *response = NULL;
-	int err, selector = 0;
+	int err;
 	int timeout = QUERY_REQ_TIMEOUT;
+	u8 selector = 0;
 
 	BUG_ON(!hba);
 
+	if (hba->dev_quirks & UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR) {
+		if (ufshcd_is_wb_flags(idn))
+			selector = 1;
+	}
+
 	ufshcd_hold(hba, false);
 	mutex_lock(&hba->dev_cmd.lock);
 	ufshcd_init_query(hba, &request, &response, opcode, idn, index,
@@ -2882,6 +2888,11 @@ int ufshcd_query_attr(struct ufs_hba *hba, enum query_opcode opcode,
 		goto out;
 	}
 
+	if (hba->dev_quirks & UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR) {
+		if (ufshcd_is_wb_attrs(idn))
+			selector = 1;
+	}
+
 	mutex_lock(&hba->dev_cmd.lock);
 	ufshcd_init_query(hba, &request, &response, opcode, idn, index,
 			selector);
@@ -3042,6 +3053,11 @@ int ufshcd_query_descriptor_retry(struct ufs_hba *hba,
 	int err;
 	int retries;
 
+	if (hba->dev_quirks & UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR) {
+		if (ufshcd_is_wb_desc(idn, index))
+			selector = 1;
+	}
+
 	for (retries = QUERY_REQ_RETRIES; retries > 0; retries--) {
 		err = __ufshcd_query_descriptor(hba, opcode, idn, index,
 						selector, desc_buf, buf_len);
@@ -6907,8 +6923,10 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 	size_t buff_len;
 	u8 model_index;
 	u8 *desc_buf;
+	u8 retry_cnt = 0;
 	struct ufs_dev_info *dev_info = &hba->dev_info;
 
+retry:
 	buff_len = max_t(size_t, hba->desc_size.dev_desc,
 			 QUERY_DESC_MAX_SIZE + 1);
 	desc_buf = kmalloc(buff_len, GFP_KERNEL);
@@ -6948,6 +6966,29 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 
 	ufs_fixup_device_setup(hba);
 
+	if (!retry_cnt && (hba->dev_quirks &
+		UFS_DEVICE_QUIRK_WB_SPECIAL_SELECTOR)) {
+		/*
+		 * Update WriteBooster related descriptor length with specific
+		 * seletor used.
+		 */
+		ufshcd_read_desc_length(hba, QUERY_DESC_IDN_DEVICE, 0,
+					&hba->desc_size.dev_desc);
+		ufshcd_read_desc_length(hba, QUERY_DESC_IDN_CONFIGURATION, 0,
+					&hba->desc_size.conf_desc);
+		ufshcd_read_desc_length(hba, QUERY_DESC_IDN_UNIT, 0,
+					&hba->desc_size.unit_desc);
+		ufshcd_read_desc_length(hba, QUERY_DESC_IDN_GEOMETRY, 0,
+					&hba->desc_size.geom_desc);
+		/*
+		 * Read device descriptor again with specific selector used to
+		 * get WriteBooster related fileds.
+		 */
+		kfree(desc_buf);
+		retry_cnt++;
+		goto retry;
+	}
+
 	/*
 	 * Probe WB only for UFS-3.1 devices or UFS devices with quirk
 	 * UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES enabled
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index bf97d616e597..d850c47e8ae0 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -876,6 +876,26 @@ static inline u8 ufshcd_wb_get_query_index(struct ufs_hba *hba)
 	return 0;
 }
 
+static inline bool ufshcd_is_wb_attrs(enum attr_idn idn)
+{
+	return ((idn >= QUERY_ATTR_IDN_WB_FLUSH_STATUS) &&
+		(idn <= QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE));
+}
+
+static inline bool ufshcd_is_wb_desc(enum desc_idn idn, u8 index)
+{
+	return (idn <= QUERY_DESC_IDN_CONFIGURATION) ||
+		((idn == QUERY_DESC_IDN_UNIT) &&
+		(index != UFS_UPIU_RPMB_QUERY_INDEX)) ||
+		(idn == QUERY_DESC_IDN_GEOMETRY);
+}
+
+static inline bool ufshcd_is_wb_flags(enum flag_idn idn)
+{
+	return ((idn >= QUERY_FLAG_IDN_WB_EN) &&
+		(idn <= QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8));
+}
+
 extern int ufshcd_runtime_suspend(struct ufs_hba *hba);
 extern int ufshcd_runtime_resume(struct ufs_hba *hba);
 extern int ufshcd_runtime_idle(struct ufs_hba *hba);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
