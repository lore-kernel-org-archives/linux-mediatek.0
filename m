Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B15C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntB+bbUKnhOxh8y7HNEjbmxNyzwcc8uYo8PAcwggoqI=; b=ifShCiMdjQU7nTQPFGEUJHJbUt
	wsS990/8e9sbJ8npIANQjX7x/c4CGylvZJ0nJun0JF0ooBjMAph3LefnV6Czb7oaPtjHZrra58M0T
	UUKYr6pzbxYqAqKIOW2dDMdDfoAOOf4W7PDtLhMGMZSqlfmQ+05/5/xkMeM7vOvZYPONtRCNaNbuL
	DoOKnaqgYNFgj0OLh1WckE5fwFJlL0uG8zuEr5ZbrGshnvPPeNipwyhUUDSZiKyzkz5ws18FJUAyW
	bEaEXVjEFJwysMryVD1MkKmNPMR8roKUsUIv2m8IYiW4fOvqJWzTWt/QFk8PtCNDdiIx7o+rQrhvB
	G1JDzi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT32u-0000000103O-0ajo;
	Thu, 25 Jan 2024 16:57:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT32q-00000001019-11Qf;
	Thu, 25 Jan 2024 16:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A56562249;
	Thu, 25 Jan 2024 16:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8289AC433C7;
	Thu, 25 Jan 2024 16:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706201858;
	bh=ntB+bbUKnhOxh8y7HNEjbmxNyzwcc8uYo8PAcwggoqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5fLREENADd4qPzz1kyfRN7stOoYD5ZBiDhBgSIT8UZiF18VX+PCcg40Sx9dcyzvI
	 cjyt3shnMe4mQ7IdFfy+10BijEZ0Jm6dzIp/+PKpUmOYnqIUS6rbk2MLA56r8C0AUH
	 3/GS8vzvcVC3pQm5mUbVAp/FHc35ICvqAfnt4AHJpaqX+GmpxacDflQODNYD1k8MsE
	 P6sVLrWbcY9nhTfcKagRtB7KcSAcR3xMB3bq9Dx4iEO6kCieQhYMLDlBCriLjOHIJm
	 05IxAyRGv/JIzbNWmU2/j4xYl50naB+kLhGt8jqSCnFgM1DmfCjSNIbzGhEyZz/MCQ
	 lXJfkXFY6/HzQ==
Date: Thu, 25 Jan 2024 16:57:33 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, cy_huang@richtek.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Message-ID: <20240125-disdain-delivery-ff3bf246bbe1@spud>
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
 <20240119-eldest-discharge-e2d3812be0a9@spud>
 <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
 <20240123-procurer-jumbo-ebbec485505d@spud>
 <4fdbc3d8-3d44-4c2c-aae6-daa0b431e1c9@collabora.com>
 <dc9773aa-690f-47b5-b60a-a79c1e2dbaf2@linaro.org>
 <abbc1135-6d32-421a-baea-123a9f761362@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="clhVPuZeufoXCJeF"
Content-Disposition: inline
In-Reply-To: <abbc1135-6d32-421a-baea-123a9f761362@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_085740_413105_B283B432 
X-CRM114-Status: GOOD (  34.30  )
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


--clhVPuZeufoXCJeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 12:41:57PM +0100, AngeloGioacchino Del Regno wrote:
> Il 25/01/24 11:32, Krzysztof Kozlowski ha scritto:
> > On 24/01/2024 09:48, AngeloGioacchino Del Regno wrote:
> > > Il 23/01/24 18:14, Conor Dooley ha scritto:
> > > > On Mon, Jan 22, 2024 at 11:32:30AM +0100, AngeloGioacchino Del Regn=
o wrote:
> > > > > Il 19/01/24 17:32, Conor Dooley ha scritto:
> > > > > > On Fri, Jan 19, 2024 at 10:41:04AM +0100, AngeloGioacchino Del =
Regno wrote:
> > > > > > > This IP has only one interrupt, hence interrupt-names is not =
necessary
> > > > > > > to have.
> > > > > > > Since there is no user yet, simply remove interrupt-names.
> > > > > >=20
> > > > > > I'm a bit confused chief. Patch 2 in this series removes a user=
 of this
> > > > > > property from a driver, so can you explain how this statement i=
s true?
> > > > > >=20
> > > > > > Maybe I need to drink a few cans of Monster and revisit this pa=
tchset?
> > > > > >=20
> > > > >=20
> > > > > What I mean with "there is no user" is that there's no device tre=
e with any
> > > > > mt6360-tcpc node upstream yet, so there is no meaningful ABI brea=
kage.
> > > > > Different story would be if there was a device tree using this al=
ready, in
> > > > > which case, you can make a required property optional but not rem=
ove it.
> > > >=20
> > > > Not every devicetree lives within the kernel.. If the driver is usi=
ng
> > > > it, I'm not inclined to agree that it should be removed.
> > >=20
> > > I get the point, but as far as I remember, it's not the first time th=
at this
> > > kind of change is upstreamed.
> > >=20
> > > I'm fine with keeping things as they are but, since my intention is t=
o actually
> > > introduce an actual user of this binding upstream, and that actually =
depends on
> > > if this change is accepted or not (as I have to know whether I can om=
it adding
> > > the interrupt-names property or not)....
> > >=20
> > > ....may I ask for more feedback/opinions from Rob and/or Krzk?
> >=20
> > Driver is the user and this is an old binding (released!), thus there
> > can be out-of-kernel users already.
> >=20
> > Minor cleanup is not really a reason to affect ABI. You could deprecate
> > it, though. Driver change is fine.
> >=20
>=20
> Thanks for the clarification. If USB maintainers want to take the driver =
part only
> without me resending this, I'd appreciate that.
>=20

> The interrupt-names is not a required property in this binding anyway... =
:-)

Having -names properties that are not required when the base property is
always seem so pointless to me, except in cases where they're not
required for the case where there's one item but required when there are
more than one. Ultimately they're pointless if not required since they
can't be relied on. I think dropping it from the driver is required for
correctness.

--clhVPuZeufoXCJeF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKS/QAKCRB4tDGHoIJi
0v86AP9l1CfLfFT8z5XQyQXQOWkzpec/y9WalTIbnXpbEFgfBAEA5Q7RAW2pLt1Q
MwNSHR9bNbwJHwNJfnR8eKxAltE8fgg=
=z3OQ
-----END PGP SIGNATURE-----

--clhVPuZeufoXCJeF--

