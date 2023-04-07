Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB209C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8dHsb5zeq0taA3BZ22wsmPN3jNuj4ynCop/YpYKFSA=; b=sb2sx+g14O2shx03QjbxvCCr8T
	jSWxGu2RbNPtub8INlpx/EIs4L9RSfDkrK9rOIxzpGAp/jaZJtRhTNC3IAtEc0k993vYAhAQIEdQS
	XEZQG1f+WkDPFceY4ZZjjjJOcH+llr0VbRmh3hR14YSYbD0r1wTa+KxpKcO6j88l+IoAMOP7O42br
	50tDDP6aXxMZ/DdQonQi17ER7XRHd+c/X4ayobgiGSoXMsSmYfnfM08e5MKzxOF5FBKmNZjJUpklT
	z92Bse5hv4m4fgWV4CoM4dsJm8Ub8IO7lBZVRfzA0TN0VM3i4r4J4mmDwGow7/RcI4dGn4vnE8WCn
	oemAYPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklry-00AFoq-0B;
	Fri, 07 Apr 2023 13:11:10 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklrv-00AFnv-0W
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:11:08 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id r187so48940698ybr.6
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873066; x=1683465066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8dHsb5zeq0taA3BZ22wsmPN3jNuj4ynCop/YpYKFSA=;
        b=mD9/MesNQhagc/BLkXuFPoE3QGBWcfZIdlrOYWPi5YzJGmbCWVmuEYCXePdVKgNJWK
         QFQX8yH2WMu9a7oqR1JQQHjoPMdCKQuRiZonLLQ/WE44QTTa0E048xFHeoX/uXyAJB51
         jcURtaO4atl7iDgOV1zE1X+O1aUJ4VtGHU43pBxAb3zc05OgWIk1rQIcrPRj84vctFs0
         et2O0yV3BGs9zFvbzsZdvW42iuhU97ZOI7/BDGMdYYvhtOkX68WGG0/Tcwagf5E5ib/h
         wsCt54sxQmO1aa2QQNtZkFjCQZZzP+3QweCIntyKwXWnkd2auUhfF+CPQGoopHd/xyvC
         YCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873066; x=1683465066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8dHsb5zeq0taA3BZ22wsmPN3jNuj4ynCop/YpYKFSA=;
        b=rOXB7pWv7SqcwLcFLLXQD8IcGltyMcap/k8tLtK2RkYi8QCEccAdY/BY9TxPxKseNm
         LhC4gd3+frjOy2l8lD6UQeknAmKoZ9jhNvgcSm16mvxYppFGWO2o3LN0HiADm5Y8LGSr
         otG6qbaxkfuX95N1YRaNeq0yyTsYDxNICAn4M9sfQegXGIt1pJBqvbYpBc8IBQ5nggpP
         GmiX2Gxg2UepGrK43Pl9pHUzDCj9cm4z1pyZqDQ3Z0baa4ugBsg13IkfDqiKFU0Z4OlH
         vvcNvBvcURAdBkeQnEY75kvCxkMZgAByYWYL06Nv7zSk3IcOUXIvVMI9N2MjoHMhrvdH
         Mr6A==
X-Gm-Message-State: AAQBX9cQZ/lzfoO7j3o40wOe+U62Yo9VeH9uFSD8h6TXSE9dztqPepJr
	wYG3qPeDKYrnh1fWtFqyeAZj1w7a9pinkxlNgF3v7A==
X-Google-Smtp-Source: AKy350bpnn3ouh2EF8DyBoSaNLL2iIUmYRmZHLZCAsB7j1oUL6EPcr61V+BVgxQLimgY6vnce0rga7L0+KIG6FMoQ0Y=
X-Received: by 2002:a25:d114:0:b0:b68:7b14:186b with SMTP id
 i20-20020a25d114000000b00b687b14186bmr1499326ybg.1.1680873065744; Fri, 07 Apr
 2023 06:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-2-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-2-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:10:55 +0200
Message-ID: <CAFGrd9qMuE=kuXK-A+xN5CZfu-8umG61JPNzmgHbbMsdo3OQ1w@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] arm64: defconfig: enable Mediatek PMIC key
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061107_199558_12FEB414 
X-CRM114-Status: GOOD (  11.74  )
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

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e4cb65889ae6..91fad635e565 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -406,9 +406,11 @@ CONFIG_MHI_WWAN_MBIM=3Dm
>  CONFIG_INPUT_EVDEV=3Dy
>  CONFIG_KEYBOARD_ADC=3Dm
>  CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_GPIO_POLLED=3Dm
>  CONFIG_KEYBOARD_SNVS_PWRKEY=3Dm
>  CONFIG_KEYBOARD_IMX_SC_KEY=3Dm
>  CONFIG_KEYBOARD_CROS_EC=3Dy
> +CONFIG_KEYBOARD_MTK_PMIC=3Dm
>  CONFIG_MOUSE_ELAN_I2C=3Dm
>  CONFIG_INPUT_TOUCHSCREEN=3Dy
>  CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
>
> --
> 2.25.1
>

