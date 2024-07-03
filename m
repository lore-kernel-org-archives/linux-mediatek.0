Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F62C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29m2l6sxZl1GQS5CenB/1WWOowupjV9L4iEdfyCmRzU=; b=sAZ8Yvz/+cADUJKHCSiQtWFBrL
	ACnybvl4chdI/bsrtqOMvjW0GOrQ42RWPu0iokOiQE6XZVpTsI184snt8uXBkKGF/pwRXeMkUwBMe
	h7AoqEUOPCcvPQdXXm0HvK1JjzZizgio5h7jKKvmvc6Sowbm+Vot+aFua0Q3KviTcg24IOJug2D66
	wO80CC+rVQPU2QTZZ08Gevr9oFxtJTSENuTlFIrDNnXyeTXTmd0pM8c3DcJ8MXJ7Fh8pnk0xcVZ9J
	EpRYl8JFals5stPn7Wk92ulHJ2O8VJvA1IVFNkT61GCVaGVB2KqD+3yM2sFeotpvi0eNMXW/8PaG+
	FWKe+TTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1tA-0000000Afps-2qEj;
	Wed, 03 Jul 2024 15:27:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1sw-0000000AfnK-0i7D;
	Wed, 03 Jul 2024 15:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBA2F61245;
	Wed,  3 Jul 2024 15:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F5EC3277B;
	Wed,  3 Jul 2024 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720020420;
	bh=N4vxMVbN/1wWaojq7NWBk9zI796CImfymRagg0g64Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVEzViEmgTryvbo67ejqXputtnUtDQlLex3jcnTX6xdGCWISGhmyzC+ih0oDfpIZr
	 /epx8HHobf4nkLCTm8ypSxyNUkSSKWkxBi6s2axbegKM3uRWmqLXf4ULzWGwVfl82T
	 NBu9mIva+Hv8/67wsNpn07XitQe51XE7unH2n4/z1vP8FstR8fKTVy9y9aPZki4G06
	 eEo9qUJQu76mpbKd0HOKXTGS4+IWchtJ+qC70prlFh58dWHnuLiXqbdgrB6QhPDxNk
	 0+7x1DKFipZbUb9865pzc4ObczGt4kiKeau/CbSAiHGvyQZuUg46/fyVrA2V2hBo1N
	 vUicNMdh7rYYw==
Date: Wed, 3 Jul 2024 17:26:56 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <ZoVtwLI5nIRpS2al@lore-desk>
References: <ZoPEdU0Eg-f-mbgC@lore-rh-laptop>
 <20240702163439.GA24344@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MWCaVI3Z1esYwRTI"
Content-Disposition: inline
In-Reply-To: <20240702163439.GA24344@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_082706_339146_D6ECD10A 
X-CRM114-Status: GOOD (  26.46  )
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


--MWCaVI3Z1esYwRTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Jul 02, 2024 at 11:12:21AM +0200, Lorenzo Bianconi wrote:
> > > On Sat, Jun 29, 2024 at 03:51:54PM +0200, Lorenzo Bianconi wrote:
> > > > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > > > PCIe controller driver.
> > >=20
> > > > +/* PCIe reset line delay in ms */
> > > > +#define PCIE_RESET_TIME_MS		100
> > >=20
> > > Is this something required by the PCIe base spec, or is it specific to
> > > EN7581?  Either way it would be nice to have a citation to the spec
> > > (revision and section number).  If it's generic to PCIe, it should be
> > > in drivers/pci/pci.h so other drivers can use the same thing.
> >=20
> > It is just the time needed by the EN7581 reset controller to
> > complete the operation, it is not something PCIe generic (it is
> > something just related to EN7581 SoC).  Do you think we should move
> > it in EN7581 reset controller codebase?
>=20
> I have no opinion about moving it.  But it sounds like maybe it should
> have a less generic name so it doesn't look like a generic PCIe thing.
> And also a spec citation would be helpful for future maintenance.

ack, naming is always hard :)
I do not have any specific spec for it. It is in the vendor sdk and the Air=
oha
folks confirmed just this time is needed to complete PCIe reset.

Regards,
Lorenzo

--MWCaVI3Z1esYwRTI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZoVtwAAKCRA6cBh0uS2t
rEk6AP4+COe1VSjWr8FduLJECkrFJKAoJNbnCfjXkiRge8ZcKwEAtw0c8lHSfIsU
alNV8Cygnmt3ypUilONOyRTXJe2tPAM=
=uH7b
-----END PGP SIGNATURE-----

--MWCaVI3Z1esYwRTI--

