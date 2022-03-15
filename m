Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21785C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvcfOGBnGIxtrxfREJ8qDCbjNl6SB2RCsK8HnV0btRQ=; b=1Wq1SGsiVZT6g8
	F7Oj1WX/AKtUwsdfwURuj+5xpN/kdjci2KnQLE+G6r/72eu7peAIpLxXES6hApVxX/M6DPttM/vZ9
	3BLzXBektXcekJqiRhSiM3DodaWYplDyMPQHzEgNPa1TmM+XonMljpR+AVQAjRqD0+EpL1GookjRO
	Sed4chHQXZ5Gre5ZTBevY0Q7sXypwzLKs1zJhCZ5DUp2AgTljeNWjiI41tJoyYcalukNF26G0mPMX
	p/TQ3MuGaaYBe8YRkc/KjFDz8dLmbq/fUNrkic5y4zhfpLuXKQzuyHZKKtHwnWj9K+T/Yq0Ib5R7Z
	PgAjQ0s5XjZJd3nc10bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8SG-009XSl-59; Tue, 15 Mar 2022 14:47:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8S1-009XPX-Q4; Tue, 15 Mar 2022 14:47:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E1B6E1F42EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647355624;
 bh=IR+pW29vwKpjjmBqvGZ3LB+SNS5bnCefYbo8aC6sJWU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bp3ievLV+eSSIagMLXGDCH2WguJGGv8p1YZZ5fPggMAEwsjBquzlreWjWmAlZKdNZ
 njRq5g5+0I7cSuTF+tDy6VmrjgocrqQWTR8VNLdYgXIX87rVv6AfYdRkXpuYuyJBH6
 Db0eVvAjg/i8fGlRSTsJ77NgF0RMd6OX3kk6+ME/yG54eFdSFf9PhEqrqZl01faLtm
 /cl9mn0vxZwO9sJN30LsPPqS2NrgKy401mULFcuOOWk1+GHRCwgJzsgLMpyh4rd1iw
 RuByvbMU3EE84RjXbeW8BBZBbIK+J4lRoMq8HrhS7HiYej0pf3LuX1xx3w6TaQK738
 CPncbaJEzLcjA==
Message-ID: <dc4ce2b5-bf8e-ea20-f9b1-9034caff421b@collabora.com>
Date: Tue, 15 Mar 2022 15:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 12/21] arm64: dts: mt8192: Add mmc device nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-13-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-13-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_074706_013159_A9761268 
X-CRM114-Status: GOOD (  14.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> Add mmc nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 +++++++++++++++++++++---
>   1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6220d6962f58..4e4081ea7db5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1150,10 +1150,36 @@
>   			#clock-cells = <1>;
>   		};
>   
> -		msdc: clock-controller@11f60000 {
> -			compatible = "mediatek,mt8192-msdc";
> -			reg = <0 0x11f60000 0 0x1000>;
> -			#clock-cells = <1>;
> +		mmc0: mmc@11f60000 {
> +			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0 0x1000>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>;
> +			clock-names = "source", "hclk", "source_cg", "sys_cg",
> +				      "axi_cg", "ahb_cg", "pclk_cg";

Can you please use the same clock order as specified in the dt-bindings?
This means that "pclk_cg" goes before "axi_cg".

				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>,
				 <&msdc_top CLK_MSDC_TOP_AXI>;
		clock-names = "source", "hclk", "source_cg", "sys_cg",
			      "pclk_cg", "axi_cg", "ahb_cg";

> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@11f70000 {
> +			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11f70000 0 0x1000>, <0 0x11c70000 0 0x1000>;
> +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>;

same here please.

> +			clock-names = "source", "hclk", "source_cg", "sys_cg",
> +				      "axi_cg", "ahb_cg", "pclk_cg";
> +			status = "disabled";
>   		};
>   
>   		mfgcfg: clock-controller@13fbf000 {

After applying the requested changes,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
