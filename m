Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD110C71136
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTdzAVm88Dp3FSAFwEcWTcJ5R+ddpr4qcCBwvjSx2mw=; b=LZy/iDFv4kkHyk6VhsOpYY+8G5
	hxEsFUCifRnO3cR/mgEPEXWxL3ZtZqNECJsFEuj5W8uYqEK3fp7P0rXVcheXg15qGtZ4tuKtpZD8F
	yHzGap9eFo/Cof7TWZvTks3stXHe/rda497q9IzxIO05cOYZNiIbXawB8Gb9xWDwmafn5+hJCEBS3
	dxTs0hcoOeNWCSeTdswOI/aOa2UeQiTr7RrWlhVfDVjOmfI0xQ5lMOeI4NsLU5rCCZYEBXwHW+mK+
	DbsVX4BhhpCX0PvkHw6ky+JXW9Q6uilL2L6mLgO8QWsZTjGZuwlZ6AYYdyVckW4lxotMBh8wTdyuz
	JI7IrVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0Mq-00000003EnN-2hK7;
	Mon, 16 Jun 2025 03:18:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR02B-00000003CtQ-19j6
	for linux-mediatek@bombadil.infradead.org;
	Mon, 16 Jun 2025 02:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cTdzAVm88Dp3FSAFwEcWTcJ5R+ddpr4qcCBwvjSx2mw=; b=Ww+pQm/1Lm1+Rzl+8o80oPjfKt
	PcJd7BAIMIqEhc8lNjB/9qPh3aQyqcJ2qjgQOCr+qxerJmEA6m2etsetFVAiu5J5fmhBk/UBC6jXk
	ufzyiIHebcpBE/SE12WaS3+BNm8waxAA4Ny0v90YLilYUyUmOvSzqWgihMIXLdspt3Zc7iPOVB1Io
	NylaNScnJ4RLdivojq45umu4splzOb/DbWDkNt4k+4HIXBo39QVInseVdTWr4QqIdiM1fz8lJnsh8
	8TGuT76mYRaDnVin+zusNJmVBpBHx8yR/C9J3VzIGPBbxpJqU5lFRGZt+AG8HmTZ/6qZ3oMsl5qT7
	SKFtiP8Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR024-00000003TVt-2ryV
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Jun 2025 02:57:16 +0000
X-UUID: 8a11283e4a5d11f09eb0dd999d3936bf-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cTdzAVm88Dp3FSAFwEcWTcJ5R+ddpr4qcCBwvjSx2mw=;
	b=HVMV5kZXDoDrEauh71HmkqMKKnSMk/iqrTJmmYFAOEdge7FwFKKmBDhg8GdGBSJGuc2/D+vzOdzAhcyLcaSVnLq64CPontVQhMP/5PFBQS372MWucnEGNv5AqiSRA7eeXr2QwBvW7lhnVXYkn6Ht6spgB7noutdJRNKdfe1juYs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:4ccc6c64-1572-4ae1-9583-da7ccb47a0e7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:8b3d7d28-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a11283e4a5d11f09eb0dd999d3936bf-20250615
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1478332463; Sun, 15 Jun 2025 19:56:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 10:56:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 10:56:41 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ning li
	<ning.li@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [RFC PATCH 5/8] iommu/arm-smmu-v3: Add IRQ handle for smmu impl
Date: Mon, 16 Jun 2025 10:56:11 +0800
Message-ID: <20250616025628.25454-6-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_035714_086352_702AE76C 
X-CRM114-Status: GOOD (  12.47  )
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

Add IRQ handle for smmu impl

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 ++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 8 ++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d36124a6bb54..154417b380fa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1954,7 +1954,8 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 			arm_smmu_decode_event(smmu, evt, &event);
 			if (arm_smmu_handle_event(smmu, evt, &event))
 				arm_smmu_dump_event(smmu, evt, &event, &rs);
-
+			if (smmu->impl && smmu->impl->smmu_evt_handler)
+				smmu->impl->smmu_evt_handler(irq, smmu, evt, &rs);
 			put_device(event.dev);
 			cond_resched();
 		}
@@ -2091,7 +2092,13 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 
 static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
 {
+	struct arm_smmu_device *smmu = dev;
+
 	arm_smmu_gerror_handler(irq, dev);
+
+	if (smmu->impl && smmu->impl->combined_irq_handle)
+		smmu->impl->combined_irq_handle(irq, smmu);
+
 	return IRQ_WAKE_THREAD;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 99eeb6143c49..f45c4bf84bc1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -792,6 +792,7 @@ struct arm_smmu_device {
 
 	struct rb_root			streams;
 	struct mutex			streams_mutex;
+	const struct arm_smmu_v3_impl	*impl;
 };
 
 struct arm_smmu_stream {
@@ -998,6 +999,13 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
 				bool sync);
 
+/* Implementation details */
+struct arm_smmu_v3_impl {
+	int (*combined_irq_handle)(int irq, struct arm_smmu_device *smmu_dev);
+	int (*smmu_evt_handler)(int irq, struct arm_smmu_device *smmu_dev,
+				u64 *evt, struct ratelimit_state *rs);
+};
+
 struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
 #if IS_ENABLED(CONFIG_ARM_SMMU_V3_MEDIATEK)
 struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu);
-- 
2.46.0


