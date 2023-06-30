Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4D8EB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7FSmvSvwJYBWIJXMvoWOrBb59+8q6TkQ1skRfExBxU=; b=rw+C3NtQzQg0XBWrmMs2fAeYYy
	wX8xAx5LmaFAn+/gG9tGpX3ZcUqxB+lHjGmRpvBOKa8dTsZ8QwJhKTFl5CYyph4/5uBXLFkPWzxdb
	YXw+4GxQEno3qKyXVrnnm4Einsw21Uj0L+B5aOzPSNwhcQemKo8MD4HkdZU4lyVF+BUmqeHhlqjAA
	z7cG/StvddcBDNtOlX370XnfzuGjLYYEmruhwVnDc5mbwOneAqRXwQuZWYupLJBdOTyKxVa7cvX4Z
	0sQm2DOj+hDX9rY6XC/angX5pDGgCw6x8w8efChQKm/0oJkQGyVYeA7epIphMW++8ll0mferKYCVA
	bqQLoLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBrV-003TrS-01;
	Fri, 30 Jun 2023 11:00:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBrS-003Too-12;
	Fri, 30 Jun 2023 11:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 712D9616E2;
	Fri, 30 Jun 2023 11:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FCCC433C0;
	Fri, 30 Jun 2023 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688122820;
	bh=sgtH9hZqBaNjjeUXFQwQG7JJgk9ed7LANci46Hsnjv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpnOTSrYx+DAq9f8wxupbHlc6hHlI5W/9pFyY7K3yYn+4bgqePy5/dCjlhj10PjA6
	 VfwzZ6WRubSZqZcsDSBkjK5vxksaPm9g26oU7tajQ6QBVI7XOGoj2v7B7Lc1v+Fx6Q
	 0UJCjjoz56Ktq9o4o1RhkGWcZQz77nnlJi/RhqVoH7oA5x6NhSl8qGZyGzzHUOLyHD
	 z2J8b8H3sM4l6zvt/6ac/wfu8SB1u50bWzZM55n4D7aculbKRhy+TATdiukI/e6e5t
	 hCfVz6zPXsMMeFFfZi7DNdxcdh8Un2BXql75/jkImY5tzcUrYrSXDf5hPDZGerD5KA
	 csJfXMpzXQfRQ==
Date: Fri, 30 Jun 2023 12:00:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: add constraints for PCM
Message-ID: <6cda3265-7444-46a1-8b2e-75706a839670@sirena.org.uk>
References: <20230629075910.21982-1-trevor.wu@mediatek.com>
 <5995e77b-ea8e-4e88-8ca2-f716df9c9579@sirena.org.uk>
 <0e8b5ca298a01b16da0419928a30af6371e923ca.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pXwnTTZI7oC5iMkQ"
Content-Disposition: inline
In-Reply-To: <0e8b5ca298a01b16da0419928a30af6371e923ca.camel@mediatek.com>
X-Cookie: Old mail has arrived.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_040022_468725_9A01786C 
X-CRM114-Status: GOOD (  26.74  )
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


--pXwnTTZI7oC5iMkQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 05:29:23AM +0000, Trevor Wu (=E5=90=B3=E6=96=87=E8=
=89=AF) wrote:
> On Thu, 2023-06-29 at 16:06 +0100, Mark Brown wrote:

> > This commit message isn't entirely clear.  The effect of the commit
> > is
> > to restrict the configurations supported when using a nau8825 but
> > it's
> > not clear what a nau8825 has to do with this or why we're doing this
> > in
> > general.  What exactly do you mean when saying that "only a limited
> > number of parameters are necessary" and what makes this the case?

> For instance, some userspace frameworks only support specific sampling
> rates such as 48kHz on Chromebook, making other parameters unnecessary.
> By restricting the configuration, unexpected usage can be prevented and
> the alsa_conformance_test process which checks all parameters provided
> by an ALSA driver can be sped up.

That's a userspace policy decision, we shouldn't be enforcing this in
the kernel - even for Chromebooks people can install other OSs on them
which may make different decisions, and it's always possible that the
ChromeOS people might change their mind later.  If they're only
interested in testing 48kHz and it's slowing things down unreasonably
to test more then they should just only test 48kHz rather than changing
the driver to work around it.

> Would it be more beneficial to establish the criteria as a general rule
> for this machine driver, while limiting the use of the machine driver
> solely to the Chromebook project? Or do you just suggest that I add
> more details in the commit messages?

I think we just shouldn't do this, it's policy for ChromeOS rather than
something that's actually needed.  If we were doing this it would need a
much clearer commit message and we should be restricting things to
Chromebooks only.

--pXwnTTZI7oC5iMkQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSetbwACgkQJNaLcl1U
h9AkJQf/ahowvDnHs1ls1VrPs0VUmHp+BdUcwvobHhunvly76Nxkzn5NlOL4bhlK
ZTJYLgJuqYRagPBQWDP1vpBU64KEKPaXaFOZ9f69/Cg8xsEtw+9B0sgJzhfD9eES
FaMo9A/kdwgIzDEl1Blr/OS34ksno/bQMSJ2PzxDZ4OZUqvCSkVdh5iey/4Gd8EI
aRRU/b1LyHjhkMC2DrjPKTlYcBtg3t84b3+Q4SGWF7RLi49nkxGl0TC/SAq56pF0
WU+u0JkSsVxucQJ0pFHSl7OX1KohuaAVDB+c4tPE7dNFnluU8LjeKBJEXPvQlpo/
OcVDr55IMaZ99d1mty+MfTgJUh6Haw==
=AxtQ
-----END PGP SIGNATURE-----

--pXwnTTZI7oC5iMkQ--

