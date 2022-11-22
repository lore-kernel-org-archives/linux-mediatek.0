Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548FEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiUhg3FHHbL4yCRYUiDHX0EGd7vPMcRRXz/Ys0GPzoA=; b=151HJTjpiJhmsjCCZVsGLuimos
	iX7/AMS/VIEK5voNDKm/OCNNMPJIcLSR6tnz6TnljAIX5ysn4scFXoOEzzaH0ViGdzOpc9jFkAcYn
	IsjSLyNfi6YsSa4bZWkx2d7XISnkzwM3jjHywEzqwuE2IUxY58YR5nVrgcrqocgQzTcx8Y1Eoaif3
	+Hq4MPPUftlCUmfTo+czRmyV0/Fc6S5KMfh774INdgXiV9a0ZYHgdrMsUTI/0BRRWzCOc+c2Bz8WV
	rCPjuCnzwlFc6ckn2T0NagfxyJhxKS8WEs4uR0HxHOKPhU585WRU9TwfKw/lgWs/3IzvlJwhwwEQG
	poIEIEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxXJN-00B87d-2v; Tue, 22 Nov 2022 17:43:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxXJC-00B84V-EX; Tue, 22 Nov 2022 17:43:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id v7so11291527wmn.0;
        Tue, 22 Nov 2022 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QiUhg3FHHbL4yCRYUiDHX0EGd7vPMcRRXz/Ys0GPzoA=;
        b=CdHYD/SYZJ9EVvNAFs8NUzwgDUesRc9t6zBFahz6oVfS3h82z2sduYPwvdOQW9hdDr
         ddUz7nPSjT3EiD2rj64TLMK/hmr2AsfujkOxJQCnl58gF8q6ah03sUD0XRXBoKcKaOdC
         d8kFjaF6l01ZT5TVq7oUHC/0juq6WezIArgbAkMjkifETlqZF/yAyWHFO8WgzB667FsQ
         fYOGjzYkuEL7bmYYkO6O/xQecuNz84+3il4y8AZGUZ9Rl39DIS5fO6tc+3X7f6J3HQLK
         MIDM/Alv/j3ov6oy5g88CkGJ/g7mtU4MaLLDGOxS1REnsfCAsqeVm6GFm0Lb4wwnVhCx
         cOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiUhg3FHHbL4yCRYUiDHX0EGd7vPMcRRXz/Ys0GPzoA=;
        b=fiwmDBxpwSBVhzOgIbil7P8nabh8I+IAPH9EPNTdf/9DtDNJAImoWBpEoInWwmLpPR
         Q224NgEFVBHuOvea44aoPivVStFlu7BAZPL53P+zQKLcYLN0rBQU3wMe0AgUgMMrvcvg
         3TM++gg1CYbi2BbA1DtCVVwZjatBuSNzx8MBqAS2DhHy4llN4ObO9FhqFWC/M3PvEokM
         521iUhkE5KtR9Gj+sd92jMk7v02QwFSrXortPkzYWGewLmgUvwMyJ6tk0BYNLaX51FnF
         OIqRIiM963qouEK0+NPAtJ9PfWGIpzv0ii2f3G6Mwmw+7EqbvarnTB74ree10k6NaC9p
         bp6Q==
X-Gm-Message-State: ANoB5pmwyGkqD0QObjmiv60f0oeHO8BdXPFck0agPSicZwUXVkqg2oZL
	fWbvah6lWnGdFy2+n1fAHBJTBOOGL8w4pQ==
X-Google-Smtp-Source: AA0mqf7ouF49HDBxoi6CEP4X5o2rlfUkOmvfj65dtk7FUzN6WJ3TpQbjfDwvzGAdcSuiVoGRCcHRfg==
X-Received: by 2002:a05:600c:4894:b0:3b4:91f1:da83 with SMTP id j20-20020a05600c489400b003b491f1da83mr6850890wmp.127.1669139025009;
        Tue, 22 Nov 2022 09:43:45 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm24181615wmq.31.2022.11.22.09.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 09:43:43 -0800 (PST)
Message-ID: <0d5dd24c-2386-c3b1-8143-0a00eac44ad0@gmail.com>
Date: Tue, 22 Nov 2022 18:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] arm: dts: mt7629: Remove extra interrupt from timer
 node
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
 <20220929122901.614315-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220929122901.614315-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_094346_517635_E366CF8B 
X-CRM114-Status: GOOD (  13.18  )
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



On 29/09/2022 14:29, AngeloGioacchino Del Regno wrote:
> There's only one system timer event interrupt.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Queued now for the next merge window.

Matthias

> ---
>   arch/arm/boot/dts/mt7629.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
> index 46fc236e1b89..acab0883a3bb 100644
> --- a/arch/arm/boot/dts/mt7629.dtsi
> +++ b/arch/arm/boot/dts/mt7629.dtsi
> @@ -106,8 +106,7 @@ timer: timer@10009000 {
>   			compatible = "mediatek,mt7629-timer",
>   				     "mediatek,mt6765-timer";
>   			reg = <0x10009000 0x60>;
> -			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&clk20m>;
>   			clock-names = "clk20m";
>   		};

