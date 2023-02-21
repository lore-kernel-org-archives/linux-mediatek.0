Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BD0C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ1FI+tZAutpfgYwGq8uJe/0tKi1xigqaET55cH0i18=; b=4u3V/0QzLMbRubQNlnE6jcyAU/
	Na1B5LQpsOAQxeEog/o3y9au2mOAZgi0j44c9T5+ifzOgQMpypEe5Y1U6wrijjuVyGGQpbwvc8bYM
	ZUIWxKuC0r/RrmTana5ni5VtEZtN5wJVdWPRl7Pcl/X+bgDsWMo+w8Uok2qm1uVl/sl6xybNEh3+m
	u6QHM26w2bM7EjEvET1GmODwP2F42297gFBg0Vdx8k1T3dGRaduoQSWB6dKxUbVjudDQ1HGGOkae9
	sTUYI2ubfNhg2d6fOWv6IiXJqnhmriXx9AHlkC6DlOaLGgB564E4SFTy7a/3gMOD+oVt/AgZ/+Ldm
	yCYVpN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUbM-008g2Q-03; Tue, 21 Feb 2023 15:30:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUb7-008fuE-Cy; Tue, 21 Feb 2023 15:30:31 +0000
X-UUID: a83f3f9ab1fc11eda08d4d6090ec5a5c-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nQ1FI+tZAutpfgYwGq8uJe/0tKi1xigqaET55cH0i18=;
	b=B7kyxq75w8CPtTMVGcWdEahW+79PPVqQz70FpK53T8yrewDWiq1NC0GJFg2mZ/AADswtdnLG4UQ1OvJDHt0fncYyAbL7MZOAw2AvmP7U3Bwwq8+YlI+lx3Xa/4/Qk6zPdiOMNMx0dt2m4BrLcL5oMlxBYHFwQGxA09IG9Y+Wcog=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:7bc8d9bb-74c4-4d0e-9421-e23a40cfb18a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:ca9d22b1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: a83f3f9ab1fc11eda08d4d6090ec5a5c-20230221
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1554318201; Tue, 21 Feb 2023 08:30:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 21 Feb 2023 23:30:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 21 Feb 2023 23:30:20 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>, <mason.zhang@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/4] scsi: ufs: core: Add hwq print for debug
Date: Tue, 21 Feb 2023 23:29:16 +0800
Message-ID: <20230221152919.25837-4-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230221152919.25837-1-powen.kao@mediatek.com>
References: <20230221152919.25837-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_073029_494641_CBD20F58 
X-CRM114-Status: GOOD (  17.36  )
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

Introduce hwq printing function for debug purpose.
- ufshcd_mcq_print_hwqs()

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c     | 32 +++++++++++++++++++++++++++++++-
 drivers/ufs/core/ufshcd-priv.h |  9 +++++++++
 drivers/ufs/core/ufshcd.c      | 18 +++++++++++-------
 include/ufs/ufshci.h           | 12 ++++++++++++
 4 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 5d5bc0bc6e88..d1ff3ccd2085 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -23,7 +23,6 @@
 
 #define MAX_DEV_CMD_ENTRIES	2
 #define MCQ_CFG_MAC_MASK	GENMASK(16, 8)
-#define MCQ_QCFG_SIZE		0x40
 #define MCQ_ENTRY_SIZE_IN_DWORD	8
 #define CQE_UCD_BA GENMASK_ULL(63, 7)
 
@@ -75,6 +74,13 @@ module_param_cb(poll_queues, &poll_queue_count_ops, &poll_queues, 0644);
 MODULE_PARM_DESC(poll_queues,
 		 "Number of poll queues used for r/w. Default value is 1");
 
