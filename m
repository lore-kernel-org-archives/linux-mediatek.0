Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E46C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2ipRpigGaWNbBsPqIM07DIQHhTMqx5qe2yMJTZ9Rdo=; b=Y2FKwcqNTlRJlcaBq7FgYJsvlV
	JUakIGX4pde9QXZkV/QxMaZx9f6+ErK4sSQ/ELTr25oSKi3kFjWEHEiQ5F+IHkiwTfKxJF0/F0w8G
	ro2bIpkNAv7qd1S3Y0rzr8wj20XGisXlNXUe4sZRyqWZgSWSqhqZfEGmZ520l5j2dG3RpXpi8gfaA
	0z+Lks9dNKviTfm+XDPDZy51pHiTxxo5ALsEBIh4wxRQtLiC7Kyuqc3qSE92Zy/IZmU+KC8Mh8kxZ
	ewtPJxJy0bF5dEAKvTBulBnFvF5nTn3NEAvWcTeFYeAkSVsvbnnyX6EZPqVKBrE2AFGPE+OfI9CH2
	1O9m8mMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhwZe-001aAU-02; Fri, 22 Apr 2022 16:56:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhwZa-001a8v-T2; Fri, 22 Apr 2022 16:56:00 +0000
Received: by mail-lf1-x135.google.com with SMTP id g19so15337761lfv.2;
 Fri, 22 Apr 2022 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2pYMeHUvcayBz/9UI4GynHSCHFwlqj2AHLeRRSA2YCs=;
 b=krXyhcne24yR9Gh9Zw9iW5pAPfymD6ScOTFGCbwgAiEfrdkto4s0WJKBkiyMT9wS8U
 qiZ7Jeg4UtHkQycTkuZGLLXyhFIg28tnP4MQtX6j3dYWYo+1EYN3FDI1O4FjoZpL63r7
 QuM0xTeyJ5IS0MuRNgZGFlo4BSax11D4NhIfsyHR51g700L3yGXcPgJHkP2wbd6Eor5n
 rU3y/q11XVacnnOn7FMunwUUEC1z4BWbibkdKs4mGKjzBnft6qUcb0lgGy0thSIrv+h3
 VDLdceA8c369rBPYYPT2F5w8MsDASgxJ3u15mtaP8SWcxy8OPYBCl/mj19AmQKdFPS2A
 3TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2pYMeHUvcayBz/9UI4GynHSCHFwlqj2AHLeRRSA2YCs=;
 b=sWPHoVB2TjYgrSkeYg/238mmG5d/xulh26xRgjVVi+c5KU1zAofl5SPqtMbb8RWxRA
 jOzZ3PHo7h6d0sFJ4oTb+GhTGm2oIwbo77p0Jrd2UCLF/TnyLgwy7Ue/O+yv8HZIdXe5
 TYI44a3jEUZ/purKjsogAume/qID63+b+fuLwOLqtyqiDpbjpDX1LlVNfqA87/rR3k3g
 aiVQhHn2foe/UB44n1QUyHq32DONklIW8/8aYLLcETlmxq9j+O3POjbZlFnH2hCRcQUc
 MJQAUR7F4cxnfHrYaUDyPHc9TVKkbjB0SGjvdVtqR531Nc1JMBVpm8ubDysaTlgsvlza
 152Q==
X-Gm-Message-State: AOAM530ZMJ5YIs2AZB8nCsOU9JMkCPje+DwSxS3NhbQ5cSNFB8wHqxhy
 qVBlcNV8x8qMIt/0QGD4R+Y=
X-Google-Smtp-Source: ABdhPJyCViL6TK3OhUnGEKGOgIn1Xu+YgBPckSSxDddGfTZMPnPildVIxagVVGzqWFFbTgRd6cy4kg==
X-Received: by 2002:a19:5f0e:0:b0:44b:111:1622 with SMTP id
 t14-20020a195f0e000000b0044b01111622mr3758916lfb.161.1650646557381; 
 Fri, 22 Apr 2022 09:55:57 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 a2-20020a19e302000000b00471988e79cdsm282219lfh.180.2022.04.22.09.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:55:56 -0700 (PDT)
