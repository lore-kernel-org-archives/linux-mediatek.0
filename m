Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE288EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPTiFEjh133ZUh6rmiOWoZdbqK1bL2cE3tEkp5kIfxk=; b=37dkQ2ADvi2ZHufv3F4pB3qwc6
	m21RK6/9o9g+r5ZISI/QtzmEAiS2KiltZZssdSgIZAa9ZRfOBEoTJrY6lI9tyXR3z8XlzGSOvojv8
	21gBimke2mEL9iWdhHlvzXy4KhOyM1eGWMDTvhMIGHWT6+3544t0ZqImxt8GW39EP/oqJgyAL0KlP
	8r++0kFh04VHvCPVApg5ZZQ2QRlPXQIX31XFa4jOenIwv8xaRHQhykmfQnoxBX1ssDHGWWcEIImDs
	YUKVWyJ+ocvxM8kMkKpKTgvQ9pscj7nBu3czdbfZ15S0Nds8MkwCEmp3ZAUl2xY3GCmwUrN7HdVqe
	Os22iSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbmP-00HU76-0O;
	Mon, 11 Sep 2023 07:56:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbmL-00HU6f-2R
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 07:56:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E5837CE0F8E;
	Mon, 11 Sep 2023 07:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DB8C433C7;
	Mon, 11 Sep 2023 07:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694418973;
	bh=TcDeqP1CdFF7Zks/G2rBv/cmEg5YhRmWxiNQGI/6MpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZhIdbXc9hdjIVI1sHlh3znecvhGjFlRNouiyFQACPX5/jkuvW2wvMrRC4vtDsmBz
	 69q4krqK8cnjCs8zzBXRfu1V0cQYyFso9nW12l2dv8zSQj81KqFqwj2L6JI36thMyA
	 TAHyT2ULHNFDNcsGl5pl9iZAc0BLL+/a8BNRLCl8De0EaNGm19Hs8nJS1VhDcLfEOE
	 0wtsCgsJgnhZ3g/AEmTtpyIM0fL2NiagvTpAZV3u5AjaelqrLiycvWrV2j0y8/dluC
	 zKDxEvNt8M1B95ZbsTKiNjqOjvjsZOc4V+K6ZkeqvGGEgk3qhC5uiLOPBHHyU29b5Q
	 BltSCR7O/arIw==
Date: Mon, 11 Sep 2023 09:56:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, helen.koike@collabora.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com, 
	daniels@collabora.com, gustavo.padovan@collabora.com, 
	angelogioacchino.delregno@collabora.com, emma@anholt.net, robclark@freedesktop.org, robdclark@google.com, 
	anholt@google.com, robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
	jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/9] drm: ci: Force db410c to host mode
Message-ID: <4sejhbn246lxcfdogzlcv5u6gunjcwuplk4victzc223n4cohu@mmdjj6je62p2>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cb6hdljgta37swja"
Content-Disposition: inline
In-Reply-To: <20230908152225.432139-4-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_005618_175195_0D3EACC6 
X-CRM114-Status: GOOD (  23.56  )
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


--cb6hdljgta37swja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 08:52:19PM +0530, Vignesh Raman wrote:
> Force db410c to host mode to fix network issue which results in failure
> to mount root fs via NFS.
> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80=
a54dda510743cefd1c4b65b8
>=20
> Compile the base device tree with overlay support and use fdtoverlay
> command to merge base device tree with an overlay which contains the
> fix for USB controllers to work in host mode. [suggested by Maxime Ripard]
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>=20
> v2:
>   - Use fdtoverlay command to merge overlay dtbo with the base dtb instea=
d of modifying the kernel sources
>=20
> v3:
>   - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qc=
om and compile base device tree with overlay support
>=20
> ---
>  drivers/gpu/drm/ci/build.sh | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..092c195af242 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -91,7 +91,12 @@ for image in ${KERNEL_IMAGE_NAME}; do
>  done
> =20
>  if [[ -n ${DEVICE_TREES} ]]; then
> -    make dtbs
> +    make DTC_FLAGS=3D-@ dtbs
> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> +        dtc -@ -I dts -O dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-usb=
-host.dtbo arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso

You don't need to compile it by hand, make dtbs should do it for you

> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/a=
rm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/boot/dts/qcom/apq801=
6-sbc-usb-host.dtbo
> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/=
boot/dts/qcom/apq8016-sbc.dtb
> +    fi

That is also supported by the build system already, see
k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs in
arch/arm64/boot/dts/ti/Makefile for example.

Maxime

--cb6hdljgta37swja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZP7IEgAKCRDj7w1vZxhR
xf+VAQCKBhzxM+xyY+/4paz1ptXJnwy/l2JYhG19lwvhdmqzEQEAu8ymNH0xWLT9
fjwD62FM8tQ1u0IqCUncUJpj3vx5+A0=
=V7+f
-----END PGP SIGNATURE-----

--cb6hdljgta37swja--

