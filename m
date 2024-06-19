Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC9AC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfJQw2fdbIN/qOkY82eaO88otpSglt73f8sE54N3SDI=; b=osPsQPXxTqvxNLSLA6Ldnn+HVL
	4QXrYyq/Z/rGWkWzoxDp0liGqIW2BHh5IyC84EkJd2d8C7nZS49TiACZ7thQPEHm93vCWSNHraD9T
	bPSSf7UNCpHbZLwtgZ+Cw819nwgL2WeRkB3Bg1cmLaEPDUOW/qR+1lhXRFUI0J/2FFqCCjMr7rsZ8
	UMdGOswzoDL+Wjw++M7etjlsG2GJZM9LzwI+K1cePfZtulYIeiLLo52k9rdau7j4Y4x/1pwQAAX+5
	ATjR2764mE8PR2SsFhJ2WKAVRsgz3+wtlZSpAhW9zEmI0pf3qf6hGxbQ5QLcY7vvK53yZ8VqtebLo
	kCH+Ozvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzRe-00000002HM1-01jX;
	Wed, 19 Jun 2024 17:50:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzRa-00000002HKz-05rv;
	Wed, 19 Jun 2024 17:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8DD361DC9;
	Wed, 19 Jun 2024 17:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2542C2BBFC;
	Wed, 19 Jun 2024 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718819399;
	bh=kfvIYYYXhENfQB2lgd26zgh9v3EDCNJsSZYFyuR+SBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lq75alNZQe0ZVzjGWgF9iCE3BtO2VXcDoyEYBDRjg74Hv+mLSeaHQDUDCE9Y/8Pnt
	 ukJfIhxMLSEVfsIKELp6ElCVKI44Fdv7p2jhEqAFiHy2QTYsvSRcNo49LCizREWu0B
	 DCXZG3/ICRNoynOhWCl+OfCvBwcIHEtiku1elw7dtdX4TKTwqNapHzPuWAfsf882Rr
	 pdP/03Hj6f+mlTudw1BgBtxCaPACZOA7WCGsXwUFc++eHnp4T1MSMFMXgrDGBYQU1l
	 A++L7ZmMVLgsNd9hpztW68SWwh3vyCRCsVsTEcBvg5E2zRvnfVGOcy6kxSLfebk3P/
	 VLRy2kM2lO2dw==
Date: Wed, 19 Jun 2024 18:49:53 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	jassisinghbrar@gmail.com, garmin.chang@mediatek.com,
	houlong.wei@mediatek.com, Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com, Elvis.Wang@mediatek.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: mediatek: Avoid clock-names on
 MT8188 GCE
Message-ID: <20240619-sleeve-citable-a3dc10e5cd4f@spud>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
 <20240619085322.66716-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cyPzD5ebqalhMMLd"
Content-Disposition: inline
In-Reply-To: <20240619085322.66716-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_105002_535533_B0941B64 
X-CRM114-Status: GOOD (  15.63  )
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


--cyPzD5ebqalhMMLd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 10:53:22AM +0200, AngeloGioacchino Del Regno wrote:
> Add mediatek,mt8188-gce to the list of compatibles for which the
> clock-names property is not required.

Because, I assume, it has some internal clock? Why do either of these
things have no clock? Doesn't the internal logic require one?

>=20
> Fixes: f2b53c295620 ("dt-bindings: mailbox: mediatek,gce-mailbox: add mt8=
188 compatible name")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d7601398..55d4c34aa4b4 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -62,7 +62,9 @@ allOf:
>          properties:
>            compatible:
>              contains:
> -              const: mediatek,mt8195-gce
> +              enum:
> +                - mediatek,mt8188-gce
> +                - mediatek,mt8195-gce
>      then:
>        required:
>          - clock-names
> --=20
> 2.45.2
>=20

--cyPzD5ebqalhMMLd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMaQQAKCRB4tDGHoIJi
0qzoAQCbPlRk5egc83ziM5jXYPCmJMaADhzH2l5S9aOOvAPhAQEA/qWFFnhAnsFU
k4cpnxAR7PDqgTBWGHNsR9LvHRcEywg=
=/di+
-----END PGP SIGNATURE-----

--cyPzD5ebqalhMMLd--

