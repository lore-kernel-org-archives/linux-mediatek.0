Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA11C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D82A6246C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DfgdUikv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D82A6246C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Euok/ZIgDfkv8E5uIrd2xctLGkyIo2gCvx4iyNM/c38=; b=DfgdUikvUECvqL1MS/nHX/+OA
	CuFGhV1FTuvWKOMZaol3fsCPqjBzqjk58/ejor9kb4p9oZq3BAgB4QYpFBj5Fk58iDp6wGi9JnTyL
	TtLtNXIiOMiRg7qv1CCv70qglZjjp/109P6xnq6VFEmh8rlWwOFbzu2lyi1IFO4ZpY4Vmj6LhMYOv
	1J+GTmgGMzK22y/yz2IRjmOg0KRRtmXemPU5Sq8cBdxZTIdx873+4UL8JjPoL+68bklG8cSBVdELP
	iak0AJIWAqzm8fhbdol30HPpJXv55a+PvEtgN4OIsRUBbg7nchs82EwioUEWh0+6OMpg6IsMOhhGK
	hbpks8JfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfV8m-0004FK-SU; Wed, 18 Nov 2020 21:37:25 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfV8f-0004Bx-6Q; Wed, 18 Nov 2020 21:37:18 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CC16F1C0B87; Wed, 18 Nov 2020 22:37:12 +0100 (CET)
Date: Wed, 18 Nov 2020 22:37:12 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
Message-ID: <20201118213712.GA22371@amd>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_163717_357622_617CD0AA 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Type: multipart/mixed; boundary="===============7478247742901592711=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7478247742901592711==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add LED_COLOR_ID_MOONLIGHT definitions

Why is moonlight a color? Camera flashes are usually white, no?

At least it needs a comment...

Best regards,
								Pavel
							=09


> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  include/dt-bindings/leds/common.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
> index 52b619d..1409e9a 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -33,7 +33,8 @@
>  #define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
>  #define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that can do arbitrary =
color,
>  					   so this would include RGBW and similar */
> -#define LED_COLOR_ID_MAX	10
> +#define LED_COLOR_ID_MOONLIGHT	10
> +#define LED_COLOR_ID_MAX	11
> =20
>  /* Standard LED functions */
>  /* Keyboard LEDs, usually it would be input4::capslock etc. */

--=20
http://www.livejournal.com/~pavelmachek

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+1lAgACgkQMOfwapXb+vL26wCeLtwDg4oxx0PYQmJyevNM3Ckd
2IIAmQGlhDWSRiDQqYO8KZnDIql3iy6g
=k8BQ
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--


--===============7478247742901592711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7478247742901592711==--

