Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F30C5CFCF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lm7VmGRk9PxJZxv0GuzFpDT3tfIPdeIoyGQVz1zDLXY=; b=jWjJpaDv9M+G31FPrClih9L2Ka
	xLbJj2zGudojU5VFHw/XQCT4lIOzzUh0hXGc2lgc+O713qByYLu8SLVjpkJcFLmmcor+/hEcHyIDh
	yObwSGmlLS59faDzQo08amPx7zwfzdOXi3cxU9qCmf4Ok+m9YA/WuYqppHW9Kfn+feXxaAJyRSjxO
	YTg1S1jvOi7r66FGYVn6AtSq3ZkOYoxCM+KFW+PYGVJ971/4RV+wYCGu3+EmpU/2xlVUjBPInSp3A
	imGwLO9jkFWAZtzhcdTLs7cI/QnV/ND3tGbK8ulyvTDCRIp2+BSurL0LH4clO5B+wlNjzPFZJF5Y8
	gE4qua1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXOv-000000012Bm-34R2;
	Thu, 13 Aug 2026 15:31:25 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXOr-000000012AE-174U
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 15:31:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c998fd549a8so713572a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635080; x=1787239880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm7VmGRk9PxJZxv0GuzFpDT3tfIPdeIoyGQVz1zDLXY=;
        b=qLvenH8YfNhQOehqpKmfO/aU7gifAKsuTQJHQYAwyKgYTd9azeg9tIGjIZp7txNvaf
         oFkRH0dEYjO6+peg+zu/n75hJBIvgkl1qVaPQQ3V2db4EVWIQyHuh0mXn4RJHLMVXGVL
         m49vhTb1wfy2PXYVa/hr7XwPeD7bCIDYS8zWz1W7hOf9fcuLu95cosjcemtsIlDTjBjG
         TEFFsj27ZMIjsnlTk5eixSSC8CzNJsSU8fXU71k1b5c8YPOPyUjn2GZ2sHTD0T9uHjeh
         29njkBasOW531qAt5QaiGUIT2x89qJ2d5MYUzfGtOc/5uZVc2CGEohFMs6Sdp9EsLfEa
         3czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635080; x=1787239880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm7VmGRk9PxJZxv0GuzFpDT3tfIPdeIoyGQVz1zDLXY=;
        b=HcsxAS97/JEpDrjugfI6unkFXw68nBLW3OaUm7cw/Znsdjlw5YPKlxCnnqweXmmEwe
         b5q9vDb0bMTFuJuBXf75f+5VGLgTt6izhA66nOvXhLn1Yno8NoGtvFZfpY/5Pjbrrp7m
         Jj721JQpFoVpLunaD1ScOepVFdPkD/HsnMvOt7LfgyXFoVmO0sLLOieF1I/Qut1xRttk
         Uu9Y/Tg+9DsRry4H6Gaob9W12TRJB4PeB7DS4c0UnBb1/f1gwaMmbmfld3Yr6L6/1JOd
         uvFMbKxP+XyK+D+SitWIVSmmIZ4QCr59shlyZu6qYPVvnS6Jopw9k2nME5kIqRHgnB3a
         HOrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+uFVoTHZWUf8WLG8YYC/8AdCovXa8C/xleW/vntQkuoJteee6pg347AOvqozPpC4IKJKD8W2lVv7oAuZ48A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7FdULp+cRIuJzH2V5Uzu/Pt0xviBLqmw7Q+xuw2S26QLbg9mx
	AnDEsr3UQWCrXJaZeuPYC1l1EYAWFQEiAl9pA+VfSOdxgHx0305wQ1HZ
X-Gm-Gg: AR+sD13HwSv/Jn78ufKWwEMF5WztPCl7a55JMSWdndm0kkUwumNw5ufQah/XEDNeoFj
	PVNBFgqVue02TbQV6htwbTXONJ/33ohRu1VuU/PGAwdgtccB6W0uB25wCiLxSNkU9nqCW5FRCGk
	6AnNW5hRKPuICeBbcB+XdY4n3rohL/MZQDxWByYEjPc1fJaWmNrlHN/B8c0bsHFJpbiFGqO5n1H
	9MlC3RhKLUJTZ4KPG9FpqGqk2qiJaG0nY6drdMlaCKDDp+TxGszm28Keb9DRmVTdRIkC0KRa/pl
	wsDstnGni/nJWUZUEe4D4n3Eadq/6KxnUUZfwoNwJ4sBgyTYd0O1RsARH92l2/J8fXx4koGik+i
	NGyfLqFYdsQT6aB6JRO2SfnYZ37N5nhpUtmOWJn4+qSoDWbcCxEXwHVfggH8Bn3xq8+6ycjxs9C
	OSegbiG3tkB1U8xzNxY0ntmU7QHu2J/sY2sRNbQ63YojPsfJkztWrVVlMctH6KGHeEFXv65mgYb
	+mICU4=
X-Received: by 2002:a05:6a20:9143:b0:3c4:3321:5009 with SMTP id adf61e73a8af0-3cc55305f99mr7932500637.29.1786635079708;
        Thu, 13 Aug 2026 08:31:19 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:3b7:6da1:c188:d14f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef71081b5sm1234318a12.21.2026.08.13.08.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:19 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag
Date: Thu, 13 Aug 2026 23:31:13 +0800
Message-ID: <20260813153113.3952621-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_083121_341604_D84C1E78 
X-CRM114-Status: GOOD (  12.86  )
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
UART0 gate with CLK_IS_CRITICAL, and remove the manual enable calls. The
common clock framework then keeps these clocks enabled without
driver-owned references. This preserves their always-on behavior and
avoids leaking references when provider registration fails.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 36 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8bba..627e8017fa642f 100644
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
@@ -459,12 +464,12 @@ static struct mtk_composite infra_muxes[] = {
 
 static struct mtk_composite top_muxes[] = {
 	/* CLK_CFG_0 */
-	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
-		 0x040, 0, 3, 7),
-	MUX_GATE(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
-		 0x040, 8, 1, 15),
-	MUX_GATE(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
-		 0x040, 16, 1, 23),
+	MUX_GATE_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
+		       0x040, 0, 3, 7, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
+		       0x040, 8, 1, 15, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
+		       0x040, 16, 1, 23, CLK_IS_CRITICAL),
 	MUX_GATE(CLK_TOP_ETH_SEL, "eth_sel", eth_parents,
 		 0x040, 24, 3, 31),
 	/* CLK_CFG_1 */
@@ -568,10 +573,6 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 				    ARRAY_SIZE(top_muxes), base,
 				    &mt7629_clk_lock, clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_TOP_AXI_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_MEM_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_DDRPHYCFG_SEL]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
@@ -620,8 +621,6 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	clk_prepare_enable(clk_data->hws[CLK_PERI_UART0_PD]->clk);
-
 	return 0;
 }
 
@@ -640,9 +639,6 @@ static int mtk_apmixedsys_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
 			       ARRAY_SIZE(apmixed_clks), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_MAIN_CORE_EN]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
-- 
2.51.0


