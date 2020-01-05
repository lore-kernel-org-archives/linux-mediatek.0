Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625EFC33C9B
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 10:47:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 387B2218AC
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 10:47:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KZTuk+gI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QJ50s3Fd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 387B2218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFODrxfKeg2yGN5D+BZ7jzimdYrW6Q/t+r9wEuT88Lk=; b=KZTuk+gIZZaxxR
	+wYS9jDdhInbTCewzvrG8qQdOPHF1Sa05jx85E7Vnxat852e5Kg9wWBbRfVmxG4ri7ML2UGtAf1cK
	okQufeO5wSnZUGgmRpDEdk/q79TAsi0Anm9nkMSe4HaFdF/8mftNUQj97h9bZWxm0eCuBn0j9xQch
	JeCgeXMP26LrEZQtMtcyfqF3f+J9waNqHxJlYqAI2xqEN6Ix0+Mf+hkKH6Ez+01KkG1s7BnELS390
	AQ4ttsXCsDj+SnBLO5ZZyxSr/1DqT6i6xjrw91+oT3mQcuvBCNbEj7LetFocA6NPKq1e5M4ki0ktL
	Wub1AULUZ7YerNckT6tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3RI-0000nD-L8; Sun, 05 Jan 2020 10:47:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3Qr-0000Jk-UG; Sun, 05 Jan 2020 10:46:55 +0000
X-UUID: d73cf10e5d9e460eb1242b0d4d6c1741-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DGmQNidlzNQc5LwY8YiBP+cNsBp8IGVfEGVlTvoknPc=; 
 b=QJ50s3Fdnxa7rfQWW5D+yHvxBf9KMxu+dNigg6clNpkd4PsoUUrSc0EzPDjKwMo5TFlPiVxNMlmhsPDY4ePzqgdUTFWG2/mJC9FSQV6YmGUM0BrE7dLoHZzCnHwamzm/rhpoGqyRb4KhT9blWjc0mA0dluwfNMfCwvlezINKwDk=;
X-UUID: d73cf10e5d9e460eb1242b0d4d6c1741-20200105
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 501296492; Sun, 05 Jan 2020 02:46:49 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:46:49 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:22 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:17 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 07/19] iommu/mediatek: Add REG_MMU_WR_LEN reg define
 prepare for mt6779
Date: Sun, 5 Jan 2020 18:45:11 +0800
Message-ID: <20200105104523.31006-8-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_024654_035380_5959659A 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Cui Zhang <zhang.cui@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When some platforms(ex:later mt6779) define has_wr_len variable,
we need to set REG_MMU_WR_LEN to improve performance. So we add
REG_MMU_WR_LEN register define in this patch.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 11 +++++++++++
 drivers/iommu/mtk_iommu.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5de13ab1094e..ad5690350d6a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -44,6 +44,8 @@
 
 #define REG_MMU_MISC_CTRL			0x048
 #define REG_MMU_DCM_DIS				0x050
+#define REG_MMU_WR_LEN				0x054
+#define F_MMU_WR_THROT_DIS			(BIT(5) |  BIT(21))
 
 #define REG_MMU_CTRL_REG			0x110
 #define F_MMU_TF_PROT_TO_PROGRAM_ADDR		(2 << 4)
@@ -595,6 +597,13 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
+	if (data->plat_data->has_wr_len) {
+		/* write command throttling mode */
+		regval = readl_relaxed(data->base + REG_MMU_WR_LEN);
+		regval &= ~F_MMU_WR_THROT_DIS;
+		writel_relaxed(regval, data->base + REG_MMU_WR_LEN);
+	}
+
 	if (data->plat_data->reset_axi)
 		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
 
@@ -743,6 +752,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	void __iomem *base = data->base;
 
+	reg->wr_len = readl_relaxed(base + REG_MMU_WR_LEN);
 	reg->standard_axi_mode = readl_relaxed(base +
 					       REG_MMU_MISC_CTRL);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
@@ -768,6 +778,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
 		return ret;
 	}
+	writel_relaxed(reg->wr_len, base + REG_MMU_WR_LEN);
 	writel_relaxed(reg->standard_axi_mode,
 		       base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index d4495230c6e7..0623f199e96f 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -25,6 +25,7 @@ struct mtk_iommu_suspend_reg {
 	u32				int_main_control;
 	u32				ivrp_paddr;
 	u32				vld_pa_rng;
+	u32				wr_len;
 };
 
 enum mtk_iommu_plat {
@@ -43,6 +44,7 @@ struct mtk_iommu_plat_data {
 	bool                has_sub_comm[2];
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
+	bool                has_wr_len;
 	u32                 m4u1_mask;
 	u32                 inv_sel_reg;
 	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
