Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4D5D0E6F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnP5FFpDfPfkxNfCzIGryQtgDRYsg/mYEfAboo/domI=; b=JtKzLBZ6/9lworWD/j8/t3UaaP
	w6kGtK75KCZfz9GS6TviqOPaVn+xOvWwTFMjVh9JgMSJ3GQf+JklvoEJYgXqoKHES71LiN7YqN4RA
	IWSSnB6i3/IWQshl+F3qGgUiW5BR2djGANknzzHCGHkgGeWXI4LhZIyLyXKYMLOFx69Z+nIv6sOKA
	eQqHSEVvGzlyt36rZ9cjlmCOj0OAKH3skrVBneS+zd4qcHupTL7II0BFmZqEvGR7PX7fN8ro7izuI
	bs03rJadotw/uzm63APDgUWHwLHNdnjLfB0prPqTZ0mEr1Nf5eI5wkQF3Cac5cRCMxy8D0CEBSOY8
	VP+UnXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qjh-000000074Us-3OJx;
	Mon, 21 Oct 2024 11:38:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qh0-000000073vY-2zjq;
	Mon, 21 Oct 2024 11:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B08AAA42739;
	Mon, 21 Oct 2024 11:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92C5C4CEC7;
	Mon, 21 Oct 2024 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729510521;
	bh=NnP5FFpDfPfkxNfCzIGryQtgDRYsg/mYEfAboo/domI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mla1iWyj+nVKFELG9OM0sl2Ck1pK3QghS6o/oTV8/yZO3sp8Lrhej6jSyClxHf+SQ
	 thPx5XAP1aAUIJ1n8IT0COeQ4y0ZeVIqMSpf0KwzwyvEUW9s7CpWQwsoC15nBySc43
	 1cy71HCUjzwiKPiqnJy1LGnFMjS+WcWEl/d6TXrgcRP3gxmWkzvOsGdhscwZhcZYrz
	 xhHGMzlQnf9vWaZ5V5glMtdfRFtUVNGW7ulbJj5vilV63osFGEpT2UZxNnnfvBzD/p
	 Yfm4VG1cmtIGDWWByk79cW/pP9OY7bGx9FXTAiU4LoOm6WYZbCJdJpch2JniAKpXnK
	 toLAL2wB0CzAw==
Date: Mon, 21 Oct 2024 12:35:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Update device list
 with power-domains
Message-ID: <20241021-january-dissuade-d391a189007b@spud>
References: <20241019052935.553886-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y8NnBLaHu/CIQkrF"
Content-Disposition: inline
In-Reply-To: <20241019052935.553886-1-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_043522_838415_2FE2AD7E 
X-CRM114-Status: GOOD (  13.22  )
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


--y8NnBLaHu/CIQkrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 01:26:56PM +0800, Fei Shao wrote:
> There are two kinds of MediaTek DPI devices in the tree: the ones with a
> power domain and those without (or missing). The former are the majority
> and are more common in newer DTs. Only three older DTs fall into the
> latter category: MT2701, MT7623 and MT8192.
>=20
> However, the current binding only allows particular DPI devices to have
> power domains, which results in spurious binding check errors against
> existing and new DTs.
>=20
> Instead of diligently maintaining the allowed list, let's do it the
> other way around - create an exception list for devices that are fine
> not specifying a power domain. This list is expected to be fixed, and it
> encourages new MTK DPI devices to describe their power domain whenever
> possible; if not, those should be listed with proper rationale.
>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--y8NnBLaHu/CIQkrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxY8dAAKCRB4tDGHoIJi
0syAAP0c5qRTn8GS7F+N997ftgRYudfJIwY28xnK83tSh6fSbwEAnGMsiLIl6DTW
PLKeegSHvQKodm39IEv39tGUs88enQE=
=R8QS
-----END PGP SIGNATURE-----

--y8NnBLaHu/CIQkrF--

