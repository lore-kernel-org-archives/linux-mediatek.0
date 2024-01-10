Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7905C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9BbTWhBscTrsdR6Pfy3gZxWfM3wIWmZeuQMxvBvAD0=; b=NJR1OzjmLE1Lnn+YysJd9otpIS
	MjCthvIdxH0ComGjox3gC4qRy+82+720Z9DKvI6LJrlF4M6W12FHDEu4Uyc+7R284vgjkjmL70kYg
	TEKMITv6lI63T9/9g3ZdXwT9EVxfbhSkHBM50ykqjDx6u1RjkpPUaulUB+W9EGXmD9xTEU/yQDlUe
	jAnZisHty/KzHxnyENiWrQnvs61Dnyy5iiL4igYtgVLQgcWisdXh/T9sgght1AiR3zAPKG/NtOHgK
	fymT1nsfn+ftHkVlgrgvPyvYGvu7jOZdUGsc6XwzUaEYvo41z0rezTnd4KZs2h4V/bB+7d0oaN0IK
	1m6suXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVx7-00B45M-17;
	Wed, 10 Jan 2024 10:36:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVx2-00B446-2y;
	Wed, 10 Jan 2024 10:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF035CE1B4F;
	Wed, 10 Jan 2024 10:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E85C43399;
	Wed, 10 Jan 2024 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704883005;
	bh=wyOV/LJsR4E42qHMH4S9CWfQEeQYMZb2sHN/hq7z69s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DfqxjOAzvmxxlrtfgjsBWM5kOd9J6DM1J4iR8UoturW00QX+6YM0H8absFofzutoI
	 IKpGFWtQcpipJDvG2R6Z3+Juv7HqxX61c85UD2onEh640uArHaDqIuCUE4+68wxPfi
	 nBpeUlRh74VF9V6M7Maf5lK7qDwFIerJ7WYMHA07mBPJ5DxEvrheqV0Kn51o1bZ1AF
	 ZVQVIQFPSRwzdwoK1bH7A9d/WnTpcoWIi6VBK61a5hTusaerrH9NNyZv2Uk0fmUJj1
	 2UHz4KFa4AuKOU3x9etbWTHuQ97+r/SkaRyFSrDm04n4Tq7iQ8puOFBw5cSmrEuZAP
	 nDIESOy+HJ1Gg==
Date: Wed, 10 Jan 2024 10:36:39 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 2/4] dt-bindings: mailbox: mediatek: gce-mailbox: Add
 reference to gce-props.yaml
Message-ID: <20240110-grumbling-tattling-0202fc5e21f2@spud>
References: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
 <20240110063532.14124-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHPsus4u3u0dm8mG"
Content-Disposition: inline
In-Reply-To: <20240110063532.14124-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_023649_314082_5573E809 
X-CRM114-Status: GOOD (  17.19  )
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


--UHPsus4u3u0dm8mG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 02:35:30PM +0800, Jason-JH.Lin wrote:
> 1. Add "Provider" to the title to make it clearer.
> 2. Add reference to gce-props.yaml for adding mediatek,gce-events propert=
y.

I can see this from the diff. There's still no explanation here as to
why the mailbox provider needs to have a gce-event id. NAK until you can
explain that.

Cheers,
Conor.

>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml   | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d7601398..728dc93117a6 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Mediatek Global Command Engine Mailbox
> +title: MediaTek Global Command Engine Mailbox Provider
> =20
>  maintainers:
>    - Houlong Wei <houlong.wei@mediatek.com>
> @@ -57,6 +57,8 @@ required:
>    - clocks
> =20
>  allOf:
> +  - $ref: mediatek,gce-props.yaml
> +
>    - if:
>        not:
>          properties:
> @@ -67,7 +69,7 @@ allOf:
>        required:
>          - clock-names
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  examples:
>    - |
> --=20
> 2.18.0
>=20

--UHPsus4u3u0dm8mG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ5zNwAKCRB4tDGHoIJi
0kjpAP9Yk36rZPZIu4QvFIRWcWvj+BIgAH03XRGq39GAwZCtNQEAlW83e29Zc5Ld
FJrUZnZshBfMyq32x1MacvUWrJoDsQc=
=ngct
-----END PGP SIGNATURE-----

--UHPsus4u3u0dm8mG--

