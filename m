Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14138C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WRM/jegNDF7MJkfKHHwllsaLEoDBdN6Clej3P/Y4lI=; b=er+0mmIGAudKp6xNC6yyA6G8dM
	U26gNtrWVsPGZuAVIAa3nZb5gm2XTbO1D1BGbfkY/OuhoVeGMCkeI8bp5QRjPy9jDXn3WOn0hYg7L
	g6URtdVyLJX9TMa0yycyPlSsNHBSK935ukbCAvdVkjsaCayYgPrROvmnDd9BSiYGUrrvH+qR+451P
	a9+uBSUR2CehXNJyjDU1+nfzEU6Q7+Tn9vpaq0gEzXumPx+VHkT9p6hLXn8bypy0/3pXww70jz0W0
	LRFwKkPUoerpyN5nLpujexqtCic1jBzSIkLBmzjZxv5AGiNPDIMZMrYRuLe75k120mkpt/XyS3Bre
	KtBk+vFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4clE-000py4-4Z; Fri, 24 Jun 2022 06:25:44 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4clB-000px0-CZ
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 06:25:42 +0000
Received: by mail-yb1-xb30.google.com with SMTP id l11so2831082ybu.13
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jun 2022 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3WRM/jegNDF7MJkfKHHwllsaLEoDBdN6Clej3P/Y4lI=;
        b=D530abNNVW04AkYbW5cBkqRo9d5231SDuKgu4fDW7AaH4jE4mVT5OFUcx+HC+Oclit
         8chp6jbBbNGEk0P3WtO4E/T3LUNKEl4CZYHCB8kDC72f1y33a5Jl8zQdYz/7h8rofzI9
         molKE7wLhlBuYhpF8PG8/LP34IC1bse0Fsc34U93w63mTGtgoR/kSBJU3IAZV6RJIDoX
         vewJ811NMZGN+RX3N8aqUoPR3IjQiufTbvKsQ7KYzVX9rrK377CYprRQ3djZSphTlWnA
         kr90KekhWjo1rMkgj80oOFkzfZZBsx36WCy428UlmluupR0YrGtaLVqkr96HnOa5PXRo
         +Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3WRM/jegNDF7MJkfKHHwllsaLEoDBdN6Clej3P/Y4lI=;
        b=uhJNyUJnv9T1zgD/kUNPkeA0zjQs4E/jR4T54Wlu8AR9dP+eckiyAqKI229tjBtjn3
         3mMhpJzHBwYEWuyQOKTtGmrvzJwNQMkueJOnOiVnjFkqVh7PQ1OvDzKsq8aC+izsF3L+
         IhQw0/2sdu74WCbwocXq9U+5PnpRFXhXY7LrLFsCbldn+c97sRWeM7r6lBiLnVhmXOqu
         Vc7bzwFjKBuLeVjEBizRNu2gvLpEXvgy98hQewyjNDnLnyUltAb8j1Xzo1HAlrCWp9+f
         UGTerAPCGJ4XrRzyllo6PTP7OZs1MhOyGwQImFWOVXSphgvX0VSqX4pTHvzSkCBmzK14
         kSGg==
X-Gm-Message-State: AJIora9qkgprtM+IQX9HVPMoEIQDtihzWosMXhw3VwsAr3P9eAyc9i12
	HTqTfi6v7FjSeq9lzkkJgkVqX3XaVuXDE2uPAttgZQ==
X-Google-Smtp-Source: AGRyM1sT2bkts91ktfEoGKQU7+LXoN5AOODxkIaXfQ8ZFlQvpAh1fKz3hE77tVb6U5oyh1MbZfwUv7onSbM8QOjAaWU=
X-Received: by 2002:a25:1f57:0:b0:669:b6fa:167e with SMTP id
 f84-20020a251f57000000b00669b6fa167emr4052148ybf.295.1656051940195; Thu, 23
 Jun 2022 23:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-13-peterwu.pub@gmail.com>
 <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
In-Reply-To: <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Jun 2022 08:25:29 +0200
Message-ID: <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com, deller@gmx.de, devicetree@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, szunichen@gmail.com, alice_chen@richtek.com, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_232541_453044_A47BAF85 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, Jun 24, 2022 at 8:23 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> Thanks for your patch!
>
> On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 current sink type LED Indicator driver.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> (...)
> >  drivers/leds/Kconfig       |  11 +
> >  drivers/leds/Makefile      |   1 +
> >  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++++++++++++
>
> There is a drivers/leds/flash subdirectory these days, put the driver
> in that directory instead.

Sorry I'm commenting on the wrong patch.

I meant this one. Move that into drivers/leds/flash
 drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++


Yours,
Linus Walleij

