Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F760C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFNBuksRAUHG8SQKGfIMoqHF0ZeQIQql/Pes//0/1FE=; b=DF3LNSHQbK6w4wz8aUXbBJzN8f
	O2TeJFruIiYhLukKbcwGkm/aFS7VPy+ArzdfVo0HPPsnYEWl7t7TL7HTqlf7DPMBdaduEafLx0tls
	S8N1Q7xRqnbG6ns7KpXG8iSkQHkjnFS3YipXkd2El4PHcu6QRlEoGHS4C8QTVROjZPfqKe6pa1CwJ
	noLDI3EdRfE8sRdNvlVVBwPpGoe6tDtKSKQlMfcDxK53tTXTDoyMYwOcddQPdBAOVSKE0y/N0yKkY
	Bo9aKW7PetPu6FkLBAiOW9qUpfv1J0V/YeD9RyoEZbn7WOJVxIqckI9wcBNx/k9U827/YnTaUBdeg
	6DLfQmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJWM-00GoWg-AE; Tue, 26 Jul 2022 12:18:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJWB-00GoFy-Eq; Tue, 26 Jul 2022 12:18:32 +0000
Received: by mail-ed1-x535.google.com with SMTP id x91so17518115ede.1;
        Tue, 26 Jul 2022 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFNBuksRAUHG8SQKGfIMoqHF0ZeQIQql/Pes//0/1FE=;
        b=p25ViQRAGjIzoqbyw32XacT85JsM0ATOnc/aJ7f4OQUM+aio/Y993fmTKcDeocHCd9
         Ip6z+1IDcK1emNmby8GCnHh8nTAZJOit+jilIBMN3MN8BHArbq5Y7jX0AdPoo5PJRGP+
         qBAvo4C0uBT25Q/8kqgwUa9AThgrYs6OVHHMaOpyea8oHPpg79QNvmgM1Uz/oDBPwnAl
         AufVZdMZG9DZBf3rhJ84O3aYj5LM94YzLZW6y/dSBdJHdO6Du6+eIPe3NFTEc8T9fHX5
         OTqmGMZhfJaXrcwzJtTP8MEOT5b0nUwAv/+Z19lTei3pSAbzl6AU10dk5npcBMsgvF/p
         dQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFNBuksRAUHG8SQKGfIMoqHF0ZeQIQql/Pes//0/1FE=;
        b=5MPxEeJJm99A1LXi8YaruaYMgrgG0tI1mgXnt0ZAr2Dk/+UDbgY4N9fl9j8c/Rag/I
         1vNYC+Os2ELpWU3lyhOVRUQYLqLynY40EiWqnoQaJA5ubQA2Ya+GG8hBZP3C67EYA47P
         6kEO8xTt0jlfHAEqmiLbDCypVzQFXzl6Hx/e4DdZteuzPdaWGs/7UhFm+b5Qy0G3rvrj
         txknyMqPF6nCISVVMf0Hf1m58zI4Bfg0HIlemxYn33u9xVuLKABNRjJxOKE+8n7D9QAQ
         GPTFLmqA+g61SSlOHg2T0VpLw77GgMVB09wXTvazg4qJiV0xM86xhNag0g8qsU+fZpzQ
         SwsA==
X-Gm-Message-State: AJIora+K2xnwi3JuriO7KdmoGEI6xC/0SCjOFMIyIZxPZ8Ca2wJMjK3L
	3AyW7fm5rA197pCsivBFlD4dap/hehCA2SxUVgY=
X-Google-Smtp-Source: AGRyM1uzT38suKCsbCmFfyzBHLwwuulTdOWUnr3cD4+NYEDfZRxNjDpqwVCvJTRb6rCtiz3um/F+ZSKguXrhc6flE20=
X-Received: by 2002:a05:6402:50c9:b0:43c:163a:4d5f with SMTP id
 h9-20020a05640250c900b0043c163a4d5fmr7812854edb.386.1658837901255; Tue, 26
 Jul 2022 05:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com> <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
In-Reply-To: <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jul 2022 14:17:44 +0200
Message-ID: <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220726_051831_505224_B0606A44 
X-CRM114-Status: GOOD (  20.21  )
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

On Tue, Jul 26, 2022 at 1:46 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 4:41 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> > > +struct mt6370_led {
> > > +       union {
> > > +               struct led_classdev isink;
> > > +               struct led_classdev_mc mc;
> > > +       };
> >
> > Where is the field that makes union work?
>
> Just for saving memory space.
> Because these led_classdevs do not be used at the same time.
> Or do you think it would be better to rewrite it as follows?
> -------------------------------------------------------------------------------------
> struct mt6370_led {
>        struct led_classdev isink;
>        struct led_classdev_mc mc;
>        struct mt6370_priv *priv;
>        u32 default_state;
>        u32 index;
> };
> -------------------------------------------------------------------------------------

You obviously didn't get what I'm talking about...
Each union to work properly should have an associated variable that
holds the information of which field of the union is in use. Do you
have such a variable? If not, how does your code know which one to
use? If yes, add a proper comment there.

-- 
With Best Regards,
Andy Shevchenko

