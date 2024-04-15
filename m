Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67E7C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3z4onGCvDJrBUsCm728Gb1WReSu//4vnR4wJyG8CsQ=; b=PFxTQkPM0ax7kRor2ZNg9PgGCe
	7TxyoRL/qV9NA9oStc0IGQwuwrgZXmavIX8BoqV2QgUMAfa9+EefW1J6Sp5heUMccLvUAUZHI0lTN
	SW4f11t7K/Fm68ZgqT4u6ahMaQ4yQs9h04FrqmUgX60fEtujCLL1Z4z2eCUmhEtAFOx8yKCMZnlus
	wMHnz81uW1bqaEJ7qrz3mQgwpqRulNcUUt01fMPy3pr7B4MlE++B+8smMbcJ10Ed1Np+3JZa3S5YI
	UC+vmL7XBtOlOsfkbRxOLk/GdW6+GR5mr4dZrpoX794faTBxhB7YTwg7CS6wJ7Sg2/oVeZ/Uwo56z
	2NBKZ83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPly-00000009EGs-1MmE;
	Mon, 15 Apr 2024 17:05:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjd-00000009CNJ-2OG6;
	Mon, 15 Apr 2024 17:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9FD8DCE0E66;
	Mon, 15 Apr 2024 17:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D0AC32783;
	Mon, 15 Apr 2024 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713200590;
	bh=qlN+7KOkKA0CC6PwtWEV65NHKwg6/a7Wj/1sIx6SWkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdOzrUHQIQ+xohAPgwt7yFhGS86vNEzoGpUkIeGZQPAm8I5BtxYz0mf3gcUoP2Pzs
	 M9hBbh1YXWRj8qCr0oraEJhFZyaL/Epobq7yEVmzC8yRzIPeCDxiYogc2sbJcsg5Fb
	 J8wKUf5NmpyMFsh6ZCTmkkPau4UbM9YaxoLDTPM++s0eNGtdwL/VtIWvlMGPAums6X
	 GDCKNwni4lg9SzyMTXGRE/PLQhzPDv//j/mAtdbBtwhYGrAlI4ItFqg2ZlXnB2SuH3
	 CSjEut9+y8YEMEUfx0ntXYfH2Em+pliaxvNLNsWhjCb5zBM/Xo1fcyhco+2aLeLE1o
	 pkAmshwX5thXA==
Date: Mon, 15 Apr 2024 18:03:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>,
	Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v10 03/21] dt-bindings: hypervisor: Add MediaTek
 GenieZone hypervisor
Message-ID: <20240415-emerald-chief-5f27532d65bd@spud>
References: <20240412065718.29105-1-yi-de.wu@mediatek.com>
 <20240412065718.29105-4-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C6BOR4TK2ik6wg8F"
Content-Disposition: inline
In-Reply-To: <20240412065718.29105-4-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100314_823764_2E0236A6 
X-CRM114-Status: GOOD (  15.17  )
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


--C6BOR4TK2ik6wg8F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:57:00PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
>=20
> Add documentation for GenieZone(gzvm) node. This node informs gzvm
> driver to start probing if geniezone hypervisor is available and
> able to do virtual machine operations.
>=20
> [Reason to use dt solution]
> - The GenieZone hypervisor serves as a vendor model for facilitating
> platform virtualization, with an implementation that is independent
> from Linuxism.
> - In contrast to the dt solution, our previous approach involved probing
> via hypercall to determine the existence of our hypervisor. However, this
> method raised concerns about potentially impacting all systems, including
> those without the GenieZone hypervisor embedded[ref].
>=20
> Link: https://lore.kernel.org/all/2fe0c7f9-55fc-ae63-3631-8526a0212ccd@li=
naro.org/

> +properties:
> +  compatible:
> +    const: mediatek,geniezone-hyp

Been avoiding this binding every time it shows up because Rob had
already told you no and hasn't revisited it since, but I feel this
should be s/-hyp// since that's redundant information.

> +description:
> +  This interface is designed for integrating GenieZone hypervisor into A=
ndroid
> +  Virtualization Framework(AVF) along with Crosvm as a VMM.
> +  It acts like a wrapper for every hypercall to GenieZone hypervisor in
> +  order to control guest VM lifecycles and virtual interrupt injections.

The description however doesn't really make sense. The binding claims to
be for geniezone but the description talks about something else entirely
that "acts like a wrapper" between the OS and geniezone. What is the
binding actually for?

--C6BOR4TK2ik6wg8F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh1dxwAKCRB4tDGHoIJi
0jVFAQCJXfT7nWUYAhn0e8Ajkn5u7oxR2Cu949hDGp7nK9saPAEA3b+xCJOh8wV2
Hv0FfTlG1rexad0mg/r96/sxZi/z9Qg=
=e5RQ
-----END PGP SIGNATURE-----

--C6BOR4TK2ik6wg8F--

