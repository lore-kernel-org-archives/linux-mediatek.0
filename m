Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F2BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BC5613CE
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 12:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0BC5613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYEFL/FhyssKeHaoqNfPGYD7fXG7CqQLubreuEiuLKY=; b=we8GKa4OMeqB7Q4BMYweoe+o1P
	XIbJehLy0zUXPY3+TXg3QB0yIXqaelJ7OrrDLK+5Vy2qW6xG0nDt+RhElM3IW58P9rPLe+IKqtJ0B
	w0e/RYzDLiFQrORJbS4fTanV9uQwdQc2Uyn/EazvaYNArKsgcbxvfQajrCOc4tLgVDIgpjnsS2FkA
	qWFtUs/9hlM3rJB0cCDkiMgBjGBUTWbuDnhVF694c5rNTUmU+HqAAV5aqob25d+QJ+K5inIYlJGcH
	vFcm23JroYKMoKjAU59S0U39xviRLYZ5PJgzhuh0wO6/yWEvs+VgnQ4kIQKpDvE0t1oM/V2p8MA/6
	KQwEa5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVvTN-00EG1M-Bq; Thu, 30 Sep 2021 12:47:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVvT7-00EFwk-0v; Thu, 30 Sep 2021 12:47:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AB2161994;
 Thu, 30 Sep 2021 12:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633006040;
 bh=+LSXxf/C5lNbOrpCeow9qmR0dZ6TMRaZo780DicGs8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Or0BXotS/YChCOV++sPwAJYm3orZRArW42B+0g/1div/rnT3iAN3mslimfFCsHgm3
 jFZd8DcVq9klRreeOvz24ToxVXHrokq0gRJUsGwWowBggNutxn2bTEEzdBoELCroDX
 s4Sf7JteDCalbIhbDYv23sB7H+yrzKbFNUd7rgC3FusfK+q/xx5oJLa4ymw0VcUhyO
 McBm2mutaV2o3IjCw9E9jfQirhLiTIa/7rTODxRS26BcRs6k1I+4sucrpF4VAt/UZg
 ZufK9D6aM/hqD2lqXQ0StKRgm0KuFag0+/qK13reqGQRKSy0wQn547WDX+HkE3b96g
 ZRjIx9tch7NUw==
Date: Thu, 30 Sep 2021 13:46:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: kernel@collabora.com, linux-spi@vger.kernel.org,
 enric.balletbo@collabora.com, dafna3@gmail.com,
 Mason Zhang <Mason.Zhang@mediatek.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Revert "spi: modify set_cs_timing parameter"
Message-ID: <20210930124630.GY4199@sirena.org.uk>
References: <20210930120700.2564-1-dafna.hirschfeld@collabora.com>
 <20210930122513.GX4199@sirena.org.uk>
 <28f8af42-4535-ef9f-e521-712d37e2cb72@collabora.com>
MIME-Version: 1.0
In-Reply-To: <28f8af42-4535-ef9f-e521-712d37e2cb72@collabora.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_054721_135144_8FADC410 
X-CRM114-Status: GOOD (  29.62  )
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
Content-Type: multipart/mixed; boundary="===============1673080858927781949=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1673080858927781949==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sKosZo66cxuwvnFI"
Content-Disposition: inline


--sKosZo66cxuwvnFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 02:36:01PM +0200, Dafna Hirschfeld wrote:
> hi, thanks for the fast feedback
>=20
> On 30.09.21 14:25, Mark Brown wrote:
> > On Thu, Sep 30, 2021 at 02:07:00PM +0200, Dafna Hirschfeld wrote:
> > > This reverts commit 04e6bb0d6bb127bac929fb35edd2dd01613c9520.

> > Which is not what the commit message nor the paste of the full hash
> > claimed :/

> What is the paste of the full hash?

The above.

> Since the second commit is only a warning fixes I thought it is cumbersom=
e to
> send two separate reverting patches. Should I?

No, you should write a proper commit log with (like I said) a normal
subject line - basically, follow the process in submitting-patches.rst.

> > Do we have any analysis as to why?  Do these devices use timing
> > parameters in some way for example, or do the values written out to the
> > device change in some way?

> > You've provided no analysis here so it's hard to tell if this is just
> > some random change that happens to change code generation slighly or if
> > there's some actual reason why this might fix something.  I'll note that
> > as far as I can see there are no users of this API upstream so I'm
> > guessing that you've got some out of tree consumer driver which uses the
> > API, it's possible that there was some error in updating that driver to
> > the new interface which is causing the issue.

> Actually the original commit not only change that callback 'set_cs_timing=
' but it also
> calls 'mtk_spi_set_hw_cs_timing' directly from the function "mtk_spi_prep=
are_message".
> So this actually influences all devices bound to this driver (in upstream)
> I did some printing and it does change values that are written to registe=
rs.

OK, so that's something that should have been in the commit log,
preferrably in a more detailed form that identifies what the change is.
However changing the values written out is clearly not the intent of the
patch and it is a substantially better API so can we not just fix things
so that the old values are written out?  Why are we jumping straight to
a revert here?

--sKosZo66cxuwvnFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFVsaUACgkQJNaLcl1U
h9Bwtwf+MtvgKYtUudf/n47UjD7LDb/EwrRnWOQ95GC+BenNNQM1lBYriL17NgP0
O9aGoqvc7JWUI698KrgSrsxHBSkDs0r8+tZQxZeEcbR5kUkOsoV0s98AlMjN2sHP
LoZwtgN4j/2R6e70+Wc4NU0fv1E0dlbkgg0GKEvtxxsGgGkvxvDMPJg6SEOqpKwF
gXowiuCHiI1TzZercbs5OCSSk9++MgiNOxNCNjMkWynYISicZB+LMbypkip7fGGZ
fGPA9av8KaB7UVCG6L34ink0d4gMWXmjrmCAB7JeX+KtkhLU4ASbNkjIc1eaQU85
kUoFycW/L766FtrdLQTy4+YScGyN/A==
=AH+t
-----END PGP SIGNATURE-----

--sKosZo66cxuwvnFI--


--===============1673080858927781949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1673080858927781949==--

