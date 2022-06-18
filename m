Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C20C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fXLQPFNqTqxAbyNLVlodYZA8k5YXdayLec811mpCGY=; b=dZ1id5rhdBj2R1zHM43exBmulo
	hOy4wDHQqBqNNKlaw25miK9FVOEuQfP0ZwtYWba6UBNrll1Fin0G+M1Wed90uiCX7oNJiee/ltbjK
	//b3ENpyG27lIwvhvkzBr+OsejhkpH5ZxYYnigex6zThp4k0Zr/EJSHw9/3MAQJrYJgHSBmtzHy1D
	XAJoMrJJPLkhfbei0K6ZBGCYzoDCt8Qh+iwQZngWGXzPrJt7U6noLKIKRWjF8MTdiUmxSE4/V7bMB
	RxLBAv9qW+ZSoz+lOtDXCtJ9oKhfpiSp+dDOLdFV1L4szUbNWm275o9WcJeav3noTWHKRA2YIdDA5
	s6N9cdnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Yx2-00BUXf-Bt; Sat, 18 Jun 2022 13:57:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Ywz-00BUWr-8J; Sat, 18 Jun 2022 13:57:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA6860B1E;
	Sat, 18 Jun 2022 13:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1EE2C3411A;
	Sat, 18 Jun 2022 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655560638;
	bh=lRorEWc2KTi7z7ymOlOmHg76zQDyaFrAFstUtz9SnBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AHFj/HFoFUUH94y50WWJJ41Nc0+xVyu0BnPz6ynMPeCuA7tW1khpFHcZOcygfpS66
	 1PJdLDzuD9XLdoajYWLREwRAil3c82vDUZ1NpmJkmEvfQh8et0/u/ebN3adQ5YS49E
	 8rFcodb3jxfyoQyunzWPPKvsaeSLocaZU+cQic/JV8F9tZOPKEeTIt8kcRe5ZukkUq
	 tC8mkXxl1GHz/gJLiyIVLfWHvitlR6Yvz5/CJvrG8iSMlMnfArAYkQhVYGdY+V8m14
	 j2OCBtwYS9BuyltkfUIfF1QkJE3GHgLcO5pM1rV3UdWaNJotY41oTuDuq5mtMGUnRq
	 zduVJofRh6Ktw==
Date: Sat, 18 Jun 2022 15:06:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Nuno =?UTF-8?B?U8Oh?=  <nuno.sa@analog.com>, linux-imx@nxp.com,
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, Cai Huoqing
 <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,
 Andy Gross <agross@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Christophe Branchereau
 <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Thara
 Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
Message-ID: <20220618150624.1bfc8914@jic23-huawei>
In-Reply-To: <35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-23-nuno.sa@analog.com>
	<20220611161701.46a68837@jic23-huawei>
	<35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_065721_413716_46D6B138 
X-CRM114-Status: GOOD (  37.84  )
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

On Mon, 13 Jun 2022 09:06:49 +0200
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Sat, 2022-06-11 at 16:17 +0100, Jonathan Cameron wrote:
> > On Fri, 10 Jun 2022 10:45:33 +0200
> > Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >  =20
> > > APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all()
> > > were
> > > returning a mix of NULL and error pointers being NULL the way to =20
> >=20
> > pointers with NULL being the way to...
> >  =20
> > > "notify" that we should do a "system" lookup for channels. This
> > > make
> > > it very confusing and prone to errors as commit dbbccf7c20bf
> > > ("iio: inkern: fix return value in
> > > devm_of_iio_channel_get_by_name()")
> > > proves. On top of this, patterns like 'if (channel !=3D NULL) return
> > > channel'
> > > were being used where channel could actually be an error code which
> > > makes the code hard to read.
> > >=20
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > ---
> > > =C2=A0drivers/iio/inkern.c | 24 +++++++++++-------------
> > > =C2=A01 file changed, 11 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> > > index 87fd2a0d44f2..31d9c122199a 100644
> > > --- a/drivers/iio/inkern.c
> > > +++ b/drivers/iio/inkern.c
> > > @@ -214,7 +214,7 @@ static struct iio_channel
> > > *of_iio_channel_get(struct device_node *np, int index)
> > > =C2=A0struct iio_channel *of_iio_channel_get_by_name(struct device_no=
de
> > > *np,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name)
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_channel *chan =
=3D NULL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_channel *chan;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Walk up the tree o=
f devices looking for a matching iio
> > > channel */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (np) {
> > > @@ -231,11 +231,11 @@ struct iio_channel
> > > *of_iio_channel_get_by_name(struct device_node *np,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0chan =3D of_iio_channel_get(np, index);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!IS_ERR(chan) || PTR_ERR(chan) =3D=3D -
> > > EPROBE_DEFER)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bre=
ak; =20
> >=20
> > This original behaviour is 'interesting'. If we get a error like -
> > ENOMEM
> > we should return it rather than carry on.=C2=A0 Do we have enough
> > knowledge
> > of possible errors here to be more explicit on when we keep looking
> > up
> > the tree?=C2=A0 I think we can get -ENOENT from
> > of_parse_phandle_with_args()
> >=20
> > That raises an interesting question on whether -ENODEV is the right
> > response
> > for the previously NULL case or is -ENOENT more consistent with other
> > of_ functions?=C2=A0 No device could be thought of as being the case th=
at
> > needs
> > to defer (in hope it turns up later) whereas no entry means it will
> > never
> > succeed. =20
>=20
> From what I could see, of_parse_phandle_with_args() either returns=C2=A0
> -EINVAL or -ENOENT. We also have the internal of_iio_channel_get()
> which can return -ENOMEM. So I guess we should only continue looking if
> we get -ENOENT?
>=20
> To be clear, do you still prefer to explicitly return -ENODEV in the
> previous NULL cases or should we honor the return code from=20
> of_parse_phandle_with_args() and just return chans (and thus ENOENT)?
You've looked at this more than me, so whilst I think -ENOENT is probably
slightly more consistent I'll go with whatever you conclude is the
best option.  Maybe add a small amount of description on what you chose
and why to the relevant patch descriptions.

Thanks,

Jonathan


>=20
> - Nuno S=C3=A1


