Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAA1CCD184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=; b=CHOc4a5rGqvU73b87DR/AV2l11
	k6364sW/SVqvv8vfKrh0QtdKFnwyvyO3z9GaGOsYhmMxPdKsnot3hwl6avv+3Spw3sE2XWt+MmIxZ
	woATqhsZ6O8gdD62E9Noyg//5XO3AgsfUVDV8668sjJQz3IrhaRZEu3Axh66/guxmoFo3V/2fQ1em
	INY8YLn5T2h6GzPjJ08FEdZ8D5akwX69iv6eHsRZ0tYkAY0PL0R5j7BEvJ50DZ6aSXpuTUIy/m6zk
	V7+DNRRIGIlgjO+kW4wV5Qi1S3+JCyzk1bRIKp+NN1vM4/D8NLsks9FR/zDnKtRrs4CMaDkj6VR7Q
	cqk40I4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mIP-0000000HQOL-0OZY;
	Tue, 14 Oct 2025 21:11:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mIG-0000000HQKN-0cpj
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 21:10:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so4198820f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Oct 2025 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476250; x=1761081050; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=dWLlRwzbQ5kjgFQZ09S030zY89NjPtfXJiYHRuIhMPFnn0htFntTVO1teHTesUNuwB
         L0t7fKEFnc5p+HvIb6uoVHu9jk+nbWnZmltZ3zbG/LCxE5hvwCiMsmA4BxN4IeKtFK+v
         k8s53T+dKe/mfroKgN/QArNS8j6waKkfYCaf9w0iTwhExBXhG5efDOhWg3oT5R5Qb82O
         O20iIOT3Go5sMaUWUnv4yW/hlb1RYBOiqHJw9FmovD+c7juJ6QnQ2ix3675QwnuxzFmD
         W5DQabylOWzErCoy4z8wRXl5IQLi3nzCzSmBpADulSinhGNGfAFF5KgJW0YNVdING7gj
         xrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476250; x=1761081050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=ZaRkf9oVH+vOFWIb18+fAbd1szlFXy+6p8GmkHiU58zW1/BA2VKCfz2PD8pHU2QZOJ
         MjVTVLyNCYikCBk7wRsimqTiMTa6rZjS8/E+xO37HpL5QRZMyzslOvh5D9bK2q+X8hvH
         q24VomC2kvX4Kr0NQC5aCV9rjvuy/tj2of2cElzz6m9UnoL+tsvWlcGM0r9empvp5uqF
         kmfjfmWKlqtGwnalHUL/Ba8fFtd86EdfXJhsQPF5lpcs4sfZPSJagMvKGtKnkuaTIXxr
         bf4/xi6M62TLkJLTiTG30l4rl2HTUnjbpvmxsPxs3UTY0ikDKnHVX9fqy40RW+Vwi3rB
         AdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsrPViAeZWZEA7z0jF3q9/U+Cho4gRmXcDtEXGzXBWTIjODhZOPWZkirdyIOnhfgEzLHQC+D5LJHOar4M//A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcOoM4au8vo5PkSOWb0oWMArazOEU5n+XIXYFkdhAOPts06jGZ
	WaL3n1LOXOGhgo7SSU5n2XBMIwc/ZdzcSdpSX3KR7XTP9YwFz+M4NyiVV4QWA5MTIxw=
X-Gm-Gg: ASbGncsH6tN9l5PPOullkspVwQ4C4N0Miw2fG2BWr5u16UybMyRng2pt9iNy0iRcZ+a
	JExmCRB91hj09P1MP4mbdw/eRmpCg/1lI8W/qWm0e2rgk+lYPQkkyu+/+OEnBktpolmssDFND3E
	MRUIDedrVIv4Lbt5pbYJ0Fsoxf7K+26dhdF4g6BhRO3e6I4Aij1NnhD0awx2wmImoETAK4O02mP
	5l0Ssom+4FPybDDPRUOXZMpHuqCJxOdxRzYBmQlNiv5ylJBwJxK/rLXg2KwRbxXRZVwFZf8NEfH
	6RhUpS52dRZ/udMcS8vq5RdmgCqsTNZd+zUeVusSRyj4xf4zOu1soGoHUCr5AdqElYNbvM1Md8W
	Qj/RV5sq2xGMppVJz1lnmYV+mxaizVAS63RQZiZqGGHWAZUKDdUvEOZJQkfxJ0eJh3+W6Z2xDuL
	fXCTh2xSr9bQ9EcVPqTaO+VQ==
X-Google-Smtp-Source: AGHT+IG4aszTNfWkZ+8pnaYDUBRKBttfxEAtdOpVVT5WH4tPRBG36HzZa82lsANKG9dSujuWlON6Tg==
X-Received: by 2002:a5d:64e8:0:b0:426:d71c:9a34 with SMTP id ffacd0b85a97d-426d71ca0b4mr7446024f8f.51.1760476250194;
        Tue, 14 Oct 2025 14:10:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3desm25578034f8f.7.2025.10.14.14.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:49 -0700 (PDT)
Message-ID: <8b64ff99-d3c3-4d5d-ad7e-1d11d0a8fcb4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <MY_AlfixYZV-8oPbVR2rAt2c2MXqa44vOl4wBVxfvw8IARVU6fXVfIgMIEjDtagmcTUarlGkxLViwG6BYfcSUA==@protonmail.internalid>
 <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141052_233899_24F81C52 
X-CRM114-Status: GOOD (  16.51  )
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

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov9282.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>   	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(ov9282->reset_gpio)) {
> -		dev_err(ov9282->dev, "failed to get reset gpio %ld",
> -			PTR_ERR(ov9282->reset_gpio));
> +		dev_err(ov9282->dev, "failed to get reset gpio %pe",
> +			ov9282->reset_gpio);
>   		return PTR_ERR(ov9282->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

