Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04BEC5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWKYOYEVoTjFTjEaOl+GY72vx6MkMiK/T1nV//CxK1Y=; b=vfP6pg5LCoTdRwpPGIIw7UB7Bd
	uVCH3Iz0vLgS1NifD8PWQaAMCsTTrJVGZP0fuGLJVV7Kb4alunZ9RCJ8CpEuhh2bKi0gHQuwFAEdJ
	lHm6DiSuS5SCFj6oxyvlmIMLSJ347TTkS64tBXq+S0Kc5pTr2Dl3rhZCecIBwew1pFZh899Jbjlzw
	IFjeoPQdu8zegzodng+Z3vdMTZvf4xrhnfddcx2ZD5gKylqd0SW8CIr4r8Hpquzpo84dCzjf6nFG6
	KDua1yJjTXf/BqB+140VL15XYPHWJWM4wqFd0+nbuxh4fEZGI439fs4ZXt99TCeiSX+JyyTFR1Xzx
	vKngL9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjmpK-00000003Bl4-3ZVY;
	Mon, 11 Mar 2024 21:04:54 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjmpG-00000003Bjf-3I9U;
	Mon, 11 Mar 2024 21:04:52 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 239C21C006B; Mon, 11 Mar 2024 22:04:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1710191083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWKYOYEVoTjFTjEaOl+GY72vx6MkMiK/T1nV//CxK1Y=;
	b=k5YXabBPci6TAodHddzyx4y1TYt8ecxjtkd7QYnRxmQxH62IfrGXfKKcPo4faZRGmlV0wE
	pfzrPDWvIG90hG8SKhkZT0Y05EMUVM8ADHSrqgoXe+3Y/etwPbv0xsS4Kmj1Dd1Yah4bOm
	wSZ1UpjMcfmU1tQXERA3c5IP7c3w1WA=
Date: Mon, 11 Mar 2024 22:04:42 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chanho Min <chanho.min@lge.com>, Arnd Bergmann <arnd@arndb.de>,
	tsahee@annapurnalabs.com, atenart@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	rjui@broadcom.com, sbranden@broadcom.com, andrew@lunn.ch,
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com, magnus.damm@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.1 12/12] arm64: dts: Fix dtc interrupt_provider
 warnings
Message-ID: <Ze9x6qqGYdRiWy3h@duo.ucw.cz>
References: <20240229204039.2861519-1-sashal@kernel.org>
 <20240229204039.2861519-12-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8Qt9dsw4Yel33kO/"
Content-Disposition: inline
In-Reply-To: <20240229204039.2861519-12-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_140451_155803_854CB989 
X-CRM114-Status: UNSURE (   9.73  )
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


--8Qt9dsw4Yel33kO/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Rob Herring <robh@kernel.org>
>=20
> [ Upstream commit 91adecf911e5df78ea3e8f866e69db2c33416a5c ]
>=20
> The dtc interrupt_provider warning is off by default. Fix all the warnings
> so it can be enabled.

We don't have that warning in 6.1 and likely won't enable it, so we
should not need this.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--8Qt9dsw4Yel33kO/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZe9x6gAKCRAw5/Bqldv6
8k23AKCohjgfYZMEaizYp8b4irlIqXjE2gCdHBiIfD3co6vqw2yumT637ihoC2o=
=YhHl
-----END PGP SIGNATURE-----

--8Qt9dsw4Yel33kO/--

