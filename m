Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D36BE92FCF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 23:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pjlo/QF9q+Mcce6tVQl3O9Br6iA+wA2HRRcI3UyGk0=; b=hPjE0N4feOkKYzc0BofmH9gYIX
	FUFH9ig8u+awjGhguvJPTuOc5BjDZ+rtO+ZYvVWrvXTl3rD+Gd6UeLW1NKIqHLsarefD4vATaYKmh
	akhMVJZslqPEZxlbYFE1vBhrBp0Oui+LvAecSbtF84xjl/9G0bnvKFyE5xavDgNjUyAR4vQdjNhQ6
	zFveLhA525AXjdUBqykt7fYnOKR8EN6QcEANE5lpycckdthhkK0ycKvgs+IDB0vMBQNvcjf8pmfyU
	zUYYaRR+nzURq0DurCEsLvWL60j4rpJTWECfx6xdZyQ09R1YeDcCJa1Nm2G7ttDh4DLJw/MDhAkEu
	X+tOhlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoXta-004cP8-3B;
	Thu, 05 Oct 2023 23:36:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoXtX-004cO6-1q;
	Thu, 05 Oct 2023 23:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5C5FFB82728;
	Thu,  5 Oct 2023 23:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB365C433C7;
	Thu,  5 Oct 2023 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696548996;
	bh=jM/w3fzfVHdmadDXFozFx6NFKuTnREVwExPWlfdgFgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUcWtuyeYhbG07u6HpTAvW7DOS7G42XnmLKPctw9KA5fA7aKTjvKyKRAyWtmTUAQ0
	 Szi4wmKMm8XKxe4YfpLFwtXgKjj9Pc4uCHAeZOLMwzngDZ9rQQ9oJTko1XtWa0fSXn
	 7PyMBndfHG799/tObcqH35jZBPOWOyCyjlmIo64FZMwCsNs4aKV0IRU4SjNv40tsra
	 Y06D0H2PIHB0Xaxl8t8w9upqskBQH3vAHCHylSPya38VP7cBy8tPkmNkTPTKSKHlv4
	 0FP/FVMx56J+3Y/rl3LCXkyvdE/erFhPPVhPx+D8dh84tYl4d3C4ZoXdOLDOGpU4+n
	 5pSr3IZIZGfEg==
Date: Fri, 6 Oct 2023 00:36:30 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
	u.kleine-koenig@pengutronix.de, linqiheng@huawei.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
Message-ID: <20231006-jinx-playing-261e5f41ff7f@spud>
References: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
 <20231005104905.120544-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gIB/z/xC+ykFsm7t"
Content-Disposition: inline
In-Reply-To: <20231005104905.120544-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_163639_914429_2759DC74 
X-CRM114-Status: GOOD (  16.01  )
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


--gIB/z/xC+ykFsm7t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2023 at 12:49:04PM +0200, AngeloGioacchino Del Regno wrote:
> The MDP3 RDMA needs to communicate with the SCP remote processor: allow
> specifying a phandle to a SCP core.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>=20
> v2: I've dropped Conor and Chen-Yu's Reviewed-by tags because I have chan=
ged
>     the description (so, the patch actually changed a bit).

I dunno, you made it more informative so you could probably have kept
mine at least.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
>  .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 7032c7e15039..59dcea797b71 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -45,6 +45,14 @@ properties:
>        include/dt-bindings/gce/<chip>-gce.h of each chips.
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> =20
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the System Control Processor (SCP) used for initializing
> +      and stopping the MDP3, for sending frame data locations to the MDP=
3's
> +      VPU and to install Inter-Processor Interrupt handlers to control
> +      processing states.
> +
>    power-domains:
>      maxItems: 1
> =20
> --=20
> 2.42.0
>=20

--gIB/z/xC+ykFsm7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZR9IfgAKCRB4tDGHoIJi
0mYNAP94jJiEEICc5tNh0nDrkI4gQqpKlFv0/+qx4Ml3g4MyRwD/bq/qU6AsenA0
urxwY3sdNT0Qa5qIFRnbeDawGz/Y9gE=
=bidF
-----END PGP SIGNATURE-----

--gIB/z/xC+ykFsm7t--

