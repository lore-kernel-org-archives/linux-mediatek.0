Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F63C25B6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xb6J1Ir1c2KPXFeV1wmOSMhx5pvLnemEhGAfDHDeRdU=; b=TiRmIxPwpIv2ToGAM3CgEBL0mT
	/4U518uWFZz/bXGeNCZmeVGdex2FTQMYkql5ETBTZ3dqmtrmLejSiSW2zwTJMcjc0WMTajCDekqAh
	IOBS2YhvAfhpXmClkByGGQYPHELhBKilnePf6cRKujB+fdj3C6ONDrcsNfRUC3fBlxt3abrrYGi+N
	+O0xy6yHDwZhRGGVTMPcxGuk/RGIbH2915+qRluvuH0FPgYpwL8R5B4n6sIYUz5Ndj8M0Q+hrjHyF
	DJynohj+CUOjd1uDDqOn66Gc/Noh9lXNN10h8+WUqRmrLXAwxIDXE6MWVQayZ8Jzs75ME7x71wEr0
	0qs/6ntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZhs-00BlMw-2l;
	Wed, 25 Oct 2023 08:57:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZhq-00BlKV-0T;
	Wed, 25 Oct 2023 08:57:39 +0000
X-UUID: 848b1b1c731411ee9b7791016c24628a-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xb6J1Ir1c2KPXFeV1wmOSMhx5pvLnemEhGAfDHDeRdU=;
	b=GCMuvtB/+5cXn7g7pj5uIrLdpFqg/pkVs/h4IQuqfloAocFmWC6D/fCCNzboMEh4AE/q//TIAQZzbnGLqM+3FRpuuNvIQe+oDOw9YZuyFY2XuPmEtbMGnHgCXlrgnvaUHtcbu66/6DWNsbYlppRh69YRnwJQ4Ux4U2GLvkhKhWo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:818ea9d8-cca1-4066-b6b5-51ac844bed47,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:078f9d94-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 848b1b1c731411ee9b7791016c24628a-20231025
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chun-hung.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1644251578; Wed, 25 Oct 2023 01:57:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Oct 2023 16:57:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Oct 2023 16:57:18 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E . J . Bottomley"
	<jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Can Guo <quic_cang@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>, Asutosh Das
	<quic_asutoshd@quicinc.com>, "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
	Yang Li <yang.lee@linux.alibaba.com>, Eric Biggers <ebiggers@google.com>,
	Keoseong Park <keosung.park@samsung.com>, Arthur Simchaev
	<Arthur.Simchaev@wdc.com>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>,
	<peter.wang@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <lin.gui@mediatek.com>, <eddie.huang@mediatek.com>,
	<qilin.tan@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-team@android.com>
Subject: [PATCH v1 1/1] ufs: core: Add host quirk QUIRK_MCQ_EXPAND_QUEUE_SLOT
Date: Wed, 25 Oct 2023 16:56:54 +0800
Message-ID: <20231025085656.10848-2-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231025085656.10848-1-chun-hung.wu@mediatek.com>
References: <20231025085656.10848-1-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.746200-8.000000
X-TMASE-MatchedRID: qrLumZlmEv35vVrLXEcGcaOONuzwygtGK2i9pofGVStcU0dNErOD+iG+
	TaaivvuaVp8FEOw3oY/7jEpf1WfcwRMYdvBjd19wh2VzUlo4HVMK/ePvB1fEGJsoi2XrUn/J8m+
	hzBStansfRoCwBzgRYidET58jp62STbYwO+VGPGXSxt8yJqi5GIbcgu+rBwskDhTgbbUYqPA18S
	hyshWILoEhlo9tyDBHBixHQXpAWNhLrNYA/hws/qv13aNekZZCgITnGkK0NFNRskXKHhdfKpij9
	M86UwHhsKHfMTjCprwNQJGvyiKf6Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.746200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2923996887D26B6DC4A02F4BAA7ED582366F0C636F7B277759BD57095C80F5E62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_015738_191300_C3D30A79 
X-CRM114-Status: GOOD (  13.97  )
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

From: Alice Chao <alice.chao@mediatek.com>

This quirk needs to be enabled if the host controller cannot
distinguish queue full or empty.

Signed-off-by: Alice Chao <alice.chao@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c |  5 ++++-
 include/ufs/ufshcd.h       | 11 +++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 2ba8ec254dce..9b8ed3f9a349 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -436,7 +436,10 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 
 	for (i = 0; i < hba->nr_hw_queues; i++) {
 		hwq = &hba->uhq[i];
-		hwq->max_entries = hba->nutrs;
+		if (ufshcd_is_mcq_expand_queue_slot(hba))
+			hwq->max_entries = hba->nutrs + 1;
+		else
+			hwq->max_entries = hba->nutrs;
 		spin_lock_init(&hwq->sq_lock);
 		spin_lock_init(&hwq->cq_lock);
 		mutex_init(&hwq->sq_mutex);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 7d07b256e906..44de185501b5 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -643,6 +643,12 @@ enum ufshcd_quirks {
 	 * thus need this quirk to skip related flow.
 	 */
 	UFSHCD_QUIRK_MCQ_BROKEN_RTC			= 1 << 21,
+
+	/*
+	 * This quirk needs to be enabled if the host controller cannot
+	 * distinguish queue full or empty.
+	 */
+	UFSHCD_QUIRK_MCQ_EXPAND_QUEUE_SLOT              = 1 << 22,
 };
 
 enum ufshcd_caps {
@@ -1198,6 +1204,11 @@ static inline bool ufshcd_enable_wb_if_scaling_up(struct ufs_hba *hba)
 	return hba->caps & UFSHCD_CAP_WB_WITH_CLK_SCALING;
 }
 
+static inline bool ufshcd_is_mcq_expand_queue_slot(struct ufs_hba *hba)
+{
+	return hba->quirks & UFSHCD_QUIRK_MCQ_EXPAND_QUEUE_SLOT;
+}
+
 #define ufsmcq_writel(hba, val, reg)	\
 	writel((val), (hba)->mcq_base + (reg))
 #define ufsmcq_readl(hba, reg)	\
-- 
2.18.0


