Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE89C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paNDMUZKRq80K7oiniio5ntVIbj7lgvtgljPQ5bDLmE=; b=1Jzj0N0Df8vgIIsAk6L1HIvD4U
	OYAIzjYVq712Wg9YV2aOvDQ+vmi+CrJAKz7jjf09m3kF3Z7hs/DnrU0hjhqAtPnHJJTpICruLAGZ+
	aMLDI0E1PwjTTa7+MRsPj1fg/MFp03nh9CFPhOov4YiKh54wTkaAQ3Ip39py/9zzQFxGS4S7UF79R
	k+olIlFjIrliXP6oeVVkAAWUHT8vspUCeOUbFPjg1Se6iZfeRze7fp0RWTh6zUS7XC7+6yOjMYrK4
	CyN+gW8Vi0Esz/09xX0hUHL7ISm7di01at6dAB2SLCMwRj3FTR/Dr8gORnNB4YQoZuCNQ0XjWSeFQ
	MqLdlyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXy5-0063Gn-8F; Thu, 19 Jan 2023 16:40:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXy1-0063Cj-OC; Thu, 19 Jan 2023 16:40:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id j17so2037863wms.0;
        Thu, 19 Jan 2023 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=paNDMUZKRq80K7oiniio5ntVIbj7lgvtgljPQ5bDLmE=;
        b=GAt5+IamOdPgJu/kNV04eKpUyXkEGj1FWaO5790ux2SdMpfaNB3FTfJ7I56L49PcIS
         tk1fU/j2Mi82ajL2MbszBy55TcmvRIrxYd3eLgs3VImfDy9A1A8ZRyLHh3Nss75rxWHz
         2Quvb5aRck7azj3NhwOpljB875WSD1x3x/ANhFTwaoR8da8B2nPXigZl7PlLCe7+NXA0
         t2uWL01EqcMOliElMtWn6TeXOdE3/pdOPR6YnCPfYzAX5eoajhu0wGxPPvQLvGqwIqqX
         OMxinu0lmmz7RDZxgYB3rKWmHrvPM66vHOnybbqCkpyheA14yGUqB9Vz8feA7zdUOgrl
         K21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paNDMUZKRq80K7oiniio5ntVIbj7lgvtgljPQ5bDLmE=;
        b=rdX0JOk669WiviPpxDD04XgTxCdx5rti9/4tGUuCNfZAm+X7Zi4DsGu3RiW2vYWR3P
         7pyuWpgSstuSX2ccmtuK74ndwIUAC3bApWd6XQlo5rTLBmfT49plu6+PZ9i7V/wpvZHU
         Yt4zWuYW40Q1KxaEHT3PHfkmq11SGsZWtJGbqjROH/Q+p19htsHQR38ahn/x/hg1egRm
         5GSijyMcCfQ/ZuZUX3aeczBVn2eXZsU4aUjhWqhBYeCLUjN1BxNMJZBNN45a1hqaSXN8
         DHxaPGw7B0ffbM1fJRiwbkPkByqu5Tvoi0UFD/5h2CxwD18MLv8lF9KncrruvLyP5TN0
         U2yg==
X-Gm-Message-State: AFqh2koBJ+ohJ3XgDVj/8SwazSwH581P1KO9Ar6c7gS+cGuhXUClQjxV
	+ye3MmwNeFKDZp/Q6QAQ+FMRuiDBsVw=
X-Google-Smtp-Source: AMrXdXuiiSvq2ea3vPo0TiPIxiXK3dtY93Jqly2huPyxl01zLsqyBJ4750j3Qrn6N2AjyK5hXTkGuA==
X-Received: by 2002:a05:600c:3296:b0:3cf:82b9:2fe6 with SMTP id t22-20020a05600c329600b003cf82b92fe6mr11463701wmp.8.1674146441967;
        Thu, 19 Jan 2023 08:40:41 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c1d8d00b003daf7721bb3sm5364846wms.12.2023.01.19.08.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:40:41 -0800 (PST)
Message-ID: <d7f4ef2d-ba09-b75a-0b28-f8fccb809345@gmail.com>
Date: Thu, 19 Jan 2023 17:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_084045_854311_F8713319 
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

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/spi/spidev.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
> index 6313e7d0cdf8..e23b825b8d30 100644
> --- a/drivers/spi/spidev.c
> +++ b/drivers/spi/spidev.c
> @@ -702,6 +702,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
>   	{ .name = "m53cpld" },
>   	{ .name = "spi-petra" },
>   	{ .name = "spi-authenta" },
> +	{ .name = "genio" },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(spi, spidev_spi_ids);
> @@ -728,6 +729,7 @@ static const struct of_device_id spidev_dt_ids[] = {
>   	{ .compatible = "menlo,m53cpld", .data = &spidev_of_check },
>   	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
>   	{ .compatible = "micron,spi-authenta", .data = &spidev_of_check },
> +	{ .compatible = "mediatek,genio", .data = &spidev_of_check },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, spidev_dt_ids);
> 

