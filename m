Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C81FC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJBOzbU8ZkdZ+pES7c4YQUpX1YYpEmLRFAn/N2SP+3E=; b=L3mcyVntON4MNhwXotCNAX91lP
	HUbnXVQJ6g/BKTvKuMnq3WjlvBo4Bj6LU0SMbgW+HGZgIVCW195fC9vGvGl1b+twXVKDLS5skdM22
	wdDXlI3lQe5Rto27NwJT1sCOjGsHV/pEOnkbnmXLN8Nwf8PGlvuJ110nVxFFiAO1aV+HdQ7eX6F98
	eLFcR2/vx1ul5ISsUCoTcB3qVsaSo23N0htDTsrKYKMDgeq5Y5Qeop3ypossNBR1safNegW1ZraYD
	jYd08OR633BKU3D5aeSLqjiiNIJ+L9eMifuRzYtNHuvPPK7jppnLU0LmnB0aMbOApkfpiw3oxHjtQ
	HaH7Rnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJdCU-0000000G84P-3McA;
	Tue, 18 Jun 2024 18:04:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJdCQ-0000000G83H-2ZMq;
	Tue, 18 Jun 2024 18:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80388CE1BE1;
	Tue, 18 Jun 2024 18:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18C9C3277B;
	Tue, 18 Jun 2024 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718733891;
	bh=WhsmaZClS4UFz8GTvpaAyLD2s2XlHPTwx0gfZZTBlm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feFRdtCvGTTIAP9lyJbb6CI2LQMs3uQPd5ICY3w2sZHug0Nco8+IRAxSDT9pINJw4
	 vtySzPIjoojNRfLVLMp21Ub0r2/5H4fx2fvmiXlU/EHF+Uiu7NFUyAxHlGQXvimPHJ
	 9fT8wVIsyZl0slxY2KL1KE5lMQTOOeF3tlXZ1BtXAq/as6Pm+JsVR6BXpO8s4QBQk5
	 q8XlRX06skbUrD5nJ4x9UJDFISaj/hRbVvl5Wh2LwS0ZenE2Y5IH0K159HVqEM1lnT
	 HZP5N/mRCDjC5Jte9DkDTy3af+XuOUU2P39n54kwQTIvnunAlpyBMf8dIuJWFTTx6X
	 1XKdQSH73ggDQ==
Date: Tue, 18 Jun 2024 19:04:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Nishanth Menon <nm@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 6/7] dt-bindings: mfd: syscon: Split and enforce
 documenting MFD children
Message-ID: <20240618-treadmill-acrobat-2c3969605257@spud>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
 <20240616-dt-bindings-mfd-syscon-split-v2-6-571b5850174a@linaro.org>
 <20240617-zoology-silica-2c8c78363b32@spud>
 <20240617-purge-family-c0c62b8e73d8@spud>
 <237035a7-3b71-4245-863b-f905ba97cda1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wjTlRL5JLkeRMMvv"
Content-Disposition: inline
In-Reply-To: <237035a7-3b71-4245-863b-f905ba97cda1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_110454_851245_FC754806 
X-CRM114-Status: GOOD (  13.21  )
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


--wjTlRL5JLkeRMMvv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 07:35:07PM +0200, Krzysztof Kozlowski wrote:
> On 17/06/2024 18:46, Conor Dooley wrote:
> >>> =20
> >>> +# Need a select with all compatibles listed for compatibility with o=
lder
> >>> +# dtschema (<2024.02), so this will not be selected for other schema=
s having
> >>> +# syscon fallback.
> >>>  select:
> >>>    properties:
> >>>      compatible:
> >>>        contains:
> >>>          enum:
> >>> -          - syscon
> >>
> >> Wow, this is noisy. Is it not possible to achieve something similar by
> >> making the select check for not: compatible: contains: simple-mfd? Or
> >> did I misunderstand the intention here?
> >=20
> > Ah, you'd match things then like the intel,lgm-syscon, right?
>=20
> Yes.

With the nits then:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--wjTlRL5JLkeRMMvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnHMPAAKCRB4tDGHoIJi
0krvAP0aqhQ2KBWtG6LP5XEOMKNZ9IKzejgi9k6qu3Dd2kE78QEAkFCluzr4U+fG
GR52nK/ZYKSX5nHm/SJ6mtLwLXgBMAo=
=OJJk
-----END PGP SIGNATURE-----

--wjTlRL5JLkeRMMvv--

