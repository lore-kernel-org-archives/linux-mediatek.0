Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E054C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZ21D5E/FLy07SRW8GTErjOqqAsLC/DiyoP1d4QWIfE=; b=RMRwA42R/ur0bu/QHn5Ha5fde9
	8xknAzb8p1fPj8YDkX4E9JXdXWnxp1dAWnMIzu1L3OhLuCWQ9xT6jc2ROfIGG8EvGUVXenG2S+w3d
	3NVpyDKq8a4y/0HX8csV7z4myiPItQdBMv1wsY2YH+JYcMu+WhmA3fNugi/EfF2tmNoWontVlZmpb
	Bhe8NkRGQGYlCkYx0WEDC5HyDyWmcl0L5xd3zoyY3XTH/mjlwMvxpxZfdutRmtzaz6ff/g4LBWBdh
	Tx+epLkBX3PYanIc16zS+5x4ppcpMaLKDzMA7kb4l0Feoo7kPFq4Wkx4352vTfpZ33blF4qnMdmU+
	gARwzBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAwG-00B4ta-EW; Tue, 27 Sep 2022 13:47:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAw5-00B4ps-7M; Tue, 27 Sep 2022 13:47:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7004660035A;
	Tue, 27 Sep 2022 14:47:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664286461;
	bh=i3JE1JIoxOZavq36pGexdcMStHnjt09dhOhAqaqV0pU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q31Ig1kUQ4qn3jyA+OkbnkfpC/LG8fSULht8I4YhuJqyCULM8ZlT1vG5cuV7A1sEs
	 eCRgExYoMoMplEAUf/PNj/8dAAoT3DnG2DcVdxd4cunom34vB0la1qmQSzbyxuA1dz
	 WxGRpbPTnzzB1t8eItojj1wkP9jzI919ufjgtxYVd+Vzj3No+U4eIWHRpdafCJ946l
	 mtG8GGBHO7ORyRXeK44OyE2jW8Lt1iPdmqeoaJbBCizOTL7vzlnK54cA37tEUyYmON
	 u8lAS3Sfdgbr4Nb2zvoPgLNcKhFIEASXWK//xFETDqWdbiDzYWEEd48LOS7QcRVL3v
	 d00gVXqMtwMCg==
Message-ID: <4576f195-b390-2083-300c-bb31ad09a7ed@collabora.com>
Date: Tue, 27 Sep 2022 15:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/5] arm64: dts: mt8186: Add power domains controller
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
 <20220923131148.6678-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220923131148.6678-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_064745_562245_966B72F3 
X-CRM114-Status: GOOD (  14.75  )
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

