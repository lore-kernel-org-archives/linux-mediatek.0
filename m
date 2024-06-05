Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CD4C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCAN5fvV7sG+TBo7QjvDHZ1N+Q5/foWftqmae93zAu8=; b=OK8HQQ3bsFqWF9dfoI1K604l+4
	5XSlmebij+qCYNEm1pbszWH1MWO4LEzVyK0WSYbj2mxkoXTCks1AOpDV8hjbrUsXM/w/v/s78ch70
	Aet8Xs69sG5josjc0vSUSBQ+JcHfvR2fRb1b7E9eV8hQFwc6eyoJq7BPpiyZDZ1VNNFxbOG/L1keo
	vRypwhzywEzjZKSfSH36rFZgD7GWN7hO1cqVAiSLPcI+DAnIv/ouLEipxHTyrxWDgbA43WxTmvgkX
	91rDydd6NftRoeYcHtKinPoEiXBugtCbffuaSZGHmCMu7fUi8h6gCncKWslNTiC+w/ddWn7fxndD4
	XFLalPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEu1H-00000006vdc-1kmT;
	Wed, 05 Jun 2024 17:01:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEu1D-00000006vcx-0uUT;
	Wed, 05 Jun 2024 17:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1756619DD;
	Wed,  5 Jun 2024 17:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BE5C2BD11;
	Wed,  5 Jun 2024 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717606905;
	bh=zCAN5fvV7sG+TBo7QjvDHZ1N+Q5/foWftqmae93zAu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMVXVjuexfcZSyHxqtr1cu1NbAxWpdd5f2pgLM3J901K7EBR/QIUNRvX3EYy5zAP/
	 V6szEVh85JczRPq6EZS1PcEECSQvxB+J3lpOrOyQfc77moyXedzKsOzMMk9OmbmIYw
	 obkmtDM/8kPVjYCWTkzm5EJdggxPFsHGXI+uvheIS93y+AKXtpzbs7O5f2UO6JoH/F
	 xGS7Gwzz+FAHjoI2lgr7jGibGup1FAokBMAE/gvvlWkKVFjCYRpLgnz7t4J7qA2zzJ
	 hoHZu0I5QkYFzK8SFvfRsTXUrCvli7LPhSDIkifyXbLT1MgdlhyIhJRH/TybTcgSrD
	 vd71AsMjFK+sQ==
Date: Wed, 5 Jun 2024 18:01:40 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: serial: mediatek,uart: add MT7988
Message-ID: <20240605-luridness-spinach-361baff3266f@spud>
References: <20240605085433.26513-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qvD3WpJf0cT24KfH"
Content-Disposition: inline
In-Reply-To: <20240605085433.26513-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_100147_326836_70D91A41 
X-CRM114-Status: UNSURE (   9.38  )
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


--qvD3WpJf0cT24KfH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2024 at 10:54:32AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Add compatible string for serial on MT7988 SoC.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>



--qvD3WpJf0cT24KfH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCZ9AAKCRB4tDGHoIJi
0q0iAPoDuLBzRzyjKeEDkDAevQJGAoIppk4kVDr53+/aFXCfDwD/alSAM+OD8lbR
hxxmPOADF69E/+HRKcGGDPwKRJyDWQk=
=taoy
-----END PGP SIGNATURE-----

--qvD3WpJf0cT24KfH--

