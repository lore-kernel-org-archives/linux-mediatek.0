Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RODskyPlFpg/em2BeR9PJAgihl2AYyUzHodlZ5i80Q=; b=3QCgfoUaYQvvP8p9P+bKP2Je0h
	2HPKe7pBNE4VRNCPMU/rdOGudM/ZeoFvqQ4pXCrDdxMI+y3aD2ZGRvNmARcDOkybo1/QuUmlQvn4z
	atK+rpOxKSlx845YGy8JuJEetAbdjU9QyJh4878CAy6mGa+8RJN/H+1KeGJDlbplOqgg9KkUcmyK0
	tPpaLIJ+KXB0atvq3EoTueiR9NcjPWfkOPA6Z+WKKgP5HM1UZojwB+9vh9ckN8vDyJwpSEmZ0NhIO
	OjF0HnSgo1NFqd6oT8ywYAos1YNJLnbdLtU61XvQTdZ99YV7BNuVPaPzRM+x4JpUcQpOzEbyek0qs
	WmyicDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g7u-001b7s-W3; Fri, 24 Jun 2022 10:01:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g75-001aga-2A; Fri, 24 Jun 2022 10:00:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D049D66017FE;
	Fri, 24 Jun 2022 11:00:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656064829;
	bh=SNuQZ82iPD6n2FU8HWxWSruVLQ1bEVP9FnwStuIlpP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAoW0KQSbiyAYG1OI9ZLLKg7IzOdt008RS5YelHKJTBsEpwovOstw2FEvqRyiRbrU
	 rXmKSOscne4OfLZpaPbJ9IvhT/Ro9MUI3dAiTYlq0Y5cz9IVwXuRyO5brX+6Yxdprb
	 SA30vY6YhIZ0EcmsxDctQ+8ZtQsw2+OzlW7+FR0br27aqudwXk+pdFStLlrJcNs48w
	 7cE8vDvnEzBWM7m2kR7oYTFKEuuRo4GBKPxNB7mga9SkP1jNK5PtxiuUw9/E4tMLgA
	 whSYSfNkOBJB1+66SB10AAj3djfnIWzlqCBbcUsjqGqVfKjAgyHjdCKd2/TnnZ3Ubq
	 3/zS/5TpMS3Uw==
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
Subject: [PATCH v4 2/3] iommu/mediatek: Introduce new flag TF_PORT_TO_ADDR_MT8173
Date: Fri, 24 Jun 2022 12:00:15 +0200
Message-Id: <20220624100016.246442-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624100016.246442-1-angelogioacchino.delregno@collabora.com>
References: <20220624100016.246442-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_030031_294214_19B1BC47 
X-CRM114-Status: GOOD (  14.47  )
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

In preparation for adding support for MT6795, add a new flag named
TF_PORT_TO_ADDR_MT8173 and use that instead of checking for m4u_plat
type in mtk_iommu_hw_init() to avoid seeing a long list of m4u_plat
checks there in the future.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b2ae84046249..63df612cf2e0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -138,6 +138,7 @@
 /* PM and clock always on. e.g. infra iommu */
 #define PM_CLK_AO			BIT(15)
 #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
+#define TF_PORT_TO_ADDR_MT8173		BIT(17)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -959,7 +960,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int ban
 	 * Global control settings are in bank0. May re-init these global registers
 	 * since no sure if there is bank0 consumers.
 	 */
-	if (data->plat_data->m4u_plat == M4U_MT8173) {
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, TF_PORT_TO_ADDR_MT8173)) {
 		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
 			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
 	} else {
@@ -1432,7 +1433,8 @@ static const struct mtk_iommu_plat_data mt8167_data = {
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
-			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
+			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM |
+			TF_PORT_TO_ADDR_MT8173,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.banks_num    = 1,
 	.banks_enable = {true},
-- 
2.35.1


