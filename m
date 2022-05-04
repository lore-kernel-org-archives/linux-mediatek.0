Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D662C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raRVNw2UWHRTSDvFzjXx+rd+BTYcGSCG3M+3Dex7fJE=; b=WoKrbG+y9hqT7z
	IilkwHujJl/K5TqtHWGWp4lT34TJGeIWdIP4qMHLRPRkBXOuQuYLXvFz+vjfz3HaHpo+gFrZCXoRV
	CJARlQRLUA4knANyVCltmMzTdg+ZrGjeLfRJtJho7OXQdCVSSHW4SBrTFa+RyJ6pRevFjXc9g5jan
	pkDEBTmxs5pUWTRvHGZX/6nIUI7+xDBTKLR5SCVBVyQPWldheOGAhH6f/ufykPZJHsIIergxc0fr4
	gfd0VoWz1KDrWAjAAYZ9OyjgW+rYa4rqGw2DBZmaScHXtIqvO/W1LKPBkz1pD3IPKW4Vtg1Krgwru
	Kx4DxI5SzB+10++Gib0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEGB-00Am7Z-9D; Wed, 04 May 2022 12:37:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEBw-00Ajfw-LP; Wed, 04 May 2022 12:33:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id kq17so2602226ejb.4;
 Wed, 04 May 2022 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oBISr3CZQqGcdCjvRVbXiYWtS6ToMPWn6L1o4go4QLA=;
 b=qlFSPsKMg6Pg+xqGsaVWBtz6kLGClPntmdrQKCtiGYn2Km5rzLw4vdnHmpYJRQR0TA
 WS08ngbPf7TK4NjqvvQMTuhFV4nf0h4hA62VAPjCr/X6AOZvJUHm+3kqLupaMeWLjBaZ
 Msy0yQKk71fxUe4P4AqKq2dLNKcrdqwsdheslTTMlu4zO6I58fzeLN48WVDYebdFnPq6
 KxgfsRpxilMj76St4qilt1ELN5kQkGuz2YaRHQSYEIKYckG4ZTSEDiHUWOclljJLRubS
 Etyg1Qw3GKloCRllmkflWQR7YGNoTl2QI1oaMvMS6/L6MYzvZQXMSr+B+KdBewwYdxRF
 f9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oBISr3CZQqGcdCjvRVbXiYWtS6ToMPWn6L1o4go4QLA=;
 b=hMOzJF5NMCYMjN12dTDiCF2d8N7rDw1/k10zS5bQaFUsjOVrudOuNdmOovc2ZA7CHK
 mrW7WIk3MzLnpyyUvJulmfS7/hxjPsSeTIHjJkkM251/2B4MpM6hzQ3k0uVb64CApZ2S
 8BNoOSnQ3sIpvQCHe7ukOtelPA5jZ4/aEnEIEvFnpeE+0+OLM9fEDbzePRFQdaOeQQpY
 9uFDFuJpWWVohJMZRwtsJ0+SPr8OYw1vOLQb2iIDzI9kFFtsq3sRF/z00MaBetsAsv0k
 E3pIayZbFM9xFBWZGNT1rY9C0QpL9Ihj7TbGYOdsW0/wQEOaj/+bar5UTK5/kp/Y4hsT
 AkMA==
X-Gm-Message-State: AOAM532JpCtbECrTVfWo3xCzBro+9t5kJRtHc1LP+Ru4V96ehrG4GQgG
 LD46DBey2/ChnuDVDgPmMwQ=
X-Google-Smtp-Source: ABdhPJzhH9mftAskdv28qpFFDeFdarqLbrsYcwEXevajGrJy6gxGdaY2Bd/IhcfZUhKdyHrgYAmLBA==
X-Received: by 2002:a17:907:9958:b0:6e7:f67a:a1e7 with SMTP id
 kl24-20020a170907995800b006e7f67aa1e7mr19398668ejc.400.1651667595412; 
 Wed, 04 May 2022 05:33:15 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:33:15 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/13] clk: mediatek: Add driver for MT6735 infracfg
Date: Wed,  4 May 2022 16:26:01 +0400
Message-Id: <20220504122601.335495-13-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053316_775171_2972B365 
X-CRM114-Status: GOOD (  23.49  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a driver for MT6735 infracfg clock gates and resets.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 MAINTAINERS                                |   1 +
 drivers/clk/mediatek/Kconfig               |   7 +
 drivers/clk/mediatek/Makefile              |   1 +
 drivers/clk/mediatek/clk-mt6735-infracfg.c | 265 +++++++++++++++++++++
 4 files changed, 274 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d9d6449f910e..8662f12f34a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12443,6 +12443,7 @@ L:	linux-clk@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/clk/mediatek/clk-mt6735-apmixed.c
+F:	drivers/clk/mediatek/clk-mt6735-infracfg.c
 F:	drivers/clk/mediatek/clk-mt6735-topckgen.c
 F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 7c19e2d7bb02..62195e5d90a0 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -124,6 +124,13 @@ config COMMON_CLK_MT6735_APMIXED
 	help
 	  This driver supports MediaTek MT6735 apmixedsys clocks.
 
+config COMMON_CLK_MT6735_INFRACFG
+	tristate "Clock driver for MediaTek MT6735 infracfg"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	help
+	  This driver supports MediaTek MT6735 infracfg clocks and resets.
+
 config COMMON_CLK_MT6735_TOPCKGEN
 	tristate "Clock driver for MediaTek MT6735 topckgen"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index e8e892c4145f..e5c1da6e2711 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o clk-cpumux.o reset.o clk-mux.o
 
 obj-$(CONFIG_COMMON_CLK_MT6735_APMIXED) += clk-mt6735-apmixed.o
+obj-$(CONFIG_COMMON_CLK_MT6735_INFRACFG) += clk-mt6735-infracfg.o
 obj-$(CONFIG_COMMON_CLK_MT6735_TOPCKGEN) += clk-mt6735-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT6765) += clk-mt6765.o
 obj-$(CONFIG_COMMON_CLK_MT6765_AUDIOSYS) += clk-mt6765-audio.o
