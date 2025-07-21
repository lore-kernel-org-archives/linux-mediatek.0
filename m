Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1C4C87FC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzO5P3P0FJijMBbxPLzt3Ej11oxHKuZJ0djP07BY1sA=; b=bmEu7PHlZiM9F3WPwy0vvIkm0H
	8m+bJ7m0m8LMAozwHyIuxxLrqVbg53g9XuJGbO1IckJBnbJcp8E5uIBk0MgwYyEsKAUR8opaM+6rO
	3RJ6hIzovT9ePnjM1uHrX5HfTV5sCZuFHzri57dgtzT+hn6jCyIewX+1eqfLi+fDzDYyVSJDpnzrI
	1ap4yPnOYm3o4B/HDZEJy6izxrxKYVS/gLrB9z2etiLwBfjRrdjBvaM3rDRivB2jjeFnhTzfuNbkz
	oOaNIudldjmUkLND26CuLje0Yr1eeb4Q0RWQheIUlt5kOMjEkvlawyB5m5n4JjgCr/a8mc+CFfzo/
	zLbRHaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udn7R-0000000GrXr-1NOc;
	Mon, 21 Jul 2025 09:47:37 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udme9-0000000Gm3d-3SvD
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 09:17:23 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32b595891d2so31850031fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753089439; x=1753694239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzO5P3P0FJijMBbxPLzt3Ej11oxHKuZJ0djP07BY1sA=;
        b=Hsjd0qb4Uk/vF09oFdGYXIbUFYUZfkar3ZgT6I7q9mlD4tbubxEGXqVjvTy9Ex5AIf
         ubR3LLGvl5tyeMR77xyZXdboZpkoBysd6VL3mVzn5kbYYmMmQdYenKkx5lDqHkeePEeV
         sB92Z+yO9R7IW/aMAlCa/qBlTGAGgausm2Npw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089439; x=1753694239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzO5P3P0FJijMBbxPLzt3Ej11oxHKuZJ0djP07BY1sA=;
        b=hTxOtnjg1Uz9BTV2KPYvsX0GjGMNAOkKopr4lFUaRSE3J5tmCgZUECwSooQs49Qtai
         yGj+Y7gAGBQAwRcjsoEDXt9j+mYd9EXS5dS70HBhavhplWioR1zNtTD7yhHWSzZ6dFuL
         zAQ5I6lSXPjc7AXuABXxua98LJoeaCm7xArfNtWBkqV5CJUMqdFBEXfSapZGBwPcJzCJ
         3lopgHozh0m8P2W/3BUPf1vTHF4CRe0YlAsHLF93pERViRDqidSgTs8YuXir/NsXUQcS
         owaAZyqsJsu77e2AXRn/S+B8s1sJvJpyltpPfzELjg0G5X29AsQLGEcIQAmX2H0howVz
         qYIg==
X-Forwarded-Encrypted: i=1; AJvYcCWmUtHzpYmHjgjrp+sSCSwI07jZ4L5n2aavmu98Wc+960xbMWInCDr05QZ7aKXycykh7Dp2eSAAeXSHr7EszA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQv199pGORKqKbayF8QGMS2mQuftnvUU3oPiRwqLUNgBKO1kbl
	eIEuAdUU4CpQfKykgKVsK1GtTnv2eNtT4MP2Ck72kTFOkR+6HAOmHwDjN8gEBamBWiDAQ3HDFEo
	YxUqjdMzlENMXcTnnL1sgm9OzbbDAbiJ1nvQU3DCA
X-Gm-Gg: ASbGncvGB4aaC/bIl0CVg9+SE2aEdiIGV/hq8RogEC2iwUfOT8xij2zLo9Y8jsUEPM1
	XExuHDoreSFWvHUUbvNZuAzpLpHEs+1l65awxtqApffzlt08DDttQvv1L+pHnnTQoS5Bl5o6gS8
	eeUFsbE7wpWNYenwWbTnuwegGa4KlALDbfdZNG/x1+rLmepkd6hxT1AtsMMYCs0IciF4z26Ns1x
	RhMWg3oGqDVovIXYll4A+nmONzFcAwJVq8=
X-Google-Smtp-Source: AGHT+IGsTM4OZon7DAn21K+VOTkANCYpUhk6AdXBSwKBuRY92Lz2AQqBi0+KAt5b4wzJCvI/4APHAfCqNcgrazzwXHU=
X-Received: by 2002:a05:651c:b0e:b0:32c:bc69:e921 with SMTP id
 38308e7fff4ca-330a7b12523mr35293861fa.9.1753089439395; Mon, 21 Jul 2025
 02:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-10-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-10-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Jul 2025 17:17:06 +0800
X-Gm-Features: Ac12FXyXAg_vtqZYAclMGVQ9H6ITi5IQnXn8iXFc86cirJi3aOdALAQn-Ge1VQw
Message-ID: <CAGXv+5FcW2ds9zS_n0SG8BDXV8pz=Hg2R-9sznV_TqsX0KdnuQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_021721_912959_3AE3A47E 
X-CRM114-Status: GOOD (  14.39  )
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

Hi,

On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add support for mt8196 board with nau8825.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/Kconfig                 |  20 +
>  sound/soc/mediatek/mt8196/Makefile         |   2 +
>  sound/soc/mediatek/mt8196/mt8196-nau8825.c | 869 +++++++++++++++++++++

[...]

> +static const struct snd_soc_dapm_widget mt8196_nau8825_card_widgets[] =
=3D {
> +       /* dynamic pinctrl */
> +       SND_SOC_DAPM_PINCTRL("ETDMIN_SPK_PIN", "aud-gpio-i2sin4-on", "aud=
-gpio-i2sin4-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMOUT_SPK_PIN", "aud-gpio-i2sout4-on", "a=
ud-gpio-i2sout4-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMIN_HP_PIN", "aud-gpio-i2sin6-on", "aud-=
gpio-i2sin6-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMOUT_HP_PIN", "aud-gpio-i2sout6-on", "au=
d-gpio-i2sout6-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMIN_HDMI_PIN", "aud-gpio-i2sin3-on", "au=
d-gpio-i2sin3-off"),
> +       SND_SOC_DAPM_PINCTRL("ETDMOUT_HDMI_PIN", "aud-gpio-i2sout3-on", "=
aud-gpio-i2sout3-off"),
> +       SND_SOC_DAPM_PINCTRL("AP_DMIC0_PIN", "aud-gpio-ap-dmic-on", "aud-=
gpio-ap-dmic-off"),
> +       SND_SOC_DAPM_PINCTRL("AP_DMIC1_PIN", "aud-gpio-ap-dmic1-on", "aud=
-gpio-ap-dmic1-off"),

These are pins for the AFE block, not specific to any machine, so:

1. They should be moved to the AFE driver.
2. Their names should match the underlying interface (I2SOUT4), instead
   of the intended use case (ETDMOUT_SPK).
3. Their related routes should be set statically in the AFE driver.

Also, for the I2S interfaces, since there are input and output pins, but
also common clock pins, you should either split out the common clock pins
as a separate pinctrl entry, or just combine them so that you have one
entry for each interface.

Last, you need to document the pinctrl names as required in the binding.

ChenYu

