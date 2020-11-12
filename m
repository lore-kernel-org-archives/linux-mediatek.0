Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831B6C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 21:15:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06624216C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 21:15:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfDUabAs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06624216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9IfgK7ToXchare0Oc9z983oQhpQso1gK3Ft6nqiBF34=; b=yfDUabAsH6FQruHWaoaUk7m6c
	cRInRpqLpCESIRhLwZfr1pOsIpZWEVXnpIbo4HbfN50xGWN29b8xVzgC+haDdj7EW3dm1s2FHY1Bj
	1shE0iS+A9b3lAXiWOk/nVTUr7G7HpySYcGdLl3KbYo1fYBXo4AeXFPJq8ovnaMjykqSrfJnpkAkK
	vDShlUoHRCm/75eU7Cz0w+mPORCmRVAmWB/XVbw1omMQWvisQIa/fnAZt56NGJ9ilWvz8pMOE9Sti
	ty6JwpmcEhmYKH1hQp30K/yArYfPnSlvpWo2IzFKWhIGuRrWXys2wISwPRGdFGCYVoAAvTXDey2+A
	MdkA3XztQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdJvk-0002Q6-E4; Thu, 12 Nov 2020 21:14:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdJvh-0002OZ-FU
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 21:14:54 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kdJvP-0004eQ-Ip; Thu, 12 Nov 2020 22:14:35 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kdJvL-0004uN-GY; Thu, 12 Nov 2020 22:14:31 +0100
Date: Thu, 12 Nov 2020 22:14:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/32] pwm: sun4i: convert to
 devm_platform_ioremap_resource
Message-ID: <20201112211429.kfyqzkmmchjo6pll@pengutronix.de>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
 <20201112190649.GA908613@ulmo>
MIME-Version: 1.0
In-Reply-To: <20201112190649.GA908613@ulmo>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_161453_586832_17068CA9 
X-CRM114-Status: GOOD (  14.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, heiko@sntech.de,
 Yangtao Li <tiny.windzz@gmail.com>, nicolas.ferre@microchip.com,
 matthias.bgg@gmail.com, linux-riscv@lists.infradead.org, festevam@gmail.com,
 f.fainelli@gmail.com, shc_work@mail.ru, khilman@baylibre.com,
 ludovic.desroches@microchip.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 slemieux.tyco@gmail.com, linux-pwm@vger.kernel.org, rjui@broadcom.com,
 s.hauer@pengutronix.de, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, kernel@pengutronix.de,
 shawnguo@kernel.org, claudiu.beznea@microchip.com, nsaenzjulienne@suse.de
Content-Type: multipart/mixed; boundary="===============2054526370242650970=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2054526370242650970==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbr6hc6mbthldmnv"
Content-Disposition: inline


--tbr6hc6mbthldmnv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Thu, Nov 12, 2020 at 08:06:49PM +0100, Thierry Reding wrote:
> I also think that it's overly narrow is scope, so you can't actually
> "blindly" use this helper and I've seen quite a few cases where this was
> unknowingly used for cases where it shouldn't have been used and then
> broke things (because some drivers must not do the request_mem_region()
> for example).

You have a link to such an accident?

> And then there are cases where the driver needs the
> resource for some other purpose, so you can't use the helper either, or
> at least it looses all of its advantages in those cases.

There is devm_platform_get_and_ioremap_resource() for (some of) these
cases.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tbr6hc6mbthldmnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+tpbMACgkQwfwUeK3K
7AnGUAf/eqdMaCevia5PicSHdbjGo8N+UPIL+x67rEHWKlaFM+cxULidS7KA+9eu
dk+gFEctD+RPOjCMe700AYmJcUetXl9GIqNaMYKUWUp+1EvVbI5dgVQ6E/kRUNMv
Mrq+Uyd9AEy4c70glsVl0r9PyGArKQ2UT56Io53YmLVuXT2OMPTgReoKaLcC5MqQ
oUiK/scmn+9xMoC6xqRakYvrrErly3+08kSF/GpyazLhJAxXOBFAftn/oPEJu4Xu
3oQXCoQQam+Yv2QAKTMuafSASZ6ff+5RFDq0WS7MZhPFyXojHSdb7hIJmEgwz0s+
koJKn1yBUrNr12RvadGhKUr9eh3dPA==
=Jz14
-----END PGP SIGNATURE-----

--tbr6hc6mbthldmnv--


--===============2054526370242650970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2054526370242650970==--

