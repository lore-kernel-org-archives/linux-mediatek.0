Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D3DC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 17:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848B9206D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 17:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PkXUnrQS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IjfGKUQX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848B9206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyoA6xyWUCGpzsLFaIH+y009QG1U7iJ2savyFyS9d90=; b=PkXUnrQS5lW9gz
	gQvLgDdvxbEAwGNpUlAYZrS7EY9rJ7d6nfoYG41i40luh5/JxbVBD3RExeyJhqaVobB4QdCRczXZC
	ICWXqb9S+G/9wHriwBhcKWOG5WFJpoSRNpDIAx0TQfvN3eQcpSgarXqqM7+lo31rAGQXltCHLRilt
	tvLw7l1iQWoCmJF0ahtE3j3XpWOabxcoHU+lzJUE8iI9OMSG/I8crWJE5r6ww7n67bz/E26kJFokW
	xC5r+y9JLm3V4zWHUKgqw8DZl7yDyBbfDrdRap97XPdm8oyDLS7XHY0Yl2SNdAlqpWpZsq8KAJi3e
	mLITBZTgTBNn74p9Nbbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ja13X-0004uU-UT; Sat, 16 May 2020 17:57:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ja130-0004Sn-W1; Sat, 16 May 2020 17:56:32 +0000
X-UUID: 64235b8304a240328fe32d8a5b9c2f4a-20200516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PrNUpAGGHxvWrJzA/AaC7xbxGixXNbcXanDsGKKHfFM=; 
 b=IjfGKUQXSP+hs4Xi8xxMpevxzVmOhiDxblwIim/iKyyUwcRe1OA8u9o64iUb+KCJT1RrK1EcWI1Rrrl+uAoplkcmowDGcArT6HxPEpHa3NhR1L8QCyjBBvEEq0jMgamOjFVDy7n6N/zGpu5zBe3Lo5wWlwbdIHCd87dCYGTZGlo=;
X-UUID: 64235b8304a240328fe32d8a5b9c2f4a-20200516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1145180615; Sat, 16 May 2020 09:56:35 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 May 2020 10:46:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 May 2020 01:46:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 17 May 2020 01:46:14 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v3 3/5] scsi: ufs: Fix index of attributes query for
 WriteBooster feature
Date: Sun, 17 May 2020 01:46:13 +0800
Message-ID: <20200516174615.15445-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200516174615.15445-1-stanley.chu@mediatek.com>
References: <20200516174615.15445-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6D1E189A851CC38BC9BAE1031F40D1F3B01FD5E2186E22E32CB3C8BCD5CED0662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_105631_040550_0976645C 
X-CRM114-Status: GOOD (  10.78  )
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

