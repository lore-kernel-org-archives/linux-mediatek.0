Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47C3CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcAloi7OS5IILIsQ0ljvW71R0EJ1O/F969LT76YVwho=; b=N9FVgT1dZv79/ej4XajzjILi7y
	WQZzBdYT2+Z2GPVowt6ksNJ4oSXU/ImkrGhEY6QxUCPBioPsedPxBHe2oOG/psCE4nkHVuHA+chRW
	bKm++ckKsXlRK0IGlucWH6RaGMfmNBGlWiUwyxYsrZFLX5azeZyUdEgHHDI8GuAHgIn42LrCv+8sJ
	nTpD07IYwOnvwlB0rLmlwZuX4Yi/1rCSJ4bG5GTfRrnxk2g0di3MN0MWJEeK4xNU9tTc+KQOB4X4k
	sbQiL64hQVcvjJagN4gCQrH6N4v8UeDdg7pa+/IsVF5Uck6bDkYMJB+DH9F5gmyZa6ZGhjsGELhoZ
	wNGYAM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOSF-00000003742-15us;
	Thu, 04 Apr 2024 14:52:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOSA-0000000372a-0khS;
	Thu, 04 Apr 2024 14:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE536CE2DC2;
	Thu,  4 Apr 2024 14:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6164BC433F1;
	Thu,  4 Apr 2024 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712242351;
	bh=FVN+XU95iFZygTEUmTEWzjGUOeNxuFL1vZ2k7fKSY28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ4d96sncUwpLSXRdO3Bmos1MhA1dXSW/a4RAM3OmavozoeMqEpEcuw/x1YQ7C+bE
	 NANpo8VvxRApMqAz3igOSWnt+K+4RYnyg3H16tgTnTgsjoqW0T2+59pNIApGekVC8Z
	 TJCBZa+pdm4MGW6KzqwRuT7AxxWNlINIXlh0taPjKBRdF/uLRcEHu9tSUvn59l72lh
	 DgVSNMFSSElRTnyxlYEbJm0atkhWS8DlgOoCS6DbOLDH9JqPMkIe3AdDa3ZHYu/0+s
	 xWGG2DqJRg2xDBlJ94w+eRU5FT0uI7IN8un6YegcbCdjHljJ4lYdl+7EWHsJ+JDKwc
	 HzzkhhwM22Lnw==
Date: Thu, 4 Apr 2024 15:52:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Houlong Wei =?utf-8?B?KOmtj+WOmum+mSk=?= <houlong.wei@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: mailbox: Add mboxes property for
 CMDQ secure driver
Message-ID: <20240404-lankiness-devouring-d4d012b22cb9@spud>
References: <20240403102602.32155-1-shawn.sung@mediatek.com>
 <20240403102602.32155-3-shawn.sung@mediatek.com>
 <20240403-conflict-detest-717b4175a00c@spud>
 <9b9707a4a0e285a12741fe4140680ad2578d8d2b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5sEXL4CMpiDMisKi"
Content-Disposition: inline
In-Reply-To: <9b9707a4a0e285a12741fe4140680ad2578d8d2b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_075234_785982_9CA03ACC 
X-CRM114-Status: GOOD (  29.20  )
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


--5sEXL4CMpiDMisKi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2024 at 04:31:06AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) wrote:
> Hi Conor,
>=20
> Thanks for the reviews.
>=20
> On Wed, 2024-04-03 at 16:46 +0100, Conor Dooley wrote:
> > On Wed, Apr 03, 2024 at 06:25:54PM +0800, Shawn Sung wrote:
> > > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> > >=20
> > > Add mboxes to define a GCE loopping thread as a secure irq handler.
> > > This property is only required if CMDQ secure driver is supported.
> > >=20
> > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > ---
> > >  .../bindings/mailbox/mediatek,gce-mailbox.yaml         | 10
> > > ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > mailbox.yaml
> > > b/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > mailbox.yaml
> > > index cef9d76013985..c0d80cc770899 100644
> > > --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > mailbox.yaml
> > > +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > mailbox.yaml
> > > @@ -49,6 +49,16 @@ properties:
> > >      items:
> > >        - const: gce
> > > =20
> > > +  mediatek,gce-events:
> > > +    description:
> > > +      The event id which is mapping to the specific hardware event
> > > signal
> > > +      to gce. The event id is defined in the gce header
> > > +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> >=20
> > Missing any info here about when this should be used, hint - you have
> > it
> > in the commit message.
> >=20
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-arrayi
> >=20
> > Why is the ID used by the CMDQ service not fixed for each SoC?
> >=20
> I forgot to sync with Shawn about this:
> https://lore.kernel.org/all/20240124011459.12204-1-jason-
> jh.lin@mediatek.com
>=20
> I'll fix it at the next version.

When I say "fixed" I don't mean "this is wrong, please fix it", I mean
"why is the value not static for a particular SoC". This needs to be
explained in the patch (and the description for the event here needs to
explain what the gce-mailbox is reserving an event for).

Thanks,
Conor.

--5sEXL4CMpiDMisKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg6+qgAKCRB4tDGHoIJi
0tiPAQCmKL+7qqsiglTH60MzilEx595s4NTTEM6sOmrSsCQmHwD9FA2Hgru6DIpV
u2H+l/GfFPpbBLY5L/Sz6HL5EuzTfAk=
=u8hN
-----END PGP SIGNATURE-----

--5sEXL4CMpiDMisKi--

