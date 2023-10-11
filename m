Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78604CD6E62
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtyTZwRx9VJwQiEa0WtFjLNrUq6KBphIxeSW4y28jWI=; b=LBuTYMBA/gaCmYpnkg5KpLaa+G
	/xS8KxH8kRJCI3z261Mcq8OCAdUceETt5rWfsE2wzSoctxpQiocgP0dQb5LSBqqIGy7t5u6btOmf7
	lvkqcsLfRAzLh9D5txe9j0HaElH1bizFCVXW4osyUbVg0OFtvis9lPG8cFIhFUFfvDeyqxnJvQGLj
	/RSCBqzp3gJZr1F4/0Wc23mI2iVXWW+m6Nd1uToYAj2+gO4AvP81el2C/VgtwgqJ0IfN+3FcfhPvN
	MvpGzUK+2rtFH/6St6Wc8pJAYkrqZS2IxrKrFnuSwY27kOLkBr+J8OSMMb3cK1kY1Z6wtiKyT12/z
	L+NBocCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXka-00Fmh0-3D;
	Wed, 11 Oct 2023 11:51:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXkX-00FmgU-1S;
	Wed, 11 Oct 2023 11:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697025097; x=1728561097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ENlus2EeTQNt1s8MBQ6wB9jKJrlt1afKoZ52u5TMDbU=;
  b=HvbC6nquEmWkApa2NPUe30i31DpE45cdQU5KYoKaiS7CjHanvnpFGMHy
   /uyKqTNBtNbaU14PO7unsXlZ6jCUX5Y0P3k7z9Ku58zCwKkbwKijIGU0V
   eC8Vs46I+hqTaKE7+B5vhqCsr38zR+cC4+mBEMFTUeAFidr7bpEJPbLVE
   yrXeC/mlwRgC7uJStmeV/c8eqxUtpEKkK6CIvCfiBGnzpMcEuF02891sY
   jjvXi4qfu4o9RH5tdE7wRZ8F2Onv9x3ohHo9g3cs45mHwikHR09yrGNZk
   PRAievXyXEuZ4Kl/TuSFw+3JcKgItSFM2ZufQgzdd+0JhKssaVD5Mng2R
   w==;
X-CSE-ConnectionGUID: y8hsGB0uS6iulb37QH09vw==
X-CSE-MsgGUID: U54n4S/AQx+1Z+UmFL2HYQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="asc'?scan'208";a="9992908"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Oct 2023 04:51:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 11 Oct 2023 04:51:07 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 11 Oct 2023 04:51:04 -0700
Date: Wed, 11 Oct 2023 12:50:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor@kernel.org>, <mchehab@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>, <moudy.ho@mediatek.com>,
	<hverkuil-cisco@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<u.kleine-koenig@pengutronix.de>, <linqiheng@huawei.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel@collabora.com>,
	<wenst@chromium.org>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
Message-ID: <20231011-perky-squiggle-fca1d9a208e2@wendy>
References: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
 <20231005104905.120544-2-angelogioacchino.delregno@collabora.com>
 <20231006-jinx-playing-261e5f41ff7f@spud>
 <d6386e5e-be7a-a68c-e592-1587380480d0@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rc+NsySQp8zSJPiL"
Content-Disposition: inline
In-Reply-To: <d6386e5e-be7a-a68c-e592-1587380480d0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_045137_684290_0E7131F3 
X-CRM114-Status: GOOD (  15.67  )
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

--Rc+NsySQp8zSJPiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 01:44:24PM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/10/23 01:36, Conor Dooley ha scritto:
> > On Thu, Oct 05, 2023 at 12:49:04PM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > The MDP3 RDMA needs to communicate with the SCP remote processor: all=
ow
> > > specifying a phandle to a SCP core.
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > ---
> > >=20
> > > v2: I've dropped Conor and Chen-Yu's Reviewed-by tags because I have =
changed
> > >      the description (so, the patch actually changed a bit).
> >=20
> > I dunno, you made it more informative so you could probably have kept
> > mine at least.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
>=20
> I just wanted to be cautious with keeping Reviewed-by tags.
>=20
> Sometimes it's better to drop than unfairly keeping, I'm sure that you
> understand my point here.

Oh aye, I do... And you did call out having dropped the tag, so I
appreciate that too.

> Btw, thank you!

nw chief

--Rc+NsySQp8zSJPiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSaMEwAKCRB4tDGHoIJi
0iZCAQC9J0G4ycoWSMYOY5WgTUDjvr4DSd9fL2rijK7twuzoHAEA+WhktU1Srb1M
dzXT1fXO1WpV2o/XUvwwDv6mWx8xZgI=
=79cX
-----END PGP SIGNATURE-----

--Rc+NsySQp8zSJPiL--

