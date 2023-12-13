Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2646BC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heA0ZkoH+SoPVtiuB5Olkoq/Ef49xENKGFMGl/9S3h8=; b=iuVotNwpETmJs4kqX4INCj2wK8
	KhEcPTO7j+9IuekI71ihaRPwG2nskdV/h7NpiiHaCMujuXxUF10z/unGZIFyT8UPPPBRy+kx9Mwop
	J6luXv/sKWUsATqlBEscbu1UZCpEc6U5xzExF/ztItoHdTi4VNHhHBNkY5v7Z7QK13WjspyeN+iCC
	ssVUpQW8cztcJAnS+eCVl3Y8opeOX55x64jmJIANpEjeCv48qPV712yo3N+0JHRDsodpqBFiGrcBr
	yv4JoLz9YEcryK1MiIPxacT63wzEgd2SEf8euffYtSWh0/rBST1UT3FLk0fhq5e8cKLmOUq0DxAij
	+L0OLF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLpS-00EB9E-2x;
	Wed, 13 Dec 2023 09:46:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLpP-00EB7s-1u;
	Wed, 13 Dec 2023 09:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F98261B41;
	Wed, 13 Dec 2023 09:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F15C433C7;
	Wed, 13 Dec 2023 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702460812;
	bh=k3h+x5Vi0c4IUc2BgiJewMzJeCYyvSk8+ZHJK/SWAOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tB5OQxh//OBSfXK0FUdFSzcfEoIJyEniRxaI6FF3p7iKPcZ+k+7oHa13+VC5BtTVW
	 AIvVDladP54+eKEj0Gizw4euRRRU6KZCljmIlisdNUIFEIPMh59eypu8BxdaDEnvgg
	 +J1/VytncX+iPP7xylS4qbsFfaeCyc35ucSWlT1PIR9VG8UK+IadGA4rhnRd1kZdNI
	 /xMEdLMTt+iCLnF06HyS5MK4EQ/RO1rWc5rGrvf97MSFIVP3+KQmnXpVVESH+jjOa7
	 Y3XgFLpzUW+W4LKrAmsIIn5S1Y6lJPRrOn80Znicol+dSEaP5p+knty92G1xUrhR47
	 j9Ggn0ti7Ij1A==
Date: Wed, 13 Dec 2023 09:46:44 +0000
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
Message-ID: <20231213-confined-shaping-f56b1fdfb135@spud>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org>
 <20231212-renderer-strobe-2b46652cd6e7@spud>
 <ZXiNhSYDbowUiNvy@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TQLtrFVr4ShS8Ew7"
Content-Disposition: inline
In-Reply-To: <ZXiNhSYDbowUiNvy@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_014655_717606_8F0DB84A 
X-CRM114-Status: GOOD (  21.90  )
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


--TQLtrFVr4ShS8Ew7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 04:42:45PM +0000, Daniel Golle wrote:
> On Tue, Dec 12, 2023 at 04:21:38PM +0000, Conor Dooley wrote:
> > On Tue, Dec 12, 2023 at 03:46:26AM +0000, Daniel Golle wrote:
> >=20
> > > +  mediatek,usxgmii-performance-errata:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description:
> > > +      USXGMII0 on MT7988 suffers from a performance problem in 10GBa=
se-R
> > > +      mode which needs a work-around in the driver. The work-around =
is
> > > +      enabled using this flag.
> >=20
> > Why do you need a property for this if you know that it is present on
> > the MT7988?
>=20
> Because it is only present in one of the two SerDes channels.
> Channel 0 needs the work-around, Channel 1 doesn't.
>=20
> See also this commit in the vendor driver for reference[1].
>=20
> We previously discussed that[2] and it was decided that a property
> would be the prefered way to represent this as there aren't any other
> per-instance differences which would justify another compatible.

Please put it in the commit message so that when the next version shows
up, Krzysztof doesn't show up and question the property for the third
time.

Also, on another note, this series is aimed at net-next but half the
series is fixed for incorrect bindings. Why not net?

--TQLtrFVr4ShS8Ew7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXl9hAAKCRB4tDGHoIJi
0l51AP9AfxTVJus53lwalnfKdDDM6fu9GnfTQ1DaU51hYEgGlAD+KJiVYUIfbVyH
NeYoGDoBXFZkUEImGzZ7OfYXmDAzTQw=
=+6BB
-----END PGP SIGNATURE-----

--TQLtrFVr4ShS8Ew7--

