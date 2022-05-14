Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AF4C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 May 2022 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLvy9VPNvOYsJ4Vu1bOyfzVtPnpmK3jY+SuB5n3aboQ=; b=bCBdG9HpK+AAfS/mVB1luW3eir
	wQxC2MNW0vqoecyABk5gkE4DJ3uITwS8SIZcP9KlM1kiWR5o08MQWsxhZACfmFC9eSblp1Nu0khb6
	iyIvPaNjoyg1shcBUaSvr2HHZWFSye6hETzQDD9rZ4v3viadzuXp5jcgeUnQoW51fDcpiczfn89zC
	S2RR4NDgQtYdlRgPDGESYhBfTwuwSF16gdsvZW/Xxo3b3VDKkmDhWLLRj6Ng/jGEpIGgc6MwOfFl2
	03hUfaoXbG4SRkrq3x8cBd3prj6QNUcGm+S4BWOWgOAQJrYN/AulxTzrLpsfQ+ssEF3ug4dL/O6Xr
	B7sopsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npoP2-001D6B-VP; Sat, 14 May 2022 09:49:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npoOy-001D5j-0w
 for linux-mediatek@lists.infradead.org; Sat, 14 May 2022 09:49:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55D5EB8013A;
 Sat, 14 May 2022 09:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AF9C340EE;
 Sat, 14 May 2022 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652521769;
 bh=fD/mkjvdISC77Cf8PGTHsmA88B804TFZMCm5qN7kBaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mth4RYLvGgdhMR5tuXBLbTq9kQvo7gu/aJbiEjaVb1PfJv/gwmvhneXxPihIQyUGK
 GxnY32AjxfObxp3T71hJpIQH+sqByeFgxr6USZdLcxGJiWZignGK/SWi/76Hd9sp/O
 6fMXgoeS5+pf/V8nCpOgTz0EGwInsRYn4yq1lFQKNtZhZEW8s6sGEeSl7zjJG1osMl
 VMwgn2Pu/v24gC/feiB+/Xc5HEC7QMq7oOZhferowDQx7OJA2nlUuctB/yKM2qCUxh
 4zmD76z6jbH5zgcvwUcOT1AFZR/Q/iy5pCGdMQma6HEnsg/kebfw+F0Dn2AB/n5hEk
 9Mlg+dSVkZrhA==
Date: Sat, 14 May 2022 11:49:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, landen.chao@mediatek.com
Subject: Re: [PATCH net-next 01/14] arm64: dts: mediatek: mt7986: introduce
 ethernet nodes
Message-ID: <Yn97GqujwYlljkdH@lore-desk>
References: <cover.1651839494.git.lorenzo@kernel.org>
 <1d555fbbac820e9b580da3e8c0db30e7d003c4b6.1651839494.git.lorenzo@kernel.org>
 <YnZ8o46pPdKMCbUF@lunn.ch> <YnlC3jvYarpV6BP1@lore-desk>
 <YnlFBr1wgb/hlduy@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <YnlFBr1wgb/hlduy@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_024932_246272_C79F40CC 
X-CRM114-Status: GOOD (  18.54  )
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
Content-Type: multipart/mixed; boundary="===============7276556130212183627=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7276556130212183627==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57sKd9UZFq0yO9gn"
Content-Disposition: inline


--57sKd9UZFq0yO9gn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, May 09, 2022 at 06:35:42PM +0200, Lorenzo Bianconi wrote:
> > > > +&eth {
> > > > +	status =3D "okay";
> > > > +
> > > > +	gmac0: mac@0 {
> > > > +		compatible =3D "mediatek,eth-mac";
> > > > +		reg =3D <0>;
> > > > +		phy-mode =3D "2500base-x";
> > > > +
> > > > +		fixed-link {
> > > > +			speed =3D <2500>;
> > > > +			full-duplex;
> > > > +			pause;
> > > > +		};
> > > > +	};
> > > > +
> > > > +	gmac1: mac@1 {
> > > > +		compatible =3D "mediatek,eth-mac";
> > > > +		reg =3D <1>;
> > > > +		phy-mode =3D "2500base-x";
> > > > +
> > > > +		fixed-link {
> > > > +			speed =3D <2500>;
> > > > +			full-duplex;
> > > > +			pause;
> > > > +		};
> > > > +	};
> > >=20
> > > Are both connected to the switch? It just seems unusual two have two
> > > fixed-link ports.
> >=20
> > afaik mac design supports autoneg only in 10M/100M/1G mode and mt7986 g=
mac1
> > is connected to a 2.5Gbps phy on mt7986-ref board.
>=20
> The MAC does not normally perform autoneg, the PHY
> does. phylib/phylink then tells the MAC the result of the
> negotiation. If there is a SERDES/PCS involved, and it is performing
> the autoneg, phylink should get told about the result of the autoneg
> and it will tell the MAC the result.
>=20
> So the gmac1 should just have phy-handle pointing to the PHY, not a
> fixed link.
>=20
>       Andrew

adding Landen to the discussion to provide more hw details.
@Landen: any inputs on it?

Regards,
Lorenzo

--57sKd9UZFq0yO9gn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYn97GgAKCRA6cBh0uS2t
rJi/AQCb9dTLYZ7YoVsaSg9/eM2xO1giATwmWgDgvu7ornUl/wD+Im8XM086QT4k
wTWJpsrIZkt3aACNIfiY34472b6ohAw=
=ZZRY
-----END PGP SIGNATURE-----

--57sKd9UZFq0yO9gn--


--===============7276556130212183627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7276556130212183627==--

