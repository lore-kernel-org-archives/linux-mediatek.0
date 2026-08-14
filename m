Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154E9C5B572
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2026 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vesdrJBOwlQOlA8CDULI3Zoo3petA5kgW0e7uLS9npA=; b=e+m7BEun7m/G3hD9+4AXRA3jgL
	GrvodhMX3WZLYVzngf+k1HR9IPDqs8GUV6IehE42V6R0RkNP3au+IqNoSksQ+j4UV4jTDW/88fIPc
	Y1W8SZtXPRihkUmZMluIFaKCJKPzkUIwh+8Yl0yyNc1Q3tj0+uw8b2nuc1pSIPLIWxjQ9lufA4mim
	tEiNtmSzSvF/hBFqwCOSmHWOECcNas+TLvzJ0ZKlrrh61axCZiUVkgdwgYvVh2SWdFMsHlDn8F73v
	7zvVYS7CPiRsIjYJxvL69XyqgTY1eTzRCk45PnQkFIaVZSElHjUVEsuy1nINa2aBBGRhTSSJgHjta
	CsRNLJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusAg-00000002jwi-3Gbh;
	Fri, 14 Aug 2026 13:42:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusAd-00000002jvx-2wY7
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Aug 2026 13:42:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso861320a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2026 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714923; x=1787319723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vesdrJBOwlQOlA8CDULI3Zoo3petA5kgW0e7uLS9npA=;
        b=BC4D9hV8mZbhclNPDdJ5O2H8p6yqVcpyNqiCu1zemGDRLox2cM9F/hD+vuC5l9ejqf
         8pPVTSYxt5v26aFPROovjHoc4NinPkb5DhC+Mv3QoQ3NH1OF5FVxgqRzSIHSVe6DdIqh
         S3T9YcCObV6R8p/VmyoeUSxCgBjSEj6BXcGcQKzHuNZmVUNG0rZmFcpUKQU8sxSTckgv
         rBwaxAAB7XT4z5DSW+EdB1GhRjLB4j5J6YVmT+kybZ14zG/QadNPuX0tT6naIHhEU65q
         E82t3/S1gXdvQ3wYIHqhSHJUAnWck3UKeU2TiCTDrpYTARj213GhxM+rJ7ZF0q8OZ2Vd
         YQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714923; x=1787319723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vesdrJBOwlQOlA8CDULI3Zoo3petA5kgW0e7uLS9npA=;
        b=mkxgWrRM03eZXCRxA0awAjGQRp8hxARc3+gtzDLTTc8Qo48T1RgX8mB5CYq7QzvRNE
         cnBllitgY6eJj0g9X9dGX+rD8wKntq4zrKgR1831vl3FIPSGyalIUOw7WxCnO8WBNr+c
         89uzXplhSio808g23pt59PLUAkXxgfwmjD7ENI5fgO9Y/zOeWe0ubTh6PXgsxx8rTUBh
         cLe2vrJgBLNcHPCmoXVIBwwQqIxsGKNS8WHEcOuKY7gViBpKHS+NVbldDVNTLp/l2k0Z
         p0RdyuZVCqCxJqKSgNcE7paMNv3SWcAR38KCTC0EhgblqwBNyfMXks3Pr37IlS8a0U6M
         Xqrw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3hZcY7zWh60Oe5UFGXBP2ZgLBc6IV5hrEbOOPcrlQLtZLjzIje0+X4k2VgeDSvEfrdoMbX3fpXdq8BNtIbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrS8N+plGYORBZ2CM1SM8YZD0dwbzqXkJyTjKyPLpXj2FbAyGy
	6SEMkNGCy3EmFShauwKO62McEZ2fBvBw80+em1pLvLUjdMkyjUxgprSM
X-Gm-Gg: AR+sD109Bw/1G6bSNdWX7ddsExNuMugbIwxXcQkOWXwnwZjk8wUL8AVwGWXlcu/GpZh
	Dx2Qp0lWtA6KqMV6J9AKTTmvh2ldN9hsPnMlPe5X4eFFZEZYJeAnkkwaeZ8g8ZvcBB2dPA1eaBg
	JrPyucAyhCJ643O0mhzYo9tcpVveZFr69nDKFO/xzK8lRf7tITRH+LIWaZPDHc56oJ5I8AJg+/A
	IGQ6daFjouDZFPKwXZ5YmpIynBzT5OJYwSlB4WIlFDW5tchuSlwDHMjb/5kyCvw8H/vunAsx4xR
	fhdcORCgd7/6BQMuNiCCT/6ufVNur658BZyLL5ZBl94wbPI/BMd+91CUZUDh3Lx++QisrG7YoWn
	V4aE0YiLs0m8mYOHvNo59IviWtkgNoslM98N4wZqpM7CPxi5jb38LfwOgy+QuUThBlmZCqmtLO1
	bUIhNCXfI/Lj5JUHODYKbAqGgymujkkGs3P30Y1fSZEfaFDfIgs8MMXbqC8/EGR5X2YzvoDhq5E
	BCdlAwG
