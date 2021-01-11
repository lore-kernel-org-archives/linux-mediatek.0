Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6861C433E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 16:42:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3321F22AAD
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 16:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3321F22AAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=acYk24SINBpCIPiLdNCoaUVIN2SehMItlpidC2K7ww4=; b=nw48bHL+ut9IjD/X7nCld8AUl
	JNBFE/aze+AfVCZZyl5nSEG5kXraxEPUF5eujOJ6/bb78H9nx5rXhnvc3rTqdWbHL2Kpi/rLcSO9K
	PPblK+3CBKgnWP9hl6QBpsFpmJGpYz4A8u7ErIETcyEUEc1NKQFt5cwEw8OjaXHYexwv9b82z61j9
	GB2fPVMiEwHQ9BQxvHq1/sPGVT15a7j4kYDnczNwMwXDUUgc7C7KMe4EbIoLh1k5e1c1ElOi0XXpi
	QIwk/zuD41T3ghccQgHoReBrhDB+Fa7NY1ZZiVvXrEIfWaW36zszRoXIkkXhKsWYN24e/GPR1hQpQ
	NkUz5Eskg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz0GT-0003yE-0u; Mon, 11 Jan 2021 16:41:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz0GN-0003wX-V3; Mon, 11 Jan 2021 16:41:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33B7820B1F;
 Mon, 11 Jan 2021 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610383310;
 bh=pHdL6r7FXXGNXM3Ebqp+Wf6OKYp1jUSbChLOvGSj6Vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vkwn0fuTvm7Tdoy3qtROvRL14dXnX6MebEsWVEc8u3sIzFAAGtuTcNUkdudrCV38h
 kZGJxZsTBhcVU8jUGrt0IGsa3EZ3kTzV0FpbkXnvK/VuEVQz+gSzP1RuO9TqK3YtKF
 vaV10TEeoZpHnka5OGoymIlillJ7/jCg1BWc7l7u4CO0y04KknnVCfIjkAD2VeeGrt
 UFkoL+ljFOYIKtq4QBn4xrePx3hf0GOzBqIqnwBGzXrgqEYae0OM8+Xgxbq3F7g2E+
 HKaELmSvaVkhkGTAlkbwvypKlTdW6uzyFF7GjUUZa8bH+y7Bk7yu86v1CM/oSTuOdh
 UkjbiYcgej/Vw==
Date: Mon, 11 Jan 2021 16:41:18 +0000
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [PATCH v2 1/3] regulator: mt6360: Add OF match table
Message-ID: <20210111164118.GE4728@sirena.org.uk>
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210109112612.1221-1-matthias.bgg@kernel.org>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_114152_086555_A1895601 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: multipart/mixed; boundary="===============4869328643229289714=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4869328643229289714==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Content-Disposition: inline


--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 09, 2021 at 12:26:09PM +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
>=20
> Binding documentation mentions that a compatible is required for the
> MT6360 device node, but the driver doesn't provide a OF match table.

The binding should be fixed to remove the requirement for a compatible
here, this is both redundant since we already know we have a mt6380 from
the core MFD and encoding details of how Linux implements things into
the DT bindings.

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8f60ACgkQJNaLcl1U
h9DuAwf9HMf6KGCC1zeqywtZhlKTB1cStvN7IwhVumnBs7s6MfljXhjvSeg0dwhu
OuPqKnBkputwxVuLUcxVBeS8gOlcmNigypgGCWi4NgbJWnDtRGBEwbJ6Dz3UNQYN
tnNzP/Jd5yk+wQlFS4FM0FMX8Q2Bpl/nLbGliTL9xnrfgBGRLevBTChBOahtLFxo
de12GMYwf5pCOgSknPwmuGKXF1gGAbk3aE3XKO5HaRYgyQY3v4LN9i5kj7Z7Z8f2
h4pF/HhZRm0EMuc1nhEv8bJgsC4A6TIyLbEA8xHP9SixXREANTyGaRg49kWlaeH5
4lRvhhOfHOOXtgpMSdBLqK7MLac80g==
=OgE8
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--


--===============4869328643229289714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4869328643229289714==--

