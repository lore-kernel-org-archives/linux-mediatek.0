Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C552C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 09:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w94IJo1kay0f/xc+3V75vT4mCcz7+PjX1XmawfCqo0k=; b=zYnyiV4AO3S9t+poLA1TkkY9r8
	jcP6zXApxoQ+rS3tEt6msOLI/p66CqQG3R/bkzBkwPxbPA47WDrgxainFXLY8kj6UpNIr1z27UmUj
	8mcQtn+ya+Y6nd+VE5uzbW2fOGxuWQaL5d9wMB81e+HL145eBX62kT28gpF/8h2oYs+r0ySdMCA7B
	EYEJgisDChVSWzUqUcsYjNXoAZUp7cadiEYC9O/ugR6lgPk3w6O5OByUnewGwt6RJfJjXZh7QeQlo
	Gmuz4fq86Da0V5ADFrPk7ctRZExGNo7rZPCJNbg5zaLwqU0HfC5W5A78fVbdWHY/vrqo8mfMV3ojl
	xltKbc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfG9Q-00000008efu-2NEG;
	Wed, 28 Feb 2024 09:22:56 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfG9N-00000008eeJ-2ODl;
	Wed, 28 Feb 2024 09:22:54 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a43488745bcso456538066b.3;
        Wed, 28 Feb 2024 01:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709112171; x=1709716971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w94IJo1kay0f/xc+3V75vT4mCcz7+PjX1XmawfCqo0k=;
        b=ImEHy6NYa7Atl7vxqaO1Eezku5Mgo2J6Tk9DBaBvx8liUbN7EP4goOyUjn5pSl6Shi
         yUivrr/tD0ixP3v+zvMahi4QFOyO8VK8J4+se2yDPZJmt3mXSd6r3k1cO2+YaJcdm92y
         vo4DTiWLpwzkygY2e4jB1fVdzNS88X52nmfbjTAHZMuE0fxmr2cQ/7gsTpuWo+w8LHoj
         eiTfIik1tuHLOOEfsqQsXPj/8yigASpPMSqtzKQyLXvIlWxPdXT40jBPx0lQBHzjfF7A
         rcvvthDVQcuq0+e83J8j+LzMvNphNc8ZnQkyUzt+n5DAXEuBLtQuqcOH0Ycxp3IYZlsr
         EFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709112171; x=1709716971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w94IJo1kay0f/xc+3V75vT4mCcz7+PjX1XmawfCqo0k=;
        b=ZPbltDOznADV5z5NEFQax+inEEk929b0jy+h1ZnwUh9a7tSX8/p46KIQUhTlbdQlMR
         cPTRJom17TTPdtZbfHKkJz3Q32vmM/V52fwLwY4aXk6M51AaI3doCiSgsxuA06Mtphwt
         9NUQTM80FmyAFMLjxW1+bTUgVOej4jvfH6t8YKkJg/9ehfW596Esl1yOjyNB44A3C+io
         XCjNAp2EnyVfdX4daWWddBH+Xk2IJg00BNVCMHxrL574xxcLTa4TeoWR6zzNlUp+NVwm
         Bhr6zZ7O2gFEqIAzqCKNETyQmKT6APh3UvE9l2tf03nKwR2beGuT4tgFe7a7CbXfuC0R
         DR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWut+kWse6Nvqz0vZfI3pKmYjMV2HDuOA8R7qgsop1rErQHa7EHg4b20yA4wfcF78eic+8IoLJNv0OwN+j/sfJoKU7I8p8op5KTyPw5dAxWjxHuIdygj2JVtn9dlnrRvjymmcR+/EAMaYEQJ9PPY7XNp0ripkWHptA=
X-Gm-Message-State: AOJu0YxuWGiLEGlSd96TX14kNINxJkhXpQXVdrKvarKWNT5I2231qGaq
	FOAhbDC8AQZSFMWogajx+Mm+iduZdu0wZuxmwTXQwtePw5eoesJE3ZC1KrqMlgHX7pG17Hpn/Z3
	9nYQhNYOfQ61IhQCEBv4IJ4n1W+4=
