Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6A2D6406B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DU5QuVOyzhAw7hXCixNrZkCODVcCI8Ep+ikiO9EHdGA=; b=46LqqMfHKfeQHy+9lu07RM17Pk
	WD27sCSUEFDGbaU+woh2MSPxTatXAjxqjGf4fAm4bLm0XVGDG+f+5j1UhkbSGQq9yTtxQg/SALpFE
	2Gu7jqw5l4yVHbc+C2sETEVORzAmKTKJlkEqFBp4K3wElcTb30yaW45OTbfFlr/0B1rCTAHcjseeb
	OYbrrhgR/wdGQ0BAfjXBHaiIBainY4r6UYq8gIviDIR/IryUKRr5njZl+8+8XhEr3KJMiwsT25+/f
	8NK1nri4y7oYU6OoJFo6nd0P/Qh9RNPRCMioxmGonjrLBlBDCZny2V91AcSba5390HsNOizPknP5r
	X7IiVf0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SVz-0000000BLIu-2UOo;
	Fri, 08 Nov 2024 17:11:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SPB-0000000BKC2-2lVB;
	Fri, 08 Nov 2024 17:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADA9F5C5BFD;
	Fri,  8 Nov 2024 17:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA6AC4CECD;
	Fri,  8 Nov 2024 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731085456;
	bh=3C86MS26GFsBNxBdX5coV7T2cbUFhcZGxK90XHY+fok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGrGiSKcZQbMXZTSBSYdn8vJekAayoGdFG430Qm2ducS0aEnOTZYxlpcVJm0fLPw8
	 fgAXTnS057nIxxw3ZKYg0ZijAGfLdSHZFrFXLY9LJn36/zCUZNaXMTnQrmSNbdFNDi
	 WaNNHswlmqJG1Qv0dr+BDJw3Fh52QrBgayYKvNE8CaTfEKFPPRZ7oHhFlvQ1KdmnEq
	 sfLv0A4E+R3VkkPjUfzwk1bxx3DR7KUNZJubkoiPPGuH76X87DXXZan1aLPEoDVxMy
	 a7azS9OujT0vdtp0R5hNUAC5Qdk8xZ6DlEJQBbK3D7L3PEfVR7nSZdMnbGjvVfTq6d
	 DN2ZB4TvuVhLA==
Date: Fri, 8 Nov 2024 18:04:13 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <Zy5EjY_oQaRbb5MY@lore-desk>
References: <Zy3OTQ5CwPqtaeLU@lore-desk>
 <20241108163716.GA1664097@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoE1DOBmsT2pIPHJ"
Content-Disposition: inline
In-Reply-To: <20241108163716.GA1664097@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_090417_802810_0BE802A6 
X-CRM114-Status: GOOD (  24.11  )
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


--aoE1DOBmsT2pIPHJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Nov 08, 2024 at 09:39:41AM +0100, lorenzo@kernel.org wrote:
> > > On Thu, 2024-11-07 at 17:08 +0100, Lorenzo Bianconi wrote:
> > > > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > > > > In order to make the code more readable, move phy and mac
> > > > > > reset lines assert/de-assert configuration in .power_up
> > > > > > callback (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
>=20
> > > > > > +	/*
> > > > > > +	 * The controller may have been left out of reset by the
> > > > > > bootloader
> > > > > > +	 * so make sure that we get a clean start by asserting resets
> > > > > > here.
> > > > > > +	 */
> > > > > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > > > > +				  pcie->phy_resets);
> > > > > > +	reset_control_assert(pcie->mac_reset);
> > > > > > +	usleep_range(10, 20);
> > > > >=20
> > > > > Unrelated to this patch, but since you're moving it, do you
> > > > > know what this delay is for?  Can we add a #define and a spec
> > > > > citation for it?
> > > >=20
> > > > I am not sure about it, this was already there.  @Jianjun Wang:
> > > > any input on it?
> > >=20
> > > This delay is used to ensure the reset is effective. A delay of
> > > 10us should be sufficient in this scenario.
> >=20
> > ack, so we can introduce a marco like:
> >=20
> > #define PCIE_RESET_TIME_US	10
> > ...
> >=20
> > usleep_range(PCIE_RESET_TIME_US, 2 * PCIE_RESET_TIME_US);
>=20
> Unless this corresponds to a value specified by the PCIe base spec or
> CEM spec, this macro should be internal to pcie-mediatek-gen3.c.

My plan is to add it in pcie-mediatek-gen3.c. Do you think PCIE_RESET_TIME_=
US
is too generic?

Regards,
Lorenzo

--aoE1DOBmsT2pIPHJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZy5EjQAKCRA6cBh0uS2t
rGkcAQCmqi+1zEy2XOSZkUGbzq2pUeWEnbeWTrheUkqUYyh/HgEAsizdeFxs3CU9
t94Gy0H3snrTSXOo+4M43gZBzfdn+g0=
=jWRN
-----END PGP SIGNATURE-----

--aoE1DOBmsT2pIPHJ--

