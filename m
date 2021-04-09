Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531D4C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 21:52:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC4A61007
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 21:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC4A61007
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lDJa9zr1M53Ak1lzStW/2/NM2RAwI1MMwAslgvkhqQY=; b=IfVb6IBZj9zSZJ5CithOBwyvS
	UASCXQYL6XeexQs7Ue1NssXEzgsO8+3Pl3G7YTsm60F4Aa+XAUj9ev9p3NcsdntLCSuUjOyPdyH4k
	pGE//ehR2f4mSQzWsmWobaD3EHlQ9GKKP6gO6RgYD4Oxy4SQnWXsaeW+KuGmlMTPpvmzahWH+/Ab7
	uzw9q4tol/UxFCJSMUaOMW8Zb1OE5bOw6QCNT0SWoSm2VY9qlw3OGFw7jFZCtxvN3ZVPVyjVncHo7
	Hrk6w6mx0S26QvlbEONrp4tnf5GBPvbJjnTSr1ql4kmiobYtaoSQaNmVohPZvPnSI7vzBJrXBUJcu
	05fuOh/8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUz3A-001ZzL-NY; Fri, 09 Apr 2021 21:52:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUz34-001Zyh-7i
 for linux-mediatek@desiato.infradead.org; Fri, 09 Apr 2021 21:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Aq3piXlfW0Q0mmViZUgSnPmW2EqjN5dlAlrlHw1Usnw=; b=Qazg/rFOyc2xdjsHEFZKHklWY5
 hpsEPZ+qZZM1unl8iMbbilFSg9O9+ANHxzTkFXildtHE287kFY1rAVDHdD0XHc2TLsDSOfUBinJwG
 YmLFEaV8yi3gHnbWzWbYiBEbCzYOGixdZn+1q96qi6NwpV10Wizok10Mf+kwwg0HIdTi7/BqdKgCO
 22wcYYw91KoawbLl66mjGoI7yz2odMabzMK6YlqUeL6biF/t+S06o+FW7Ivs/PlQSnFVb8hBgsL/9
 86aHZQzCUeDNO3WlmffuvO2UhmXN2Wz9wawiWKncSeRDimJd76Ys112be2o/93j13IScbmbit7a9u
 Vj3jM88Q==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUz30-004ooq-FW
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 21:52:16 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lUz2v-0004d4-Kq; Fri, 09 Apr 2021 23:52:09 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lUz2u-00032A-1f; Fri, 09 Apr 2021 23:52:08 +0200
Date: Fri, 9 Apr 2021 23:52:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3,PATCH 3/3] pwm: mtk_disp: implement .get_state()
Message-ID: <20210409215207.uuyc42mddq4jify5@pengutronix.de>
References: <1617703062-4251-1-git-send-email-rex-bc.chen@mediatek.com>
 <1617703062-4251-4-git-send-email-rex-bc.chen@mediatek.com>
 <20210406102756.4kncasxe4um3q6wi@pengutronix.de>
 <YHBHizYI7oyULZx9@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YHBHizYI7oyULZx9@orome.fritz.box>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_145214_543372_6DCBA070 
X-CRM114-Status: GOOD (  27.86  )
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
Content-Type: multipart/mixed; boundary="===============0267124317507633951=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0267124317507633951==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4syjqtkokaojouyy"
Content-Disposition: inline


--4syjqtkokaojouyy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 02:24:43PM +0200, Thierry Reding wrote:
> On Tue, Apr 06, 2021 at 12:27:56PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, Apr 06, 2021 at 05:57:42PM +0800, Rex-BC Chen wrote:
> > > implement get_state function for pwm-mtk-disp
> > >=20
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> >=20
> > Ideally you S-o-b line is the last one to show the order in which this
> > patch went from one person to another.
> >=20
> > > ---
> > >  drivers/pwm/pwm-mtk-disp.c | 46 ++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 46 insertions(+)
> > >=20
> > > diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> > > index 502228adf718..166e0a8ca703 100644
> > > --- a/drivers/pwm/pwm-mtk-disp.c
> > > +++ b/drivers/pwm/pwm-mtk-disp.c
> > > @@ -179,8 +179,54 @@ static int mtk_disp_pwm_apply(struct pwm_chip *c=
hip, struct pwm_device *pwm,
> > >  	return mtk_disp_pwm_enable(chip, state);
> > >  }
> > > =20
> > > +static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
> > > +				   struct pwm_device *pwm,
> > > +				   struct pwm_state *state)
> > > +{
> > > +	struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
> > > +	u32 clk_div, period, high_width, con0, con1;
> > > +	u64 rate;
> > > +	int err;
> > > +
> > > +	err =3D clk_prepare_enable(mdp->clk_main);
> > > +	if (err < 0) {
> > > +		dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n", err);
> > > +		return;
> > > +	}
> > > +	err =3D clk_prepare_enable(mdp->clk_mm);
> > > +	if (err < 0) {
> > > +		dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n", err);
> > > +		clk_disable_unprepare(mdp->clk_main);
> >=20
> > As before: %pe please
>=20
> According to the documentation %pe only works on pointers for which
> IS_ERR() is true, so I'm not sure it can be used with plain integer
> error codes.

It cannot.

> Looks like there's a bunch of drivers that will do %pe and then use
> ERR_PTR(err) to make this work, but to be honest, that seems like
> jumping through hoops.

When I suggested to implement %dE to print error codes this was shot
down by the printk guys who's position is that %pe has to be good enough
for everybody. And yes, you'd need to pass ERR_PTR(err) then.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4syjqtkokaojouyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBwzIUACgkQwfwUeK3K
7AnyxggAigDNiQqZ8bPoBuYlWlAd+v2Wmp/BYm14Mz2GqZMFbn+qKWFm2KnZFRmD
ifcWkjMCgmIv6nbf++kbBndEiYkmWBN/9b5F3MGmbuZSXzL+9XzW0UCRaf14kcei
oGoMmbU/mR3mwKo1p10KmP17aIgYgCu57MLcMGdFgryR0VVLAi0Lp+zICVtqisfs
HxkN1k81u5Vqhn7jnfNUfIFr+b/wWYykqD1QLsPNlNv74lDgmgF1ixPEkH321OMm
bAxbX9wdsr5n0fLs6/cVHnq8WdKHzqwWrMch02ysWWZ8gdpqGx4zULu1lbewSBN9
Cve9wbJwhlGWV1I2BIOvZN/4vzoY8A==
=YjFc
-----END PGP SIGNATURE-----

--4syjqtkokaojouyy--


--===============0267124317507633951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0267124317507633951==--

