Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4464FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A0IdnzxjpdfOl3zYZTSDnGnHMenIThuYLI2MFYGlhLg=; b=Pn5pYT1XUMFiCk
	/oEn4VjbH351hxs39rnXFhpvJ4WFgD6uBPoFbl1/Fm59SMhO2XHR3voLoJE1n+fiV/zcTYZgmMpRs
	Kwk9nfGjBSGd6XakUFaL5RWvN0MPc6UWGHDY9ZBV/f9a8KcpGRrlBOik7zGf+l1rbdg8DEIQ9lvTL
	ky2k7q7IRvD2s+DPO2T2isXLQLfSH7ZeldFD4xfxfszMiN+12ciyRQpcHxWfb+84M32cMx8zSxsFS
	2+UNQGA2uzce6cGuVAMshekgCBurMABZJ2rg/DhkRyd2q+qh3uc4gjhPD/CuZiA3IJ9pYzEIQXOnS
	Z/k8NEJu1eSei61OcIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhuQN-000rDK-6e; Fri, 22 Apr 2022 14:38:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhuQB-000rA3-3q; Fri, 22 Apr 2022 14:38:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D686860A53;
 Fri, 22 Apr 2022 14:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A66C385A4;
 Fri, 22 Apr 2022 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650638285;
 bh=2KebUru9Oip9dwY6heZ6bnUO3jvAGYTmEfS1DsUFi3Q=;
 h=From:To:Cc:Subject:Date:From;
 b=Mfj6dWMxh99Gz193yLbjJA6A8S0nfoOyYro41TieznHo2CfRLaNXSp1nLz2WGMXxs
 iZrMWJTT4P0wU9C35c8ezGmYqW98A4hqworQy5NVgaAu3vOdrP0BTY5m3cltV5bXME
 kBTOlulQjJ9Utq7Q2Gzaa9kh1aRyRQVRU/pvgSCsw7EDoO02eMtpxTFy5N+H2ve164
 rE09lZ17NluAimAgO5g+AD0yxKZBMfah6W9d7Ixb/60j2L1/DbZKEnP9zIX/oz16P1
 ldZbT31gBN9QrbtyyMh9VnmiTvjjRbAB+vTlje54hMpTDu8NNVroCVmwCo1ol1zCIV
 4RBabTRGhDaIQ==
From: matthias.bgg@kernel.org
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: weiyi.lu@mediatek.com, chun-jie.chen@mediatek.com, ikjn@chromium.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 allen-kh.cheng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] clk: mediatek: Delete MT8192 msdc gate
Date: Fri, 22 Apr 2022 16:37:56 +0200
Message-Id: <20220422143756.14806-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_073807_234382_7A049D77 
X-CRM114-Status: GOOD (  10.01  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

The msdc gate is part of the MMC driver. Delete the not used code.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clk/mediatek/clk-mt8192-msdc.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
index 87c3b79b79cf..635f7a0b629a 100644
--- a/drivers/clk/mediatek/clk-mt8192-msdc.c
+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
@@ -12,28 +12,15 @@
 
 #include <dt-bindings/clock/mt8192-clk.h>
 
-static const struct mtk_gate_regs msdc_cg_regs = {
-	.set_ofs = 0xb4,
-	.clr_ofs = 0xb4,
-	.sta_ofs = 0xb4,
-};
-
 static const struct mtk_gate_regs msdc_top_cg_regs = {
 	.set_ofs = 0x0,
 	.clr_ofs = 0x0,
 	.sta_ofs = 0x0,
 };
 
-#define GATE_MSDC(_id, _name, _parent, _shift)	\
-	GATE_MTK(_id, _name, _parent, &msdc_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
-
 #define GATE_MSDC_TOP(_id, _name, _parent, _shift)	\
 	GATE_MTK(_id, _name, _parent, &msdc_top_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
-static const struct mtk_gate msdc_clks[] = {
-	GATE_MSDC(CLK_MSDC_AXI_WRAP, "msdc_axi_wrap", "axi_sel", 22),
-};
-
 static const struct mtk_gate msdc_top_clks[] = {
 	GATE_MSDC_TOP(CLK_MSDC_TOP_AES_0P, "msdc_top_aes_0p", "aes_msdcfde_sel", 0),
 	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_0P, "msdc_top_src_0p", "infra_msdc0_src", 1),
@@ -52,11 +39,6 @@ static const struct mtk_gate msdc_top_clks[] = {
 	GATE_MSDC_TOP(CLK_MSDC_TOP_AHB2AXI_BRG_AXI, "msdc_top_ahb2axi_brg_axi", "axi_sel", 14),
 };
 
-static const struct mtk_clk_desc msdc_desc = {
-	.clks = msdc_clks,
-	.num_clks = ARRAY_SIZE(msdc_clks),
-};
-
 static const struct mtk_clk_desc msdc_top_desc = {
 	.clks = msdc_top_clks,
 	.num_clks = ARRAY_SIZE(msdc_top_clks),
@@ -64,9 +46,6 @@ static const struct mtk_clk_desc msdc_top_desc = {
 
 static const struct of_device_id of_match_clk_mt8192_msdc[] = {
 	{
-		.compatible = "mediatek,mt8192-msdc",
-		.data = &msdc_desc,
-	}, {
 		.compatible = "mediatek,mt8192-msdc_top",
 		.data = &msdc_top_desc,
 	}, {
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
