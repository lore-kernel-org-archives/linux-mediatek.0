Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020EECC6B12
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=; b=3G+99lePqrX4TA8+mp8NKc7bTk
	v06rJXI+TymDR8+cd+8SlpgolCynik9ZL42Y5jqeWgqt2sB4SPaNhK9SDELm4HbVqNWAx5/L3JcZQ
	/EfjTqQPCGFj/3P0TztNRzrhmg74JpUtwtajhLufA35akmhyQ00n8k2rRSCN5XnDh/MJ8Op3uwfFH
	1fntwG/WbK5HjPmu9FMSTuhjzfcv9GpNQhT3rnoPcfuPlYUIeWmgjOJEXXPWTwlpDqez5s8YWDW7l
	tdU+WgJIHtbuwqs2YMBFfihh5YootMjC2CI3BIECcVdImLvTGuDhgv0RMxJXexe96xqb3WPM0XmiZ
	ylZlunbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKI-0000000DJ3k-3wdI;
	Tue, 13 Oct 2026 15:22:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJ7-0000000DIC5-0YBj
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=; b=LvFD2BAY6YyjNIksr8I4dN+24X
	JLj9SXb/k167AznZCsoHRIOP48NKCASLV5CDZdxiKfKE3Nan8fiKxCn8YblXQO2ndHweNsFSy7qDF
	yKoCTjE1Muw0jAmWf63PRvHUE2bnXv7Ll0++ajlygiE2wIHzYPIv+fgR6je3mDDlDJS6NmY69aIrJ
	yqHDOU2eLsOD7uJ/fcq7CPtjB3H6X7utImXGEWQm5mr/3z7fYctUkYISg0gJdf49PQsPAehdbdt2L
	/QDiYJ5Pdo//HX03ltRfFRwYGH4UeMRw8AgqgCNuea5JLcyRV4FoKrXp7scNl/U4KvbaOJGR84Z3o
	9tkNN8EQ==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeJ2-0000000FhgV-1WLZ
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:48 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd60d155070so767628a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904842; x=1792509642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=;
        b=Brl/KBsR/yUxPYSZNXEXQCULF+fP4M3EDqJJbuyStpgAtJrkYX3Sq9gTXmlnWsnr4k
         J5hrms72nid3P3evQLLLHlVtoPdm/cexNEDu20nZMmyi0XPw7TaBd4+c0Z3hEA99YW7X
         4G2YfvqAXGKrjOM/2rt2EUsWLNzVpwYbrf8dDrqsymdHjV3cvMDc3AOeRIY7CrdgzFgX
         1p7P3NEFxJ9PAJHt9aGtQ5j/YF21iOqL6wmfapahJe2m/N1eMfXQzghLoOu1tSQdyrUG
         z8eb9w0zIWBMts45O10zYMrETslrSpJDNqB6z8jKkzfq0ogEY2Bx2Tn03aoDXwmoNFjm
         sIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904842; x=1792509642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=;
        b=iIqQgjYnfnOMmAEpVGfDBMQBA/WkoJdrjFOANIVmwVKOWGpTEDOsJhnx40MxrXqQPl
         vlKrHPqVirobbAOn/iRM28onXbSKnFfGqmBloFjmGjh6AkHQnFnOt+V2oCxFnm11EVi/
         VMoBGkAsdbY053evKLOjdt0Lg2MkUbg2tpZnjJCi7+rK6OxLuINQ0mfxufGpBWfZc1E7
         p2ioEXXdTeIxEEQdbJp2BGvKDHGGeQaXl6zv3butfQo71SHZwZhsldSnkwJsyXV/Hpm5
         4tK1vF+mP6qrxqiyXYwM2f0rKtXQc+WQzqher8AnakX9XN9E24uql4pq41Tsg87t/JKH
         IgUg==
X-Forwarded-Encrypted: i=1; AKwUvBx8/Bb+QgqLnufaKrudSTq+l3nLnq/O+U4KRhzGZ00Nu1pe8f9OA0fyDLRlWfasgjgiwU/d6pzdrnTo7E7d9g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1nymCx7h+TGv2TjsY9ZSXkhN2HRR5tPIgDkIGejNR9VFDbisq
	b+vAYIO08+tk8Lzhz90q1FqjVAWDP3BPeLAUDO7LtsVmlKZB07kcqjKO
