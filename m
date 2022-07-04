Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9554BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 20:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX/+5EHmJzouiASTPWEy2vcXLPBh//GiWKeXcuGIwQ8=; b=duIUI/2BcIAwZSjSZRYOKy08kO
	EoG07Fce84ohT3yltcgGBHNh/6PcO2X3aIJQOuPNJqdPWXnkjVxlziPGQuNXu9e6tqF8qh7aOUVSG
	0UV1Ncu5O8+A6xOqaDyVxC6kZrFw+kotEczFJlYDJziLevvIcIVT0qWDFAr+/gUqLcI8MWc7QgkVh
	n625koXhDmKV0A+hAFviWW/zN7r4neaSOmgtHVaxwehQCziAhF2LLbnqvWbrEsqZ1S/nAsWnBengD
	ivF3rkj6Ev9G8Oys1mFH+rBJWgZWWY6ucsuInm6lcMF7L40w/8jKq6LGQVKSY3EJ+8GyHXsmruPg+
	SukjoL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8T59-00CKVf-Cj; Mon, 04 Jul 2022 20:54:11 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8T4y-00CKQF-9Z; Mon, 04 Jul 2022 20:54:01 +0000
Received: by mail-yb1-xb34.google.com with SMTP id b85so5347470yba.8;
        Mon, 04 Jul 2022 13:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yX/+5EHmJzouiASTPWEy2vcXLPBh//GiWKeXcuGIwQ8=;
        b=B3+vMtHkh7oMCAMnDoWG8DEYz2b0JCtP5ZfXbihV47SV3dWC+3OwqEGsEMwBqAFjz7
         khAxgZHq8sJMmNaICKe6NssutaTTjWLNGJBKORgb6vraCnVB5t+OtelrciWNFx45ctsy
         JvI3604+UpHWwrRhFauDs9e1foPdkNSdzNHqlHWwdWLiIR5uNgh7cOgQIAGgo+d4nbqk
         vWBgis+eV5qV8Zk/AkWLLfaslFlFZF3eEW3XKUxRruxM5WjKyLFbe1tfQJnycOJwtO/v
         olhGLIkEl+ub8ONlqXskW875SxgXQbu+BJdjC1nw7gUrRk69EDJ2IlghqhNSArZzWIXy
         kOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yX/+5EHmJzouiASTPWEy2vcXLPBh//GiWKeXcuGIwQ8=;
        b=NzLpxGpFU90sitMSWzaeUd7a6FUceItYhj2TA2/ubC1j8zfrfp4MDGUKeHlbMPJCVD
         //+GhunvHU/VZVHwhwFIa44aWhUKGS6jlmVu/3G4V+PnMf108xtEa6bvozV7WoZ5b22T
         YHOAQGXKE6Q1Jt8ZYOXK1FqfOGWNX+w8W5kf5Gv0ShZ0kl7pHx+z+RPli2ybWz45nsQG
         eDYZqRjvucrwDJihJDyeHz7JnueyBJtIrvBQ23LzxMK2+U7B20pbS/6JLl/oM32g5g/t
         /nokiHd09rdoib4PJsE9bgdPMNpbs9wyx0YiFFnwQaF7fMjA/4CfqQSRrtRlCf0oLrlH
         IChw==
X-Gm-Message-State: AJIora8FBZo5TpJ0R3eDInmo7mpU0YiJHKe6SUenbTSnO8QjjEYDlwlS
	Ybp7YYBVKK+/lBBQt0SKIetKbuqfKbwIyE7EEPE=
X-Google-Smtp-Source: AGRyM1vdKb73hFj3ExY6oJ2GrDF+CZ7xFkfm6isQFNTZlGTiO++q+Ae1pyvqGIbKKpGLxpNoMkavQ8hfM3hWhEKqjS4=
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id
 i4-20020a05690200c400b0064b4677331bmr33612017ybs.93.1656968039226; Mon, 04
 Jul 2022 13:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-11-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:53:22 +0200
Message-ID: <CAHp75VfFWyvO44XjRCrx=caCLK0EX5gOfF6fnydZeegFBqJrzw@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] power: supply: mt6370: Add Mediatek MT6370
 charger driver
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
X-CRM114-CacheID: sfid-20220704_135400_392751_20232DC0 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, Jul 4, 2022 at 7:42 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> Add Mediatek MT6370 charger driver.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370-charger.ko".

No ".ko" part.

...

> +#define MT6370_MIVR_IBUS_TH_100_MA     100000

mA

...

> +       if (mt6370_chg_fields[fd].range) {
> +               return linear_range_get_value(mt6370_chg_fields[fd].range,
> +                                             reg_val, val);

> +       } else {

Redundant 'else'.

> +               *val = reg_val;
> +               return 0;
> +       }

...

> +               if (fd != F_VMIVR)

Why not positive conditional?

> +                       linear_range_get_selector_within(r, val, &val);
> +               else {
> +                       ret = linear_range_get_selector_high(r, val, &val, &f);
> +                       if (!ret)
> +                               val = r->max_sel;
> +               }

Checkpatch didn't complain about the absence of {} ?

...

> +       irq_num = platform_get_irq_byname(pdev, irq_name);
> +       if (irq_num >= 0) {

  if (irq_num < 0)
    return;

> +               if (en)
> +                       enable_irq(irq_num);
> +               else
> +                       disable_irq_nosync(irq_num);
> +       }

...

> +       /* Check in otg mode or not */

OTG

...

> +static int mt6370_chg_set_online(struct mt6370_priv *priv,
> +                                const union power_supply_propval *val)
> +{
> +       unsigned int pwr_rdy = !!val->intval;

Seems you are using int as boolean, do you need it specifically for
something? Otherwise use boolean here.

> +
> +       mutex_lock(&priv->attach_lock);
> +       if (pwr_rdy == !!priv->attach) {
> +               dev_err(priv->dev, "pwr_rdy is same(%d)\n", pwr_rdy);
> +               mutex_unlock(&priv->attach_lock);
> +               return 0;
> +       }
> +
> +       priv->attach = pwr_rdy;
> +       mutex_unlock(&priv->attach_lock);
> +
> +       if (!queue_work(priv->wq, &priv->bc12_work))
> +               dev_err(priv->dev, "bc12 work has already queued\n");
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko

