Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D742DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 21:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjZ3yzk/koQQf8zjxBLs4QwpOzuOIkcuZx3e6uOiaGo=; b=S/di7OKaAbl0wwF5x2k3CVJDt5
	Fe5NMBntlRCOIarfYldbvXt6q7CRw0NDM72081XDa+uCuUtio1gPOyqqG2IEjr/fIe6lRqGZK5LpG
	lVz/W4Jh1SLILHCTIVX1xFuSyESxLhtkLaxrf3i1EsGyRh8JIl6Jr2EPikW8Ts0aptvBWVCafAySY
	4aOO85A4ZFnmWaGxMPTy7Jov+7l2FJvfX1vnKVBvj3/33KJL36pQBL91hOpoEkycI7ICjocxLyEIL
	yhroiE/PWj5mRaFQXfmim87br8hPrrMgVCQ9qkv2rSMyn+BcMRMyobxXjE0Adps6Nemp3qu5v/4K3
	k8zdjICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8TGl-00CO8U-I0; Mon, 04 Jul 2022 21:06:11 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8TGa-00CO2m-Va; Mon, 04 Jul 2022 21:06:02 +0000
Received: by mail-yb1-xb29.google.com with SMTP id l11so18592959ybu.13;
        Mon, 04 Jul 2022 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VjZ3yzk/koQQf8zjxBLs4QwpOzuOIkcuZx3e6uOiaGo=;
        b=XAO9XvLkJnavV0BlpGD+ClNY1uK6ZfLyjbo4n/ZLW8wmrgbwYg5bneBkPszuL0qItE
         XJI/Um1JbtICgrAWB2CbGTIQL3XiiI2CrvIzS3z6cX+0fWMEmTP/m05hoU/XeDh0JO+1
         eeHvwD6DxA036OjtJ1Awdqd8jOkI2onMTEJcqz2T5m6m+nRgsY0HzmkAIs+HuG9M0gvY
         OFUCInVfTCYeAF0Lc4c62oICHpgKN8SFXHnHvcx1YtkZYz9O+ZylSp/45sY17OaSjN0m
         IlghfWm5NOnrrvHQ0++R9QZOLHNJ+fo0gumeOMXqd+yZ0GZJC1bXUW/tMLgcUZq+m6/s
         0PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjZ3yzk/koQQf8zjxBLs4QwpOzuOIkcuZx3e6uOiaGo=;
        b=HqiPSt/FEV0qLx0MfVjs1qka3Lg1RWc6ffhUQlk63sL/YqrNCkL2N05rU6IG2pq8Bz
         I3e2+4JPMmmpBu8qVmNYi/lC6kyIJgF7+Njqpb2N0zNPSYVwu9APcs76/c3nyTJlQexe
         HaPqNy/JKkrxYjUubiHeI78xruLN0rnNUiz2rHkCZdfD2oTDrmN4pjBj16V8GBnltmyc
         hbcH4y9fJ+VI0TsJ8DjPXho4MwpaUBlk5bl95Z8nx3HOGIAzfPnvCi9llM/k+T7Co5jt
         KH6T4sg0Y6D9Hv7srxjwntHD6cx3NX8ktyw45W0twwNI+Lz6CkxkmcaYn41A3B3sEWjW
         xUSg==
X-Gm-Message-State: AJIora/gIdPpUpEOdJIjjhw/x2YdMHlUt9k/Z1thxOjr2En2rR8W8Y65
	jkxFzdTLlDaSa/oW+dLzeGhLnFoeoJmbJaxGJb4=
X-Google-Smtp-Source: AGRyM1sv4WckZUH06N23fcQXnL/x2rHJiYiT8ToR3cUqaWbGObXlg//Fkee64+CFjVKfldQI9mTw3vJ9ryFFyL1X6HM=
X-Received: by 2002:a5b:68a:0:b0:66e:472a:83f4 with SMTP id
 j10-20020a5b068a000000b0066e472a83f4mr8717309ybq.570.1656968759476; Mon, 04
 Jul 2022 14:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-13-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 23:05:22 +0200
Message-ID: <CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
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
X-CRM114-CacheID: sfid-20220704_140601_086672_24507F88 
X-CRM114-Status: GOOD (  22.46  )
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

On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> Add Mediatek MT6370 flashlight support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "leds-mt6370-flash.ko".

No ".ko" part.

...

> +#define MT6370_ITORCH_MINUA            25000
> +#define MT6370_ITORCH_STEPUA           12500
> +#define MT6370_ITORCH_MAXUA            400000
> +#define MT6370_ITORCH_DOUBLE_MAXUA     800000
> +#define MT6370_ISTRB_MINUA             50000
> +#define MT6370_ISTRB_STEPUA            12500
> +#define MT6370_ISTRB_MAXUA             1500000
> +#define MT6370_ISTRB_DOUBLE_MAXUA      3000000
> +#define MT6370_STRBTO_MINUS            64000
> +#define MT6370_STRBTO_STEPUS           32000
> +#define MT6370_STRBTO_MAXUS            2432000

Make units suffix visible, i.e. _US, _uA, etc.

...

> +       if (curr)
> +               val |= MT6370_TORCHEN_MASK;
> +
> +

One blank line is enough.

...

> +       /*
> +        * Due to the current spike when turning on flash,
> +        * let brightness to be kept by framework.

brightness be
the framework

> +        * This empty function is used to
> +        * prevent led_classdev_flash register ops check failure.
> +        */

...

> +       } else {
> +               ret = regmap_update_bits(priv->regmap,
> +                                        MT6370_REG_FLEDISTRB(led->led_no),
> +                                        MT6370_ISTROBE_MASK, val);

> +               if (ret)
> +                       return ret;

Dup of the below.

> +       }
> +       return ret;

...

> +       /*
> +        * If the flash need to be on,
> +        * config the flash current ramping up to the setting value
> +        * Else, always recover back to the minimum one

Missed periods.

> +        */

...

> +       /*
> +        * For the flash turn on/off, HW ramping up/down time is 5ms/500us
> +        * respectively.
> +        */
> +       if (!prev && curr)
> +               usleep_range(5000, 6000);
> +       else if (prev && !curr)
> +               udelay(500);

Comment doesn't explain why this is suddenly a busy loop operation?


> +static int mt6370_led_register(struct device *parent, struct mt6370_led *led,
> +                               struct led_init_data *init_data)
> +{
> +       struct v4l2_flash_config v4l2_config = {0};
> +       int ret;
> +
> +       ret = devm_led_classdev_flash_register_ext(parent, &led->flash,
> +                                                  init_data);
> +       if (ret) {
> +               dev_err(parent, "Couldn't register flash %d\n", led->led_no);
> +               return ret;
> +       }
> +
> +       mt6370_init_v4l2_flash_config(led, &v4l2_config);
> +       led->v4l2_flash = v4l2_flash_init(parent, init_data->fwnode,
> +                                         &led->flash, &v4l2_flash_ops,
> +                                         &v4l2_config);
> +       if (IS_ERR(led->v4l2_flash)) {
> +               dev_err(parent, "Failed to register %d v4l2 sd\n", led->led_no);
> +               return PTR_ERR(led->v4l2_flash);
> +       }
> +
> +       return 0;
> +}

...

> +       } else
> +               val = clamp_align(val, MT6370_STRBTO_MINUS, MT6370_STRBTO_MAXUS,
> +                                 MT6370_STRBTO_STEPUS);

Missed {}

> +
> +

One blank line is enough.

-- 
With Best Regards,
Andy Shevchenko

