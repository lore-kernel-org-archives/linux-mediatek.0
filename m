Return-Path: <SRS0=1jDH=DY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757F8C43457
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 21:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA6C207BB
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 21:17:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TusNTEW9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA6C207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bdge4qyPFkl/Udo3KM7C6AKqD329ma21FUasZxsjXR0=; b=TusNTEW9sRkMigkbeiAVTtYah
	jibuXHwvcu5uOciMmTsHXXmTo7zY4HjEjGI/UQ0SGUaFS2pmVjI/2L5mn7jDAPfR4+PTc2/FE35vP
	+Mk2aL8VvaHemboyeD7Mdrw/8E96K6xjzAf0Bqv1g9AKT2KiW6mSlQlhhWNsVykW5yxinoI1HMF0S
	42M3WWMzH1St6Nvu7XtHxojUbhUbaCgXu2I2mVy2oZA8AHzcSCv/cHwSkHLVS5mMrrfQ8wX8wowez
	A+rpzSFdMvI9r0KpwVu/GAehlkk5gZ4lJTJFBwOpiHbBbMoaWbU4IogTh0ei5i8fclI80Xz2pMI70
	e08jqN7Bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTtZO-0003JX-Ax; Sat, 17 Oct 2020 21:16:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTtZJ-0003IR-3B
 for linux-mediatek@lists.infradead.org; Sat, 17 Oct 2020 21:16:50 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kTtZ5-0006Fj-TO; Sat, 17 Oct 2020 23:16:35 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kTtZ4-0004pP-RR; Sat, 17 Oct 2020 23:16:34 +0200
Date: Sat, 17 Oct 2020 23:16:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add MT8167 SoC binding
Message-ID: <20201017211632.ufgcsmjhbdmcj7hr@pengutronix.de>
References: <20201016185015.3371433-1-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20201016185015.3371433-1-fparent@baylibre.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_171649_203857_48943C99 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5732793085922637773=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5732793085922637773==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dkesq5stxul6y32h"
Content-Disposition: inline


--dkesq5stxul6y32h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020 at 08:50:15PM +0200, Fabien Parent wrote:
> Add binding for MT8167 SoC. The IP is compatible with MT8173.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt b/Doc=
umentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> index 0521957c253f..902b271891ae 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> @@ -4,6 +4,7 @@ Required properties:
>   - compatible: should be "mediatek,<name>-disp-pwm":
>     - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
>     - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
> +   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt=
8167 SoC.
>     - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
>   - reg: physical base address and length of the controller's registers.
>   - #pwm-cells: must be 2. See pwm.yaml in this directory for a descripti=
on of

LGTM:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dkesq5stxul6y32h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+LXy0ACgkQwfwUeK3K
7AkGVQf/W23j54YXyBoJHOo0UT7KjtVUZs7RlAf41JjeatSLPQ2AFfeInknaMEkX
rGoUteV8Dj36mb5SWUJhGN4tmBUGX7e5u/XRhkHRjuJeA41MThhw16ubjIPBxXks
GiB0mtz69sFQp5T9w7Nyz4iI6qCEvP2GOuNisELgRJXAECob6gX33RYFhvJZK1Gg
v/hR0xjoblqnJ15jKKoUiuw75Qbtj7Bj9ei+6ypNRTu/zYRSSUsrXaYX6gcYr0Ar
ZAPLhiaOKv9utkDGnrvcV97qHRQxkoSBOLljtx3EikgkRkIC4uoT3T7oQuaV9fvG
kE00SKEPLcxAeOj8mGGn6mSkloQxGQ==
=DF3E
-----END PGP SIGNATURE-----

--dkesq5stxul6y32h--


--===============5732793085922637773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5732793085922637773==--

