Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13423C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8wXnB4iVuJZTN+eBti6PDoOXenSUwXL/Vym36+LG00=; b=jl+n/LfcJf3Y465+LP/SRkO1DA
	CvSuaERqbU1PSnBHD4tvNKU+dGJ6yuBuNXoIEcmgyionHZhrGp2Fr4MK9gi28eZp+LZaAhJU/8E+k
	AaVqpFCBRYsGXsAjjNXTGn01LmlbvLx6t/Oxc7ze/d8t02SOewb9yc0n5JRrKqhlrD4dOIGRXQY7W
	gmtBn0eZbnI3J7IHK3RdjDIZDRmWX3y6Q24+qvh3oYkXlCZGK2B/XOm8bxy1I3SGv8FRHK84LmZde
	nHFbZCuGg19ccAdoFr/SfopgZtWIgLYOvuR+93rj61tbweG+T5PXx3HiB8BQ8OREPCUnqT8RUj0b4
	vJBQgosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dNx-00Agf7-2d;
	Mon, 29 May 2023 13:58:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dNu-00AgdB-2m;
	Mon, 29 May 2023 13:58:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso21814285e9.0;
        Mon, 29 May 2023 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368682; x=1687960682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8wXnB4iVuJZTN+eBti6PDoOXenSUwXL/Vym36+LG00=;
        b=sm2uEKOVz1LR9pGxAkNQfFiXAxvmi4hYDgkR9kD6JdRiHHy4EPhaw9sEP1fYAeoenp
         M2Cg67O83WRhdN4xlIqim6FNdFvn6VLlN41uZDSotHeVZy8a0B1aaDW6UTKXLqu3ersB
         i0dOnDDdExp33NKwxjKjpZYcVHODS3xliW13WGUCIUJqhKlYEKxx4cAV6m9n4WLsfFiZ
         RGjSa2sJp6Q7bfczan8yg+EU6miQRV1wf0+5J1c0+p+A8B4DA2EmmClbD6B6ajaFgoJW
         f5TMbprefeCG6ip5hcpgNMmsI5mCCzNOY1ZwJ5vDyJVDAka9y7JwRVGszwbKqMPQINhS
         VwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368682; x=1687960682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8wXnB4iVuJZTN+eBti6PDoOXenSUwXL/Vym36+LG00=;
        b=W5fJ6zID0cbn19eArxwbSf+qj4nTCBtnZSeEikO64JhMYLc43lpEMGbYM43Bns7mpa
         HWVEBJULXfM/H48md+VOjuiTccGxO34wI4m5bFP7HaQlQlVrIbl/vo/iaEv7smRFdzuT
         2xyKp81UfsLZPXBj4o9QTy5saUaQBkkLi60SQt4S5pycrjvjWT8JQjzwbJ+vrOndGBF9
         tMSMtmRUGoGP8wlFIDYLkIqIxMy73G8SjqApB7BUN7/hFyUgZltWiTe2ZUQ4LK9UyxJt
         Nk58NSh3T6xTSeOUqPKMvwrV3B1Z/KJ0GRW1m9/g/S9Iz/FLfLwGiP+PbJ2GCM+Hw6a3
         4KtA==
X-Gm-Message-State: AC+VfDwG02ya5gIb1mSm48VoYcecOVC6S9YL9Nj+p1v427xrLSj7nKsf
	2c7WDXYGy0dXg08upgxr6uI3tj/5J9BvtA==
X-Google-Smtp-Source: ACHHUZ7H4VO6On4+LQ60ze6eygW9wgdySmljow50Ej5bjnq5xSK7lqfcpgSGf81iI1u261fmbaBI1Q==
X-Received: by 2002:a05:600c:2110:b0:3f6:f7c:b3fa with SMTP id u16-20020a05600c211000b003f60f7cb3famr8544858wml.31.1685368681822;
        Mon, 29 May 2023 06:58:01 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m23-20020a7bca57000000b003f5ffba9ae1sm14431663wml.24.2023.05.29.06.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:58:00 -0700 (PDT)
Message-ID: <78d59502-313e-3b6b-d363-f6e105120abb@gmail.com>
Date: Mon, 29 May 2023 15:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 21/27] arm64: dts: mediatek: mt6795: Add PMIC Wrapper node
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-22-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-22-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_065806_906638_59B5498F 
X-CRM114-Status: GOOD (  13.57  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add the pwrap node: this is used to communicate with the PMIC(s).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 50d9276d18c6..29ca9a7bf0b3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -391,6 +391,17 @@ timer: timer@10008000 {
>   			clocks = <&system_clk>, <&clk32k>;
>   		};
>   
> +		pwrap: pwrap@1000d000 {
> +			compatible = "mediatek,mt6795-pwrap";
> +			reg = <0 0x1000d000 0 0x1000>;
> +			reg-names = "pwrap";
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&infracfg MT6795_INFRA_RST0_PMIC_WRAP_RST>;
> +			reset-names = "pwrap";
> +			clocks = <&topckgen CLK_TOP_PMICSPI_SEL>, <&clk26m>;
> +			clock-names = "spi", "wrap";
> +		};
> +
>   		sysirq: intpol-controller@10200620 {
>   			compatible = "mediatek,mt6795-sysirq",
>   				     "mediatek,mt6577-sysirq";

