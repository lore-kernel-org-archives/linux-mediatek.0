Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C42C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8/g6afJCZrs6a3Jz5GK+5XUb21J7ifxYHdN7n4quMM=; b=UPmpDWajiW01w3Unr+KUuDRbec
	/CpPQIxIjk79uxPeLShknc+6rKcLM8S/5DWXxsm7gfuzLghvPR/JAkeZVRof1qVwifdpsAE3gIiUJ
	V+FDv/Aq7maz2om8Kg6U/leBm8u3DXSL2guUg0jZR/KJFXYq7QTkh0fDolLqLn3dEP9zp073jyMas
	clPDcrfZwzAkRjX5mQUOReGiEVNeEBVmzjjkkpwEYS+hzMfWfqgeAjr3h+I/5BS9al3pmPrLHoW7C
	ub9kU+/acpAJFrF4fNVmJfyfroq5SkDTnDM6RU5g+VQctwb0gxTMY6u7IXltozBCgHsmqxNsJ2fkJ
	2Q0Km5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nNv-0020gW-0Z; Thu, 16 Jun 2022 11:09:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nMi-001zyo-Kp; Thu, 16 Jun 2022 11:08:46 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BB0C66601756;
	Thu, 16 Jun 2022 12:08:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655377723;
	bh=Ym8V4C7cqusZmnKUp44mYzfUNnjhU5hnhfnX8Zm9pqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NmtPN0WvcM9Ve1t1pov1LUxFbiFgFsHXn7r1U0/dBzpD2ev+nNt/AsBREsxoLTnvg
	 1MXrkjTKKJ2o3BdglJrC/B/r0wtT7q/Bd1JOTv4SG0kt9axG22fWfGU61cHQUDFq8G
	 sGjjCszu4KJdE/J7JzQ5U7AP45Msq8+2TkLltrtmxCq2CPMnRIMMDCGxZZhvAIbgFL
	 wusIWrO6ZpaBFJOSF6Du39eqV3BaWwFAPhGtE3zlRKZHppx0Qy2rh6BvZ+aXB+DvyO
	 0NXS43OHcFjvEcxekxmHDZwzuA/EpVcnhbEyBSPSDcEnjVvkMn9TpG8mtQelh9vn0T
	 svphRSs2SqIIg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	miles.chen@mediatek.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 5/5] iommu/mediatek: Cleanup pericfg lookup flow
Date: Thu, 16 Jun 2022 13:08:30 +0200
Message-Id: <20220616110830.26037-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_040844_870003_D16F261C 
X-CRM114-Status: GOOD (  10.63  )
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

Since only the INFRA type IOMMU needs to modify register(s) in the
pericfg iospace, it's safe to drop the pericfg_comp_str NULL check;
also, directly assign the regmap handle to data->pericfg instead of
to the infracfg variable to improve code readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 90685946fcbe..b2ae84046249 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1217,15 +1217,13 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			dev_err(dev, "mm dts parse fail(%d).", ret);
 			goto out_runtime_disable;
 		}
-	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
-		   data->plat_data->pericfg_comp_str) {
-		infracfg = syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
-		if (IS_ERR(infracfg)) {
-			ret = PTR_ERR(infracfg);
+	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
+		p = data->plat_data->pericfg_comp_str;
+		data->pericfg = syscon_regmap_lookup_by_compatible(p);
+		if (IS_ERR(data->pericfg)) {
+			ret = PTR_ERR(data->pericfg);
 			goto out_runtime_disable;
 		}
-
-		data->pericfg = infracfg;
 	}
 
 	platform_set_drvdata(pdev, data);
-- 
2.35.1


