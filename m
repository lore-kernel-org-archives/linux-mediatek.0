Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D860C001CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLTgAXKzaHwcIzRK82QcqPB52joRnxwkvU9YrFjXJPY=; b=L0Z+8r1cey6Ib2gUb77H0wdafl
	68FwHuflRSxCulK62QC4geCkfTQeMGc69EXC9y886OEB0KBPL+p2ew9JqmU65/geJ+8VYqteB/qSW
	/tna39fUBV3S8vhhIxTYmAepHsACL/xfL55lxrH4pBVDHva3kB9P2K8b6Nsaev05z4v92hPSnnwF9
	p86xTnJY2z4+UjOEoUulVpSZnQSX7EGfX6YuV3lRGtOMlJPlSJlCXiiW8cbIIroFUSlQxrHajVoO0
	o9cHjqgiLh9sYyugeZ7WzcH9IvpUCqg4V01lJn9Yl8RQO8VOFtL+EtC1+wRa7Uzi08XLs165z5yKQ
	TjqUrA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwCS-0000000ChrI-0h1N;
	Thu, 11 Apr 2024 15:18:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwCO-0000000Chps-0UbI;
	Thu, 11 Apr 2024 15:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08A4161D8E;
	Thu, 11 Apr 2024 15:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC9AC072AA;
	Thu, 11 Apr 2024 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712848726;
	bh=IVfpujiqFE7Wz//nwMyDR2FjbxTDeZ4CZN8xF6MI70w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1tuCVeNUKpp6zEOSjIfgsnalqciR99+p5fDV76dBQnfwf1wpZNmhunVF9ebrmXDV
	 5BMi57E1CkD4/YwFU2mwLj79o4lqqc9JLfTlwcVYieNh6CstJ+EYirLZi4f5B934Iu
	 V2ci9VAl1j7ceZzaZsDvZA7P/x75QZvcvTNpCcM1DxSFq94oiO9SPGzy2O7X0TfxE2
	 y84pB2PRT6PO6K5CNy2ZUId0v53FSOlbYYCIjr6mzXawZ/BNa8ItiVnVuqL0i9aIeS
	 bAWfr0kXIhTQq+YPRlVcJihJvg4hLoKrz1GQRGj/9SpDmIu2fGYRH9XAdUnZVkBOXj
	 VuoDEOZ9EW8xw==
Date: Thu, 11 Apr 2024 16:18:40 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	peter.wang@mediatek.com, chu.stanley@gmail.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, stanley.chu@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/8] dt-bindings: ufs: mediatek,ufs: Document
 additional clocks
Message-ID: <20240411-curvy-satirical-8c50cf79d703@spud>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-8-angelogioacchino.delregno@collabora.com>
 <20240411-filth-trekker-8a8c185d589b@spud>
 <f7fcbae7-fd54-4ad5-8dc6-4deb80088b79@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BPJ3krEP7ZWCC7l0"
Content-Disposition: inline
In-Reply-To: <f7fcbae7-fd54-4ad5-8dc6-4deb80088b79@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_081848_269120_865BC701 
X-CRM114-Status: GOOD (  25.04  )
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


--BPJ3krEP7ZWCC7l0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 05:14:34PM +0200, AngeloGioacchino Del Regno wrote:
> Il 11/04/24 17:10, Conor Dooley ha scritto:
> > On Thu, Apr 11, 2024 at 01:42:59PM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > Add additional clocks, used on all MediaTek SoCs' UFSHCI controllers:
> >=20
> > I appreciate being told they're on all, rather than it being unsaid and
> > having to ask.
> >=20
>=20
> You're welcome :-)
>=20
> > > some of these clocks are optional and used only for scaling purposes
> > > to save power, or to improve performance in the case of the crypt
> > > clocks.
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > ---
> > >   .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 14 +++++++++++=
++-
> > >   1 file changed, 13 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml =
b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > index e2c276da3f2c..21b038db100c 100644
> > > --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > @@ -26,11 +26,23 @@ properties:
> > >             - const: mediatek,mt8183-ufshci
> > >     clocks:
> > > -    maxItems: 1
> > > +    minItems: 1
> >=20
> > Could you add an itemised list to the clocks property please?
> >=20
>=20
> Not really... Honestly, I'm not confident that the description will be 10=
0%
> correct for all of them... can we do that at a later time, when I will be
> really that much confident in writing down a proper description for each
> of them?
>=20
> The only thing that I'm really sure of is exactly what I wrote in this co=
mmit,
> nothing less, nothing more... for now :')

fwiw, my motivation here was a better explanation for what "ufs" means
as a clock. When the block has some "ufs" clock and a "axi" clock it's
kinda clear what they do, but with 7 ufs clocks now, it's not really
clear what the bare "ufs" one actually does.

If you can't provide an itemised list, please set maxitems.
=20
> > >     clock-names:
> > > +    minItems: 1
> > >       items:
> > >         - const: ufs
> > > +      - const: ufs-aes
> >=20
> >=20
> > > +      - const: ufs-tick
> > > +      - const: unipro-sys
> > > +      - const: unipro-tick
> > > +      - const: ufs-sap
> > > +      - const: ufs-tx-symbol
> > > +      - const: ufs-rx-symbol
> > > +      - const: ufs-mem
> > > +      - const: crypt-mux
> > > +      - const: crypt-lp
> > > +      - const: crypt-perf
> > >     phys:
> > >       maxItems: 1
> > > --=20
> > > 2.44.0
> > >=20
>=20

--BPJ3krEP7ZWCC7l0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhf/UAAKCRB4tDGHoIJi
0jVLAQCdNb1Gih80RDqdXRY3kcs4MBVqtfkDT6i122nbuJOL1AEAx+wKLmQLY3RJ
Ld/HWV+CNWWPYqHyLYE+D2RFn9PYlAo=
=2ddv
-----END PGP SIGNATURE-----

--BPJ3krEP7ZWCC7l0--

