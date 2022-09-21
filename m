Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E02C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcWKSOQfnh3ALysQmzthyFKSaMJvE4eOBrZ5WykYnf0=; b=se8QG6L1P3TmLSSMx+Pgl3RyAQ
	qUILB3TD/08NwfYaN2LEiwiHTk+Gt/pRqzht3CNOyExKcJm9jEfU0/kUcetpRAsLyAIh/2VKcvw2z
	HazEaAYaNP5qeL81w//ebn1mkm4MNZwBA8hH2oWvTj9X6uSwc3A/SuFbhKJuLBn82w3vJyk1rPGb5
	l2ZSiOJkcKL0KxVtIP0Zg+gab3s29aeaxw5W90C0E5xOaKzYedoDh8NrUd7az4ddcS7XvheHl+RCx
	Oxt5PN3bRYfMeUXAz2dFmQpGtBqa8kCrNndgjzIweyThxou+hn8dr+D3BI7ERy02cfIXjzHUf74Nv
	kMjZ5fEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayDM-00BAnR-Mc; Wed, 21 Sep 2022 11:48:28 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayDA-00BAj9-C3; Wed, 21 Sep 2022 11:48:17 +0000
Received: by mail-qt1-x831.google.com with SMTP id h21so3840345qta.3;
        Wed, 21 Sep 2022 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=HcWKSOQfnh3ALysQmzthyFKSaMJvE4eOBrZ5WykYnf0=;
        b=HfVB+cBHeUsQkTV1IF9sAKMKS/kfT/Ev0F60sC685i2kFcutzNrfuaR5hD53IQByBD
         9jivhTdsPvvs9lm5s9kXj+as2t8kAgL1f43MFcqX9USDOu2lzD+2ybZqMBbG4XjQgQ4Y
         jgCd4dOsRnsjo+D/4PaHD504CDzEYM9SJ2KgM046n1ux86DUbQlEjZm/iIajLF0rSeEV
         P//RD6N416qpoC6TwB3WBhbRgASsfx49tC7zYBmYWU1FUcKvYqXMPYCf8BhyzBlmv2s2
         9Zr3PFAQ2AikJFRKDDuta9GMnT5+GY/mdV/Fqdk13QWG5P6njup+PIsHziVHd+GZKtJz
         y93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HcWKSOQfnh3ALysQmzthyFKSaMJvE4eOBrZ5WykYnf0=;
        b=CDMmvQQqOlxrpBGeIKuuqX0Wk8wqopl4SAJhlzpfwcZrpI6LhpK0z0ZCElZYq1dHbS
         AiX2fsvsHfXC+2V96wm+o5rpWGDwkybjxXe+RhPQfbUuiH7FCLa7Kc+ApS/fW4IsJ28N
         pKhJNtxrimnxlEZfT4H6yCDQ+CRBQAurj4Kd1V/CgICt6OOMNjVQEg1WVpTqqEPawBNO
         ckbsCrWwgaZdQqkQDK02aKptIoRAZbOH/oe9g+r6/CuMKEMuAHzFsfGOmkZDRLEcdvJK
         FsB+Qeq+y7oa0jG9E7baVTeqyF5rSYKeJ+hckFxUpdXhEMkSFPtwcrS6UTDM8TgChboA
         XSWw==
X-Gm-Message-State: ACrzQf3JnCCLTdoD5GDOIp7UjOmOutB4V3YVP2oz3UeOme+xxlslFwgb
	XNSOC0kRx7p+ESLZwitzPcEaygDRv0YHpjEufmA=
X-Google-Smtp-Source: AMsMyM6G55bRb+0Lbv2MWoChlYMO/VkxvcVvZF6+qxE/8auesJXC3OqMo6uD5hrChQNEavPXUJ5w0Du+HXIis6UE2X0=
X-Received: by 2002:ac8:5e07:0:b0:35c:e7fd:1e94 with SMTP id
 h7-20020ac85e07000000b0035ce7fd1e94mr12904471qtx.384.1663760894316; Wed, 21
 Sep 2022 04:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034042.9354-2-peterwu.pub@gmail.com> <20220830034042.9354-10-peterwu.pub@gmail.com>
 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com> <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
In-Reply-To: <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Sep 2022 14:47:38 +0300
Message-ID: <CAHp75VeRgRdv54yO51nBwKx8O2pNLvOD2mrqn31zvx4ffSpCHw@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Han Jingoo <jingoohan1@gmail.com>, lee@kernel.org, 
	Daniel Thompson <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Helge Deller <deller@gmx.de>, 
	Mark Brown <broonie@kernel.org>, mazziesaccount@gmail.com, 
	andriy.shevchenko@linux.intel.com, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Alice Chen <alice_chen@richtek.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_044816_428541_00232028 
X-CRM114-Status: GOOD (  13.29  )
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

On Wed, Sep 21, 2022 at 4:48 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wrote:
> > On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> > > +#define MT6370_ITORCH_MIN_uA           25000
> > > +#define MT6370_ITORCH_STEP_uA          12500
> > > +#define MT6370_ITORCH_MAX_uA           400000
> > > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > > +#define MT6370_ISTRB_MIN_uA            50000
> > > +#define MT6370_ISTRB_STEP_uA           12500
> > > +#define MT6370_ISTRB_MAX_uA            1500000
> > > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
> >
> > Use upper letters as below:

For microseconds (and other -seconds) the common practice (I assume
historically) is to use upper letters, indeed. But for current it's
more natural to use small letters for unit multiplier as it's easier
to read and understand.

> > #define MT6370_ITORCH_MIN_UA           25000
> > #define MT6370_ITORCH_STEP_UA          12500
> > #define MT6370_ITORCH_MAX_UA           400000
> > #define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > #define MT6370_ISTRB_MIN_UA            50000
> > #define MT6370_ISTRB_STEP_UA           12500
> > #define MT6370_ISTRB_MAX_UA            1500000
> > #define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
> >
> > > +#define MT6370_STRBTO_MIN_US           64000
> > > +#define MT6370_STRBTO_STEP_US          32000
> > > +#define MT6370_STRBTO_MAX_US           2432000
>
> Hi Jingoo,
>
> This coding style is in accordance with Andy's opinion in this mail:
> https://lore.kernel.org/linux-arm-kernel/CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com/

True.

-- 
With Best Regards,
Andy Shevchenko

