Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7419C19F2A
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 21:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9GONExi2bMzEQw12WI9p6+Qh5VXr1fFNHfflQl3nxw=; b=pf4hyn+46Uslw9lbZF4qgHiXJf
	YCE2Q1BiptfzHsURHf0EY4f4Sv5eicc3bOTi2wnCk7N2qK6U2hCxD0/zuP9yJ7b6n2x3IBbXhDPJL
	iEY/lCtDAHs9bOvGb4tHuDOwX9zznYyU67OzH/cIN80LwRGHpqh1pJvjnfJVbQY4V/T4wNrt2vtsV
	edkJ+7tdinfZULWFMvJeDsuh+ri+pY9QNaOjPlz8dpn/2hxBoTZsr6raS/L6GQvmRjSwWO5/qPpfk
	Lra1owIHUveGfRy+CsrUNKxhD+7WJhkKl84u2/joGXgmZ1XuptMz+XI1Oo/3mwgRMT101HUgt7klq
	Gx0tmFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHu3M-004efc-IF; Sat, 30 Jul 2022 21:31:20 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHu39-004eWN-A7; Sat, 30 Jul 2022 21:31:08 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 1D5FC1C0001; Sat, 30 Jul 2022 23:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1659216659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o9GONExi2bMzEQw12WI9p6+Qh5VXr1fFNHfflQl3nxw=;
	b=cSY49q+q6Yc2MxDLhSVDO5DseSSWxSphwN08c+PDJwwl3Bm1ceR8BfmtlkTZDhMRMkQgWT
	6hgHQOc1WS0juhjHH1FOan8RAuwST7qllswVe6Iu0ECAnUyZ9Tlo67dwNty/31HU96/0eX
	tuwjCFSCzKGcnj8PqNUObH7zDgNN+ZM=
Date: Sat, 30 Jul 2022 23:30:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 04/13] dt-bindings: leds: Add MediaTek MT6370
 flashlight
Message-ID: <20220730213058.GI23307@duo.ucw.cz>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-5-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6b3yLyRKT1M6kiA0"
Content-Disposition: inline
In-Reply-To: <20220722102407.2205-5-peterwu.pub@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_143107_520872_F0D55F42 
X-CRM114-Status: UNSURE (   7.97  )
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


--6b3yLyRKT1M6kiA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2022-07-22 18:23:58, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
>=20
> Add MediaTek MT6370 flashlight binding documentation.
>=20
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You'll need to get sign-offs right... And review from dt people before
this can be applied.

Best regards,
								Pavel
								--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--6b3yLyRKT1M6kiA0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYuWjEgAKCRAw5/Bqldv6
8o6vAKC4ARVicLPm5uV4zxu75IiOs/DsvwCgn6SlrzK+9+kIJXHJNS6WoAmW4j8=
=aw5u
-----END PGP SIGNATURE-----

--6b3yLyRKT1M6kiA0--

