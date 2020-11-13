Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4FEC61DD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 16:12:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D131208D5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 16:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tkl1ERN2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLSMDgSs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D131208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FDgYKdz1nEfuLpy67id6EyvoxfUNkf7VD0P4OO9NM08=; b=Tkl1ERN2ImmcUd3o/6yjTfMsU
	5HaN3W4oigPta2X55P5ACwUtQiC+HT3WWbIKAgrq3s0LW3k/+/8XnCgmn7885JDR6TpAIlHFoUzTv
	4Jtzrh0MMVXAegRibZrrGJET+zM+0ryA4i0LVgFleduntN0FsJajZhSGOR2MKHceV5QgbTHb6WNvV
	lRyFlONYzWzQuycsng5SHuERPMZWzr0zmblgorFU5EflHdaPWDNAjGl54KY4foi+9LH9nURT1/+Kl
	bC9wM8s+ACLtLsfDsQ1AH9DOAa+0W6RMTItU7/dUFc780gsCrHVU7IVJA6XVRuFx7yKfouoD/Uzxy
	KMjlALm9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdbgF-0002bp-SA; Fri, 13 Nov 2020 16:12:07 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdbgA-0002Zz-UB; Fri, 13 Nov 2020 16:12:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id j7so10502034wrp.3;
 Fri, 13 Nov 2020 08:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3FLVqg7Zj+etllIuTUwpk3wN8gzR1GG1JAXGgCW62YM=;
 b=KLSMDgSs24tLWq2oBa9lxL4UOPCQfi8IzwqLz9wCCdATjc/+7YqTriWIaPJq6vKQy3
 Ue+p/6X97goyDINuu41tnxndnBzZ9WoudzODChhyRcLXDtk/VukX5fbVPHNHa1Bsn9me
 ooKZLy9b47OkiiMRf6s4ZUuPL+Y+OfbN6HqZJC+LQ/lVMtoLjX+h+XbGE4N9QNpTisbd
 Xjik04MsHH7rpUbDKkaHF2boQ5k8rmJV0pjzhSk7Ql3IqxtHwW5gHzaMU6+5qrOBCmIu
 UEe1VJQ874Q7/HiejGSEP5rfjaWQRx2SXqq0ELlj9ONZizAnAU7ho3rNqYW0oPwSZf8K
 8mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3FLVqg7Zj+etllIuTUwpk3wN8gzR1GG1JAXGgCW62YM=;
 b=I7uWduFfTtahNNXRwZvJ2a5WBlJUjYaFZsnPhpyXQpfMsuZIqOVigPJpdJbgmg7VOq
 sVcIvDupb3xpvpxmew7zLe2msRyA0+vQ/2q+6qoqmg36ro398aGe/GSJcexb3Z4TXUDJ
 wwp+tWIFeiALZvCp/N+ZZ10S96IIprF1K4tz/y9RwiOjGuuqJ9C4IN+xeKZ9wvmsy79g
 TVo22A6Py/1vzJZ+fTK1BEonFk+yxMSrYssahDTAq+hRG3ikKgKL4xQReGuGjh3aaBQ7
 P6rUZZKv+6MjjhVYyaAATXWjSmu3d2q++gSmyZlATu0QxWdhZ+btgiRC+XJF+3H+xp30
 bNug==
X-Gm-Message-State: AOAM53195Ankmpml1RU/jYxK/+V97AcRLyY5D05V4hErqDmu+9XNFHkS
 oSsuutlQDccbCtTDhj0Jd9s=
X-Google-Smtp-Source: ABdhPJzwUfRGIpbGH13q8UhwZV3215Ve37PGtZ30CipsukJkmAmiutpAQfbiGlD7j+D+EQ9xKao9tw==
X-Received: by 2002:adf:e350:: with SMTP id n16mr4550061wrj.419.1605283916855; 
 Fri, 13 Nov 2020 08:11:56 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t7sm11297890wrx.42.2020.11.13.08.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 08:11:55 -0800 (PST)
Date: Fri, 13 Nov 2020 17:11:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: About devm_platform_ioremap_resource [Was: Re: [PATCH 01/32]
 pwm: sun4i: convert to devm_platform_ioremap_resource]
Message-ID: <20201113161153.GB1408970@ulmo>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
 <20201112190649.GA908613@ulmo>
 <20201112211429.kfyqzkmmchjo6pll@pengutronix.de>
 <20201113070343.lhcsbyvi5baxn3lq@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20201113070343.lhcsbyvi5baxn3lq@pengutronix.de>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_111203_040906_D18FA9DB 
X-CRM114-Status: GOOD (  27.62  )
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
 Yangtao Li <tiny.windzz@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, festevam@gmail.com, f.fainelli@gmail.com,
 shc_work@mail.ru, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 khilman@baylibre.com, wens@csie.org, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 slemieux.tyco@gmail.com, linux-pwm@vger.kernel.org, rjui@broadcom.com,
 s.hauer@pengutronix.de, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nicolas.ferre@microchip.com,
 palmer@dabbelt.com, kernel@pengutronix.de, shawnguo@kernel.org,
 claudiu.beznea@microchip.com, nsaenzjulienne@suse.de
