Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F1CC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brjOYUQVgGZ+MuQu8ux4gljUS4c33IJWdMOS5qIy8jM=; b=kOLsNPbQzM48QawHDS3+JXerUD
	githjDg2X2b9bzEBFJGTsccOKM7gnf5dLuurGWlK9+L4obWsNyYoLsuf8AVOmWuUN+R+yRqCho10D
	x6G2BZA7LwvmCXRBDNvn7OiSVsenYahSeDfYw2EJqKZQwvBT0DLhX0noivFfdyMKHrOqqvvvrB2x5
	EaQkbVE7OHoxYC1KtyCcOEFxSiiOud5RzFxKBEw6yUo2p/HPGgYXIaxSWGHOb7G6zIghXxxnQFMoW
	95k8qWRiqGtCsewv8xCDhuPDsmkLBEatqsflawhkkliOrb/g7AzVzNsLxU6q2SnScgM0cvm7JKdt0
	UmrotyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKNh-00000005mAW-1M54;
	Thu, 20 Jun 2024 16:11:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKNc-00000005m9f-3nOU;
	Thu, 20 Jun 2024 16:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3893D621F2;
	Thu, 20 Jun 2024 16:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57F7C32786;
	Thu, 20 Jun 2024 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899879;
	bh=OxkljKrow05q4da7B3GsfU2bTy755SQpG+GHmoDz1FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEE50IVkbPtvw82RdiBMZQ1mNk+3cLyGhjLH/BWn4ChiAXvTrqQCRBAwhSffTND6r
	 NWu2lb/MaaE83hHXAXlmnxShUjmnwLv9PgCUwRaCQ3Wx67YsrTpzTE+bkpDyKM3Dkl
	 iqN2vZhldikA6kMGOvQUcHUau+R8JoInV9XnIUaoaqs7BGLRknpwR5JcXKBb9Z9w4h
	 8lG5cC3U0L7vkAnZWIkOnDQOY05qNAOJqJXGwb/6HATB/SU7lcxd9nnJ0uRdZJT90X
	 HSCTf37lVAyxUdr6mmP3X74POiLUfbKr/wNc/n0TRz0Tz+cxIuQcaO4eaSxySSQ11t
	 ebXUj06Aqaxng==
Date: Thu, 20 Jun 2024 17:11:15 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	houlong.wei@mediatek.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/4] dt-bindings: mailbox: mediatek,gce-mailbox: Stop
 requiring clock-names
Message-ID: <20240620-pacify-family-c6cdaad66d70@spud>
References: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
 <20240620100750.1075790-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+8p3lhhqGn1CLu0k"
Content-Disposition: inline
In-Reply-To: <20240620100750.1075790-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_091121_491387_C6F2E646 
X-CRM114-Status: GOOD (  16.36  )
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


--+8p3lhhqGn1CLu0k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:07:50PM +0200, AngeloGioacchino Del Regno wrote:
> On all MediaTek SoCs, each GCE Mailbox have got only one single
> clock, and this is true in both SoCs with a single mailbox and
> ones with multiple mailboxes.
>=20
> Stop requiring clock-names on all GCEs, as there is and there
> will always be only one CMDQ clock per HW instance.

I'd like the commit message here to mention that there are no users
outside of Linux for this before making the property non-required.
And obviously you can only say that if it is true - although I think you
said to me earlier today that U-Boot etc don't support this device, only
Linux.

>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d7601398..ff5d010fbcf0 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -56,17 +56,6 @@ required:
>    - interrupts
>    - clocks
> =20
> -allOf:
> -  - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              const: mediatek,mt8195-gce
> -    then:
> -      required:
> -        - clock-names
> -
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.45.2
>=20

--+8p3lhhqGn1CLu0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRUowAKCRB4tDGHoIJi
0vxJAP9UxWxnp7qX0VpdMhL+fAihXvXOYRDUuJwD0piTz8VThgD/VoHZrPuBUkOP
2XWUqlQOEjQNdxiq8ne24Nl5UnF5uQM=
=6W/D
-----END PGP SIGNATURE-----

--+8p3lhhqGn1CLu0k--

