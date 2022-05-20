Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8p8+CbF7pvYd28AYhQqRQLVk66zi0VWIlTUbgXMDhsI=; b=03phPGkmf/VHSTay7AfKkCmB2M
	MfhONp497AgT4zWKJUwzYwH1ZZn64snBRp7wy2xsA/Frmo+wBHdI1eycmbPYed3ABYs5w2Q+8h09/
	fA0kTpNVFEk6Idye0j5c+DPdZ2a8ZSRA1wLWxwM7GA7/fU6gc4ew8lUnVsURGm685Yhovvvlfu5pP
	WvfQhCOxcwsexuOpydkyHMRkL9xiAr86YNINl29WtwV+K7xFhtLU0uo2hAOuZy8pwqyhftEDMdZj4
	fWffH8IzpkFOsT5SA5qrOvXV2fUEN4Gi0HBwW36hgj4X00oNyDEVuaxfcF7TGMp2s3qAfVciz4Z4v
	Udmzvnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns3Wy-00Ctge-S1; Fri, 20 May 2022 14:23:04 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns3Wn-00CtcP-Gj; Fri, 20 May 2022 14:22:54 +0000
Received: by mail-lj1-x233.google.com with SMTP id b32so9881668ljf.1;
 Fri, 20 May 2022 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m/O8UBKE0c2cSYufgjXBbNvLdDE1ALuRtN6rsL7jV4U=;
 b=Y1n9Tpe6rOxQyxePWnDR1MaQDvfpGxBGwVuDCY1yXBOYEgPEjnN1XN6rYIHpAeVbL4
 u09U6NhvUpj+CX5cPGqgcEv9QTndEm7qNfvKNBc/Fk2GjqaIqQwmzF8Juns3jFsnfYDI
 OC3OYS5xLjXLkORT6TJCO5Q1KLlccUr2QwrSt5Alee+t49+mDWgrCtM1DO4LZIKyxl4H
 5ZKt9Gug9r11C8IO4WvXs5rSaaAsfdDbhwEW0furWWyejeTQs09uR7HZbifCIhDR7xZ2
 WTF22eaVs2CuwS8jd/3segFqU7vV1MXXMewC7OtmlZagRZDQalKLgEknB8xwBdr9tGQT
 o85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m/O8UBKE0c2cSYufgjXBbNvLdDE1ALuRtN6rsL7jV4U=;
 b=JvHGL6nXW6X9aC3QoRkTOjWSXXZ26ZqpwF8ExjEKvYNX42A09JxDHb2ZdGwjcQj3Js
 TKdSTTy5WXpSEsch04eTBOomthb/zqGZBWz8hMxAUPPgr2o241l28rPoP8DYsU6sBvJW
 41P4ADH5h8A7A4mhxNpk1/y2FG63iTURAend0HDoNcBhXFbgwG3CW8TBTjR9tBbocdQa
 V1oPrjzTCXXQanvnSpRwD2mjxPth8I7Mq76hGnlc9wZJq1fkCwKV9lf+4hm33HgdYYMl
 eOaS2xlOfwaPTAeLUMW0CWZ+EkAIiiQzlpW1PIS9imSHi1x+rdoG03StV+OdvDDKf0KL
 IA8g==
X-Gm-Message-State: AOAM532CUNFi+ByQ/F9fncZyWHcID2G3+8S3cy3KSQW2aaxHpy/b/hpb
 XclfSPoKcBmEW51yseJk4lA=
X-Google-Smtp-Source: ABdhPJyuKO7AzKSZ1dg5Btd/SfXZvnHzAuI8HlG677gz26ktEZ3LD4xIAFSufc94XaudHIKZGHVxCg==
X-Received: by 2002:a2e:9d87:0:b0:253:e12a:916a with SMTP id
 c7-20020a2e9d87000000b00253e12a916amr2197ljj.502.1653056569307; 
 Fri, 20 May 2022 07:22:49 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 c5-20020a056512324500b00477b6ffffa6sm679897lfr.65.2022.05.20.07.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 07:22:48 -0700 (PDT)
Date: Fri, 20 May 2022 16:22:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
Subject: Re: [PATCH 0/2] MediaTek Helio X10 MT6795 - PWM driver
Message-ID: <YoekNfGTvCfjDMDp@orome>
References: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_072253_590501_058F41C1 
X-CRM114-Status: GOOD (  13.41  )
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
Content-Type: multipart/mixed; boundary="===============3396561965269887330=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3396561965269887330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UWrvBWnZYpzwCo1F"
Content-Disposition: inline


--UWrvBWnZYpzwCo1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2022 at 12:54:03PM +0200, AngeloGioacchino Del Regno wrote:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
>=20
> This series introduces support for the PWMs found in Helio X10.
>=20
> Tested on a Sony Xperia M5 (codename "Holly") smartphone.
>=20
> AngeloGioacchino Del Regno (2):
>   pwm: pwm-mediatek: Add support for MediaTek Helio X10 MT6795
>   dt-bindings: pwm: pwm-mediatek: Add documentation for MT6795 SoC
>=20
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>  drivers/pwm/pwm-mediatek.c                             | 7 +++++++
>  2 files changed, 8 insertions(+)

Applied, thanks.

Thierry

--UWrvBWnZYpzwCo1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKHpDUACgkQ3SOs138+
s6FFHQ/9HkWx87OkIttu0M8J/TwAIYF6wGE76TI54RMoEBlGQLLIbfjkJx4wI7bq
kQh7j6LLB9exFF5WaP+HmskXzadBSEBJH1/H7e9/cLMGiJABtx/KfDjQrKslw4kg
qXupNoRExePzrFUMte/Yo9VOZCb750W7j7ummOoxOJLPBQXZ0TiY/ryiedBvDNHI
qw5tePjX6Tv+hP8SuLeJCH9KGaYK4oUJVNd8P1F+zMlvdlFpVoZ48PBNcTPyUxFA
VC/cwXb7I2qce1FoVjQT9K+hON7qzr/VLo5sSOI/QITo5pvIFVTgU++gY2GvgIuF
ukgWprZSIjFYWxCe053sKNFnzaJZ5V1CFKylpsw5864AsSo8PSwcLjjytsc/cF5I
o4Ke9j0IR22lhc89h/eJOpVPuZEUFes6pQtMUUFUcuCEksfODlJs5l2X1KKnivo4
+b21+ryugvr12Yogf0VGiU0JUS2KgfqbF5hduIuQesXoLoTXVgy885DqmPuI8Tmz
zyoZNj2a1qysVYdsybkFDuNmFy9rqzZmqQjuSIF/jrh4YnEaOaSHCI4ApQFB1vQN
LOIFk8pw+vlH7WV51n+0RIRWpB77Q3LWsu0kIZq0tZZnYXe9td6sOXEtoSAHyxLE
ir6jzWbR/cJEJ8ImS/7YaeQpzUa+OQQ+U4HchIpQQ8E+to20dnM=
=7cPS
-----END PGP SIGNATURE-----

--UWrvBWnZYpzwCo1F--


--===============3396561965269887330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3396561965269887330==--

