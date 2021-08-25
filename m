Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA35C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 21:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C5161008
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 21:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73C5161008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEUV2+LI6s8qERwYt2+2opgjMMUspROLhkMo/r0y/iA=; b=LLZxLUbys3UPPKWSNMZccjRrhW
	4MB8ioG/zyhicRVMjVvTg0UYyAq62l1HYe3NN+hTnPmv1tqlVGyTPxmZ1+cum1r7FzAPo9vWkdTPc
	X8FKi1XfeXN9xQGD3bAdQpjlajA6nkEX30Rr44+kHJ3xtQRTwCyXSnQNQ5EoRZoP22k1vzQqSh9IM
	Qx297BLkPGYKr25HD2EKAEt0up4uplLVCbuZ2S44pMLaqx+5yBXRSqdL6S0wWg3LBRcxgRYwlCbTp
	acgiatJYhXkucEi7Icnw9J+RrPfm6b1CFbyERcRLCr2MVUq5ZBdNvY7SrA/3qGQzmzsyNm8BNJJ8g
	dSNd5tCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ01T-008U5U-Rr; Wed, 25 Aug 2021 21:01:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ01G-008U3S-2Y; Wed, 25 Aug 2021 21:01:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50DD760FD9;
 Wed, 25 Aug 2021 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629925263;
 bh=O491Wjstd55ptiItcBQmMStGcPeTVu8i5bDRYlMHCUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XE/g1Hy5xcXRzDs1m6ymA8x4Jz79ug6PGGR86pE3O0aQDbWVNi7Enm7XU0h97k7NX
 c90XDOAsgfhQOY3kjPX0rfyM4lcXBSGDwcLhY6sWh+aQoR44dhhOTMzQPNbjOAd9VF
 G/AumvbPhqT/O12DKigfbH+jL87G2KQgNn0ECkrGPKBScaYSkHGcUmq/Jq1vWHPYaF
 EitDyPaUIt3bDzSb8lfNW2Z9aTFNBsjaBOMc6H2tx44axBmchrgf9FNkgYre6pOEG1
 XRzJSoO0w1co6cu4s16KdItfkg16mfzPhQZhd5cqGba3Uy2FISUT1rNssH294whOGn
 UHuCh6e3GMKXQ==
Date: Wed, 25 Aug 2021 23:00:59 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/5] i2c: mt65xx: fix IRQ check
Message-ID: <YSavi8ZKhi/a0TR9@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
MIME-Version: 1.0
In-Reply-To: <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_140110_179927_3E2C9409 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4818312914390373407=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4818312914390373407==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kwNgeN+Mlw5HimRj"
Content-Disposition: inline


--kwNgeN+Mlw5HimRj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:38:45PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return=
 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
>=20
> Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controll=
er")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
>=20

Applied to for-next, thanks!


--kwNgeN+Mlw5HimRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEmr4sACgkQFA3kzBSg
KbYYnhAAtfxroMXkfK8KgUfArohFxjwTVzFF+hA8xULBOhOTDQ2QfO6JESKDMV9S
VLU008TXfBzwTlM7Q5QIQqbQ4GmfOiyIJXWHOt2pMQ5njdPp/hnFOTxvVMWKZTJH
6vTrUiQ7wZCPl9OmzLngDNBwEjNr0/wUhMHXtJAkvLUF4ZKJFsD+BOucmQtb1xjA
XCmvmm4ewPNXyRlfTEXIv8zuIL/szUns2zjr3vO6f/l1imG1Ow0PRd5VsE3mnvKt
Jd8hRcZnNLu3NJ+q5CEUk6mOzPOJkC7rsute+YuNGpAqZuqdzPCEoVDb+dlLb1tg
HSDq1rQJ4D/a30/axFNdEv0CHzmDYd/cF2rv1L6MCpaTB7RyAaaU+muMH/7qU8Dz
BapEIMuYZztIaS11OJJ/+JmfwPkyeSclbXtOYd+JwBCYIQXGaK4+DrwxkGs2c5iG
4IfbY+vmaRdufyF3ia9G/4RyyCaT9/U8DxVY+BofwyuZHqT0KsP3Q/MfUS79zD3d
EGZWEse0kQfbkMRNrYLcU+W/4yz4aGZT4Del3NcUtb7u5Rj9uf/g9lNwyTARiYHr
jY8wXfGZFwcPBYCAEFruDtR8Jio1lI+sZVLg3hN4eMfxaN/FO0500W2YjLsqtfpE
UoBvMDvvGq0MEEgMXmnxx3c6YLISzV3KAxsEHB670YkRfSCC6Ro=
=drRF
-----END PGP SIGNATURE-----

--kwNgeN+Mlw5HimRj--


--===============4818312914390373407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4818312914390373407==--

