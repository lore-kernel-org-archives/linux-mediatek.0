Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A95C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+uOJWRfOOVtlTBySmg32nz3qSkxlHDeOSpYS+o/RlE=; b=vc8WEAcTSo1j5npX1oD6VqomIA
	lZ3v96xpgJR2NKiEzjth7DrRrkCNFpX+VQs+kyNhlZyyXI61xo3KVmozOOrTswuXScMSISn64xVPJ
	Jn2HCSXmfjXX66BtM1GF3C7JeqG1xDcrrSKWmVdyjKvfRRE91QT+yd8XcETKmRn03F41Z0J836Mw3
	wWVoKuAgUubvUYcN0t5N+uJIoOo8SeIaDj36WwxprTRVWMBNbKRY3BjLXisUQW+T/fG8Ykr73hRkn
	dNLnUIHY+SKUuElHzE2rSoNbK3nJZklnFhmfTZXdj8WrQAW6LDpgndKHIVdp1v3m9aSCWHTMbOw6o
	vZmVeWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plsuQ-00FP3X-2d;
	Mon, 10 Apr 2023 14:54:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plsuN-00FP2G-26
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Apr 2023 14:54:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1FE4610A1;
	Mon, 10 Apr 2023 14:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92D9C433EF;
	Mon, 10 Apr 2023 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681138454;
	bh=9+uOJWRfOOVtlTBySmg32nz3qSkxlHDeOSpYS+o/RlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssAqJLGeCv4udxLGiYHv6O38FhSmjbqX2wp9b/hgpG2OED4HO/QFSXcN7Z2dUrNq+
	 eI+Ff5vJYt05iDKQToytkFVNzf0IqjYHDz0IXgMTJffGfKbU6mvRuKXcO2RzblWn+k
	 aKcoF4an4eHpQEVNUsdU4fCQo3ubojUDJ5rHL9GBGelkJRW2IJX/pK4u0CWKlfbr8T
	 UIhaxAsOtFMxz7+sip5msZdAf9PMqkKj5SPxuokS1kwM1dOBPILyofwLFpO/LUAjGn
	 oy4oM4CdTOLZ5v5PQV4X+MlN1WDFIp3Dn/aEy4kNRgDcFUX3cWZL/Yd132KaCrWMgr
	 Pc8EIbkmSVvgA==
Date: Mon, 10 Apr 2023 16:54:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, kuba@kernel.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 net-next 00/10] mtk: wed: move cpuboot, ilm and dlm in
 dedicated dts nodes
Message-ID: <ZDQjEkTstngxib/0@lore-desk>
References: <cover.1680268101.git.lorenzo@kernel.org>
 <20230406152511.GA3117403-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mbdi1ZojGS1vdtOH"
Content-Disposition: inline
In-Reply-To: <20230406152511.GA3117403-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_075415_749173_C5F9EDEC 
X-CRM114-Status: GOOD (  14.87  )
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


--Mbdi1ZojGS1vdtOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Mar 31, 2023 at 03:12:36PM +0200, Lorenzo Bianconi wrote:
> > Since cpuboot, ilm and dlm memory region are not part of MT7986 SoC RAM,
>=20
> That's not really a requirement. Is that the only "problem" here?

I would say this series allows to be closer to a standard binding and at the
same time helps with uboot compatibility.

>=20
> Certainly going from a standard binding to a custom phandle reference is=
=20
> not an improvement.
>=20
> > move them in dedicated mt7986a syscon dts nodes.
>=20
> What makes them a syscon? Are they memory or h/w registers? Can't be=20
> both...

>=20
> Perhaps mmio-sram?

ilm and dlm do not have h/w registers afaik, they are chip memory used
to store firmware information, syscon is just the closest binding I found.
I did not find mmio-sram, my fault.

Regards,
Lorenzo

>=20
> > At the same time we keep backward-compatibility with older dts version =
where
> > cpuboot, ilm and dlm were defined as reserved-memory child nodes.
>=20
> Doesn't really seem big enough issue to justify carrying this.
>=20
> Rob

--Mbdi1ZojGS1vdtOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZDQjEgAKCRA6cBh0uS2t
rNnEAP98v7/BKa/Fd5y1OymB9T4LAXXAgNEIA7/LExkl8VzmzQD+L0fjplWxRgsc
nyGfpakLxtEGDs0uoT1Qtz4Fd7IzAAI=
=ri5+
-----END PGP SIGNATURE-----

--Mbdi1ZojGS1vdtOH--

