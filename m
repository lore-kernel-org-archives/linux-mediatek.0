Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B8FC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRdhFFjG4vYoS4PB2ORGCKITVh+f7hbNwK17Xzu9HJE=; b=uSqaVSDmbrRYtEQyy4QaRvsOa0
	G+558BzZZK3olsxmARv1i3YHUnRuGl15Z90g/BQmUYyJHIy9ZwOwcoC2PxTk9dDKFnspaQApwwpDD
	0K+/6Ab+AlDMdnRRei5YqlrheFDudMwchvDmcscFWQGFmR1aTerbZ+XA3gkE0l+a+CinZ7oF9L7sJ
	YV13JC2yhuh/yjeF1A7BFLNa/lkunlUI2Rh/MisDVr4G8xZWch74J2ByX9V0ITPgdBumqLHePbzed
	CqwoM/sTcE0aREf2PW0LqnDBFdEFtUuKHAZWnVyaB8gdrJE5u6yWEBC5uJGTziKeqz49cdpXgzPM0
	YoOe8Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtaF-005luK-0m;
	Mon, 08 Jan 2024 17:38:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtaB-005ltb-2d;
	Mon, 08 Jan 2024 17:38:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F14EECE12DF;
	Mon,  8 Jan 2024 17:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E1BC433C8;
	Mon,  8 Jan 2024 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704735517;
	bh=sRdhFFjG4vYoS4PB2ORGCKITVh+f7hbNwK17Xzu9HJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3NXbRr83nXImKXCFXpxAZNBKresHQ1IBQEA4iIqvkN/7DsAGO52Q9E+MkL9bi8JD
	 h5SN5GDou4STdrkNYGJH/Q6xw8SVp75+Y3Z6LFM4maYoVACCVAh6RyXkJcRpCVnPcv
	 d9+ASxByUJSsf2oHgM4spoCsPswbnuzI/Sk0xzfQGHkgPLWktfgAUjORhFyjZVdfa+
	 aUTNnVruF1CvZA+uO/F+eLKMg6bq5ioXqVmk86Vrb0gGCXiLKM2NuggzKDFZHoWN4E
	 2nXJhwwrllFqP5LgXkYUZijdkE3u201HQdk8IupVy/1YlDjfH73U9uRaKeTGqHew7U
	 AGBG/3W0Vw8Qg==
Date: Mon, 8 Jan 2024 17:38:31 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
Message-ID: <20240108-helium-retriever-043ed3e1dbe0@spud>
References: <20240102205941.29654-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fpLxZoPgQvXVZ2oX"
Content-Disposition: inline
In-Reply-To: <20240102205941.29654-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_093840_038255_E414A887 
X-CRM114-Status: UNSURE (   8.74  )
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


--fpLxZoPgQvXVZ2oX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2024 at 09:59:40PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> MT7988A is another MediaTek's SoC with just 1 device available right
> now: Banana Pi BPI-R4.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--fpLxZoPgQvXVZ2oX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZwzFwAKCRB4tDGHoIJi
0tmdAP0UWGqGDdPKC8piDlk05QfJDU0tLttpkPbYrD3AcUrQwgEA2oJx1AaHQUav
Xvqol9sSOmbiJkBSjQLQHDWheer2CgI=
=J4xX
-----END PGP SIGNATURE-----

--fpLxZoPgQvXVZ2oX--

