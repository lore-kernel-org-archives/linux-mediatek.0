Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46ABC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wBtopi5nrrnF3/tK6d3mUXKRzW2T+DIHWRi/Z/g55U=; b=Dir7axaNoCK78gZic3EDBFTFAC
	ogrJbPfQg4YSuQXQtUijCWmZAmCogOnc+8ucLqrm2pdxv8aRyGMV1Ybh7MWMpSuKG+ijcCtyCwke1
	dV73SsnIMLIy2KhjjbAU/KssDZUNteYezGOdPcxJ5Jjd62eobVerQS8mpfjxFdmDxkOvLVqyzWewI
	+F9/0QhdUYp5m2BVOa1X5Rf4vxmhSnLYTIBF94Toy0mX2Lnw2itaMD3Jlbly6/Ppfw28rIqXegvmM
	t64SD9MYkMU51X2jXQbN4b2JXN07b7oFoD2R6cCGqQrJws6Hkwxb5+w9d7/yQZRkO6T19iI2t1bWn
	zja1ZnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbcA-00AcIg-3a; Wed, 27 Jul 2022 07:37:54 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbbt-00Ac8k-TZ; Wed, 27 Jul 2022 07:37:39 +0000
Received: by mail-qt1-x831.google.com with SMTP id u12so12128952qtk.0;
        Wed, 27 Jul 2022 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7wBtopi5nrrnF3/tK6d3mUXKRzW2T+DIHWRi/Z/g55U=;
        b=JrXv07SnypKXIiO9c1hDaO1ve2XFoCQh3YJA9N0xzJ8VKdcy+NOWbVByEfE93yA1bT
         Tl79vU21bY1Riyh5vdmQjiXNRM6Y+lisVzjlFGA12N5TkfsJVvBTZVM+DXhLMCRLgtAT
         CWazI0B5gaYgTPfT/LBhBjVu7eM5hrdl/RUhg4FDmsUWR19oAbFy6HoE9edFHPyenD8T
         Qf2WPKI/e5SPnIeUMPrpopEK3VVMRKkcz81I6LE01vsC+va5BFGobzRlWIltgg+x4gCQ
         EHVJv70L2zauSaiZEF5yiD6RME26xNIBHXc93G+wfeZxZyIdgW4ZKl6QFkorqrFDfTKD
         6LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7wBtopi5nrrnF3/tK6d3mUXKRzW2T+DIHWRi/Z/g55U=;
        b=y9G6fX+LvNpFqKWlpEOph+kbCes40R9x2gLDA6xjcDJYDEplZbjcQB40EvoC7t3Apc
         oAIqIAu5QX1HE2hvSa/pgh4GhJj5EfZGP1YubrhhpYYUv+rqVadPfvb/zQe6ZBvaPOw0
         I8ph/cNCSWCCMXmSQO1bpu4mx7uTY9TWUyRPLc83xRIIjY0ojmKYSUIhuPCn/NRLyCXR
         ezyGqcQCmX68ygXBHfrfkv1JazwoHhMqSPp5XiVApRh/oFUEqULEsT7JSGnVBXgSHGr6
         h789/16otsFjW31CSRBOWmTx7LrBmW9m2R4LFg3kqoq+TjW5rqBIRpkahjm9juRnHh2A
         kr4Q==
X-Gm-Message-State: AJIora+6E67otB1vvEzuqGMKUqke+/DC6B7TmpQc/giVI2Hsza9yyQJz
	fyKJSg3dSPRxzToe1lQ3UhpBVsHgPmjO6jDJsLU=
X-Google-Smtp-Source: AGRyM1sXpKQZrYG0IbOgoxNKanSErlzr5LcY9lrHn4FGhRFmisG96yuJDLZQZGtegCOB6F8ydUZqqM5XWqwFIZtxfFQ=
X-Received: by 2002:a05:622a:6098:b0:2f0:f0d2:b5f0 with SMTP id
 hf24-20020a05622a609800b002f0f0d2b5f0mr17361865qtb.583.1658907456035; Wed, 27
 Jul 2022 00:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
 <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com> <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com>
In-Reply-To: <CAHp75Vd4ApTju2LCCHQ1skgOjttwWo5b2NF3u+zbGyVnnFKNhA@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 27 Jul 2022 15:36:59 +0800
Message-ID: <CABtFH5+bQx5ym5jOzCPJWbZ23WtGYYwS7cMRt2g3ipEEqTb3JA@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20220727_003737_996645_1A3DF0F5 
X-CRM114-Status: GOOD (  22.63  )
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

On Tue, Jul 26, 2022 at 8:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

...

> > Just for saving memory space.
> > Because these led_classdevs do not be used at the same time.
> > Or do you think it would be better to rewrite it as follows?
> > -------------------------------------------------------------------------------------
> > struct mt6370_led {
> >        struct led_classdev isink;
> >        struct led_classdev_mc mc;
> >        struct mt6370_priv *priv;
> >        u32 default_state;
> >        u32 index;
> > };
> > -------------------------------------------------------------------------------------
>
> You obviously didn't get what I'm talking about...
> Each union to work properly should have an associated variable that
> holds the information of which field of the union is in use. Do you
> have such a variable? If not, how does your code know which one to
> use? If yes, add a proper comment there.
>

Ummm... from my understanding,
if the colors of these four LEDs are set to 'LED_COLOR_ID_RGB' or
'LED_COLOR_ID_MULTI' in DT,
their 'led->index' will be set to 'MT6370_VIRTUAL_MULTICOLOR' in
'mt6370_leds_probe()'.
If so, these led devices will be set as 'struct led_classdev_mc' and
use related ops functions in 'mt6370_init_led_properties()'.
Instead, they whose 'led->index' is not 'MT6370_VIRTUAL_MULTICOLOR'
will be set as 'struct led_classdev'.
So, maybe the member 'index' of the 'struct mt6370_led' is what you
describe the information of which field of the union is in use?
I will add the proper comment here to describe this thing. I'm so
sorry for misunderstanding your mean last time.
Thanks again for your review.

-- 
Best Regards,
ChiaEn Wu

