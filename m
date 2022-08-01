Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44958C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pCQwRUtQqbmZSwhlAYKv7D+OaWBuV6jzuOG3pLiqnE=; b=dvzZkjQN7a6t3UejNY+xsVcaIl
	BMAo/e6V0oHJuRJj4mgTHdNxhe4ESjGc3PRScm9O42SLq+S8pnZU4eDrtRefKbLAjbhFcz6f56ivX
	rDaDB8Dm8jZIanIWbCRXsKve+rZGN3WLW4z3SzD80iaviqubxMoF1P1Pwg+98th1JKSlbitohsoBO
	PLTB712AgsstZDF7XMLrxoThmRd0VtRuO9NXirZYQuLP2japznR6RJeXNFtWtPhMAz3Bj9al651Iw
	UPrloGawLwRDwc2Vpr5eh89quW9+GoofJ/0deRZptkSnu5Rfh38xC1eO6tJPIDsTRJ1bcuNoympc5
	27mJ4YFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIPEC-0036rt-Mt; Mon, 01 Aug 2022 06:48:37 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIPDr-0036fi-7y; Mon, 01 Aug 2022 06:48:16 +0000
Received: by mail-qk1-x72e.google.com with SMTP id f14so7789089qkm.0;
        Sun, 31 Jul 2022 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pCQwRUtQqbmZSwhlAYKv7D+OaWBuV6jzuOG3pLiqnE=;
        b=ln2eP881w+pJWsnC+kYg6rYGAd3maj9S7mJ+gV/lLUoTHa07yJ7pdTT1iddtkvut7G
         wCE3Vn0TT0sSu2CGZvq/wm0E+8dX8DAzc0wcrTU8f68Bf945HKsgWEqdxw/iLewJID2+
         U3xISuK9fbiy0BRYeJ5aJIV0S+Q+NI5ty1LBv5VOtK4++uo7wdiHC9lGtmGhCbrpNouT
         poWweP7l/AaVWeIy/2bVG85dC0G/EueHZA6lUebLElpHSoCxf4b25lXpFCUPSvI2lhdW
         7jc02DOr4iyObq+BZvCMVIS2hbqCqgw3xx0epY1nfMPIBNYZpFTwGEBUDoh2MKMua6y2
         T4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pCQwRUtQqbmZSwhlAYKv7D+OaWBuV6jzuOG3pLiqnE=;
        b=hYjPIV3CdE5jEZnIaVjxUtjnAPDxUYuR2NosdAIreWdY1biNPgFqhrC9dtFuG8IAYn
         yCw7/1ZTbIptS8WecacnVNEaK/TBq+JVwY9LmNGMEl4E1rk/vIgvlwVVaSXzXlMNt+1z
         9oQYWRKdKOAuyE50DnwsWXgzsdRrxOYxwp2L3ugUkePyLvsdqmuOUEB9ttm3DB9Irzf3
         7qbVwPEuEVSnwZ9PkKSUn+pXjzdAQujx6NtaDcF2Ougsb+H2Pnvhc55JjxpNeajQn9gd
         FlijlQqgi4W6IbkehKFIYwlP6XcicErAKWqVUJFKeJJdSgi8nSQ4d/rw1t3qqz/LTxpP
         9mGg==
X-Gm-Message-State: AJIora86xdc9Y4qi9dqOBT1xoVi/KZrCpWMlFbxXfOfJECYPxfXrRp9o
	Zxe5cyKbdIxycbmCOPhkYPGxMpkgUiy/BjdedFU=
X-Google-Smtp-Source: AGRyM1vi8vD3grhYbZ/WLviZ2IFccZbjNO75ItldTtC+nPOI6OOaG7LKKV2FJNQbFGfWSid26gTwustg4ausWvfIn5M=
X-Received: by 2002:a05:620a:1706:b0:6b8:705a:c61e with SMTP id
 az6-20020a05620a170600b006b8705ac61emr8915998qkb.129.1659336492750; Sun, 31
 Jul 2022 23:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-6-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-6-peterwu.pub@gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 1 Aug 2022 14:47:36 +0800
Message-ID: <CABtFH5L83d5Di6O9TC-L3UX2ma5J3PE47ihfJFfPD5YGJ43NxQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] dt-bindings: backlight: Add MediaTek MT6370 backlight
To: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_234815_316706_57BEFA9F 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, Jul 22, 2022 at 6:24 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

[snip]

> +  compatible:
> +    const: mediatek,mt6370-backlight
> +
> +  default-brightness:
> +    minimum: 0
> +    maximum: 2048
> +
> +  max-brightness:
> +    minimum: 0
> +    maximum: 2048
> +

Hi Rob, Krzysztof,

First, I'm so sorry for our SoB writing wrong, I'll fix it in the next patch.
Because of this mail thread
(https://lore.kernel.org/all/20220728113109.7gf3b36mqjxlhcq3@maple.lan/),
I would like to discuss with you that I may change the following in
this DT document, I am not sure whether you agree or not.

1. Add some descriptions about MT6372, which supports 16384 steps (14
bits) and is different from MT6370/MT6371 (2048 steps, 11 bits)
2. Modify the format of 'compatible' as follows to distinguish between
MT6370/MT6371 or MT6372
------------------------------------------
properties:
  compatible:
    enum:
      - mediatek,mt6370-backlight
      - mediatek,mt6372-backlight
------------------------------------------

3. Remove the 'maximum' value of 'default-brightness' and
'max-brightness', and add "if-else" to determine the "maximum" value
as follows
------------------------------------------
  default-brightness:
    minimum: 0

  max-brightness:
    minimum: 0

...

if:
  properties:
    compatible:
      contains:
        const: mediatek,mt6372-backlight

then:
  properties:
    default-brightness:
      maximum: 16384

    max-brightness:
      maximum: 16384

else:
  properties:
    default-brightness:
      maximum: 2048

    max-brightness:
      maximum: 2048
------------------------------------------

4. Add a new boolean property to allow the user to determine whether
to enable the exponential mode of backlight brightness or not. Like
this,
------------------------------------------
  mediatek,bled-exponential-mode-enable:
    description: |
      Enable the exponential mode of backlight brightness. If this property
      is not enabled, the default is to use linear mode.
    type: boolean
------------------------------------------

I hope these changes I have added will meet your expectations.
And I'm not sure if I should remove 'Reviewed-By' first until it
passes your review.
Thanks.

-- 
Best Regards,
ChiaEn Wu

