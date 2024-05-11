Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7034DC04FFE
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 May 2024 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4VKieaSxJD4O9fan0sp4G+844Bs3wrwI3hZbLLfkXY=; b=ZyoJMkUbp8LG1T9HhIrwJy2bah
	JIdAuwgE7CcLGJDnZ+eMVRAMa4FDSFTxxpmqjou0sZwxabqiCsYdCx+2ym45dMFnpotbxkgzH+Oiv
	qg6DdvEg5mVdPVx0slxlwq0++aaEgYKZldH6YC+GFjFFHYUYQhgyzJAvyugrV1osLOxtYQCZe0QOw
	U1a6MQYttArqKi2VqaL5aIUzZ8yP1fhkATAv9g59KM+w3I5baRUFbhQySQsVi/9F2wDhcaXd9ckSk
	Jhj6ix7y9vhkBxCHt1dcbRsFWJzitC5rJFlaGLZxU/hShdeH4HVBXixKbE96lGsVKCBDmgLXiEt3S
	+GZXaUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5m4k-00000007uwe-2uMn;
	Sat, 11 May 2024 12:43:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5m4g-00000007uv2-1epV;
	Sat, 11 May 2024 12:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE4C0CE04AE;
	Sat, 11 May 2024 12:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CA8C2BBFC;
	Sat, 11 May 2024 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715431412;
	bh=d4VKieaSxJD4O9fan0sp4G+844Bs3wrwI3hZbLLfkXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMvdel0DY2pBVYj1A7coO/B+rMIO47XYcatES8h6dp3q/a0wHnEdYkkQhKc0kHM6F
	 R5siUi5TNnYhyvsFZ3ct4vYXvIO//GNTkmIVazERoyp2vZdrDSPeZwuFlzD5viOLZF
	 qu51GpXkvw7//RsxRf0s+wfmt9GuzAx/faZwnoCK0QODpe4erqsiy51Fu8KCroI9Er
	 SXWB3N9Bzm3bkRLX+vpX3xIb+298XdKui2spF938GLhwbl3bb8edtYKBLnA8JzMxcc
	 nXEESPNyPUFg8xwI6zZxJpcq4fhBlUvadsbA95jMtmYdMdcaijYUFF6T1DLpx9XJ8q
	 tOTHuogfZFawA==
Date: Sat, 11 May 2024 13:43:24 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240511-trailing-confiding-93e4c97f2adf@spud>
References: <20240510123018.3902184-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BSbcBdeN2vnKatp0"
Content-Disposition: inline
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_054338_640746_C9FEB295 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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


--BSbcBdeN2vnKatp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 07:30:14AM -0500, Rob Herring (Arm) wrote:
> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This batch is mostly from arm32 platforms.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--BSbcBdeN2vnKatp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9n7AAKCRB4tDGHoIJi
0gG1AP47sdu3A8RqntUv+sHeomfUnc/kOanj3aHZojsdbapUpAD0DOQrlhFkp8Gc
XbFn8V4hiQpWfuV/HoEcegLy+fB9DQ==
=jck4
-----END PGP SIGNATURE-----

--BSbcBdeN2vnKatp0--