Content-Type: multipart/mixed; boundary="===============3725888770284369878=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3725888770284369878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2020 at 08:03:43AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> [Added lkml and the people involved in commit 7945f929f1a7
> ("drivers: provide devm_platform_ioremap_resource()") to Cc:. For the
> new readers: This is about patches making use of
> devm_platform_ioremap_resource() instead of open coding it. Full context
> at https://lore.kernel.org/r/20201112190649.GA908613@ulmo]
>=20
> On Thu, Nov 12, 2020 at 10:14:29PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Thu, Nov 12, 2020 at 08:06:49PM +0100, Thierry Reding wrote:
> > > I also think that it's overly narrow is scope, so you can't actually
> > > "blindly" use this helper and I've seen quite a few cases where this =
was
> > > unknowingly used for cases where it shouldn't have been used and then
> > > broke things (because some drivers must not do the request_mem_region=
()
> > > for example).
> >=20
> > You have a link to such an accident?
>=20
> I got a hint in private here: https://lore.kernel.org/r/1555670144-24220-=
1-git-send-email-aisheng.dong@nxp.com
>=20
> devm_platform_ioremap_resource() is platform_get_resource() +
> devm_ioremap_resource() and here it was used to replace
> platform_get_resource() + devm_ioremap().
>=20
> IMHO the unlucky thing in this situation is that devm_ioremap_resource()
> and devm_ioremap() are different by more than just how they get the area
> to remap. (i.e. devm_ioremap_resource() also does
> devm_request_mem_region().)
>=20
> So the problem is not the added wrapper, but unclear semantics in the
> functions it uses.

The semantics aren't unclear. It's just that the symbol name doesn't
spell out every detail that the function implements, which, frankly, no
function name ever does, at least not for anything beyond simple
instructional examples. That's what we have documentation for and why
people should read the documentation before they use a function and make
(potentially wrong) assumption about what it does.

>                    In my eyes devm_ioremap() and
> devm_platform_ioremap_resource() should better be named
> devm_request_ioremap() and devm_platform_request_ioremap_resource()
> respectively. Is it worth to rename these for clearity?

I think function names are always a compromise between giving you the
gist of what the implementation does and being short enough so it
doesn't become difficult to read or use.

One of the reasons why I dislike the addition of helpers for every
common special case (like devm_platform_ioremap_resource()) is because
it doesn't (always) actually make things easier for developers and/or
maintainers. Replacing three lines of code with one is a minor
improvement, even though there may be many callsites and therefore in
the sum this being a fairly sizeable reduction. The flip side is that
now we've got an extra symbol with an unwieldy name that people need
to become familiar with, and then, like the link above shows, it doesn't
work in all cases, so you either need to fall back to the open-coded
version or you keep adding helpers until you've covered all cases. And
then we end up with a bunch of helpers that you actually have to go and
read the documentation for in order to find out which one exactly fits
your use-case.

Without the helpers it's pretty simple to write, even if a little
repetitive:

  1) get the resource you want to map
  2) request the resource
  3) map the resource

2) & 3) are very commonly done together, so it makes sense to have a
generic helper for them. If you look at the implementation, the
devm_ioremap_request() implementation does quite a bit of things in
addition to just requesting and remapping, and that's the reason why
that helper makes sense.

For me personally, devm_platform_ioremap_resource() is just not adding
enough value to justify its existence. And then we get all these other
variants that operate on the resource name (_byname) and those which
remap write-combined (_wc). But don't we also need a _byname_wc()
variant for the combination? Where does it stop?

Thierry

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+usEcACgkQ3SOs138+
s6Fx2A//aBWRQVzPwSHDhbF/lNl90e5vvJJvXbrcYeiJEuYYaiFkgBrnXzYQgULo
LI8hLEtAl9F5Ghps7wMBsngqqm8+gaPBOPhYDUkS6VxdK78mByEjyyz136HJkjKr
Hw2q7063Urljk3V25DAwrGzqhv8ngWNY1fIGmB3Khjvm8TnsTWgEh3fkCao2qjpS
hGTaRPAmBcA/riB67DykA1Zgce/KkEA5oe/II7sokZ35jVgZLcMtw2xACMxCJ/rJ
WKX98AL5jAI6wVtgWwbetccy+YWHvrj2Xns1T5mzkas2HUnCYeWFeiL6VJBEYnQL
DnNylpoUbUV6h/DDiIeQ+yW4j4bzYrtanTzXPJ+VNHopW5sePwR/jL8yH+rQVHRT
pGLB0EPfy3aqi7BXzhJwJY4s8HvC1uMRiNk5V3Zk2mJPsRaFud3gkCGWGtgX46Ma
QknbKULKt+bYrXDXvcm4qRb4Kvt223Pdqlxp9eppHAdZFWnD3EUymSpNN8Rej0gY
6ulcjvxwBvYwWUZp8IN7gnq4fbpy8uT3GxkitmvIgznwRmk3bse/2V8FfhSob/XC
Yb+KLXKpP5s09mSindpzh+c4iw+Duy5PBzPTbtu56RTAbfNWJmKNmq54fNTswD/j
vHFSImUb4jcngBJzaTZGVtV1PA2tagKtkkIp82uLtCIfvvjrPbQ=
=E6ps
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--


--===============3725888770284369878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3725888770284369878==--

