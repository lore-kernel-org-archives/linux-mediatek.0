Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ED3EB64DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEBn6e+fYz7AhV051ZDXT5ospKb3k9meMO3A37lVuJA=; b=x2zWoxZddLwyb4hdPq4lVFRNXV
	xz01donjQrwzaP1lcuJ6JzBfvSFAkE3+ZpOkGJ+2SrO1fzs+zAEsqxg6SxyvluflaW54ptsv8Part
	xBCBoAwIp1eOfcogJQGG3iEyu30eTHeDIUTSl4UH/cBh6phKAeWYnDbHcUHHysxg2/QwXpKas65/M
	o8wF7sFDq46Cd0tTID7jbchwMolFVdqH6/RZx3W3j61jDxZj9HClaGXI2AbztiMB8yohrraOApNlL
	qG8k/uTfE0gRloxQKCXXOjxxBKlNUeOSFxNy0di/mA2aa7hd/lrVc4Li9we1izWcsHh7nRZV5SuM6
	bqfASedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNB4z-00Gbpr-1C;
	Sat, 22 Jul 2023 11:47:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNB4v-00Gbou-2x;
	Sat, 22 Jul 2023 11:47:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 365F860688;
	Sat, 22 Jul 2023 11:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196E5C433C7;
	Sat, 22 Jul 2023 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690026436;
	bh=qEBn6e+fYz7AhV051ZDXT5ospKb3k9meMO3A37lVuJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2RDHwQcwB/hLm5ypoZMeeWNVB4tQO9WizZ0URooeHAORKqFh15tFh0Or0jb2ZfkS
	 cMp4BYRk0nDvV5F0mjuLFC5TffS3fxDPqBYx9O9aJiNZ2ejRMokZCdVJG9U73+DXUF
	 ubg9ETXOapXptJTnpVsGsaRjuby9kuZJcI3fZk1wxTg0S7b3K20Znsj4io7IUQGljY
	 pMiIBKZAIvQSqn9UIahDsxYgjXG310C8xvcw6yKASZ9qhB7hGapHbEaPGhsGo/uJ7p
	 Hvpl3cWiaYgtNQJ4LCq2ACFH2HKqBcnpKL7Ht7z2kGapeb7dYqMw/QB9xpvwViuC2+
	 RfGWIWgrH/w1w==
Date: Sat, 22 Jul 2023 12:47:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Greg Ungerer <gerg@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Message-ID: <20230722-blip-sleet-8c3a75b1c911@spud>
References: <cover.1689974536.git.daniel@makrotopia.org>
 <5a333fa431562efed461ec5a987d6982db2ed620.1689974536.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S3k3Sb20TyWQtpEz"
Content-Disposition: inline
In-Reply-To: <5a333fa431562efed461ec5a987d6982db2ed620.1689974536.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_044718_014742_43A77D41 
X-CRM114-Status: GOOD (  15.34  )
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


--S3k3Sb20TyWQtpEz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 10:32:10PM +0100, Daniel Golle wrote:
> Introduce DT bindings for the MT7988 SoC to mediatek,net.yaml.
> The MT7988 SoC got 3 Ethernet MACs operating at a maximum of
> 10 Gigabit/sec supported by 2 packet processor engines for
> offloading tasks.
> The first MAC is hard-wired to a built-in switch which exposes
> four 1000Base-T PHYs as user ports.
> It also comes with built-in 2500Base-T PHY which can be used
> with the 2nd GMAC.
> The 2nd and 3rd GMAC can be connected to external PHYs or provide
> SFP(+) cages attached via SGMII, 1000Base-X, 2500Base-X, USXGMII,
> 5GBase-KR or 10GBase-KR.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--S3k3Sb20TyWQtpEz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLvBvQAKCRB4tDGHoIJi
0rTAAQDHnk1AXL1i3JuZmYT+/xX+kwzUCVfTJwQJkX31Ipzx2gD+OJ94P3rAvdSL
gWeUD5nqQVtppRlDGSgQ2QX6lSK3Dww=
=dmf1
-----END PGP SIGNATURE-----

--S3k3Sb20TyWQtpEz--

