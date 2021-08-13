Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5837DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21A9160E76
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21A9160E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbcI01BVu6Cmn0WUgDM8I3sL7Src9tDymX+ViiKQAvw=; b=0WEn07C1K0d8Wl
	4lvUeMGmFerO/RytQNj9pz63r9w0kDUfdjTtPJnLAWtJl6gWS8jhxO8U+4kbaAlVcgdApj2jZQyeE
	61tSHgy4poXlasERnWtR1VbEvey2a76Fzrr5m6oAZgJ//U5l41sM/XY22F0TPQLN7g2EArphL29ae
	QsyEVxXCDWL7c6ZPDptMrAEalDzJ8x9vLETO7JVzz6o+5TwfWLICrLZ0W6tOka3vnYop++nPzMk2t
	EttlvUdLX1wwynfk8u54S+9PGazugFc+mjnUtoAkcidr1nkA8y/b848KGgUjLZ4ReAaPhnOBQETXg
	Fxk8nFF6TMBS/6EVOGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERBO-00Bxms-4k; Fri, 13 Aug 2021 07:00:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mER8K-00Bw7M-7r; Fri, 13 Aug 2021 06:57:38 +0000
X-UUID: 172d2137c27343219050d59941610fb0-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JpH0G2Pz0PLDcIcJqCkwILCwZvOQoVKfjcfPwyck8Go=; 
 b=RuAGMtukJZkkAxBiov5WvMwkNFK+kXdawycFTjGO59xwARmrWpZ1ho2l2beh3bxSQqrq+VWxKhNNDtRh74GlAtQPkT8w/91v+vg4GzZHsWUru/pO6rozs02SsEoyO4qEht3m9hXqRN/NwbH1Cyr4qTIdpRMW1afp7ZF1w4a8upA=;
X-UUID: 172d2137c27343219050d59941610fb0-20210812
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1870073763; Thu, 12 Aug 2021 23:57:34 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:57:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:57:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:57:30 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH v2 28/29] iommu/mediatek: Backup/restore regsiters for multi
 banks
Date: Fri, 13 Aug 2021 14:53:23 +0800
Message-ID: <20210813065324.29220-29-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_235736_322497_06A97027 
X-CRM114-Status: GOOD (  16.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Each bank has some independent registers. thus backup/restore them for
each a bank when suspend and resume.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 39 +++++++++++++++++++++++++++------------
 drivers/iommu/mtk_iommu.h | 14 +++++++++++---
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 142ee8f3a560..3d474eedce3e 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1135,16 +1135,23 @@ static int __maybe_unused mtk_iommu_runtime_suspend(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
-	void __iomem *base = data->bank[0].base;
+	void __iomem *base;
+	int i = 0;
 
+	base = data->bank[i].base;
 	reg->wr_len_ctrl = readl_relaxed(base + REG_MMU_WR_LEN_CTRL);
 	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
 	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
-	reg->int_control0 = readl_relaxed(base + REG_MMU_INT_CONTROL0);
-	reg->int_main_control = readl_relaxed(base + REG_MMU_INT_MAIN_CONTROL);
-	reg->ivrp_paddr = readl_relaxed(base + REG_MMU_IVRP_PADDR);
 	reg->vld_pa_rng = readl_relaxed(base + REG_MMU_VLD_PA_RNG);
+	do {
+		if (!data->plat_data->bank_enable[i])
+			continue;
+		base = data->bank[i].base;
+		reg->int_control[i] = readl_relaxed(base + REG_MMU_INT_CONTROL0);
+		reg->int_main_control[i] = readl_relaxed(base + REG_MMU_INT_MAIN_CONTROL);
+		reg->ivrp_paddr[i] = readl_relaxed(base + REG_MMU_IVRP_PADDR);
+	} while (++i < data->plat_data->bank_nr);
 	clk_disable_unprepare(data->bclk);
 	return 0;
 }
@@ -1153,9 +1160,9 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
-	struct mtk_iommu_domain *m4u_dom = data->bank[0].m4u_dom;
-	void __iomem *base = data->bank[0].base;
-	int ret;
+	struct mtk_iommu_domain *m4u_dom;
+	void __iomem *base;
+	int ret, i = 0;
 
 	ret = clk_prepare_enable(data->bclk);
 	if (ret) {
@@ -1167,18 +1174,26 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	 * Uppon first resume, only enable the clk and return, since the values of the
 	 * registers are not yet set.
 	 */
-	if (!m4u_dom)
+	if (!reg->wr_len_ctrl)
 		return 0;
 
+	base = data->bank[i].base;
 	writel_relaxed(reg->wr_len_ctrl, base + REG_MMU_WR_LEN_CTRL);
 	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
 	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
-	writel_relaxed(reg->int_control0, base + REG_MMU_INT_CONTROL0);
-	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
-	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
 	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
-	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK, base + REG_MMU_PT_BASE_ADDR);
+	do {
+		m4u_dom = data->bank[i].m4u_dom;
+		if (!data->plat_data->bank_enable[i] || !m4u_dom)
+			continue;
+		base = data->bank[i].base;
+		writel_relaxed(reg->int_control[i], base + REG_MMU_INT_CONTROL0);
+		writel_relaxed(reg->int_main_control[i], base + REG_MMU_INT_MAIN_CONTROL);
+		writel_relaxed(reg->ivrp_paddr[i], base + REG_MMU_IVRP_PADDR);
+		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
+		       base + REG_MMU_PT_BASE_ADDR);
+	} while (++i < data->plat_data->bank_nr);
 	return 0;
 }
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 905d8740dbcf..279c6c3ee56f 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -33,11 +33,19 @@ struct mtk_iommu_suspend_reg {
 	};
 	u32				dcm_dis;
 	u32				ctrl_reg;
-	u32				int_control0;
-	u32				int_main_control;
-	u32				ivrp_paddr;
 	u32				vld_pa_rng;
 	u32				wr_len_ctrl;
+	union {
+		struct { /* only for gen1 */
+			u32		int_control0;
+		};
+
+		struct { /* only for gen2 that support multi-banks */
+			u32		int_control[MTK_IOMMU_BANK_MAX];
+			u32		int_main_control[MTK_IOMMU_BANK_MAX];
+			u32		ivrp_paddr[MTK_IOMMU_BANK_MAX];
+		};
+	};
 };
 
 enum mtk_iommu_plat {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
