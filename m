Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CD6C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXb71uFWhSg39Viv30HgP3y8LahJOu5TtvkjW1YFFmA=; b=q3kJUSrkiqXPa0LPO4v7Z5Y/hj
	/ST/PhtE9Dhz9CK0CN6WM/KD2f3+18m4xG9mqUq5vAfDulQ1sO+mSL3U/qkawAfGN9uOgG6o5cGEL
	gaGT03VAPIDN1WQH3xbzD9cxNCiWIOQcqkUMlVXnO95oE0x5mLEkyUp0gG4GJruTTiRZen75UDpYR
	+iN8LfhkXUPhQ2u+0DVJYoQl0xL+KlzgST7Bf6S7vdnttmNcozRAD7E+1zzSKkUHiNJKyU9NXQt7F
	4k6+XzjRxmRmN/1E2+GJvOlxHGnHbThj350D9mioRbekflvyctnEPRzrhJ7MIbo0cM4Vs84e5o4Fu
	vkboyqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtBA-006dis-9D; Mon, 25 Jul 2022 08:11:04 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtAx-006dTI-HB; Mon, 25 Jul 2022 08:10:52 +0000
Received: by mail-ej1-x62b.google.com with SMTP id os14so19165540ejb.4;
        Mon, 25 Jul 2022 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QXb71uFWhSg39Viv30HgP3y8LahJOu5TtvkjW1YFFmA=;
        b=gcXWANYd95QqpDZNjT80H5El43Dovr5S0wOb+dj41WF0UAkuUiJDW2NAi4iQ305XFQ
         lVVKY0C+iGL0p5tVBSniVcX6zLS8O0o42jiM3VHbf3P2PJwPJY9pNrOD5I3tyZyDgnJy
         d6DIH0u/YAoFuSujbvAgci/gyOOkxjcOa7FgLYcccmWOMRReiJpRQvj8oeNjtzasRz45
         5wI5mC7zC/KC/unitlCB9w7h7MNbq7bWUvDLO3UqaeZF52Xc40wDLTHrTN6lnrUtKqrq
         8MOcmmfgBfz1xp4MxADiih/qQe4qXT1ndVyvX9sozOvgmH8wWtATEk7QsOTuHRb8u2m9
         CtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QXb71uFWhSg39Viv30HgP3y8LahJOu5TtvkjW1YFFmA=;
        b=MvXCiMHZ/CsPstTSmLYnnfpR4al4X+hksf8WFimhOvsNH+2ahDIuHFu2s2KUORS28l
         yythNj61pYn+5dzKGZQ+h078mfJPiWE5bDm/7AYeTO0IMJjlJsD9v8Wa7j/LeokQ5Xnz
         aLjdCUfWRLzrJhtVfBI9D0kMAt1JOwGN7ho2K1Rb2Sy4twb7Wv0yWrJ1AXq8mxAEazQn
         ykwtzPKlY8bRKj/kz03Oc45Y4++sTY4laCW/OtbR/7ypr9WW+AQFvfyvft23DG8xQzOe
         FJu/EI/kJbLxbqpPzhD5UNBzFrwEZsZA0BuufxYM5+x4V+JCF68MgcLG+vzwG/JPx3sG
         UdFA==
X-Gm-Message-State: AJIora8qdK48Bgig2zPpWfTH0rsUbgqFxNg8cy9JB8Tuy/ZYKsnR80Js
	JSuO4jvJD9GYXp76VLOAP7ARdMnC0jumXqegBCE=
X-Google-Smtp-Source: AGRyM1vadWdzYb+xBUWIOSQf30AXu6Fkj1TEEjh0wt407LPyY4IeBvhlCzY8/E5xfgCj1T+lP6Op+S0BRvRPn0GRG+I=
X-Received: by 2002:a17:906:9b09:b0:72b:9612:d373 with SMTP id
 eo9-20020a1709069b0900b0072b9612d373mr8927348ejc.606.1658736649264; Mon, 25
 Jul 2022 01:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-10-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:10:12 +0200
Message-ID: <CAHp75VfRZvYA3HJg=LAxXxu26aLSwRGQaED19Bg2d+dZw3RPfw@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] iio: adc: mt6370: Add MediaTek MT6370 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_011051_615480_E79D03DC 
X-CRM114-Status: GOOD (  15.39  )
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add a support the MT6370 ADC driver for system monitoring, including

support for the

> charger current, voltage, and temperature.

...

> +#define MT6370_AICR_400_mA             0x6
> +#define MT6370_ICHG_500_mA             0x4
> +#define MT6370_ICHG_900_mA             0x8

^^^^ (Note this and read below)

...

> +               reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> +               if (reg_val < MT6370_AICR_400_mA)
> +                       *val1 = 3350;
> +               else
> +                       *val1 = 5000;

Here...

...

> +               if (reg_val < MT6370_ICHG_500_mA)
> +                       *val1 = 2375;
> +               else if (reg_val >= MT6370_ICHG_500_mA &&
> +                        reg_val < MT6370_ICHG_900_mA)
> +                       *val1 = 2680;
> +               else
> +                       *val1 = 5000;

...and especially here it is so counterintuitive to have an if-else
chain because the values are not ordered by semantic meaning.

What if the new standard/hardware decides to use 0x7 for 100mA (hypothetically)?

So, please use switch cases or other robust methods.

-- 
With Best Regards,
Andy Shevchenko

