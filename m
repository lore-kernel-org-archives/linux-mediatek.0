Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852EEC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jTmAQHN2+OXRqY503UggSJwokP+lo1DAE3YraqVPgU=; b=F8v2EKdQy2IAy53b9g/hoEjZXk
	gbdUHJbRMoxdyaa0FuzWBSMJDxWH3y4rUxrx+L2PCHuy8JgL/5DgGD7A4SGSuBgfD24zTqvTfZIfd
	wY3i267c6ZXHVvURSHbCWqEukoUpE6aZuc3ap60j9v8qF+x+vw4JfZtU15nKlSOe67EWW+jsOOIcy
	tnTbfxHZY76+1gavcDyzO4WCKx5IeCFjlRTR3ixbAua/Kj8/sXOg4BYElXG3c4Q5NBFqoiext0seW
	fd0aTDXxuyNi/O95nU5YONzojEg+f07mu5+dZgA6G8ialTkpfqkpVEzfEtOE2gfBzdO+O9wW7NGFr
	YUfwmPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCUN-0071gT-0D;
	Fri, 31 Mar 2023 11:00:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCUD-0071eG-0J;
	Fri, 31 Mar 2023 11:00:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so15057711wmq.4;
        Fri, 31 Mar 2023 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680260400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jTmAQHN2+OXRqY503UggSJwokP+lo1DAE3YraqVPgU=;
        b=AS6rtvhoVboqTtIZPL2lpA1igZcWE5laXowWtQURab9TW369XdjV2ROkp+9hWF0KyB
         ffUSpQg7/9CrK3+QutvI1nikpZJ6j9ttznvpoYwyVseZe0kBoQGsl4DEwGBY0SMG5Wgg
         h/9tlnYecR3bG79UvqT1crr6DqXmd7DTA1LgSbXhMjXivyBEeFikcyH0DsdQazf6I63s
         u0xIkCKDysVqhRgKa3hbhDY9Ou5Yt9ZiFaOBSDsbFqIRcp2MrTqaabDCYM4dijUQ2tqI
         Q9Uc2G+DUBGf/SYYhl7nHWukck0B046j2mjZymjHHOBdLmqwAylrEJ+9eU8s5bWdcaKJ
         ZRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680260400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jTmAQHN2+OXRqY503UggSJwokP+lo1DAE3YraqVPgU=;
        b=ajKZb6aZkN/GUC/VoR2lqX9iFlM0HeyafbT//598Dr4iAMUh8y+kPqbncp3S/D+bCl
         kFhbaZDgn+8/dxCZ+EbOJOHXvVOw3IrLew/pqkEohbKpGwqeZU3fI8cRHdWVBpi3QBpT
         oDTJN3xbRtzHEouIrTf4qupH1w2laoUxudYVSZ31q6dLZWxVQ3obFYz8k/gBJRcW3CUd
         N9B2PcqnZcpVCFtkeL/pvfK5dYmpjyT5psYAV1VaG0Pf+RSQLONuLd7hkQxYrO+Rc8/0
         rwtVhj5pFXGNuI7ibu01ATk9zTsw/xBSrH+mb/bzGp3psexLkOfzsXG0GMtkKk4No/b+
         8tHQ==
X-Gm-Message-State: AO0yUKWMGHWv+yzSMfzDpD/VCaCju8qELem2opdVzC8k36Z6haNBV6SR
	3fvT6G3rzdTGQb9fuokujzQ=
X-Google-Smtp-Source: AK7set8WUdMxXiPG2/ws5noGWksr8D1CcLYSgekqr3nf9OtFvnMz/XzWv/14/4gIPB2erSFUKJRoPg==
X-Received: by 2002:a05:600c:22d6:b0:3ed:e5db:52e1 with SMTP id 22-20020a05600c22d600b003ede5db52e1mr21011292wmg.15.1680260399628;
        Fri, 31 Mar 2023 03:59:59 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003dd1bd0b915sm9483254wmq.22.2023.03.31.03.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:59:58 -0700 (PDT)
Message-ID: <848971ea-b142-d088-df6f-74ee2d807950@gmail.com>
Date: Fri, 31 Mar 2023 12:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 11/11] arm64: dts: mediatek: mt8195: Add SCP 2nd core
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
 <20230328022733.29910-12-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230328022733.29910-12-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_040001_132705_CCA901C2 
X-CRM114-Status: GOOD (  16.43  )
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



On 28/03/2023 04:27, Tinghan Shen wrote:
> Rewrite the MT8195 SCP device node as a cluster and
> add the SCP 2nd core in it.
> 
> Since the SCP device node is changed to multi-core structure,
> enable SCP cluster to enable probing SCP core 0.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

As this is a bigger change I'd prefer to take it through my tree once the driver 
and dt-bindings changes are merged. Given the fact, maybe it would make sense to 
take 2/11 through my tree as well.

Regards,
Matthias

> ---
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  6 +++-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 32 ++++++++++++++-----
>   2 files changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 56749cfe7c33..31415d71b6a4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -933,7 +933,11 @@
>   	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
>   };
>   
> -&scp {
> +&scp_cluster {
> +	status = "okay";
> +};
> +
> +&scp_c0 {
>   	status = "okay";
>   
>   	firmware-name = "mediatek/mt8195/scp.img";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 8fc527570791..5fe5fb32261e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -826,14 +826,30 @@
>   			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
>   		};
>   
> -		scp: scp@10500000 {
> -			compatible = "mediatek,mt8195-scp";
> -			reg = <0 0x10500000 0 0x100000>,
> -			      <0 0x10720000 0 0xe0000>,
> -			      <0 0x10700000 0 0x8000>;
> -			reg-names = "sram", "cfg", "l1tcm";
> -			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> +		scp_cluster: scp@10500000 {
> +			compatible = "mediatek,mt8195-scp-dual";
> +			reg = <0 0x10720000 0 0xe0000>, <0 0x10700000 0 0x8000>;
> +			reg-names = "cfg", "l1tcm";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0x10500000 0x100000>;
>   			status = "disabled";
> +
> +			scp_c0: scp@0 {
> +				compatible = "mediatek,scp-core";
> +				reg = <0x0 0xa0000>;
> +				reg-names = "sram";
> +				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> +				status = "disabled";
> +			};
> +
> +			scp_c1: scp@a0000 {
> +				compatible = "mediatek,scp-core";
> +				reg = <0xa0000 0x20000>;
> +				reg-names = "sram";
> +				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
> +				status = "disabled";
> +			};
>   		};
>   
>   		scp_adsp: clock-controller@10720000 {
> @@ -2309,7 +2325,7 @@
>   				 <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
>   				 <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
>   			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> -			mediatek,scp = <&scp>;
> +			mediatek,scp = <&scp_c0>;
>   			clocks = <&vencsys CLK_VENC_VENC>;
>   			clock-names = "venc_sel";
>   			assigned-clocks = <&topckgen CLK_TOP_VENC>;

