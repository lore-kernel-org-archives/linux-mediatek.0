Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A162C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtiNgJ7kY/nvOmMCluA9n7hTzWgq00LWcB3asNfLFyQ=; b=3wufrHQGheNx6U
	qYyW+w5/0gnl1Vr321GWQTOEoi5WXUAIQjDZMTxp2Iq5X1JCmfdAvaZR4qECeYUbGOH8Kg0R6dlkN
	X/0ccKqCkkMquGL82wdNuEwF/7lIn2ejcA/uEqYUEiFAlTKuQiqx8rPrODhBJkR50A3zZvojBeDhd
	6CdvqveTgjQCWsUGqRJxmlEvH/yoiSc4wmTgWMg8fv+mW7ufKyU8LrKV2HVQ8wOXAnSj6t6OD/VP/
	srqjts4V0d0tq4OG5f5JNN9+pupg/aeUDeSkRW12JPjzrA+dRjLkLizmvnoPXk8z8liuJsnIeKS4f
	9+IUMP0Do8FjQ74fq8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWnm-00GYNs-A2; Fri, 13 May 2022 15:01:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWnH-00GY9t-OO; Fri, 13 May 2022 15:01:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B06F21F461F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652454086;
 bh=C7g/YIivTlj7b7ruogy140NNk2zb7ocp/cZGcwMvQPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ToKv7QqmuybEpU4Q/8BcWQJ1htrcZ1cf5GC+WcaVCDFMps+VCS2c/pQi4RJBKoI4i
 DaB4qcTtOU7Zg9zxWBOvKyitV8Dqlb//9QOMOoIYinF8YZ2eVckhKii6PF8ZGiX+25
 YEdgTBaXI0qYohi4ed2+eKkuI4DEx0XLJDrx2ljDoYELybv1GtiPNzyheDQQtVFF+V
 I7O0Ym2Q6yXAeXS5LnkDt5tB5yz6NxJhslj8PztsAwF9N8nI2Yo0xyEj5iDP8+BiKN
 sboUctM9Ku7c1tfcDvfYCbpPOT7/JPySr2DrbvzeRBRHWbMH2jeFFTZlN/TvsqcDnr
 ffXbiozBGc8Qg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] memory: mtk-smi: Add support for MT6795 Helio X10
Date: Fri, 13 May 2022 17:01:16 +0200
Message-Id: <20220513150116.349744-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513150116.349744-1-angelogioacchino.delregno@collabora.com>
References: <20220513150116.349744-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_080127_962872_931F8B8F 
X-CRM114-Status: GOOD (  11.00  )
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

The MediaTek Helio X10 (MT6795) SoC has 5 LARBs and one common SMI
instance without any sub-common and without GALS.

While the smi-common configuration is specific to this SoC, on the
LARB side, this is similar to MT8173, in the sense that it doesn't
need the port in LARB, and the register layout is also compatible
with that one, which makes us able to fully reuse the smi-larb
platform data struct that was introduced for MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/memory/mtk-smi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 86a3d34f418e..5c6d6ef36572 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -360,6 +360,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
 	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
 	{.compatible = "mediatek,mt6779-smi-larb", .data = &mtk_smi_larb_mt6779},
+	{.compatible = "mediatek,mt6795-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8167-smi-larb", .data = &mtk_smi_larb_mt8167},
 	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
@@ -541,6 +542,13 @@ static struct platform_driver mtk_smi_larb_driver = {
 	}
 };
 
+static const struct mtk_smi_reg_pair mtk_smi_common_mt6795_init[SMI_COMMON_INIT_REGS_NR] = {
+	{SMI_L1_ARB, 0x1b},
+	{SMI_M4U_TH, 0xce810c85},
+	{SMI_FIFO_TH1, 0x43214c8},
+	{SMI_FIFO_TH0, 0x191f},
+};
+
 static const struct mtk_smi_reg_pair mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
 	{SMI_L1LEN, 0xb},
 	{SMI_M4U_TH, 0xe100e10},
@@ -565,6 +573,12 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
 		    F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt6795 = {
+	.type	  = MTK_SMI_GEN2,
+	.bus_sel  = BIT(0),
+	.init     = mtk_smi_common_mt6795_init,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -609,6 +623,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
 	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt6779-smi-common", .data = &mtk_smi_common_mt6779},
+	{.compatible = "mediatek,mt6795-smi-common", .data = &mtk_smi_common_mt6795},
 	{.compatible = "mediatek,mt8167-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