diff --git a/drivers/clk/mediatek/clk-mt6735-infracfg.c b/drivers/clk/mediatek/clk-mt6735-infracfg.c
new file mode 100644
index 000000000000..ce1a5739b3b2
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6735-infracfg.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mediatek,mt6735-infracfg.h>
+
+#define INFRA_RST0			0x30
+#define INFRA_GLOBALCON_PDN0		0x40
+#define INFRA_PDN1			0x44
+#define	INFRA_PDN_STA			0x48
+
+struct mt6735_infracfg {
+	struct clk_onecell_data *clk_data;
+	struct mtk_reset *reset_data;
+};
+
+static struct mtk_gate_regs infra_cg_regs = {
+	.set_ofs = INFRA_GLOBALCON_PDN0,
+	.clr_ofs = INFRA_PDN1,
+	.sta_ofs = INFRA_PDN_STA,
+};
+
+static const struct mtk_gate infracfg_gates[] = {
+	{
+		.id = DBGCLK,
+		.name = "dbgclk",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 0,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = GCE,
+		.name = "gce",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 1,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = TRBG,
+		.name = "trbg",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 2,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = CPUM,
+		.name = "cpum",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 3,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = DEVAPC,
+		.name = "devapc",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 4,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = AUDIO,
+		.name = "audio",
+		.parent_name = "aud_intbus_sel",
+		.regs = &infra_cg_regs,
+		.shift = 5,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = GCPU,
+		.name = "gcpu",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 6,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = L2C_SRAM,
+		.name = "l2csram",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 7,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = M4U,
+		.name = "m4u",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 8,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = CLDMA,
+		.name = "cldma",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 12,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = CONNMCU_BUS,
+		.name = "connmcu_bus",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 15,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = KP,
+		.name = "kp",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 16,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = APXGPT,
+		.name = "apxgpt",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 18,
+		.ops = &mtk_clk_gate_ops_setclr,
+		.flags = CLK_IS_CRITICAL
+	},
+	{
+		.id = SEJ,
+		.name = "sej",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 19,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = CCIF0_AP,
+		.name = "ccif0ap",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 20,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = CCIF1_AP,
+		.name = "ccif1ap",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 21,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = PMIC_SPI,
+		.name = "pmicspi",
+		.parent_name = "pmicspi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 22,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+	{
+		.id = PMIC_WRAP,
+		.name = "pmicwrap",
+		.parent_name = "axi_sel",
+		.regs = &infra_cg_regs,
+		.shift = 23,
+		.ops = &mtk_clk_gate_ops_setclr
+	},
+};
+
+int clk_mt6735_infracfg_probe(struct platform_device *pdev)
+{
+	void __iomem *base;
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	struct mt6735_infracfg *infracfg;
+	int ret;
+
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	infracfg = devm_kmalloc(&pdev->dev, sizeof(struct mt6735_infracfg),
+				GFP_KERNEL);
+	if (!infracfg)
+		return -ENOMEM;
+
+	infracfg->clk_data = mtk_alloc_clk_data(ARRAY_SIZE(infracfg_gates));
+	if (!infracfg->clk_data)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, infracfg);
+
+	ret = mtk_clk_register_gates_with_dev(pdev->dev.of_node, infracfg_gates,
+					      ARRAY_SIZE(infracfg_gates),
+					      infracfg->clk_data, &pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register gates: %pe\n",
+			ERR_PTR(ret));
+		goto free_clk_data;
+	}
+
+	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
+				  infracfg->clk_data);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register clock provider: %pe\n",
+			ERR_PTR(ret));
+		goto unregister_gates;
+	}
+
+	infracfg->reset_data = mtk_register_reset_controller(pdev->dev.of_node,
+							     1, INFRA_RST0);
+	if (IS_ERR(infracfg->reset_data)) {
+		dev_err(&pdev->dev, "Failed to register reset controller: %pe\n",
+			infracfg->reset_data);
+		return PTR_ERR(infracfg->reset_data);
+	}
+
+	return 0;
+
+unregister_gates:
+	mtk_clk_unregister_gates(infracfg_gates, ARRAY_SIZE(infracfg_gates),
+				 infracfg->clk_data);
+free_clk_data:
+	mtk_free_clk_data(infracfg->clk_data);
+
+	return ret;
+}
+
+int clk_mt6735_infracfg_remove(struct platform_device *pdev)
+{
+	struct mt6735_infracfg *infracfg = platform_get_drvdata(pdev);
+
+	mtk_unregister_reset_controller(infracfg->reset_data);
+	of_clk_del_provider(pdev->dev.of_node);
+	mtk_clk_unregister_gates(infracfg_gates, ARRAY_SIZE(infracfg_gates),
+				 infracfg->clk_data);
+	mtk_free_clk_data(infracfg->clk_data);
+
+	return 0;
+}
+
+static const struct of_device_id of_match_mt6735_infracfg[] = {
+	{ .compatible = "mediatek,mt6735-infracfg" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt6735_infracfg = {
+	.probe = clk_mt6735_infracfg_probe,
+	.remove = clk_mt6735_infracfg_remove,
+	.driver = {
+		.name = "clk-mt6735-infracfg",
+		.of_match_table = of_match_mt6735_infracfg,
+	},
+};
+module_platform_driver(clk_mt6735_infracfg);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("Mediatek MT6735 infracfg clock and reset driver");
+MODULE_LICENSE("GPL");
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
