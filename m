Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF109C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/sXJWAR9U+t8PuJjd67PbuHh01c02nSqxd7Y8bCUpM=; b=FblH0WyGazgNPcQ8iFd3JyREZN
	gGH0kMnT5BH3ylM9uWKKNFTPEu4d9KkdKriyDqQIjLbLIAbihVj8ypQ0bZPSMUVVyKKPii1xpHUkF
	Atcgd8aWamsFq+MCrlyBmPYhhfYGLR2vw3LneYcgIOek1yGCrM9M35TsLsnjFhc8iJ04U6s5cLKAN
	H/ebQpDCTBCOiFCPRCZ2mCgTo6kujXFDxcMNsFXoLqwSvgf3Jgk9ejdNyZCYVTzcIsHzZbvJmZCa2
	XCTqJyEmINI/tV7//PusNJWHP+Swa24oAoVAAOcMSfr4EVq2J2OD4gtafA3CDgwIt/Mdp2/udGlLG
	mzOyltVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2LA-0000000FwHy-2Elo;
	Mon, 03 Jun 2024 07:42:48 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2L7-0000000FwF0-3IAu;
	Mon, 03 Jun 2024 07:42:47 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 30CEA136A;
	Mon,  3 Jun 2024 09:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1717400554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=l/sXJWAR9U+t8PuJjd67PbuHh01c02nSqxd7Y8bCUpM=;
	b=mKfgfIw0rVXzUB2hP0B2WxtTyKBz9VHQ5GW0H/acJGDGO7XYNyllK5U2aU0laMQOncMNxb
	63+o3L3cwsC9BhAZl30ZY1W9aOEIKA0BadMQEvJfy28XQnJ6+Ag1UrmyyEpsPO+vKug+un
	VIOmTj0ewguhvmUIc59KofVhqUsJ34y4Vz9XPQBBUgMTDGUnRQXFk6+nrb3CaP/4hXmPHs
	bCgss0RdUhLImzMiLhXc+o9Y5G8Q2Shz99/HZYYA3JDlD/Bysg/DzDX2nPvCthzELAPQCH
	N2RKaKynB4Z4wd5LO7zIxX5MplhmoRaMzAQ9NZNTakTdQUCwqGCiLUgX0z004g==
Content-Type: multipart/signed;
 boundary=3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 03 Jun 2024 09:42:31 +0200
Message-Id: <D1Q7OPR0TRFG.1WLSI7EBAPUWX@walle.cc>
From: "Michael Walle" <michael@walle.cc>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v4 3/3] drm/mediatek: Implement OF graphs support for
 display paths
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>
X-Mailer: aerc 0.16.0
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
 <D1BTQIQ2AQIS.G12ROFB149QB@walle.cc>
 <84cd0ac7-99d9-42cb-af79-a0fba09c1ebb@collabora.com>
In-Reply-To: <84cd0ac7-99d9-42cb-af79-a0fba09c1ebb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_004246_040648_00155141 
X-CRM114-Status: GOOD (  18.96  )
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

--3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Angelo,

> >> Implement OF graphs support to the mediatek-drm drivers, allowing to
> >> stop hardcoding the paths, and preventing this driver to get a huge
> >> amount of arrays for each board and SoC combination, also paving the
> >> way to share the same mtk_mmsys_driver_data between multiple SoCs,
> >> making it more straightforward to add support for new chips.
> >=20
> > paths might be optional, see comment in mtk_drm_kms_init(). But with
> > this patch, you'll get an -EINVAL with a disabled path. See my
> > proposals how to fix that below.
>
> I might not be understanding the reason behind allowing that but, per my =
logic, if
> a board does have a path, then it's written in devicetree and enabled - o=
therwise,
> it should not be there at all, in principle.
>
>
> Can you explain a bit more extensively the reason(s) why we need to accou=
nt
> for disabled paths?

Paths should be (and this was already supported before this patch
with the hardcoded paths) disabled with the status property. This
way you can have a common board configuration where all the paths
are already described but are disabled. An overlay (or maybe another
dts variant) can then just enable the pipeline/output port by
overwriting the status property.

Also, this is the usual DT usage, as a node with status =3D "disabled"
should just be skipped. Without handling this, the current code will
return -EINVAL during probe (IIRC, my vacation might have reset my
memory :o).

-michael

--3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZl1z6BEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+EuiAYCiS0ktYeqW3WREzRyRaWz/fZqG9E+chTLp
Eq2F71PR2kPsrQjcJqjw9P8PJP1Tb7IBf1Xo00KNX/YZCxZd7B2+oCO6cjri7/ym
ZBbCHMlAM8XqJvXrDFXC1OxZkA8QuPDVng==
=F2kN
-----END PGP SIGNATURE-----

--3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8--

