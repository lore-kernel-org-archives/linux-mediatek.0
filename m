Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050BEC4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uK6CI5wzk7ehJIN/tIuHvi2SDckUMTIquiWn6Gi5/RY=; b=I4mMJ809Y8rNF/QWPzllhL47z1
	OWQf+DHpCEYJ3CaXF1bzhWBCJmWQLNeSQHNwMDUGCigt+9+Wu39L91WNm2E3l79pVJP5A0T0PvWbl
	DNNflqYZEVrBI1cemuqKVx54yXHbgCpsCK3/Y35iFHtb3+xcoU4NjIc2MxLrcA9urkicQz+peoNwe
	v8mPUQEpASf4xu5GSqfeFC1LqfmLnQjQOOqCzbETf7HqavozNCKCIru13Ccv3/Uh/LUC+kjUuzvi0
	L1VtkH8pNL3rZvEt41uU4Lfh8dEjvqqP4JeGjDfF0rXwrYOTvGEaINFwVHbml7phbDHOYgFKYAhX6
	5op7UfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrZh-0065Wi-3D;
	Fri, 19 Jan 2024 16:18:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrZe-0065VS-1Z;
	Fri, 19 Jan 2024 16:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 979F3618F6;
	Fri, 19 Jan 2024 16:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82990C433F1;
	Fri, 19 Jan 2024 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705681109;
	bh=PSbkzYeX811ItSViusyC1PoucHT5C5dbiK5s5R+//Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+eThb5l7sEce6revVcLqp76lCDQtAaJ13L1qS3uyNOLaVIjk42HLfg7St84Sepo4
	 HYKvID3ToWBuU7kgFePrtxOZiYym0AC+CEHF5lX5XKd6rdkWawE5a3aLVWOM/LLAAn
	 0SsJMQzA3AZiZzcel+jVKQWRL3kAisE3rsj6rYNyN6A+GYhIwCi0SmG6VljIaHfs7O
	 UWzdqbTkifDCK5J4Y6Y26PK0m6CRH64IndM41XNPTCGjkGEW8WSuKrtOhv1+Ocs9XA
	 inTTLSs6EY8SYEBdGr1HEHgfWaXjTFsr4EdGp2fvBOWwmj8qQjPjim8wNXrPx7RMps
	 2clVHKzWPOxbg==
Date: Fri, 19 Jan 2024 16:18:23 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	andersson@kernel.org, nathan@kernel.org, luca.weiss@fairphone.com,
	tianping.fang@mediatek.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Introduce ITE IT5205 Alt. Mode
 Passive MUX
Message-ID: <20240119-remedial-unripe-2a3a46b4f117@spud>
References: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com>
 <20240119125812.239197-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9xj4ieRRilZigVCK"
Content-Disposition: inline
In-Reply-To: <20240119125812.239197-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_081830_649509_6389825F 
X-CRM114-Status: GOOD (  16.97  )
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


--9xj4ieRRilZigVCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 01:58:11PM +0100, AngeloGioacchino Del Regno wrote:
> Introduce a binding for the ITE IT5205 Alternate Mode Passive MUX,
> used for connecting, disconnecting and switching orientation and
> control the SBU signals for alternate modes on USB Type-C ports.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/usb/ite,it5205.yaml   | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ite,it5205.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/Docu=
mentation/devicetree/bindings/usb/ite,it5205.yaml
> new file mode 100644
> index 000000000000..36ec4251b5f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ite,it5205.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT5202 Type-C USB Alternate Mode Passive MUX
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Tianping Fang <tianping.fang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: ite,it5205
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Power supply for VCC pin (3.3V)
> +
> +  mode-switch:
> +    description: Flag the port as possible handle of altmode switching
> +    type: boolean
> +
> +  orientation-switch:
> +    description: Flag the port as possible handler of orientation switch=
ing
> +    type: boolean
> +
> +  ite,ovp-enable:
> +    description: Enable Over Voltage Protection functionality
> +    type: boolean

Bitta devil's advocacy perhaps, but why is this DT property? Is it not
known whether or not this is supported based on the compatible, and
whether or not to enable it is a decision for the operating system to
make?

--9xj4ieRRilZigVCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqgzwAKCRB4tDGHoIJi
0jXTAP9VDbyyEoQ1CABhFZkzTHaAveF6g22etA5lGD8yD7UudAEAxgJII9jVF6rG
10llZjO0yQjzZMumgGCQmHPSOQo7uQs=
=ASpH
-----END PGP SIGNATURE-----

--9xj4ieRRilZigVCK--

