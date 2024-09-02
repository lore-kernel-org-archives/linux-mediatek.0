Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF83CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFpKPUQiiQjznlpL3dC9bwEAhSvdW7y0yHKICmDze0w=; b=ckk4ySoBOuioWLSdQN2T87jB1L
	dvvZE6X6DTRvFUIFSTn5/ChtIN4CTSEH+EHmekH7MYr6LOsOFd71RTFIWH3NT1uXBki/OfCtcF595
	48ztbuZhuULX9NheXvnxyAaPXpm5LSgS64KBzExnjoWQeEr6a2gU02EzC+bS2Gyy+FQGBVvD0w8mE
	euDQOX/HwiKyEMX8TEzpXc306Rjrzz6M+n8n+f/SDvrTmBiCsoA0UtWrpvxSh7uetx72axgsTbJjv
	um06iH9m9R8qnlJdUKzFi1d/mq77K23w9A0lj75Ixemr7VhDKNE/doEUMFZuMVmW+7BOC0+pD2K+X
	s657vu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9aD-0000000ExPq-0Hbq;
	Mon, 02 Sep 2024 16:07:13 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9aA-0000000ExP9-3wVm;
	Mon, 02 Sep 2024 16:07:12 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a86e9db75b9so475542966b.1;
        Mon, 02 Sep 2024 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725293229; x=1725898029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IFpKPUQiiQjznlpL3dC9bwEAhSvdW7y0yHKICmDze0w=;
        b=bSmOQXf8l8WyG9MIOiSdDAOUD0B1N0qkGEa2XJ0CHBxJmbBynqQ7q0QAfYrJqdYkKr
         7K12/xDYqzm+i7uW3uG50aZUEbWEAn8j16eMzvFP9cEHSuhVBAazGCkJJySLSJwOrxlY
         DYHSsd4xuQ8v0ESiU/ES+PSYZGjTz0t9C7PZ1Suv5R/bJ42BA/VLbRjt4psDXCPB7hoc
         OQ014Iq3sCZ6i5j9tjn8t5VwmdxXwSsOwAsAN/qjCnNccCyXsUiROM3VDkzbQaMbplfP
         QAFxmC6xpE+g4TXLP7HL1WG4g1f0bOloxy6e/rf2fDofrVTcGqTWt0AMfP3SRbYqLKsa
         MWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725293229; x=1725898029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFpKPUQiiQjznlpL3dC9bwEAhSvdW7y0yHKICmDze0w=;
        b=tpjHCJxykzCez+ook55TUlbxNI5z0xPhQ7tqjOz8V3WOv/D/ToTyugnxAwk8GOmrVP
         jd1bAbayQsx1Dopw3MK5YeTjxyZhbcraZ4ZKNeyEaaNZ2CIWaDKJgzA4A2fhyx+V0leK
         xkJh1TDvWM8y9v/Bfo2NIyLrXUKgyiiHqTx1yKS9ZspoiKQ3TBEKHjCXZWFqKKfG933o
         hCv+CLDUyTKiwPYCki0XFTYOLiRhlvPG9pXVxXsfrJIojzuMRaBn4Hs/Uda519B7GEC4
         mxTmhyjzzHGjNdUwAWUAmPJdbbI6fOg4suXaCto+MmsXpj2YBEpYhYiGEyuy5sf44mqx
         I8aA==
X-Forwarded-Encrypted: i=1; AJvYcCUaaTb2cM3IXHjrFkX7PQGJnv9dXrrYMZ11f0irLYCXL04++sYf04Pe7TGl1WQNt87vNH2ZobrMEi68cLHPF9Pa@lists.infradead.org, AJvYcCWhCkkzWeyh62hCtz9Tq+1ILbzl1pEzRgNAy3ST5LvcpG/WAAV0H9qrPqqksvMPwNAhWqZTqdn7Yix2dLfI1rU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8pEMVHJpQ7fk6coDiFch6u4Bw6q53lZA5OlfRq6BhyCpwTW6r
	tXjbOlOp9eDy1+w1oUT0R77hcc08xbHXu/JJZw0agzOXZ042eUzG
