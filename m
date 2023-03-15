Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D39C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Hkb0Z/tYYZSdI2YGR7CKQ+EDo9PzMXn0G/3i+Y5MwM=; b=12i3LMjuFu6kUWWuoNKKWjnzLJ
	w7b90sT3I4f5cWOhDMj0Os9BXATs0/oCSD4Q/bf/fR2Uz1BqyH5c6kxz1w3x9k33Nr81BisbByNea
	fFG94mvr1QJT7gqPweMXPvNJa64+hYowrPvK7iI/DnxXvWibTx3qGgICm9MPTNYh0mmN1nwgbLgC9
	m+ItQKi0lVfpSqX03q5QBhEDJrJQjBORwIekJFuu/XPvwVAx4fNk9q9uZlq6kOvT0aGwvBJeoHNod
	m23qU2fPpmgXxuou/1BbTaaupv0wG+7TIJZ/i0/Tmhl8kcG5TIhTqaoXgeQwpGZxaxrQGQmtXmW1K
	qg+qprsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTXW-00Dygd-0x;
	Wed, 15 Mar 2023 15:59:46 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTXT-00Dyfa-00
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 15:59:45 +0000
Received: by mail-yb1-xb29.google.com with SMTP id e194so19895157ybf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678895980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Hkb0Z/tYYZSdI2YGR7CKQ+EDo9PzMXn0G/3i+Y5MwM=;
        b=HAvxY2y0K98/w3C339mOOAQzkXNU7suKDrE+oReOnAWfju0KoSCgolXdK+X4r8CHgN
         afroLwSaC3Wk3W9YQ9WmLcLtBWLq8ohidkk5GyWA1ua9r58tBWi716eqikZ6WWjMnjX6
         3HpK5Y2MjFvO5Aecw1aUn4xEjsk4IEZARbMPHMmUNRYnyEhc0dERnPIcwEuIIkioSz7v
         qKI+pEHFV4AV5vKJV1pVlmlnx2C71iwjsEtqfre5+RK9YuC6r4JpoqlgV4jx+mwjv5MN
         YZZwlGAnv7UcksfYDh5vmrh1x+tyvVOnmpRCxVj0cqWkzGXgUIafjbjn2mn/k7pBylNJ
         wBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678895980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hkb0Z/tYYZSdI2YGR7CKQ+EDo9PzMXn0G/3i+Y5MwM=;
        b=ZfT0wPJKeALkrYWW5qeM2+IiO33Kg9fNyT4WgzFZG16nfp9BlP/TTGnfG1P+h1pg1j
         NHWlsdb8Zc9SWw2FbcDBHmywMGYOfpBdSJPOeUnAtEyODbkYTcSiuEzspE00K+ZBQuXl
         oz++/yHFIhN7H5ooTLRDLquzH5Q1VSjgDee+bRKQi4IB80JFO2DYAPuTeTIFtNdyUmKB
         KmUrQxY8TQtCXpzvOh+q31s5jRySEFSmBcaLBqWzyOtK2teCOh5L2G87Zi4BDqXRC1WN
         hKMyASRIK3Pu0KZ/HvMu+2y35RlaRNDmpkkeYexy+Oi6p3iNXOFjD+L/8x8NxAT5zzO+
         nw5w==
X-Gm-Message-State: AO0yUKUuMuy1wWTiBqtzAaAdHgtXarhUqrCdF+k6a0xpTo9KysJLRvbQ
	vtIk4o8lydXz9zBHbeeJK9Xsci5rMdoxK1W9RqgK+g==
X-Google-Smtp-Source: AK7set+cRmZtlbO9MMeDKr/hukXl0wpMQ3FA/Xz+syeKJfKfZEuF5mOSKngD+5GIMx1/X8Swm2YFxI5NP785yU6JIh0=
X-Received: by 2002:a5b:386:0:b0:b0a:7108:71e9 with SMTP id
 k6-20020a5b0386000000b00b0a710871e9mr12111573ybp.4.1678895980181; Wed, 15 Mar
 2023 08:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-21-45cbc68e188b@baylibre.com> <4b4d4749-c5ea-3a02-190e-3db703623977@linaro.org>
In-Reply-To: <4b4d4749-c5ea-3a02-190e-3db703623977@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 16:59:29 +0100
Message-ID: <CAFGrd9pQJWYpdruUvbZNcQRZk5viyOAUCDpJcu5anA13E26Unw@mail.gmail.com>
Subject: Re: [PATCH 21/21] panel: startek-kd070fhfid015: add support of this display
To: neil.armstrong@linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Xinlei Lee <xinlei.lee@mediatek.com>, Guillaume La Roque <glaroque@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_085943_037971_C732A823 
X-CRM114-Status: GOOD (  14.44  )
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

Hi Neil,

Le jeu. 9 mars 2023 =C3=A0 15:51, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
> > +
> > +#include <drm/drm_crtc.h>
>
> Is this include needed ?

Seems not, I remove it.

> > +     struct gpio_desc *enable_gpio;
> > +     struct gpio_desc *reset_gpio;
> > +     struct gpio_desc *dcdc_en_gpio;
>
> Isn't this "DCDC" a regulator ???

According to the panel datasheet, this is an input signal needed
passing through TFT connector (PIN30):
"Power IC supply enable, High active"

> > +     /* Interface setting, video mode */
> > +     ret =3D mipi_dsi_generic_write(dsi,
> > +                     (u8[]){DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00},=
 6);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to set display interface setting: %d=
\n",
> > +                     ret);
> > +             return ret;
> > +     }
>
> Use mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0=
x00); instead,
> it's simpler and doesn't need explicit return check.

"mipi_dsi_generic_write_seq" doesn't exist but I will add it below
"mipi_dsi_dcs_write_seq" in drm_mipi_dsi.h
I must keep the return check to jump out of "stk_panel_init" if
something goes wrong, but I can drop the error print.

> > +static int stk_panel_enable(struct drm_panel *panel)
> > +{
> > +     struct stk_panel *stk =3D to_stk_panel(panel);
> > +
> > +     if (stk->enabled)
> > +             return 0;
> > +
> > +     backlight_enable(stk->backlight);
> > +
> > +     stk->enabled =3D true;
> > +
> > +     return 0;
> > +}
>
> Is this really needed ? the backlight core will enable it automatically.

Ok, it's managed by drm_panel.c driver.
Then I can also remove stuff from stk_panel_disable.


Regards,
Alex