X-Received: by 2002:a17:90b:510a:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3933ba87422mr6655253a91.16.1786714922710;
        Fri, 14 Aug 2026 06:42:02 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea972c79sm2932232a91.4.2026.08.14.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:42:02 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Wenzhen Yu <wenzhen.yu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag
Date: Fri, 14 Aug 2026 21:41:56 +0800
Message-ID: <20260814134156.1388413-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_064203_749719_2D5D6966 
X-CRM114-Status: GOOD (  14.50  )
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

The MT7629 clock driver calls clk_prepare_enable() for six clocks that
must remain running. These calls create permanent references owned by
the driver. In topckgen and apmixedsys, provider registration can fail
after the references are acquired, leaving them unreleased.

Mark ARMPLL, main_core_en, the AXI, memory and DDRPHY selectors, and the
UART0 gate with CLK_IS_CRITICAL, and remove the manual enable calls. Keep
CLK_SET_RATE_PARENT on the three muxes while adding the critical flag.
The common clock framework then preserves the existing always-on behavior
without driver-owned prepare and enable references.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v2:
- Preserve CLK_SET_RATE_PARENT on the AXI, memory and DDRPHY muxes.
- Rebase onto clk-next and repeat the focused ARM W=1 build.

v1: https://lore.kernel.org/r/20260813153113.3952621-1-ruoyuw560@gmail.com/

 drivers/clk/mediatek/clk-mt7629.c | 39 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8bb..1a3abffd3238f 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -48,8 +48,9 @@
 		_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,	\
 		NULL, "clk20m")
 
-#define GATE_APMIXED(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
+		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)
 
 #define GATE_INFRA(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &infra_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
@@ -57,6 +58,10 @@
 #define GATE_PERI0(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &peri0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_PERI0_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &peri0_cg_regs, _shift,	\
+		 &mtk_clk_gate_ops_setclr, CLK_IS_CRITICAL)
+
 #define GATE_PERI1(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &peri1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -311,7 +316,7 @@ static const struct mtk_gate_regs peri1_cg_regs = {
 
 static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0,
-	    0, 21, 0x0204, 24, 0, 0x0204, 0),
+	    PLL_AO, 21, 0x0204, 24, 0, 0x0204, 0),
 	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0210, 0x021C, 0,
 	    HAVE_RST_BAR, 21, 0x0214, 24, 0, 0x0214, 0),
 	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0220, 0x022C, 0,
@@ -325,7 +330,7 @@ static const struct mtk_pll_data plls[] = {
 };
 
 static const struct mtk_gate apmixed_clks[] = {
-	GATE_APMIXED(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
+	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
 };
 
 static const struct mtk_gate infra_clks[] = {
@@ -437,7 +442,7 @@ static const struct mtk_gate peri_clks[] = {
 	GATE_PERI0(CLK_PERI_PWM_PD, "peri_pwm_pd", "pwm_qtr_26m", 9),
 	GATE_PERI0(CLK_PERI_AP_DMA_PD, "peri_ap_dma_pd", "faxi", 12),
 	GATE_PERI0(CLK_PERI_MSDC30_1_PD, "peri_msdc30_1", "msdc30_1", 14),
-	GATE_PERI0(CLK_PERI_UART0_PD, "peri_uart0_pd", "faxi", 17),
+	GATE_PERI0_AO(CLK_PERI_UART0_PD, "peri_uart0_pd", "faxi", 17),
 	GATE_PERI0(CLK_PERI_UART1_PD, "peri_uart1_pd", "faxi", 18),
 	GATE_PERI0(CLK_PERI_UART2_PD, "peri_uart2_pd", "faxi", 19),
 	GATE_PERI0(CLK_PERI_UART3_PD, "peri_uart3_pd", "faxi", 20),
@@ -459,12 +464,15 @@ static struct mtk_composite infra_muxes[] = {
 
 static struct mtk_composite top_muxes[] = {
 	/* CLK_CFG_0 */
-	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
-		 0x040, 0, 3, 7),
-	MUX_GATE(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
-		 0x040, 8, 1, 15),
-	MUX_GATE(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
-		 0x040, 16, 1, 23),
+	MUX_GATE_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
+		       0x040, 0, 3, 7,
+		       CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
+		       0x040, 8, 1, 15,
+		       CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
+		       0x040, 16, 1, 23,
+		       CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
 	MUX_GATE(CLK_TOP_ETH_SEL, "eth_sel", eth_parents,
 		 0x040, 24, 3, 31),
 	/* CLK_CFG_1 */
@@ -568,10 +576,6 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 				    ARRAY_SIZE(top_muxes), base,
 				    &mt7629_clk_lock, clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_TOP_AXI_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_MEM_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_DDRPHYCFG_SEL]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
@@ -620,8 +624,6 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	clk_prepare_enable(clk_data->hws[CLK_PERI_UART0_PD]->clk);
-
 	return 0;
 }
 
@@ -640,9 +642,6 @@ static int mtk_apmixedsys_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
 			       ARRAY_SIZE(apmixed_clks), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_MAIN_CORE_EN]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 

base-commit: 684633bd76956b5d7ed59eb799e6fe7f45e47be4
-- 
2.51.0