X-Gm-Gg: AYBFou286GUVFD2jZYYBCeEhJK0jiMB6dtNoU2wHTdQoeQeg1FAabVAjVMls/B0BaiU
	mJvmqbPoPk9XgKdb8/wgUmuWqhhzM5YuBI/DM3xoEJ/Ein30zzVetupfx3OG6FFGK04yhqdQnSr
	4hj8x22ytVUIYrR2lMfaOY0CaLcWKA3GfyK+u2AAP6rnanl+fwnN4w18GjRkA9dNK8EZz1TnMKx
	3UFdx9r3sRa9iU8+Bzq6OTUbsQIgSIytu+3k0Wk2hX3rmcbA6IQoNoSbqkd/hLGCp54Lbi3opmC
	0vgYCklGz+2BcPsanz5ed0EGDQhv+C7OqxxGaQAV2dxc78c6lUCUBiZQ3XVGbVHX1rmd6l81dnX
	HffwV+luXWbjrL9Bu8Mx7RQ7Bb3zRJXtFd1Sw7JqrFn0vHYUPmdrS2YtTkNq0lgr0NfBJKkR60M
	KKhEp5Xvo7nXXK/qvBkvpJZC2i6a5meHb5pCLh6JNMuV+tMbtqA5A3qfZ6b0XzkM9069+36Zw/j
	t4zt1766muGY3uee9XAQOHqhFnwnTl/vTvqlbw=
X-Received: by 2002:a05:6a21:8217:b0:3dd:a00a:c5ba with SMTP id adf61e73a8af0-3e16c02df28mr13473096637.45.1791904842064;
        Tue, 13 Oct 2026 08:20:42 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:40 -0700 (PDT)
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
Subject: [PATCH v2 28/35] clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:27 +0900
Message-ID: <20261013151734.3177690-29-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_162044_635096_E471B6D6 
X-CRM114-Status: GOOD (  18.38  )
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

The MT8173 infracfg driver previously needed custom probe/remove
callbacks to register and unregister cpumux. With cpumux support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8173-infracfg.c | 100 ++++-----------------
 1 file changed, 16 insertions(+), 84 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index 9b8c35897789..fdd994736e83 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -17,22 +17,20 @@
 		GATE_MTK(_id, _name, _parent, &infra_cg_regs,	\
 			 _shift, &mtk_clk_gate_ops_setclr)
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
 static const struct mtk_gate_regs infra_cg_regs = {
 	.set_ofs = 0x0040,
 	.clr_ofs = 0x0044,
 	.sta_ofs = 0x0048,
 };
 
-static const char * const ca53_parents[] __initconst = {
+static const char * const ca53_parents[] = {
 	"clk26m",
 	"armca7pll",
 	"mainpll",
 	"univpll"
 };
 
-static const char * const ca72_parents[] __initconst = {
+static const char * const ca72_parents[] = {
 	"clk26m",
 	"armca15pll",
 	"mainpll",
@@ -44,7 +42,7 @@ static const struct mtk_composite cpu_muxes[] = {
 	MUX(CLK_INFRA_CA72SEL, "infra_ca72_sel", ca72_parents, 0x0000, 2, 2),
 };
 
-static const struct mtk_fixed_factor infra_early_divs[] = {
+static const struct mtk_fixed_factor infra_divs[] = {
 	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
 };
 
@@ -70,95 +68,29 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.factor_clks = infra_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_divs),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt8173_infracfg[] = {
-	{ .compatible = "mediatek,mt8173-infracfg" },
+	{ .compatible = "mediatek,mt8173-infracfg", .data = &infracfg_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_infracfg);
 
-static void clk_mt8173_infra_init_early(struct device_node *node)
-{
-	int i;
-
-	infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!infra_clk_data)
-		return;
-
-	for (i = 0; i < CLK_INFRA_NR_CLK; i++)
-		infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-
-	mtk_clk_register_factors(infra_early_divs,
-				 ARRAY_SIZE(infra_early_divs), infra_clk_data);
-
-	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
-}
-CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
-		      clk_mt8173_infra_init_early);
-
-static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	int r, i;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-		if (!infra_clk_data)
-			return -ENOMEM;
-	} else {
-		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
-			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
-	}
-
-	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				   ARRAY_SIZE(infra_gates), infra_clk_data);
-	if (r)
-		return r;
-
-	r = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-				      ARRAY_SIZE(cpu_muxes), infra_clk_data);
-	if (r)
-		goto unregister_gates;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
-	if (r)
-		goto unregister_cpumuxes;
-
-	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (r)
-		goto unregister_clk_hw;
-
-	platform_set_drvdata(pdev, infra_clk_data);
-
-	return 0;
-
-unregister_clk_hw:
-	of_clk_del_provider(node);
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), infra_clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), infra_clk_data);
-	return r;
-}
-
-static void clk_mt8173_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8173_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt8173-infracfg",
 		.of_match_table = of_match_clk_mt8173_infracfg,
 	},
-	.probe = clk_mt8173_infracfg_probe,
-	.remove = clk_mt8173_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8173_infracfg_drv);
 
-- 
2.56.0


