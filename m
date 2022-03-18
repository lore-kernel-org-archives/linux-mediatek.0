Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgdjxEgoin9SawiTIi/X2MqbXjhPbNqyZdbJ2p0tObg=; b=xoXBf+MfHW2+oK8Nx0o78qYqvM
	9OgDIlq+R4pGwI023iINSGW6hNQ2sUOh70BCxgqdZH5uL3jrivd1UYhUdytiqsPewoCE8Vpygnkch
	+NkTBdYlmps5cT2+a4iggTI9/Pk7X/HsGOO1//6aThV3k+DK6sM9AtjdhAil459QjNfn+GfXymmJA
	5gbDmj0nzVzCFUeUUnPVjPL7eRqUFj7kDdyVFUk7cwAIJzf3ayFu67eC+nbiWeU3pvHBlMJL7AcxD
	ys31p+S9qbHrXviK2HW8FLrNpBjP/I6gfurJwPxY2x4RxURF8OWIzFe7Wj/UMPAeI/b3JthpDn2hb
	H7IOeG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVAUZ-001LXF-37; Fri, 18 Mar 2022 11:09:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAUO-001LWN-1D; Fri, 18 Mar 2022 11:09:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC2C4616F9;
 Fri, 18 Mar 2022 11:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90687C340E8;
 Fri, 18 Mar 2022 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647601786;
 bh=SXnERjf7sMUEmSDOYADqk0NehLbz+bFri+b2as9Ucgc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=LqEW2LGUWnpy0gIOVQNtrp1vB9raUEBE3dL18K3pYUsuMrFziJ36/rfWcTJmwH7pM
 C7WOUzLXJAeDx0aepr+CqylLr5ZPMw6EAkr2oT9EfooIYJ/sa/q8eq/HLnQPFTsM8r
 MqctyMaPVQg2qZyQLzXTs0hSvZVfXWJzHlShcBRwR8FMuF+z4QeV2ZOvQQ6VPmXVZI
 m8cF9iSYnmkU8AK8/vmx2KMczAfaVAGA5C/Dl903SHYyjJoZ94jfD9X7JTEaSY85NQ
 N+yYfh2u2PzxqUl7lxEz+jUiU/TKkyO1oxqgWLBZe+nu3rVwwl/2/RKPwCuh1PpcAm
 hnXCzZTelw1Gg==
Date: Fri, 18 Mar 2022 12:09:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Message-ID: <YjRodtoWRhlNUg14@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
 <Yh45nDwqnLInrzzE@ninjato>
MIME-Version: 1.0
In-Reply-To: <Yh45nDwqnLInrzzE@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_040948_196951_29514355 
X-CRM114-Status: GOOD (  19.53  )
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
Content-Type: multipart/mixed; boundary="===============3671499012887973573=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3671499012887973573==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iBARJ5cjDICW8t1U"
Content-Disposition: inline


--iBARJ5cjDICW8t1U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 04:19:56PM +0100, Wolfram Sang wrote:
> On Thu, Jan 20, 2022 at 09:58:51PM +0300, Boris Lysov wrote:
> > This small patch series removes mt6577 support from the i2c-mt65xx driv=
er and
> > devicectree binding documentation.
> >=20
> > The existing i2c-mt65xx driver relies on DMA since it was first introdu=
ced.
> > mt6577 does not support DMA [1] for I2C and SoC's Generic DMA engine ca=
nnot
> > be used for this purpose, too, which makes this particular driver incom=
patible
> > with mt6577 and other similar SoCs with same I2C IP.
>=20
> Qii Wang, what do you think about this series?

This series makes sense to me. If you do not disagree, Qii Wang, I will
apply it soon. All the best, everyone.

>=20
> >=20
> > [1] see references in
> > https://lists.infradead.org/pipermail/linux-mediatek/2021-October/03033=
3.html
> >=20
> > Boris Lysov (2):
> >   dt-bindings: i2c: i2c-mt65xx: remove compatibility with mt6577
> >   i2c: mediatek: remove compatibility with mt6577
> >=20
> >  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  9 +++---
> >  drivers/i2c/busses/i2c-mt65xx.c               | 28 +++++++++----------
> >  2 files changed, 18 insertions(+), 19 deletions(-)
> >=20
> > --=20
> > 2.20.1
> >=20



--iBARJ5cjDICW8t1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0aHUACgkQFA3kzBSg
KbZ60w/9HKOEiLJBPS53guHScO1S1QuOaD1AVgB1GXVELCJGJdPhAnOGyjayIlQD
S5s/yMcHZWZhs2WadOukW1y2YZDMLS5hrhqI5Q9G0vbwRCAsIbiugyxjPOVCZiSZ
PfrgpgTOig8Gnyrx1pWQjwcFRpIhXSVqLITssGFfP4HZjkv9bTaLnPyXqD8/GHN9
NAbi6fT7UAI/gGAnNUAAY+PHv3Ynq62UCRd3p0zM8cSEiJTKvcWIRkmKQqXXG73Z
JXPMsRt6WB2kM6ZPLl1G7gYXjTMPhOE8GyNskqV2SuqdRaxIC2TZqZypnFaKrVSr
wvgY8VG3pyTgCCpbkXq/E7aGxJtfuet4oylCmufdw9PtB9X82fEr0p6980JXWX0/
Z7xy1leutV+H1vwZeD3Rg2+xFV8osYvIx8L8Elh7AlPQ7UIOpD14YoXxA0kYzULR
H3L5zuCLAWE3CFn7X8xYlS/Boj8G6hlVA6e/WlhdzFA9yRbYoIHeEgMOO1P8Gclz
dTd6KhSMSUmyTVF2xlHn2kuMp5+pBQIKAt2xxuEHTuXRdos4sozSrqEmlSBKFi8H
hz2hbGYQqK+20fcSfJEEwKWhVyqVMGQXb+7EzNXRJCzHP53xL1uwKBpZI5aYrd4h
GWfrD4ydDKTKiJ+sm2X4RQvM/2deiZgnkb4h0Iir1FIj7IfbC64=
=PSx7
-----END PGP SIGNATURE-----

--iBARJ5cjDICW8t1U--


--===============3671499012887973573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3671499012887973573==--

