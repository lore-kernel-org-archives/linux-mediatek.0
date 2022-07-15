Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4C8C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjk0QcLK7Qj7+zbxyz81ybo9xTsZsUl/7XEcNiCSZlk=; b=zmwq/PQ6+Sk7u8gHrqAjU0kma4
	CAaKs2Hyluxpl0sknpFQHkQYr9g0wE7VU8M8fIR9jWulAOmBvE13TUdTMDmpA5RGjZaDpXcRgP8R8
	Hnpn4cD6+Fxo0eEqy1cdAWin4DS8YKMvOiow9NwQ27+TjHn7Yc5YkmGnd8j3PVnl5/qYLun5wDMcc
	e1BaZQFVhmgoMTaccm7ZD21gfpJoz7mrolmUKXq96COAxQ6UUNCRNLfNwQDZSM3SB7v6vehCK1pv1
	jq75gsKEH4fokaWO12TI5nLJiEjZgEdAca493xR/yAS8cDbGkg3AgkzGndC7G5fZX5/5SoiWX+B5k
	CJiSOkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCL1b-0079bU-2k; Fri, 15 Jul 2022 13:06:31 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCL1P-0079XO-By; Fri, 15 Jul 2022 13:06:20 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id l11so8285678ybu.13;
        Fri, 15 Jul 2022 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cjk0QcLK7Qj7+zbxyz81ybo9xTsZsUl/7XEcNiCSZlk=;
        b=I/KxJOarbkD3CTr6bI1+GX+R+0NK3NiJOovyOkNmpfsXSDv2vhcKk5NI+vZftnkbGg
         MwrvPAOczLpV/PzuzznMkxCSxJ+6WcBxz2SeXhuGLsY0hH+bxgIA+vAWaqy8gXKWAq2A
         uzFOe2j4x3jy2QIvV7SK11B49LyIqafJ56HKzoiej9S7S0ggTmMqLI8tQrHvAJsSRq/z
         rNeHJ2pSwMUMYzeC8dNaH6ecQWQOtzNB7/eDnb0GxvTouw5w6xHmU0P81MLtH8ioFMQA
         fU5zDFovh6s+bvTishJ0zl5v/l4nnJ809RZNoyuqT7PXEo9cUMjGqySfB+fn2ERJmoLs
         3duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cjk0QcLK7Qj7+zbxyz81ybo9xTsZsUl/7XEcNiCSZlk=;
        b=Nm/gewXvykNDZbGgHSB8GeV0IqnsHKyeUJnXbPPN/n1potgF7bmcSesLhE38gzHyWk
         +JYHSnt31QfBxIBTzX6WquUckW8sGI87fHoOkSKQHXpfCVvvdELEo2IDk9bS6/iNIBK8
         36jfZx61KYJbXzJq9yhh5DwZjk8anRjzH4d+qNU/KtEuQs61C5tsSNRTs56EhSvl5GmM
         UZQuf1m0am3Ry5Ta9DvRAgq8rmWswHieiyhbJaYhlMoiG46kFK55b+RcQqjZng0EIcS5
         gDWxFq3VtD5hcSKl2s950qJ8/u3I8QOMCMxEgu6RljYakgNGf2qxi5A1DeX2AEcwAB81
         yDDg==
X-Gm-Message-State: AJIora/LuDUgrjbuxBMUMZ6rXO8J725bIC68+Z9qkhk0VTZ6Lp1WPFUA
	sarvk7GuYVsvx9QxQtPLL7VayfYrNGC9/zTDcvg=
X-Google-Smtp-Source: AGRyM1u3gUyh808T1Pv3+nx4gv3OvZpiRmNXNk53IV5K4A6JGQG9S+KaILzgC03cdHtsws8VU8kBi0pySHUZ77kiRtY=
X-Received: by 2002:a05:6902:1143:b0:66e:eb08:4c23 with SMTP id
 p3-20020a056902114300b0066eeb084c23mr14488436ybu.570.1657890376848; Fri, 15
 Jul 2022 06:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-12-peterwu.pub@gmail.com>
 <d7157483-a6c6-1883-6fc1-d518c7095288@collabora.com>
In-Reply-To: <d7157483-a6c6-1883-6fc1-d518c7095288@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 15:05:40 +0200
Message-ID: <CAHp75VdzG4hjcMDv5Qro25gJx+adO-rNTiCx9ez30uVoUX-odg@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] leds: mt6370: Add MediaTek MT6370 current sink
 type LED Indicator support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
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
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_060619_425557_8CFFC07B 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, Jul 15, 2022 at 2:40 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 15/07/22 13:26, ChiaEn Wu ha scritto:

...

> > +#define STATE_OFF                            0
> > +#define STATE_KEEP                           1
> > +#define STATE_ON                             2
>
> I propose, instead:
>
> enum mt6370_state {
>         STATE_OFF = 0,
>         STATE_KEEP,
>         STATE_ON,

>         STATE_MAX,

Usually we don't put commas at the terminator entries.

> };

-- 
With Best Regards,
Andy Shevchenko

