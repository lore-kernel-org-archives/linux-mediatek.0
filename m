Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87B5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+c1FSGWgD9cM4vzO0eUlkz8umfhPA8HpTMHaj7QKeM=; b=f3Ovus6GFw2KIvmAFhCbb4IEST
	7I/2LJXddRuYQwgp7Krmtxz/MbnrkVDKDGmv9GENI41C/0sxY6/M8O0FjHUNUwStPBVeIlSAnr5Gc
	OlY619cwaoafxmIlNECsPabDqF9/JUXv0/lh6KGQtoDygiLEmVQ8jNAdQ289IFfGbX0zQAGYFjn85
	Q0+F6+JBTKigdBT4cXb8J5Le0ZFcLgB5lFgc3xynyc1UOOrBgC9PEfsKHpc/SQwnvcCEqaA17PGC0
	UABVqfwOs2UOQRKy/ggpzl+TZZOCUDVruucP3jIfp2TGpQi1fEL/lvt3q7lIsUOrsEa0ICAhs3Ra5
	9nzuenLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhwap-001aab-UI; Fri, 22 Apr 2022 16:57:15 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhwam-001aYk-Ph; Fri, 22 Apr 2022 16:57:14 +0000
Received: by mail-lf1-x12f.google.com with SMTP id h27so15049141lfj.13;
 Fri, 22 Apr 2022 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bPH7VaBfkFbtZZotNuuTdskPihD6+M4P5/MTINbvQUc=;
 b=Pe+UOZBQErS+Z8nmGZrZH2ly5AmAXR/nub2maR1YBDg2mW5cI8XFN7kRpzR9zJR1g/
 RCcytxziQK15Y/+UhDwpzPO/z8urhmQ15jD9UMpIVuXdvYk4ZA9FMtQi/zELESwjYQ6k
 oawpnRmK4g3hu3fT3s6md4XsDn4X61bzFwlVcJy4oKKXIIa+Wf5SbsrYbGooZQtu9T6w
 mMrQaS3i1Iz83k0/NJ+NcahILWGnEI8wU5g8Ena+3kmorM7mSBcU3mLHYmzUGfSY57bG
 E+QiOx9uS0cC7R96ZHgDOYCEZyLap5NE8EK+uYgY9glo5SCpnjSPQ7hN8GC1SPl/HsYy
 6IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bPH7VaBfkFbtZZotNuuTdskPihD6+M4P5/MTINbvQUc=;
 b=3+0ZhdsbU/8HZniLPfmW7lJ1KwmNL5xpgFx+GnAPicBiAAETsKcqNcVyCbpk2EglcR
 9M0VCbbahyGRXHMKrv6kk0hc+M2gd/og00YlBvSdXJS3qFXj98lX/rAur84+R7GJhxHU
 tohVSX0C9BomD6uACYiiX/A8sbVXLzCkH3969ZOCcW3NkrwYl8kf4Bvht9uqaKAi/aLU
 KfNmi6mE/k6GBMj3Go4fU0YPquDKyr6MDshtbWMkGlki2MlhJIu1V9MqeEw1HXNB/s8j
 PGpC0h/eP3JmdY5MSDUWyJIpTcd0ezVKnDHAzfx2leWFldxfMoMFXqC4xKTt/DL7Ao8M
 syxA==
X-Gm-Message-State: AOAM533bmoucS0MXWAjecCFicf+x6lFcEnowntmXCrRQzapCVhVp3tN0
 IUe8j4E2Hzmn3XH3GgsmEpw=
X-Google-Smtp-Source: ABdhPJzdFQvGzdSLbrSe+adt+pVkjulM8+IbVohfTKqNcWpqfyrWUedIVpFG1a8BPbVbvzAdinxkHQ==
X-Received: by 2002:a05:6512:2213:b0:471:c296:b659 with SMTP id
 h19-20020a056512221300b00471c296b659mr3848330lfu.24.1650646630354; 
 Fri, 22 Apr 2022 09:57:10 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 r9-20020a2e8e29000000b0024da2131ed9sm269715ljk.100.2022.04.22.09.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:07 -0700 (PDT)
