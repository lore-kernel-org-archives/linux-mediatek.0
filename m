Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B38C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065CA21582
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X0xTe6QR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="my09tIFx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065CA21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3HIdLg4uB0fIRaimCcXm2U4kqDHi1obYC5oCScCiOc=; b=X0xTe6QRi42pLG
	JYaHEeo0577sm4DIdy0Fv6QOSBr21usKIWAQ9Rxt8Ok3ghEQ7yt5emGvMCHkrIw0GfC39eILpDiKs
	TMwolcK1PgRoLKUo9ySWNZvapS38PEpq7W98oQkpfbvtkblBq+Nmfi08Qfyn2gw+UPMDejaOPzXCi
	q2MhPkIK0HzMnEnImgz+vdBpvlgn9d7optOVHwxTgASxj17NK4OZ5UbrHW8th7TiIpypCy0pG0axk
	ysz9qjEM1JICUFdZS02soLNS5zeO8d9+H1cX3Q0UtXwPU5iKZs8ZvNvKSvXfEsJSyqqABXR/PbDDU
	ZcZOSV8KM2AoHIkKSE5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3eF-0000Ko-Dr; Sun, 05 Jan 2020 11:00:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3aJ-0003wZ-Ph; Sun, 05 Jan 2020 10:56:41 +0000
X-UUID: c9b7dfa3fada4adfb0a696435190ba47-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZPCRSBMjNTbmtCtbn8whmT0YKKLCCciViyvFYOwLrTg=; 
 b=my09tIFxB64UKEEb3KnQmqc8XL+Yg997ZmZ7OH4ODJ/T4oXcNWBQiTR7mF7cY4gUp/VPmITvVlzmjBadOWSQBrwlKWjR7KJ+DfiWtKpSLS9tr8WrqqnW2Q790nRlNKsfgV3KoNFqpR3ijnZaz07tvywd1+409/tLAwlo/5b6Mso=;
X-UUID: c9b7dfa3fada4adfb0a696435190ba47-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1026154442; Sun, 05 Jan 2020 02:56:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:47:11 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:15 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:07 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 05/19] iommu/mediatek: Put inv_sel_reg in the plat_data for
 preparing add 0x2c support in mt6779
Date: Sun, 5 Jan 2020 18:45:09 +0800
Message-ID: <20200105104523.31006-6-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_025639_847362_F7E44C25 
X-CRM114-Status: GOOD (  11.80  )
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

For mt6779, MMU_INVLDT_SEL register's offset is changed from 0x38 to 0x2c,
so we can put inv_sel_reg in the plat_data to use it.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 ++++++--
 drivers/iommu/mtk_iommu.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bffd417f4442..b61785a87764 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -37,6 +37,7 @@
 #define REG_MMU_INVLD_START_A			0x024
 #define REG_MMU_INVLD_END_A			0x028
 
+#define REG_MMU_INV_SEL_MT6779			0x02c
 #define REG_MMU_INV_SEL				0x038
 #define F_INVLD_EN0				BIT(0)
 #define F_INVLD_EN1				BIT(1)
@@ -165,7 +166,7 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 
 	for_each_m4u(data) {
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-			       data->base + REG_MMU_INV_SEL);
+			       data->base + data->plat_data->inv_sel_reg);
 		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
 		wmb(); /* Make sure the tlb flush all done */
 	}
@@ -182,7 +183,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	for_each_m4u(data) {
 		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-			       data->base + REG_MMU_INV_SEL);
+			       data->base + data->plat_data->inv_sel_reg);
 
 		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
 		writel_relaxed(iova + size - 1,
@@ -783,6 +784,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
+	.inv_sel_reg = REG_MMU_INV_SEL,
 };
 
 static const struct mtk_iommu_plat_data mt8173_data = {
@@ -791,12 +793,14 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_bclk     = true,
 	.reset_axi    = true,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+	.inv_sel_reg = REG_MMU_INV_SEL,
 };
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
 	.larbid_remap[0] = {0, 4, 5, 6, 7, 2, 3, 1},
+	.inv_sel_reg = REG_MMU_INV_SEL,
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index c585811a957c..ec3011a50728 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -43,6 +43,7 @@ struct mtk_iommu_plat_data {
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
 	u32                 m4u1_mask;
+	u32                 inv_sel_reg;
 	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
