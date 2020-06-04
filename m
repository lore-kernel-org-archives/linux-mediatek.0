Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57831C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 13:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2914620772
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 13:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlqyTjZz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2914620772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q0GYOmzAiYeuUQWcYmRt8evmE83U5YXsZaCb5/fFlRk=; b=TlqyTjZzkqkV7h9m/z9UUzvAU
	j7o7u0gEwXZjGalVN5IOh57gVm7miTaoSt4jSa3vn4Jth+hxar8HDbxcIeiQ9LEI1AkWSX0nENaz1
	cxkDpYdsC9OfLjl5flDmYvc7v6ubWnC67OlzrQYbAG2ftH5yieEOBTyeAn+VHx/RBkXD/KNQSEdpX
	zKvZXKnWgU/rAEwv50jmEom2C1h2AlwWWyvVMi8B+H12SfDQD7tPVxEA1foC1KqJeSImWqRmWz1a8
	ZUZ1Jum93S+tQwNAl0h67Mkc+UugSerHu27v+lmk8/3U1yEb9e0vYZkU5qZ+HqDraoilmSuMppqPH
	LN9G4MHNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgqIe-0000tc-JC; Thu, 04 Jun 2020 13:52:52 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgqI2-0000Cr-1x; Thu, 04 Jun 2020 13:52:20 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 912681C0BD2; Thu,  4 Jun 2020 15:52:12 +0200 (CEST)
Date: Thu, 4 Jun 2020 15:52:12 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200604135212.GI7222@duo.ucw.cz>
References: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1591252004-12681-1-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_065214_250032_3E71B609 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, matthias.bgg@gmail.com,
 shufan_lee@richtek.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============6809457035219243962=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6809457035219243962==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qLni7iB6Dl8qUSwk"
Content-Disposition: inline


--qLni7iB6Dl8qUSwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index c664d84..c47be91 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -229,6 +229,17 @@ config LEDS_MT6323
>  	  This option enables support for on-chip LED drivers found on
>  	  Mediatek MT6323 PMIC.
> =20
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Support Torch and Strobe mode independently current source.
> +	  Include Low-VF and short protection.

This should be in english... and should not contain
"advertising". Just delete last two lines.

More useful information would be listing hardware where this is often
found.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qLni7iB6Dl8qUSwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj8jAAKCRAw5/Bqldv6
8sQ/AJ9RSpXXojs6+tLysx6O8BZD+n8ZwQCgrtkhweKtov6zJaZLivlz+10eSwA=
=1Hm6
-----END PGP SIGNATURE-----

--qLni7iB6Dl8qUSwk--


--===============6809457035219243962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6809457035219243962==--

