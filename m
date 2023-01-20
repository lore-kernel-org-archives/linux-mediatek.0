Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621BCC25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTRZvfgys5BMzm7lyZzx3IwyLZCOTcEWGWGvAUBCun4=; b=1xaPvM2h03Ehcz3IjPF51F/fZ6
	ESZkQaO2t5zvLsfrmf9PylONe2jC1+fUAeznC0IPGLWO1NL1yHqPScwKSXzMW1wktVU+SLECtfFbX
	PlpX4+p0I8SMKWsGNlzGG9qPxgMHoOWQ6R2JeZsLhPGLk3Scj6R6nftZOHkw9BOsNpWkBK9W63b5H
	jkuXXatuGXjjOHFiHLZ4r0lwrhZqfzu8/6tF+px+24MPGk2h73PH7aU8/HrzZCJWXXQPAti11fzdl
	yZ6ruiSNB9PKQm98hsnDfp1YWaelKVQcAKnRIK+PRFuMXyPY5d2ddNoqCXCq4LpbLVuJiJIEUsBRy
	LgdS8OWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImit-00923l-Sm; Fri, 20 Jan 2023 08:26:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImiq-00922J-2J
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 08:26:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so3071814wmc.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Jan 2023 00:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTRZvfgys5BMzm7lyZzx3IwyLZCOTcEWGWGvAUBCun4=;
        b=x18X4m58Ubq3+tsZ5sfAsS1lmtZyDd08w0d5HhTMqf3E0diwMxz9Mqpq+bucvaETHn
         eRTVA/rwPys0U5qH5UxUyjhZBWQQ8l7GRb734qtXRE0pwy4NZ32lkndN/X6XsZS3PAa3
         ynwIBUu38PLRm+7E7l0LHFs0Y3/9nIObIIiUs/gCjkKn5mg2kuBTd1z56x0Kl07VL1mc
         zMgaqas7t7HuHoXwkIWtp4ySV4OrhGaZWDRIk2JOzJrLH7pWM7Y7Ax/wb4udgxY05qwf
         RagW5DsO6P+lF5MorXsMCnmoROhTvJ7IM9Mki4C1sLYrrsDzwEEcPFe9nCqhhofX1bd9
         Jeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTRZvfgys5BMzm7lyZzx3IwyLZCOTcEWGWGvAUBCun4=;
        b=ZQbR5blSR4kojU0iHSDnP8WcueXA6xPFJ4xVy7MzumPrTkvpqUj5vMq7k5adBPKz+d
         /4unN5y5SGHozXC+eQd5r+ShdKXG5M6Xx2KNzLYTJd43mvNhYrBpUc7JjzXe1EBXGyvZ
         6/jcpH9uHEWRb3fVCslnmH76k1fzQlcHL2WddPiAjvbJkOmA5ApFhhu77M3BHb6BMwmY
         3kvBfE3rVdHMo7Za3P9l740HhrBZQ5LW8Yqq2vShDOxZ9whyA5LY91pJBSACHQIuy98s
         E5CSWRfFtTL1UnMbTHcHwolH62kag17DW0PCSNZQvmFnOX37CA8Tn9rN/YsF/7pWBx89
         x+jA==
X-Gm-Message-State: AFqh2kpq1B7Z42b4EYY7R12O7vv0lqGbFx/3BYhLezQvvGyle6kIigFd
	MFWXFhGF+gDqjrXYtQ7BB87Z3A==
X-Google-Smtp-Source: AMrXdXuBGs2ahzP+zP0qO4mSMKPgoFnX6XiCqs04Cf2aJRXt9rHNIBQbQxnFLrwuJ+Y7N+39Kjt9lw==
X-Received: by 2002:a05:600c:ccf:b0:3db:f34:e9e0 with SMTP id fk15-20020a05600c0ccf00b003db0f34e9e0mr9895613wmb.35.1674203162609;
        Fri, 20 Jan 2023 00:26:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b003dafadd2f77sm1664880wms.1.2023.01.20.00.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:26:02 -0800 (PST)
Message-ID: <e31fb866-49c4-1540-6fda-6e86ed7bb33c@linaro.org>
Date: Fri, 20 Jan 2023 09:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] spi: spidev: add new mediatek support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
References: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
 <20230118-mt8365-spi-support-v2-2-be3ac97a28c6@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118-mt8365-spi-support-v2-2-be3ac97a28c6@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_002604_186066_13A825B0 
X-CRM114-Status: GOOD (  15.48  )
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

On 19/01/2023 18:28, Alexandre Mergnat wrote:
> Add the "mediatek,genio" compatible string to support Mediatek
> SPI controller on the genio boards.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/spi/spidev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
> index 6313e7d0cdf8..e23b825b8d30 100644
> --- a/drivers/spi/spidev.c
> +++ b/drivers/spi/spidev.c
> @@ -702,6 +702,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
>  	{ .name = "m53cpld" },
>  	{ .name = "spi-petra" },
>  	{ .name = "spi-authenta" },
> +	{ .name = "genio" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(spi, spidev_spi_ids);
> @@ -728,6 +729,7 @@ static const struct of_device_id spidev_dt_ids[] = {
>  	{ .compatible = "menlo,m53cpld", .data = &spidev_of_check },
>  	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
>  	{ .compatible = "micron,spi-authenta", .data = &spidev_of_check },
> +	{ .compatible = "mediatek,genio", .data = &spidev_of_check },

Please, stop adding stuff to the end. It leads to unnecessary conflicts
with simultaneous edits and increases overall entropy.

Best regards,
Krzysztof


