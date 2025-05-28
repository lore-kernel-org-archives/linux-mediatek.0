Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE17C5AD49
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EttMl+UEO23MQ5/zgKZh51X1fkqP6brx9qDrKYFmyoA=; b=01C7wjFV6REFLQGEFRb2SJp8y3
	cTsgYRbXT/Siesd+AR7/8nhx7RWD8uyn8AGq8J084g8tKvGWEOi72EFHwy3Ve2WLMKhtr1eu9xBs7
	C8gXHtXNEwNneskG7xWdUpy0Oau5FP6vkt7ICxt8ifdN91n/ezE7Mr2RIhvmrHvJtiJLMQKptUGxx
	81fTDVLgGYpj0xXH0xW/NGT1RNP6SwoElzWfOPB3rcdsTRNrRC0kpZfclNQjOM5GIn8/epNu39fvF
	IeQ8V+SvJIF12EbDmmYyXx7QQlPmNctxS6Nl4NtMqSLc05ovzxfdEejRJhjd0LhpGO6HrzqaKsPX9
	u6Jv6vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGEM-0000000D9wt-3TsD;
	Wed, 28 May 2025 12:50:02 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG6o-0000000D9AC-3SP3;
	Wed, 28 May 2025 12:42:15 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2349f096605so19099945ad.3;
        Wed, 28 May 2025 05:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436133; x=1749040933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EttMl+UEO23MQ5/zgKZh51X1fkqP6brx9qDrKYFmyoA=;
        b=lEfFHX/Z9Ldr+ZSMtEjD7Lyvn+Kmf5MzYNFNse0xFqilaGi0YcZwiuINkd9/WKX+WT
         J1INpTAtJaNloK21ihHDjS5M5cHz7A1fOo2r9D2lYa8u1wRlVV5n1fTDM1k4Es0BXKER
         KNZsZiEO8As9sdnkQ9SmTOld4meYddVXej2qAfYkMZAVzUh6YyvDHoQAclEKnkHkXELG
         Nm0KrK7XwOXNJp16OdvYe/i3mjh+I3P+NBei0IOCKWb69ttJIz8Go3wWVheLaJ0v9sH3
         njSb8d+/u4iEtiJEah9F80oMK1z/2dg7YQlesgA6rGg6XKNxO5TSj1oSYDBZ4mcmm9B+
         5d3A==
X-Forwarded-Encrypted: i=1; AJvYcCUeWdNSpApzpo5ZECAVX80a2RbKKHSS+nH6aRYc3qr7tZf184E7vDN5S9jsF3+JjEZF8lcZU9/iOZYTofSuH94=@lists.infradead.org, AJvYcCXIPfU9L38VLVqZ3iIfCAofEeDCxkeP4W2m2XkSc6slBrAx7sHTx7Hu0kIMey6sgWtmnMZbAe1YsEeyVa+MzkxV@lists.infradead.org, AJvYcCXsiiAUd5Scab7PCIlrTnkT49y87XNGZgmc2E8XwAFRsP5aPkqfhE2JwEJmfArKyuz0rBKaj/sMwCPdDp0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLXxgp1uQI4cp34nbgqEWubzsZU9sJSh5RhFEllaBcPZCi1yWO
	W88fydv7gtSh1bAXpBEgediy6omb6DrnLkoOWjLVChgN/JIW0aZVAu9DhCmlph/i
X-Gm-Gg: ASbGncuWiBwEWw/FS38Vr/uE6CtPyDT7FNf02NjR6mYcxspFCPNmF08HffYXR1J2afm
	UenBTtqenY0W3xWmZmNkaYIOy+cNpeDOW8STH1scIHfVgG4pyhJ9kqaLaGAfXVKP1dxFdCgUrUV
	M4WYPoVP1t1QObQGBJZgqc7G1C2U6Uj0zirAPa2fO24igk3fFeFl88ZMnauzEUdfkYPnHhSGq5w
	P+0cG9kg9TWB1yad510PP0JuSfvYGdYD7FNnB1G5H8YRDisnlXUwHU3EBO2eJvuDFEnRAmahrdc
	c0WtUjL+ysF2ePKuvBr9qQebgC0ynmew4DQp1MXc+HbfFSlhbtW2onCNMjwRyjGP2EYC1lT5/c4
	5kztEdNKHIDipm1DJXA==
X-Google-Smtp-Source: AGHT+IHyBuyN9lR4roTFvB2g9jYy0UTS1nW/M4BTr9YSQdr7kLBjNh20AhHFFOsd5WZiGLIArtaDFQ==
X-Received: by 2002:a17:903:2614:b0:234:bca7:2940 with SMTP id d9443c01a7336-234bca7360cmr53444895ad.38.1748436133566;
        Wed, 28 May 2025 05:42:13 -0700 (PDT)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com. [209.85.210.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fd22b3sm10995555ad.21.2025.05.28.05.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:42:13 -0700 (PDT)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73c17c770a7so4455212b3a.2;
        Wed, 28 May 2025 05:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQReTVilDMrpSyFvbq+qGWjB1V+5EsGQtdIkHearxX5/jMr1qwmX4pIrJYaC1ldM9SoIwiwHWqPbDkkdHpWyg=@lists.infradead.org, AJvYcCVbItjRg2marfuGk24m2/cpgzMOVvJ2mdlP3tJT3RnwBjwt0hDnkDlYBLvluqOwrzWhAdykuJMAxhOWOxgfstzo@lists.infradead.org, AJvYcCW8zobAhfStq9qfVRD+oiq2dYpdUW1K1DLDh8jBu1Z7lZSU9S2zCv6MY0MYEwFB5vJxgfuSDGkDb47GXzo=@lists.infradead.org
X-Received: by 2002:a05:6102:3e95:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e42415db7dmr12024574137.16.1748435792883; Wed, 28 May 2025
 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:36:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
X-Gm-Features: AX0GCFvOxqSsQb6hAAUjvGh24-ydFSS3wze_W2Lj6wpwfm4mEoNhN1lAYOnpqvg
Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] pinctrl: starfive: Allow compile testing on other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_054214_859880_3155F411 
X-CRM114-Status: GOOD (  22.78  )
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

Hi Krzysztof,

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since all of its Kconfig entries are already

... since its Makefile doesn't build anything if no Starfive-specific
pin control Kconfig options are enabled?

> have "depends on SOC_STARFIVE".  This allows compile testing on other
> architectures with allyesconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -82,7 +82,7 @@ obj-y                         += sophgo/
>  obj-y                          += spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)    += spear/
>  obj-y                          += sprd/
> -obj-$(CONFIG_SOC_STARFIVE)     += starfive/
> +obj-y                          += starfive/
>  obj-$(CONFIG_PINCTRL_STM32)    += stm32/
>  obj-y                          += sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)    += sunxi/

The actual change LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

