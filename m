Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D890ECC6B16
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zKtTsd8MzhIo6AyA9SWXa1odPgIA10bRwmVL6OJsGk=; b=3+c/orS1cSa/Geu+tEuepmZ39p
	UKnpMRz1eiX6hrtHPuCqsdxP3H3rtTSwPd4ZEYDX4Fmsg+JFjn00jpsGypQHc6d8tWl4NwAAjSFss
	UN8C51zQgGalPKrN5k+ZPPL5imQ8wPiFHDVtxoUI0c5lSqMDkTVP7hJE6cBIegDcgRfPQSE+G9tzW
	UiQpvnYdVjfFCJ2vtGaBXOwi+gFrtWrFOsnXqGe5vWcqIDE6ntjx1bPCUdbe1bgIllo+xAYtRzrJy
	Lxw1eCtcZ6S9sxL+vl8xsqhEeFqo/UvmcgU5cjQFeGlIq1ZLSGHs8sdAg3tjZff+t++O4nxqpjSKX
	BmgPumJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeI4-0000000DHI8-4AJe;
	Tue, 13 Oct 2026 15:19:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHz-0000000DHAC-0hrj
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4zKtTsd8MzhIo6AyA9SWXa1odPgIA10bRwmVL6OJsGk=; b=U2Wi/G7/Z8m+v9ljeiusEde2R8
	IZJ3QMRzV4SUEEQSCF1x0eWn1NZ9k7Zhvd3K1pdP0KNUvsi2jWfgZwhIen34iCHFt2xMxXLoh412B
	ltoU/xOgbkxZF3fs7Pg/7wr75GO97hj0OiDtGtwRnFKY/DVWp/ioktR4Wxckb/NOYeKOX0z/pPc5w
	ei05Ev5JKC2s/Ghp1VYMLKoO7cUi8dRBvV6laKq5i1ptXcrRVq+zsTZ71vmusgpUN7AgFacFhLU5b
	4qQwVvUECuxM9l01XgnQ8zhpxb0N6Mm0eDrkIjZ4qGTKMp0Qrbvmu+EUnmH853jQVZUmUvy9gvKBh
	HurXzqRA==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeHv-0000000FhVM-43eP
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:38 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cd623dfe420so139845a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904774; x=1792509574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zKtTsd8MzhIo6AyA9SWXa1odPgIA10bRwmVL6OJsGk=;
        b=V6PZdzry+QPHvV0T0YHq5t2wM0OnY0ZtgZXn51N9URarKwqStFVUyaWyRkU9TJl2rM
         ZcPajuhkkQioMGwAe+/aoZDTMkNcvS/63nTiwBNY6jgaeCsbLXLbWWcA/ghkRVhiP3sq
         ZkIizfHoPEIuBmbA9V8tqHN0Yj1QSwggWFw0nMHMVaTT7bY2HaepW8sp4go8xUq3tZoX
         YbjXCGztL12IrwFwV5oZwzv8brxxxh9njJpovHyZkAi+JLpmURxKFmZylLaqCvTe8cws
         RuVFyo1WG4sOC7MzlfLOjvMmT7F/vE6MJprSh504KpdTjPGg981WCroQM0ac6ggcMDW3
         uVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904774; x=1792509574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zKtTsd8MzhIo6AyA9SWXa1odPgIA10bRwmVL6OJsGk=;
        b=yAuYPmOnwkd41mYpZ+fSWm6noY/zvgvtHuRxa/YBIENKt/QIdVlLy62bO7hei5uCTu
         m1SlaFiTerHCD42GbQcnR2CCFnUT7jLd49s4rpMYquo9O5UjfnXSwBzFzGoRnPkHxJs3
         ieVpmOIQKbMgoGs4ZPKZMBZfNPfZdx2T/Qhbl5m+QVwe+Ja9HFtNifOdoDVpatkCpde5
         i7hWzLZbxcoNgqm3gHFluLcywP4yUlnIP9Jl2iTqtG6DtffYcD+0Mx5qnUdmfLjCaxhA
         TN0DvFY2OebGLbx1Ta4lQkSNRI2tyQsYKlhQloKvcmvwXPLh9cicGNI8ER+eYrAPTSH1
         TESg==
