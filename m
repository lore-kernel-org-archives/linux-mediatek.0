Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42567C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScYt492+/gaB1NtkESoHr3aX5yd0bLeAH28FOuD+QOE=; b=GuDouAqELtBwH6ec8g9Zlewio7
	ot91yu8TbcLAmbg3Gro2/QNesa8cERdf2uqHRg6+/WypH9xghxKQS2LI/4EB7MBN5qRAeOobTrFxS
	pbEiXCtG1byFTorf/Css1/u/BJShrF8UnY1ZIUYLe0FuLeNwaom5SMst3ayObiFacue+akOECvRvW
	EAOp5/SmAg37DJiWqQDQRnPE92q+DbbS+/kOmOqa0DNPd+9JaDgWL7qYkZLMrMJ55xMp/pRJc32eB
	mwaJKYZiof5p6nPndnewcLAyqkDYVDdu37lW++05YkSs6N49lHKXtYJhP6eLoxvf4QYC9qHtgEdDL
	axs+krCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4zN-009x08-Cb; Tue, 13 Sep 2022 12:26:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4y7-009wHg-CC; Tue, 13 Sep 2022 12:24:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A9664660201B;
	Tue, 13 Sep 2022 13:24:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663071885;
	bh=Upr1CZnAlEt+3JwKmYKTBI9Ip2x7C+ZicowckZI35Q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWwHhBThJmMRW4dl0ji3MMgDUZ79XURrkUYNaOFL4tKCpmZtJriyWMMuAp5PVDcqE
	 cVZuoAx48PqJFgi57C58hq+1J8lUGRndeZOlfhFkODqJdjkxRpUPeYHMzzrXtBulFO
	 s7HPh3J5wqwp7+7hjbCge7DaGi1M+yg3xRA39cppv/I0HMQhPJVFBMFWRXuXJsZrww
	 bVArS2Tp4C6Ss7iYKS1nC9l4GuHU3Ml0BKyae7JGYcvvaSZsE2dR5zGYgDEi+7zCYj
	 A6PwXchJoBLfcf+FuTkEuQbZRL8juoPd8P9N5Y6sTnNCrDNnU9mSCCrSGzcsjpz5Nb
	 xqbV8LZroFcEQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: joro@8bytes.org
Cc: yong.wu@mediatek.com,
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
Subject: [PATCH v5 2/3] iommu/mediatek: Introduce new flag TF_PORT_TO_ADDR_MT8173
Date: Tue, 13 Sep 2022 14:24:27 +0200
Message-Id: <20220913122428.374280-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913122428.374280-1-angelogioacchino.delregno@collabora.com>
References: <20220913122428.374280-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_052449_782339_A89E3D7E 
X-CRM114-Status: GOOD (  16.73  )
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
 drivers/memory/mtk-smi.c  | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 7e363b1f24df..b511359376f4 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -138,6 +138,7 @@
 #define PM_CLK_AO			BIT(15)
 #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
 #define PGTABLE_PA_35_EN		BIT(17)
+#define TF_PORT_TO_ADDR_MT8173		BIT(18)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -955,7 +956,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int ban
 	 * Global control settings are in bank0. May re-init these global registers
 	 * since no sure if there is bank0 consumers.
 	 */
-	if (data->plat_data->m4u_plat == M4U_MT8173) {
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, TF_PORT_TO_ADDR_MT8173)) {
 		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
 			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
 	} else {
@@ -1427,7 +1428,8 @@ static const struct mtk_iommu_plat_data mt8167_data = {
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
-			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM,
+			HAS_LEGACY_IVRP_PADDR | MTK_IOMMU_TYPE_MM |
+			TF_PORT_TO_ADDR_MT8173,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.banks_num    = 1,
 	.banks_enable = {true},
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 5a9754442bc7..cd415ed1f4ca 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -462,6 +462,7 @@ static int mtk_smi_larb_sleep_ctrl_enable(struct mtk_smi_larb *larb)
 	if (ret) {
 		/* TODO: Reset this larb if it fails here. */
 		dev_err(larb->smi.dev, "sleep ctrl is not ready(0x%x).\n", tmp);
+		ret = -EAGAIN;
 	}
 	return ret;
 }
-- 
2.37.2


