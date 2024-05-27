Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F969C27C43
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDkdkxzJ9auxG+/FKRL7xr2TfsBW506+9aGLABAn4NQ=; b=fWkk7WJPJWYX+G4uCBIJc/zp2D
	+TTbH8AC4p9hBHgs2RKx9/KSxCYecevGt+hkTbRFc30vQrBhk3863MrPl+qZEK/KKC16DwnQlMFTY
	3RFegmJ691R6Bh8JchWxNMr9CPcbviHciP2MPTrUpnfo6KZ/y+BcGU2j2Qk51W9tmTzPM6axFX93Z
	BjISnL7FTWr1deZMroozJ/qKsZvn4zOIHdzU0A2p5IQr+HIMx3iqQJLHvpHprdsYdBB0uZ04MhJnb
	qpGsrhEkDQhLxNUiyC/hiWsG050HlWDb/YGXZX1fRC7c8LRY0FJcUwqFi1ePSMNLj21VAIvu6b4wn
	Obo7gC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBeH2-0000000Fyz1-3cBK;
	Mon, 27 May 2024 17:36:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBeGz-0000000FyyJ-1aE4;
	Mon, 27 May 2024 17:36:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B80A61B9A;
	Mon, 27 May 2024 17:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1853C2BBFC;
	Mon, 27 May 2024 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716831396;
	bh=9azP1CoqBgVzc1Ap21svaHMHj3h571dn+Ed1pu/oZnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zye5Y2M6ZcwVdvsk5HTNp16+CzXgCstjS1xb9IxfH4+tcOhW0sR7W9u0/bCC4mRr+
	 yh8xka7Oj//VwikLVjQ/a1J4ULjGTAZR9BTXzaaC9Me/U9cttPvRwq7JjYeYOfPFgM
	 wTD2X1BPGVI+HcaQPOyatPyo7ZOBJGU3RCDci8lR7XNQNGJHNWl01ouq3JAhpN+9le
	 Q5n83MV6Wji9XSwh+MP/R4TGaf8fKV4ZgmQNI+Bmw6J1/8UwKih+cIF2qDRgHmiuwT
	 BPIdf5HQfXTu7gZbMcD9YJVjWtMlb0TD7JiU+9nG/dX2WpeqV9d8iRMiYwWzGH7DVH
	 +Ou4bN2/Bejtg==
Date: Mon, 27 May 2024 18:36:30 +0100
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH RESEND,v6 2/8] dt-bindings: mailbox: Add property for
 CMDQ secure driver
Message-ID: <20240527-bullion-slapping-d35fcddb56d5@spud>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gfL6Eu9ihKM1A1EB"
Content-Disposition: inline
In-Reply-To: <20240526144443.14345-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_103637_615841_A54E8013 
X-CRM114-Status: GOOD (  28.72  )
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


--gfL6Eu9ihKM1A1EB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024 at 10:44:37PM +0800, Jason-JH.Lin wrote:
> 1. Add mboxes property to define a GCE loopping thread as a secure IRQ
> handler.
> The CMDQ secure driver requests a mbox channel and sends a looping
> command to the GCE thread. The looping command will wait for a secure
> packet done event signal from secure world and then jump back to the
> first instuction. Each time it waits for an event, it notifies the
> CMDQ driver to perform the same action as the IRQ handler.
>=20
> 2. Add gce-events property from gce-props.yaml to define a
> secure packet done signal in secure world.
> There are 1024 events IDs for GCE to use to execute instructions in
> the specific event happened. These events could be signaled by HW or SW
> and their value would be different in different SoC because of HW event
> IDs distribution range from 0 to 1023.
> If we set a static event ID: 855 for mt8188, it might be conflict the
> event ID original set in mt8195.

Two different SoCs, two different compatibles, no problem.
I'm almost certain you previously told me that the firmware changing
could result in a different event ID, but I see no mention of that here.
The commit messages makes it seem like this can be determined by the
compatible, so either give me a commit message that explains why the
compatible is not sufficient or drop the patch.

> So we define an event ID that will be set when GCE runs to the end of
> secure cmdq packet in the secure world.
>=20
> This can reduce the latency of software communication between normal
> world and secure world. In addition, we can also remove the complex
> logic after the secure packet done in the secure world.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d7601398..6e5e848d61d9 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -49,6 +49,10 @@ properties:
>      items:
>        - const: gce
> =20
> +  mboxes:
> +    items:
> +      - description: GCE looping thread as a secure IRQ handler

Why is this needed? It's going to be a reference to itself, right?
Why can't you just reserve a channel in the driver?

Thanks,
Conor.

> +
>  required:
>    - compatible
>    - "#mbox-cells"
> @@ -57,6 +61,8 @@ required:
>    - clocks
> =20
>  allOf:
> +  - $ref: /schemas/mailbox/mediatek,gce-props.yaml#
> +
>    - if:
>        not:
>          properties:
> @@ -67,7 +73,7 @@ allOf:
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

--gfL6Eu9ihKM1A1EB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlTEngAKCRB4tDGHoIJi
0to1AQDxMdlkCNTKNL4Cai++qtW6p5V+CLhlWwb1OMH0cnYOqgEArzOexHmWlxUE
80S67d+XuFdcAciAe/PNG2Dd7EsXdwA=
=ITK7
-----END PGP SIGNATURE-----

--gfL6Eu9ihKM1A1EB--

