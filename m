Return-Path: <SRS0=fv9r=HV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D205EC433E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 10:53:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DE864EB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 10:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75DE864EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FIIFQRn815bkl8M4qV5I9ouVlk2DVTqGvpMALDl+3Q8=; b=cnvVkzSQMHiz9CsTGEqQS8Xa9
	2p4MYzwc03qKVyegvJMHVDT4gOSKWMu1i++roEMHtpgpqdCOKH6aVTIec0/bPopnnkYEAZsskIQlE
	bJ9SjI4n+padRjBx3S5X07l2ldzw6P9pFS+4DQSftN2HHwCatpKtxsaO9pyZu/KmG8mHFVgn9zDXj
	zEG6fr6gk99EBkvYNtCsmPJQ9VuonwXsLu8hxn6GTmIp8vG74bilkcj85g7lMcUR+daNbiEFD6cWN
	QgFvdyAnQB6cLYBdmNb0zCku57WYDLbMi10Tv9DrwdajJs7AwvfMRmOJhPxk26aG9ehPYAk1Nx1e5
	gSg+JgQgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD3PL-0002DV-Pn; Fri, 19 Feb 2021 10:53:11 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD3PG-000286-7w; Fri, 19 Feb 2021 10:53:07 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2AAE61C0B8B; Fri, 19 Feb 2021 11:53:04 +0100 (CET)
Date: Fri, 19 Feb 2021 11:53:03 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v13 5/5] leds: mt6360: Add LED driver for MT6360
Message-ID: <20210219105303.GD19207@duo.ucw.cz>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_055306_419729_96E2C605 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============0410518427061649723=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0410518427061649723==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.

What kind of ninja mutant hardware is this?

Can we make this go to  drivers/leds/flash?

> +static int mt6360_flash_brightness_set(struct led_classdev_flash *fl_cde=
v, u32 brightness)
> +{
> +	/*
> +	 * Due to the current spike when turning on flash, let brightness to be=
 kept by framework.
> +	 * This empty function is used to prevent led_classdev_flash register o=
ps check failure.
> +	 */

Please stick to 80 columns.

> +static int mt6360_init_common_properties(struct mt6360_led *led, struct =
led_init_data *init_data)
> +{
> +	const char * const states[] =3D { "off", "keep", "on" };

No need for space between * and const.

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+YjwAKCRAw5/Bqldv6
8renAJ0fPFfR2F+/nrLVIeNTWJMfpcfluwCgknpgj5y/xjX67RIYZ+WE4vP0BqA=
=J0FT
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--


--===============0410518427061649723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0410518427061649723==--

