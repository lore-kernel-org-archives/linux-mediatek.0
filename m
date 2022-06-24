Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB47CCA473
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxPYwYxuzIB2lspJFpIbIV+URIK0IGlGuBwbMwtHjJ4=; b=s0CdgDJCWmWkVF6HX05mz35zkT
	CKUCc10mHGFDAcwI2i2u+xWmuYDfEs2T1mKeM3XUE8xxqTdulQtgZO7zeglKsc23Z65MbQM6OoyPS
	hFz+9ZVJssRNiEEriZL17X3tTgvX0Oc6BnfuJzUzNAuw32OvTuo3Lbo+9E3YkOnEykXh73IzzqoGW
	j7AlVBM5+3IaKICOkHMf5ibAvmuv1rx2xiYt079q5MS3xAU2Y/dPJhaqjZl66F/jLiK3i84Vdf0OY
	yupxxkk65aMC5dt9Hy1bKh+CDp6lb+obsP9AKApJBXPGIjFhBkFTRnS0xqm7e2Hlqn1hmDUCGsyLY
	g6ssOmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g8B-001bJO-Rq; Fri, 24 Jun 2022 10:01:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g76-001ahA-0u; Fri, 24 Jun 2022 10:00:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C668C66017FF;
	Fri, 24 Jun 2022 11:00:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656064830;
	bh=J0LbHH8P+ASApYmsYhsNx95/wSGxhHDFIBcm2kP0y+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZYner7Ocf1klmF+QAW3PT0bFy8OFw8nogLlK/7RDiguhlqtOm6nM6gvJZZOhdmk6L
	 9y2sODvA3BwCpoahueUJiexAzIhljBUipbriNf2HESs9ZhAv4RAzx3Hsd5Q2w0kald
	 A43BbKALW+Gq/qsjDwsX6g6gnXfEauPNcWk0pqMzzwWHeECJ0GRXFYYNaM2kgygFwP
	 f2WSBQCS7u+nXOPQ+eAL5P7oppWxAeTD0xgGUISi8dqIxIvBATFIAaI+/UkBg31U1s
	 nHirbnM2YGa/DTn1up3HJa0KTfokhkb7TA7apZbSLp/UKAUJ7+i+VktlkMfc6kNeOx
	 LT512uLGkRpbQ==
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
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 3/3] iommu/mediatek: Add support for MT6795 Helio X10 M4Us
Date: Fri, 24 Jun 2022 12:00:16 +0200
Message-Id: <20220624100016.246442-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624100016.246442-1-angelogioacchino.delregno@collabora.com>
References: <20220624100016.246442-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_030032_269494_DCCBF4C9 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

Add support for the M4Us found in the MT6795 Helio X10 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 63df612cf2e0..82eba647c183 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -158,6 +158,7 @@
 enum mtk_iommu_plat {
 	M4U_MT2712,
 	M4U_MT6779,
+	M4U_MT6795,
 	M4U_MT8167,
 	M4U_MT8173,
 	M4U_MT8183,
@@ -1419,6 +1420,19 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
 };
 
+static const struct mtk_iommu_plat_data mt6795_data = {
+	.m4u_plat     = M4U_MT6795,
+	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
+			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM |
+			TF_PORT_TO_ADDR_MT8173,
+	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
+	.banks_num    = 1,
+	.banks_enable = {true},
+	.iova_region  = single_domain,
+	.iova_region_nr = ARRAY_SIZE(single_domain),
+	.larbid_remap = {{0}, {1}, {2}, {3}, {4}}, /* Linear mapping. */
+};
+
 static const struct mtk_iommu_plat_data mt8167_data = {
 	.m4u_plat     = M4U_MT8167,
 	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
@@ -1531,6 +1545,7 @@ static const struct mtk_iommu_plat_data mt8195_data_vpp = {
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
+	{ .compatible = "mediatek,mt6795-m4u", .data = &mt6795_data},
 	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
-- 
2.35.1


