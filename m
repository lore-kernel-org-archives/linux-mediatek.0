Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2BCC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J24cDKKqsOduTS9UUyGj2I+dc2JXq9COm3ho1bp/NE=; b=zdsaOwAy6Teb9D6xND4FqWKAH6
	biRQbD7K3zvtvW6de+Z8gxUWlUZDgickh1uO/jUqnbxSOx+0xnOdV7KDiQ+yNRfnMsdqjaX5VAhvX
	1Id2lwgathUVXo6oiNf2LWyq0/eKRCuKS9gv+HmWYGv1qerj595aXOKZLxRzk9cFRhXOvuqNQRYl9
	KIQA0i+Tnw08o+kxkdUJGiDB21faigQJg3Ox8x12CQ0blfpPYHouSWrrd8JrKoGIm2827vftqHMG7
	kN778PUq+XdbZ8F0UMsOUQLQoyuZw5qmCsAi1fMnMkc7eFYguvdsQflj0N4AeQHrpMHak/6IXuHDy
	Hq5LDkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJx60-00FIzr-AX; Fri, 05 Aug 2022 13:10:32 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJx5m-00FIsO-6g; Fri, 05 Aug 2022 13:10:21 +0000
Received: by mail-qk1-x72a.google.com with SMTP id w6so1797950qkf.3;
        Fri, 05 Aug 2022 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=9J24cDKKqsOduTS9UUyGj2I+dc2JXq9COm3ho1bp/NE=;
        b=NZ/lhCyR9M4uoWmE11gXdKIY5QHCgnKHevuKo4TMG1DjXmtxuHL9IGeJwZ4LfPJ5Sx
         An9X10WyEwlH6gobWrRkcQrihAvfFo/NEkJHppMNCjVysFpqBcUQppBPmmWv/gJlRwNJ
         AJ5R5hBz/6Z6zt3zcMCzNBlOWAFcgddiIbDO26176idaVxtdAeLEwOB83fyRhNgFshT0
         PgEvwdsJAJBc7N5GmC3tSOdTGVFK5PY33vJvxUo6aKPI13T8ZPWktLxzYyY8DyD7/CRd
         N6n68KF39/cpPvRO/LCj/Zk8AkuXDm7CeFfWTupOMgC5Oh24O5OoP7ydY1qxP317WUAG
         zV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9J24cDKKqsOduTS9UUyGj2I+dc2JXq9COm3ho1bp/NE=;
        b=FLOBNOd5wEp55vnCK7KF/srk9yuomGO9c0HQqTnmHUujhUDvp++W4LmIfzcq4fiu0n
         qhUSQi+4xwHYuh67x0Xv929QhpJrAhC1MB6ihB3mvkc5e7GRx4GGODX/YzeI/1c8r6/N
         Fghggokt8pO3FNfB5Y5uYF7GSSYc8IhmQoBCLr5JfgqIqCGQsIlgObQsPpfyRGKbzEWQ
         UCN9cbHoBtJvh46tSoZKceHj4vnLimAeqYoROuhCb7ya8B4EkKgTjSp/xtCInybenXHW
         8b3i72f3WutZ8sqOmYFEW6PtDTFxRHWOcB2qMMf5Z5I6A36ZW2VmQaWFZ4s7p4v8UKSE
         XF4g==
X-Gm-Message-State: ACgBeo22RTbyIFlnAcnjptOLgjVhXRXzhD0V3GxtX6qw/2FYFaeXih4E
	wK5nICh0B+GPxvK1PLp3nJf4pYSnTYOhJU3u0O0=
X-Google-Smtp-Source: AA6agR6KCeqnEoqyKUTU9bwzHJxmJAXoC1uA/8jBqjS4KNKKgC3bBRK/UzGUzHpzrq29/PrSFNdU8y5czcT3jzWXnGE=
X-Received: by 2002:a05:620a:254d:b0:6ab:84b8:25eb with SMTP id
 s13-20020a05620a254d00b006ab84b825ebmr5054205qko.383.1659705015729; Fri, 05
 Aug 2022 06:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com> <20220805070610.3516-13-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Aug 2022 15:09:39 +0200
Message-ID: <CAHp75VcdU6AVdksuhsHkzvD6mOBJ6G=yrmuHA9zAXLroXDFAjg@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] leds: flash: mt6370: Add MediaTek MT6370
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
X-CRM114-CacheID: sfid-20220805_061018_269101_CAB681CF 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, Aug 5, 2022 at 9:07 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: Alice Chen <alice_chen@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add a support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.

Same comments as per previous LED related patch.

...

> +       /*
> +        * For the flash to turn on/off, we need to wait HW ramping up/down time
> +        * 5ms/500us to prevent the unexpected problem.
> +        */
> +       if (!priv->fled_strobe_used && curr)
> +               usleep_range(5000, 6000);
> +       else if (priv->fled_strobe_used && !curr)
> +               usleep_range(500, 600);

Now it's much better!

...

> +       /*
> +        * Always configure as min level when off to
> +        * prevent flash current spike

/*
 * You need to check the style
 * of multi-line comments like
 * this one.
 */

> +        */

-- 
With Best Regards,
Andy Shevchenko

