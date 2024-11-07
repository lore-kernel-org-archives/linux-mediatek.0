Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8CBD5D680
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2024 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmnOEj5dXMMf0PRnH3f6x/+FCcnYmXYqjRS29botuwQ=; b=isMdSDPWbEZOQE6XpQeHy/5hmB
	3ZVPLi3reqk+0fcJRzrKMAMZsah2jzc2u2I88Z8nSB+S8AYY6lCcNy9XEQQHgLHPcYN2uEQIDj0Di
	2nSLpayuZbXdkilVLI4Cf4X2Me4Ud/0O4uRA0BhzSMxE19OGQaf/JP6+9i+dJyNbrmb4aApon6cGB
	lFXYAxYCJRZushf9sT3o6EiH0qEX4gNOeqg8yI+PPdoFI+wDdnN1wQ3WDl6wal5y3a4CNGrxGUAqZ
	FZjMsOUgRZVyKawKESpfeKpLiNHYAXnzLEjZQpOYgCuB1rn5hV62tWX5SZPrm9gJNWnMSszW5X8Xd
	gd9FqUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96pC-00000007t1L-3rAg;
	Thu, 07 Nov 2024 18:01:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Vs-00000007fzp-4BCu;
	Thu, 07 Nov 2024 16:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F7C5A44895;
	Thu,  7 Nov 2024 16:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7414BC4CECC;
	Thu,  7 Nov 2024 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730997458;
	bh=LOjqdLJXd4OpI4uxoxe81wuTDGMChDa9G9O5Hv18mqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7JZeh+IeOQECb17zMO1os2mGY6G+f6EoIue5B4gZosgSMwIpCGGbBLQ+Uj44FyKB
	 kx2qRP2QsXarPtPq83HZfuTIw0oKgoaMBvwTFSaytiqZWeSv9ynVCkznF7QUw2+nA0
	 KRMDLUUIwF19Qe5it6+LiYDv99TmVVPvhyWScNXKhZh+1Nn+T/pSEnJbq2SJdbPQSG
	 P6DAdIN3UVCP7BqNE5tZmty2KfOibSFfVi4HKOpbQncHTKGzJlZQaCGa4uUND3i9j5
	 FoJsKWmfl8SLKxBEMX1OKtRDkamva2Bbpq0y7jEtNi41LT0qPcfpT0v+fkriLLNU2G
	 foC8On6Dsg00A==
Date: Thu, 7 Nov 2024 17:37:36 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <Zyzs0E6c6FZNK6j9@lore-desk>
References: <ZyzmFyRYDHX0W6bB@lore-desk>
 <20241107162136.GA1618287@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jWe0TsNLQ5QwO6hz"
Content-Disposition: inline
In-Reply-To: <20241107162136.GA1618287@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_083741_238611_3725259B 
X-CRM114-Status: GOOD (  15.98  )
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


--jWe0TsNLQ5QwO6hz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 07, Bjorn Helgaas wrote:
> On Thu, Nov 07, 2024 at 05:08:55PM +0100, Lorenzo Bianconi wrote:
> > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > > In order to make the code more readable, move phy and mac reset lin=
es
> > > > assert/de-assert configuration in .power_up callback
> > > > (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> > ...
>=20
> > > Is there a requirement that the PHY and MAC reset ordering be
> > > different for EN7581 vs other chips?
> > >=20
> > > EN7581:
> > >=20
> > >   assert PHY reset
> > >   assert MAC reset
> > >   power on PHY
> > >   deassert PHY reset
> > >   deassert MAC reset
> > >=20
> > > others:
> > >=20
> > >   assert PHY reset
> > >   assert MAC reset
> > >   deassert PHY reset
> > >   power on PHY
> > >   deassert MAC reset
> > >=20
> > > Is there one order that would work for both?
> >=20
> > EN7581 requires to run phy_init()/phy_power_on() before deassert PHY re=
set
> > lines.
>=20
> And the other chips require the PHY power-on to be *after* deasserting
> PHY reset?

I am not sure about it, this is the only Airoha device I have.

Regards,
Lorenzo

--jWe0TsNLQ5QwO6hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyzs0AAKCRA6cBh0uS2t
rOdGAP9wZ3x/72rt3z5VA+CvmxyOE+smiIxqdLcxqQ5DYJYKKQD+OzuuGmCFKK6b
otItaue3hFQPfCMyI9kM/cMtpP5dYQI=
=M/rn
-----END PGP SIGNATURE-----

--jWe0TsNLQ5QwO6hz--

