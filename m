Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 07:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3ICTC5oAUck3X7HDUx3GhXFDHa+HCIDDE2g1o0iu1E=; b=ooy/SxshAiQ6VN
	DAn662nYUvP/7jEeEu5gvdT5pH6y5mRNyNB823/UDkAWlU4j68ZAWq5h+UyN1TYhMRCcjGRN+mUMd
	iqar5PoUo1Mzoi8JIzQVWflOVG7FkMmpUmf5nuxd/lfwfCDHsP7YT1xiNNK1uw3WmQB2cCOT6Vf4Q
	NaRZDylxSQkMscpJy1picr7h6vEyJ1KSPW+iuDhWWwkl8Ba/E6M0tceaxwFYgE6kWHanCg89MLKlT
	yfylkgte8B81NaQw4GYrMVjhakt2Oco5mQageiiBfQVBKvjOM71akY940J7bp12ryaT7CCg8ruTot
	MBxvT35vTGvd8VrCf3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitBx-008cBS-MU; Mon, 25 Apr 2022 07:31:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitBu-008c9j-Ma; Mon, 25 Apr 2022 07:31:28 +0000
X-UUID: 7b70b1deafd74ae499829fbb5bf7bb2c-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f1a6d4a1-3bc7-4700-95b9-fe9a39e78c94, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:710600f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7b70b1deafd74ae499829fbb5bf7bb2c-20220425
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1572196795; Mon, 25 Apr 2022 00:31:18 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 00:31:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 15:30:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Apr 2022 15:30:54 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <matthias.bgg@kernel.org>
CC: <allen-kh.cheng@mediatek.com>, <chun-jie.chen@mediatek.com>,
 <ikjn@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <weiyi.lu@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: Delete MT8192 msdc gate
Date: Mon, 25 Apr 2022 15:30:54 +0800
Message-ID: <20220425073054.1391-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422143756.14806-1-matthias.bgg@kernel.org>
References: <20220422143756.14806-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_003126_771093_48971F54 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

Hi Matthias,

>The msdc gate is part of the MMC driver. Delete the not used code.
>
>Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>---
> drivers/clk/mediatek/clk-mt8192-msdc.c | 21 ---------------------
> 1 file changed, 21 deletions(-)
>
>diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
>index 87c3b79b79cf..635f7a0b629a 100644
>--- a/drivers/clk/mediatek/clk-mt8192-msdc.c
>+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
>@@ -12,28 +12,15 @@
> 
> #include <dt-bindings/clock/mt8192-clk.h>
> 
>-static const struct mtk_gate_regs msdc_cg_regs = {
>-	.set_ofs = 0xb4,
>-	.clr_ofs = 0xb4,
>-	.sta_ofs = 0xb4,
>-};
>-
> static const struct mtk_gate_regs msdc_top_cg_regs = {
> 	.set_ofs = 0x0,
> 	.clr_ofs = 0x0,
> 	.sta_ofs = 0x0,
> };
> 
>-#define GATE_MSDC(_id, _name, _parent, _shift)	\
>-	GATE_MTK(_id, _name, _parent, &msdc_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
>-
> #define GATE_MSDC_TOP(_id, _name, _parent, _shift)	\
> 	GATE_MTK(_id, _name, _parent, &msdc_top_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> 
>-static const struct mtk_gate msdc_clks[] = {
>-	GATE_MSDC(CLK_MSDC_AXI_WRAP, "msdc_axi_wrap", "axi_sel", 22),
>-};
>-
> static const struct mtk_gate msdc_top_clks[] = {
> 	GATE_MSDC_TOP(CLK_MSDC_TOP_AES_0P, "msdc_top_aes_0p", "aes_msdcfde_sel", 0),
> 	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_0P, "msdc_top_src_0p", "infra_msdc0_src", 1),
>@@ -52,11 +39,6 @@ static const struct mtk_gate msdc_top_clks[] = {
> 	GATE_MSDC_TOP(CLK_MSDC_TOP_AHB2AXI_BRG_AXI, "msdc_top_ahb2axi_brg_axi", "axi_sel", 14),
> };
> 
>-static const struct mtk_clk_desc msdc_desc = {
>-	.clks = msdc_clks,
>-	.num_clks = ARRAY_SIZE(msdc_clks),
>-};
>-
> static const struct mtk_clk_desc msdc_top_desc = {
> 	.clks = msdc_top_clks,
> 	.num_clks = ARRAY_SIZE(msdc_top_clks),
>@@ -64,9 +46,6 @@ static const struct mtk_clk_desc msdc_top_desc = {
> 
> static const struct of_device_id of_match_clk_mt8192_msdc[] = {
> 	{
>-		.compatible = "mediatek,mt8192-msdc",
>-		.data = &msdc_desc,
>-	}, {

grep '"mediatek,mt8192-msdc"' * -RnH
arch/arm64/boot/dts/mediatek/mt8192.dtsi:868:                   compatible = "mediatek,mt8192-msdc";
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml:112:        compatible = "mediatek,mt8192-msdc";
drivers/clk/mediatek/clk-mt8192-msdc.c:67:              .compatible = "mediatek,mt8192-msdc",

I am wondering that in this case, should we have also modify the bindings document
(mediatek,mt8192-clock.yaml)?


thanks,
Miles

> 		.compatible = "mediatek,mt8192-msdc_top",
> 		.data = &msdc_top_desc,
> 	}, {
>-- 
>2.34.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
