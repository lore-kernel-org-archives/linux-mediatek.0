Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9F3FF8855
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSFWp3erMZ3YNZR58ox5Qm8i/vph5WjE6Z6SZf5MXoA=; b=CLydq6NY8H6hIvAPfz/BqGSKhY
	oCn/HyOqDn09hn+F7ywAGMvbqx1JH2/Q6+iIUSf/J9FUG+GyWEjpvFaQOliHRKbJcK4RwbVPPt8MI
	OVsalOBkCRZP/QHskDj5m3q+3eJ0vgaSm4+6cKFRIr1iEvRwSaW/6BKEXQ3bQwvrWc6wOS7D6qVo+
	2tFMDvRwcSRiWTvFpngaaf+VDuggfrTIAV+sKd5AFL66TcV57jPx0cvNOIbnCLe9GoWe8gGfHCn7h
	jwqLK8sQOHoZMLpxmKh1M2E1vKOkFh4CB2F4GbY4JMBPbWq0HRgUthQsuw/sV3CHeMGrse2xkGbg7
	63ZnRwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNly-0000000Hb0L-0z1L;
	Tue, 05 May 2026 21:57:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNlx-0000000Hazd-1Khl;
	Tue, 05 May 2026 21:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 518796024D;
	Tue,  5 May 2026 21:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6846C2BCB4;
	Tue,  5 May 2026 21:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778018264;
	bh=19QX2DAOb5GW7mj1Ise2H6sMk8IFcDd7mtrS9rwTSNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LouK213KjLKRgizKh9mSQ5gog/EDLXt1h/VOfmoDGf+rQ43AedS0+KhancFJBKe43
	 r8Y0geTA+aNfyTCNS//mhuXbhipEnX6xytHJyq3s9GN2gIkYq8KaWPNwY7swOlZ1yj
	 V8W4S45BtrImyyfUNMNbYxlTn0vv3JzC0AKQhJ21Tb2PNkyMVwM3DAzfWdHKx2zlnK
	 0SBNecfkb9j2blcLjM33nWNvoIQGOS6/5FbFbVG+v9q43+YQuyx4yg75f3301L2sET
	 ssis6JDZkeHjZOtbLvAbxwwSrfUChKchMcK/pMAwCyX3S6mhz+SGqG5Vh4uLGlp7nc
	 GFlshaPtmFyzQ==
Date: Tue, 5 May 2026 23:57:41 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: add myself and Lorenzo Bianconi as Airoha
 SoC co-maintainers
Message-ID: <afpn1QKMV3fGqsyl@lore-desk>
References: <20260505122416.2609-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MAEa3y0gXLrhHdXZ"
Content-Disposition: inline
In-Reply-To: <20260505122416.2609-1-ansuelsmth@gmail.com>
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


--MAEa3y0gXLrhHdXZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The development and integration of patches for the Airoha SoC stalled a
> bit lately with the result of some patches getting lost, not applied or
> even flagged as accepted, archived but never merged. The Airoha SoC, given
> the similarities with the Mediatek SoC, all goes through the mediatek tree
> and it's understandable, given the amount of traffic, that some patch for
> a different SoC are missed.
>=20
> To help and improve the situation, add myself and Lorenzo Bianconi as
> co-maintainers of the Airoha SoC.
>=20
> While at it also change the status from "Odd fixes" to "Maintained" as
> there is an active effort of maintaining this SoC.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Cc: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21c0ef0b9ce5..bd814f20213d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2385,9 +2385,11 @@ N:	owl
>  ARM/AIROHA SOC SUPPORT
>  M:	Matthias Brugger <matthias.bgg@gmail.com>
>  M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +M:	Christian Marangi <ansuelsmth@gmail.com>
> +M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> -S:	Odd Fixes
> +S:	Maintained
>  F:	arch/arm/boot/dts/airoha/
>  F:	arch/arm64/boot/dts/airoha/
> =20
> --=20
> 2.53.0
>=20

--MAEa3y0gXLrhHdXZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCafpn1QAKCRA6cBh0uS2t
rBQsAP41fwEIU1qNAMBinI+XVpNsQh3A6FnlkdpojwP/m50TQwEAqCFv1I/rbTi9
yBfKpoQ1M5UlTikfxWb4IKxzPChvdAs=
=dKry
-----END PGP SIGNATURE-----

--MAEa3y0gXLrhHdXZ--