Date: Fri, 22 Apr 2022 18:55:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: xinlei.lee@mediatek.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,0/5] Convert pwm-mtk-disp.txt to mediatek,
 pwm-disp.yaml format
Message-ID: <YmLeGaZ0hX1kj9+v@orome>
References: <1650284456-16407-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1650284456-16407-1-git-send-email-xinlei.lee@mediatek.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_095558_976703_67960C6A 
X-CRM114-Status: GOOD (  13.72  )
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
Content-Type: multipart/mixed; boundary="===============2820623563141012914=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2820623563141012914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LcAPuwLqmWX+Fefx"
Content-Disposition: inline


--LcAPuwLqmWX+Fefx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2022 at 08:20:51PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>=20
> Change since v5:
> 1.Add interrupts property.
>=20
> Changes since v4:
> 1.Base on Linux-next.
> 2.Cancel removal of mt8167 compatiable patch.
>=20
> Changes since v3:
> 1. Combine multiplexed socs into one entry
>=20
> Changes since v2:
> 1. Modify the PWM name to DISP_PWM.
> 2. Include pwm.yaml.
> 3. Separate conversion files and add/remove operations.
>=20
> Changes since v1:
> 1. Fixed formatting issues mentioned in the v1.
> 2. Delete pwm-mtk-disp.txt.
> 3. Add mtk_pwm dt_maintainers.
> 4. Add "#pwm-cells" & power-domains properties.
> 5. Make dt_checking successful.
>=20
> Xinlei Lee (5):
>   dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml
>     format
>   dt-bindings: pwm: Add compatible for MediaTek MT8192
>   dt-bindings: pwm: Add compatible for MediaTek MT8195
>   dt-bindings: pwm: Add compatible for MediaTek MT8186
>   dt-bindings: pwm: Add interrupts property for MediaTek MT8192
>=20
>  .../bindings/pwm/mediatek,pwm-disp.yaml       | 75 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 45 -----------
>  2 files changed, 75 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,pwm-di=
sp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt

Applied, thanks.

Thierry

--LcAPuwLqmWX+Fefx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJi3hkACgkQ3SOs138+
s6Huww/+LcxzjgeWvFFCu2uvAQB4pL5HxJI4grLWEbFg0ZLeOWl664dx3po5VI65
cMvtk+MVuoHjnUC4OWUXHIzrj0S9dGtyvMzD0XfeANgoS0j/+5HJ4ywhkRyhjd/k
SOFBE9f46qErRtUub+9XlH5v5CnpjVraYhlhHPYUEYEAhUzX8XC+4AzpJIY1hb8C
D/rOhvyjAPzk8OzGlNpRwM3N1qH7jZI2PIF336N3TU1yMo270dNroGVPEIm/k1bC
ToO6cYUWNsduq+i2n1d38CqDPwrhEvqvL05vvLZO05zlBCevqFsR1fTO3cE9nD5c
cv0MWGU7hSsxJaMdu8V7f65vVtTyeshyo4RYSGlBRfNCTccYTTjl5NU3brICfx7x
Sbp2KbpF1/+xdHYRLPor+G/gTJUuFuSujl/G3W2ZtCoQOIwrs8I/8jFv5HsHzkZU
AZTzahQ1YbmILSDJ0wwxAHDT1/+NwQs7f3X5JosyLmM4I0Admbdx89XIUCszVruc
dVn6CqNbLcJFXvyuKDauTjzYXYBgNwHq65d1qiy724VnkfJ8vnmCa6G+XEyM6oeJ
5WSIq9As3pv47IjTPf7esxka9YQLAMVis4wxFTXGkjTEx809Rxz5KXr2ZwKBke+5
Tw64dlGnIGEdXu0nklgQDJLJDG6fUN76A6KxE8oRr4eK9mcbV3Q=
=KqxN
-----END PGP SIGNATURE-----

--LcAPuwLqmWX+Fefx--


--===============2820623563141012914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2820623563141012914==--

