Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A732CCA0EED
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoHq57GdW63fjI95EMO6BBdBkYDiS5PmGhz3tstwaXc=; b=WBiDBwnu4MNK93kwrtXWPRZH7K
	8uX3FH55wxXOF29KDJSaHvyKLqbMotfaqzxerqsQI9g+vEpv4EvxzbiZtxyKlEJ+wjAGnM6tth+Uy
	VXmawNuUtetKhRrHs+/KiK/QCPNxJfJFFEDXuOU9zlkAr9O38gu5VjwiCmy0Z79XHZ4Q0+IgK57nx
	Aq8MMIHPRYRv9OyIkXW/Olh8INNuXzZZW0fxnkiDL0xhexGF7ekzwdft4B7J3RNxaVQTmhr/DZNFf
	Z+NuqUG+c1wT8nbeNDeH4FHM9yLxx97L3J2JOyvliWsnf4Qb57zOOdV1yylbzq/8Rliio0DrcZAEV
	Cq0V92LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uos2c-0000000FAaJ-2fpp;
	Wed, 20 Aug 2025 23:16:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoolT-0000000Em8z-1UJP;
	Wed, 20 Aug 2025 19:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E3B9A56E3D;
	Wed, 20 Aug 2025 19:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D471C4CEE7;
	Wed, 20 Aug 2025 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755719190;
	bh=P60wwoesTBMO6te6dk7a3L9wvODtWEgPKYSFfA3IV9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHXlXu7yMOieX9RRwAvjK0zfFwWqf17kpDMgHbH0XybZ2crRGcSTAeOMIuxBWj4Gz
	 1/BiA7hDZLZnSFHpBqujjSIcc9D/HwpB8Dr28x21xtl7j4TGxxzajPo2trwoi1NvPc
	 eXOj1MpsDHo5U4d5AXtjTs7iaQqn3t5xloxhTu5U7F8loGe6IpDp9rXxqNuBm/R8dP
	 +8o6zFe5Cc//ulkbEihHLCzWn8jx+ST+ZqyYH08O+hK77tXC1yTf2NgcZoNEO6DyB4
	 jQQg+SHXQpgczflvLXVoxF9R2+eWQvbZ7vLwvXNJTmBKB6v4dFXl/Ovfdt6k4diO5Z
	 GPdwe7AEeq5zA==
Date: Wed, 20 Aug 2025 20:46:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/4] dt-bindings: mailbox: add cmdq yaml for MT8189
Message-ID: <20250820-conical-feline-ef984cf0a2b9@spud>
References: <20250820093831.23437-1-xiandong.wang@mediatek.com>
 <20250820093831.23437-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6HxqTqUFzbAImUw"
Content-Disposition: inline
In-Reply-To: <20250820093831.23437-2-xiandong.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_124631_462726_FF406DF8 
X-CRM114-Status: GOOD (  14.54  )
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


--B6HxqTqUFzbAImUw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 05:38:20PM +0800, Xiandong Wang wrote:
> Add compatible string to support cmdq for MT8189.
>=20
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Please look at https://lore.kernel.org/all/20250819-coliseum-unsheathe-0c12=
a58e65e0@spud/
and reply.

> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml        | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index 73d6db34d64a..f9718b90d36a 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -23,6 +23,7 @@ properties:
>            - mediatek,mt8183-gce
>            - mediatek,mt8186-gce
>            - mediatek,mt8188-gce
> +          - mediatek,mt8189-gce
>            - mediatek,mt8192-gce
>            - mediatek,mt8195-gce
>            - mediatek,mt8196-gce
> --=20
> 2.46.0
>=20

--B6HxqTqUFzbAImUw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYmEAAKCRB4tDGHoIJi
0oQqAQDPHNuIZcBcVmaKJJTkZVUc6ou8ys3OTfy1DSIdnBdmUgD/djQs/i9p1tUw
TnEoLLHvaQIqQNTRbeNYv6atW+6DKQQ=
=iFbz
-----END PGP SIGNATURE-----

--B6HxqTqUFzbAImUw--

