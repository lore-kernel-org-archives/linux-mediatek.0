Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C7AC0219B
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjgJynL9P8TzsMC7BETb4fwFvURXZKJwxcO5/PJBE2s=; b=o8P3h/f2kXnjaWQvhWO4EMQlm9
	bCTKXwOoJf8oVeXNYvkQgI08DSVtIjTeqqaozQqa0GSM246sUeA4Q2pSR02GMOKkafty22C/R9oof
	tfOSA9u16PsinRuyDJJeevnWI4GYjiVy9eInyui9yxknh4h2Ee65n5eA1/wV8y0rGM/W3/jOPv2eO
	h46WjJyISnl0W8ItqOEAXrsdV57pnpeVCCxDuQDMP2NKtc21HprwfnNI5GlxQPPu1Rzx3f5aGY5HK
	gq+0Fa1lKw8aJk+tQvOxm5XcIl6VDd4c7nvKxMlGxl8RbCCdDh0NNY/CONE9k1o/bqyLJfD55zaF0
	d7DHiIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg784-00000007IVp-2381;
	Thu, 06 Feb 2025 19:01:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6a0-00000007BMc-3K2D;
	Thu, 06 Feb 2025 18:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C3BF5C5520;
	Thu,  6 Feb 2025 18:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F9AC4CEDD;
	Thu,  6 Feb 2025 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738866383;
	bh=zEiLpGTnN6szvqIO03zj6Wy4GsFDV17QfFRszwprihM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLCjgvCBU5utmTUv/A0sJ4Bl1ywl3snuOUZcQxXnbeZlEky0i3YfrYdMH/uCFxK7T
	 duh+T0WjlAsIjICFUOImtv4h8H5a/O1GC4OFsUSEe6Fs8kOl25ivhH10br5dV2pmrl
	 Sec5GPwylbbHAqOI11XEzRGf0rSI/Quu4pg2gSlUBpEHDCrOvIosc//bmuHT/86oV2
	 GqXlpyQPGmuoPZli7X/WH74lndy5JJexe2qohaFmx63Bm0JnN7PsS7Q0rQwDKvs1WI
	 DxVIdlSYfSzj+1qZY+kz3UlHqr5rvnRXq/nYv196JIW9CiTbvTEpL7cSi9NQ4o1Mfc
	 Q67ALrU4H2owA==
Date: Thu, 6 Feb 2025 18:26:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 09/13] dt-bindings: net: airoha: Add airoha,npu
 phandle property
Message-ID: <20250206-sabbath-carded-2bd52c03440d@spud>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
 <Z6O8-dUrLNmvnW1u@lore-desk>
 <20250205-disagree-motive-517efca2b90c@spud>
 <20250205-patronage-finisher-bbfbdb5b7dbc@spud>
 <Z6PQEzvvCdDKQSnl@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/oPBRXOgxxcoZEVI"
Content-Disposition: inline
In-Reply-To: <Z6PQEzvvCdDKQSnl@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_102624_923408_ED58D2DB 
X-CRM114-Status: GOOD (  34.10  )
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


--/oPBRXOgxxcoZEVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 09:54:43PM +0100, Lorenzo Bianconi wrote:
> > On Wed, Feb 05, 2025 at 08:01:26PM +0000, Conor Dooley wrote:
> > > On Wed, Feb 05, 2025 at 08:33:13PM +0100, Lorenzo Bianconi wrote:
> > > > > On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> > > > > > Introduce the airoha,npu property for the npu syscon node avail=
able on
> > > > > > EN7581 SoC. The airoha Network Processor Unit (NPU) is used to =
offload
> > > > > > network traffic forwarded between Packet Switch Engine (PSE) po=
rts.
> > > > > >=20
> > > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml |=
 8 ++++++++
> > > > > >  1 file changed, 8 insertions(+)
> > > > > >=20
> > > > > > diff --git a/Documentation/devicetree/bindings/net/airoha,en758=
1-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a=
20230b0c4e58534aa61f984da 100644
> > > > > > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.y=
aml
> > > > > > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.y=
aml
> > > > > > @@ -63,6 +63,12 @@ properties:
> > > > > >    "#size-cells":
> > > > > >      const: 0
> > > > > > =20
> > > > > > +  airoha,npu:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > +    description:
> > > > > > +      Phandle to the syscon node used to configure the NPU mod=
ule
> > > > > > +      used for traffic offloading.
> > > > >=20
> > > > > Why do you need a phandle for this, instead of a lookup by compat=
ible?
> > > > > Do you have multiple instances of this ethernet controller on the
> > > > > device, that each need to look up a different npu?
> > > >=20
> > > > actually not, but looking up via the compatible string has been nak=
ed by
> > > > Krzysztof on a different series [0].
> > >=20
> > > Hmm, I disagree with adding phandles that are not needed. I don't agr=
ee
> > > that there's no reuse, if you can treat the phandle identically on a =
new
> > > device, in all likelihood, that node should have a fallback to the
> > > existing one.
> >=20
> > Also, where is the binding for this npu? It looks like a brand-new
> > module that you're adding a driver for in this series and a phandle to
> > the node for here but I see no binding for it.
>=20
> The driver loads the NPU node just as syscon so I have not added the bind=
ing
> for it to the series. I will add it in v2.

I don't think it is "just as syscon", you've got an entire driver for it
that you're loading via the phandle, it's not just some generic syscon that
you're looking up here - at least that's what it seemed like to me after
my scan of the driver patches.

--/oPBRXOgxxcoZEVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T+ygAKCRB4tDGHoIJi
0lDVAP99szIZe8LIhGzbAEpswbE479dnuYBrXx+O1D4nO3LFswEAzPfV05o49+gc
Cw7wCHXzFPQRZM3PDwkaaW819kcBPAw=
=t8sA
-----END PGP SIGNATURE-----

--/oPBRXOgxxcoZEVI--

