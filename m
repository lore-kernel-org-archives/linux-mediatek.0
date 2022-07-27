Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE77C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+itH6nCjnZkG3yJTUkgH3T3RkzlJIEijujwFkNTeHs=; b=sv+knzbGFXBvWePb9gBG9b8kcT
	qb7VPgmXms7tjOPlKHS2SFlhrow7L2L//VFLo7/JOUSvtZemmMSmVDoFr8XGOijCYGsory+8H3ypG
	2GbjQbNj9ZnGrfQlwRUxuGSJ4h9hM8pSsLoDZE7IUAUm28CrEDefZDhZdSW7FpHe1xZWqU48OG8go
	jkkK9EJKsNvKzrPqstjKMMbFrZ6H5AFSfhLDNko7U55TARsTTN7I9jDrvIWcQ1JrJ4OLK+/I2nbtG
	zFNq5VYHi9Cw/4H+RIMt4VrHKaxTH//JyJmuKyebFBEkmSS/2gVxfHqIsxd7H1KfG+TJnKXY4vYHz
	II6APzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGduS-00C9SH-Vq; Wed, 27 Jul 2022 10:04:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGduA-00C9FG-RF; Wed, 27 Jul 2022 10:04:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id w5so8314560edd.13;
        Wed, 27 Jul 2022 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+itH6nCjnZkG3yJTUkgH3T3RkzlJIEijujwFkNTeHs=;
        b=cG/IRfZwWO83wiK8SoAZgFegp/oSsSTdk6uMQXsyEzBbyDQ15vq0yzVYGG9pEdfz0Z
         ZOOouCQXEYxdPO6EleD7jGQocetQsqrcx2C7y57nBleaH3XWNh/p9EZXeeMxomYeea0n
         ccGpQbPM3KyJhbgX8FqfpXge+UD+lyXVuyBlv7AUvzyTYioFKkLUVdtqpGd8x6O73yOd
         o3BHcOkkAf6zj76YWhjS7ePObKwBxNP5KslRU9Zg6sRbYapoWTeSb3rLO4m4qR/dd5mY
         Xo/AD9faus7q33rPJGp/5b3BvXu4+tVOAzawSfBgIW64yo4mi098uiZmqwCRYHPukGG4
         n1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+itH6nCjnZkG3yJTUkgH3T3RkzlJIEijujwFkNTeHs=;
        b=x8lyF4jKAnKIXAX95vx19Ymp274oOEsBZzt8aPG7VzbW1D0mjseA81YVt9v9qkhprm
         ppiVPzxo4dKajhILrzHGEvy41xy4d2zOZC/00T/zbdFZr7BqciVSXVJ51AYIOI7BOpfA
         LeqNDpon85qkA/8EM48Z/wrRmQ4JogrcKLedoueyQ5576DVj0HvZcSNb41WA8E9t+2oe
         pUdQt8X7skBoWRWaIBvdWDiX6A203dPZrLsK9tOktCGsMtmenTJO8L3mFKBPN9RsEZWu
         sCd7RpUmz7kREmFGrzGq2Ln8yhnhsOwFZi/b0JvFBr65oytQQci1E+fcPKqpD5kT2pdl
         Ed6w==
X-Gm-Message-State: AJIora9Lb0UjrDRpupNkfXt0mQJC5ubXRNgWa1dOurEvUYgA4Bppe6KU
	9yJs47EN60wT6ajenhqBpe1uml8NYqCYR3MHazo=
X-Google-Smtp-Source: AGRyM1uwEejs5nDWqG+s979XFdwYwQmE2ZsEpW0n4nQQ7TCJsCqlYSNktlo34cJclnigei8K3rZk9qCXUcGHByv5Ilw=
X-Received: by 2002:a05:6402:501d:b0:437:e000:a898 with SMTP id
 p29-20020a056402501d00b00437e000a898mr22474219eda.265.1658916275876; Wed, 27
 Jul 2022 03:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
 <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
 <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com> <CABtFH5+bQx5ym5jOzCPJWbZ23WtGYYwS7cMRt2g3ipEEqTb3JA@mail.gmail.com>
In-Reply-To: <CABtFH5+bQx5ym5jOzCPJWbZ23WtGYYwS7cMRt2g3ipEEqTb3JA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 Jul 2022 12:03:59 +0200
Message-ID: <CAHp75Vf7jeG_DmD3sZnerFDEVpMxDiL9DkMBddAk-kJH7Hfttg@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
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
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_030438_912440_DFF3F700 
X-CRM114-Status: GOOD (  28.02  )
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

On Wed, Jul 27, 2022 at 9:37 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Tue, Jul 26, 2022 at 8:18 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > Just for saving memory space.
> > > Because these led_classdevs do not be used at the same time.
> > > Or do you think it would be better to rewrite it as follows?
> > > -------------------------------------------------------------------------------------
> > > struct mt6370_led {
> > >        struct led_classdev isink;
> > >        struct led_classdev_mc mc;
> > >        struct mt6370_priv *priv;
> > >        u32 default_state;
> > >        u32 index;
> > > };
> > > -------------------------------------------------------------------------------------
> >
> > You obviously didn't get what I'm talking about...
> > Each union to work properly should have an associated variable that
> > holds the information of which field of the union is in use. Do you
> > have such a variable? If not, how does your code know which one to
> > use? If yes, add a proper comment there.
> >
>
> Ummm... from my understanding,
> if the colors of these four LEDs are set to 'LED_COLOR_ID_RGB' or
> 'LED_COLOR_ID_MULTI' in DT,
> their 'led->index' will be set to 'MT6370_VIRTUAL_MULTICOLOR' in
> 'mt6370_leds_probe()'.
> If so, these led devices will be set as 'struct led_classdev_mc' and
> use related ops functions in 'mt6370_init_led_properties()'.
> Instead, they whose 'led->index' is not 'MT6370_VIRTUAL_MULTICOLOR'
> will be set as 'struct led_classdev'.
> So, maybe the member 'index' of the 'struct mt6370_led' is what you
> describe the information of which field of the union is in use?

From this description it sounds like it is.

> I will add the proper comment here to describe this thing. I'm so
> sorry for misunderstanding your mean last time.

Yes, please add a compressed version of what you said above to the code.

-- 
With Best Regards,
Andy Shevchenko

