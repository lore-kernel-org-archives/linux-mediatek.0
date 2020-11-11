Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A2DC388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 20:27:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EAF206F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 20:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Daek8X0b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8+RxB+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EAF206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wGFDQBD1u9WXE4iGxQZqdeVu/tEJbhbCTrMXHjyDvNw=; b=Daek8X0bq1/C12zQcbRgXlEq5
	b78+SfoSB49jRY/wHRZ9lWVAZ/fIlntgwn6NL1MCQJcwJbdO+1upJ61dcApgEmgBfgG+w8JIc+lZq
	oEG6stt8G3w63rT/iuWATRSXfxiBNm+v9zw0bc60DDRNNPnqgQHMidgnSkf7X7a6SBD+XiqKpq1Uy
	YUjyjLtf/oZprhqd7uKo6sJuk9UPzho6iLCf5SbBGvfgnNOutRT4+ypdQvOJLqXJgoJeFNwFb5rtH
	Xi5utu6kvmrLkTy08/3UDFrtfKrmhTKoTrxsj79Q4qKwjmMXG3pzwd7kxzONcvr2rdzW/gzFQli/J
	BeYv0Gfrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcwiT-0004oR-3a; Wed, 11 Nov 2020 20:27:41 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcwiQ-0004nd-63; Wed, 11 Nov 2020 20:27:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id 10so3428770wml.2;
 Wed, 11 Nov 2020 12:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3SSKXZnWdwq0DOqj159XH5NCn8HYxBH6TPSbcPh2Y1Q=;
 b=D8+RxB+ee3V7rv4D9DbN3BymYsiV4i6V7xi+ZM2FKjD7wr3uriBDJ1aWDaLRuXKfuo
 pz4zUWwhOAe3AZ4PAq70bFaNObbjiNqv9MHgkBnPNiDOzbWx8e8WXj4f4nEiEgbN3R/t
 ezV6DWXhyT5houkGSgpws1XgpEm9yuLVglRUFx/JA/j2f37BN2ABU9CP+H8C/zRgwU96
 oKRymmI0jovLiUT0CTYEkPM6L4fllNn7Hi/waf6HD7JSdX8sv2cSiRpegYvQAOiKaoY4
 tOmQ47ikhmOWNS96lHlEUl4kC2Fvh7Z7SdnUveo5zfWqokJeYkHqp0B2nx1MapD+xE7O
 GUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3SSKXZnWdwq0DOqj159XH5NCn8HYxBH6TPSbcPh2Y1Q=;
 b=scQtrReRJ2MkSvDWmzOJtr8msSIcK7cHI2wgyRFhGlvMkOv33ihdFoKhbWs4cse0Cp
 KdT6FG6/FbjD9BLs1jElpDoZODRrpAwvsBZ/8Bg/0AVR6RBR14zdHesq40/rCNVBOuhh
 Wo+lyjfN3iqPuxjFDnQ+RxPkiowaP78cty9DkUqesuiuHvmteoUYZQFR1bs5R8RHlbuh
 dv/9zopbaW/q5VQm5CvufD7ULvCnwD4XUGCizk71mN6xHg9i0v20yLrIukwrWySnD4f+
 /vx1jb+UE2WGStg0xtqUNdy1qGaWGlU3DF0mn5fCgnW0uBgKGcgvfCamrtiueRL/7Pvt
 AgUQ==
X-Gm-Message-State: AOAM531ItgdfCNIX4zyF6z8FGmaQcwTKwEkndH4pzzzJajdyCIReIU7I
 kVOBCjpSmjGw4qcMSyYKxr8=
X-Google-Smtp-Source: ABdhPJyB+uwh0qX7g9Q8P68FrQC1zOZSo+JKQ/sfk5Q6Q3JRAfHsdr79q/u2RA6gPbHDLQLg0VjcOQ==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr5906338wmg.3.1605126457267;
 Wed, 11 Nov 2020 12:27:37 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id f5sm3964460wrg.32.2020.11.11.12.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 12:27:36 -0800 (PST)
Date: Wed, 11 Nov 2020 21:27:34 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 0/5] Add PWM support for MT8183 EVB
Message-ID: <20201111202734.GL6125@ulmo>
References: <20201019140705.1518822-1-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20201019140705.1518822-1-fparent@baylibre.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_152738_348526_85AC8813 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4307942240285758783=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4307942240285758783==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1X+6QtwRodzgDPAC"
Content-Disposition: inline


--1X+6QtwRodzgDPAC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 04:07:00PM +0200, Fabien Parent wrote:
> This patch series adds PWM to MT8183 EVB. MT8183 has 4 PWM channels.
>=20
> Fabien Parent (5):
>   dt-bindings: pwm: pwm-mediatek: Add documentation for MT8183 SoC
>   pwm: pwm-mediatek: always use bus clock
>   pwm: pwm-mediatek: Add MT8183 SoC support

Applied these three patches, thanks.

Thierry

--1X+6QtwRodzgDPAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+sSTYACgkQ3SOs138+
s6GuAw//TXgbWEb85bt+2X/j8kLwdVl7gGV7DCzKg+8qvuaJCjOYYKwsQWv4Q3KI
ey+W8EYrE/hAm7y8o1JYX5aMeO+FWoyt16jWjZnqGdmP6vyOguxU8HIgPoctQUE9
4BTMWOZNCRyi55/HGUZKgpzn0nPrvEr8zx1gyCqtfeH4YRsQ7Vsgnze88bbmkp5j
RHzm9p/77+/zHPro00KeOvUuWApXNwR9Xw8BHOK9MZvgIAXZboXP4V7Sjs3eXGLh
5gfe5j6izeKvmGNAGb9Rm2J1sNhSKVYh0dNCzxJyvXmN5IWJhBjbnl1GobWl81ef
LjqncsNIMp8g+p95jt5zxJ7TCpE59RzlS+FW31fgTLe4tw3CD5EcM1ibMHYdAR4x
s2aLEN2USunPS0FnDIHY6d+s/6ngv5alyukouLoGnQXZhmm2Xkbe5BZzj22/mGq7
ei93TERbuy5NOAJsPol7+BAbKFL9pYELQXVYBlgCY9sOat3JixGiEo9mhoKvvQPP
aKVllQa+K6YlW1LVtX8QetjCdNnKvwj3iuKNT4aNbZg9Crk97hXFcOKbHPWp++GS
WYsVnvo67BZy4C8CkApI25GfuP7kh+sXgv9G2F06pgZKCSMOQl+xd+tGO1tQbh2e
a6e07/DtAnnXylT2zhXOgqM1zIpOYwZ+EusOpKU3mB8QsQ6d/PU=
=GlhE
-----END PGP SIGNATURE-----

--1X+6QtwRodzgDPAC--


--===============4307942240285758783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4307942240285758783==--

