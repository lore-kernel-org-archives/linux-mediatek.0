Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5403C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPIMK95gMRUSHEG2jK2H0VFzwaouijsyEaRiUKhcyQ0=; b=PdRd1IqnzYF1YLl5yHtaroHz50
	rPK+RKYtVXAhs7u6PuyNKHK18a7+E91Fcx73n9OzxXVVYsaxyvJKQ8wlzuCsAn2PPMI7Ol1TfdNW3
	7LKeBINLXLztT0w+VnSmvpQ727n1T+WWEV9TeTQEPBaisM5ZEU7QnUVEMblutmWv3gpyXOFm55LFq
	IICbBFCFYt56oNiPUdbcC1GcQ4Je7k/FznvZP0hhZ/Aq5lffAMdvu/1bkzKyOjYhT85vFVsNasLcA
	EvMvRAvKFT9zHAdIcNMlWZLbClmFi8tGdq4CeH0nzgo7kB5AtR9RPjR1EgYkBXvpo+jb9v5UA3kRM
	jMRusK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxqh-00D9Rk-1e;
	Mon, 22 Jan 2024 17:12:39 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxqb-00D9PA-07;
	Mon, 22 Jan 2024 17:12:37 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7bf2c826a5aso230143639f.0;
        Mon, 22 Jan 2024 09:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705943550; x=1706548350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPIMK95gMRUSHEG2jK2H0VFzwaouijsyEaRiUKhcyQ0=;
        b=jNTATG0R2zGAnaWPD0I1O0N8NfmsVTnAw94f5CHQud+jfklZ2o/3tm5PJytG4o7iAu
         C4X+bnIaPO0YfaasMEgLlVRnDlU7n8tEue0GjhHicrhbYwc3LH/qnpyPQ1O+QzHIuz+k
         TiBqkvNaLi/0mxC2lt6XrcMDucQJNqn0tCeoU9NuaTNZn7/jlgQbtibcfo/B9lXHxC2x
         JXyuTCa1aqckUqARpmVk+iSOUsBNnK4Z+XSmpiYhNHoxDvETxsKD10r8UsK9kc5pA/Kw
         xMtQZXKKnvHXSAN0BUrVjFRTDyb+n4+EYOfIJ0Q7TpYqyQiX1S7c7408kzo+jDa4Vf+q
         AFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705943550; x=1706548350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPIMK95gMRUSHEG2jK2H0VFzwaouijsyEaRiUKhcyQ0=;
        b=wwXyuQ0FM4cd4TFbpURoUamU/yHZS+05bIb3a24XFeDEHHXXfEHJktJBwTNhMZmlSj
         jfN2wF46dfWjz/zhKyAWy45qh2/08mRwMIGj7WcBuyUsH7IWYVsGZ4u/PYTggHsz4hfC
         RICvT2w8DCSN1WRQ8atgw9rHRCOWlME5UUw0m2UbTNeZvrogm0zLE4IiaSS4DoFyFCmX
         gqP6aIBNk+GjZZDudijYmdUaKu95nftjTbWsIpjqmWP0fZKRK2T8aQIRImwo15Xi/sNf
         Xsc9SrrVFV7GWtySi7FsxIjG9LumigwDDfxhOoLaHpdpagozs85UICr+z1B2S5C2Doya
         L/UQ==
X-Gm-Message-State: AOJu0YxFNDRfTDwKMriC/ru2Syo3bpu4hOgnaWLzak7Pg9i68/VG1RN6
	lIK3AQVa9WRULcSa04DLHTRxixWC7Ca4AfjHWTFnRGj/AHkpi+Ei
X-Google-Smtp-Source: AGHT+IHLLamnCiCk9cJ1X1JixZykx3jXLk8J/l0UnWrq/k4A6zGQrmBpb1k9/dINFXv1TE01HrK0Hg==
X-Received: by 2002:a6b:6111:0:b0:7bf:9a6a:b2aa with SMTP id v17-20020a6b6111000000b007bf9a6ab2aamr1171220iob.31.1705943550547;
        Mon, 22 Jan 2024 09:12:30 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id em21-20020a0566384db500b0046d9e290a74sm3085976jab.7.2024.01.22.09.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 09:12:27 -0800 (PST)
Message-ID: <e39edd38-6b12-458e-b5c9-d153165cc9bd@gmail.com>
Date: Mon, 22 Jan 2024 18:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: add missing "device_type"
 to memory nodes
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240122132357.31264-1-zajec5@gmail.com>
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
In-Reply-To: <20240122132357.31264-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_091235_668314_8B451EFC 
X-CRM114-Status: GOOD (  12.13  )
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



On 22/01/2024 14:23, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /: memory@40000000: 'device_type' is a required property
>          from schema $id: http://devicetree.org/schemas/memory.yaml#
> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /: memory@40000000: 'device_type' is a required property
>          from schema $id: http://devicetree.org/schemas/memory.yaml#
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 1 +
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index a1f42048dcc7..850b3e277368 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -75,6 +75,7 @@ led-1 {
>   
>   	memory@40000000 {
>   		reg = <0 0x40000000 0 0x40000000>;
> +		device_type = "memory";
>   	};
>   
>   	reg_1p8v: regulator-1p8v {
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index 2dc1bdc74e21..5c26021fc4cf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -57,6 +57,7 @@ key-wps {
>   
>   	memory@40000000 {
>   		reg = <0 0x40000000 0 0x20000000>;
> +		device_type = "memory";
>   	};
>   
>   	reg_1p8v: regulator-1p8v {

