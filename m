Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9022EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQwilQfI/adDo9s97R0fAFu247sWntEmkcOlLUrzmwo=; b=VhuHoVCh9/t+0sVPgY7PszSFPi
	UZV8Gc3AW+7Ou9kTWdK4VRVGlctHA7caskUJ9QRu8NIVIGiE0ZdlAZYEzbRYDgsVvL3yS1gitj8JC
	MQUZZrEJ61Hjz62dGs1l9ftSpKzT3349QKdpB2jqmoMb2mlkbnhdrsJKlo9gBqe/fFfsiNjm0PH5m
	LMqXMvrpLdUipv6uH3hT8hUGYbSZ/ObsoPLtPN7XbxGRImO4kImg32kczkQIVBtYFYjPvblAuEiPg
	BfY2KNFxQmGyYd0b7ivhLIBCsUCD7U/yvr3/DDv6NM3n7n7N9cMl3EjRSGLIMLzdiJzLRBeliCSgh
	vHGSVivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtXZ-001wTC-TR; Mon, 11 Jul 2022 13:33:33 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtXX-001wS2-06; Mon, 11 Jul 2022 13:33:32 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31cf1adbf92so49004297b3.4;
        Mon, 11 Jul 2022 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RQwilQfI/adDo9s97R0fAFu247sWntEmkcOlLUrzmwo=;
        b=e25Ptdx+BdRNZeRkxgFp/iHvgBc6IBcweUa8B2jlTvKLiVqyJQJfMGti/8p+8qB5HQ
         yPoI+6CajM35ns+P98l88f/GR+baEOdC1/8HJLLNDKp93L/MA/2iuLd7Yuwc5ut6YjEv
         JSlVxwxCvNlJCYEVCEE7VspV5kOhs7lhJmVEP0XTIzKiP6p4zljgpeNZld8mjAO17C03
         EJOoClA0+qbZPUmXPrh7GdpLSKi28HSj5rSFJ+Se4yeT/998AA0g1y7YeibrBcqb2Dkd
         FcexyLq+JlU/3YdreGmIDl9+qQr97oEzJ2pTVBs9yN4TeGJ2pvJIXMbVmgiAYE1E43XS
         1XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RQwilQfI/adDo9s97R0fAFu247sWntEmkcOlLUrzmwo=;
        b=jUJrh9avd0z6CO7QVJhKIWq81xp1lDn0E+rLmy75u6f6xCY3lPjOyeP9JUsD3sUxcU
         xQDQ5hTAJ3mktAVEusxeJeMuOij0obPCxpmOxDyoj1rI9QK5k3mTRb909rOjyd8W8yUz
         4gKJsbNxM+jQn+JDeDp/q/RZSZeI/mIBP3eMqrTx/mIYqZwBGBWd1ed+G1qA8ReQhfvN
         iATaYajbB+vsEXvnYAfEbfQNy3HVSsgYoYqBDPeuYKwy7y7oTvdAs8nCcTbuX6SiqDH4
         FUnZxjdpaqATs3V6uza1/UYaLEtZnc6Cwe2v+X6wo5wuPUHvIoPuk5rV9mmWWXyW9n8U
         ipjg==
X-Gm-Message-State: AJIora+G377VUIFO3vUGWBqvmFOl1AMxWx7X9CzHfxQPJO65eN6Apmz/
	MYfZjMdb6MyxCtvYJYelz6QbjwcovV2LdQHQpO4=
X-Google-Smtp-Source: AGRyM1vwFLTnD43GPFTgMLTlXqUGdlI71lJPoTCRuiV/S15q+5KKdFYTwkQcKTfOBN8LuvnS9zGKXXrKLTRdthklF8Q=
X-Received: by 2002:a81:8397:0:b0:31c:8a02:3f6d with SMTP id
 t145-20020a818397000000b0031c8a023f6dmr19617833ywf.486.1657546409819; Mon, 11
 Jul 2022 06:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com> <20220711123835.811358-16-nuno.sa@analog.com>
 <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com> <OS0PR01MB592214D4F12E0636DB7B98CD86879@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592214D4F12E0636DB7B98CD86879@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:32:53 +0200
Message-ID: <CAHp75Ve1mAj9u3rVU7qseZ-MYw_PDjAAFA+69XeRv_pvEW-ZrQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] iio: inkern: fix coding style warnings
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-iio <linux-iio@vger.kernel.org>, 
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Andy Gross <agross@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Benson Leung <bleung@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Benjamin Fair <benjaminfair@google.com>, 
	Nancy Yuen <yuenn@google.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jishnu Prakash <quic_jprakash@quicinc.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fabio Estevam <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Shawn Guo <shawnguo@kernel.org>, Haibo Chen <haibo.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Patrick Venture <venture@google.com>, 
	Amit Kucheria <amitk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>, 
	Guenter Roeck <groeck@chromium.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_063331_066934_53B23B4A 
X-CRM114-Status: GOOD (  14.53  )
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

On Mon, Jul 11, 2022 at 3:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote=
:
> > Subject: Re: [PATCH v2 15/15] iio: inkern: fix coding style warnings
> > On Mon, Jul 11, 2022 at 2:40 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote=
:

...

> > > -       if (name =3D=3D NULL && channel_name =3D=3D NULL)
> > > +       if (!name && !channel_name)
> > >                 return ERR_PTR(-ENODEV);
> >
> > After this change in place, I think it's better to convert it to
> >
> >   if (!(name || channel_name))
>
> It should be name && channel_name
>
> See below.
>  (! ( 1 || 0)->  (! (1 && 1)

I didn't get what you are implying here. Please, check again what's in
the original code and what's being suggested.

> > which shows intentions clearer.

--=20
With Best Regards,
Andy Shevchenko

