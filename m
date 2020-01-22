Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6942EC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 12:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D3312467A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 12:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VGynyJCL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D3312467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rN/MVHzKo4C23933bSJYSqQ0eQOsR9tUQs84kplkHN4=; b=VGynyJCLBYtcMj1j0IFzrrTtj
	4jAd+06rl6M39QIST4dzl6QL6lmtXdpnaYWekw/1VFC+p/ytw2WNEaENNdqW6KvfzKPJp89Z+rGAE
	Owob5bONAkTZYzByFT478ScNHcHIU4Ws9ScSEaDhtsYAzZIg7pdn+cVT/g3/NmEe7DD7lG2GL1r9K
	dlPVXyb3GJ1sCqgs4SwWo6l8YAdqtjub4s8dMLQsxGumUdG3LkLvPcjP1d43ywL1eJzCXrc4Ivh1u
	gwxArkczR4r/nyc0HeGCrtr4yslku3r2Q7Q48jrVsAZ8+6IlQfdZV93KKfXdT2GROuHciJ3nQZN04
	BcvcUktYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuFD4-0004Z9-KB; Wed, 22 Jan 2020 12:34:14 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuFCu-0004Rr-Ai; Wed, 22 Jan 2020 12:34:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ECCE328;
 Wed, 22 Jan 2020 04:34:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C34943F52E;
 Wed, 22 Jan 2020 04:34:02 -0800 (PST)
Date: Wed, 22 Jan 2020 12:34:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Wen Su <Wen.Su@mediatek.com>
Subject: Re: [RESEND 3/4] regulator: mt6359: Add support for MT6359 regulator
Message-ID: <20200122123401.GD3833@sirena.org.uk>
References: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
 <1579506450-21830-4-git-send-email-Wen.Su@mediatek.com>
 <20200120190427.GO6852@sirena.org.uk>
 <1579659806.6612.12.camel@mtkswgap22>
MIME-Version: 1.0
In-Reply-To: <1579659806.6612.12.camel@mtkswgap22>
X-Cookie: Sorry.  Nice try.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_043404_457931_9A625FD5 
X-CRM114-Status: GOOD (  18.87  )
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
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0285172295471723875=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0285172295471723875==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 10:23:26AM +0800, Wen Su wrote:
> On Mon, 2020-01-20 at 19:04 +0000, Mark Brown wrote:

> > This looks like you should be using regulator_list_voltage_table() and
> > associated functions, probably map_voltage_ascend() or _iterate() and
> > just a simple set_voltage_sel_regmap().

> Thanks for your suggestion.
> Currently it's using regulator_list_voltage_table() and
> regulator_map_voltage_iterate() as below:

> The reason to use mt6359_set_voltage_sel() is to convert selector value
> to hardware register index value:
> 	idx =3D pvol[selector];

The whole idea behind regulator_list_voltage_table() is that it does the
selector to voltage conversion for you, you shouldn't need to do any
additional mapping.

> To avoid using mt6359_set_voltage_sel(), the *_voltages array need to be
> filled with zeros as below:=20
> Current:
> static const u32 vemc_voltages[] =3D {
> 	2900000, 3000000, 3300000,
> };
> static const u32 vemc_idx[] =3D {
> 	10, 11, 13,
> };

> change to:
> static const u32 vxo22_voltages[] =3D {
> 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2900000, 3000000, 0, 3300000,
> };

That's fine, the table is small and it only needs to be iterated in
contexts where we're doing I2C I/O.  If it's really a problem introduce
generic helpers for this rather than open coding.

> > > +	switch (mode) {
> > > +	case REGULATOR_MODE_FAST:
> > > +		if (curr_mode =3D=3D REGULATOR_MODE_IDLE) {
> > > +			WARN_ON(1);
> > > +			dev_notice(&rdev->dev,
> > > +				   "BUCK %s is LP mode, can't FPWM\n",
> > > +				   rdev->desc->name);
> > > +			return -EIO;

> > I'd expect the device to go out of low power mode then into force PWM
> > mode if it has to do that rather than reject the operation.

> The device low power mode may control by hardware pad, so that the
> reason to reject the operation is the device low power mode can not go
> out by software.

If this is being forced by hardware you need to check for that directly
rather than just rejecting it without even trying (but hopefully the
user set their constraints such that this doesn't happen).

> Another scenario is one user set the device to low power mode, we think
> it's not suitable to change device mode to _FAST mode by another user.

It's not your driver's problem to worry about arbitrating between higher
level users, let the framework deal with that (and notice that we have
no code in kernel that actually sets the mode directly at runtime).
That way we will have consistent behaviour between devices rather than
devices trying to enforce their own policies.

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4oQTgACgkQJNaLcl1U
h9D4Ygf+Nziq8bZrmbOIKqexjp2v9TvNwy09gwUlAJs9KJ9MjXFHTprK96JdeRLn
qfl46x/Qb1TgrDRaFus46RApEELBHLOJ8MjMIz0MSlaVeJqyHwn46vTild91pSl3
6vHfkJKRFHx3Ix2wudcdRcvpGn/HHGCydNn8+mLDOR9GDaZCOn2aOq2LVTU01izu
7ulyEaYk3jIE86BfISfoXXGZ8eyHYaSynQia91odZsZD4J6W9IaGXFms9MORVIbm
Ii3wwPwOufroxvff+6HOucaYbNN6UpVbKsvxJ4f0S9U5+T77RgDDdv6Jp6jv/Kjx
jzkOyueUpjLzFBvhEKl52FhmXf74Vg==
=ZzAE
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--


--===============0285172295471723875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0285172295471723875==--

