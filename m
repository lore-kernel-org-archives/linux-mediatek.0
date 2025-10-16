Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59ACCCD193
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 02:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgNriODO1u0bE0yabnIx47Jb530Z96AnvhCm/17Ey64=; b=BEafqOUEVTC/2OdHFgD5RF1ZUi
	SBj73o4zw8ZaEyVJxApkrG02l1TV8pclxIgIVIjG+iREXi85vY/0/i6TY5Ty1zDXrUY1L5irzDH+U
	GM+IY1CMvelf7dsR9ayz6Ek8AFlxyKUKZrnxcewxLv0fa8IM2Y/EhqqRVpreokSmqvRs+bngGVEXm
	MV3MX0ceEzv0VXODX4sZjAhZLzszHXwgoHhkBAnz6yJwTtA/AZAtoEMSQxf9H5sWArlI4EzRKbMFV
	tsG+7ReZaPGgSpU+p4MklwPIzFcTnqIZcjaM7ei3IhZjaVOpC38auQgjeUtzE0J1ejhklNonDmcYi
	VB+AvzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Dpl-00000003JMH-2PTR;
	Thu, 16 Oct 2025 02:35:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Dpj-00000003JLM-1mGq
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Oct 2025 02:35:16 +0000
X-UUID: bd1dd48aaa3811f09f706fa2197c6ceb-20251015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qgNriODO1u0bE0yabnIx47Jb530Z96AnvhCm/17Ey64=;
	b=UN9w5GvbmMflIgz87jJ6SyVHY98wCBxz6frbokwCQaeIGGbbHPyYszCB1yZnVp3L9duL0ytUmenQnyn1/SWddtWyh5w6+s5lcfIzTQFwSzeSmJoRPQETmuwSoMmliBogHQh33l5NQqObeXrdjATdmxxpfX6MeAtxDN5m5Ai/1og=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:232be566-72c3-4f84-baa3-9366d1967219,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:5b907002-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bd1dd48aaa3811f09f706fa2197c6ceb-20251015
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1405200605; Wed, 15 Oct 2025 19:35:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 10:35:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 10:35:08 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 1/2] ufs: core: update CQ Entry to UFS 4.1 format
Date: Thu, 16 Oct 2025 10:32:31 +0800
Message-ID: <20251016023507.1000664-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251016023507.1000664-1-peter.wang@mediatek.com>
References: <20251016023507.1000664-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_193515_491513_C8E48F06 
X-CRM114-Status: GOOD (  12.20  )
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

From: Peter Wang <peter.wang@mediatek.com>

Update the completion queue (CQ) entry format with UFS 4.1
specifications. UFS 4.1 introduces new members in reserved
record DW5. This patch also refines the DW4 with detailed
members defined in UFS 4.0. Modify the code to
incorporate these changes by updating the overall_status
in the CQ entry structure.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c |  4 ++--
 include/ufs/ufshci.h      | 22 +++++++++++++++++++---
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ff7a3d60b11d..d779cc777a17 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -858,7 +858,7 @@ static enum utp_ocs ufshcd_get_tr_ocs(struct ufshcd_lrb *lrbp,
 				      struct cq_entry *cqe)
 {
 	if (cqe)
-		return le32_to_cpu(cqe->status) & MASK_OCS;
+		return cqe->overall_status & MASK_OCS;
 
 	return lrbp->utr_descriptor_ptr->header.ocs & MASK_OCS;
 }
@@ -5643,7 +5643,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 		scsi_done(cmd);
 	} else {
 		if (cqe) {
-			ocs = le32_to_cpu(cqe->status) & MASK_OCS;
+			ocs = cqe->overall_status & MASK_OCS;
 			lrbp->utr_descriptor_ptr->header.ocs = ocs;
 		}
 		complete(&hba->dev_cmd.complete);
diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
index 612500a7088f..fee8f899a569 100644
--- a/include/ufs/ufshci.h
+++ b/include/ufs/ufshci.h
@@ -567,10 +567,26 @@ struct cq_entry {
 	__le16  prd_table_offset;
 
 	/* DW 4 */
-	__le32 status;
+	u8 overall_status;
+	u8 extended_error_code;
+	__le16 reserved_1;
 
-	/* DW 5-7 */
-	__le32 reserved[3];
+	/* DW 5 */
+	u8 task_tag;
+	u8 lun;
+#if defined(__BIG_ENDIAN)
+	u8 ext_iid:4;
+	u8 iid:4;
+#elif defined(__LITTLE_ENDIAN)
+	u8 iid:4;
+	u8 ext_iid:4;
+#else
+#error
+#endif
+	u8 reserved_2;
+
+	/* DW 6-7 */
+	__le32 reserved_3[2];
 };
 
 static_assert(sizeof(struct cq_entry) == 32);
-- 
2.45.2


