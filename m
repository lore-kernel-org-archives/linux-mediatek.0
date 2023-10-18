Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45BACDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waTC4lLcpZ9NnueK6llNVyh1FASPwXWu2P0+400DTN4=; b=zJv3Jkrv3xBM+03Cw7R3KiGHGS
	0rIC2ULvkYqiq5eqHRUeatAwfvpGnNx9kJmFyjBW+wQD4Pu89rOLChasgKCj5STixka5/115GGcZo
	gdvb4xg6oCfqbT9Mp5mQIK4FFlGc0gdHQzDaLb5Q6ZqLeQTeMQAkGXWf81NbNSLk1EZ4isyOBVz0o
	5hBiyMhbng1QqHbt3RSKfM98hgpJ1tjTKrEow8Gm2CjGKRekp0JCCk0Yp8Sb8QMx9B+KkbeNT/Z+F
	0r4xTuQfveiZclrCK5f3IQLKwruAoEIGWtmJLPTfiUcv2IvF/yhGvfqap/xyIh7vhbITM6k+dUAxp
	ZGRqDSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt89Q-00Ezi4-1l;
	Wed, 18 Oct 2023 15:08:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt89M-00EzgL-31;
	Wed, 18 Oct 2023 15:07:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57930CE2503;
	Wed, 18 Oct 2023 15:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80991C433CA;
	Wed, 18 Oct 2023 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697641674;
	bh=AtOhH7lCDZCWXMDhYUnp7kvc5xryvi7wRU9/sSDZbM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKxNL6HC3egcjSoE8gB1WKMIXHSToVFH10JGfwd+khfHfeAjYMSGVF9vkbkeg6Z43
	 mn1NlglNAEL5ItfLbpgEZA5mDfDdLeZcUWTiYwu1suW1BK3IXQE22sYtj57KFl5a4n
	 LD0FMcAVVVFQp40Jc8ksjWRNd2b3BqezFu/A1X+vgaoistq5dWPO55iUfL8jLW6KWt
	 sahgGL4TcNNStz12zDsA8S9Lz5l5ipurl3bcg7oRvQMfpTm23b6EJxhpmnEki8WFgr
	 NVM++6u479Rx32mtJWYegojl/m4HDD1ZeR5wUScY4N5CekPjG3Duy8bgEvcLx5b0gM
	 pcAKC9317P41w==
Date: Wed, 18 Oct 2023 16:07:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel /
 Tentacool Chromebooks
Message-ID: <20231018-earpiece-dimmed-81c0f728d0b6@spud>
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-3-wenst@chromium.org>
 <20231013-washer-mortally-b27c196ac50f@spud>
 <CAGXv+5GF7HfQSOg9c=G+c4DPUW24Ax7LX4raTynDbE3xc8iCdg@mail.gmail.com>
 <20231013-panic-vaseline-350c10e7d585@spud>
 <CAGXv+5EmLDWi3Lnca1vPft=9z9Cp2L2ee08in_b_21hipf9ieQ@mail.gmail.com>
 <20231014-proud-levers-eb03f30a0a9a@spud>
 <CAGXv+5F-x9m2WYZm-YLaxqio=VnfKkL26gLFbayJctBEJrSM6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FSanamN/VZcb42q0"
Content-Disposition: inline
In-Reply-To: <CAGXv+5F-x9m2WYZm-YLaxqio=VnfKkL26gLFbayJctBEJrSM6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_080757_319373_A929750B 
X-CRM114-Status: GOOD (  48.70  )
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


--FSanamN/VZcb42q0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2023 at 11:15:22PM -0700, Chen-Yu Tsai wrote:
> On Sat, Oct 14, 2023 at 6:40=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Fri, Oct 13, 2023 at 11:19:16AM -0700, Chen-Yu Tsai wrote:
> > > On Fri, Oct 13, 2023 at 10:55=E2=80=AFAM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > >
> > > > On Fri, Oct 13, 2023 at 10:29:25AM -0700, Chen-Yu Tsai wrote:
> > > > > On Fri, Oct 13, 2023 at 8:11=E2=80=AFAM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > > >
> > > > > > On Fri, Oct 13, 2023 at 07:02:28AM +0800, Chen-Yu Tsai wrote:
> > > > > > > Add entries for MT8186 based Tentacruel / Tentacool Chromeboo=
ks. The two
> > > > > > > are based on the same board design: the former is a convertib=
le device
> > > > > > > with a touchscreen, stylus, and some extra buttons; the latte=
r is a
> > > > > > > clamshell device and lacks these additional features.
> > > > > > >
> > > > > > > The two devices both have two variants. The difference is a s=
econd
> > > > > > > source touchpad controller that shares the same address as th=
e original,
> > > > > > > but is incompatible.
> > > > > >
> > > > > > > The extra SKU IDs for the Tentacruel devices map to different=
 sensor
