Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B8C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEDO+a+YPral4I5ZXkXL8wMMW0VCrN+c97/tzuL0GN8=; b=codq7JVGEXIXKI1JuBeWXqcRl7
	Y5WM9Wr7bTRpLxXaVUdJYoXMHIZbFPG7cNIooXewo5Z2RXmGOiJZ6Jiq3b/K0mNHGdNU2+8fbcVdB
	TDqgsv8egPiaATLcNnzOlIug7bvpbW4Ok7TfwkWUhxMi1KSbvDR9Lr5k1NjYgF/YDqrXbQ2vXuam0
	E/VzkhH59G6KCmsdF+Yaq7xCUOGqU+rqgzeSS8u1U75f8Tvv6iwyfzBZC8eqIZh3VHmV032yslDuC
	KCEF2GLI48iCWGDj7Ah1kIy1QAVpF+/QXEddGomyE6m0r2611yhPqmE49kmyeNGVdvmYCrsx26NY+
	WoeNR3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ebb-00Au77-28;
	Mon, 29 May 2023 15:16:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ebZ-00Au6H-0H;
	Mon, 29 May 2023 15:16:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6cbf02747so22319285e9.1;
        Mon, 29 May 2023 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685373376; x=1687965376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEDO+a+YPral4I5ZXkXL8wMMW0VCrN+c97/tzuL0GN8=;
        b=rAQIHkyW6IDpCq9889HHVKoSWyLk0Ibot+4kAvFIdt1TKrOvAdJD8DjDvzEZdTDnv8
         JmLjiDIqMF8Lh8mJUUPr0kX+vbhjKSKblSBI7mcPRXILPQx++M1ye46m+5KkPYmHnAKK
         ykNeSq7kGIzrmC50PoWgKB6qKI3Dag+1vhyyLVH4WFlvMFkBjDteW+JvUPZKPkU2szhi
         N6LnPlam4c6gTVrK9cx6KKFX5CJtUYPz1pICEqYlWcVYer7K1LeF73Pouec2YTQW3940
         ASPu8M/wOIVRTGuwpmY16aMLgxv8B9TUJqAH8JJisrFas/pFeSh89oQmRDfN3sp46jcH
         piGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685373376; x=1687965376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEDO+a+YPral4I5ZXkXL8wMMW0VCrN+c97/tzuL0GN8=;
        b=k0/3Fn47YAdjNy3DfP7emTBItPt11HZOmJ0UWWjipkgjTvl6R6eUVpqXQZcvUL6Kwv
         NV1cx8LYwYvejUl1c+GbQEuWUJ8itXuChSHaRrrO3FV/uLJ3wyGEyVOTnbOIPUxOFT5+
         uBiCZss61Kdf6Rc3pqpQtQzaC4boU5L4scU8mvPSFKWY16eYgicLBUaRCnT+hR9RDvcc
         HiAhTBrnP5OzPTJbJkJhE0CNMyVYHTBxs9l8g01UQ2jKtLbRx2loKgXmJeWbpyOP41pl
         53mpEFuOS5CsU/BmMuJMyOYkA+QVNO+g8ofUGLYThgL1W+Q9xVF3djgMziebSp1+0j6k
         6FzA==
X-Gm-Message-State: AC+VfDxCmIc9FcXse54SqbRbOwMal2eW/aP2yBA9wgZhB1yqr5z9hXO6
	0y3rkPRNBB46I/m7vYutnEw=
X-Google-Smtp-Source: ACHHUZ50VJaTqxMFcaBPdgiY9mNb8sRIl+m7Dmc+x0Z3oYT5paV5NJfLUU/bUgMoDPmZDl1mpo+2bg==
X-Received: by 2002:a7b:cd15:0:b0:3f6:5cbf:a3a1 with SMTP id f21-20020a7bcd15000000b003f65cbfa3a1mr9093367wmj.14.1685373375676;
        Mon, 29 May 2023 08:16:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c028200b003f42cc3262asm18127550wmk.34.2023.05.29.08.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:16:14 -0700 (PDT)
Message-ID: <091dcf39-b186-056d-4bdf-d4ac5d24682e@gmail.com>
Date: Mon, 29 May 2023 17:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: cherry: Enable PCI-Express
 ports for WiFi
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
 <20230424112523.1436926-5-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230424112523.1436926-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_081617_125915_FB0C497B 
X-CRM114-Status: GOOD (  14.50  )
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



On 24/04/2023 13:25, AngeloGioacchino Del Regno wrote:
> On the Cherry platform, a MT7621 WiFi+Bluetooth combo is connected
> over PCI-Express (for WiFi) and USB (for BT): enable the PCIe ports
> to enable enumerating this chip.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thanks

> ---
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index adbda4dccdd5..eca5df85fe33 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -565,6 +565,13 @@ flash@0 {
>   	};
>   };
>   
> +&pcie1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_pins_default>;
> +};
> +
>   &pio {
>   	mediatek,rsel-resistance-in-si-unit;
>   	pinctrl-names = "default";
> @@ -959,6 +966,24 @@ pins-vreg-en {
>   		};
>   	};
>   
> +	pcie0_pins_default: pcie0-default-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO19__FUNC_WAKEN>,
> +				 <PINMUX_GPIO20__FUNC_PERSTN>,
> +				 <PINMUX_GPIO21__FUNC_CLKREQN>;
> +				 bias-pull-up;
> +		};
> +	};
> +
> +	pcie1_pins_default: pcie1-default-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO22__FUNC_PERSTN_1>,
> +				 <PINMUX_GPIO23__FUNC_CLKREQN_1>,
> +				 <PINMUX_GPIO24__FUNC_WAKEN_1>;
> +				 bias-pull-up;
> +		};
> +	};
> +
>   	pio_default: pio-default-pins {
>   		pins-wifi-enable {
>   			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;

