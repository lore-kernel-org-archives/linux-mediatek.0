Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F660C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvPrdCfLMOdHjo0k4t/GrGkNFIAmV7xjDIeg9Xk2ruA=; b=NY0zd7cryEhA1u
	RaJS3d5YQhvArLnpgzDlvy5Rtsxk+RlRBH1g7AsNFUgb6sy+o/gidFyI0swbp3sAfput+QwEcbvUZ
	pI65m+/iV0jrDuTOK1iBXxuiij7x05ubIDbD5cBd1z+JSYkDU7nXTAPgJxi/e9NAUZ3Q/dWH8Wxmr
	kq4HCmfREVAdHOoQa5XM0pBE7fJDCFgRv7q4HYmhN+h0b57hps+MnnjcUfyRycj364Ew8BohVUcPj
	GrpLhEJYD/DFVuBnpsOzA082FUynGyE4sMScte0m3QA5rPNWznWhnHyBWMVamytJ69ak7x3pVdXGf
	gVefYkEKC7dB4tlZhpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt67M-003eCV-Ps; Mon, 23 May 2022 11:20:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5EB-003D9x-C8; Mon, 23 May 2022 10:23:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0348611E6;
 Mon, 23 May 2022 10:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A984C385A9;
 Mon, 23 May 2022 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653301434;
 bh=y+sP4vTc6GXPb2q2jeON7sbrRR8FJJVBeRF9X7Rz+Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UMA00BlSIzMMi7wqj/fmwy8D9Uf5fSJz66AOEWfc6ECF219ZDuqs5y4UyrFMWJGpt
 bUq3+P4EZPrgf4v/7s/bwWxDaXoXZRBG6XzR5ngvrN6RvFIMSB35cxj6leENtOInIQ
 4/I30rTjMIt8QCi4sAkpJUsk0ZMTurXC+wuF4HxtX6pEXUDHqChF3+LdDO3d0mxfao
 X1SFFs1RFIpIVhdrQB/Hhue0tMXZVI0ieCvqy8soIDAbkkOexpW/VAHhXITWzwQkK3
 vkGWI089NJVKGFfKVRfhlcgBObeBawSRcnzcQDFBTae+h13N4A5oj7K2sWgi9G7bkv
 sc7bGflnzCPWw==
From: matthias.bgg@kernel.org
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com,
 chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org,
 ikjn@chromium.org, miles.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/2] clk: mediatek: Delete MT8192 msdc gate
Date: Mon, 23 May 2022 12:23:39 +0200
Message-Id: <20220523102339.21927-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220523102339.21927-1-matthias.bgg@kernel.org>
References: <20220523102339.21927-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_032355_587865_269BC930 
X-CRM114-Status: GOOD (  11.56  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>

---

Changes in v3:
- add Reviewed-by tag

Changes in v2:
- add Reviewed-by tag

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
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