Date: Fri, 22 Apr 2022 18:57:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 xinlei.lee@mediatek.com, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rex-bc.chen@mediatek.com, jitao.shi@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6, 5/5] dt-bindings: pwm: Add interrupts property for
 MediaTek MT8192
Message-ID: <YmLeYOOCNciqhykt@orome>
References: <1650284456-16407-1-git-send-email-xinlei.lee@mediatek.com>
 <1650284456-16407-6-git-send-email-xinlei.lee@mediatek.com>
 <a92d3b46-ace4-2d19-fef9-c59cd1a596ce@collabora.com>
 <20220421134808.sqnecvysuzlgdsz5@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220421134808.sqnecvysuzlgdsz5@pengutronix.de>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_095712_904882_E9EF4630 
X-CRM114-Status: GOOD (  18.44  )
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
Content-Type: multipart/mixed; boundary="===============8443046380128088201=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8443046380128088201==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xn43fwg7L9AIf1Ta"
Content-Disposition: inline


--Xn43fwg7L9AIf1Ta
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 03:48:08PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Thu, Apr 21, 2022 at 12:17:00PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 18/04/22 14:20, xinlei.lee@mediatek.com ha scritto:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > >=20
> > > Add interrupts property of pwm for MediaTek MT8192 SoC.
> > >=20
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> >=20
> > Hello Xinlei,
> > the pwm-mtk-disp.c driver does not support interrupts.
> >=20
> > Please add interrupts support to the driver first, and only then
> > add that in the dt-bindings.
>=20
> in my understanding the linux driver state and the binding documentation
> are somewhat independent. Here I'd say adding the irq information to dt
> without the driver supporting it is fine.

Agreed. I've applied this along with the rest. It doesn't have Rob's or
Krzysztof's stamp of approval, but it's a trivial change and looks fine
to me.

Thierry

--Xn43fwg7L9AIf1Ta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJi3mAACgkQ3SOs138+
s6GaAw//VlLPxZ1xhdfymBfdZxhQ5KeACuZ6k/asJF7IV7j+qF8lPEGixgDeaLZF
g139oHKqts/KjwLRBEerRUOKC1om/nZNbnF5phGdFXBhNCHPbgPEDXwDh64O6gNN
VYiOS3e+9/UWgo18fkjE0vAtlf5BOytzKE3dxheacU29YENfK5mfajrP5OqsMmgs
SXvoMWRuq2ni51pPlj1sNIoeK3FBwvM8D4yFHV8Ns/jpDRmIXqBafYUc0qu3l5yQ
fX0ojlbaDppJ8YFyRPn7PDY36hA8siLvW9WCJ4GB0sAZeG1ZlA2zvMSFxNLz+OIE
Xg76o+1+zMuWsHCCvay7Q+ylNlyyVCS4Kp33Ho8BMIHS2WLm1L0wUvaUGAHH4f4h
I6TcMGxu++kh6g1LXFAZ8HCwUG8J+HdJiYgfKEH8DQuqzYfWl54GA1Gi65+zpCfA
EoMbL4Ja/pb3QjlgtzoGWoGF9qMUigUy5DlICAJJs+JsI84YGj2UNCFS3uXCHOsC
/Mh5APkBEz0hI8eF7jWhdpjsD1Fsl04aaHjGn0iIIKw8fHE1XoJXN85aU5jdKS77
bvuAn7dcSlpasoPaUgIBnje0T7SGp3YKzaJs+PiRE5rxHitjMRLa0umLL/tKMhUE
vJCoUPamD5R+OoQIeG8sXKQYV/+As6q8kGd21nwJI4AIJ8QhaIM=
=c+hp
-----END PGP SIGNATURE-----

--Xn43fwg7L9AIf1Ta--


--===============8443046380128088201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8443046380128088201==--

