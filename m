Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA92C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMolWppIxSDsvuReLyYrwGonSoAuCBkkM1bAynDTv60=; b=PMwdwz4M7HrBfknkwq87XcP7EH
	fl8LuB3/EMdBx2VYICf7PBpCikZbyCbm0NmzVP6t+4vwG76cbH1fnsD6z9aC1qLaLTS9BcmZ2slGL
	vwR/cE5ciWsnOx4GQTTmC5xQj2vS0SYBl2F0oOXSx7k2BwFSy4r83vVwS49yT6ICnIVF4B76e7sOA
	nA89LT8SH3OJAdw6rXgsS8FRcPPgRS0QbdXo0RXgEer3tRbRrDca+5aDDajl3VW7w1Gfsm3YTJOAr
	Hdy2yNPzMuIPFSrLa2Oqt0iULvUonXzB2uWwGyxqZvfmB3HMpad6EJf+KkScIWIk1G5iUlQEHXdZJ
	oCqHb3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pub8x-008Ffx-1h;
	Thu, 04 May 2023 15:45:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pub8p-008FaY-2r;
	Thu, 04 May 2023 15:45:13 +0000
X-UUID: a11d4292ea9211ed83ed1395ce914268-20230504
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EMolWppIxSDsvuReLyYrwGonSoAuCBkkM1bAynDTv60=;
	b=aUNT2L5bEx1xPpK5iNl/8CnG/9izxITV37xqdzNwIDVvRgvAV2vI4E9wpciBz1h9oLeIQDFrBh0j3zhLNc7hg5oIIeJsCyBCR/1pGfd4vDshH9pqY7KLnnG9VEjK57+p6aMf5FYARN8QxP2M+OTZj9GHFn+JvBGmJezw04LLqa0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:13fd3801-41b2-42a3-8f96-eba0f60a208c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:697ab71,CLOUDID:ab83c130-6935-4eab-a959-f84f8da15543,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a11d4292ea9211ed83ed1395ce914268-20230504
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 550270037; Thu, 04 May 2023 08:45:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 May 2023 23:44:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 May 2023 23:44:58 +0800
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
	<eddie.huang@mediatek.com>
Subject: [PATCH v6 2/3] scsi: ufs: core: Rename symbol sizeof_utp_transfer_cmd_desc()
Date: Thu, 4 May 2023 23:44:50 +0800
Message-ID: <20230504154454.26654-3-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230504154454.26654-1-powen.kao@mediatek.com>
References: <20230504154454.26654-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_084511_928331_0514752C 
X-CRM114-Status: GOOD (  13.86  )
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

Naming the functions after standard operators like sizeof may cause
confusion. So let's rename it to ufshcd_get_ucd_size().

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufs-mcq.c |  2 +-
 drivers/ufs/core/ufshcd.c  | 10 +++++-----
 include/ufs/ufshcd.h       |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index b7c5f39b50e6..937933d3f77c 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -265,7 +265,7 @@ static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
 	addr = (le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA) -
 		hba->ucdl_dma_addr;
 
-	return div_u64(addr, sizeof_utp_transfer_cmd_desc(hba));
+	return div_u64(addr, ufshcd_get_ucd_size(hba));
 }
 
 static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 6c4ae32a1c49..3ef650317357 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2849,10 +2849,10 @@ static void ufshcd_map_queues(struct Scsi_Host *shost)
 static void ufshcd_init_lrb(struct ufs_hba *hba, struct ufshcd_lrb *lrb, int i)
 {
 	struct utp_transfer_cmd_desc *cmd_descp = (void *)hba->ucdl_base_addr +
-		i * sizeof_utp_transfer_cmd_desc(hba);
+		i * ufshcd_get_ucd_size(hba);
 	struct utp_transfer_req_desc *utrdlp = hba->utrdl_base_addr;
 	dma_addr_t cmd_desc_element_addr = hba->ucdl_dma_addr +
-		i * sizeof_utp_transfer_cmd_desc(hba);
+		i * ufshcd_get_ucd_size(hba);
 	u16 response_offset = offsetof(struct utp_transfer_cmd_desc,
 				       response_upiu);
 	u16 prdt_offset = offsetof(struct utp_transfer_cmd_desc, prd_table);
@@ -3761,7 +3761,7 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
 	size_t utmrdl_size, utrdl_size, ucdl_size;
 
 	/* Allocate memory for UTP command descriptors */
-	ucdl_size = sizeof_utp_transfer_cmd_desc(hba) * hba->nutrs;
+	ucdl_size = ufshcd_get_ucd_size(hba) * hba->nutrs;
 	hba->ucdl_base_addr = dmam_alloc_coherent(hba->dev,
 						  ucdl_size,
 						  &hba->ucdl_dma_addr,
@@ -3861,7 +3861,7 @@ static void ufshcd_host_memory_configure(struct ufs_hba *hba)
 	prdt_offset =
 		offsetof(struct utp_transfer_cmd_desc, prd_table);
 
-	cmd_desc_size = sizeof_utp_transfer_cmd_desc(hba);
+	cmd_desc_size = ufshcd_get_ucd_size(hba);
 	cmd_desc_dma_addr = hba->ucdl_dma_addr;
 
 	for (i = 0; i < hba->nutrs; i++) {
@@ -8452,7 +8452,7 @@ static void ufshcd_release_sdb_queue(struct ufs_hba *hba, int nutrs)
 {
 	size_t ucdl_size, utrdl_size;
 
-	ucdl_size = sizeof_utp_transfer_cmd_desc(hba) * nutrs;
+	ucdl_size = ufshcd_get_ucd_size(hba) * nutrs;
 	dmam_free_coherent(hba->dev, ucdl_size, hba->ucdl_base_addr,
 			   hba->ucdl_dma_addr);
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index f7553293ba98..df1d04f7a542 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1133,7 +1133,7 @@ static inline size_t ufshcd_sg_entry_size(const struct ufs_hba *hba)
 	({ (void)(hba); BUILD_BUG_ON(sg_entry_size != sizeof(struct ufshcd_sg_entry)); })
 #endif
 
-static inline size_t sizeof_utp_transfer_cmd_desc(const struct ufs_hba *hba)
+static inline size_t ufshcd_get_ucd_size(const struct ufs_hba *hba)
 {
 	return sizeof(struct utp_transfer_cmd_desc) + SG_ALL * ufshcd_sg_entry_size(hba);
 }
-- 
2.18.0


