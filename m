Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58877C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDlEuFCBkdVRiL30o36F0YHf2u/rviJA13UeBNADX6E=; b=Tk1cnIEwi2p3mlB9czlOSXzzY5
	ZTeX/lY77f87ON6hAu8KljX8BnVqMh+H4mCtX3MM9+hnl9uzaDE8oMgcb80FmZ/SKXocE4ABlZxRJ
	gAvKCkRY4a7OE3rkIbRVOKufdzWg303gCr2SEPbmTjgfJoTgujvWC9PVloIrEUz8/Yrw9HnxrmgtE
	BPo7bQsgrqQoLKAd8bbSJezLwm+xwMzf8kaOgTLrvJqJTCln9XkC1QslattVtg7RxhenCqPETBy0r
	iFaQ0z+/J6W7gMwSiK5ewxbZFJqqiq1v/mtJjf7mQkUlHzXh2afDSl78lSN5/NcZVj3jGrnTLc5Vi
	tk7xNcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTVW-007XK3-OB; Tue, 08 Nov 2022 18:39:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTVR-007XHv-QH; Tue, 08 Nov 2022 18:39:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id y16so22346812wrt.12;
        Tue, 08 Nov 2022 10:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDlEuFCBkdVRiL30o36F0YHf2u/rviJA13UeBNADX6E=;
        b=oZgvgoauLGM+Et3oeewioTomOSt9a57yhx+w7jvo/dLkd+N4wHA9fqLsjdkYRB+A+6
         EUmJqDrvL2K7YKaNXMyVhRvY36XvITlaGCabK6XyPw/5gMrNcG0JoAfU+efXo6J+eu+o
         YOPYiWSjFYcEcHcB7osfQ5BYSuoOjshPXORlB6O8Rxj5+KC7qJ9a1ArBrVM2KrkRkD95
         EqEL5uCurls6ejSygf05NwZfa3c6O2WmCT7ucFJdapAiBayPdLBy/J8/wt9gZXAiRaHt
         Upn8FEFMs3m6wSNUT8tE//LnVkIi3s02glVFFh1SYcSUNMTdVLgunW7Xm9tju27euzoW
         74hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDlEuFCBkdVRiL30o36F0YHf2u/rviJA13UeBNADX6E=;
        b=Fa2D++iBv+B5f6MCrrIzgI/ngnyUFeM17foPwyNkfpRTIdiPZsnW/hn7EyzZdHXdre
         C+4vCrlXblKrd2RTa9zIowdeXJIsvnPzENJQ1yj6R1SqTJiq7JGR6M1KGRKgQB3gLzVT
         NkWHJlly+JLH228JlIAoq4tN8uA64ciK+vPxSTFbNvPkCNbBa5CyUzay1X6izTUGHbPZ
         KmDSIKB4yG7l0ng8Mk3OQkwcdoe2zms4NnV6UGFy2pOBQQSgnIQaI0BXdXO14yQIchp5
         KBn7ie5pCACp2uFCNqt2JIdO6v1HIN8Ktmwf/NCA3vmM8Oi0D2c0Kwu+GQrczj6dcNv8
         xhpg==
X-Gm-Message-State: ACrzQf1tuh8Lr0TK8uMWeSoNj/eaEbvOyoJgSH9w/0R+VWx8QJ8kJpcx
	LvMKbntKkdsmFmpmW4Lktt8=
X-Google-Smtp-Source: AMsMyM5U4O4Ks0X3U7IIFCiH2wrc6/rcOFM1HBtZ7MAH8fXll7ttTvdO2hWx5RuEBHNM5XLkhMJS3Q==
X-Received: by 2002:adf:f386:0:b0:236:6e8c:f5bb with SMTP id m6-20020adff386000000b002366e8cf5bbmr35438914wro.587.1667932768232;
        Tue, 08 Nov 2022 10:39:28 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id r9-20020adfdc89000000b002258235bda3sm11079057wrj.61.2022.11.08.10.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:39:27 -0800 (PST)
Message-ID: <8e8bf059-7347-3586-0cc9-e02c007de9b2@gmail.com>
Date: Tue, 8 Nov 2022 19:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 3/3] arm64: dts: mt8195: Add venc node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>
References: <20221103025656.8714-1-tinghan.shen@mediatek.com>
 <20221103025656.8714-4-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221103025656.8714-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_103929_930752_9A70B1BB 
X-CRM114-Status: GOOD (  15.31  )
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



On 03/11/2022 03:56, Tinghan Shen wrote:
> Add venc node for mt8195 SoC.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied this patch, for the 2/3 we need PCIe maintainer to take the binding 
change or provide an ACked by.

Regards,
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 7d74a5211091..dbfc15174de3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2109,6 +2109,30 @@
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
>   		};
>   
> +		venc: video-codec@1a020000 {
> +			compatible = "mediatek,mt8195-vcodec-enc";
> +			reg = <0 0x1a020000 0 0x10000>;
> +			iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_REC>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
> +				 <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
> +			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,scp = <&scp>;
> +			clocks = <&vencsys CLK_VENC_VENC>;
> +			clock-names = "venc_sel";
> +			assigned-clocks = <&topckgen CLK_TOP_VENC>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +		};
> +
>   		vencsys_core1: clock-controller@1b000000 {
>   			compatible = "mediatek,mt8195-vencsys_core1";
>   			reg = <0 0x1b000000 0 0x1000>;

