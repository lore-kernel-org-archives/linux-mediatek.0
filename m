Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770A4C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 17:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C3F921835
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 17:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c4iF6nKB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C3F921835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3VMZ+2VKRWKaaaBsS/Tb2yVJnPwpnO8RaY03S4bqVME=; b=c4iF6nKBjRJjm9KEl/97bGngM
	x9apnM2OCzXf45npuPNtVU/EplxVhsnKVAAVRC4Acvyrg8bOt5vNuowC3B23qZhAK7Lr8/WtuHYyR
	K1o4d51DnyjpNFKLqf8+XFqySQ1nLUClVPECyihzjGJItk/EDIl5ozIJCdRVmCAqv/jXy9KlGUEki
	vs9seqPNbQ93DFRX+3PQNJ1ZO34zDbcrPnE2NfJs2We0S0iB0bPjFg4uOcpur08U0CS8YwDAkMzWQ
	5H0qFPRZOTH56WO9X8Pk6FWcZVONM6awnA5KYwOAWHUqUI36wIQ0xgTyIEDeVssuTGtbk7KBorhUW
	RF4n4WqxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itaT3-0005Wm-TV; Mon, 20 Jan 2020 17:04:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itaSp-0005Mv-0g; Mon, 20 Jan 2020 17:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC74E31B;
 Mon, 20 Jan 2020 09:03:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D6C3F68E;
 Mon, 20 Jan 2020 09:03:45 -0800 (PST)
Date: Mon, 20 Jan 2020 17:03:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
Message-ID: <20200120170343.GE6852@sirena.org.uk>
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-5-drinkcat@chromium.org>
 <7e82cac2-efbf-806b-8c2e-04dbd0482b50@arm.com>
MIME-Version: 1.0
In-Reply-To: <7e82cac2-efbf-806b-8c2e-04dbd0482b50@arm.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_090347_104003_52896DC3 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1644550480221300234=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1644550480221300234==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Content-Disposition: inline


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 02:43:10PM +0000, Steven Price wrote:

> From discussions offline, I think I've come round to the view that
> having a "soft PDC" in device tree isn't the right solution. Device tree
> should be describing the hardware and that isn't actually a hardware
> component.

You can use an implementation like that separately to it being in the
device tree, it is perfectly possible to instantiate devices that have
no representation at all in device tree based on other things that are
there like board or SoC information, or as subdevices of things that are
there.

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l3W8ACgkQJNaLcl1U
h9DW1Qf+O1rhi1Qf46h1FjTMYWukB9iEFgJeJZ9xZby51p6qFhhoaf/vJWQgPgqC
PY+Tcxt1Dsk+84dKcLHXZVzsyFLanGZHI9TA2a0j5E1viknxKbaHP84RFmHU4y3s
lJQbgllRUQwkDF2ixZWfipql08kA3v/54BnAN8RsmJMrFN6mpSojTwQlT7390aaA
o2cjkfI/9GOUZ+mGsWzOmr/REEcE/+/aiFXvXnNFyRUzWHoHaEP3eIRegFGjp4E1
kV3GIOpFTkavPF8xb5LRChqYobnVhIizFJiFnlV9h9g/jG7OG1SUifQEtbSsOBT7
fvMX0psaSlV+9wp2Ei3MLvjGH1vemA==
=zekS
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--


--===============1644550480221300234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1644550480221300234==--

