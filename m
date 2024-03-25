Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F2C54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuXoZCdostDrFpH15Qo3iGpc1ljZlvUtdVpgd37wLHo=; b=yO6zUoiePJ6H2+zzRyFiKniOlk
	JoHo3O4U8aSAC9SmLWNrVNJfo1ZkhkzlPKJMuurreDRsLP0LkAuX6VGeAjUNi/MkprcatB4qKqSSA
	Zb8YrbbjNnwGSMUd9nPWUweLcdCFroKu7c8OUkeirPKlKjml3rYeDNbbzI9hu4hk7Q/hWa30fL5Du
	x0j6n4y9V/HXAMdFuozMZHt5/oaEDzgt1ZWN4J2LY+r6T2v+2Z7pPfZPPOhXduSDCgCrfp5jR37zY
	5B+8TGQ29/SLAKKa0CY8Yq6HRKj46isEPF+LvQiFyJAisH19puBD8jj1XKCbewsfoDoztrZYo+y+j
	kAVLnPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropTU-00000001SmP-06on;
	Mon, 25 Mar 2024 18:55:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropTP-00000001Sln-2mTc;
	Mon, 25 Mar 2024 18:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F2116114A;
	Mon, 25 Mar 2024 18:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2307EC433C7;
	Mon, 25 Mar 2024 18:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711392906;
	bh=HuXoZCdostDrFpH15Qo3iGpc1ljZlvUtdVpgd37wLHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ce19zb8UiLDL/1zxhZ2Pft835jYvZSG/haMhGYB7Wr2/B7KgAjJETbCGZ1HkZUeMm
	 d9hyQtVHhD+Prd3NdwNNTn9omf4z6XuT7w3QP/trwofP8e5qYRzww8ECSVzDWtxlqY
	 VJ5ZpHx1BWflb4mM3IKjNAzQiD6K1TNx+WM28ZBQDWe4cxXw/YNt9trolRDT9BT3yS
	 hoHjQjByNNuLGDCCVu5fBsbVK6lWXZJhRlDsPIHiToFVIACCFcJZP5JmVSD+q2mMDz
	 nF5WmX2WGL4V05qDATkYQEN+d1SHNXgMHbu/rZ0e7rNXJ13zs7feD0N82eNmCUiZEB
	 GQOjlubp/Kriw==
Date: Mon, 25 Mar 2024 18:55:00 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, amergnat@baylibre.com,
	moudy.ho@mediatek.com, hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com, u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: soc: mediatek: Add support for MT8188
 VPPSYS
Message-ID: <20240325-sternness-capsize-f01e69fd5b51@spud>
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
 <20240322092845.381313-2-angelogioacchino.delregno@collabora.com>
 <20240322-lugged-tabloid-3d5a85dc58d0@spud>
 <f90b2c8b-6eb3-46dc-abcc-600248218b4e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IcmFJ4HTwNob2iDV"
Content-Disposition: inline
In-Reply-To: <f90b2c8b-6eb3-46dc-abcc-600248218b4e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_115507_770403_2FBF5F49 
X-CRM114-Status: GOOD (  15.33  )
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


--IcmFJ4HTwNob2iDV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 09:23:58AM +0100, AngeloGioacchino Del Regno wrote:
> Il 22/03/24 18:42, Conor Dooley ha scritto:
> > On Fri, Mar 22, 2024 at 10:28:42AM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > Add compatible for MT8188 VPP mutex.
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >=20
> > You should at least mention the difference between this any anything
> > else.
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> It's exactly always the same difference for MuteX blocks: different bits =
to
> activate mute for some IP ... but yeah, you're right, I'll shoot a word a=
bout
> this in the commit description on v2 (waiting a bit before doing that any=
way).

Yah, I'm just pointing it out because it goes from an immediate ack to
having check the binding in-tree to see that this is an enum (although
that's due to the shitty looking diff that you can't avoid) and check
the driver patch to see that this is in fact a difference before
acking. I wouldn't bother sending a v2 if this was the only thing, seems
like a waste of your effort.

--IcmFJ4HTwNob2iDV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgHIhAAKCRB4tDGHoIJi
0qyCAPwNc6YpOHxH4MFoBa+5ozXwV4HdU7nhnOAxax2hDSnLdgD8Dsn7gmIq7ESV
cdzVJ3ykJWesyZCqaJEg8C/OPtEIiw4=
=6BOw
-----END PGP SIGNATURE-----

--IcmFJ4HTwNob2iDV--

