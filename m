Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64594D29FB8
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLqlwBIHxlc/QVraFxaZVp3Z+LmsfbO7nLUsDg2kico=; b=JmyJc0Vi750CZEGfw8VElHiE8e
	OzKnNhOoj43JUCgSCHeslUj/DSq54stcPX/bdIEqIGlvGvFJuLzy3WxLNWF3cWEBZfd1opNt9a21L
	QYW0f4rQWhX792zg2LD9YXkI/H7vRuti+Pcd/e7NOp0AErtvG9mr63IjWJ7uGKUuqs3UpG8/U4F2I
	Na1qURk0Kjduf2PoNP0euXDH5S1IWp/4HMDtI0Dywubb2x/BaIDKM8BX7Ipm1k43zPOn5LYsPogGC
	7QpJvD8Ei9xUe9nQEsn2tqZKm+SVpp2K8SjtcPkOLSYxbyGav1QaxkKwJmmRbmBGZDLmrJYWdSeAn
	jWbNURDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bBR-00000002EqD-1dP5;
	Wed, 06 Nov 2024 08:14:33 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8b9h-00000002ERB-0CAg
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Nov 2024 08:12:47 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e3f35268so7775075e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2024 00:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730880762; x=1731485562; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLqlwBIHxlc/QVraFxaZVp3Z+LmsfbO7nLUsDg2kico=;
        b=UIjLAjC5zmL4ij8UBpS5vWjS6qScd1MmpOYLrTLqm3UrMqt6aXc5+EAFl5165zh+RP
         aYNjm+4cU3K2tZ1VnJfSASFv8dYydO47p/BtAE3pProR5Ld4MbW7o+W8vYyBgziz4jj7
         +Zthj1D7NsIzz7MwQQtnXDWqrFq5xburzntXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730880762; x=1731485562;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLqlwBIHxlc/QVraFxaZVp3Z+LmsfbO7nLUsDg2kico=;
        b=ocofjpZwmFq8Twsm4duteli2XxrxzQPGdUjq2ftqmmGgBQK2pUe8fgFl4vkGhiWVN4
         GDzRFzSgMJQa8X07ORX1o+TVY1Wd87e9sytQOiDUcebwQFq2y9Q/XTJaiXNVgRsH1XgI
         OJyt32s/5QFa9BR5nH6YPIDNI8NybeqDLPKlyiuT0dsxK3uQrNNb3QZ929S9qE1FS9jG
         q2+5QnIAMQDDsnTkMsnsf4BtwR8L5S3L72FyN6QeDyEnE3FYuWuzLSs6kINrZxLDBXjI
         CX7lpyLTJhF8zZfjq3tqsQdK15JWeaYktDdXPyMdgnMrS7ULa9OECRtZTDx7CqEaCgTm
         LRdw==
X-Forwarded-Encrypted: i=1; AJvYcCWJhG5Rtdf8PNB5fLrARFnueca8VOCiQ2UoCfPZI1MFz7tmFDHVPEsM71WPj5LQ3mxcSGbKNCWNQo61Qt9N+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBXfGAjZ1Z03e46TB9WVyzKwFChqftyEqQExZ187EVwa+/p8AF
	lqiKZmTVkdIbEyltM5euRhOKk4V/7I6KJPbcBRTTbW+2B5XQiaWNRYJyO/bKtGkEHSLkf0ykj3d
	VI2YgaZNix144mr+UwcK3+8Xi6F+B6RG/LfxE
X-Google-Smtp-Source: AGHT+IFnaWLxRM0mMC+tlxLZKaZ3C13GE82EXMBINEFxJtBK8SRUM88wS0f5O5dEyFh3FYLnqrjYeFV5SGWw53gqPvY=
X-Received: by 2002:a05:6512:6cd:b0:536:52ed:a23f with SMTP id
 2adb3069b0e04-53d65d945a9mr9893295e87.0.1730880762336; Wed, 06 Nov 2024
 00:12:42 -0800 (PST)
MIME-Version: 1.0
References: <20241030072229.1013235-1-wenst@chromium.org> <20241030072229.1013235-6-wenst@chromium.org>
 <ZypER5bqLAlH7VxK@skv.local>
