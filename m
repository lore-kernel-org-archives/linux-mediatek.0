Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B352BC76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSjsjxOKrJlSTttf/IrPujJSrQ8rjCA3xDMZeEczL+g=; b=sR1wWfOsRxnqQG0FRcgiDYdaYI
	wbBSZofugnJ6Uw4FJQh6DJZMcBySdimMuf09O55rYVne3DaaAkMGoQx6q8cSoBI3CYXB10awlnx1I
	GfyYE+yxzMoFJQAcMlPUiqGtNcx+ck7r0PQ1d5j/ePuiG93qteC3GaqHYHaUj3PiytlwFAPf5wgaA
	eiPl785dKS3UsX88AecL+syNYhwVdbuswFFjYaZfPINDJVZSD9OAYn4l8dsNcrbHoAfd3OHAwm+o1
	4ETN+2ddUDmS388Cf3Z4bEmzv+lE5nsiXAsgNNKq6IIXBDgFGpJ2ql9CsA+Rkoc7sffK/ASGinO1a
	JdEyzO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6lm-00DzoI-0a;
	Tue, 28 Mar 2023 10:41:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6lj-00DznH-35;
	Tue, 28 Mar 2023 10:41:37 +0000
X-UUID: 19d6fc1acd5511ed8687db9d93187ff1-20230328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wSjsjxOKrJlSTttf/IrPujJSrQ8rjCA3xDMZeEczL+g=;
	b=Gz8wyWygVwIii4NoFE8UsZ/YITbadj2e1ELtggdZsHbX/FG9rFSfzWqbEFW++BJ6Ld2a2GPBtySwDsuD1LwdNWQCIexdmNpYiJL1ZRckBf06DwGsl/cPbNfQnWWNGbaBCGP3AWqVJaljCXO9fd5r7Ezjras6y+urI0UFdgXQ2BU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d7c21cd7-9c96-46c9-ade5-1a7afd99eed5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:7500bc29-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 19d6fc1acd5511ed8687db9d93187ff1-20230328
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1091941509; Tue, 28 Mar 2023 03:41:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 18:30:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 18:30:55 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>, <mason.zhang@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>
Subject: [PATCH] scsi: ufs: core: Make UFS_MCQ_NUM_DEV_CMD_QUEUES a module parameter
Date: Tue, 28 Mar 2023 18:29:59 +0800
Message-ID: <20230328103000.10757-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_034135_994942_1C3977EE 
X-CRM114-Status: GOOD (  17.02  )
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

A dedicated queue for dev commands is not mandatory, hence let
UFS_MCQ_NUM_DEV_CMD_QUEUES become module parameter `dev_cmd_queues`
to allow sharing first hw queue for dev commands.

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c     | 35 +++++++++++++++++++++++++++-------
 drivers/ufs/core/ufshcd-priv.h |  2 +-
 drivers/ufs/core/ufshcd.c      |  2 +-
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 31df052fbc41..911dc1cbe4bb 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -16,7 +16,8 @@
 #define MAX_QUEUE_SUP GENMASK(7, 0)
 #define UFS_MCQ_MIN_RW_QUEUES 2
 #define UFS_MCQ_MIN_READ_QUEUES 0
-#define UFS_MCQ_NUM_DEV_CMD_QUEUES 1
+#define UFS_MCQ_MAX_DEV_CMD_QUEUES 1
+#define UFS_MCQ_MIN_DEV_CMD_QUEUES 0
 #define UFS_MCQ_MIN_POLL_QUEUES 0
 #define QUEUE_EN_OFFSET 31
 #define QUEUE_ID_OFFSET 16
@@ -75,6 +76,23 @@ module_param_cb(poll_queues, &poll_queue_count_ops, &poll_queues, 0644);
 MODULE_PARM_DESC(poll_queues,
 		 "Number of poll queues used for r/w. Default value is 1");
 
