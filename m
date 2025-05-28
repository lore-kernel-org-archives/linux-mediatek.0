Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA28C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbSvaL2uho5iBNc6UnxSmb8ikoxZVNAuMK5QOEf9/rc=; b=kajgFwqfcYn9hwM1rLqzGomDWk
	K5wL6wjybmqKv6CgXLWI/jwBKN2CaEyhDDDS8FoneOdGZAe3haDMcFibDog/lTrtD15tNOaKFnX68
	rRWNtRBy61TEe0noxhoPRghuflxUVQ6cBXyZrersPrq2/sXLNLvLPjBvsWQVZADAuWhmrOx2h8WzQ
	i/k0viVoFW0M0+ubRiuw01e94GKxZxneIB++3rUEzJ0WdK7zDY4DbWDqrhgyV7nWXLkCyDTl+nSaL
	XXGiH32KpHMH9q7V3i5XvkjmhbzSelxcR0HMnhHxstOCr1l+OdEz2Ejwfb5N24WBcr0rlvCc5w/3c
	aLHj/u6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGPc-0000000DBl2-43Zf;
	Wed, 28 May 2025 13:01:40 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGPa-0000000DBkY-2fAk;
	Wed, 28 May 2025 13:01:39 +0000
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7cadd46ea9aso556950585a.1;
        Wed, 28 May 2025 06:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437297; x=1749042097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbSvaL2uho5iBNc6UnxSmb8ikoxZVNAuMK5QOEf9/rc=;
        b=tNa5AeSWH2KlyA4vgDLFRZRBis0O3UodssAEoFnv8Ffj2fVqQdI0lI3MRAscueVqJ9
         NS5ZWjaDvVhGqmk5Hk/o2Guj25gNj9KvaGcvmPisTI3HwWbtJjmm6Kg2VAbfJ/A/aU8r
         sqeyT5IMcidMWSlevW1nMk1Ti6jOJcMHqFPqjYy7tVMoNoIC/oZ94DFAcLaEkI5I1T0i
         jp5ENOcrfKi/kmwpeLudoOW8SsboAZdmTuYad1IS8qFitHpxuhC4AP6Kn0dZBZI88K6r
         6DcijC4z+NHRmIeU0pO9XN2edgwiS+J0gFYBvK+Szs19DWcEo3tfBkjsjq1kL+ePznNS
         2ePQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl88gyr2150wLPA8HUdEeHU4eMUC8k5jyTvw7ImqhgNsjYC+SdmM2PnBsVoUlKn1Cd5S1jp8L9Y7pmovA=@lists.infradead.org, AJvYcCXGejM+EjsWAO7JQP+d0+sLL9GukhzJcaZKKErkslXnG9dJOu4ZznsSKHG4qhvq8Zay8G9X95NrnUIRzstin8o=@lists.infradead.org, AJvYcCXXkIcOnJ5Wzcp/mIybn8ajdeUfS8+JYOXoLFJaDr0jl/hdY5CYqlMJYzxZ5+YtdTds2KLrnQq+Oy9RAgZSTi/G@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+nV5K1UsycHOegz8+7WMNloUYi4peaDZkn4wFO+efw7hav0y6
	rkxrEQH94EnaT6WTZjaiE2yzBGSGjqwnqBSrkzxGmHSE4PlClNrg5DMekdGV1mN6
X-Gm-Gg: ASbGncs7oIS8Dhhi184JEhnvzLIVwE+BGyMs8HkygNhq0bxlvJKppSrr7rSFmur1Twj
	2628V7QonIuH6RmHBDneee2HCbYQWsfJFPSPQcs/t9oDAUXxLDFaRIfGUwpG3NnNaj17qju9iC4
	omZA9sKFjpxgB0HJ+9zCUn0k6cPfmvafoXEEJJc+NP+FIBZg4hfsblEZjjmOwqC3Me/nyfywm0m
	UsjCBusQSCrCjJiaH14r3AUz32vC83qpSWgEZ7BUTxQvggXcVfWPhPfrLLZbX2exqOCYI0Q0QET
	EhWLg7/+2+m0BJTO4j2p6WlfwXyD6kvkmhOW1ONk8drdXjEb5738ENQ+p6MpogcygbJbpORD+uj
	E1qnB0PC14S1Rhw==
X-Google-Smtp-Source: AGHT+IGO3HXAwtjCd4NFPEJCB1PebjTaoOPupruCEvfYDK2aFcOMQy4FAAhunxteDaCNlLKGg9dtSw==
X-Received: by 2002:a05:620a:4244:b0:7c5:46d0:a77f with SMTP id af79cd13be357-7ceecbd3af8mr2134518485a.16.1748437296996;
        Wed, 28 May 2025 06:01:36 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfac770512sm68169285a.0.2025.05.28.06.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:01:36 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f5373067b3so48646316d6.2;
        Wed, 28 May 2025 06:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8P8ztfp1s0JJOBj6IsEp/K9Km2dU3QMAdtYFITWtt+2IVbjsGM6XdPOTLyukxd2stuXrzebkDq00/otNyv2o=@lists.infradead.org, AJvYcCVOQHaiRJNn4kiARQMGMqQNAYC2mbwelO++02JKtwqUF6tOheQXM4xcU7QrZC5G1zfXSxjE/rLVb7zGLsU=@lists.infradead.org, AJvYcCXaCdTmc2zPy/xLOT6bAcnVbgqmdfYiCPe1bWLvSRtzn8pjKOGBWuh1ME4HOIRltuRNBYowqz6saUwcS1jWZCWY@lists.infradead.org
X-Received: by 2002:a05:6102:2911:b0:4df:93e0:fb7 with SMTP id
 ada2fe7eead31-4e42419b8c0mr12541235137.25.1748436893682; Wed, 28 May 2025
 05:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:54:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
X-Gm-Features: AX0GCFu5yojjEPsbiWTwjJJQ5khyE5KBTwGS5B0aqZkGtvZvOhYOGPRkjlMB-4Q
Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
Subject: Re: [PATCH 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
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
X-CRM114-CacheID: sfid-20250528_060138_675118_6C842D17 
X-CRM114-Status: GOOD (  21.21  )
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

On Wed, 28 May 2025 at 12:42, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Assign 'struct pinctrl_desc' .pins and .npins members in definition to
> make clear that number of pins is fixed and have less code in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {

This structure could be made const...

>         .pmxops = &rzn1_pmx_ops,
>         .confops = &rzn1_pinconf_ops,
>         .owner = THIS_MODULE,
> +       .pins = rzn1_pins,
> +       .npins = ARRAY_SIZE(rzn1_pins),
>  };
>
>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
>
>         ipctl->dev = &pdev->dev;
>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);

... if you would replace this assignment by a hardcoded name
like "pinctrl-rzn1".

> -       rzn1_pinctrl_desc.pins = rzn1_pins;
> -       rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
>
>         ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
>         if (ret) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

