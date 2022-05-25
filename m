Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F90C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 12:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjfAzCuji5lj1TJeymunF6tQPqZ4KZ0+kJAyvLnJ+Gk=; b=ae0YStwMQLe3Gnvd7fEUTfaPvo
	6f5BfIpCEnpitqthOo1GHeQXyF6EuN2spF3dmoSLb3rGyvs+MTwS/ppEruEp1wdlKoq7pazH8sGAP
	ciVfemTeFSziJ3Lu5CiC1wee9UhQBz1hw0j1iqIUvVJCeDp1kIONkpWcnL34XH2KbZL/Zm/eNg+Dd
	f8XVLTjJlajyqlaLofZmzoh0ANzPtYMi279ChSZTmQ4dtKJ/X/kEvNr888xAVaaN58gJO7Z2qcgxu
	q5HnfwVpnS9y1hXaii4InBWRGIBbi2Qdng+RF7WOnGxtHQaGwTms2VONnm4EtE/ZDeTFK4K5Qy6LL
	S0fDAIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqSU-00B9Ic-Fd; Wed, 25 May 2022 12:49:50 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqSH-00B9Eb-Gq; Wed, 25 May 2022 12:49:39 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id C867D2B04FC8;
	Wed, 25 May 2022 08:49:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 25 May 2022 08:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1653482973; x=1653490173; bh=eaiu7WjY6z
	D40HP4rAo3IAZYmjjndrOI/2cEvX4csok=; b=hGkmkh40PbgZX9Of7alO0L4nz/
	u0KAEfygYZOS7i15rXim5Tk4gqj3x9aJAu1rpxD+TqKSS0pfly3qJ8sSHnoQPG9l
	T3fo+L5vovWHv1OCASPWKVvE/GFJd0anax4y2QI0avPsZIU6RAzXNKzEl7H0qTt1
	qDnjTXdNW9FhjeRZ8jfx0cvwtL+zvvZdzP9w/oQvWZ9r7PHY35y+R+aylG/Gbzuo
	s23Amv8bePoFhHfMInYOh+LVLvSocflrg4iXjXiTrrK/RUu1LBOtklRYs+bl7JbT
	xcKbrksMk+Va2gKioQ77h8Pi0x7GgVNmwNociaPlP9RSr6aiXNrin9fFvKjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1653482973; x=1653490173; bh=eaiu7WjY6zD40HP4rAo3IAZYmjjn
	drOI/2cEvX4csok=; b=BTsEsaWhS8WPM0Vt3HLBg0xiiXsVuvwHCHD/mYfULC51
	OGXa7NACfrD1NIBmkcngXBzPMXfPZQGwp0KZPVBqLzsWQ0wPYGrkgmCmZZ8mNG3s
	/olq6eMFMzZWAifGO12cYT1zYRt0p89fid+8eR124vldGNWxNKUQh45powm70WQ7
	1V/xPHBaWa2ZuLoaqw/44Ob9tAxXud4SnCFO5NUWv5EFiDjT2TISnci0bKM3Ec0t
	OL2yplu3bRCdBrNAaZLoSoBPPNZ4C2EaToPbEVKnAxWf5l2Sv1iGd7EzIEIDYCaH
	SbqYp6vbHYshtziMUvo9viX/j3uIRsdMoeCeUrfiLQ==
X-ME-Sender: <xms:2yWOYsmU3-YEvjZlChEY5l23_N3oJCXBeGrMp2qyQOexmoZnrKWkFg>
    <xme:2yWOYr0LIewrIqOfkQNFBzNn-hjZhAAG6qnODyOZgtWzZpkTWkzalMP9fmnAhueEv
    AwTPCJ4dMWYRmJgDLc>
X-ME-Received: <xmr:2yWOYqolOuo-7Chbr7kYEEVwEBKlliGyAD__t980v-zrWO8DBJSOCAg0pJ_mFg5eirtZqdRQ5eA6EGynVdQ2xCO6PYJtv49VmZwH1Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepledvueduvdegleeufeetjeeuvefhieehjedutddtffekleekgeduiefgffdt
    hffgnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
    thgvtghh
X-ME-Proxy: <xmx:2yWOYokxNGLf2r_NPjo4tKepz-vx_Ffssh5GsCQzPjefA-MuzJgLhQ>
    <xmx:2yWOYq3xSWkbJp29jSovxWrqnYvZQeVqneOSQQiJedUMjPJV-uloIA>
    <xmx:2yWOYvvw_5WfOM0upiSlM8_i2rA2auiZ9kUe7KytAG57ukGC_Agwxw>
    <xmx:3SWOYonHU7I6BcZLdqlDu5zzUPBBgPp70dvVRO-pcBzItWWo48M9pWTQXV4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 08:49:31 -0400 (EDT)
Date: Wed, 25 May 2022 14:49:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>, Helge Deller <deller@gmx.de>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,dpi: Add DPINTF
 compatible
Message-ID: <20220525124928.wtfzpxr6lm7bdc6k@houat>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-2-granquet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220523104758.29531-2-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_054938_108258_CFDEAFFB 
X-CRM114-Status: GOOD (  20.61  )
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
Content-Type: multipart/mixed; boundary="===============1131258610621411489=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1131258610621411489==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="caypywv3zyehybgx"
Content-Disposition: inline


--caypywv3zyehybgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 23, 2022 at 12:47:34PM +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>=20
> DPINTF is similar to DPI but does not have the exact same feature set
> or register layouts.
>=20
> DPINTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index dd2896a40ff0..6d9f6c11806e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DPINTF Controller
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
> +  The Mediatek DPI and DPINTF function blocks are a sink of the display
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

Weren't you supposed to change it to have a separator between dp and intf?

If it's no longer in your plans, the second patch should have s/dp_intf/dpi=
ntf/

Maxime

--caypywv3zyehybgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYo4l2AAKCRDj7w1vZxhR
xWKiAP9jtTFxn2122rC75otB3OE+m4SKrY6xBG/6lAdnXBI9owD/bSCJW1MCt4Ee
lpQaGgsPznT9oNA3vaB9Gk2SKS/dRwk=
=56gL
-----END PGP SIGNATURE-----

--caypywv3zyehybgx--


--===============1131258610621411489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1131258610621411489==--

