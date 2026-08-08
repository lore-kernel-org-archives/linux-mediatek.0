Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F8BC5AC82
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2026 00:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=; b=Oo5GZQpRrqx61vfsHjh2R3G1Zg
	adgFncxx8CFCN1jkkBfdfcsbaHhY3YXGvcVq58H7cwJ6l+IBVRGkSNAC6VK+hLFpFIT9SCBQesxNW
	kieaY/Jg9WLHfU4mmepHpeyMItGxssirLPocKCG3Mhcfbrgyqq+GOeYCuPxzw/IB3UO+xw8chLNUF
	nKlSUsc6PiCbEJmmtpyvHoTYoGhLk5ZH4pt9mnmiLlkbp/UiS7YJHe9T8V5mDDBR+t5UfELdqkAJx
	NWrGztIBw6Rpvt2uJjbOHdj++f5KsfgIeKmkqDo1MdNpZFEixLYRfTQ3r4Sot2h2g7WJKDhdTfKhz
	AShZKrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUqS-00000008uZr-1fI8;
	Sat, 08 Aug 2026 00:23:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUqP-00000008uYp-2Ore
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Aug 2026 00:23:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d049069377so1520105ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 17:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786148600; x=1786753400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=;
        b=Mgq60loaGPy5fuGPogtgL2EHpnVWljrLq8S68J4WSh03QXTbNUFELY3r5T/LwNwl6u
         xf61lgdOkwJDCNLMxqxmQWsCVbJj0B9Z8/ZxwWsAUeD1/SzN+wVY+BpdjsyHsTxhPqsD
         +H6dhhARXRed3VPmrvQSUgkcSadWOtJIk53/su5SJYmxHiPfSB6kr2zcn/lG+d/ZRO3+
         dQ49JViMrJP8eohAV8zYLnj3UQuTGBnfB4BHTtQvZ6kcXiz3UvpAujbOd3d0eZ3cbPoY
         NpisHcNpafaW96qMrBE12IYX+vmbGFJgizLxrdmqUbBZS64rPQyr9IDcC3+/eaii0+OU
         DC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786148600; x=1786753400;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jt0bpdMVi/3j/bZABoi0jP8ZxqRZtLjg2lc4An7moT4=;
        b=K4d4gjBGumg9o8LH2UW1IVe5ScHWhGDsHe47DAtosTu7/6BsyhgjTFxp9LuA7KRJP3
         FpztOT46FU46DpDKQM2MFpJniRdhRSDA0yEmL9f7pQgqyur3i43t93Nr7nLJXBVt0Nfo
         twt/eU34qAqd38XSdoUy834DVqjQ4C/0pPI/5/So7QNsTyZ8yx2esOCKFJYDtqi+/gXz
         uBbnWN/gSnvEkFrUUSAjdNHy8EH0TEF0SqBhokHf3jy1xr4q7CI8oDeBzT0UD4WXIQZ5
         T+8006Zbfc3g9uk8vu82gH/5kj1vwjMC/LgMMxze/FHWk3xsjPLp4e1roaXf2SYbi9Gv
         CF8w==
X-Forwarded-Encrypted: i=1; AHgh+Rpy+WfNnZ7JysUoghYbZZi4FJ/KwZNYc7sl2VKpbC+/cNbZu+e499FAuMQ6FZ8Otcf2wwQKAPKPBytkljv9Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj97na4daslvi6Q9CpIEiT/16Ybud8bNbdrJ1qZfGHFNpDGl5w
	BHihIS9TF+OE/HW8C/P3OTOjytEhtaGQYhYK5bniLGAwvOE7lDorj5+wBjR39Q==
X-Gm-Gg: AR+sD106ywS80Vmwj6WavZm1rCQk4htN60pFpXSbu1EMyVfAPtgwgqY8nyXRzQDUZlU
	R6YpaYsqeYyLg4atM4H0ZrdXdsU3d8ad14NAGalUQVYJTAlkz4qxeQ7Al/rmsy1X5ndeWx+xZ/P
	9b7s0nZR+ZitQFghF6xtefTSnO+ZsaB1QqFnxrWuujQygZzRGVyrNj9IIXr8AwE9lvGpWXYZnMA
	fMkGCFgMgjZGHAgrzWrXY4spYxOz7tsGRZL/g3/pym7ZTGQX75OHWvNCVVBSg3spl3y2F/Hry4x
	LOPc3+PBE/flfwTja7XXkrOAo9HgCXipzZ1vCajwLoWXFaXbLGB+Jv+1vyTIry7cimF21+l9yms
	uUqVaT1i3+5hJgBfvV2h4jBmCwbnTHLKKDQHplSzARwk4dlConhWBGe9y3COBA5Z+x+Dnm4nYMZ
	cw5xN5/DLr8qDeDfbjSrlx2xB2cCGVGtT9FioZ45So2qHZFfWhmv8kXjnTIu2P8n7D0JkzqUo6P
	OFVFrjCT1FjyfLX8V6Y+vndwF7G/fWZE51w0Kr39GHWFrcxgA==
X-Received: by 2002:a17:902:ced1:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d106a1a2d5mr146246905ad.4.1786148599808;
        Fri, 07 Aug 2026 17:23:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e7e89sm14214285ad.74.2026.08.07.17.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 17:23:18 -0700 (PDT)
Message-ID: <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
Date: Fri, 7 Aug 2026 17:23:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_172321_608564_E06CC37F 
X-CRM114-Status: GOOD (  16.95  )
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

On 8/7/26 01:16, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   drivers/watchdog/qcom-wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 49bd04841f0c..a8eb1d8f24f0 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -298,8 +298,8 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   		wdt->wdd.info = &qcom_wdt_pt_info;
>   		wdt->wdd.pretimeout = 1;
>   	} else {
> -		if (irq == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> +		if (irq != -ENXIO)
> +			return irq;

This is wrong. Check the if() path - the code ends up here if pretimeout == 0,
even if irq > 0.

Guenter


