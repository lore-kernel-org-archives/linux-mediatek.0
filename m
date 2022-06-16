Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zjQFvvKJN5m4o+5cSn2hbJ86PtZMhHs4OQCuuJ7Bcc=; b=bFcaVTZzkn9RTkuy01OHa+IDpR
	jCoezB2Gadedo3zi1adLKWX3s98zMR+lqE7Xm4+10ThTl2T3UN50tjwnieN4LzVG4YXmBYY8j6SDA
	xcnAUmJ6Bh1jSxGvXNH1VyTi92zJBIU3l3BTlbz37eBa6v/zrUdbWlE5vLRYGe0KRnOliqQvlVaYk
	y284LoU/FtOlHmRIHzghSpGRbb7OGI6fci0jAjL6L07KegjKZhgOX2hcL/538Nnj15P5VtAvioBhi
	ANvqyMGL+2Ah4MvnvpHOZjXf8azgaA5rh+C+LEiRrht1IxaNW2uBnkAdMG7YB+ZeFt1OIWwO+oasH
	FMOKlCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jgN-000yW4-QO; Thu, 16 Jun 2022 07:12:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jgC-000yTb-LG; Thu, 16 Jun 2022 07:12:38 +0000
X-UUID: 4350ab4944d4484da9fe4bb9f93942df-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:cd473f60-3dc5-4c16-a362-24b41055d2b9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:b4b0b648-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4350ab4944d4484da9fe4bb9f93942df-20220616
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1050467535; Thu, 16 Jun 2022 00:12:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:12:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 15:12:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 15:12:28 +0800
Message-ID: <3de597c1ab963cc8f6dd89da089c6f0660517f34.camel@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: clk-mt8195-vdo0: Set rate on
 vdo0_dp_intf0_dp_intf's parent
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "wenst@chromium.org" <wenst@chromium.org>, "Miles
 Chen =?UTF-8?Q?=28=E9=99=B3=E6=B0=91=E6=A8=BA=29?="
	<Miles.Chen@mediatek.com>, "chun-jie.chen@mediatek.com"
	<chun-jie.chen@mediatek.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <jitao.shi@mediatek.com>,
	<mandyjh.liu@mediatek.com>
Date: Thu, 16 Jun 2022 15:12:28 +0800
In-Reply-To: <20220614091020.21472-1-angelogioacchino.delregno@collabora.com>
References: <20220614091020.21472-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_001236_743430_B2D54BE9 
X-CRM114-Status: GOOD (  18.90  )
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

On Tue, 2022-06-14 at 17:10 +0800, AngeloGioacchino Del Regno wrote:
> Add the CLK_SET_RATE_PARENT flag to the CLK_VDO0_DP_INTF0_DP_INTF
> clock: this is required to trigger clock source selection on
> CLK_TOP_EDP, while avoiding to manage the enablement of the former
> separately from the latter in the displayport driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8195-vdo0.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c
> b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> index 261a7f76dd3c..07b46bfd5040 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> @@ -37,6 +37,10 @@ static const struct mtk_gate_regs vdo0_2_cg_regs =
> {
>  #define GATE_VDO0_2(_id, _name, _parent, _shift)			
> \
>  	GATE_MTK(_id, _name, _parent, &vdo0_2_cg_regs, _shift,
> &mtk_clk_gate_ops_setclr)
>  
> +#define GATE_VDO0_2_FLAGS(_id, _name, _parent, _shift, _flags)	
> 	\
> +	GATE_MTK_FLAGS(_id, _name, _parent, &vdo0_2_cg_regs, _shift,	
> \
> +		       &mtk_clk_gate_ops_setclr, _flags)
> +
>  static const struct mtk_gate vdo0_clks[] = {
>  	/* VDO0_0 */
>  	GATE_VDO0_0(CLK_VDO0_DISP_OVL0, "vdo0_disp_ovl0", "top_vpp",
> 0),
> @@ -85,7 +89,8 @@ static const struct mtk_gate vdo0_clks[] = {
>  	/* VDO0_2 */
>  	GATE_VDO0_2(CLK_VDO0_DSI0_DSI, "vdo0_dsi0_dsi", "top_dsi_occ",
> 0),
>  	GATE_VDO0_2(CLK_VDO0_DSI1_DSI, "vdo0_dsi1_dsi", "top_dsi_occ",
> 8),
> -	GATE_VDO0_2(CLK_VDO0_DP_INTF0_DP_INTF, "vdo0_dp_intf0_dp_intf",
> "top_edp", 16),
> +	GATE_VDO0_2_FLAGS(CLK_VDO0_DP_INTF0_DP_INTF,
> "vdo0_dp_intf0_dp_intf",
> +			  "top_edp", 16, CLK_SET_RATE_PARENT),
>  };
>  
>  static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
> -- 
> 2.35.1
> 

Hello Angelo,

Thanks for this patch.
Another dp clock should also be fix.
After confirming with Jitao who is our dp expert.
The parent of CLK_VDO1_DPINTF should be top_dp instead of top_vpp.

Thanks!

--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -43,6 +43,9 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 #define GATE_VDO1_2(_id, _name, _parent,
_shift)                       \
        GATE_MTK(_id, _name, _parent, &vdo1_2_cg_regs, _shift,
&mtk_clk_gate_ops_setclr)

+#define GATE_VDO1_2_FLAGS(_id, _name, _parent, _shift,
_flags)                 \
+       GATE_MTK_FLAGS(_id, _name, _parent, &vdo1_2_cg_regs, _shift,
&mtk_clk_gate_ops_setclr, _flags)
+
 #define GATE_VDO1_3(_id, _name, _parent,
_shift)                       \
        GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift,
&mtk_clk_gate_ops_setclr)

@@ -99,7 +102,7 @@ static const struct mtk_gate vdo1_clks[] = {
        GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPI0,
"vdo1_disp_monitor_dpi0", "top_vpp", 1),
        GATE_VDO1_2(CLK_VDO1_DPI1, "vdo1_dpi1", "top_vpp", 8),
        GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPI1,
"vdo1_disp_monitor_dpi1", "top_vpp", 9),
-       GATE_VDO1_2(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_vpp", 16),
+       GATE_VDO1_2_FLAGS(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_dp", 16,
CLK_SET_RATE_PARENT),

BRs,
Bo-Chen


