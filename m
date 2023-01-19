Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E1AC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1zYb7kTowDyYx4WO/wHDGvEDrmcG3mzHWa0V5K3+9c=; b=zBbEXobwWTj0rtQCoEkLsiQdCo
	0QYtuXezXPFzHv0yqfsCuUcGv0X404SPN7EdmDHe7V+fl2j1cy3S8xNtI7ZpLQtWPS48SGphvB4U5
	6fmc9uygXDGcRh/ExLGJn4eUfU0+lZFk9ZDnmt5+Ukm0FF4ukJG5rDJSX1RNvd2i5iPG2z+pcWaLW
	EjWG3mzdnj8ba7CQzNV2djLkPe/GrVs26GQg6iEHIdd1nyGqisDflRQv5U5/f2QaS9RzOYXeAcVux
	wA1Cr/5nam/RMfNvk9vI4gU+ziBTY1nmdpmlUPs4C6zdRapK4yowTACmtYOBhIS/aD1m+6XirewOX
	2xMuVe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIY6s-0065t2-K1; Thu, 19 Jan 2023 16:49:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIY6i-0065qq-BG
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 16:49:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e3so2433281wru.13
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+1zYb7kTowDyYx4WO/wHDGvEDrmcG3mzHWa0V5K3+9c=;
        b=lk9VF/k3N2YcpqkT+LXNcaEu3bDxQaXHwfn+32c1jO0Lc2lPSDAji7akMbW0yEDVuw
         VvZy4QgPNST/ik+Nkfyy7CPT1DS3JOi34Ds9JlCrp0pasUjsVe1kif8bdz61e+yR0TUB
         ub3BCnRA1i0jW0zkkNL43p4Ec+wYOBR/l1XUrDaShiyHLrp3zbsLh2K+YZ/ETVPNgIiF
         2MOHuScvhKHQSDNceND3TAI8M6JW4M9eLzd2Ghcqw1Op+4LnRvHWt8+7NSy+ifKwqumR
         hyjTusbBS7a7Tqs+raFdvSAm3MFfMhIKeBm98x4QbeSY1qErjQSafBNjq/exVL23o/cw
         nM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1zYb7kTowDyYx4WO/wHDGvEDrmcG3mzHWa0V5K3+9c=;
        b=maT9g491nhGSewDfIAAjsNApJt8X5zbaqZZQOq26kFPdrux9Nbd73NXif1z0ZyCDWh
         IiRlJyZkw/5zdO3dGDVsxKYXd8oaffrMh0E5pg41fGKcyiy2kapHX56id1g9MSswEaZV
         Rc5vOjGT5+sdyghQGK4Qu3sNSXRtnrGfh4Tg/fLuhFiGurLw3390rnHrXmEumKCv/zhL
         irJG+tbFq2NjUANk4J1IVdCQT3mBqv1a1QRJaeXzsOBXQJd+AI0fqzyNaa1CMBLC907l
         tvvZZrprbp8qU89GqG7dDhTGx6zmcQ2D2ctleVOnwGkP0Bv/+0tRfXBNHdyY5kts0N7L
         sHog==
X-Gm-Message-State: AFqh2kqsp92FjlgY1QkG7gX/hIe3+YnPpzJJB2LnjOT7amHzqkYWJG8N
	x/IpiiE1wDlggLiaIWMxO3DVMA==
X-Google-Smtp-Source: AMrXdXsQtuxwxOCAddUUeO6nawc0o3nR3p8GWKNtjVSi5vMi2XTjtWlqS/S3ALjcyut0AvOObTlpQg==
X-Received: by 2002:a5d:56c2:0:b0:2be:5370:d797 with SMTP id m2-20020a5d56c2000000b002be5370d797mr131488wrw.14.1674146982818;
        Thu, 19 Jan 2023 08:49:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb06000000b002423620d356sm14001708wrr.35.2023.01.19.08.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:49:42 -0800 (PST)
Message-ID: <60766c7b-abb2-3afb-aa16-0e1385b88a73@linaro.org>
Date: Thu, 19 Jan 2023 17:49:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_084944_516043_6730824C 
X-CRM114-Status: GOOD (  14.55  )
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

On 19/01/2023 17:28, Alexandre Mergnat wrote:
> Add the "mediatek,genio" compatible string to support Mediatek
> SPI controller on the genio boards.
> 
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

Please run scripts/checkpatch.pl and fix reported warnings.

Best regards,
Krzysztof


