Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A21CD4F3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/ODN1+tSGNhm8mIdbdTdIsiSDLajAETHagv5I2f8UU=; b=tDTLu4h3TUhLkeZg9Tvknf86wp
	BWURs1w2Ahnpcvvs7sdwRPTzGwjcuExjjfw9S28taMSH3mxVr1JgsLPJwZ97mYc26wa8lrvop/Zpf
	7lydWTxQWuM5GwSXZhPOeetLwxqUJ9d7zTUpo8dmV5GdL/vM+lqf3Ob5nHbcbaE84liCEXRUEp6m1
	j2u6mHGK4Hwfr2Qs9zOsaIzcnpm1uP6iFvTBoPo+GrQn8+z27I6/OBi8UNbpejFgsUvMeZpYed2vG
	mxCUMD5m7+Y0LXu5uJHi7IkwUI7T2vhKD/9HlAgI268Ns6RB+wTOJF+XL9693cAZ5sqhVqhiw9z02
	Hvy7mM8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbXs-008QBm-0S;
	Fri, 22 Sep 2023 08:29:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbXh-008Q7V-31;
	Fri, 22 Sep 2023 08:29:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9124F6603102;
	Fri, 22 Sep 2023 09:29:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695371378;
	bh=5R8v6wvd1MpFZX3AbIVOvcY34E23OlIoFUwytGVOO7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z0+Yh0shm7ykovp53zYib/YCrUbjUxWqtXNUEczVVlnDvIsI9DpCZ8UHU477vqYh0
	 oAGQI9GStmrmL3MzLw1WI+3ZNysgViuZq3xHPjM+0kkCFWHKIMC4PONLHWqTfcSpd1
	 UQh/gmJ3uqOqcSrO03/KYThE9GtcqG4R0UVXtnDpIGqzMI8t6UlU9B/8bYMXtTVQiQ
	 nEFKLyZD+UEGAFdBx/SLI4KpDdtvys3YoT7lJWA1lfVKVtLr8WRVNFVBuqpYpJTEkh
	 0XSsDGU/Cnzv+CStYCs8r2U3+CtOhNjWGgKNEo0exDGqg8k3lflP7eZbZP90IoQjn2
	 QIJluJHBjs7nQ==
Message-ID: <a41148b8-295a-58ad-7c72-2713d89e4f83@collabora.com>
Date: Fri, 22 Sep 2023 10:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: mt8195: add MDP3 nodes
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230922065017.10357-1-moudy.ho@mediatek.com>
 <20230922065017.10357-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230922065017.10357-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_012942_238411_4345CDBD 
X-CRM114-Status: GOOD (  14.64  )
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

Il 22/09/23 08:50, Moudy Ho ha scritto:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 388 +++++++++++++++++++++++
>   1 file changed, 388 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 4dbbf8fdab75..cf61ba7b8956 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1960,6 +1960,114 @@
>   			#clock-cells = <1>;
>   		};
>   

..snip..

> +
> +		display@14006000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";

Please always add a SoC-specific compatible (both here and in bindings).

compatible = "medaitek,mt8195-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";

> +			reg = <0 0x14006000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x6000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RSZ_IN_RSZ_SOF>,
> +					      <CMDQ_EVENT_VPP0_MDP_RSZ_FRAME_DONE>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_RSZ>;
> +		};
> +

..snip..

> +
> +		dma-controller@1400c000 {
> +			compatible = "mediatek,mt8183-mdp3-wrot";

same here

> +			reg = <0 0x1400c000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xc000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_WROT_SOF>,
> +					      <CMDQ_EVENT_VPP0_MDP_WROT_VIDO_WDONE>;
> +			clocks = <&vppsys0 CLK_VPP0_MDP_WROT>;
> +			iommus = <&iommu_vpp M4U_PORT_L4_MDP_WROT>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
> +			#dma-cells = <1>;
> +		};
> +
>   		mutex@1400f000 {
>   			compatible = "mediatek,mt8195-vpp-mutex";
>   			reg = <0 0x1400f000 0 0x1000>;
> @@ -2107,6 +2215,286 @@
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
>   		};
>   

..snip..

> +
> +		display@14f14000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";

and here

> +			reg = <0 0x14f14000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x4000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_RSZ_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP1_MDP_RSZ_FRAME_DONE>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_RSZ>;
> +		};
> +
> +		display@14f15000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";

...and here

> +			reg = <0 0x14f15000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x5000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_FRAME_DONE>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>;
> +		};
> +
> +		display@14f16000 {
> +			compatible = "mediatek,mt8183-mdp3-rsz";

......and here.

> +			reg = <0 0x14f16000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x6000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_FRAME_DONE>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>;
> +		};
> +

..snip..

> +
> +		dma-controller@14f23000 {
> +			compatible = "mediatek,mt8183-mdp3-wrot";

...again... and for the other two occurrences of wrot as well.

Apart from that, looks good.

Regards,
Angelo

> +			reg = <0 0x14f23000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x3000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_SOF>,
> +					      <CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_FRAME_DONE>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_WROT>;
> +			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_WROT>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
> +			#dma-cells = <1>;
> +		};
> +
> +		dma-controller@14f24000 {
> +			compatible = "mediatek,mt8183-mdp3-wrot";
> +			reg = <0 0x14f24000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x4000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_SOF>,
> +					<CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_FRAME_DONE>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_WROT>;
> +			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_WROT>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
> +			#dma-cells = <1>;
> +		};
> +
> +		dma-controller@14f25000 {
> +			compatible = "mediatek,mt8183-mdp3-wrot";
> +			reg = <0 0x14f25000 0 0x1000>;
> +			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x5000 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_SOF>,
> +					<CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_FRAME_DONE>;
> +			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_WROT>;
> +			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_WROT>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
> +			#dma-cells = <1>;
> +		};
> +
>   		imgsys: clock-controller@15000000 {
>   			compatible = "mediatek,mt8195-imgsys";
>   			reg = <0 0x15000000 0 0x1000>;


