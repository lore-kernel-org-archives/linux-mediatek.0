Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01FAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w3jdU0hxhLIhLx/hb2vdJV2QvbLPK7j7835Nc/A3CU=; b=UaOM9vvmBrsVs9bkP9yrtIwJ+a
	m2SfU9A3hI0y6KSmMWZatntPkyV5viP46eaBOmiqdY9RoQPhJUkprSkxC6yZeE36Zr1TKw2y60kf5
	0fL6fQpd8hmOHzNyaxKeOdYLiljqIiHCa5CkvzAJumTNikdS86omjoG+WHjcinGwFguwlx+/+w+JF
	rG5LZ2mReZ+rUUbOlnh8KxPMrIBtSOhRESQvuxzTs4Xt5s4q6PqE7GT+i3cMRpM4iWjjzb5PVEELi
	O91Od2rLwRhXU6ckhHQQ8Zli4BSJNF1jISsI4kat6vLO4066/ps/XTnqH18pK2vfJ32EdQwTScDa5
	8PB3q0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3GVR-000QJh-Ao; Mon, 20 Jun 2022 12:27:49 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3GSr-000P1U-5t; Mon, 20 Jun 2022 12:25:11 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BAFA23200940;
	Mon, 20 Jun 2022 08:25:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 20 Jun 2022 08:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1655727902; x=1655814302; bh=4w3jdU0hxh
	LIhLx/hb2vdJV2QvbLPK7j7835Nc/A3CU=; b=BnmlfRcrX+Ttpr6MzdP8lZnM7x
	xNIITlUT8KJ7NXZE+sz9X7GUbU+S1wgfFEpKsPsB3/a43CMjHY7rqLrM8h2F5m1t
	DXAEO/zxcUQAzEyJOGrRHoPdsfeYrlmUgdZPTE58bcuZA6hBnEg215nx+mWLnJzc
	+QijTxygyRMMCXH+uvBlu4syS0anCMtFto6fQ/W0OZLqlD4qU/5Azzoo7Lrx9G4m
	wS9rCH+8Dp447JOZFNkRoARGxT1tyWJxBigV26oAV5b+A6plqZNO1y2xHcJaqvqn
	6KCO3pCV2k5MXPVW1tIb8Hk6WScCU/ZR1cR7m0eKdWm3Ngp4veZ2TvglTj3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1655727902; x=1655814302; bh=4w3jdU0hxhLIhLx/hb2vdJV2QvbL
	PK7j7835Nc/A3CU=; b=Jzw/NmA5XetuhJNkcTtT/9lgdVca/9nZRA9Nl3HRPci/
	CX0vg7mEBPcOWb2zBuMwEUh/FWa3bg2E9iMYntfz7pCYbxIMfMY7QitXSwtWvaEX
	KDS7BbU/A54yjOh4Dmx+h2eQMhO8qmb4FW7wwaqqcKleD69XpEX/ppT8T1dntyxn
	kGWZryuvkYeVzfmVgy60i222LnpWUDxb6PG1FNtY/3d6jjtJy/dmb3Tk/lf0IGmD
	mGtFGDLXhMRvLL3GRIIPnrXy/UL1DoY6vgdCeDABGCLezzfXs1/Mxd8Lss3MczOJ
	GIUZWUTZaQh3LvnO0hgtmOyVTrNIh3wWIomUtcvTjA==
X-ME-Sender: <xms:HWewYgz18GmJTXzgPlfrRyt6k4BwT0Ueak8dgDEC6sQl66rva_3Eqw>
    <xme:HWewYkQ6xy4Pw6pbEFLqYlupX3faFt29xT6h1Ue9DuXS49WD3j8-Gbn8Wd2Wmhi02
    3Q-pc1YM7U5m35G9io>
X-ME-Received: <xmr:HWewYiU_PY8pJSt6Al5r1_sXHcK916V2voOaQHyGpRM1mSDXDEqgctjCWLUjPj0JgY-sowqCoN04l_RMFWn4zTaOXHZh7_ifX9Npwk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelvdeuuddvgeelueefteejueevhfeiheejuddttdffkeelkeegudeigfff
    tdfhgfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
    rdhtvggthh
X-ME-Proxy: <xmx:HWewYuiMzpQfyFOVtiziYr4HrjsohGpCzoPuqwI6FBiFwxtnrrTg3Q>
    <xmx:HWewYiAzrkBGh7aYKaGBOmrqhqRkgaWSlQecNm4yhfcPurGwB_ajeg>
    <xmx:HWewYvIggW6OaT7nONpzU1hsY2yndHLYEVePTBCuoIoxiqsBMifYvA>
    <xmx:HmewYq09tGJQ9MIGuCOgCtwe-SfMuqcGX1cLHpkRuWlsGk4pEi_Owg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 08:25:01 -0400 (EDT)
Date: Mon, 20 Jun 2022 14:25:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, daniel@ffwll.ch,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, airlied@linux.ie,
	devicetree@vger.kernel.org, granquet@baylibre.com,
	jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, msp@baylibre.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v12 01/14] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
Message-ID: <20220620122500.yfc5vhbuluodoo3d@houat>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
 <20220620121028.29234-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2fbom76io5w77eq"
Content-Disposition: inline
In-Reply-To: <20220620121028.29234-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_052509_293020_3EEF2F22 
X-CRM114-Status: GOOD (  21.63  )
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


--r2fbom76io5w77eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 08:10:15PM +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>=20
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
>=20
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
>=20
> In this patch, we also do these string replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 77ee1b923991..d72f74632038 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: mediatek DPI Controller Device Tree Bindings
> +title: MediaTek DPI and DP_INTF Controller
> =20
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
>    - Jitao shi <jitao.shi@mediatek.com>
> =20
>  description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parall=
el
> -  output bus.
> +  The MediaTek DPI and DP_INTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel da=
ta on a
> +  parallel output bus.
> =20
>  properties:
>    compatible:
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt8183-dpi
>        - mediatek,mt8186-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dp_intf

Underscores are frowned upon in the compatibles. See Section 2.3.1 of
the device tree spec:

> The compatible string should consist only of lowercase letters, digits
> and dashes, and should start with a letter. A single comma is
> typically only used following a vendor prefix. Underscores should not
> be used.

Maxime

--r2fbom76io5w77eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrBnHAAKCRDj7w1vZxhR
xWJaAQCGat3hffrKiQmHEgq1IoiodDFVSCLGEO8sZBn2NJ1vpAD+NSyr3Wbf1+9P
APQLi2RmmHLhPvXKrVXVvO3z4r0r3Q0=
=AAFA
-----END PGP SIGNATURE-----

--r2fbom76io5w77eq--

