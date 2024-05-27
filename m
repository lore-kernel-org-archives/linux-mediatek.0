Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3503C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1BDsmlQwhdu8pSjqXWApM0rUAlRIrsJQgYV+C9j7cA=; b=T4FR6LBemd6zDcVEYu7ZJ+ISpr
	EtCP4abUlLtmt9x6o6tORwPiZlW7epzM41DtMeksbCmeVabM6WiHV1Bno5pvw9/X9R6uRa2asZsI2
	2OKp2qvQVgBoG4DWSG/yrTcjc1UOkUKGeG2h2ceaKjHT2mVEkTjdA6vJVHIHLWaZu9upzcP3Tpdg7
	bdQ8qz5xCiN8pI3NXdppnEIyUtDjDQCwnph8U9HAQpxBEV1mfooQIhuMLxppLdRrKgew6anaM1CGE
	cSUWpS86uTlMj5jJ6SxhgxlPGcNPVOa/9GGpEFbyaCcBgMMBTlkNx5z9pGBsxo/EubifFBeDj+TFI
	7RTKScIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBb0G-0000000FH85-0nJO;
	Mon, 27 May 2024 14:07:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBb0B-0000000FH5F-1r2B;
	Mon, 27 May 2024 14:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3CA69CE0F0F;
	Mon, 27 May 2024 14:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFFEC2BBFC;
	Mon, 27 May 2024 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818820;
	bh=n1BDsmlQwhdu8pSjqXWApM0rUAlRIrsJQgYV+C9j7cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ehx7RqtiTvj5UM2EojGrpqHk52rXrmmpEwVgxNg4ez3WeVXuEJpLRg8XVEvdmrbIi
	 XZAuJRh1npz3bYbtsjUh/YnyDryXBLknjyAH+2fnXiAC3o/uXlZj+MxC6TJhl7+uQu
	 PNp3arxQctgWDfxJzJmYskrpp10Ann7gjf6LGKvmumNN0sRXDK8mX7Ay4UhZKU4P+E
	 bXZQEzvWmyGDXC6wpSvzHeGalmiojKSz0HI41qiC1/HaX6fLB4hQWA6jDLPwwXUNFN
	 0r/wqkaGHE9Bn/1GP+O0/xpnM6KIWVr16Fp7YGyNxdmY4Zc79BAHjTImWXTmD2Xa2x
	 tIqnw7GJC01tQ==
Date: Mon, 27 May 2024 16:06:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Message-ID: <20240527-determined-sage-piculet-bfec4a@houat>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lkrd7n7cfhfphpnl"
Content-Disposition: inline
In-Reply-To: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_070703_975520_E6F70DBF 
X-CRM114-Status: GOOD (  24.33  )
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


--lkrd7n7cfhfphpnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 26, 2024 at 07:29:21AM GMT, Jason-JH.Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
>=20
> Memory Definitions:
> secure memory - Memory allocated in the TEE (Trusted Execution
> Environment) which is inaccessible in the REE (Rich Execution
> Environment, i.e. linux kernel/userspace).
> secure handle - Integer value which acts as reference to 'secure
> memory'. Used in communication between TEE and REE to reference
> 'secure memory'.
> secure buffer - 'secure memory' that is used to store decrypted,
> compressed video or for other general purposes in the TEE.
> secure surface - 'secure memory' that is used to store graphic buffers.
>=20
> Memory Usage in SVP:
> The overall flow of SVP starts with encrypted video coming in from an
> outside source into the REE. The REE will then allocate a 'secure
> buffer' and send the corresponding 'secure handle' along with the
> encrypted, compressed video data to the TEE. The TEE will then decrypt
> the video and store the result in the 'secure buffer'. The REE will
> then allocate a 'secure surface'. The REE will pass the 'secure
> handles' for both the 'secure buffer' and 'secure surface' into the
> TEE for video decoding. The video decoder HW will then decode the
> contents of the 'secure buffer' and place the result in the 'secure
> surface'. The REE will then attach the 'secure surface' to the overlay
> plane for rendering of the video.
>=20
> Everything relating to ensuring security of the actual contents of the
> 'secure buffer' and 'secure surface' is out of scope for the REE and
> is the responsibility of the TEE.
>=20
> DRM driver handles allocation of gem objects that are backed by a 'secure
> surface' and for displaying a 'secure surface' on the overlay plane.
> This introduces a new flag for object creation called
> DRM_MTK_GEM_CREATE_RESTRICTED which indicates it should be a 'secure
> surface'. All changes here are in MediaTek specific code.
> ---
> TODO:
> 1) Drop MTK_DRM_IOCTL_GEM_CREATE and use DMA_HEAP_IOCTL_ALLOC in userspace
> 2) DRM driver use secure mailbox channel to handle normal and secure flow
> 3) Implement setting mmsys routing table in the secure world series

I'm not sure what you mean here. Why are you trying to upstream
something that still needs to be removed from your patch series?

Also, I made some comments on the previous version that have been
entirely ignored and still apply on this version:
https://lore.kernel.org/dri-devel/20240415-guppy-of-perpetual-current-3a797=
4@houat/

Maxime

--lkrd7n7cfhfphpnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlSTgQAKCRAnX84Zoj2+
dhjrAYDF6bR4iF7gYsP2hmqjPJbIPGkYuq7u09k5+hu3sX7JKhq1g9n5v5hX7VH6
mU5WwlwBgN4eDfGwGhtYaDZJA62JTLpJVnIl2BS0XO5+OiU6EzKrzRJluNKcWPpS
+8EyU4dfAQ==
=0kUw
-----END PGP SIGNATURE-----

--lkrd7n7cfhfphpnl--

