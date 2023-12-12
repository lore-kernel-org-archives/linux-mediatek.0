Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD89C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6j2cdwe4Jb7HuDYDkMryQlD1jH3nbeIofWSkJxbsqg=; b=Ub3dMcI5Mf+7f9t+mF3rxwToPu
	yGLWJ1D9g6PnHcw6nyZSFYiAYEwqZofIWumD6UhAdyIW5vQbTtxMJ7J82iMqxqmiJu4eXD3CwkASA
	0rwBHU5nAcFSDD0LpxEX8p5is8dTBbM6o7d/jdG8/J6JP1aBHAx0oT/aJVc3TSMAQ5fVO3bbu6eMf
	ouWAd0Ae9vLaWw567sb7qJUT2FylcwzSNKJpV0D5FeXYpNbvYU3zOLRNqpnt057S4+fAKS9YPyUdS
	PhlqSnJvIf5jES4JHNSf+Twf90mDyJG7Gf+3f3maRqkyO+bvIytBedmmMgvPGkwpCEVNczl7ezuX7
	TWhvgeIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5W6-00CCA8-1x;
	Tue, 12 Dec 2023 16:21:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5W3-00CC8A-1M;
	Tue, 12 Dec 2023 16:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 148B9CE1AFD;
	Tue, 12 Dec 2023 16:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6B8C433C7;
	Tue, 12 Dec 2023 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702398106;
	bh=I4hXkEoUTFcolc2OptvZYGQLuDHWI9mD2TQ75fDGAEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaJ/cK3ae/NyZnW+kIfXD31ZVQhxWOZvEpEiCVaZ2axAEt8mVlkfRPOH7ZSZz1vbq
	 DLCfEavz6/qjkfAjqzIjV1AHKLEKaNugKFiqJZ3wgh+siQAnwmyOiaSO71VYUtuMAw
	 5yp5ECVxUihw9upcoHDCAEwoE53y+gipQccjtaUeNeCpnwvzeVQPmzD+ycWnGs3j8n
	 Nfsl9d2RQwEA9bvLFqEbgmlPTy5ACynj/IAbZyLZzi+ZKxHjg/s32OCuwLJuS8K9ol
	 V5Pa/ygKBO/eCWPJ3UTgIVD/om+8hOznatNNxeZbuDcUn6NZb2Gj5R2KXnEldsah5A
	 wL0bvkZNkNtTg==
Date: Tue, 12 Dec 2023 16:21:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH net-next v3 1/8] dt-bindings: phy:
 mediatek,xfi-pextp: add new bindings
Message-ID: <20231212-renderer-strobe-2b46652cd6e7@spud>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WPQBtHmwAqf+kt5+"
Content-Disposition: inline
In-Reply-To: <b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_082151_688286_45F78BDE 
X-CRM114-Status: GOOD (  12.08  )
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


--WPQBtHmwAqf+kt5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 12, 2023 at 03:46:26AM +0000, Daniel Golle wrote:

> +  mediatek,usxgmii-performance-errata:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      USXGMII0 on MT7988 suffers from a performance problem in 10GBase-R
> +      mode which needs a work-around in the driver. The work-around is
> +      enabled using this flag.

Why do you need a property for this if you know that it is present on
the MT7988?

--WPQBtHmwAqf+kt5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiIkgAKCRB4tDGHoIJi
0igfAQCIaKPOwiNl671rEJW649XaWHfBlXjLZAGVfwCmX2BsbQEAyKovajF2JIX8
oC8ansV48AdAaqaRErICzJeNb8cD4gg=
=vMqS
-----END PGP SIGNATURE-----

--WPQBtHmwAqf+kt5+--