For WriteBooster feature related attributes, the index used by
query shall be LUN ID if LU Dedicated buffer mode is enabled.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-sysfs.c | 13 +++++++++++--
 drivers/scsi/ufs/ufshcd.c    | 16 ++++++++++------
 drivers/scsi/ufs/ufshcd.h    |  2 +-
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
index a0b3763e1dc2..2d71d232a69d 100644
--- a/drivers/scsi/ufs/ufs-sysfs.c
+++ b/drivers/scsi/ufs/ufs-sysfs.c
@@ -637,7 +637,7 @@ static ssize_t _name##_show(struct device *dev,				\
 	int ret;							\
 	struct ufs_hba *hba = dev_get_drvdata(dev);			\
 	if (ufshcd_is_wb_flags(QUERY_FLAG_IDN##_uname))			\
-		index = ufshcd_wb_get_flag_index(hba);			\
+		index = ufshcd_wb_get_query_index(hba);			\
 	pm_runtime_get_sync(hba->dev);					\
 	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
 		QUERY_FLAG_IDN##_uname, index, &flag);			\
@@ -680,6 +680,12 @@ static const struct attribute_group ufs_sysfs_flags_group = {
 	.attrs = ufs_sysfs_device_flags,
 };
 
+static inline bool ufshcd_is_wb_attrs(enum attr_idn idn)
+{
+	return ((idn >= QUERY_ATTR_IDN_WB_FLUSH_STATUS) &&
+		(idn <= QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE));
+}
+
 #define UFS_ATTRIBUTE(_name, _uname)					\
 static ssize_t _name##_show(struct device *dev,				\
 	struct device_attribute *attr, char *buf)			\
@@ -687,9 +693,12 @@ static ssize_t _name##_show(struct device *dev,				\
 	struct ufs_hba *hba = dev_get_drvdata(dev);			\
 	u32 value;							\
 	int ret;							\
+	u8 index = 0;							\
+	if (ufshcd_is_wb_attrs(QUERY_ATTR_IDN##_uname))			\
+		index = ufshcd_wb_get_query_index(hba);			\
 	pm_runtime_get_sync(hba->dev);					\
 	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,	\
-		QUERY_ATTR_IDN##_uname, 0, 0, &value);			\
+		QUERY_ATTR_IDN##_uname, index, 0, &value);		\
 	pm_runtime_put_sync(hba->dev);					\
 	if (ret)							\
 		return -EINVAL;						\
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index f7fa571020da..c7c2bd7860b8 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5195,7 +5195,7 @@ static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable)
 	else
 		opcode = UPIU_QUERY_OPCODE_CLEAR_FLAG;
 
-	index = ufshcd_wb_get_flag_index(hba);
+	index = ufshcd_wb_get_query_index(hba);
 	ret = ufshcd_query_flag_retry(hba, opcode,
 				      QUERY_FLAG_IDN_WB_EN, index, NULL);
 	if (ret) {
@@ -5221,7 +5221,7 @@ static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set)
 	else
 		val = UPIU_QUERY_OPCODE_CLEAR_FLAG;
 
-	index = ufshcd_wb_get_flag_index(hba);
+	index = ufshcd_wb_get_query_index(hba);
 	return ufshcd_query_flag_retry(hba, val,
 				QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8,
 				index, NULL);
@@ -5244,7 +5244,7 @@ static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba)
 	if (!ufshcd_is_wb_allowed(hba) || hba->wb_buf_flush_enabled)
 		return 0;
 
-	index = ufshcd_wb_get_flag_index(hba);
+	index = ufshcd_wb_get_query_index(hba);
 	ret = ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_SET_FLAG,
 				      QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN,
 				      index, NULL);
@@ -5266,7 +5266,7 @@ static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba)
 	if (!ufshcd_is_wb_allowed(hba) || !hba->wb_buf_flush_enabled)
 		return 0;
 
-	index = ufshcd_wb_get_flag_index(hba);
+	index = ufshcd_wb_get_query_index(hba);
 	ret = ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_CLEAR_FLAG,
 				      QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN,
 				      index, NULL);
@@ -5286,10 +5286,12 @@ static bool ufshcd_wb_presrv_usrspc_keep_vcc_on(struct ufs_hba *hba,
 {
 	u32 cur_buf;
 	int ret;
+	u8 index;
 
+	index = ufshcd_wb_get_query_index(hba);
 	ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 					      QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE,
-					      0, 0, &cur_buf);
+					      index, 0, &cur_buf);
 	if (ret) {
 		dev_err(hba->dev, "%s dCurWriteBoosterBufferSize read failed %d\n",
 			__func__, ret);
@@ -5312,6 +5314,7 @@ static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
 {
 	int ret;
 	u32 avail_buf;
+	u8 index;
 
 	if (!ufshcd_is_wb_allowed(hba))
 		return false;
@@ -5326,9 +5329,10 @@ static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
 	 * buffer (dCurrentWriteBoosterBufferSize). There's no point in
 	 * keeping vcc on when current buffer is empty.
 	 */
+	index = ufshcd_wb_get_query_index(hba);
 	ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
 				      QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE,
-				      0, 0, &avail_buf);
+				      index, 0, &avail_buf);
 	if (ret) {
 		dev_warn(hba->dev, "%s dAvailableWriteBoosterBufferSize read failed %d\n",
 			 __func__, ret);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index e3dfb48e669e..8db7a6101892 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -868,7 +868,7 @@ static inline bool ufshcd_keep_autobkops_enabled_except_suspend(
 	return hba->caps & UFSHCD_CAP_KEEP_AUTO_BKOPS_ENABLED_EXCEPT_SUSPEND;
 }
 
-static inline u8 ufshcd_wb_get_flag_index(struct ufs_hba *hba)
+static inline u8 ufshcd_wb_get_query_index(struct ufs_hba *hba)
 {
 	if (hba->dev_info.b_wb_buffer_type == WB_BUF_MODE_LU_DEDICATED)
 		return hba->dev_info.wb_dedicated_lu;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
