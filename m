Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi2EH+sEIo7YgvGqgpWaxlJE57Ad6htt2jkql2mY3bs=; b=VKU74KTjhvit1n
	uTEHhOj7Danq9uOz6I0hHPJ6apv+KtBWknlEUxqDtH8tzbLQZ5Ht5pPKuOlukYL/zAOSrTyyWxpQ2
	0XQN4ZXjCEsd5r2jL72xGWopyo9R2r5ltQ7iD4s1kEhQZYoyq0z0Eb+TSC3Oad2Kz0ZoF0b/HhRPz
	o3kZB28ZUyfvVLej2/3JJHasqiU7T/5C+Uiv3//+g2KU13HZLs1U/0CA4d7KhI7HC/OvRdkd2bTpU
	1cWGCeMRc3K57yus/ayvA4rg8qXHyxTMprt5kfFkb9ud6HUkuw8uzc5fuIqJWSmJqeKub6V2dNIjE
	YKr6601SY4t+mq1mXmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF6b-000sZI-DX; Thu, 09 Jun 2022 10:09:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5I-000rji-LX; Thu, 09 Jun 2022 10:08:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3686C66017C8;
	Thu,  9 Jun 2022 11:08:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654769289;
	bh=7NH0zCAnj6DTlLIJ/fPDdoJP+dAMJTzS1hu071yicYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GyKAfIQh74M6E0tS7YI+WWQ8i656pqE/dLB+PGHHNhMJCyezDxe/wNPQTf6/Z1Lb6
	 2nOCQ8aQAScMRdbalLEvlepTF4pmn+kYGgE+z9wo7GaA1j7ZTgfUZtTUCDRjtnd1ma
	 xiPp1BQ9iM8iXzXh/qZy65LX8UXNXukkqgoeWsUofAN/8jwlGCSI1KOD9UxVRxcE2V
	 +HpUPseyFCLwBBIAT5VfImJBx9zVRN6VanQ1fqtE0c3i7pW5Q//ovmvcJmuP8UGoNC
	 UcoNwTeiCV2evdJxw8041q5e12xpGLvwPgZTVi7//4c2+RnClJy3RHqvcr0kYmoh4h
	 5MX9E1q6M/9zw==
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 2/6] iommu: mtk_iommu: Lookup phandle to retrieve syscon to infracfg
Date: Thu,  9 Jun 2022 12:07:58 +0200
Message-Id: <20220609100802.54513-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_030812_923682_D7D4F88B 
X-CRM114-Status: GOOD (  14.12  )
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
way is kept in place.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bb9dd92c9898..90685946fcbe 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1140,22 +1140,32 @@ static int mtk_iommu_probe(struct platform_device *pdev)
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
