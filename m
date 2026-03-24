Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C337F54ACF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 16:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEX+DZPzYD9qo5oxb6TmutuNkT1eSqBoULsxdSyp4Ns=; b=Mg8m62+3eLll2vxkhpCsSVXItF
	zkHpTettOG6a3eVTegBdoSKr2I4x5pnqvcc1gBNEdbF6FwSR+V5g2Te5pm4f+F1864gsAbE1vTN4X
	jQTA2a1dZeuJZGOeL9euTWin5jO2c4YaeIqErRrxyu04S2lf4lxl879evR+1n96W8+2C6Yi/ym2uq
	4Golz9958RHWxfEsIidwd3FeIZMgpbRsIi31mc1KR276cIyE29AlbncP5WYgOsnleKK/CSXi29GAx
	H8/Y2NPQtjj68U3oT67bfnjScGw8XF2EHUFMp9Cqqmt3RX/uH4rRqys5WeM9RHmxI9XV7PSUlc8FY
	YwsSfYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Ta-00000001sVH-2VlT;
	Tue, 24 Mar 2026 16:19:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54TY-00000001sUn-0GvR;
	Tue, 24 Mar 2026 16:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 326F443EB3;
	Tue, 24 Mar 2026 16:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C59C19424;
	Tue, 24 Mar 2026 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774369167;
	bh=Vzn4kK1OCgM0Du86XVzwCGWpQkxeiTsel/ZSclDtI4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeoOa94UORI96bBXQAySKUUV4lPOU5GgV/F0PP+tM2+qfdQcPDPGORvycEu59NGMf
	 GmeBMCuc743ZB9v9NfJXzeHDR3P5uvVcFVNOE1vs07g/S8faGrHZEmMm6SciO+NtT/
	 itfrqauIjX4n8AESW/eczPc4YcufV1pQvT2fu/c20aWivWwVynKVSZMt27gE6B5D7h
	 GRhCtnyvt8KjFoGPzNF7KiuIl7F/pzVCQwx2J9J2IxSn5Gv9QzvBg/Rd0nK6d8KSQ2
	 XtzpVMl4U/giunzl+qDtH3JUKpyC7MQCK5PE2hCdJppdd7SSFUPJUSK8Pm6n7nb74j
	 TFR5ztzBFWAaA==
Date: Tue, 24 Mar 2026 16:19:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bayi Cheng <bayi.cheng@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] [v3] spi: spi-mtk-nor: Modify and optimization the
 SNFC.
Message-ID: <9091b9d4-d32e-426f-835e-b62a933dbee0@sirena.org.uk>
References: <20260324062835.1747943-1-ot_meiker.gao@mediatek.com>
 <20260324062835.1747943-3-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sjEoEUTHZWdhbgFK"
Content-Disposition: inline
In-Reply-To: <20260324062835.1747943-3-ot_meiker.gao@mediatek.com>
X-Cookie: Forest fires cause Smokey Bears.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_091928_121273_DEF9294E 
X-CRM114-Status: GOOD (  11.24  )
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


--sjEoEUTHZWdhbgFK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 02:28:25PM +0800, Meiker Gao wrote:
> Changes in v3:
>     -this patch is a further optimization for version v2.
>=20
> Changes in v2:
>     -Use clk_bulk_xxx related functions to enable/disable clocks.
>=20
> Changes in v1:
>     -Add new function mtk_nor_parse_clk() to parse nor clock parameters.
>=20

As covered in submtting-patches.rst inter-version changelogs should be
after the --- so they get cut out of the git commits by tools.  There
doesn't appear ot be an actual changelog for this patch beyond the
(somewhat vague) subject.

--sjEoEUTHZWdhbgFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCuYgACgkQJNaLcl1U
h9BzOAf7BRKbdHMggUaXtpn7x4H6OdzYZO6/WAWJJz1vmMRz8ulzUUGezTKvUUa9
40SehQQSX1sukWrSh0OQSB5rDbbWOWXw6eX4MjjH73JrQo0J4EKakFKmPfLMDVqY
zhNMJv9jgZ2AF9Cr1DLa022zE+iaGyfR7e4x+LHVVbnXfH8pbzljlL7nIVfEbTI+
efYwSUmrLw/9S58F9UtnZPBh0DWzWm2feecZowRf0lLQa+U5zg/24fMsAN6iaKAP
9MvsvPiVg1/C7rfftkRppTcLboBVwEosCZqFF/hNtjufGxz/i0DpxaFtMBC72ZPo
Oqh7O7cKGclP473yIFVNwmPtGCtT7w==
=v1zA
-----END PGP SIGNATURE-----

--sjEoEUTHZWdhbgFK--

