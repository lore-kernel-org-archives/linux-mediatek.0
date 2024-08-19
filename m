Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702ACC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 07:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOpBNrOI92TQ4ZWPkl1Is98B6yTzoIz6bUl81y4zhEA=; b=0mQAfuT1JXM4+TtD2Gh1dhIix7
	1uIPU8DSSaxFbeLaG4cwMX0+6fO0Hl2dhFUddFbhhWu+5LSioFHLXbuPHd4GK78ow8IkZ0u65Rd2w
	NRRteY6Qm/idqz2Pls3sRGso4/Ug/r3aA+HQT1DHmNQL/ohH2xFWSG1isBLuTI5lX+xnqpdaH5t2M
	14Ir499q5hFOISLBdT9uk4M8NavjnX6RDgkhUWwzoEAoPHoWjLzyTRc7bWJnyNNh8jrUhztRazBfQ
	8qsQtpkZGyTqoC/dlEKQckRdmwvNSbw5M5+LIRPIEpVemrmlBFOw2t8ujCTK7R+Aits4gaimnZ/gu
	JlkULS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfx48-00000000gA2-2iqa;
	Mon, 19 Aug 2024 07:44:36 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfx3S-00000000g4o-0b59;
	Mon, 19 Aug 2024 07:43:55 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 47F465E;
	Mon, 19 Aug 2024 09:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1724053422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=ZOpBNrOI92TQ4ZWPkl1Is98B6yTzoIz6bUl81y4zhEA=;
	b=q/QX5wAeJOuGxW1q3+OqRP/H2LXUNKUUsK5i99wGbcsHcWd2b+91UQQU7YKylBjWf3OG0P
	cDe/Jp+dxaDN8XYh6B9f069LqIWZh5em36kmqSb/QeSEW8eOx9/dASIjV8xXIby/nClq9k
	5WWF6LLibrcoztsUVig7CJzeXVJgqXnD3o7i+iZjitlkn0nxl64QMdmbnRKxa/Gdkz9GSc
	v+ZvCWzIuRdaw4L1nL5v+qBVCaZoyevct5dp8a/WVpOrWERc67LNDbBVNZ/FFDrtJaNAaf
	gz7TVZwQNApVIXn/7Z9DwgTXZ6VB7XQYvUtd9NjMfDHEN2MVDq6SqCVXhOEUUg==
Content-Type: multipart/signed;
 boundary=324b8864c0f2f3444bbff5e9243c444c17712f463423f9f78bbd8be049ba;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 19 Aug 2024 09:43:40 +0200
Message-Id: <D3JPXJBLA5IH.2FIM5TL0SQ6QB@walle.cc>
From: "Michael Walle" <michael@walle.cc>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>
Subject: Re: [PATCH v8 0/3] drm/mediatek: Add support for OF graphs
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <jitao.shi@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>, <sui.jingfeng@linux.dev>
X-Mailer: aerc 0.16.0
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com> <d84f1469-e82a-42de-94a0-8ee0da0cba02@collabora.com> <eef10e9f-dac5-4a05-a79c-f8026f27f051@collabora.com>
In-Reply-To: <eef10e9f-dac5-4a05-a79c-f8026f27f051@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_004354_359770_34D75088 
X-CRM114-Status: GOOD (  18.71  )
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

--324b8864c0f2f3444bbff5e9243c444c17712f463423f9f78bbd8be049ba
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Jul 4, 2024 at 10:29 AM CEST, AngeloGioacchino Del Regno wrote:
> Il 19/06/24 12:56, AngeloGioacchino Del Regno ha scritto:
> > Il 18/06/24 12:17, AngeloGioacchino Del Regno ha scritto:
> >> Changes in v8:
> >> =C2=A0 - Rebased on next-20240617
> >> =C2=A0 - Changed to allow probing a VDO with no available display outp=
uts
> >>
> >=20
> > Hello CK,
> >=20
> > At the time of writing, this series was well reviewed and tested by mul=
tiple people
> > on multiple SoCs and boards.
> >=20
> > We've got a bunch of series that are waiting for this to get upstreamed=
, including
> > the addition of support for MT8365-EVK (already on mailing lists), MT83=
95 Radxa
> > NIO 12L, MT8395 Kontron SBC i1200 (not on mailing lists yet, waiting fo=
r this to
> > get merged), other than some other conversion commits for other MediaTe=
k DTs from
> > myself.
> >=20
> > As for the MT8195/NIO12L commits, I'm planning to send them on the list=
s tomorrow,
> > along with some code to properly support devicetree overlays (DTBO) gen=
eration for
> > MediaTek boards.
> >=20
> > Alexandre tested it on MT8365-EVK;
> > Michael tested on Kontron SBC-i1200;
> > I tested on Radxa NIO-12L, Cherry Tomato Chromebook, MT6795 Sony Xperia
> > M5 (dsi video panel) smartphone and MT8192 Asurada Chromebook.
> >=20
> > So, is there anything else to address on this, or can we proceed?
> >=20
>
> Gentle ping

Any news here? Angelo, maybe you can just resend the patches?
Because there is already a new kernel release, I'm not sure how this
is handled.

-michael

--324b8864c0f2f3444bbff5e9243c444c17712f463423f9f78bbd8be049ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZsL3rBEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+FUbAYDwODh5ZmA5CgDyBJFBWhdWhPocmMAeADIf
YIj7wM7SyDI0yrNuwDwDHkWqsgqP6zUBf3DRKglqYDugQsOqPOiPOacc7FY1jJNE
JTe4vU6fiHuUR6s+hkfsCPvpec2A98PhmA==
=v4Vj
-----END PGP SIGNATURE-----

--324b8864c0f2f3444bbff5e9243c444c17712f463423f9f78bbd8be049ba--

