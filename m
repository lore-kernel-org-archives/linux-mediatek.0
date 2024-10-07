Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5F4CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hWKSlLN+vsj3tUUn13M+s2s4IGGCFQ0f1niVzL4iyE=; b=tJYy/k/lbQcGe/ugWu73ufnD9V
	UOrginD4n0iSgx2AjtSMayf2WjJ5KoFviji59BGCIxeOFQoKRw+Nk55U10hJYCKzKZKhARYCAlmLm
	UWIJJA1ibgbWbiVCVJcUcFvWDjCGwGk2fDGJaaR/BfVk/KrfX0qWx66tzpsmHhc5rN5AVDQl2OWmi
	PKwDGLR/NeQ1LNES5Dw4+hh5wUbNxEbmIYyALa2DHfYSOHY4YS2xf9vqj8SslmJgSRxfUPVq6AWio
	tnkUd1yZm7Gn4dDOpTzrUwOMzG3ZAWQXLzQohwSPFBEOUZUJ6zF9Ll2hEQ9hgcUggCdZKArS+V86N
	1NztXbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoVK-00000002fES-2kUk;
	Mon, 07 Oct 2024 14:14:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoO2-00000002d8U-3hS9;
	Mon, 07 Oct 2024 14:07:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so46030815e9.1;
        Mon, 07 Oct 2024 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728310017; x=1728914817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8hWKSlLN+vsj3tUUn13M+s2s4IGGCFQ0f1niVzL4iyE=;
        b=mnHjglHkNUUEHA8kXXGJW8gs6Ty7HDhSfci8trBdf4R/Qe8Uf7HjhVUg82JGCKWKqG
         8b85ba25VcwWY/jC9TYC71VPqB4ZdzSUjbYGlQ4lRcnf7+W5WerGtEu8xsB9wqm12XJn
         PAs3ia5xwKO9UHL8VtRgjyg7TvLDd9ej4ILWjlk2YHZFomzqwve+B1BWViuwW+PYEk8H
         nnJ7W8oKLOFeiVzjXZoPr8J2FqiRU/zqbnxSV9YDefah3Oktb4Sbyp+mOI4s9adD31EY
         ElOt+euhMyajK/9c5s2thWcK+SWFvaEQmNiMZM2uPf898XC4crfy/totp4aDeYkI4Ope
         XvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310017; x=1728914817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hWKSlLN+vsj3tUUn13M+s2s4IGGCFQ0f1niVzL4iyE=;
        b=rnG6s/V3IQmtALKEsBI0HvgNSzZrzNwnHQN5vr6AnvrzeekO2RDhrX4uslK7LnfTpL
         B1f1Jtqipk9HpziHFBnQmkf06IRW4uOYDnGqI/TQRBUAWYOHDCYY9EKK2d3CRMpsqebp
         aaXvFWO2Z2XI3xVRODujaXH4rbyWDJJDE25e1vQmmpvOhGOhNabBxqFlqwl17m9IVthL
         51R9YkEFKRdcfGkBmHXvH312N9f8PWCv1YRO0Yb4a09GGRm9tWs2bvNMwH0jkoIYRiiZ
         BXBSYpDKPMdMftUlvFXQzG2IYqzamW3QtlYJnuzpuJGZ7R24m1rcFFSwqSZdMphRkwcy
         DMyw==
X-Forwarded-Encrypted: i=1; AJvYcCXCDwkz6dVzO0Fi/tNa6ECXQ0JjH5076uM1OlCreRf6ZxQEmpfm3g1MQOxUjUR1oTPTs1DPaZXif0jcIJL3W7pf@lists.infradead.org, AJvYcCXDVFFELpev++x/AVMiGEcUPbUFyfe9FWUOx2y8UR8BJ500rFcKzZNkiVIbL2XS9Fv1KN950b4TsWwS1cXwzMA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGl8+tdnsjS8DxDZEwvNBkb/Dt0DChg1E0SCvdvrCOvmuk9BJt
	zBudMa1Jvi4DKnUkthdcVRfnXXbP6yIuCxezZxr+Vmlpuk9pYBf5
X-Google-Smtp-Source: AGHT+IG58jm7bgwH+mDspVRG9n3ZFKjtVsLB8evH6+znZi6hMLtB2++cSjr+HfWHycvINCijQghuYw==
X-Received: by 2002:a05:6000:dc6:b0:368:445e:91cc with SMTP id ffacd0b85a97d-37d0e74c802mr7260686f8f.21.1728310016473;
        Mon, 07 Oct 2024 07:06:56 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a48asm5780497f8f.32.2024.10.07.07.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 07:06:55 -0700 (PDT)
Message-ID: <d9565233-090b-4931-9e9f-89725db605e3@gmail.com>
Date: Mon, 7 Oct 2024 16:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: mt7623: fix efuse fallback
 compatible
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240617094634.23173-1-zajec5@gmail.com>
 <20240617094634.23173-2-zajec5@gmail.com>
Content-Language: en-US, ca-ES, es-ES
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
In-Reply-To: <20240617094634.23173-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_070658_946975_3EA2C5DA 
X-CRM114-Status: GOOD (  14.05  )
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



On 17/06/2024 11:46, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Fix following validation error:
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
>          ['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
>          'mediatek,mt8173-efuse' was expected
>          'mediatek,efuse' was expected
>          from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
>          from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> 
> Fixes: 43c7a91b4b3a ("arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
> index 9c5a52ce9351..748f9b366897 100644
> --- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
> @@ -328,7 +328,7 @@ sysirq: interrupt-controller@10200100 {
>   
>   	efuse: efuse@10206000 {
>   		compatible = "mediatek,mt7623-efuse",
> -			     "mediatek,mt8173-efuse";
> +			     "mediatek,efuse";

Angelo stated that we should move away from generic fallbacks. Although the 
binding states explicitly to use "mediatek,efuse" and deprecates the standalone 
"mediate,mt8173-efuse", which could the default fallback. Angelo, what do you 
think, take it or re-doing the binding first?

Regards,
Matthias

>   		reg = <0 0x10206000 0 0x1000>;
>   		#address-cells = <1>;
>   		#size-cells = <1>;

