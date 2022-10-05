Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3759C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2ARNbWjWzrWSLd7BzhUTLcCyzjmT3yUMhwTkpGSXDA=; b=PCK1lGKqzCxAbNcUSn3BfEk8MG
	UEpigkxYcuzTq0oTrvJuF61JHs842r4EsH1Cs+hCWY2r5pFwwhgXf25FLCep5fFM5c21zaIFtHz9l
	dxRHlY2Iqp7qHJH8srhypxwOEa/e8yr0Le14GYVkFo+LYjTmo0HoUwCsbLRDZzSlG0J2MC1Dee8ew
	8GlWii+Nglcje+ZCkJrtZ3130oTZIXwGRipeCK/6LoW2w01sMZ9WXwmoON/vRab69p6Du4yXP/Mnq
	+inaGBwjguo0+CgRI4V2H73PBueJWfeHsExj1ocmwtMGpvV8GD0uonoX0Kj5kuQTGPoh0QMH8qj+S
	h1zTagfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzHa-00Cvtl-DA; Wed, 05 Oct 2022 07:57:34 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzHP-00CvrW-Tn
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 07:57:25 +0000
Received: by mail-lf1-x130.google.com with SMTP id b2so13493599lfp.6
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=D2ARNbWjWzrWSLd7BzhUTLcCyzjmT3yUMhwTkpGSXDA=;
        b=iCaQ5UjcHDNNPJYrlcmZHhEPHRd+reQ0eq2/8cdYJl0qEH2pPsz/HIGTbIjSdHM/wT
         YuwBAUuaOKD1iTOHehb0jBNUDbI199fFOp826jQxaOXYQ9dAMbh52D3y3+7LyO1TtkvW
         iMAlSe4eRyRhDYwG+LXh8jlU7ypmbdQUgh5SVdjGR3AJMeRI4iU7fTZxGEi92C68GayW
         pA2fkAW7SfgZSavya0NQKeCpsZ0rTzxItOy00KnyFAkcN5+YF770DK9SA8Rw+OVITKPD
         qQLfIHURg4h+pL4xKLw6Yfb1Vo8WgrkJ5A4PxsePTfdXufvorKBv+evGctOokFsmp0Gh
         yoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=D2ARNbWjWzrWSLd7BzhUTLcCyzjmT3yUMhwTkpGSXDA=;
        b=BE/Ue/hTu6ybudJurJb+64HGW0QJpZrt1JZXDX8gH9jyW8oHwpsgugXnb1Ho9YpRon
         CTpllBQBudKSzZl08qpKpk39l42e5ZT8BQa49Pt87MSYSr6zZTflXMzkz/YFjkG9xqak
         SccjYdVKl12m82zakHalxF94GbqX/nBsmr0yyiy5nI+jLfNRQN0C9yUtHGpZH4Z0qp2c
         L0rjvfDjyUwTW4HSzBBdWjKe87JD3E72bR/EUqSNCeA7guk2H8cQXhEPpVjvf0nH9hmh
         fef9MHIZWjWu2cOXaTvwaB+N95gRbNcLx063OSv/aOGiz65xnE6Jg39eqrNkX77KIeEQ
         1MmQ==
X-Gm-Message-State: ACrzQf3QnQ6BfRcr88lP/OPrF9vMKcyvXGRWChjSNDSaXc7kJnKJ1aqk
	WArlsczPNf/jZWdimcOC3iiYHQ==
X-Google-Smtp-Source: AMsMyM6EyDGQavd2wdukmVY8QwvLxO38/5hzfrh/8YLOQNbUIA620QQPwUeain0Cr1kIDxEJeYPs6g==
X-Received: by 2002:a19:f809:0:b0:4a2:2db5:8c41 with SMTP id a9-20020a19f809000000b004a22db58c41mr5387256lff.179.1664956639977;
        Wed, 05 Oct 2022 00:57:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049465afdd38sm2259888lfb.108.2022.10.05.00.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 00:57:19 -0700 (PDT)
Message-ID: <2665abdb-cc0b-dd88-a545-a76ac05d7448@linaro.org>
Date: Wed, 5 Oct 2022 09:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 2/6] dts: arm64: mt8195: add MMSYS and MUTEX
 configuration for VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
 <20221004093319.5069-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221004093319.5069-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_005724_051976_238F33C6 
X-CRM114-Status: GOOD (  15.66  )
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

On 04/10/2022 11:33, Moudy Ho wrote:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Compatible names of VPPSYS0 and VPPSYS1 should be renamed to
> "mediatek,mt8195-mmsys" to match the description of the binding file.
> Also, add two nodes for MT8195 VPPSYS0/1 MUTEX.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..7f54fa7d0185 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1477,11 +1477,20 @@
>  		};
>  
>  		vppsys0: clock-controller@14000000 {
> -			compatible = "mediatek,mt8195-vppsys0";
> +			compatible = "mediatek,mt8195-mmsys";

This does not look like matching bindings. Last patch for bindings was
requiring this to be prepended with vdosys0 and followed with syscon.

Best regards,
Krzysztof


