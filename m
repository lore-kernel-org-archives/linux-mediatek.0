Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8110C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHNQxV0BQqgd97PQm+nFBen8vXHvDzVaK6MpGtGKRUA=; b=46yShiEP19nMPl
	whPa7jkG01O+dB3IWi2GDH1zBPcT5ma6MumVi8EWmEDSKKeYO4WcBud8HH0YTxe/xoXmXbu7FsJcT
	Vc1ytA5iJ6u8AuU8+tHP495M6cyx0Xc9G6ogX9rArTGR05idQ17VznhwxnEArJJqavwYf722efzoV
	JWbWiNwoS0RKyPlea53ldkEYMxr2PJjZBvkVypRic6i4C5JaSjYRQoTXnCIkfRjctXjTK5Uq771FT
	nMQ6AMgRdx9awIcY7l0r/qGiVTmDoZ7IwgUVmKQTFpbxhuQ7PZXs40mr18y/vQA7jVRsmGfXIEDLx
	uc3v8bMzLO+3PNdzV1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGYk-001Erl-OV; Wed, 18 May 2022 10:05:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGYM-001Eev-Qh; Wed, 18 May 2022 10:05:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 083F11F44E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652868313;
 bh=jzNtgZkb9ZUDqbEgkSmucrQ5hqCWbZHhy8hNzMj2XCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RSm8VlR/wAkXXUyu0gDZ6NPI7QYwM97rHI7JWcFMigO3nQKyH9qCeDUgvPCamrn5x
 oG9DVcuX80Sl/fAiuJ/ohrcsUYzGxlvInw4de0rzfIySHPIxYKp+m1FxRmvFC+m4rc
 Ll4gO3qzCVgJO+51BZalQvAykzNrRmpdJd4E+2wX/SOoFpLzG32atEmW0MBGE53SyQ
 yNKpcvVncG+Lkcz4jHAeexkRmpnHQWRhqNnkgowBszwi1JGwmAqHhqPs4v/szydqbg
 XRLIBlxUnNLWPn1PtSb+tEo7gHwNTu0qFLJtcCOukae2vIzpiS4UGFIE2g3q9ZbNzr
 FZNKueUpDMBtA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 3/7] iommu: mtk_iommu: Lookup phandle to retrieve syscon to
 pericfg
Date: Wed, 18 May 2022 12:04:59 +0200
Message-Id: <20220518100503.37279-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_030515_060214_13E8DB06 
X-CRM114-Status: GOOD (  15.99  )
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

On some SoCs (of which only MT8195 is supported at the time of writing),
the "R" and "W" (I/O) enable bits for the IOMMUs are in the pericfg_ao
register space and not in the IOMMU space: as it happened already with
infracfg, it is expected that this list will grow.

Instead of specifying pericfg compatibles on a per-SoC basis, following
what was done with infracfg, let's lookup the syscon by phandle instead.
Also following the previous infracfg change, add a warning for outdated
devicetrees, in hope that the user will take action.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d16b95e71ded..090cf6e15f85 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -138,6 +138,8 @@
 /* PM and clock always on. e.g. infra iommu */
 #define PM_CLK_AO			BIT(15)
 #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
+/* IOMMU I/O (r/w) is enabled using PERICFG_IOMMU_1 register */
+#define HAS_PERI_IOMMU1_REG		BIT(17)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -187,7 +189,6 @@ struct mtk_iommu_plat_data {
 	u32			flags;
 	u32			inv_sel_reg;
 
-	char			*pericfg_comp_str;
 	struct list_head	*hw_list;
 	unsigned int		iova_region_nr;
 	const struct mtk_iommu_iova_region	*iova_region;
@@ -1214,14 +1215,19 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_runtime_disable;
 		}
 	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
-		   data->plat_data->pericfg_comp_str) {
-		infracfg = syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
-		if (IS_ERR(infracfg)) {
-			ret = PTR_ERR(infracfg);
-			goto out_runtime_disable;
-		}
+		   MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_PERI_IOMMU1_REG)) {
+		data->pericfg = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,pericfg");
+		if (IS_ERR(data->pericfg)) {
+			dev_info(dev, "Cannot find phandle to mediatek,pericfg:"
+				      " Please update your devicetree.\n");
 
-		data->pericfg = infracfg;
+			p = "mediatek,mt8195-pericfg_ao";
+			data->pericfg = syscon_regmap_lookup_by_compatible(p);
+			if (IS_ERR(data->pericfg)) {
+				ret = PTR_ERR(data->pericfg);
+				goto out_runtime_disable;
+			}
+		}
 	}
 
 	platform_set_drvdata(pdev, data);
@@ -1480,8 +1486,8 @@ static const struct mtk_iommu_plat_data mt8192_data = {
 static const struct mtk_iommu_plat_data mt8195_data_infra = {
 	.m4u_plat	  = M4U_MT8195,
 	.flags            = WR_THROT_EN | DCM_DISABLE | STD_AXI_MODE | PM_CLK_AO |
-			    MTK_IOMMU_TYPE_INFRA | IFA_IOMMU_PCIE_SUPPORT,
-	.pericfg_comp_str = "mediatek,mt8195-pericfg_ao",
+			    HAS_PERI_IOMMU1_REG | MTK_IOMMU_TYPE_INFRA |
+			    IFA_IOMMU_PCIE_SUPPORT,
 	.inv_sel_reg      = REG_MMU_INV_SEL_GEN2,
 	.banks_num	  = 5,
 	.banks_enable     = {true, false, false, false, true},
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
