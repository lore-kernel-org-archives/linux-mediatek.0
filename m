Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD74C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xiZyQ+P1Xz0x+4FTwkxMPkSXfVCdC8v1T9pR7kkqfY=; b=o99C4ZL+ZbC3d+YzKVBx54gY/O
	YYwA4CjpUt5hXqilMMWA6mDWIUvacF8g6yHGqVt3D9ZtYQiMOwINDazyW1fQBhqXOoOwNkyux7Bzc
	sNbAQWtJBph5UJLAjI8hEVy+FSZYctzwHgLrD2pF/4RUgcseDYD/WB+LaESds+rNF+mH5t6I9y2uq
	Agkb6FIhAjO5O32Rqx709Ij6f3dZtSJoDt0yPmH7q4lwIRsIW7oPWWpBAhXAyqp2L56hLj3PArT7s
	w6BoCrs4mJs/9nw8oqv6R4ptccvrMF55xt4B1Uva4eneRpAOPULMSCdHyvXGyltfAbehD3OxxjP9e
	d1JRe3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrzp-006Aeq-39;
	Fri, 19 Jan 2024 16:45:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrzn-006Ady-0F;
	Fri, 19 Jan 2024 16:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49A7BCE22D2;
	Fri, 19 Jan 2024 16:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908A6C43390;
	Fri, 19 Jan 2024 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705682728;
	bh=4xiZyQ+P1Xz0x+4FTwkxMPkSXfVCdC8v1T9pR7kkqfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDqtfRJANZKxjE6iTqUTIFLbR/GJhoBYF58gPKgdTKvz+AYQ3CcZrUml5a5yERwg8
	 w59B9f6CKwtP6q6KMv18GT6DYLzOAmUJ/YXLDSEaa7w7g800H4zQjBFXMXbi3j37le
	 bI73E3mVPdGWQOIkYQLM6aZbrazixI+1rUSIWHtx2+Csz33O8Iyz9uWWe3NuTM0ak4
	 lG+At1EnPMfj6qtiZY1Ye5JxxS5nsBphTDgul2FNO7rnhersaTkgX4txc1EBu+aeKc
	 ExyX+rVSAOy6GxGBG7/0x0as+CNRGz6VZamNCtt00HON59y45/XxnZeQ+jLS3S//dC
	 fzkWPZY2B6baQ==
Date: Fri, 19 Jan 2024 16:45:22 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 3/3] dt-bindings: soc: mediatek: Change
 mediatek,gce-events to refernece
Message-ID: <20240119-amaretto-gauging-5f745a1b1335@spud>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-4-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1LR1bW8RJGTFo223"
Content-Disposition: inline
In-Reply-To: <20240119063224.29671-4-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_084531_285654_66C5399B 
X-CRM114-Status: UNSURE (   9.06  )
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


--1LR1bW8RJGTFo223
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 02:32:24PM +0800, Jason-JH.Lin wrote:
> Change mediatek,gce-events property to reference mediatek,gce-props.yaml
> instead of defining itself.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1LR1bW8RJGTFo223
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqnIgAKCRB4tDGHoIJi
0lW2AQCNJ+Q40bd9LrGWCRk8PNKTOTd7knertR3kHCdXzQusnQD+I6A52S2rMCYj
tJEIlcYZgCfxGjoaD1PG+JlJwlzFbwY=
=94Oq
-----END PGP SIGNATURE-----

--1LR1bW8RJGTFo223--

