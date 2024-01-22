Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D63EC47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9CnsRjAPHv/Nr7rgukGQuH99DHSYEoAqMdSIVVUY+Y=; b=qWBn/pHdLQsvWf
	Phw1J/wAhrfrKRi0PBErJz6WrNtLq0ZkIbQRRAPv0rorux2HMbU3bhLWRdzxGqdZ7qKSqdDDvuTjp
	vppplBnIGPZytenzYsc6laO+VryS0dNGYU/aIlVKOI0vSS0W7BZODs8LUNdKYshjz4mxeCRkM8y+S
	cfpK0YI1SG60ZzzL9TJ90z0Zu/zj9ufCjHhazVx0hbEj7BTs+wDLNaOJjfuwojt67WGeuKsAEciNX
	uH8giuas/HbmVaNWS+XsF3WU72MHaRcUeTXNU3faYVJWGKDGii7RaVr+rjpB/uixlwsMjK3DWXAK0
	H2SDVzGGERSpr4JVgOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqAa-00BBZa-10;
	Mon, 22 Jan 2024 09:00:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqAU-00BBTh-1F;
	Mon, 22 Jan 2024 09:00:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3392ba29845so1394731f8f.2;
        Mon, 22 Jan 2024 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705914026; x=1706518826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9CnsRjAPHv/Nr7rgukGQuH99DHSYEoAqMdSIVVUY+Y=;
        b=iV1CxtGU1ZksRqcFT/nUCxUwLBE2T1C0ASjAqNdk45aKD1OG0XSGTN/3tVBASDvBo/
         wHovX09Is0/6SF4+KICc2VqduZkp/znmNtxDyWjdlkuTACHGA712Zk147LMV1hm9386o
         NHkTA0/dtIByv0FZsTc7sg2jcB/Ky8uD36G9mDf0iAdfq6rjphaWVRY0Rhkz3CvBFSSm
         vSFI7iog9n/8wWU2R+zaEmiBTSwBQLeic4vWFJ0Eehil+8NaLfa4bQTJ2h16ogC6HAh1
         aXZdkOCGJ1tHZ4OOEHpBQkNEjW3v7V2Wof+O1i94PVHL3EovXJbaQVcXYJCEOx+VU/m7
         aNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705914026; x=1706518826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9CnsRjAPHv/Nr7rgukGQuH99DHSYEoAqMdSIVVUY+Y=;
        b=mIQGK99t8Q6G6k//tCPfvUcWHf37wzXoYHrqKaqHfwTwqPQOJ+v5dkpEbpwARcwJnw
         SfDps6axMmyzQXJGfCR0q1ptrGo69oMWA16XXlhN0ZpahAuRI083guB+RFD/9JwBmXBh
         ypqnxDvJd5U8JwtbB5f6XFrizwoxIOPYDTrC65xEf+qzPbiXghE2IwOIFhe43e3VMY1f
         Y16dhbxB0dAuFP81qDl53kynDp58SRrHNF8qNksuAb+5V4pNWVRvD7HxifQxyECOpQlP
         zQEfcnltHPBlOIAbhlQdSUqpR7htsFyBOjHbquoya/tcCtSCwsQ10zRneQkmj43oaegj
         K34A==
X-Gm-Message-State: AOJu0YwljdbxTczHsoezjq0SQ36WgoJ5390fKOkg3X8fbb14Ctxk0Efc
	pC1i0sBmpqs9FEfNJZDSCNYDWqzNOw0sPrQBP8cQ5hwwwtK4X02S
X-Google-Smtp-Source: AGHT+IFigjk8QEIScQfJdOPaOe1xp96gJJ5P2wdqcKKm0Eh6ljtVPlN/VbmQeEXIMjCF+bLmHxmHRA==
X-Received: by 2002:adf:e5d2:0:b0:337:cc89:9e58 with SMTP id a18-20020adfe5d2000000b00337cc899e58mr1108905wrn.150.1705914026359;
        Mon, 22 Jan 2024 01:00:26 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id b5-20020a5d4d85000000b00337d5aa55cdsm10241908wru.53.2024.01.22.01.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 01:00:25 -0800 (PST)
Message-ID: <85138fef-8b85-439c-aa74-d0e74bfe84e8@gmail.com>
Date: Mon, 22 Jan 2024 10:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] mt7988: initial DT changes
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240108085228.4727-1-zajec5@gmail.com>
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
In-Reply-To: <20240108085228.4727-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_010034_424302_75C0F134 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, jason-ch chen <Jason-ch.Chen@mediatek.com>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/01/2024 09:52, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This work is based on linux-next content and was successfully verified
> using "dtbs_check". It's initial code for MT7988A that will get extended
> as we get more bindings available (pinctrl is big blocker right now).
> 
> AngeloGioacchino, Matthias: is this something you could queue in
> git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux
> for v6.9?
> 

Series applied, thanks!

> Rafał Miłecki (3):
>    dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
>    arm64: dts: mediatek: Add initial MT7988A and BPI-R4
>    arm64: dts: mediatek: mt7988: add clock controllers
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |   4 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  11 ++
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 136 ++++++++++++++++++
>   4 files changed, 152 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> 

