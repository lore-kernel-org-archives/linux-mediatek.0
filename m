Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B8C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJF/8BTnSqG+0qzLAs/+pNq+7xJdZS+ZH3azcuPryMo=; b=Va3PvWc/CuZGp4NOVFzu257cCd
	ELGQJOW+1BeZIZmzFMdnhpwPN5mAYdc7jWsNXM7ZhVt8zUvwXNeMYqxTkgPUa+aARfg3QessjHYrZ
	IC8JeCk3RNQj2jBwI6YqRGEXK79OLNNGWIiB/HX3NLRprIZOPbhAfxgdJXnrhVye8JtYIY/zf6B+k
	N93Cq0Sq94wD5w+M1lMWrWALwMLIWrYEHiiqeFS+6masLv24po/cAd6rrYseSxlye7mT52Kw1VUCn
	MR2uUyQVFW5p9sQ5oYU/sYpaPaxINU6r+goIKABGB7ayPBsVstGBkLDt7++xVZ5QhiYjXxXQ0DbuX
	tidReg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otT36-00FZoN-E3; Fri, 11 Nov 2022 12:22:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otT2w-00FZjJ-3o; Fri, 11 Nov 2022 12:22:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id cl5so6249283wrb.9;
        Fri, 11 Nov 2022 04:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJF/8BTnSqG+0qzLAs/+pNq+7xJdZS+ZH3azcuPryMo=;
        b=ReJtGUVtPIOZD10UwPMf/wuiKfYhAqeiyHBCvfLLM6JirZ+HESrvGnGq4lc9SZgpxT
         HCYbKDcafWQLxeXB2azC5v8/HBZ8kFHVzNylEizSHc6K9LSZS3Km/pYwy6iNVdjsXtlW
         QAIe01T57aYTpRw/QLp7MReKqt9RQePVfLkhnsQhaU9MfUa4ieGV5xwm8oz/XgvLz/dc
         6+PztoAvvKIR+BiZO9jy1tmtSluVaohUaF6HYNjwClF/Y1o98bzQ/Q0epxOn4dPIXqCY
         yBs1lpCaVlrRMrwbIxziU2N8nc4d72A1Mpcj+sQq0c+iBKh7/6fU/KaGMK/3hj56y7e7
         dl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJF/8BTnSqG+0qzLAs/+pNq+7xJdZS+ZH3azcuPryMo=;
        b=xhG2zjhmbFFo5aNue7QWOvaGKHJUJQqqWUc6pm3p7yHdxKyj4dv8wx0Y9AMhQjGAL5
         TTAgSyCiUqQnZxOiaaQMIdN5clThBbrp/dBOwE39uGg0k5gfzVueSScwJOC393Nf7ALm
         t7U3NEQvB+TuvzNFWJ6DoAvSX5fJUB3wlDTepflteR08NBSQCTmD8uiWbutLNI1zgyO6
         yyD0U3amdwG/FkFSb6QYhpVTvDfmUgJavCYM4s58BHJgadHDtp3LUWWJx0yv/3SWZ1Pw
         aPIlfloV5TL4UOPBu/fOrzLndlRXE/2cntMI8pJ85rQhX72Ij3IMOBbp0B+TK6htH/Vt
         y7wQ==
X-Gm-Message-State: ANoB5pmYvgWAeQu04Dq2ymflXRD1S1bZj9BbX34ySlJ09rRN83KrZ0nS
	Va+lFtp8S/F6Yy8puAjqiAQ=
X-Google-Smtp-Source: AA0mqf5yCmIRuMQealOe2SgKrahw6GpYmGze85fj/1zyx+KuAnlrqbktXvgYBo9gP7I7GVvBEc7nWA==
X-Received: by 2002:adf:f207:0:b0:236:8322:4be9 with SMTP id p7-20020adff207000000b0023683224be9mr1090927wro.171.1668169324130;
        Fri, 11 Nov 2022 04:22:04 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d540b000000b0022cdeba3f83sm1751168wrv.84.2022.11.11.04.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 04:22:02 -0800 (PST)
Message-ID: <73e5491a-9720-ea52-48ff-cc506c6dc582@gmail.com>
Date: Fri, 11 Nov 2022 13:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 2/4] arm64: dts: mt8195: Add edptx and dptx nodes
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
 <20221110063716.25677-3-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221110063716.25677-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_042210_189121_B6970650 
X-CRM114-Status: GOOD (  19.08  )
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



On 10/11/2022 07:37, Bo-Chen Chen wrote:
> In MT8195, we use edptx as the internal display interface and use
> dptx as the external display interface. Therefore, we need to add
> these nodes to support the internal display and the external display.
> 
> - Add dp calibration data in the efuse node.
> - Add edptx and dptx nodes for MT8195.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index c380738d10cb..7acbef5a4517 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1244,6 +1244,9 @@
>   				reg = <0x189 0x2>;
>   				bits = <7 5>;
>   			};
> +			dp_calibration: dp-data@1ac {
> +				reg = <0x1ac 0x10>;
> +			};
>   		};
>   
>   		u3phy2: t-phy@11c40000 {
> @@ -2205,5 +2208,27 @@
>   			clock-names = "engine", "pixel", "pll";
>   			status = "disabled";
>   		};
> +
> +		edp_tx: edp-tx@1c500000 {
> +			compatible = "mediatek,mt8195-edp-tx";
> +			reg = <0 0x1c500000 0 0x8000>;
> +			nvmem-cells = <&dp_calibration>;
> +			nvmem-cell-names = "dp_calibration_data";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> +			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> +			max-linkrate-mhz = <8100>;
> +			status = "disabled";
> +		};
> +
> +		dp_tx: dp-tx@1c600000 {
> +			compatible = "mediatek,mt8195-dp-tx";
> +			reg = <0 0x1c600000 0 0x8000>;
> +			nvmem-cells = <&dp_calibration>;
> +			nvmem-cell-names = "dp_calibration_data";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
> +			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> +			max-linkrate-mhz = <8100>;
> +			status = "disabled";
> +		};

For some not really obvious reasons we get the following errors with
make CHECK_DTBS=1 mediatek/mt8195-cherry-tomato-r2.dtb

arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb:0:0: 
/soc/edp-tx@1c500000: failed to match any schema with compatible: 
['mediatek,mt8195-edp-tx']
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb:0:0: 
/soc/dp-tx@1c600000: failed to match any schema with compatible: 
['mediatek,mt8195-dp-tx']

Can you please see how to fix this. Tested with next-20221111.

Regards,
Matthias

>   	};
>   };

