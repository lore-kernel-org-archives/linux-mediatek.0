Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566BCC3064D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMbeDDW6goxNKuoVwyengTTryqCTOwgK4iJCJNAeHJM=; b=CBDf7/2NHhUavThfROclV4iMcM
	fqGQZsq+iyS99x6yEWPYc2dNwiH+XxTUG17JG0GiohhnMyWxSTzAs1MKcBp7PXJ7H1CdjsoKAe2E0
	TdY7GCO8serDitYWlmGDGK13Q48tFFf+LidWdpcOjsUSWk2FN2Fa2qnirtQ9WXoEqgr5l9yxd2Abl
	oOpM1pOmNbX3bJ7kmAQuOAtqyvp4vMBH/lK9QruXQzNJit1NRQZCxWEbqiG3r1AT+XSH612opC7ux
	k8AN0Dl4cX78Cz/y7FJXtmDEyiK99/CYt0fduEb4p1/eOCpBFYfn7jRa43PlnLMJdNT2z5zQY61Hp
	RO/Ww5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZZI-0000000677U-3OLd;
	Tue, 02 Jul 2024 09:12:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZZ0-000000066yC-1QuA;
	Tue, 02 Jul 2024 09:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QMbeDDW6goxNKuoVwyengTTryqCTOwgK4iJCJNAeHJM=; b=GTMzzxYYL0I3L2tBhVT6n3mgcP
	rVKdtIPwn77FrlqvOAw/PvEtGxwJHkVGIFIbD1bNOVSAc6fMd04j3bk6YiAjtp0l3duA/4U1KLgvE
	ksD9Dm7gePFhmf25jflWcJ2+COeZAY9pbszEcjZrnFoRgPMqS2dwieP/Y4SrJbsYXsxlH3z/f3/6a
	L3+0DY4hNY6hFS80g7Yw3HVj4OoyorWP7VXbpczOr1s/c07saxDcZxB6CHzcbAu0TmbnOdPUfqNeD
	NHc+irTpcD8LDlR0LgRYqVsR56Er+TJas0oESV2U6eFySV4RTvoYY4oaAYen1WKNIPeXg7eta/NbS
	fZuKaZ+A==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZYu-00000009nZS-1yHv;
	Tue, 02 Jul 2024 09:12:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56F35CE1707;
	Tue,  2 Jul 2024 09:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4443AC116B1;
	Tue,  2 Jul 2024 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719911545;
	bh=QfDqM+46RuWvbEKiE81isawn+VstMt3edIuywum410E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ52Eem6mvS159XLg0r9UR2KRx/n++dhirNQSlh8sJD74YmiG/PtmB1XQzqZZb9Qi
	 PKBMWn5qo2Na1F5LZrrYvg9+by9VnWVH/4Vs2sAgIHXADVognnbpX8egw4z3VirDiZ
	 VPpkrdh4ktFXruFAYMdjJXC+SW7wmhDKK/Rn1EXIkF8efrNEu7ZKw3cAWwcetPxem9
	 He4Y2cKFlKff4qqTYs5bWv9HtRD7AvZX21F3HcrMWI3OxOsdgmq8nuz08OMpRwI5QE
	 cNtgztlvlq4IypiWB3lxRsdWZTY0mFXpFDHhH2i4R/fUMBvb3j5idVz7w3OOcOOzlz
	 f26vy5hZSJMMg==
Date: Tue, 2 Jul 2024 11:12:21 +0200
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
Message-ID: <ZoPEdU0Eg-f-mbgC@lore-rh-laptop>
References: <27d28fabbf761e7a38bc6c8371234bf6a6462473.1719668763.git.lorenzo@kernel.org>
 <20240701202156.GA15356@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HIQev7ftCHv4QrpC"
Content-Disposition: inline
In-Reply-To: <20240701202156.GA15356@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_101233_319446_2478FD24 
X-CRM114-Status: GOOD (  16.56  )
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


--HIQev7ftCHv4QrpC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Jun 29, 2024 at 03:51:54PM +0200, Lorenzo Bianconi wrote:
> > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > PCIe controller driver.
>=20
> > +/* PCIe reset line delay in ms */
> > +#define PCIE_RESET_TIME_MS		100
>=20
> Is this something required by the PCIe base spec, or is it specific to
> EN7581?  Either way it would be nice to have a citation to the spec
> (revision and section number).  If it's generic to PCIe, it should be
> in drivers/pci/pci.h so other drivers can use the same thing.

It is just the time needed by the EN7581 reset controller to complete the o=
peration,
it is not something PCIe generic (it is something just related to EN7581 So=
C).
Do you think we should move it in EN7581 reset controller codebase?

Regards,
Lorenzo

--HIQev7ftCHv4QrpC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZoPEcgAKCRA6cBh0uS2t
rN35AP9EfUH7hNs7C3dKX0KvkFnD1J8wnkXNrAJzJw0HtLwpmAEAn6bO3foyRPn3
JK+WBsXC8supqVXB8FsdyzUHrHGzTgw=
=p+m8
-----END PGP SIGNATURE-----

--HIQev7ftCHv4QrpC--