X-Forwarded-Encrypted: i=1; AKwUvBy5iVXTbP7CjxxKWGTOCRQh1PQJt6M5BK1V2rFxjQPjKlj6ViwhqLY9XldLj2itH8SXI2s+940nt3Jsm50lfA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKIAW1LVn9PTVYbV5hHBldCPgsuF4Tq++tb6JS/0kuM4ekPGFeI
	rNz6ala57puwS51tTaG48FiXTDorqq7DDQQXgJXDEWtOrJ91ycIu4gSY
X-Gm-Gg: AYBFou35CFH22aC49dOg/EDdM+Tt0BiZXRyUJZPw2C8Xu2ep5uKonCVXWEYnFvF+Zop
	C4titvaq/YG23O153YbJaSrI1Usv2Ix4yJld4qvCgLHJ2A647k3hRPplX/qlsTXNIamiu7CiX70
	m2DJBpNBWQ6zj3ehbDV9w76E4+QrwfxI1TvNLrIXc1u94NpovWoA8VTFINZp8q/O0GdMQYKhGU0
	B6VldcaqWW1jUxgLI4L0fMDDkfXrDLdbWieWfPS3X0IP9Nq2B5P2ip643ysCcsoWP8DEc2Zp3UM
	BgDAToYyCloURKprKwA7aE86m0qbiFmTg1aDmWX6JwXxFXZXyco/ihk8IM2RlJJGNg0eQhfC9pt
	ToBPZie3AMuZ1xDgNmrRmaeymJ67JFkyF2XJueTNsezLP/axVXW9c1vYNZaPooej3AzYS3XLll7
	vp9MiMCRTjBux4s8wVm4yyK2hJiki1P3N6flvJ2PSM55n3ut1WoRa35KnvM/+dE0mIbzRl+C0ZU
	hZLkdWLFr+LtFkLzbfA+qh/Pri5dvz0lsabR2w=
X-Received: by 2002:a05:6a21:7a97:b0:3de:7854:8567 with SMTP id adf61e73a8af0-3e16bdd231bmr10680868637.12.1791904773761;
        Tue, 13 Oct 2026 08:19:33 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:31 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 16/35] clk: mediatek: mt2701: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:15 +0900
Message-ID: <20261013151734.3177690-17-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_161936_292887_878CCC3A 
X-CRM114-Status: GOOD (  20.57  )
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

The MT2701 topckgen and pericfg drivers register clock types already
supported by the common helpers, so their custom initialization
routines can be replaced with struct mtk_clk_desc.

The infracfg, apmixedsys, and audsys drivers additionally needed
CPU mux registration, PLL registration, and child-device population,
respectively. With these capabilities now supported by the common
helpers, these drivers can use mtk_clk_simple_probe() and
mtk_clk_simple_remove().

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

With the drivers converted to the common probe/remove helpers,
enable module builds by changing their Kconfig entries to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/Kconfig          |  18 +-
 drivers/clk/mediatek/clk-mt2701-aud.c |  35 +---
 drivers/clk/mediatek/clk-mt2701.c     | 233 ++++++--------------------
 3 files changed, 65 insertions(+), 221 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b059d44577f1..486024be26a6 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -19,7 +19,7 @@ config COMMON_CLK_MEDIATEK_FHCTL
 	  spread spectrum clocking features.
 
 config COMMON_CLK_MT2701
-	bool "Clock driver for MediaTek MT2701"
+	tristate "Clock driver for MediaTek MT2701"
 	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM
@@ -27,49 +27,49 @@ config COMMON_CLK_MT2701
 	  This driver supports MediaTek MT2701 basic clocks.
 
 config COMMON_CLK_MT2701_MMSYS
-	bool "Clock driver for MediaTek MT2701 mmsys"
+	tristate "Clock driver for MediaTek MT2701 mmsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 mmsys clocks.
 
 config COMMON_CLK_MT2701_IMGSYS