> > > > > > > components attached to the Embedded Controller. These are not=
 visible
> > > > > > > to the main processor.
> > > > > >
> > > > > > Wha? Given your ordering, is a "google,tentacruel-sku262144" a =
super-set
> > > > > > of "google,tentacruel-sku262145"? If not, this compatible order=
ing
> > > > > > doesn't make sense. I can't tell from your description, and the
> > > > > > absence of a
> > > > > > items:
> > > > > >           - const: google,tentacruel-sku262145
> > > > > >           - const: google,tentacruel-sku262146
> > > > > >           - const: google,tentacruel-sku262147
> > > > > >           - const: google,tentacruel
> > > > > >           - const: mediatek,mt8186
> > > > > > suggests that there is no google,tentacruel-sku262145
> > > > > > device?
> > > > >
> > > > > AFAIK all four SKUs exist. And as far as the main processor is co=
ncerned,
> > > > > they look completely identical, so they should share the same dev=
ice tree.
> > > > > As mentioned in the commit message, the differences are only visi=
ble to
> > > > > the embedded controller, which fuses the sensor inputs.
> > > >
> > > > Then it makes very little sense to write a binding like this.
> > > > If this was just for the 252144 SKU, this would be fine.
> > > > For the other SKUs, there is no way to uniquely identify them, as
> > > > all four of google,tentacruel-sku262144, google,tentacruel-sku26214=
5,
> > > > google,tentacruel-sku262146 and google,tentacruel-sku262147 must be
> > > > present.
> > > > Given that, why even bother including the SKUs in the first place,
> > > > since no information can be derived from them that cannot be derived
> > > > from google,tentacruel?
> > > > There's something that I am clearly missing here...
> > >
> > > There are incompatible variants of google,tentacruel. This is why this
> > > patch has four google,tentacruel based entries. Of them, two are Tent=
acool,
> > > which are clamshell laptops, and two of them are Tentacruel, which are
> > > convertibles.
> > >
> > > Within each group there are two variants: the second variant swaps out
> > > the I2C touchpad controller. These two controllers use the same I2C
> > > address but use different compatible strings, so it's not possible to
> > > have them coexist within the same device tree file like we do for many
> > > other second source components.
> > >
> > > So the relationship looks like the following:
> > >
> > > google,tentacruel --- Tentacruel --- google,tentacruel-sku26214[4567]
> > >                    |              |
> > >                    |              -- google,tentacruel-sku2621{48,49,=
50,51}
> > >                    |
> > >                    -- Tentacool ---- google,tentacruel-sku327681
> > >                                  |
> > >                                  --- google,tentacruel-sku327683
> > >
> > > Also, the devices themselves only know their own SKU ID. The firmware
> > > will generate a list of compatible strings like:
> > >
> > >   google,tentacruel-rev4-sku262144
> > >   google,tentacruel-rev4
> > >   google,tentacruel-sku262144
> > >   google,tentacruel
> > >
> > > and try to find a match in the kernel FIT image. The method we curren=
tly
> > > use is to include all the applicable board compatible strings.
> >
> > Then it seems like what you need is something like
> > oneOf:
> >   - items:
> >       - const: google,tentacruel-sku262144
> >       - const: google,tentacruel
> >       - const: mediatek,mt8186
> >   - items:
> >       - enum:
> >           - google,tentacruel-sku262145
> >           - google,tentacruel-sku262146
> >           - google,tentacruel-sku262147
> >       - const: google,tentacruel-sku262144
> >       - const: google,tentacruel
> >       - const: mediatek,mt8186
> >
> > What you have at the moment just seems like a hack because you want to
> > stuff all of these compatible strings into a single dts.
>=20
> It is. And it works OK downstream. The reason we want to stuff them in
> one dts is because the firmware will not generate the fallback to
> sku262144 as the scheme above suggests.

I'm not going to ack the hack that you have here, sorry. Maybe Rob or
Krzysztof will. The list your firmware generates above doesn't even
match the contents of this patch, with the extra "rev-4" compatibles.

> Having three or four identical device trees just with different board
> compatible string sequences to me seems a bit redundant, and it does
> end up bloating our FIT image a bit, which impacts boot time.

I'm not aware of the capabilities of your bootloader when it comes to
setting properties before passing them to the kernel, but that is what I
would be doing to cut down on having 4 different dtbs.

--FSanamN/VZcb42q0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS/0xgAKCRB4tDGHoIJi
0kndAP9mCU1KkF6zmF+udpc6vFsvJuy4oehTnrEgxb8UxCE1rgEAu1RSUGsi3wau
liCFeiR+alAXLoxLrGhMO1rZRXVUSgs=
=FbzG
-----END PGP SIGNATURE-----

--FSanamN/VZcb42q0--

