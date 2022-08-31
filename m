Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63FFECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQOr949BNq6Tsz1/GWbY8mmvpE6EQflLuQEMgsG3Mmo=; b=dHpdhTWgRH6r4FIKCRuv6UVvOR
	tIBAaTSL/FrCZjdRQw+LNIB3+/3gZWwzm8XClzdtr70b/sg3RDFkOTeRePIquTng08r/JXipVmpuu
	JidkCnvU08NH3kA85QplvMhPrddhx3G+ufIYh3PtXQDdG09IWBMXlbYSLS8W3bIVoOT+TBj2ljRdy
	X/zPQCVO0dTnaiUZdFlzh+nrLWSWO3pgTtugHvqwi++Ev4gOe1lTeM5tIuRnIe0lAHDGDre5Ei1ni
	XgcDbrjJVMKIDbJXvr0k2FkoFjV0DCAxoQKpMNrgRxLfiDxSNMwRpWe9/klL5ZozRMpb2Wkm6eIc3
	avizL3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTKse-005eY6-MU; Wed, 31 Aug 2022 10:23:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTKsT-005eVc-Qe; Wed, 31 Aug 2022 10:23:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id s7so2722221wro.2;
        Wed, 31 Aug 2022 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=QQOr949BNq6Tsz1/GWbY8mmvpE6EQflLuQEMgsG3Mmo=;
        b=N6qelCPephiPlFW95dJC6m2EGeguD6GlubhFgn3yrrYceSIOUjnmv2FjS7kLO784wp
         qrvliJMZE5Mo7cWGZCCBPEs9u7tIHTvUDcFyadVgRHjD8JMaVGl6e/WQ3w8FXN0Wzgl9
         WSgndB2UFYpyZGiRsigro0C/cTmIT/GoYcDMpZjyfkfh7z8PY17W3yfjNYbhcW/x5HnL
         BusJb87qgrJRvZ7VnFcHSX+IHmpOa5WN3l4XTUClj50rO4oltoGifwwy1DW4K4jJ3tUR
         Q1euY5dxLPmNybYtZJZcKB/HlplhwpnEy8geNmxX8NrnzypUWDE+0/xRFdmaSs15Yeqy
         U7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QQOr949BNq6Tsz1/GWbY8mmvpE6EQflLuQEMgsG3Mmo=;
        b=0PkQoUPJSdQ4AYB/Sly963uNwL8nqVEzlKOM4p5qICIWB3CgOYPBrQCUdB631Z3VaL
         BQ9nfasTh3B9pDq19CmwYujl1hIiDiDJsJZPkfTYLdYQiNRQPBCCWnh0gJ00VuK4mnVh
         RhqoICgHfWt1emuP47BLNPFwMDE5P4gszIUhc7L9Nj/rV3AMgIszo073u/bDzY/Vt3Qk
         KXB+BIvphXdaQfh/VpiKCwZAF7r0imTcwJHNtv0oGKY7klIYNEaY6X8VgcVVnJpbS7Wl
         LJT10w/Ell3sIPWxE947mQLQH0CcOD7LWITanGEk5vsec9jSIqR/pIJTdwj21vo8C0Kb
         6wKA==
X-Gm-Message-State: ACgBeo12hz6dSBg+NrVbmdaMqnqJ8SNmc2PIbjFn5L9nvOnfupF0gUyg
	W95WAvFAw3G+NU4QZVw7Z6I=
X-Google-Smtp-Source: AA6agR45AiRbadhtI8VHMxdZMgSj4iWs74MjjZ+50gkYRpG4I1dQpNdnXALXXj7dSaAbUnVb7glEHA==
X-Received: by 2002:a5d:47a1:0:b0:226:ebfc:f759 with SMTP id 1-20020a5d47a1000000b00226ebfcf759mr1265470wrb.636.1661941399465;
        Wed, 31 Aug 2022 03:23:19 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p8-20020a1c5448000000b003a63a3b55c3sm1955370wmi.14.2022.08.31.03.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 03:23:18 -0700 (PDT)
Message-ID: <995875c3-5b04-5981-b0e1-f66f73cdfafc@gmail.com>
Date: Wed, 31 Aug 2022 12:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220831065100.27722-1-tinghan.shen@mediatek.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: mediatek: Fix build warnings of mt8173
 vcodec nodes
In-Reply-To: <20220831065100.27722-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_032321_890127_9C979C28 
X-CRM114-Status: GOOD (  14.82  )
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

Applied, thanks!

On 31/08/2022 08:51, Tinghan Shen wrote:
> Correct the phandle of power domain node referenced by vcodec nodes.
> 
> arch/arm64/boot/dts/mediatek/mt8173.dtsi:1450.35-1471.5: Warning (power_domains_property): /soc/vcodec@18002000: Missing property '#power-domain-cells' in node /soc/syscon@10006000 or bad phandle (referred from power-domains[0])
> arch/arm64/boot/dts/mediatek/mt8173.dtsi:1502.35-1522.5: Warning (power_domains_property): /soc/vcodec@19002000: Missing property '#power-domain-cells' in node /soc/syscon@10006000 or bad phandle (referred from power-domains[0])
> 
> Fixes: d3dfd4688574 ("arm64: dts: mediatek: Update mt81xx scpsys node to align with dt-bindings")
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index b4d48f8b7eeb..7640b5158ff9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -1467,7 +1467,7 @@
>   			clock-names = "venc_sel";
>   			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
>   			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> -			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
> +			power-domains = <&spm MT8173_POWER_DOMAIN_VENC>;
>   		};
>   
>   		jpegdec: jpegdec@18004000 {
> @@ -1518,7 +1518,7 @@
>   			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>   			assigned-clock-parents =
>   				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
> -			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC_LT>;
> +			power-domains = <&spm MT8173_POWER_DOMAIN_VENC_LT>;
>   		};
>   	};
>   };

