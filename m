Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29981CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1DzNPGwodtbKAHmZM0CBdErqZDpJmc/Sh/x+3k7XFo=; b=bHC9Ufk+dBlofIB2YDdRSpqxJ0
	FZuAA3QVz3/gDjTj0BCiWu0FDg9ANQUx5/Xj5b8aOiPijRMYqUN9QPCZRbnTKBuDgtEpe8aNAPQwy
	BNXBajtsJwPGXsdU6tXw1/IN3CrMtpdSdsOZBMdbsgt7IE7S5QoefNu9Ndinq537Gy34C85YnbIi8
	tt6YwuOSEp7Zl8A9ncyuW28G+L8/WrueFncQ6Sx+3Fb2DkZexNkzSXOeVeo+1rKnAy9qlSHg3iWdL
	UwwJ7RLVol4Rai9S4wmUk+9KHk9fqyih5SCGr/x3gyKkrLjEURE2gKWnbjTO0l51W2xwpS/Jz6D6a
	P4KdKksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs2p0-0000000Gnv0-2j7y;
	Wed, 03 Apr 2024 15:46:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs2ox-0000000GnuN-2STJ;
	Wed, 03 Apr 2024 15:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D05B61490;
	Wed,  3 Apr 2024 15:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C64FC433C7;
	Wed,  3 Apr 2024 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712159198;
	bh=ZngLA7fiu23CbbP2FeZpKPJ67tayqrPfJ1YqiGcCHyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Px9srY/uyIRW5t1QLkovNO7yEOqoIYkIIAulrCjYQAfrcuMRateZgR7AGgEuLcr7V
	 YhY24aPYHHM+qyzwz3IlkrjSXakoy9e1M4VXfkbH1vcswhn9bM2o4QLwvO7nvp8Phg
	 9/S4PXM+z/9hQ3fkmV60uyQY9xXydRThW+7NxSGPfggIJwLRz4Cf4XZ5zNHu9HTX/w
	 G87opAvkkB3qKmX/W5grwxAO6g/akxBMBZ1wEjix9u/tzqhD5Xctxhuszck0S7vgBL
	 mlYlHL0fO0yp1RQd+giwePACin7YPuwVupF5BVDYlBUIYp4Kv75NQHbndkvFkdB/CP
	 nFQLfm+AGBA/w==
Date: Wed, 3 Apr 2024 16:46:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Shawn Sung <shawn.sung@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 02/10] dt-bindings: mailbox: Add mboxes property for
 CMDQ secure driver
Message-ID: <20240403-conflict-detest-717b4175a00c@spud>
References: <20240403102602.32155-1-shawn.sung@mediatek.com>
 <20240403102602.32155-3-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E81O+TvFKhTaSmXc"
Content-Disposition: inline
In-Reply-To: <20240403102602.32155-3-shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_084639_693006_A23FB4C9 
X-CRM114-Status: GOOD (  19.96  )
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


--E81O+TvFKhTaSmXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 06:25:54PM +0800, Shawn Sung wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>=20
> Add mboxes to define a GCE loopping thread as a secure irq handler.
> This property is only required if CMDQ secure driver is supported.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d76013985..c0d80cc770899 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -49,6 +49,16 @@ properties:
>      items:
>        - const: gce
> =20
> +  mediatek,gce-events:
> +    description:
> +      The event id which is mapping to the specific hardware event signal
> +      to gce. The event id is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.

Missing any info here about when this should be used, hint - you have it
in the commit message.

> +    $ref: /schemas/types.yaml#/definitions/uint32-arrayi

Why is the ID used by the CMDQ service not fixed for each SoC?

Cheers,
Conor

--E81O+TvFKhTaSmXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg152QAKCRB4tDGHoIJi
0vRTAP9IssazpBxI33VpR42jjeZ6yOZ3Cn9Ii0/LAsJy4PqrsAEA61YU795bv8QT
Fq82qt45WCanVJX1wTPdUieIv3s4pg8=
=6/qj
-----END PGP SIGNATURE-----

--E81O+TvFKhTaSmXc--

