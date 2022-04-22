Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6qwIKj5eYhdB0sPyVhHDx3mj46AGl/zQOPJ/plVBZQ=; b=R65Z+qiyKikl94qv7OquxZf8Hd
	2jEEMX1f1Xlr/WHBDyeb8WGA3MZXoLBlfZWv5g0BLD4CkzMZQNnFixqnCO6VxrZLjYyqW0bmNKEqR
	UDPU0JFjc01teuoiwFftzesKbhz++nlOHWEYUL5YqcawONGZbZalmS0OERW+h6dhybavgi2XRbcz1
	FEXrf8xgoytwXSsTcJvoTm8rZ+Ke/sdx0cYi1i6EZI5ABr0R9Q1hdr35IsHHA+FuGDLRyMK77dtoy
	/IIi7K8zYhanzumaJEu+fQG1Vo+IsXgnNNpfJz7wu2uGfVbMQrOzheG1YvTk2k+zDiLwEGbkVSVHn
	Pgjxp8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhqyi-0006zJ-DM; Fri, 22 Apr 2022 10:57:32 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhqyS-0006sZ-O6; Fri, 22 Apr 2022 10:57:18 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id CB776580F59;
 Fri, 22 Apr 2022 06:57:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 22 Apr 2022 06:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650625035; x=1650632235; bh=t0Vm9xILeM
 tEm0+ZRmoAPUxhxs4H3KoDqpfSFpCeFCw=; b=YyohwOWwHOsgUBEhklxIw81jQH
 9k7QTlQ/m1chfbM67m+0hW+J9gC6M6REt0RZOv0kxcV3mVU0ScXWAtz8bTJoRWfr
 h39uvBYqPEsgR7nFb0qijB/+vstZUi0TZ/how9i+VZQaoGnq2HsUShd/DZjOM72Y
 UbnN0SFcAOLXFNkmucRsE7gGWzHf/I8SXDQN841DdKmdE9P+1T0UqTQn74Vi2pm9
 /b13SwhKwJOQaaABmogrWklj6+cOSFo6dwcSWlMJIipbLw2teTqkYit9CbvlQsHx
 /2bmmHf76lj9iXG9hJRVNy5Yt8FDk3ftKcfgEw2cx0UoIH9ztTjiHZ/MdTOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650625035; x=
 1650632235; bh=t0Vm9xILeMtEm0+ZRmoAPUxhxs4H3KoDqpfSFpCeFCw=; b=i
 U8nPM70ubfTAq9JEpnksZSiKccgJS/v8kX9pGTdKcgUiBHN4rDQM/c4Lgq4JL2HR
 iDy00wOWuSCQAZXoDyWtLxu1Utf5X88aPC0doymtVSzDLd4/S2Ep2Jj6cHBekpTG
 2KZkDoTxrrlmJNmgj449qTFBH3KZS9w2tLHkCrodp5EGzuuDP6/3hLw1mQSAdjb3
 vF3oeIRT3hw/ReJoP7uA6fQkrPBGSbt9Ygbsgu7hVv2UgL2mdrMmSkVY9ABIAUMC
 X2hou/ZnmrbeIWf6MhaZEYnc30U7xcYJ5cRUuwMU3+tTmOc3CpYO5qaufhDCnjhF
 YPdaRylLN7MKSl4PYIogw==
X-ME-Sender: <xms:CopiYvpMg8hB7wNpmcKj2c9-fUTff0aV2fB5qx5MxUk88lFsfRZuXA>
 <xme:CopiYpp-fmHr5lxSrNy6k0HXJwDwH2MfQqaD6w-jP_5XDLZehoZDf5xqH0_9PwF2D
 _3Q7UW1zdGwZMDyILI>
X-ME-Received: <xmr:CopiYsOb8mHfLnR-4-ETneMFMMtqW8Xf_gwFS7tf9GX0HylDPpLpF5Xhk194DVmeXTKHVfvIXDostCKkkkARyFRA6elGSxqRXSK26Ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeggdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepledvueduvdegleeufeetjeeuvefhieehjedutddtffekleekgeduiefgffdt
 hffgnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:CopiYi7w5KJVhVmQgmTJeLJvfycuQZkbrISLSqb7SB_NXdvUAZyoPA>
 <xmx:CopiYu5b75WZpoAisop1NSRQcW46FVY3pRultQY6ns1ZPAx292OLXA>
 <xmx:CopiYqiU0Ie1XFuc5PcX1rrVtTeSuAFCCFvXYu8cAeqaid2zrKOvxQ>
 <xmx:C4piYhwlFs3WkiNwqadkyWiP3PYOKVYUrZAEDGBE5fWMd4iufn3zFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Apr 2022 06:57:14 -0400 (EDT)
Date: Fri, 22 Apr 2022 12:57:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org,
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de,
 jitao.shi@mediatek.com, kishon@ti.com, krzk+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de,
 vkoul@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Message-ID: <20220422105712.bdpbwliificvon4j@houat>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-2-granquet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220327223927.20848-2-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_035716_880623_A6063BA0 
X-CRM114-Status: GOOD (  20.28  )
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
Content-Type: multipart/mixed; boundary="===============5297418208691148799=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5297418208691148799==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anrqwesp6j2b4lfg"
Content-Disposition: inline


--anrqwesp6j2b4lfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 28, 2022 at 12:39:06AM +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>=20
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
>=20
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index dd2896a40ff0..2dba80ad3b18 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller
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
> +  The Mediatek DPI and DP_INTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel da=
ta on a
> +  parallel output bus.
> =20
>  properties:
>    compatible:
> @@ -23,6 +23,7 @@ properties:
>        - mediatek,mt8173-dpi
>        - mediatek,mt8183-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf

It seems a bit weird to have all instances of DP_INTF with a separator
but the compatible doesn't have one?

Is there a reason to not use dp-intf?

Maxime

--anrqwesp6j2b4lfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmKKCAAKCRDj7w1vZxhR
xWHVAP9XOs5mllTpT84nKFlJqhBvEdANoAc/yLINNdL4rTwK/AEA2W/abW6SXtii
kYk/IHsQm/a6SEpxbGGVFYXWq6N3fQE=
=Cd+2
-----END PGP SIGNATURE-----

--anrqwesp6j2b4lfg--


--===============5297418208691148799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5297418208691148799==--

