Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C54AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDX5X5nKXLHBPlFbMdfwdqDyzaVh/0AbbwxuYcFILPc=; b=fk0fJzuy8kRkwH2u1TG6p60vat
	OOdbxjdBLGYpFOs1twi9choHX2plrMr9r6zdlkSEA05qixijg06bCHcb+hxwHd6L0qA+BNjdDiBcO
	r9zElS/G6ZiC1ZH+tiGng58E34AtLlpjDasFLU/ipiyCYP9OaKeBf46clISe9KzdRF42xkpvuGZre
	3WjVCohR5d1LF5Vq+u1idqq2eNykWQse36lpVLMG0spXiK098sHdkR1G61AjKx/vC+X4WgyEn4tdL
	gbz9nNLpip32iGmXQr47+Vvp9Mvn4hXbOTeKX9xml84y9iHWExSGpB6w8UN8CVY6Btvxb1dJrBFhU
	ONZG0YxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1C9-00Aoj3-Iz; Tue, 31 May 2022 12:41:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1By-00Aof1-Qu; Tue, 31 May 2022 12:41:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64482611EA;
	Tue, 31 May 2022 12:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D415C385A9;
	Tue, 31 May 2022 12:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654000905;
	bh=50k5P2deod6KO8gvHsZ0qJej+m44dwOkD8HE8Gg5bjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MO2bw7bbdUFxvvki8bhZ3MgawmrbJZNY4ep7dcTpbtkPkBrD1hNo20l60DI3T7Oj1
	 nlEdkpQz4meR1xf1XIYnfpCEfnmw3hcFzO7dSl+AV566wl8NggjS3iS6AJi7CzsMZX
	 AN27nByTMKymlcyySqfBAbf2gzy8zhdHvemoux4FVUEYrqpGuxQI+T7JGhU0N6HVrH
	 foWmceq2jqtCybmNYuVDwkPIWVeUhAcJAKqePfeEoG7aeHhOX0vJwnz4IPCq6XRJS0
	 Qh7pYiaRubz31TiwxkjXegOnMv4Tyt7uBHh0AoRxhnqbluKjyV3pK5BlOng75mJBSN
	 FCgiuBVpURnIQ==
Date: Tue, 31 May 2022 14:41:42 +0200
From: Mark Brown <broonie@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 03/14] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
Message-ID: <YpYNBo90NETXtjkV@sirena.org.uk>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-4-peterwu.pub@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220531102809.11976-4-peterwu.pub@gmail.com>
X-Cookie: May your camel be as swift as the wind.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_054146_953439_8D1FF471 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Type: multipart/mixed; boundary="===============2691076049848117162=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2691076049848117162==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hl22OOkO/wMChZ8B"
Content-Disposition: inline


--hl22OOkO/wMChZ8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 06:27:58PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
>=20
> Add mt6370 DisplayBias and VibLDO support.

Other than one small thing this looks nice and clean:

> +	enable_gpio =3D fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", =
0,
> +					     GPIOD_OUT_HIGH |
> +					     GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> +					     desc->name);
> +	if (IS_ERR(enable_gpio)) {
> +		config->ena_gpiod =3D NULL;
> +		return 0;
> +	}

Please just use the OF APIs - due to ACPI's handling of power for
devices the regulator API OF bindings can't be used sensibly on
ACPI so it's better to explicitly work on DT only.  This won't
actually cause problems here but it's a bit clearer.

--hl22OOkO/wMChZ8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKWDQUACgkQJNaLcl1U
h9CrHwf/Xn0rciY/VlcVjndWUL/zYX17wRyxPAwxx/DOq/VCeystayvT4671ML/1
6h5ZE7pKGSzHQjyt8x3BXHDAvn0EW5KNrc+lwBTQDrhiE7hbKcXb0cChQBvcM4KJ
m2ETTDdgNoBEkUQwj40OnrL/DIw7NpILWAOaoB+gGwelfj4Lu8LxTcZsRQqdwAGN
Q4lC4mPkae3NP0+tc82DyjtHytJPaX5jCPML4AofpFKs6A95yGyKlARdDgQqVVXP
sbKZA93RwgxZDSH0pxXBaKCBTEwOIjIl5qXbk0OXyvnopAYvVGVe6oFgutC2MPqa
joJC6sXurZO+wFB9H9tlKwq9Au8AOQ==
=WP6+
-----END PGP SIGNATURE-----

--hl22OOkO/wMChZ8B--


--===============2691076049848117162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2691076049848117162==--

