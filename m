Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B0CECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6G+JGSqnaSCmD/h+CX0bavz4T0upTphKGU3mEBW/Pcw=; b=lcvPoMRvSdMhr8kxpqFcGjIajn
	xMyuPyafKyCPtsjSvCrZpeBZmEUpKjr9BABmaPnHdUtv3yenLGV7GBZ+NILBgNAYQ6Lp+1zyEw7lB
	LA3tXbIL2PiuNoiS0oqz+XxS+U33ljCww79xg9RHYgpreIO5zU1Aee1BvCGOYK9INF8Udtfhg2vlZ
	NH6GZXvmaXmgbciCrBjBl18poIxaY2CrbgqQlzwtDPQf0qKt4ymu0caX/YuJtmkD1JthoLeJ9QD6E
	utkSNwhzcH0/vcHlZuKmG9qTBPm2XDjC7U9I6s7JgKBr2GBfSp4AduUMrcx09DXDADZXJA8gc92hq
	fcP9j5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snewM-00000002B7t-2G8u;
	Mon, 09 Sep 2024 14:00:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPx-00000001dVm-25KH;
	Mon, 09 Sep 2024 11:18:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso16457895e9.1;
        Mon, 09 Sep 2024 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725880728; x=1726485528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6G+JGSqnaSCmD/h+CX0bavz4T0upTphKGU3mEBW/Pcw=;
        b=P/01ahKPPsAxd15v4/MdPtC9T9kQ00+lDuMR44UqiSnh9L+062K9cuO6idUHqUzcH2
         SooIVcMm0xEjgnE+R6BIxSKcVIbi5S8J/a6oNBBlidTfElj4gqlIogfm+x56s5YH1iyR
         jAAgbO4z8MfWM+rbftzdG5n0amp6bxal4bTWns6K7AMfHY0CfqULdEgYe8S4Js9D75v0
         Z1MvHAYTcLFuEHYGyKF3xMP+DduvQhBE1eKkjrb02qCFxbNtFcDBJ8o2rp0j1XbJOnwI
         ZiHRjQtpD8fnmJd0lRzd2/c3Fm+iadAFydBc9y7nsotOccFzn9jjUt/goDx5IytSg69p
         s5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880728; x=1726485528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G+JGSqnaSCmD/h+CX0bavz4T0upTphKGU3mEBW/Pcw=;
        b=DSOm0dnNMHWBNi/l0vYd6QxLBvNLwbRK0/88hERF/klze99ZKe2kmNfcyKPUIg3Qjl
         llguwvvsio7zGgKOopsZToIDiJm0cxLaxrwccxV1HJmWkTwlVuc6sGzWImwIpjtE1SI9
         3D0rWPEU6CFhoyOtJIYyEaATDr1Lguo12G2Sr4ujr2FPaR3YPLg0HljIDs0jmDkh8paV
         Sm3y32swezJhQ0APXRN9ZL2Jw6J1z586jdBoon0Ti5n2cHOVMWCcmKMp2DKGw6kHkKlU
         +aYYGGJoyKLt4RTP6IhhKrOpWVIflpQShU0D9z01EiVstTBhKKp7uT392QyyeLQtKTQR
         FCAg==
X-Forwarded-Encrypted: i=1; AJvYcCUDFKU0pl+0vAi1ILBGcRSPycGKb/DoSagmDJLwoHNP6KzGrvvaX0XbceEIyDhGmglh4+jcS50zFZ10WGYqQyTB@lists.infradead.org, AJvYcCWhxNzQTrcAwvpDsxQ0cIdDg7wx/8zxcQuBjDtEEzR28+Fql76xLvyVs7Qq3pheLxHRbwSWepWHC2V/IY3g5m4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4/xKlbLIbhU2KAOlA74iFY6Rv7kDLRo20NYmnWeSJ3xxW+pqp
	XB/8u/bHKRlV6QjPTNk4bX6UOle8GY61OXmNxrC7RcURjlvxBdqE5vzU6HD/
X-Google-Smtp-Source: AGHT+IHLCrmF9H9WFbqMqJjwlPU+iWHBGYMATOXbE8EfRhGKYVPrhPWzTjmn+DPqhqhE+EWC/3HbjA==
X-Received: by 2002:a5d:4851:0:b0:371:8e0d:c1d9 with SMTP id ffacd0b85a97d-378895ca826mr7835657f8f.19.1725880727590;
        Mon, 09 Sep 2024 04:18:47 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb334bd00sm52323175e9.41.2024.09.09.04.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 04:18:46 -0700 (PDT)
Message-ID: <af3bf83e-8bd5-4349-8647-a2cbafb5d7ec@gmail.com>
Date: Mon, 9 Sep 2024 13:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mt8183: Damu: add i2c2's
 i2c-scl-internal-delay-ns
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
References: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
 <20240909-i2c-delay-v1-4-4b406617a5f5@chromium.org>
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
In-Reply-To: <20240909-i2c-delay-v1-4-4b406617a5f5@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041849_577900_5CD6CF56 
X-CRM114-Status: GOOD (  12.36  )
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



On 09/09/2024 09:29, Hsin-Te Yuan wrote:
> From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
> 
> Add i2c2's i2c-scl-internal-delay-ns.
> 
> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> index 0b45aee2e29953b6117b462034a00dff2596b9ff..65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> @@ -30,3 +30,6 @@ &qca_wifi {
>   	qcom,ath10k-calibration-variant = "GO_DAMU";
>   };
>   
> +&i2c2 {
> +	i2c-scl-internal-delay-ns = <20000>;
> +};
> 

