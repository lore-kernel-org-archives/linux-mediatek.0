Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205D7C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 21:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgUs4FW5OR1PlLFa1OtrvIKB52ZK/hQU0peTghqph7k=; b=rHBpt5dIJwcrvIsRYbrpjtckfX
	x5qzrEMFcOqOjceUi5LK38JZECRklLCL67SCGiFI8+OCjab+2rAMZxIKkEEq2Ax3fH9nJupbcp3H4
	uVM3QkfXUJX5ML8V/GWWCDIBzfZ2UWgtAGvkRuz1N+54kKq3nxzAweCw/Maf2BEr+ixwQlTAgxi3e
	xh688prKW3eOnTcGwNLeuZpzx78C9T8mNIF5wnGKLit01SQ/O2Mzy+JXGWcQBodgfGA47P5IBMV8X
	x+X4fMrJDxZMfVvD4Pr85/JPj3gheZTb55b9zw4SzSi6ZzdlFflkRsv5lJ1nGwj0HEfpqPnnPh+Sg
	5t036ooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKm2a-0000000AeRV-2ykW;
	Fri, 21 Jun 2024 21:43:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKm2V-0000000AeQZ-2wu3;
	Fri, 21 Jun 2024 21:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AACC1CE2F7A;
	Fri, 21 Jun 2024 21:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798CCC2BBFC;
	Fri, 21 Jun 2024 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719006201;
	bh=NlsjIIwZsqiq61/qJDZqhcMAQVsvrEzr61a+FqMM90E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXifCqrSRwwIv9dotfeyYZXEQsNDU8wFIcmMrnZZfV5a2RCPD2xrJa2QoFKyxMi6A
	 udO5ujeYXgHK8v2BY1EXxon4kT4sBqDksklC1yFCBEU4IEBSiAf+z3jO3NMmFnKi9G
	 vY/p5+7PXaFBgzkJbDOvGa3dSfiIiVggDV2q55quJjLqcC/KJKYWnX3viIOS6uhdKX
	 g/DjQUxcouopEMvsw/LlZZP1Qs0qrg/iCKIqOLMRNCMUHKCFlTZYXqPhJRkba+XNI5
	 5Q+poP5dupMfdftHkeFzZxDpfkq1EorXv6ZMBq4azLr4fQk5GdbUCCyMWVV5UdhUzM
	 nWcsUv3l3EhQQ==
Date: Fri, 21 Jun 2024 23:43:17 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 3/4] PCI: mediatek-gen3: rely on reset_bulk APIs for phy
 reset lines
Message-ID: <ZnXz9Rqj-OBecnUh@lore-desk>
References: <e8ab615a56759a4832833211257d83f56bf64303.1718980864.git.lorenzo@kernel.org>
 <20240621175138.GA1395691@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R0v8qdAaXW0oUm/u"
Content-Disposition: inline
In-Reply-To: <20240621175138.GA1395691@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_144324_121540_BA42380A 
X-CRM114-Status: GOOD (  22.85  )
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


--R0v8qdAaXW0oUm/u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Jun 21, 2024 at 04:48:49PM +0200, Lorenzo Bianconi wrote:
> > Use reset_bulk APIs to manage phy reset lines. This is a preliminary
> > patch in order to add Airoha EN7581 pcie support.
>=20
> If you have occasion to revise this:
>=20
>   s/rely/Rely/ in subject
>   s/phy/PHY/ in subject and commit log
>   s/pcie/PCIe/ in commit log

ack, I will fix them in v2

>=20
> > @@ -912,7 +927,13 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pc=
ie)
> >  	 * The controller may have been left out of reset by the bootloader
> >  	 * so make sure that we get a clean start by asserting resets here.
> >  	 */
> > -	reset_control_assert(pcie->phy_reset);
> > +	reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
> > +				    pcie->phy_resets);
> > +	usleep_range(5000, 10000);
> > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
> > +				  pcie->phy_resets);
> > +	msleep(100);
>=20
> Where did these usleep and msleep numbers come from?  They should use
> a #define that we can connect back to a spec.

I think we can get rid of the first usleep_range() since we need to
deassert the line just to avoid unbalance in deassert_count counter since t=
he
reset line is shared (the line is actually already de-assert). I will add a
comment to clarify it.

>=20
> These delays should also be mentioned in the commit log because it
> appears unrelated to the conversion to the reset_bulk API.  Actually,
> it would be even better if they were in a separate patch, since it
> looks like a logically separate change.

Regarding the msleep(100), it is not documented in the vendor sdk, I think =
it
necessary to complete the reset before initialize the pcie-phy. Since it is
required just for EN7581, I guess we can move it in mtk_pcie_en7581_power_u=
p()
(in patch 4/4) before the phy_init(). What do you think?

Regards,
Lorenzo

>=20
> >  	reset_control_assert(pcie->mac_reset);
> >  	usleep_range(10, 20);
>=20
> Unrelated to this patch, but it would be nice to have an explanation
> of this existing delay, too.
>=20
> Bjorn

--R0v8qdAaXW0oUm/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZnXz9QAKCRA6cBh0uS2t
rAXuAQC7ZW1fjIBBpL/XoNuhK6+b6vaF41Z7cth8QCojxqHJxAEAh1ToqvlrHZ+x
Tt36J4vBfXjjJDp88aVO65aDVOcK/gU=
=JtUj
-----END PGP SIGNATURE-----

--R0v8qdAaXW0oUm/u--

