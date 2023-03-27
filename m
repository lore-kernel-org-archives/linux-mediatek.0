Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD27C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFykRxzmTbL7DBBLByyFMIZThBCBkMRsBj1bnaQnEfI=; b=r3afKv06leNI3tdMAqYUJbe0/p
	IldmGhPJdgzdL5Lm0o8Y+/1Q5lt9BDf4VjwwsyVMtZNSi4ypVrUiiTU2pStMuDwQpHZePWle9jnmX
	18tviYxLJWPXc8bzsprdqXkmKjeo3yoUf+HMY9G1ifi+7Dsaq7Hx2+WaYT3+3vGlXc2chxS3IRcNX
	kLMIoq3atL1gCmRQg/0EnR/VbOEg5xkxqye6XIU0/2EtoQkZQPpSaYrmGm8tFpbQ6VCCTZvvYAsem
	ZBL1jfNTg+tytZHUmVUteWiovGiYNtNaRQwt11ExbAYdS4dXPjhVKwXda70mvcCiYrV7UoFKpndzl
	SNx1wkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglJH-00Amgr-0v;
	Mon, 27 Mar 2023 11:46:47 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglJC-00AmdQ-1O;
	Mon, 27 Mar 2023 11:46:44 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C55E21C0AB3; Mon, 27 Mar 2023 13:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1679917593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFykRxzmTbL7DBBLByyFMIZThBCBkMRsBj1bnaQnEfI=;
	b=TX+T+yKp5DacOLhkpQ4BA8cBSLOVIO3ikm4LDE7/oCmhs0Hj1zKoLT9qTDwqeX9E7yZNag
	bqvc4VBmhBC7TUZksefeTGwAk1IMTeneJXk5NqdWroUMzHRUcV0HnQdgW37H3wyuv46t64
	cVzIRKYzod+VUMAxlt2cqgVHp/O/TAU=
Date: Mon, 27 Mar 2023 13:46:33 +0200
From: Pavel Machek <pavel@ucw.cz>
To: ChiaEn Wu <chiaen_wu@richtek.com>
Cc: corbet@lwn.net, lee@kernel.org, matthias.bgg@gmail.com,
	andriy.shevchenko@linux.intel.com, jacek.anaszewski@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-doc@vger.kernel.org,
	peterwu.pub@gmail.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>
Subject: Re: [PATCH v18 1/3] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
Message-ID: <ZCGCGb9E4KYlFNXR@duo.ucw.cz>
References: <cover.1678430444.git.chiaen_wu@richtek.com>
 <1df93a583c3f508a7158b83b95857e9bce235e1b.1678430444.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D4r0h3j33WbMHnmz"
Content-Disposition: inline
In-Reply-To: <1df93a583c3f508a7158b83b95857e9bce235e1b.1678430444.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_044642_912936_68F020BD 
X-CRM114-Status: GOOD (  10.78  )
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


--D4r0h3j33WbMHnmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>=20
> Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> driver. It can control four channels current-sink RGB LEDs with 3 modes:
> constant current, PWM, and breath mode.
>=20
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Co-developed-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>


> +++ b/drivers/leds/rgb/Makefile
> @@ -2,3 +2,4 @@
> =20
>  obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+=3D leds-pwm-multicolor.o
>  obj-$(CONFIG_LEDS_QCOM_LPG)		+=3D leds-qcom-lpg.o
> +obj-$(CONFIG_LEDS_MT6370_RGB)		+=3D leds-mt6370-rgb.o

I'd preffer leds-mt6370 name. We already have "rgb" in directory
name...

Otherwise looks good. Thanks for doing this.

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--D4r0h3j33WbMHnmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZCGCGQAKCRAw5/Bqldv6
8i3ZAJ9qQLfE458c3OH+zEji2EkMi7QlSgCeK9mwxBDeevOjUAyXRclkUMQNHsc=
=XX/d
-----END PGP SIGNATURE-----

--D4r0h3j33WbMHnmz--

