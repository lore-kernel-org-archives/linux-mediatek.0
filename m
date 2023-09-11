Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE2EE801F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpBDqzDR47ZerkNcISB8V1BhEYq/nx1UmYQqQE9wf1o=; b=bpAs7UfwZ+ycBG8eh9vRdNybV+
	IJRSBhnIXjFuCz3Pf3M232yULQiDGLSE5Cr44e7zl7Chksld0gp24LF4b6DCMiVHH4g1fyYp8xAHA
	7pvcjVZPoEbijRXa/NIIr9aFcMgcbD5rUluBQuw3Grpx7vhhBAygJrWM6kG3vDRlCS4ctOGV1gmUi
	mcDPDiw2vkKgwQN9FgnVTPf/GlHKuw1Sy2ec/U62h/csZGI3+XtHUjggGbwSho3INuU1kj+/CsHWY
	YMhEi2Lz8dAkBl33ZFvFYa0YHtnix7cZer0d/FUr7zhGLyjuwRtnZkDZ+W+B9wFAWnQ/0AJ+/p2z7
	rPWA/Kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbmq-00HUA3-0R;
	Mon, 11 Sep 2023 07:56:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbmm-00HU8P-09
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 07:56:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0096ECE10B6;
	Mon, 11 Sep 2023 07:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94B3C433C9;
	Mon, 11 Sep 2023 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694418999;
	bh=J4By/wtMEr2AEoDW7IigfXfEKp7/CeZK5KPE57g83AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfX6RyGjkbCon6qIymrUuDUmd4zyiw+oq+3UYAwwiRejb+bjeMBacGLrJVk1rq0/6
	 Epnri0SlLSNT0lEAGHQvpMVuUcd2/RK9resXaAfohLmxGBCzZIIHrx7Agczwvu/Ee0
	 31czy6K1CbffAHojh735ol2bgE4CnY66hmjm0pn6F1mBdWN8voaI8Q2HEOHpFLNRzl
	 yvcxdQ6OE9Fl21SakZehyM4rsYmRvesVp8JReZTn2jV8YMCT5/x7nK38rZarLkg1A/
	 1oa4bIIvcvkevd5EzXEXDw5eyXcW9i0t/nR43VM6KtPIonud2mgDSNbNgw3I3uFC5u
	 oKb6l2ve2JxUQ==
Date: Mon, 11 Sep 2023 09:56:36 +0200
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
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for
 usb host mode
Message-ID: <n7pfq63xblrijh7azhqj4zytnq6tuym6dwdw6rrwznnizpoy5p@7vsgezhgs3jg>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gagdd2k3ghthyhjr"
Content-Disposition: inline
In-Reply-To: <20230908152225.432139-3-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_005644_447527_6043CC2C 
X-CRM114-Status: GOOD (  21.35  )
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


--gagdd2k3ghthyhjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 08:52:18PM +0530, Vignesh Raman wrote:
> Due to the presence of the fastboot micro cable in the CI farm,
> it causes the hardware to remain in gadget mode instead of host mode.
> So it doesn't find the network, which results in failure to mount root
> fs via NFS.
>=20
> Add an overlay dtso file that sets the dr_mode to host, allowing
> the USB controllers to work in host mode. This dtso file will be used
> in drm-ci, mesa-ci.
>=20
> Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and =
Maxime Ripard]
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>=20
> v3:
>   - New patch in the series to add device tree overlay in arch/arm64/boot=
/dts/qcom
>=20
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
>=20
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/ar=
m64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> new file mode 100644
> index 000000000000..a82c26b7eae8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&usb {
> +         dr_mode =3D "host";
> +};
> --=20
> 2.40.1
>=20

You need to add it to the Makefile too

Maxime

--gagdd2k3ghthyhjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZP7INAAKCRDj7w1vZxhR
xV6IAQCox48qewzlkPPyfIUdU1lcyOF2tjZGlIie1OkEy+YwewD9HSiqWhPcaU05
UcmcRvKlRMTRddoOLVSVlt6zHhBNPgI=
=Cw8P
-----END PGP SIGNATURE-----

--gagdd2k3ghthyhjr--

