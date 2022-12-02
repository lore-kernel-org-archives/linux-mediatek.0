Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3853BC4321E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL08V1CblNQ344sEitshQJpL3YPFWoVO6Z8OdfPPB0U=; b=oQbkLL/lgOfauqtU0JxlUFkbIU
	j76TfXMUl2+W9NRi45ldn+JA4vIefUN9g2h9ZoJR3+vYCLBemQu6zlgDNYwo+QT0KXRZlI13hKJR6
	wrtrV5cStdOgas/uwUaNWVQhRTz7kBCPQqq13Ahwl3+fYKsYO0o4h6dG5e5KLY0zJw+16XgbnK3UG
	snjwVP9rNF9O1/4FyIJTQ6b/XgKoP1zSuVieTeTQX0OKVcqNCtNkB7gbSakCb9/GGVMGFQFVhFLiF
	iSXth27L/Bso7eBMFkc1T3xWwx54tLqwKLpaE/u4hEZ0Z7R/7y1vzXDqyKh4WSoFoWmz3DayVrOex
	nEAjuWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14pr-00GDhx-12; Fri, 02 Dec 2022 12:08:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14pf-00GDcS-AK; Fri, 02 Dec 2022 12:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DFA062277;
	Fri,  2 Dec 2022 12:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96C7C433C1;
	Fri,  2 Dec 2022 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669982873;
	bh=QL08V1CblNQ344sEitshQJpL3YPFWoVO6Z8OdfPPB0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJrww0dSL0LWtWKJq6omLZUVF6wGmYVGbogyRMVshRt/x+pnUwtssR0yJkJKxqpKm
	 HP+5vkWiQpUpW9x1aawnO7AwhG3XHsEIOYFoHqDdpi+BZX3Pk8wc7wtmiMHu0QQdaY
	 6ORvwdx+l3rFedkeLdV8rPt9Gn9wTOZL0dYiLZ3EMvsRIPt+7USWmML33zxgu28s1E
	 h0pDAZcoJM6XBThoRykOUc61HmEEOyCOvv+svsklTUAtT5dgBzp6hl0HE1m8tuvc1w
	 edRdZDhGCZ83dzoW3/HGWG53G4m4cERrA10RyxtFh+T2iFawEiC65oKz6+pecbQjVG
	 +uwcYuOFnwu7g==
Date: Fri, 2 Dec 2022 12:08:13 +0000
From: Mark Brown <broonie@kernel.org>
To: ChiYuan Huang <u0084500@gmail.com>
Cc: lgirdwood@gmail.com, lee@kernel.org, matthias.bgg@gmail.com,
	yangyingliang@huawei.com, chiaen_wu@richtek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: Re: [PATCH 1/2] regulator: mt6370: Fix potential UAF issue
Message-ID: <Y4nqrcw3LGfj3OZR@sirena.org.uk>
References: <1669797463-24887-1-git-send-email-u0084500@gmail.com>
 <Y4iTVmOA5P/aN2yb@sirena.org.uk>
 <CADiBU3-gr1OrH0_OtuWyAN8WwvZtPghC6zfB3NYuVTq4b+DZBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IykTNXYspChJUhfV"
Content-Disposition: inline
In-Reply-To: <CADiBU3-gr1OrH0_OtuWyAN8WwvZtPghC6zfB3NYuVTq4b+DZBw@mail.gmail.com>
X-Cookie: Ego sum ens omnipotens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_040755_416361_4249BA3A 
X-CRM114-Status: GOOD (  18.96  )
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


--IykTNXYspChJUhfV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 11:35:35AM +0800, ChiYuan Huang wrote:
> Mark Brown <broonie@kernel.org> =E6=96=BC 2022=E5=B9=B412=E6=9C=881=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A7:43=E5=AF=AB=E9=81=93=EF=BC=9A
> > > The original code uses i2c dev as the parent in order to reuse
> > > the 'regulator_of_get_init_data'. But this will cause regulation
> > > constraint devres attached to i2c dev, not the mfd cell platform
> > > device.

> > This is a general issue which will affect a lot of MFDs, we would be
> > better to fix this by changing the API to provide a device to be used
> > for the devres allocations separately to the one used for looking up the
> > DT.

> Not to affect too much, the better way may change the 'regulator_register=
' API.
> Append it as regulator_register(dev, .....
> This could separate device object with devres allocation and DT lookup.

Yes, I think so - a new optional argument.

--IykTNXYspChJUhfV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOJ6qwACgkQJNaLcl1U
h9BboQf/fkr05047bYXQZwnpRvQs/KoEOmkQQY7wZUDoqQSBwDGwjV8wi2Z2sAo3
lq4q5n1FW9Qtbk26Ui68g9Zt7hIUZFUOm8af//67agU/fvV8fKwNa/haBywcp8yw
cwKyW6Ih4LOTSOPJtukyx9Jm0Qu+gZHYh/p4YGq8Lw4C5bUjQDPvr2HeMVhl8oc1
uCphypPS/RV46dFBIM714iq7Hpb3w9ted0qh2+LrGchXYq43SQPeK6auKlu+xVcT
3MhEYJVohvXkIAnvZ5WYu3EUgi5KG6zHmWW6f69wW6gjoo+9zuytnJQBHjgq/zRJ
x1c5vobZCCUD0YkFLG5tlq4ZobYw9Q==
=wnjD
-----END PGP SIGNATURE-----

--IykTNXYspChJUhfV--

