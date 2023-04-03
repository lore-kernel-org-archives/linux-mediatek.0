Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA16C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oxN6OsSAvDJ/9XUkNDJfOZTdcdSQucx06S047EyHBQ=; b=nrkuPQXhIONU+n4L9oUespwf7O
	0Z24n6KeTXdKjIAaETIv2z1meZx+C48+lyaNq18kcqiNb8Cvk3e/nE5ntOh4T6BQ44Emr5odOLrmZ
	Hm9i0VnU8hCMq1fmdYG+YI8uq4ZR1+WJ9OIaXF94OAk+OSyUjqZm9QlMXa3zgPUS+PSezxgzyrSsq
	7F9xaU2Eh9m8b9I0bncFj+AaAyhWOpyEEpGHqP6jn5mEBKH0FpLAPbjbbcBltMxYoKSNrLCw0CrXK
	VhL73b/JG4orVzUYg+fviRfUmiLJfeuRHIp7w1o4SAcpxMMAzF2Ph0qCVTG6MJmHeWQG0XIVXCZdg
	lO/t4StA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIQH-00F8xy-2n;
	Mon, 03 Apr 2023 11:32:29 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIQD-00F8vT-1L
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 11:32:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id l27so28993322wrb.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680521542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8oxN6OsSAvDJ/9XUkNDJfOZTdcdSQucx06S047EyHBQ=;
        b=C6gWZp40tfEpPfYSrgRrnFTseXhT17/N3/Rd1XTWX8SljHQdb+j8qyQzRCnxitNxkA
         mGbwHFXQb5ITNf+w/UsK+tl7GA4WaEklHtP2Gk9OwGoV3bsBkLWXg6+vzsu+xjPFbcKq
         istoMqkmpzZZTsjxCqMlUNeuaV+wM4NiuoKM26cYhKEeXGORCVFktJRSeXU6tkQRb9U1
         fTHAQpbiSbu2xdOJqzmannTP/O0Dmjj025fN1OI4ac9mQVEmT+vQLQuhMcUE5nvLMEYd
         wWrJ1fH+ucZjqsu2MSSndsASCTdtDEyv8opVMnDUijCXg5DG/y1MPRlxQHr3wfMr1A+h
         +W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680521542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8oxN6OsSAvDJ/9XUkNDJfOZTdcdSQucx06S047EyHBQ=;
        b=nXjO6QIszItpxJEOViEvEcx2TrQ5P3hMkXErNMKQNUB/KOK6vQVWDMqnRwkdQQfpeh
         g8IwZz/8IYvWewTWOhwzg2S2r1FofPxgvqeeZWVpd7qD9MDkoZLZnK0a650x8pSH+Zp4
         LqKYxN4VeBHMoDeFqTrqzHwTUxbcL+VT957vPjkjis0UmGdvIJUUa0+Zfq0pYitGL0J/
         wIYQHIuIDynP88VxMQb9TXQBLih2TAA1nTdEuNr+LERp6hVcxfgnxvCAvEAlT9N6GDVY
         FSioWS7RVSznB89VvpvwCf4/3IlIkorJDO/NR8V9u0iUJPOazRWVXt5cGJjfI1FvTkVD
         8pjw==
X-Gm-Message-State: AAQBX9dTXympQNTBoCWn7/H5DXXQITGG60SNzw3SzPtNak6vYQ4cwUcb
	ILfEYANCv68RMqw5WBK+rTvWvQ==
X-Google-Smtp-Source: AKy350bJaiA62l9quKwVmDV9foxfGXFovA3zqzv8sR+okw5JpFGfalk8OYcb0L9rxeEC7w5V9ffF/w==
X-Received: by 2002:a5d:4848:0:b0:2ce:a9e9:490b with SMTP id n8-20020a5d4848000000b002cea9e9490bmr24826782wrs.31.1680521542472;
        Mon, 03 Apr 2023 04:32:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8052:c9eb:6b69:e69a? ([2a05:6e02:1041:c10:8052:c9eb:6b69:e69a])
        by smtp.googlemail.com with ESMTPSA id r1-20020a5d4941000000b002cfefa50a8esm9527094wrs.98.2023.04.03.04.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 04:32:22 -0700 (PDT)
Message-ID: <6e3c59c3-8ad0-9c53-62a4-7be6f55a7c02@linaro.org>
Date: Mon, 3 Apr 2023 13:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drivers: thermal: mediatek: fix of_iomap leak in
 mtk_thermal_probe
Content-Language: en-US
To: Kang Chen <void0red@hust.edu.cn>, dzm91@hust.edu.cn
Cc: rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 daniel@makrotopia.org, rdunlap@infradead.org, bchihi@baylibre.com,
 henry.yen@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, hust-os-kernel-patches@googlegroups.com,
 void0red@gmail.com, error27@gmail.com
References: <20230403103855.3601901-1-void0red@hust.edu.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230403103855.3601901-1-void0red@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_043225_511261_C8DB3F51 
X-CRM114-Status: GOOD (  19.23  )
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

On 03/04/2023 12:38, Kang Chen wrote:
> Smatch reports:
> 1. mtk_thermal_probe() warn: 'apmixed_base' from of_iomap() not released.
> 2. mtk_thermal_probe() warn: 'auxadc_base' from of_iomap() not released.
> 
> The original code forgets to release iomap resource when handling errors,
> fix it through unified error handling code at the end of mtk_thermal_probe.
> 
> Fixes: 89945047b166 ("thermal: mediatek: Add tsensor support for V2 thermal system")
> Signed-off-by: Kang Chen <void0red@hust.edu.cn>
> ---
> I think the this should be released on the success path but I was too
> scared of breaking things. Let me know and I will resend if people want
> me to do that.
> 
>   drivers/thermal/mediatek/auxadc_thermal.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index ab730f9552d0..741c7d8151bd 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -1149,13 +1149,15 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   
>   	if (auxadc_phys_base == OF_BAD_ADDR) {
>   		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_iounmap_auxadc;
>   	}

Better to use the devm_of_iomap() variant

And also take the opportunity to use devm_clk_get_enabled(), remove 
clk_prepare_enable() and the rollbacking in the err_disable_clk_per*: 
label sections.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


