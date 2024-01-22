Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EF6C4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIyqXvY9FI8LQ6DAWc+kw1xWcm3h/hj3La4mo8cVDW0=; b=KnSwjSbE68EEDh
	Z6IObWVIzHHhUmsqVMVFMWf9qXJGWebRTkbO4+Fkt1HhO67P+ft4HJWWTfIj99enJf4CK4xgMAqOI
	G3YmVOA4uyhZDcCP+i/3FQEzCtv5/CA6ls42fEhF0FkI7NS6rZQuzEGB2a5YxhdpfMmW55u1m3HXO
	E5d7MtMy9vO+6dvinKmXzjCL2UjFnm7ONHUBhCpkJXupf2sVcgaxgRv5bQ70NvCsC64utuhfqfX9T
	xneAdU/Q2TxRnjdoABJkPtiwtuBxv7JYimqPgTzHx7fMMDB7RHbSr7aYwuPIAaVCh9+F3v7jFGAut
	y1ddE/XnU3wBqiThBiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqHo-00BDNe-0a;
	Mon, 22 Jan 2024 09:08:08 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqHk-00BDMq-18;
	Mon, 22 Jan 2024 09:08:05 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2cd64022164so40399891fa.3;
        Mon, 22 Jan 2024 01:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705914482; x=1706519282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIyqXvY9FI8LQ6DAWc+kw1xWcm3h/hj3La4mo8cVDW0=;
        b=fdkw3P+a5AllEgX8HxDLNLjtURXfazEwCNmXlSpe8eRXL/nukrsuNp1IgtYl5npiXA
         VLtw99luoUSNIuXrmevurcXMYShHDMStoEhoHbYTgpYSXOSYV/IyU7gE0Usq0QPZHVWf
         Cw/A6ZeqDgB0JnACMbLU4ghghukLvtQoo8HXJZcHHi+5V22dRppAnkx7ULg3QGgKk3VK
         frsmwLN/SsSMal34pM/QtW7WQdq4W2Y4ari3r3YYenH9uFyOimzEq9RqXj8jIGb6qRUA
         b7U2y5AypRtbZJJI9Z+rloIKmYt9XOSps+CJbSCKJaXSuZwIY4+L+wXDcwlcOyD5B8bl
         8PcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705914482; x=1706519282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIyqXvY9FI8LQ6DAWc+kw1xWcm3h/hj3La4mo8cVDW0=;
        b=R/4dLXyGzopgtWRiBA6L77Ok8E5XC9rq2TCN838LAYYwaAfcVvQAaKoEnvR26UVXFT
         vFY07oACDjdKEkvIZ/Zku5tyYnqUFi6cjTsVisn4EvRA6fGA4SDK2mCLpyhySpVVAqwi
         d2ipvVnnqd20s4xzVsYP5HysVuBZOKCKFOJ1ts2bUCw4SIyC5GJFXZfGH8jpNRTm0izF
         A6Jjc7zmlwsOGV+tO2/jEfJlVPqGaOn8j+tocGQ36e4HSFS4hJuNBBOfqjbZjpIHfIDS
         RMTVz/9LdBU6VPdO3pSYEO6ljLAy4j0QO3pCyq284rsnpNhYqQoHiVGHOhyLZ4Hko+dw
         Q5cA==
X-Gm-Message-State: AOJu0YwHxG1WdNeGn9t6G9K6R1yLKdo2TaKt9NZf/wDHZBqO9R2wrEkf
	C5075Z5ESrz4XTc2oQjj2UCeIHl+pQClpdAHuYKdeXqz5rCxr7YH
X-Google-Smtp-Source: AGHT+IG8LvE5vuQut+03t7wrw+Hk6qgBu1ovVTmu7z5M0yRS93Pk3w89uOplLPlbm5bsAWtmxecksg==
X-Received: by 2002:a2e:a587:0:b0:2cd:e926:92da with SMTP id m7-20020a2ea587000000b002cde92692damr1935608ljp.88.1705914481375;
        Mon, 22 Jan 2024 01:08:01 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id y8-20020a5d4ac8000000b00337af95c1d2sm13255827wrs.14.2024.01.22.01.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 01:08:00 -0800 (PST)
Message-ID: <d3149b71-56af-4d93-a576-85f0eea9c262@gmail.com>
Date: Mon, 22 Jan 2024 10:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: drop crypto's
 unneeded/invalid clock name
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231116132411.7665-1-zajec5@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <20231116132411.7665-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_010804_394451_2DD34A5D 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/11/2023 14:24, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> According to the "inside-secure,safexcel-eip97" binding "clock-names" is
> required only if there are two clocks specified. If present the first
> name must by "core".
> 
> Name "infra_eip97_ck" is invalid and was probably just a typo. Drop it.
> 
> Fixes: ecc5287cfe53 ("arm64: dts: mt7986: add crypto related device nodes")
> Cc: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Applied, thanks.

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 24eda00e320d..017168453ec5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -234,7 +234,6 @@ crypto: crypto@10320000 {
>   				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "ring0", "ring1", "ring2", "ring3";
>   			clocks = <&infracfg CLK_INFRA_EIP97_CK>;
> -			clock-names = "infra_eip97_ck";
>   			assigned-clocks = <&topckgen CLK_TOP_EIP_B_SEL>;
>   			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>;
>   			status = "disabled";