X-Google-Smtp-Source: AGHT+IH2DkWASp1pwUYEawA2T8SRRfukE+ElsHknlGlmwAMwSVtewqJ5nzNaOjFYV67cTlRlQt9nMQ==
X-Received: by 2002:a17:907:3d92:b0:a83:94bd:d913 with SMTP id a640c23a62f3a-a8a1d29ba02mr53582266b.10.1725293228564;
        Mon, 02 Sep 2024 09:07:08 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89890090a1sm576607466b.49.2024.09.02.09.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 09:07:07 -0700 (PDT)
Message-ID: <9aec2480-5b49-4fd0-8ad0-9fd87c865630@gmail.com>
Date: Mon, 2 Sep 2024 18:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Fix supported-hw mask for
 GPU OPPs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240725072243.173104-1-angelogioacchino.delregno@collabora.com>
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
In-Reply-To: <20240725072243.173104-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_090711_048553_2CE78B54 
X-CRM114-Status: GOOD (  17.18  )
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



On 25/07/2024 09:22, AngeloGioacchino Del Regno wrote:
> The speedbin eFuse reads a value 'x' from 0 to 7 and, in order to
> make that compatible with opp-supported-hw, it gets post processed
> as BIT(x).
> 
> Change all of the 0x30 supported-hw to 0x20 to avoid getting
> duplicate OPPs for speedbin 4, and also change all of the 0x8 to
> 0xcf because speedbins different from 4 and 5 do support 900MHz,
> 950MHz, 1000MHz with the higher voltage of 850mV, 900mV, 950mV
> respectively.
> 
> Fixes: f38ea593ad0d ("arm64: dts: mediatek: mt8186: Wire up GPU voltage/frequency scaling")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch got applied and is queued for v6.12 (v6.11-next/dts64 branch).
Somehow no email was send to inform about this.

Angelo, not sure if it's worth investigating what happened.

Regards,
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 4763ed5dc86c..d63a9defe73e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -731,7 +731,7 @@ opp-850000000 {
>   		opp-900000000-3 {
>   			opp-hz = /bits/ 64 <900000000>;
>   			opp-microvolt = <850000>;
> -			opp-supported-hw = <0x8>;
> +			opp-supported-hw = <0xcf>;
>   		};
>   
>   		opp-900000000-4 {
> @@ -743,13 +743,13 @@ opp-900000000-4 {
>   		opp-900000000-5 {
>   			opp-hz = /bits/ 64 <900000000>;
>   			opp-microvolt = <825000>;
> -			opp-supported-hw = <0x30>;
> +			opp-supported-hw = <0x20>;
>   		};
>   
>   		opp-950000000-3 {
>   			opp-hz = /bits/ 64 <950000000>;
>   			opp-microvolt = <900000>;
> -			opp-supported-hw = <0x8>;
> +			opp-supported-hw = <0xcf>;
>   		};
>   
>   		opp-950000000-4 {
> @@ -761,13 +761,13 @@ opp-950000000-4 {
>   		opp-950000000-5 {
>   			opp-hz = /bits/ 64 <950000000>;
>   			opp-microvolt = <850000>;
> -			opp-supported-hw = <0x30>;
> +			opp-supported-hw = <0x20>;
>   		};
>   
>   		opp-1000000000-3 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <950000>;
> -			opp-supported-hw = <0x8>;
> +			opp-supported-hw = <0xcf>;
>   		};
>   
>   		opp-1000000000-4 {
> @@ -779,7 +779,7 @@ opp-1000000000-4 {
>   		opp-1000000000-5 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <875000>;
> -			opp-supported-hw = <0x30>;
> +			opp-supported-hw = <0x20>;
>   		};
>   	};
>   