Il 23/09/22 15:11, Allen-KH Cheng ha scritto:
> Add power domains controller for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 188 +++++++++++++++++++++++
>   1 file changed, 188 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 64693c17af9e..833e7037fe22 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -329,6 +329,194 @@
>   			#interrupt-cells = <2>;
>   		};
>   
> +		scpsys: syscon@10006000 {
> +			compatible = "mediatek,mt8186-scpsys", "syscon", "simple-mfd";
> +			reg = <0 0x10006000 0 0x1000>;
> +
> +			/* System Power Manager */
> +			spm: power-controller {
> +				compatible = "mediatek,mt8186-power-controller";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#power-domain-cells = <1>;
> +

..snip..

> +				power-domain@MT8186_POWER_DOMAIN_DIS {
> +					reg = <MT8186_POWER_DOMAIN_DIS>;
> +					clocks = <&topckgen CLK_TOP_DISP>,
> +						 <&topckgen CLK_TOP_MDP>,
> +						 <&mmsys CLK_MM_SMI_INFRA>,
> +						 <&mmsys CLK_MM_SMI_COMMON>,
> +						 <&mmsys CLK_MM_SMI_GALS>,
> +						 <&mmsys CLK_MM_SMI_IOMMU>;
> +					clock-names = "dis0", "dis1", "dis-0", "dis-1",
> +						     "dis-2", "dis-3";

What about using more descriptive names for clock-names?
disp, mdp, smi_infra, smi_common, smi_gals, smi_iommu

> +					mediatek,infracfg = <&infracfg_ao>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					#power-domain-cells = <1>;
> +
> +					power-domain@MT8186_POWER_DOMAIN_VDEC {
> +						reg = <MT8186_POWER_DOMAIN_VDEC>;
> +						clocks = <&topckgen CLK_TOP_VDEC>,
> +							 <&vdecsys CLK_VDEC_LARB1_CKEN>;
> +						clock-names = "vdec0", "vdec-0";

vdec0, larb

> +						mediatek,infracfg = <&infracfg_ao>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_CAM {
> +						reg = <MT8186_POWER_DOMAIN_CAM>;
> +						clocks = <&topckgen CLK_TOP_CAM>,
> +							 <&topckgen CLK_TOP_SENINF>,
> +							 <&topckgen CLK_TOP_SENINF1>,
> +							 <&topckgen CLK_TOP_SENINF2>,
> +							 <&topckgen CLK_TOP_SENINF3>,
> +							 <&topckgen CLK_TOP_CAMTM>,
> +							 <&camsys CLK_CAM2MM_GALS>;
> +						clock-names = "cam0", "cam1", "cam2", "cam3",
> +							     "cam4", "cam5", "cam-0";

cam-top, cam0, cam1, cam2, cam3, cam-tm, gals

> +						mediatek,infracfg = <&infracfg_ao>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8186_POWER_DOMAIN_CAM_RAWB {
> +							reg = <MT8186_POWER_DOMAIN_CAM_RAWB>;
> +							#power-domain-cells = <0>;
> +						};
> +
> +						power-domain@MT8186_POWER_DOMAIN_CAM_RAWA {
> +							reg = <MT8186_POWER_DOMAIN_CAM_RAWA>;
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_IMG {
> +						reg = <MT8186_POWER_DOMAIN_IMG>;
> +						clocks = <&topckgen CLK_TOP_IMG1>,
> +							 <&imgsys1 CLK_IMG1_GALS_IMG1>;
> +						clock-names = "img0", "img-0";

img-top, gals

> +						mediatek,infracfg = <&infracfg_ao>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8186_POWER_DOMAIN_IMG2 {
> +							reg = <MT8186_POWER_DOMAIN_IMG2>;
> +							#power-domain-cells = <0>;
> +						};
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_IPE {
> +						reg = <MT8186_POWER_DOMAIN_IPE>;
> +						clocks = <&topckgen CLK_TOP_IPE>,
> +							 <&ipesys CLK_IPE_LARB19>,
> +							 <&ipesys CLK_IPE_LARB20>,
> +							 <&ipesys CLK_IPE_SMI_SUBCOM>,
> +							 <&ipesys CLK_IPE_GALS_IPE>;
> +						clock-names = "ipe0", "ipe-0", "ipe-1", "ipe-2",
> +							     "ipe-3";

ipe-top, ipe-larb0, ipe-larb1, ipe-smi, ipe-gals

> +						mediatek,infracfg = <&infracfg_ao>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_VENC {
> +						reg = <MT8186_POWER_DOMAIN_VENC>;
> +						clocks = <&topckgen CLK_TOP_VENC>,
> +							 <&vencsys CLK_VENC_CKE1_VENC>;
> +						clock-names = "venc0", "venc-0";

venc0, larb

> +						mediatek,infracfg = <&infracfg_ao>;
> +						#power-domain-cells = <0>;
> +					};
> +
> +					power-domain@MT8186_POWER_DOMAIN_WPE {
> +						reg = <MT8186_POWER_DOMAIN_WPE>;
> +						clocks = <&topckgen CLK_TOP_WPE>,
> +							 <&wpesys CLK_WPE_SMI_LARB8_CK_EN>,
> +							 <&wpesys CLK_WPE_SMI_LARB8_PCLK_EN>;
> +						clock-names = "wpe0", "wpe-0", "wpe-1";

wpe0, larb-ck, larb-pclk

Regards,
Angelo

