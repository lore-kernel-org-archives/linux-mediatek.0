Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844F3C27C43
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=griTV/d48tFOAXbKZWjbvzau5IV3Ow0cB3k5rjAzDCA=; b=jQ3vhHPZq5sAdwP+SKVPLEGOtQ
	U2XQ0Ad9u9Z4RDV2CR8LE1jFD7L93SGXbVDEj/Wjxg75YAegWp0l8UW0vMUZxRNUmmqS+gEzYsjCN
	WqlRkZHrQn5nThtMFE2oYE0QdsJ9OHQMzkpvo4o8p0kgnFHfFFOQbyYM2dlZRZtmadA1HVZDd03BS
	x6bUZKqGN9drfYIYv86LyTKwAvXGdmbDQqFEdboIXwOHdk6CgTjUph09dAm5pRsMbL8oPu5SELRFj
	vv2Uj+XA1tb8TgiSMUuKXHcooqkAhSAByTa9J9ohqF+q7fo7eIJzxhE2wWH2Tlzeq1iZv2vKWUneu
	c0ekrDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByKA-000000017Er-0P7o;
	Tue, 28 May 2024 15:01:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByK6-000000017Dp-2bnk;
	Tue, 28 May 2024 15:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FBEB62183;
	Tue, 28 May 2024 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70411C3277B;
	Tue, 28 May 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716908468;
	bh=griTV/d48tFOAXbKZWjbvzau5IV3Ow0cB3k5rjAzDCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhadhZBeE18WbKLGgiooW0VxGSBMEhOGF0MwqnuuP6kyWUWmWddS1L6G9AB8+8lm5
	 jd1V5dCU0ZRklMWsON+LU9+l0O1ByZ/Y/GmZcuj+JmkXJ4KJgwz7ebYT+N0RXxE8Ho
	 RYFvX1N6JjSPzDnv+ut2SQFeIBGkeyW1blw4RemLnIUH0d/6ZH6f4/2NPFmLXfsiEJ
	 4bf9tDYqxR3zJ40ngwSx60e5oa/NG0NRfU5cYq8NB2LXw9ECQLxIAXSdmyIMlO58s4
	 i8JBbcvamnRvXTHGyIgoaPbSQs2UO3v5DCr+FVPkSJNsHSi2QUHSpSBXpUn9MlF49l
	 fsEWFwyBrCeKw==
Date: Tue, 28 May 2024 16:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8188 SoC
Message-ID: <20240528-flattop-foe-05d6ba73cc06@spud>
References: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
 <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lmQ6jMLH/WOT5YCV"
Content-Disposition: inline
In-Reply-To: <20240527092513.91385-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_080110_750955_B59A286F 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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


--lmQ6jMLH/WOT5YCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 11:25:12AM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Chers,
Conor.

--lmQ6jMLH/WOT5YCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlXxrwAKCRB4tDGHoIJi
0gxEAQCJxm0YW/F3sE3EG2ygW0Xz2I0KMa2JKGoLWElXy5gVRgEA4qAauCj9sAWK
GjEwoDHxelJzjM0hfALT/Qy2rP/GQQg=
=atEx
-----END PGP SIGNATURE-----

--lmQ6jMLH/WOT5YCV--

