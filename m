Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0A3C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBhOt1xQzAv0xySklskz1/fp2SDGo2X2cU1zXP9G1nY=; b=MkxJx6H1utpCd75E0G76c8zB9+
	mJsBlq29BZe3c0IowGeSDmLEsV/DoNMBQgp4E36lxmOjd2eP/Bn+5fr3PYtpySDxYpuwPPi01cGCR
	BMOWk9I+OFegNMgq6YHcVjwSs6HOK3JUS3zWkDuJi1vKVwPrV7+J9Grn3fAd+tF8BgJt1J5DEikNY
	ubmRAmguRhTmZXvyGlq3vF0wDF7vEJMunu/q58PM+roYdfq24gaKpq1IT7HrmPu52BQpUdbOQF+Pu
	xhsAnqlM3exYsYqSMUrA4n3JD8E2yGqM9Taz2zECF+6nTf/2sV4XEZspWMj4LeuFE4XjMYnI0k/gU
	VpVvKR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Fnz-00HPzi-23;
	Thu, 25 May 2023 18:35:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Fnv-00HPxO-2G;
	Thu, 25 May 2023 18:35:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46086648D3;
	Thu, 25 May 2023 18:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB06C4339C;
	Thu, 25 May 2023 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039714;
	bh=nv4pu/DVjuArKp1IDphcIeJJlJ9bGuaD2HPi5eSGOho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwOAMOjtpDl68aakBVXvtjSZvZXGO15uyY3/tJ9zvNXei2usM6iYiJH8VN/6QssTq
	 3HRqRakJhmVqGoYiQ11lPgS2XYK23tXqwnSBnVQhvJaawnDhNP+qXW0TprHJTWe/WP
	 2HbnKJBPqLcSWe036hJMPrqnN+FrrijHLELlmI/SuaKSMuNssYZ/VXfQZ2OndKdLsC
	 U1nBOpME6HyiPaKFslwfh3sH/OmRDbsh3fjc11DABdw5kPmOz/IKDZRVrPuTUs/PVV
	 lChmJVmfJWqr+iVCNydnJzwlLmWHHRST0+1xzjEOrCJP2Cl0Bqd/F6MjmIJwLRWmJQ
	 6yzQ3robuC1dQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Po-Wen Kao <powen.kao@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Ziqi Chen <quic_ziqichen@quicinc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	quic_cang@quicinc.com,
	quic_asutoshd@quicinc.com,
	alice.chao@mediatek.com,
	avri.altman@wdc.com,
	beanhuo@micron.com,
	j-young.choi@samsung.com,
	Arthur.Simchaev@wdc.com,
	athierry@redhat.com,
	ebiggers@google.com,
	yoshihiro.shimoda.uh@renesas.com,
	keosung.park@samsung.com,
	dlunev@chromium.org,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.3 50/67] scsi: ufs: core: Rename symbol sizeof_utp_transfer_cmd_desc()
Date: Thu, 25 May 2023 14:31:27 -0400
Message-Id: <20230525183144.1717540-50-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_113515_815965_9DCD9D7A 
X-CRM114-Status: GOOD (  14.11  )
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

From: Po-Wen Kao <powen.kao@mediatek.com>

[ Upstream commit 06caeb536b2b21668efd2d6fa97c09461957b3a7 ]

Naming the functions after standard operators like sizeof() may cause
confusion. Rename it to ufshcd_get_ucd_size().

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
Link: https://lore.kernel.org/r/20230504154454.26654-3-powen.kao@mediatek.com
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufs-mcq.c |  2 +-
 drivers/ufs/core/ufshcd.c  | 10 +++++-----
 include/ufs/ufshcd.h       |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index b7c5f39b50e6d..937933d3f77c2 100644
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
index c7a9a1cedf920..b95b5afd7eaeb 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2821,10 +2821,10 @@ static void ufshcd_map_queues(struct Scsi_Host *shost)
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
@@ -3733,7 +3733,7 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
 	size_t utmrdl_size, utrdl_size, ucdl_size;
 
 	/* Allocate memory for UTP command descriptors */
-	ucdl_size = sizeof_utp_transfer_cmd_desc(hba) * hba->nutrs;
+	ucdl_size = ufshcd_get_ucd_size(hba) * hba->nutrs;
 	hba->ucdl_base_addr = dmam_alloc_coherent(hba->dev,
 						  ucdl_size,
 						  &hba->ucdl_dma_addr,
@@ -3833,7 +3833,7 @@ static void ufshcd_host_memory_configure(struct ufs_hba *hba)
 	prdt_offset =
 		offsetof(struct utp_transfer_cmd_desc, prd_table);
 
-	cmd_desc_size = sizeof_utp_transfer_cmd_desc(hba);
+	cmd_desc_size = ufshcd_get_ucd_size(hba);
 	cmd_desc_dma_addr = hba->ucdl_dma_addr;
 
 	for (i = 0; i < hba->nutrs; i++) {
@@ -8422,7 +8422,7 @@ static void ufshcd_release_sdb_queue(struct ufs_hba *hba, int nutrs)
 {
 	size_t ucdl_size, utrdl_size;
 
-	ucdl_size = sizeof_utp_transfer_cmd_desc(hba) * nutrs;
+	ucdl_size = ufshcd_get_ucd_size(hba) * nutrs;
 	dmam_free_coherent(hba->dev, ucdl_size, hba->ucdl_base_addr,
 			   hba->ucdl_dma_addr);
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 431c3afb2ce0f..db70944c681aa 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1138,7 +1138,7 @@ static inline size_t ufshcd_sg_entry_size(const struct ufs_hba *hba)
 	({ (void)(hba); BUILD_BUG_ON(sg_entry_size != sizeof(struct ufshcd_sg_entry)); })
 #endif
 
-static inline size_t sizeof_utp_transfer_cmd_desc(const struct ufs_hba *hba)
+static inline size_t ufshcd_get_ucd_size(const struct ufs_hba *hba)
 {
 	return sizeof(struct utp_transfer_cmd_desc) + SG_ALL * ufshcd_sg_entry_size(hba);
 }
-- 
2.39.2


