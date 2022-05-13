Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnrLpTzkkqo3B5fzsy5w6+kBD8DqGZujeKJDxPSJQwI=; b=RSn1EG4E9n2wcy
	0HtYcxNiUCFukFWI6yWlPaplGdIJjx+XSnEvGStJzSufwbE+b9UU8e+3MoAGwzg+cGNkz8lvcaZZ0
	s6updV2+O9+AJk3x8j/jekdK91Zo/4elxjtOu5+r1bmV6WLX12h9L+60uo/l+H+FXYnn/dc/B7UxM
	tRYXyYAInLS7ksxKC46LS5y6kdIS1lzpF2HTfHY3N1nNAfl4dy/jtpZZMIs1thOUKnnBivrbHrKZo
	C+YPQ0dbi+8ssd80/hoReqJGtXQ15fk6gdjs3FS4Y8h/prhTW5lanad3WZXQlin8DfThvm53VXtRO
	7fXoZPC0uqTeCJ+TZpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWsv-00GZmK-Ho; Fri, 13 May 2022 15:07:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWsM-00GZXH-D3; Fri, 13 May 2022 15:06:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6B08F1F46200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652454401;
 bh=2STmw6v8hkww0bHvhGplsN489bcQo+IXZ6xIqRe3iT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lfEvo1ogZDdvmXZ2aueGuadhkgjfdpb8tbDa8dUB2K5KnAUpcC9vuXUlAbxDDE1S2
 J42AmWgdYSJgJw4h/A5/sYauviyE7+UEVMLBQ30kdbUV+DoabNBBCFt+9swuLChLVs
 Shu2djhJhqOTht87zoXD0jyZi0uixuWB6Rdu4VANRy+2VVKeQh0rQ9QitEDLyqQKVY
 bsgjes2NZpc4f4/xMjU3971JAZUrYhKnwNKhRQC/tKlJlCq4RYxIobCxR6CEokf+HG
 SM4CHwjldU09PoBMzY2qXS9WBtRlonx6AE9M18ZIS5/G/KGiG+35+7Y9FZaFmMqHaS
 YgYmQ3Pr6K4kA==
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
Subject: [PATCH v2 2/2] memory: mtk-smi: Add support for MT6795 Helio X10
Date: Fri, 13 May 2022 17:06:33 +0200
Message-Id: <20220513150633.387200-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
References: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_080642_629375_B62E4B9B 
X-CRM114-Status: GOOD (  11.68  )
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
 drivers/memory/mtk-smi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 86a3d34f418e..7e7c3ede19e4 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -21,11 +21,13 @@
 /* SMI COMMON */
 #define SMI_L1LEN			0x100
 
+#define SMI_L1_ARB			0x200
 #define SMI_BUS_SEL			0x220
 #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
 /* All are MMU0 defaultly. Only specialize mmu1 here. */
 #define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
 
+#define SMI_FIFO_TH0			0x230
 #define SMI_M4U_TH			0x234
 #define SMI_FIFO_TH1			0x238
 #define SMI_FIFO_TH2			0x23c
@@ -360,6 +362,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
 	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
 	{.compatible = "mediatek,mt6779-smi-larb", .data = &mtk_smi_larb_mt6779},
+	{.compatible = "mediatek,mt6795-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8167-smi-larb", .data = &mtk_smi_larb_mt8167},
 	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
@@ -541,6 +544,13 @@ static struct platform_driver mtk_smi_larb_driver = {
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
@@ -565,6 +575,12 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
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
@@ -609,6 +625,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
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