+static int dev_cmd_queue_count_set(const char *val, const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp,
+				     UFS_MCQ_MIN_DEV_CMD_QUEUES,
+				     UFS_MCQ_MAX_DEV_CMD_QUEUES);
+}
+
+static const struct kernel_param_ops dev_cmd_queue_count_ops = {
+	.set = dev_cmd_queue_count_set,
+	.get = param_get_uint,
+};
+
+unsigned int dev_cmd_queues = 1;
+module_param_cb(dev_cmd_queues, &dev_cmd_queue_count_ops, &dev_cmd_queues, 0644);
+MODULE_PARM_DESC(dev_cmd_queues,
+		 "Number of queues used for dev command. Default value is 1");
+
 /**
  * ufshcd_mcq_config_mac - Set the #Max Activ Cmds.
  * @hba: per adapter instance
@@ -109,7 +127,7 @@ struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 	u32 hwq = blk_mq_unique_tag_to_hwq(utag);
 
 	/* uhq[0] is used to serve device commands */
-	return &hba->uhq[hwq + UFSHCD_MCQ_IO_QUEUE_OFFSET];
+	return &hba->uhq[hwq + dev_cmd_queues];
 }
 
 /**
@@ -152,7 +170,7 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
 
 	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities);
 
-	tot_queues = UFS_MCQ_NUM_DEV_CMD_QUEUES + read_queues + poll_queues +
+	tot_queues = dev_cmd_queues + read_queues + poll_queues +
 			rw_queues;
 
 	if (hba_maxq < tot_queues) {
@@ -161,7 +179,7 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
 		return -EOPNOTSUPP;
 	}
 
-	rem = hba_maxq - UFS_MCQ_NUM_DEV_CMD_QUEUES;
+	rem = hba_maxq - dev_cmd_queues;
 
 	if (rw_queues) {
 		hba->nr_queues[HCTX_TYPE_DEFAULT] = rw_queues;
@@ -187,7 +205,7 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
 	for (i = 0; i < HCTX_MAX_TYPES; i++)
 		host->nr_hw_queues += hba->nr_queues[i];
 
-	hba->nr_hw_queues = host->nr_hw_queues + UFS_MCQ_NUM_DEV_CMD_QUEUES;
+	hba->nr_hw_queues = host->nr_hw_queues + dev_cmd_queues;
 	return 0;
 }
 
@@ -423,8 +441,11 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 
 	/* The very first HW queue serves device commands */
 	hba->dev_cmd_queue = &hba->uhq[0];
-	/* Give dev_cmd_queue the minimal number of entries */
-	hba->dev_cmd_queue->max_entries = MAX_DEV_CMD_ENTRIES;
+	if (dev_cmd_queues) {
+		/* Give dedicated dev_cmd_queue the minimal number of entries */
+		hba->dev_cmd_queue->max_entries = MAX_DEV_CMD_ENTRIES;
+	}
+
 
 	host->host_tagset = 1;
 	return 0;
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 529f8507a5e4..bad611ac390e 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -78,7 +78,6 @@ struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
 				       struct ufs_hw_queue *hwq);
 
-#define UFSHCD_MCQ_IO_QUEUE_OFFSET	1
 #define SD_ASCII_STD true
 #define SD_RAW false
 int ufshcd_read_string_desc(struct ufs_hba *hba, u8 desc_index,
@@ -287,6 +286,7 @@ static inline int ufshcd_mcq_vops_config_esi(struct ufs_hba *hba)
 	return -EOPNOTSUPP;
 }
 
+extern unsigned int dev_cmd_queues;
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /**
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index acae4e194ec4..f2c62a41bb33 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5513,7 +5513,7 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	struct ufs_hw_queue *hwq;
 
 	if (is_mcq_enabled(hba)) {
-		hwq = &hba->uhq[queue_num + UFSHCD_MCQ_IO_QUEUE_OFFSET];
+		hwq = &hba->uhq[queue_num + dev_cmd_queues];
 
 		return ufshcd_mcq_poll_cqe_lock(hba, hwq);
 	}
-- 
2.18.0


