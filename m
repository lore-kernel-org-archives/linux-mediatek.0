Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07418C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL1b72wWwttocLxQ4i2N7IFKv69W21HPhWs4hRLf0o0=; b=FAZtasUCJWcx206qy/fHhi88D2
	1JRFWHyo+P+VjEjCvpzskYZz0JbjZ8bZSaNKWS+9CNRYC56wG10l15f1e0VNQjC86dVvexPKF6hW3
	uJBagxsEBJj8ed6v6yhHXdtp7f2fLT68IBvG5oALHew4izJG3pDhtRMHYzSUbe5UXsRNh0O0ZChe6
	8JZyfEgtH1XYUtPr4NEin0J+6TXiFg+YHhejOJKBQLWSDiPssT44/QXK1OiGAxCS7xahN8QgcDkEz
	6MczilfnuSx4CMMVc9zm6hwT3pC3dC/Rjzv6fY8GoRICwoy6sTxON1cpxC/BlaHMlPUK3PHtaq+rB
	lamEDXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJ1b-00GJfk-Hl; Tue, 26 Jul 2022 11:46:55 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJ1K-00GJAH-NU; Tue, 26 Jul 2022 11:46:40 +0000
Received: by mail-qt1-x835.google.com with SMTP id w29so10190999qtv.9;
        Tue, 26 Jul 2022 04:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wL1b72wWwttocLxQ4i2N7IFKv69W21HPhWs4hRLf0o0=;
        b=AZ8qDLn4Znu85xCahXNOnmojv9wcePPk3Lf2KSJODsdYIL/u4rdAI0Lnw8MiXeeTQl
         0fNcl+cJw4vrGMs/9mjAcX99bHsbOpeBwt1ay2R33YRq1VsVjC++YG2fmlp7hix1YwsO
         IKZ3zoTB97u6iKZxmk+c33+dSbGXuJXJDQz+RRlu+LRdNCgrsyBWNRh2nYIBbuWUos51
         BrJUcA7G/8NE1M8r1t7zyLNEvXtcGsNdIwqfkXwOFPRNUwWDTrUivYLlX/lxHIIPKvWG
         uXmZtHYk57ezocXOjrXXXwhnGpuE94ql5T95iceJZSiu4iSTtJVip83p/q4s/P1JT7m/
         PgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wL1b72wWwttocLxQ4i2N7IFKv69W21HPhWs4hRLf0o0=;
        b=LKs8ZWT0PN/KLwSsMQboISsr2lOGzdD0rlEQxkjFl5T37OMTzMwrFBqJXwHigM92ws
         Y+dYnfK8LJ7QvPRzG+DouYWr+82K2I/il7EX+X880rtnabElwM2udgulvLg2Meyb06Jr
         4Nps9CixtOeMlqLtmfOBPccjN7DU99eMTdQluFlrH5Kg8aXjNzjBIX3VvSRX5jfxzHmh
         xtBvdbafyfYIp114h8Dp6ACgGilCOJXcSTs03Q0y2SEIm2ih1/57aAn0W5UErRe5RBWu
         OOoT13khNDnTZ2tULKKt0gxI2m3M5+Fc9aHjiFNptAMANdQI4hqnXgURfsD1PjCX3pwd
         dL0g==
X-Gm-Message-State: AJIora+AqUVFLI5kbvz8id1Th0op6Yd2JcePu3BFnLNWY7mIJKp9ul2B
	yrfdHck7iAJXP2NyPdZk2IzYLFzRaNqkQdNVjkU=
X-Google-Smtp-Source: AGRyM1sOWaWg8F0hJmRbLUJyv570Fqyt5WL0lP9RdfcVPQQLkd4tLFbTSnSOHuBdwqMxVIGbB1G4Kxurui/itRlhhGY=
X-Received: by 2002:ac8:5a8b:0:b0:31f:27b8:2260 with SMTP id
 c11-20020ac85a8b000000b0031f27b82260mr13732022qtc.198.1658835995667; Tue, 26
 Jul 2022 04:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-12-peterwu.pub@gmail.com>
 <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
In-Reply-To: <CAHp75VewxvEDGoPdRBvLSLQOQ6OZzVft1ce3DkF7MK_O1VXZkQ@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Tue, 26 Jul 2022 19:45:59 +0800
Message-ID: <CABtFH5+im7=vyKLUqztYeAX81e7ETFc+9o7y0seg2pxH0PEnUQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220726_044638_798558_B09082AE 
X-CRM114-Status: GOOD (  26.41  )
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

On Mon, Jul 25, 2022 at 4:41 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
...
> > From: ChiYuan Huang <cy_huang@richtek.com>
>
> ^^^^ (Note this and read below)

...

> In conjunction with above what SoB of Alice means?
>
> You really need to take your time and (re-)read
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

Hi Andy,

Thanks for your reply.
We are very sorry for this mistake. We will revise it in the next patch.

>
> ...
>
> > + * Author: Alice Chen <alice_chen@richtek.com>
> > + * Author: ChiYuan Huang <cy_huang@richtek.com>
>
> Would
>  * Authors:
>  *    Name_of_Author 1
>  *    Name_of_Author 2
>
> work for you?

It looks good, thanks! We will apply this in the next patch.

 ...

> > +struct mt6370_led {
> > +       union {
> > +               struct led_classdev isink;
> > +               struct led_classdev_mc mc;
> > +       };
>
> Where is the field that makes union work?

Just for saving memory space.
Because these led_classdevs do not be used at the same time.
Or do you think it would be better to rewrite it as follows?
-------------------------------------------------------------------------------------
struct mt6370_led {
       struct led_classdev isink;
       struct led_classdev_mc mc;
       struct mt6370_priv *priv;
       u32 default_state;
       u32 index;
};
-------------------------------------------------------------------------------------

...

> > +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> > +                                    struct led_pattern *pattern, u32 len,
> > +                                    u8 *pattern_val, u32 val_len)
> > +{
> > +       enum mt6370_led_ranges sel_range;
> > +       struct led_pattern *curr;
> > +       unsigned int sel;
> > +       u8 val[P_MAX_PATTERNS / 2] = {};
> > +       int i;
> > +
> > +       if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Pattern list
> > +        * tr1: byte 0, b'[7: 4]
> > +        * tr2: byte 0, b'[3: 0]
> > +        * tf1: byte 1, b'[7: 4]
> > +        * tf2: byte 1, b'[3: 0]
> > +        * ton: byte 2, b'[7: 4]
> > +        * toff: byte 2, b'[3: 0]
> > +        */
> > +       for (i = 0; i < P_MAX_PATTERNS; i++) {
> > +               curr = pattern + i;
> > +
> > +               sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
> > +
> > +               linear_range_get_selector_within(priv->ranges + sel_range,
> > +                                                curr->delta_t, &sel);
> > +
> > +               val[i / 2] |= sel << (4 * ((i + 1) % 2));
> > +       }
> > +
> > +       memcpy(pattern_val, val, 3);
>
> Isn't it something like put_unaligned_be24()/put_unaligned_le24()?

OK, we will try to apply this method in the next patch.
Thank you so much for reviewing our patches so many times and
providing so many great suggestions!

-- 
Best Regards,
ChiaEn Wu