X-Google-Smtp-Source: AGHT+IHJjODq1VsNvfrzm9ytWJM7dmnIy0B+0j31P5FxvcVxR8iMf8r56oiXY2gOUy0fbeosoKE9yzk8Daa4z6NCrTM=
X-Received: by 2002:a17:906:3c05:b0:a3f:db30:8999 with SMTP id
 h5-20020a1709063c0500b00a3fdb308999mr9409719ejg.4.1709112170579; Wed, 28 Feb
 2024 01:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20240227013221.21512-1-zhi.mao@mediatek.com> <20240227013221.21512-3-zhi.mao@mediatek.com>
 <CAHp75VciCJuoOwC8ozanWYqSCM=vWpiaqymJ2-gQfrSt5Ts6fQ@mail.gmail.com> <b4889fad324ec88eb3a22f51b0aa512cc93bd2cb.camel@mediatek.com>
In-Reply-To: <b4889fad324ec88eb3a22f51b0aa512cc93bd2cb.camel@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Feb 2024 11:22:13 +0200
Message-ID: <CAHp75Vd=X9e4rOJabF4AbzGRZAF4BiNJa-C4ivOoQb7kAMy3vQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: i2c: Add GC08A3 image sensor driver
To: =?UTF-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"yunkec@chromium.org" <yunkec@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>, 
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>, 
	=?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>, 
	"hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?= <Yaya.Chang@mediatek.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, 
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"10572168@qq.com" <10572168@qq.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_012253_632754_E31B3292 
X-CRM114-Status: GOOD (  23.19  )
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

On Wed, Feb 28, 2024 at 5:19=E2=80=AFAM Zhi Mao (=E6=AF=9B=E6=99=BA) <zhi.m=
ao@mediatek.com> wrote:
> On Tue, 2024-02-27 at 14:46 +0200, Andy Shevchenko wrote:
> >  On Tue, Feb 27, 2024 at 3:33=E2=80=AFAM Zhi Mao <zhi.mao@mediatek.com>
> > wrote:

...

> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/units.h>
> >
> > This is a semi-random list of inclusions. Please, follow the IWYU
> > (Include What You Use) principle. *At least* this list misses the
> > following:  array_size.h, bits.h, container_of.h, device.h, err.h,
> > i2c.h, math64.h, module.h, mod_devicetable.h, property.h, types.h.

> After checking these header files, we find:
> 1."container_of.h" is included by "media-entity.h", while "media-
> entity.h" is inculded by "v4l2-subdev.h"
> 2."device.h" is included by v4l2-dev.h, while "v4l2-dev.h" is inculded
> by "v4l2-subdev.h"
> 3."types.h" is inclded by "v4l2-cci.h"
> 4.remaining header files which mentioned above are also similar, they
> by some other header files
> I think we just need include those necessary header files(such as
> "v4l2-subdev.h"/"v4l2-cci.h"...) in sensor driver.

That's bad. You should read again what the IWYU principle means.

> If we add these header files which mentioned above, I am afraid it will
> cause "repeated inclusion header file" issue.

How would it be possible? Are some headers broken?

> As this driver code can be compiled pass, so there is not miss any
> header files.

There are _a lot_ of missing headers. Your compilation works by luck.

> Another, I also reviewed some other sensor driver code(such as
> gc0a08/gc2145 and imx/ov), they are all the same.

They are also problematic. So what?

> Can we keep this coding style and follow with most of those
> image sensor driver?

Why? We do NOT want to continue developers to avoid decreasing their
technical debts.

...

> > > +static const struct dev_pm_ops gc08a3_pm_ops =3D {
> > > +       RUNTIME_PM_OPS(gc08a3_power_off, gc08a3_power_on, NULL)
> > > +};
> >
> > There is a DEFINE_* PM macro, use it.
> >
> static DEFINE_SIMPLE_DEV_PM_OPS(gc08a3_pm_ops,
> gc08a3_power_off,
> gc08a3_power_on);
> Do you mean, we shoule use this Macro?

It depends on what type of sleep you want to provide. There are
different types of DEFINE_*() macros in the PM headers.

--=20
With Best Regards,
Andy Shevchenko

