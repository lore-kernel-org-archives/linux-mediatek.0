Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80261C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6j+X7SrO7l9QEBWGW1SnJfIehzVRmn+xIQKevBGROk=; b=4oErsTphcTuM2nhfLtsm7hDO9R
	sb6rmDN6dfHHdw6zyPI7H0VPgu0RRxLrWDhiM6yDjtZvr8g+zxeEw8Uk4nGnZCS6+pOIkMWAmclbp
	K1Wk6CoxslCoLCxPv2yKdBBwth7P60ra1NRbc+um8SXMxRSVn2sg4TsNHQLQjFIEXNrIG8zynAtDU
	Zatrp2QYSEkV4VLzYBJQwMAPqE/BiCodX45nCU0VVtBlEwn1itGzXCk4q8J0CzRC11pBz3CxUkOn0
	GY7mcg+4sDoGlP426DWwKNm0of9ZErtSG2z8Yh3a3SNNtcCmGRZaOPcsWaG1B44I/dRMwrb9fhCrm
	HVEggEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPj5-0077f8-VP; Tue, 22 Nov 2022 09:38:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPiX-0077Ah-Rb
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 09:37:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44DDB615D7;
	Tue, 22 Nov 2022 09:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE05C433C1;
	Tue, 22 Nov 2022 09:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669109842;
	bh=RtXvZ0p1DP/VjpMADc1HaXxLba69hdFVNPBuDmoWC7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQQLa7wz8Va2cZW3GNLqUJXVzNbevBPDOzgi34cXw68HqcI6g7CcdHOgjyUuZYODR
	 O212GMyq35vvp8www4x5WSLnICf8g5+mIRD9SJ2nLiqH0RmgiULkDPHCgFmn74/1e5
	 MSZH+qzJOLh/Bch9pJly+6VKvlC2jAw6WicLo6PXZI1ue9Ea7IlM6F+vDediSIfGY+
	 AqRTX+q+8iI5v99OM43eFDcD8UfAb4F//zG6afqBmPI5EwkvH54UxfoU5Y/XDL3Ivn
	 ti1BKLkqd/E0OtjX6lQCoLfyZzXfXjqYjPpJHq09MCuBVFr0M/V/nOMx0OP1Ekp/7N
	 Hy1LvXGJY2aMA==
Date: Fri, 11 Nov 2022 01:56:25 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 net-next 2/8] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Message-ID: <Y22duSNJT/4MbDof@localhost.localdomain>
References: <cover.1667687249.git.lorenzo@kernel.org>
 <2192d3974d30b1d0b8f4277c42cdb02f6feffbb9.1667687249.git.lorenzo@kernel.org>
 <20221110200926.GA885371-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kig+5iN2ab7nhHx7"
Content-Disposition: inline
In-Reply-To: <20221110200926.GA885371-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_013725_993918_6CF1465B 
X-CRM114-Status: GOOD (  15.25  )
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


--Kig+5iN2ab7nhHx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Nov 05, 2022 at 11:36:17PM +0100, Lorenzo Bianconi wrote:
> > Document the binding for the RX Wireless Ethernet Dispatch core on the
> > MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> > forwarded to LAN/WAN one.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 52 +++++++++++++++++++
> >  .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml | 51 ++++++++++++++++++
>=20
> Are these blocks used for anything not networking related? If not, can=20
> you move them to bindings/net/. Can be a follow up patch if not=20
> respinning this again.

I was discussing about this with Krzysztof and he suggested to put
mt7986-wo-ccif.yaml in bindings/soc but I am fine both ways.
I will move them in bindings/net/ if I need to respin the series
otherwise I will post a follow-up patch.

Regards,
Lorenzo

>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

--Kig+5iN2ab7nhHx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY22dtgAKCRA6cBh0uS2t
rBbZAP9hbo5ogUlDzpmGLInxxC89ivIwLOtkvZzX1vOg8JgufAEA9tHhLVddaNef
sa4nGmd3gfhd+bzCszLvNWc5FZfJAwA=
=P86E
-----END PGP SIGNATURE-----

--Kig+5iN2ab7nhHx7--