-	bool "Clock driver for MediaTek MT2701 imgsys"
+	tristate "Clock driver for MediaTek MT2701 imgsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 imgsys clocks.
 
 config COMMON_CLK_MT2701_VDECSYS
-	bool "Clock driver for MediaTek MT2701 vdecsys"
+	tristate "Clock driver for MediaTek MT2701 vdecsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 vdecsys clocks.
 
 config COMMON_CLK_MT2701_HIFSYS
-	bool "Clock driver for MediaTek MT2701 hifsys"
+	tristate "Clock driver for MediaTek MT2701 hifsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 hifsys clocks.
 
 config COMMON_CLK_MT2701_ETHSYS
-	bool "Clock driver for MediaTek MT2701 ethsys"
+	tristate "Clock driver for MediaTek MT2701 ethsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 ethsys clocks.
 
 config COMMON_CLK_MT2701_BDPSYS
-	bool "Clock driver for MediaTek MT2701 bdpsys"
+	tristate "Clock driver for MediaTek MT2701 bdpsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 bdpsys clocks.
 
 config COMMON_CLK_MT2701_AUDSYS
-	bool "Clock driver for Mediatek MT2701 audsys"
+	tristate "Clock driver for Mediatek MT2701 audsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports Mediatek MT2701 audsys clocks.
 
 config COMMON_CLK_MT2701_G3DSYS
-	bool "Clock driver for MediaTek MT2701 g3dsys"
+	tristate "Clock driver for MediaTek MT2701 g3dsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 g3dsys clocks.
diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
index e103121cf58e..533d35614661 100644
--- a/drivers/clk/mediatek/clk-mt2701-aud.c
+++ b/drivers/clk/mediatek/clk-mt2701-aud.c
@@ -128,6 +128,7 @@ static const struct mtk_gate audio_clks[] = {
 static const struct mtk_clk_desc audio_desc = {
 	.clks = audio_clks,
 	.num_clks = ARRAY_SIZE(audio_clks),
+	.populate_children = true,
 };
 
 static const struct of_device_id of_match_clk_mt2701_aud[] = {
@@ -136,39 +137,9 @@ static const struct of_device_id of_match_clk_mt2701_aud[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_aud);
 
-static int clk_mt2701_aud_probe(struct platform_device *pdev)
-{
-	int r;
-
-	r = mtk_clk_simple_probe(pdev);
-	if (r) {
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-		return r;
-	}
-
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		goto err_plat_populate;
-
-	return 0;
-
-err_plat_populate:
-	mtk_clk_simple_remove(pdev);
-	return r;
-}
-
-static void clk_mt2701_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static struct platform_driver clk_mt2701_aud_drv = {
-	.probe = clk_mt2701_aud_probe,
-	.remove = clk_mt2701_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-aud",
 		.of_match_table = of_match_clk_mt2701_aud,
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 710c4f2f9f30..5ea0c4acaf1b 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "clk-cpumux.h"
 #include "clk-gate.h"
@@ -655,38 +656,19 @@ static const struct mtk_gate top_clks[] = {
 		28),
 };
 
-static int mtk_topckgen_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-								clk_data);
-
-	mtk_clk_register_factors(top_fixed_divs, ARRAY_SIZE(top_fixed_divs),
-								clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt2701_clk_lock, clk_data);
-
-	mtk_clk_register_dividers(&pdev->dev, top_adj_divs, ARRAY_SIZE(top_adj_divs),
-				base, &mt2701_clk_lock, clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, top_clks,
-			       ARRAY_SIZE(top_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc topck_desc = {
+	.clks = top_clks,
+	.num_clks = ARRAY_SIZE(top_clks),
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(top_fixed_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt2701_clk_lock,
+};
 
 static const struct mtk_gate_regs infra_cg_regs = {
 	.set_ofs = 0x0040,
@@ -725,81 +707,21 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
 static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
 
-static const struct mtk_clk_rst_desc clk_rst_desc[] = {
-	/* infrasys */
-	{
-		.version = MTK_RST_SIMPLE,
-		.rst_bank_ofs = infrasys_rst_ofs,
-		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
-	},
-	/* pericfg */
-	{
-		.version = MTK_RST_SIMPLE,
-		.rst_bank_ofs = pericfg_rst_ofs,
-		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
-	},
+static const struct mtk_clk_rst_desc infra_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = infrasys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
-static void __init mtk_infrasys_init_early(struct device_node *node)
-{
-	int r, i;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return;
-
-		for (i = 0; i < CLK_INFRA_NR; i++)
-			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-	}
-
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-						infra_clk_data);
-
-	mtk_clk_register_cpumuxes(NULL, node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
-				  infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-}
-CLK_OF_DECLARE_DRIVER(mtk_infra, "mediatek,mt2701-infracfg",
-			mtk_infrasys_init_early);
-
-static int mtk_infrasys_init(struct platform_device *pdev)
-{
-	int r, i;
-	struct device_node *node = pdev->dev.of_node;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return -ENOMEM;
-	} else {
-		for (i = 0; i < CLK_INFRA_NR; i++) {
-			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
-		}
-	}
-
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), infra_clk_data);
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-						infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[0]);
-
-	return 0;
-}
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.factor_clks = infra_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_fixed_divs),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &infra_rst_desc,
+};
 
 static const struct mtk_gate_regs peri0_cg_regs = {
 	.set_ofs = 0x0008,
@@ -883,36 +805,20 @@ static const struct mtk_composite peri_muxs[] = {
 		0x40c, 3, 1),
 };
 
