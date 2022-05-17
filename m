Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31249C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXFzhK+bFaP4Pe6tXNZtCZu85iJt/cxKMioFkuEBwnA=; b=jAqQgdKELtcoiZ
	dzs59Pogxf8I1KUWNPT0ZrCCq4TO3yV49lFJxwBPHzpa+YaPOSV0O8wSJNnOIkUKopSx9hTBdsYOH
	1OIe+rzGKeS6KQc/NB8Jb8l/dyBIq5IblBzFILqbO3M0tqZQEtM7mRSsBssPOODyNQUkvtZoaxxiN
	icN1YmXhhVBUsnwuh+8HrmWEuDSS3hxvCKVvoblUhT4YPTb3YwMYmJER1yJF/Fq7dnbPBQEYThvWj
	b86sUsG4EHgKJdq4sugGeyZn8D79kS6gx9VaQb+ta8eCOZfRzBnOJcwWMInoGwxV86830s+8aNl0v
	c8sH95vdsmcGBJ35zlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxKc-00DwfK-Hw; Tue, 17 May 2022 13:33:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqx8V-00DrvQ-Jk; Tue, 17 May 2022 13:21:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A3DBA1F433FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652793674;
 bh=zgem76efQxZUsv0+gxSAdax2+eWd0SIKK8QhJzI9GfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UwZHe+b3rbERTkOYjzLsihRgzCDI8+g/UKuWoGQdTbDi7TjDhMchWr1XqW7hsGSPt
 m2WnLw0WxEnnGn1kwZeQ/jqHE3toj79JSEZ2MnDO4SDfjvznYD4NqRLrbWZV9OGY3J
 IH3VNuFDZinAh4E0jV0An355buG1pdMEqw0MWql+qysQ7Sm2jNhBl/3U1o8/6SvwKr
 furguRab2t3P3IpJ9Dz2LEP7fIXy2HYKpMhPit9cgaLS2Vp/04eNwV2x5hPvKsdPBL
 rAlIt1staZ+yp+BSTzsJiv+nWx+kynp3yCprJq1qWZJH6Gtf7LXLzO3+CpPYC9FVRF
 tQL2IZuBMJsaA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/8] iommu: mtk_iommu: Lookup phandle to retrieve syscon to
 infracfg
Date: Tue, 17 May 2022 15:21:01 +0200
Message-Id: <20220517132107.195932-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_062115_830538_33F49ABA 
X-CRM114-Status: GOOD (  15.67  )
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

This driver will get support for more SoCs and the list of infracfg
compatibles is expected to grow: in order to prevent getting this
situation out of control and see a long list of compatible strings,
add support to retrieve a handle to infracfg's regmap through a
new "mediatek,infracfg" phandle.

In order to keep retrocompatibility with older devicetrees, the old
way is kept in place, but also a dev_warn() was added to advertise
this change in hope that the user will see it and eventually update
the devicetree if this is possible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 40 +++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 71b2ace74cd6..cfaaa98d2b50 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1134,22 +1134,34 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
-		switch (data->plat_data->m4u_plat) {
-		case M4U_MT2712:
-			p = "mediatek,mt2712-infracfg";
-			break;
-		case M4U_MT8173:
-			p = "mediatek,mt8173-infracfg";
-			break;
-		default:
-			p = NULL;
+		infracfg = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,infracfg");
+		if (IS_ERR(infracfg)) {
+			dev_warn(dev, "Cannot find phandle to mediatek,infracfg:"
+				      " Please update your devicetree.\n");
+			/*
+			 * Legacy devicetrees will not specify a phandle to
+			 * mediatek,infracfg: in that case, we use the older
+			 * way to retrieve a syscon to infra.
+			 *
+			 * This is for retrocompatibility purposes only, hence
+			 * no more compatibles shall be added to this.
+			 */
+			switch (data->plat_data->m4u_plat) {
+			case M4U_MT2712:
+				p = "mediatek,mt2712-infracfg";
+				break;
+			case M4U_MT8173:
+				p = "mediatek,mt8173-infracfg";
+				break;
+			default:
+				p = NULL;
+			}
+
+			infracfg = syscon_regmap_lookup_by_compatible(p);
+			if (IS_ERR(infracfg))
+				return PTR_ERR(infracfg);
 		}
 
-		infracfg = syscon_regmap_lookup_by_compatible(p);
-
-		if (IS_ERR(infracfg))
-			return PTR_ERR(infracfg);
-
 		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
 		if (ret)
 			return ret;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