In-Reply-To: <ZypER5bqLAlH7VxK@skv.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 6 Nov 2024 16:12:30 +0800
Message-ID: <CAGXv+5E5izmR0Oe8RK8eGRxV4vk+98yKJDMc5imgSznxPZp01Q@mail.gmail.com>
Subject: Re: [PATCH v10 5/7] i2c: of-prober: Add GPIO support to simple helpers
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_001245_146282_77356581 
X-CRM114-Status: GOOD (  28.30  )
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

On Wed, Nov 6, 2024 at 12:14=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> On 24-10-30 15:22, Chen-Yu Tsai wrote:
> > Add GPIO support to the simple helpers for the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > Regulator supplies were handled in the previous patch.
> >
> > The assumption is that the same class of components to be probed are
> > always connected in the same fashion with the same regulator supply
> > and GPIO. The names may vary due to binding differences, but the
> > physical layout does not change.
> >
> > This supports at most one GPIO pin. The user must specify the GPIO name=
,
> > the polarity, and the amount of time to wait after the GPIO is toggled.
> > Devices with more than one GPIO pin likely require specific power
> > sequencing beyond what generic code can easily support.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
>
> > diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-probe=
r.h
> > index df95aa6ad90e..a232f3cbb252 100644
> > --- a/include/linux/i2c-of-prober.h
> > +++ b/include/linux/i2c-of-prober.h
> > @@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const =
struct i2c_of_probe_cfg *cf
> >   *
> >   * The following helpers are provided:
> >   * * i2c_of_probe_simple_enable()
> > + * * i2c_of_probe_simple_cleanup_early()
> >   * * i2c_of_probe_simple_cleanup()
> >   */
> >
> > @@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, cons=
t struct i2c_of_probe_cfg *cf
> >   * struct i2c_of_probe_simple_opts - Options for simple I2C component =
prober callbacks
> >   * @res_node_compatible: Compatible string of device node to retrieve =
resources from.
> >   * @supply_name: Name of regulator supply.
> > + * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty strin=
g ("") if GPIO
> > + *          line is unnamed.
> >   * @post_power_on_delay_ms: Delay after regulators are powered on. Pas=
sed to msleep().
> > + * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed =
to msleep().
> > + * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set =
to logical high,
> > + *                      to enable the component.
> > + *
> > + * This describes power sequences common for the class of components s=
upported by the
> > + * simple component prober:
> > + * * @gpio_name is configured to the non-active setting according to @=
gpio_assert_to_enable.
> > + * * @supply_name regulator supply is enabled.
> > + * * Wait for @post_power_on_delay_ms to pass.
> > + * * @gpio_name is configured to the active setting according to @gpio=
_assert_to_enable.
> > + * * Wait for @post_gpio_config_delay_ms to pass.
> >   */
> >  struct i2c_of_probe_simple_opts {
> >       const char *res_node_compatible;
> >       const char *supply_name;
> > +     const char *gpio_name;
> >       unsigned int post_power_on_delay_ms;
> > +     unsigned int post_gpio_config_delay_ms;
> > +     bool gpio_assert_to_enable;
>
> This header is missing '#include <linux/types.h>' for bool
> type. Otherwise compilation may fail with following error:
>
> ```
> ./include/linux/i2c-of-prober.h:117:9: error: unknown type name =E2=80=98=
bool=E2=80=99
>   117 |         bool gpio_assert_to_enable;
>       |         ^~~~
> ./include/linux/i2c-of-prober.h:12:1: note: =E2=80=98bool=E2=80=99 is def=
ined in header =E2=80=98<stdbool.h>=E2=80=99; this is probably fixable by a=
dding =E2=80=98#include <stdbool.h>=E2=80=99
>    11 | #include <linux/kconfig.h>
>   +++ |+#include <stdbool.h>
>    12 |
> ```

Thanks for catching this.

I'll send an update.

> >  };
> >
> > +struct gpio_desc;
> >  struct regulator;
> >
> >  struct i2c_of_probe_simple_ctx {
> > @@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
> >       const struct i2c_of_probe_simple_opts *opts;
> >       /* private: internal fields for helpers. */
> >       struct regulator *supply;
> > +     struct gpio_desc *gpiod;
> >  };
> >
> >  int i2c_of_probe_simple_enable(struct device *dev, struct device_node =
*bus_node, void *data);
> > +void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data)=
;
> >  void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
> >
> >  extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
> > --
> > 2.47.0.163.g1226f6d8fa-goog
> >
>
> --
> Best regards,
> Andrey Skvortsov

