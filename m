Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02DDC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5hKQ0F5IqpeLP7FipvyIh82TpmOBiR55uTJeJOjZmg=; b=blpe2zyIAenrev405tCrshWGvp
	aMdjOz/IEeNgravJwatrjiUi8uZsVhPsdSohgHclt3fSIAIwl/djqZDnpyYm3W2Xq5pOrSzv6m/IK
	8YCR7Gf38+KN+sFkNxr/2UHtBaAsENcGfJj+gxfM64vlk0y8JNKQR+BpXFQBCLAkqBEMm9rpZe3Gg
	QACR7aCttkVeTcqbJuBJeuDpteAcHElQRtxz5Kn7oSoi23Flviqfl72tVb073s5mgWjD7p+HQmmhf
	Qx/ML8/4RPwBgVdxSeC89Ws/Ill4jGCS4iQM7jxrd5cBHPkYlOXo6tkGYcknyy3v5QiX5QxegnyUH
	d6GQyiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIo8-001g0d-2k;
	Thu, 23 Mar 2023 11:08:36 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIo4-001fxc-03;
	Thu, 23 Mar 2023 11:08:33 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 140B21C0E45; Thu, 23 Mar 2023 12:08:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1679569706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k5hKQ0F5IqpeLP7FipvyIh82TpmOBiR55uTJeJOjZmg=;
	b=HO9K77TtTnbAMb5Za+OPE24h45qee6DG8hFbn7so3VwcFqvA/1HVWxnSBhjZ4oskgucixh
	e+PS0mQJN/JY5YO7qXY5BG9ipiVN9fuK7G9BRyZIH3wuQIsAghsOje8R0/38bqot1C5S7W
	XEdEvMk53wTa2HleZ96gsodpjC7CtEc=
Date: Thu, 23 Mar 2023 12:08:25 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux MediaTek <linux-mediatek@lists.infradead.org>,
	Linux LEDs <linux-leds@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	ChiaEn Wu <chiaen_wu@richtek.com>, Lee Jones <lee@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: Re: [PATCH 0/3] Documentation fixes for MT6370 RGB
Message-ID: <ZBwzKUem+Cg5GU0U@duo.ucw.cz>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D24VC61xTd81s6wO"
Content-Disposition: inline
In-Reply-To: <20230319074903.13075-1-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_040832_199293_102D087F 
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


--D24VC61xTd81s6wO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2023-03-19 14:49:00, Bagas Sanjaya wrote:
> kernel test robot recently reported htmldocs warnings on documentation
> for MT6370 RGB LED. So here are the fixes.
>=20
> Bagas Sanjaya (3):
>   Documentation: leds: Add MT6370 doc to the toctree
>   Documentation: leds: MT6370: Properly wrap hw_pattern chart
>   Documentation: leds: MT6370: Use bullet lists for timing variables
>=20
>  Documentation/leds/index.rst           |  1 +
>  Documentation/leds/leds-mt6370-rgb.rst | 42 +++++++++++++-------------
>  2 files changed, 22 insertions(+), 21 deletions(-)

Series looks good to me.

Acked-by: Pavel Machek <pavel@ucw.cz>

								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--D24VC61xTd81s6wO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBwzKQAKCRAw5/Bqldv6
8j/vAJ0WmSMJOhbk/I5/iFHaEdFTR8H20gCgniwKgLB/GP2U0jwW2klmXEF8xEc=
=U7EG
-----END PGP SIGNATURE-----

--D24VC61xTd81s6wO--

