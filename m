Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E9AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov+EeSBehnZGgP10oz15Ph0AQVk7Z1fAlO/Gr24nPL4=; b=JfGetBpGFu6/xyy7fNrWXoyRJN
	z2emvSpfElEARtgtC2wFdr4dd95Kx4VORnsIhKuqOM6qU/K6mV0h9wQIewkkTAHN8e12UFzhYH2Ca
	QhUg9dL/EWhcFrdOABB9nNIMr8khYs9DAwj1xtenJUSaScINA1hQJmNB6NExAYW5PfLxuqpVct5Re
	DBqX6Llc/VkB0G2E+9SK743fc3vDjkJ/FNXbc01Ng/6RJ2euQLqMkkLS+CxKuYn8ScD0O7aHgzDB9
	xSF/NTn5pwsMYEQlBesei281CbW5H9tvhagIqIsbXA3VGC1Y4WCaDF+q8D75Ol4mstTO8vD7+MtSy
	kc50vPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXfk-00Fb6S-SN; Thu, 02 Feb 2023 11:22:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXfh-00Fb5F-Hv
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 11:22:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pNXfg-0001dt-3R; Thu, 02 Feb 2023 12:22:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pNXfd-0029u4-Cq; Thu, 02 Feb 2023 12:22:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pNXfd-000GOV-Tw; Thu, 02 Feb 2023 12:22:25 +0100
Date: Thu, 2 Feb 2023 12:22:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] dt-bindings: pwm: mediatek: add mediatek,mt7986
 compatible
Message-ID: <20230202112225.r4wg2nqbcocbnmec@pengutronix.de>
References: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
 <20230202095733.kxh6jd5hbshhif44@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mysq7dcqb7ly26qb"
Content-Disposition: inline
In-Reply-To: <20230202095733.kxh6jd5hbshhif44@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_032229_610232_D2ECC546 
X-CRM114-Status: GOOD (  24.24  )
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


--mysq7dcqb7ly26qb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 10:57:34AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Wed, Feb 01, 2023 at 07:25:57PM +0000, Daniel Golle wrote:
> > Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
> > support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
> > been added. Also add the compatible string to dt-bindings now that
> > they have been converted to YAML.
> >=20
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > This patch has previously been submitted, but we decided to deferr it u=
ntil
> > after the conversion to YAML which has now been done via commit
> > 3e98855ca0cf ("dt-bindings: pwm: mediatek: Convert pwm-mediatek to DT s=
chema")
> > See
> > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/Y39PjU1B=
qBB8tZ98@makrotopia.org/
>=20
> This commit is currently in next via the pwm tree. The easy options are
> to take this commit via pwm, too, or wait till after tne next merge
> window. I'm fine with the former.
>=20
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

However it wasn't sent to the linux-pwm list, so it doesn't appear in
the pwm patchwork :-\

I bounced it, but not sure that will make it appear there.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mysq7dcqb7ly26qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPbnO4ACgkQwfwUeK3K
7AlNKwgAlGG0ra8OtKfzugGoSYMltYXKZt32d4XG1V7KBQMvvLHn7Yhs3zZXI/A0
FFlpdyo0qBzFmmddOmKvh5yaA6oVNANGuRpBebxRvcJ9XQuGH84EHMvAaDRlZeN3
5hSHfqAvXtrs8XqXRrvC2nKrJMrEwLnj5u4kX3EUWbibwHMsGfZw9NXERkQHU7Tv
CoeQKCWJElp9H3JC7QxGpu7YUo9VNuJ6tIpjf/kpxkzOSFAAkXJJ2PPWsQG+zgfv
HnUbrzkwd5S1kQqNW8EIdH5tmE566AnZUPzTkHXBSRCpZWnDdnFsIlVYkn5a6xNE
TwIihOEGnlogkwybgio3Ugh0A5coNw==
=btCZ
-----END PGP SIGNATURE-----

--mysq7dcqb7ly26qb--

