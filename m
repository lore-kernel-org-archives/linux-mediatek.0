Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE1EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzyfY7hB/+eJcg3SwnM7YorttVGXpciyJ9708zw2b3s=; b=ZzonHVJVQh0+WMV3aMB7Bi3l4b
	6lhEZS1534ai1xXYQ3NjQArqxMOv2WdIomihQ6yCBKe7dqrUaACAGtv98XBE3hev5M52V418FbE4d
	8UxPag7PBce+w74HRQnphGudvMnqAkyRiiVSAGkElIfTlMROrWnjRDMSVnqSMiozD94sB/kGwLcmD
	CoT86g9SbCljZzKTE+uT0EALZ5AYnygmJM1+BHarBpEbvs9yPHJOcJxkTT3D0Zj2Na75TrDApvc3J
	5TZY2UtC+ifRzPtItVv5nC22UULMIuidxgu7QNpEshBHHw22jJDWeVLVnNBxbXVc7mZQR8W1YeMrb
	0IQ4Ki0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no6MR-00FRgo-Io; Mon, 09 May 2022 16:35:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no6MO-00FRfQ-NA
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 16:35:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADF236149D;
 Mon,  9 May 2022 16:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2CCC385AC;
 Mon,  9 May 2022 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652114146;
 bh=owjaYKDd7LVWoycl8NoSTqAJLTcH372kDTQxpt06x9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=med84aMy1ptAH/qEVtFQjVurO+LKsXhDopOnBigxUX/dIJg0ffmHKc3chCXKBiy2o
 /4XXRyx1M+T9dh889LABwu4I0fQwZ0TnXUEHCZhLBvaTKv2Yw/RRexWJRsX+Ai835P
 N5ZKESjnzYRq5zTqsXgLIhTUe9JVjIH12JqsIfhnGwMdrSFB14nrgts+FLyslkQlPQ
 xc8+tGNSXcQGAy0cWEx4i2KRJZ5DChBAMi/NhuUCSXxinSJ050eaSRarA6bLxyK3C5
 Blp/SluhmO/EfGYvy05JaaLQmSek0v3bmccp9W1FJx76ahX2jnXIBXrw4O16LglMtq
 XzizDwIhdU1ew==
Date: Mon, 9 May 2022 18:35:42 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: Re: [PATCH net-next 01/14] arm64: dts: mediatek: mt7986: introduce
 ethernet nodes
Message-ID: <YnlC3jvYarpV6BP1@lore-desk>
References: <cover.1651839494.git.lorenzo@kernel.org>
 <1d555fbbac820e9b580da3e8c0db30e7d003c4b6.1651839494.git.lorenzo@kernel.org>
 <YnZ8o46pPdKMCbUF@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <YnZ8o46pPdKMCbUF@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_093548_831133_BDC4A92E 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Type: multipart/mixed; boundary="===============4873861105846587828=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4873861105846587828==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PCSMGdiYoHExCj3r"
Content-Disposition: inline


--PCSMGdiYoHExCj3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +&eth {
> > +	status =3D "okay";
> > +
> > +	gmac0: mac@0 {
> > +		compatible =3D "mediatek,eth-mac";
> > +		reg =3D <0>;
> > +		phy-mode =3D "2500base-x";
> > +
> > +		fixed-link {
> > +			speed =3D <2500>;
> > +			full-duplex;
> > +			pause;
> > +		};
> > +	};
> > +
> > +	gmac1: mac@1 {
> > +		compatible =3D "mediatek,eth-mac";
> > +		reg =3D <1>;
> > +		phy-mode =3D "2500base-x";
> > +
> > +		fixed-link {
> > +			speed =3D <2500>;
> > +			full-duplex;
> > +			pause;
> > +		};
> > +	};
>=20
> Are both connected to the switch? It just seems unusual two have two
> fixed-link ports.

afaik mac design supports autoneg only in 10M/100M/1G mode and mt7986 gmac1
is connected to a 2.5Gbps phy on mt7986-ref board.

Regards,
Lorenzo

>=20
> 	   Andrew

--PCSMGdiYoHExCj3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYnlC3gAKCRA6cBh0uS2t
rCm/AP9WkMTnnhB1Nu9L5BHoNXdksU1GeqgTZsI/h6bUpuonaAD9H/lNxLig+hSg
y4K/G0OA6qVY+cSX9gevZ9vIHjaAFAA=
=+S5h
-----END PGP SIGNATURE-----

--PCSMGdiYoHExCj3r--


--===============4873861105846587828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4873861105846587828==--

