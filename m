Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5BDC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaYa03wMlPBqlHEmSGtHvlB/80JS4Qq8wE2rWXUWS/c=; b=TsrU5A7SRhoG+8QlfiPe6Zkbt3
	6MmaEwRwICa22OqbJQCANZWl76JIpPuGLT3WmWncTCl3pXQZf/BEZzh3NBhly1G8fGUnmJ9HXJnP0
	aYhgZ9SJp+OYt81cU1J7Ij/WJMjxwsU24/1swSrV2YZ84WQzRqqvp/KV+HExxTzkdtDlZeESFl9Cl
	/0s+0Ee6Vx7tPuskhpCbTIwu/Su4xyWiOvCG+QMUbhYTvGhQztE9joirN7kVoo8kLA2I4mwaIztmg
	y2uK9IFTxzLrztdItkvmXFF6DfJ/ta7H6E9zpPlR0y06nnrbGQIa2SsF+p8SIS6bb6x71xMGwNS//
	qr8Xau8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Fnj-00HPsG-0N;
	Thu, 25 May 2023 18:35:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Fnf-00HPpt-2M;
	Thu, 25 May 2023 18:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4675E648D7;
	Thu, 25 May 2023 18:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955DDC4339C;
	Thu, 25 May 2023 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039698;
	bh=6YmevBviBkehl6EAczyX6mPWGWg8NS8LrHggZS65toA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=irRF1K2v7rNYx2Br5YnmBEEjmNClA2Mip6h7pExako0DICVezP0nE8zTVqt9aGhWk
	 06A3LGSR9FKldMw8MhONYTSivptQYoimcj3onO0nA2rqCw8Zy+w6Yq+uo/za8VNQjC
	 li09omwVH45HqRUUWjd32JyPL2qifY9CtQIkdYvGKJasFhkxcWP8l4+AN9t1eKICv9
	 ZAGfX2kuGuirONySx4iz8IByo1JEYL+Zz+dKpTvMHWlBZcHiDumH9DG4xfmYLSsXdJ
	 YdP0CISqri83htM9wjZLTEz875fAglcN0OzLndaIbqVA5dGEsf+ZUVvHIQVwZ7IuuG
	 49wFPOQiqhgpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Po-Wen Kao <powen.kao@mediatek.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Ziqi Chen <quic_ziqichen@quicinc.com>,
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
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.3 49/67] scsi: ufs: core: Fix MCQ tag calculation
Date: Thu, 25 May 2023 14:31:26 -0400
Message-Id: <20230525183144.1717540-49-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_113459_853274_934FD185 
X-CRM114-Status: GOOD (  12.83  )
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

[ Upstream commit 5149452ca66289ef33d13897ee845a2f6f5b680f ]

The transfer command descriptor is allocated in ufshcd_memory_alloc() and
referenced by the transfer request descriptor with stride size
sizeof_utp_transfer_cmd_desc() instead of sizeof(struct
utp_transfer_cmd_desc).

Consequently, computing tag by address offset should also refer to the
same stride.

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
Link: https://lore.kernel.org/r/20230504154454.26654-2-powen.kao@mediatek.com
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufs-mcq.c | 2 +-
 drivers/ufs/core/ufshcd.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 202ff71e1b582..b7c5f39b50e6d 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -265,7 +265,7 @@ static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
 	addr = (le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA) -
 		hba->ucdl_dma_addr;
 
-	return div_u64(addr, sizeof(struct utp_transfer_cmd_desc));
+	return div_u64(addr, sizeof_utp_transfer_cmd_desc(hba));
 }
 
 static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 70b112038792a..c7a9a1cedf920 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8422,7 +8422,7 @@ static void ufshcd_release_sdb_queue(struct ufs_hba *hba, int nutrs)
 {
 	size_t ucdl_size, utrdl_size;
 
-	ucdl_size = sizeof(struct utp_transfer_cmd_desc) * nutrs;
+	ucdl_size = sizeof_utp_transfer_cmd_desc(hba) * nutrs;
 	dmam_free_coherent(hba->dev, ucdl_size, hba->ucdl_base_addr,
 			   hba->ucdl_dma_addr);
 
-- 
2.39.2


