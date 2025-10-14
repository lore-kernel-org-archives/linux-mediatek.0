Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4563CCCD18E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=; b=s7k7JK94d4Mi6cQ53ujpFW1dp/
	jg9gB6MttLKsm79GmsMAWsOvXR1G8makTbMrbXtdEGXjZCruY8PQtJTnz8JxHIyZQkHOh+Daf0Hz8
	hyFViPtAmUDfLbG2fO7G4YLVWPigC1TOd2TTiIY6I6FymhmSiY18CxjmJHW4+eOJJuQmzwdsm4GFr
	i0itJC5SglB2kLUu63et9Zb9OUf311rNKvxVU7oQB3pOEvYSKrHqD5IIBDz9BmtMGMrPmNwcN8ZiT
	6sNyr5qkY9QfkcTo53aegBnAcR044dUlW5Rg6O545ODuSuywUzvGbrinWc11vWeVaPlTFNEKPSXVb
	zrk7H9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mHQ-0000000HQ3f-3Hea;
	Tue, 14 Oct 2025 21:10:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mHM-0000000HQ2D-2mVU
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 21:09:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so1807025e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Oct 2025 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476194; x=1761080994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=KRf0BrQC3Mum/DQusG040TA3cREvouGllyIX1jBzpy5fg/jm1kvV7TsEGM60byVU7K
         vcD/cuBh/nZMjwcWOa9sdWxcjxPUHybkwyvAFmvD17HnWpK+7KnkUpZNe5RRnEdIqZEe
         y5vwRBCiWNuqAGSkMGEBAAb4Q6i/+vWTFeb25YkWF0/uHmEU3jfNQU1KSIPCbKDRyO2J
         rw/sJZmIKnvib4XMylFNIX6YB5f13qi0hHMxzaVtrBImjPfk8DLu9Vyyr2+brVVAcjaV
         NnUGK2uaHdVCfCMA5FQc7tZrHRq6AgvvGc2QFIK4kNPocKgcNiif5AEMyDcyoYOavKls
         VHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476194; x=1761080994;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=k/UBPB3p86Jw4JOYqjDS1Qp3SgGXnzoUhvf0lGZc4Ld7SOPFxpypBEnrXi5BDtzAOB
         bf9M6TT67Y0OtZ16LL9R/CQQsemgKX4VEGY8VSGokiww/D5hE1C36TktFAAxk+SeVjWW
         AxMQidUCWu8RijXQZxOo7I6QpyA5vtKGfiS1XBiqAvSxDT37M2O65Bi2qnPt1ApdaXmG
         QqG0SnD2S2m3daejuTt1MFOnbnOcVJU11Hoomou3p/BCwo+rIjvrGS2787sdQxl7FTHi
         6/mSPJjzywaDFidVVsb04rk5X1CKMzQNYHttvlCwGCPv4xeDge6eIB4zkgnA6yVb8bEM
         NtFw==
X-Forwarded-Encrypted: i=1; AJvYcCVB15mZPBsNZnSHgGo4oUvnQapKa6zZibJCvd16bA2941r06oIhrLjfH5on4BafaSSoL6nJG2/S5jKZyAR2bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx45Kcu3CcZnXjSJI4ksNUJPFXTmjiAORKlMA2e1mrK9EAgIiJO
	16BzomRQsnytdKta+Epd+fRs+pWNut52TgdKvVHNUMQJ6twYoVOQ5srSDPRWzx8P0Tg=
X-Gm-Gg: ASbGncvdHHAi7LUlYmXi6WGWkchAYd+Oij11TSJRGw7aBl4XwdWriwn6J9XQnYRHhPo
	f3WrU5tapXg+TZxNVOU+G4dK4LlOnc3/+g0pUb4mPnYAc/F9iiYb5xK55rZJNqYS8qwwzhOb+EM
	/jtCODw5AYaOxu5emPOTmgT/pelxhJi6fye6RQGzaX70x5OoAup8cmZrm2x6hi9es7gcju6G25S
	zazreWMsBSM3O1xcG4YU+jnDmS1h0OayrByGR+geaJWx003AHZE62bPhwuli6q/VVkZmYhp+n8/
	uNf3gWE1kP2vs9hIls07DbXE/NOWhSsNxZSbOH/RLcJi9GRsh/LGgcs9m72z3CV5ofR1PBg8jkI
	3h4JtRr3ghDDG7PTyoFMtm3/j8tcLrapiIaOQACaObc2pyuxwypt69+8fUngEkutp1Wl4Gp36+5
	jogDcTOfFysoSlXHqMuYyEPw==
X-Google-Smtp-Source: AGHT+IHMLDEl/2OUqyd6dsVKt1UGXh3BaRNNfQRox5yRqmlsYRCZeNTg0aqnPOJfK+LSUdRcw9kJiQ==
X-Received: by 2002:a05:6000:2389:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-4266e7c7b2fmr20416940f8f.21.1760476194354;
        Tue, 14 Oct 2025 14:09:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b39sm25169444f8f.15.2025.10.14.14.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:09:53 -0700 (PDT)
Message-ID: <ebc5be79-7184-4a91-92fc-8a181ba096b5@linaro.org>
Date: Tue, 14 Oct 2025 22:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/32] media: i2c: imx412: Use %pe format specifier
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
 <U1BUWm68sWNPUXHr6NOsnc48bb6eXIL5tcAzrNijItgutDvPaBTmCI0qf2ERLQB_2BFYEBVNvWTQdmx5z_UU-g==@protonmail.internalid>
 <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_140956_901273_506FE6D9 
X-CRM114-Status: GOOD (  16.52  )
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
> ./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/imx412.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 7bbd639a9ddfa7fa76d3a4594be1e1c4d002c98a..b3826f80354703b17b416dc233854da3f5736e38 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -927,8 +927,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>   	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(imx412->reset_gpio)) {
> -		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
> -			PTR_ERR(imx412->reset_gpio));
> +		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
> +			imx412->reset_gpio);
>   		return PTR_ERR(imx412->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