-static int mtk_pericfg_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-			       ARRAY_SIZE(peri_clks), clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, peri_muxs,
-				    ARRAY_SIZE(peri_muxs), base,
-				    &mt2701_clk_lock, clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[1]);
+static const struct mtk_clk_rst_desc peri_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = pericfg_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
+};
 
-	return 0;
-}
+static const struct mtk_clk_desc pericfg_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+	.composite_clks = peri_muxs,
+	.num_composite_clks = ARRAY_SIZE(peri_muxs),
+	.rst_desc = &peri_rst_desc,
+	.clk_lock = &mt2701_clk_lock,
+};
 
 #define MT8590_PLL_FMAX		(2000 * MHZ)
 #define CON0_MT8590_RST_BAR	BIT(27)
@@ -968,74 +874,41 @@ static const struct mtk_fixed_factor apmixed_fixed_divs[] = {
 	FACTOR(CLK_APMIXED_HDMI_REF, "hdmi_ref", "tvdpll", 1, 1),
 };
 
-static int mtk_apmixedsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, apmixed_plls, ARRAY_SIZE(apmixed_plls),
-								clk_data);
-	mtk_clk_register_factors(apmixed_fixed_divs, ARRAY_SIZE(apmixed_fixed_divs),
-								clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc apmixedsys_desc = {
+	.plls = apmixed_plls,
+	.num_plls = ARRAY_SIZE(apmixed_plls),
+	.factor_clks = apmixed_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(apmixed_fixed_divs),
+};
 
 static const struct of_device_id of_match_clk_mt2701[] = {
 	{
 		.compatible = "mediatek,mt2701-topckgen",
-		.data = mtk_topckgen_init,
+		.data = &topck_desc,
 	}, {
 		.compatible = "mediatek,mt2701-infracfg",
-		.data = mtk_infrasys_init,
+		.data = &infracfg_desc,
 	}, {
 		.compatible = "mediatek,mt2701-pericfg",
-		.data = mtk_pericfg_init,
+		.data = &pericfg_desc,
 	}, {
 		.compatible = "mediatek,mt2701-apmixedsys",
-		.data = mtk_apmixedsys_init,
+		.data = &apmixedsys_desc,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2701);
 
-static int clk_mt2701_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt2701_drv = {
-	.probe = clk_mt2701_probe,
 	.driver = {
 		.name = "clk-mt2701",
 		.of_match_table = of_match_clk_mt2701,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
-
-static int __init clk_mt2701_init(void)
-{
-	return platform_driver_register(&clk_mt2701_drv);
-}
-
-arch_initcall(clk_mt2701_init);
+module_platform_driver(clk_mt2701_drv);
 
 MODULE_DESCRIPTION("MediaTek MT2701 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


