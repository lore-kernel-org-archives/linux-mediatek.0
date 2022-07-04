Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A06BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAn7H856GfFRIZFIPVXMWyj53npckuCFDy0OCv3VUpA=; b=VWCpeHmowaIQWqOeNTele8LUAn
	8u0TL0Zawa4qvgQIzOQyaUl9p6zPWHWWCXC98TAysVKflqDAJFUoz3b1azKbxDPAhkQU5HBWydDa7
	I9lOlJNKRGUYJfAv3FIdFP+rBBn5QjErAqomAcSEKrtvaLv4cDOIqHYGluKg+FF4f8zYhQ+Hf9p1F
	nL2vS+76813muuvoGvt5lX3BixoEMSnJFFM3CKbrUuYvZe6TbBvtMPDPIj4tprgaA35loPF3B5lyS
	CWn8N6908Wggq+NsvavZMT23ayUk9s/BuJsfZgrr17qOAg/p1SVVeCNj80zmh1kjnhQsFYuFJB/Wk
	OAJP7rmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LLW-008pgQ-JK; Mon, 04 Jul 2022 12:38:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LLJ-008pZW-W7
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 12:38:23 +0000
Received: by mail-lf1-x135.google.com with SMTP id y16so15535484lfb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BAn7H856GfFRIZFIPVXMWyj53npckuCFDy0OCv3VUpA=;
        b=ttufPLcTzCznFU5yCsxwU6S2KKVGSbhhl1fAH1EC/QzUhgf5uu757WjgKjCILW6C8G
         ahnSm/UjhZWTglFPNpkRIqigLPNAdTTxYrUW/kvlcHzSP9lHm6LODb7RYRLLrwMvXMyb
         E6MhPv2VXM2CbgjD9ayU4di+itAGXAmQcI0Ubus9FL/o8zGyP3+QXSernOCsmyDXhWSw
         RXv+RR5rzdHAHxxYuJb/VIDS0BB5RwP9qBeV4XqjYZ363eVcqgw3pf42j/Ao0HpPHA7L
         mlpp4lPV6WC9Fmybv7sumvnEDbDhQI16EubQ0mhf+MX+n7+r0ovazuyjaoVNMYIfgZiM
         tDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BAn7H856GfFRIZFIPVXMWyj53npckuCFDy0OCv3VUpA=;
        b=FAFZGEiUm+8OaG5q91hYzOID1J1jcjOy8mm0bG3fcWx3HVmNGv/MrL7hDarplIyZzn
         5UuMDHNDDVeqQrLUGMxXHzCWMsIhK4VUsCyG0ywBhP102nHGm3qOq7xT1uP0Df4w6R/a
         eDgs7ENWkokW6s5b3hu03WaGSV+9ZAkQecWVZaoON786uS5F9WRu9vjPeVu0TNBSpP/S
         ZrdMBdYcz0sBd13r7GbNEoJ14vcy68xKti1bDVyjXkegDP9uVi4iFuVnrRzyo/JQkYDn
         lfPt5nDOMT6B/OXXLhPK6Rg2nl7ry6MMg6mDI97flo+N4xpS+eOrHd2spjeAOTW+vFwW
         OTtw==
X-Gm-Message-State: AJIora+c8OKgtwXChf1+oh+e1I/MeOC7cqD5dIiOJUFQ/vVcR2xsGwPs
	A1feXz2LkPM4ci3mr1AshwNIrA==
X-Google-Smtp-Source: AGRyM1tVufJHyD7qAM2njRRF0qbXtYAbqkVJD/3FnkNNHjFwWDejKXalAn22BDebBg99Lz1Y+vUkXw==
X-Received: by 2002:a05:6512:4006:b0:47f:912d:1400 with SMTP id br6-20020a056512400600b0047f912d1400mr18533386lfb.466.1656938298236;
        Mon, 04 Jul 2022 05:38:18 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s11-20020a056512214b00b0047fbc399ad2sm5008363lfr.245.2022.07.04.05.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 05:38:17 -0700 (PDT)
Message-ID: <3b65405d-167f-a0c7-d15e-5da6f08d99b3@linaro.org>
Date: Mon, 4 Jul 2022 14:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains controller
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-9-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704100028.19932-9-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_053822_138775_D579E2C0 
X-CRM114-Status: GOOD (  14.48  )
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

On 04/07/2022 12:00, Tinghan Shen wrote:
> Add power domains controller node for mt8195.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
>  1 file changed, 327 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 8d59a7da3271..d52e140d9271 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +#include <dt-bindings/power/mt8195-power.h>
>  
>  / {
>  	compatible = "mediatek,mt8195";
> @@ -338,6 +339,332 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> +		scpsys: syscon@10006000 {
> +			compatible = "syscon", "simple-mfd";

These compatibles cannot be alone.

> +			reg = <0 0x10006000 0 0x1000>;
> +			#power-domain-cells = <1>;

If it is simple MFD, then probably it is not a power domain provider.
Decide.

Best regards,
Krzysztof