+static const int mcq_opr_size[] = {
+	MCQ_SQD_SIZE,
+	MCQ_SQIS_SIZE,
+	MCQ_CQD_SIZE,
+	MCQ_CQIS_SIZE,
+};
+
 /**
  * ufshcd_mcq_config_mac - Set the #Max Activ Cmds.
  * @hba: per adapter instance
@@ -237,6 +243,30 @@ static void __iomem *mcq_opr_base(struct ufs_hba *hba,
 	return opr->base + opr->stride * i;
 }
 
+void ufshcd_mcq_print_hwqs(struct ufs_hba *hba, unsigned long bitmap)
+{
+	int id, i;
+	char prefix[15];
+
+	if (!is_mcq_enabled(hba))
+		return;
+
+	for_each_set_bit(id, &bitmap, hba->nr_hw_queues) {
+		snprintf(prefix, sizeof(prefix), "q%d SQCFG: ", id);
+		ufshcd_hex_dump(prefix,
+			hba->mcq_base + MCQ_QCFG_SIZE * id, MCQ_QCFG_SQ_SIZE);
+
+		snprintf(prefix, sizeof(prefix), "q%d CQCFG: ", id);
+		ufshcd_hex_dump(prefix,
+			hba->mcq_base + MCQ_QCFG_SIZE * id + MCQ_QCFG_SQ_SIZE, MCQ_QCFG_CQ_SIZE);
+
+		for (i = 0; i < OPR_MAX ; i++) {
+			snprintf(prefix, sizeof(prefix), "q%d OPR%d: ", id, i);
+			ufshcd_hex_dump(prefix, mcq_opr_base(hba, i, id), mcq_opr_size[i]);
+		}
+	}
+}
+
 u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i)
 {
 	return readl(mcq_opr_base(hba, OPR_CQIS, i) + REG_CQIS);
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 529f8507a5e4..13534a9a6d0a 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -6,6 +6,14 @@
 #include <linux/pm_runtime.h>
 #include <ufs/ufshcd.h>
 
+#define ufshcd_hex_dump(prefix_str, buf, len) do {                       \
+	size_t __len = (len);                                            \
+	print_hex_dump(KERN_ERR, prefix_str,                             \
+		       __len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,\
+		       16, 4, buf, __len, false);                        \
+} while (0)
+
+
 static inline bool ufshcd_is_user_access_allowed(struct ufs_hba *hba)
 {
 	return !hba->shutting_down;
@@ -65,6 +73,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 			  struct cq_entry *cqe);
 int ufshcd_mcq_init(struct ufs_hba *hba);
 int ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
+void ufshcd_mcq_print_hwqs(struct ufs_hba *hba, unsigned long bitmap);
 int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
 void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba);
 void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 81c9f07ebfc8..a15a5a78160c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -135,13 +135,6 @@ MODULE_PARM_DESC(use_mcq_mode, "Control MCQ mode for controllers starting from U
 		_ret;                                                   \
 	})
 
-#define ufshcd_hex_dump(prefix_str, buf, len) do {                       \
-	size_t __len = (len);                                            \
-	print_hex_dump(KERN_ERR, prefix_str,                             \
-		       __len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,\
-		       16, 4, buf, __len, false);                        \
-} while (0)
-
 int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 		     const char *prefix)
 {
@@ -536,6 +529,8 @@ static
 void ufshcd_print_trs(struct ufs_hba *hba, unsigned long bitmap, bool pr_prdt)
 {
 	const struct ufshcd_lrb *lrbp;
+	struct ufs_hw_queue *hwq;
+	struct scsi_cmnd *cmd;
 	int prdt_length;
 	int tag;
 
@@ -574,7 +569,16 @@ void ufshcd_print_trs(struct ufs_hba *hba, unsigned long bitmap, bool pr_prdt)
 		if (pr_prdt)
 			ufshcd_hex_dump("UPIU PRDT: ", lrbp->ucd_prdt_ptr,
 				ufshcd_sg_entry_size(hba) * prdt_length);
+
+		if (is_mcq_enabled(hba)) {
+			cmd = lrbp->cmd;
+			if (!cmd)
+				return;
+			hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
+			ufshcd_mcq_print_hwqs(hba, 1 << hwq->id);
+		}
 	}
+
 }
 
 static void ufshcd_print_tmrs(struct ufs_hba *hba, unsigned long bitmap)
diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
index 11424bb03814..027a2e884f89 100644
--- a/include/ufs/ufshci.h
+++ b/include/ufs/ufshci.h
@@ -185,6 +185,18 @@ static inline u32 ufshci_version(u32 major, u32 minor)
 				CRYPTO_ENGINE_FATAL_ERROR |\
 				UIC_LINK_LOST)
 
+/* MCQ size */
+#define MCQ_QCFG_SIZE			0x40
+#define MCQ_QCFG_SQ_SIZE		0x20
+#define MCQ_QCFG_CQ_SIZE		0x20
+
+enum {
+	MCQ_SQD_SIZE		= 0x14,
+	MCQ_SQIS_SIZE		= 0x08,
+	MCQ_CQD_SIZE		= 0x08,
+	MCQ_CQIS_SIZE		= 0x0C,
+};
+
 /* HCS - Host Controller Status 30h */
 #define DEVICE_PRESENT				0x1
 #define UTP_TRANSFER_REQ_LIST_READY		0x2
-- 
2.18.0


