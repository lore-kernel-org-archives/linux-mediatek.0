Return-Path: <SRS0=XWkL=5J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89D2C4332B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 11:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC53920714
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 11:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M/UvUMNx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5OL7hM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC53920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cCp/7STqgbg6SX9GL6uWbKIvAzafy2nFRIkZPJRjjso=; b=M/UvUMNxguJijKlG88FsTrEdb
	vNCYzSd9G+tMElcvnfWUafiVWJAs3xy/HF31HIkcFIaX5A0bIGuapoeIpGg90qRCXIhlo3Z0Yp/el
	lWxdf2WmfgyZ9YJf5+xofp+PkB5bk+IdRHi/6I9kDUy2L/ktBoFmmO91RLGUGZMwCxzJU4aFf9tSG
	pfB1KkZ5KoJxtbckxgtup2gQbk6AbWfzbGWcpfTTuH01dfKvJR7hs4fnrXC5KW9cH3S3ZGEQaigJ/
	zyTTj2/sqUznMgHu7Zx9BZCje4PauH6KzqgfwJc5QT6MjB6I2I4D9+OkBtvTzBv175JRGl0xmm7Rs
	tOFGGuIvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGiDF-0007fs-73; Tue, 24 Mar 2020 11:59:17 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGiDC-0007ep-Ix; Tue, 24 Mar 2020 11:59:16 +0000
Received: by mail-qv1-xf42.google.com with SMTP id p60so9025982qva.5;
 Tue, 24 Mar 2020 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IzasdxRYqM7rOFN66DBG3h2VMkVrFQ3GhK1sACp5S8U=;
 b=Q5OL7hM7fhWYS7E1vvbqxwxRQU8X06B/qc/qoWD7sTquEt4AdWaJ1sJ2KH16uIw8P5
 JlylgRJqGl9LOMT+8ib1IR+jISmtrNuwj1cujpS+JjdlrGemau0YqDswan/GNG9gW4ul
 f3g8/tQJglQFuWT2C98zBaPwT/lxC5nd84FkPLpC8mlinjlf6xqdPGm30uOO29ZdCRSB
 9J7nvn2vrwACeElwn1eXKQfXZTRsIy92MHiaXyhDkOsWgowcqpYCD43Di3dQj8J5gRO6
 3CdGLfY7noTkcnXpNlnG0RQc2PLwEXZX06wRkIfiYcKJKFbRJJb5VV/j89Vw5UAS0Hrt
 JwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IzasdxRYqM7rOFN66DBG3h2VMkVrFQ3GhK1sACp5S8U=;
 b=E3EK+P7WJNqL2wGk8Oqmgy426b4lmiDxWgC60rVbfsYHbPBpc1SYfL+oCVVs+k5rWT
 uLXTE9LFfQTcTIhvzyQwA0Z0YZZ2Jn/OOWr/MMQGQ1LBycjmlxJQzBUl5CXQ8mWW96TL
 NcVOj20ziCLYAKWGnxoj8adM1eOrXdBEh+HbTH+8VPrwUFDO0MfeX9LVjbI1Rr8xDlbI
 M1qSAYb4fLnd5Afv9CvA5mWiWKZDqpqW+c8Psfzh9u6J+r+/+k8iR3p6rC9NuVlJfhTk
 YcZ4VP+nzoNrLfDiqw0EeNnZY9uCLUfIDSQb1u1sxhANq7G9tLnV/HUX+WOXy7m7j4eX
 K6Gg==
X-Gm-Message-State: ANhLgQ3w7h2nwRhWMuI9+Bt5nquWIRFthQ9sRSFEUgPFj4EMGsxR/hzS
 VTn/9NkQGrADmyitvpKLvmo=
X-Google-Smtp-Source: ADFU+vsRrRM8GomjFcPHutO/gZSvZ9pBrvIDKkaAb0+Vm+OeJtn1ews7WZEp9PklwYeqveQN1bHBCQ==
X-Received: by 2002:a0c:edca:: with SMTP id i10mr6735372qvr.130.1585051152710; 
 Tue, 24 Mar 2020 04:59:12 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56a0:11a1::4])
 by smtp.gmail.com with ESMTPSA id x124sm2222237qkc.70.2020.03.24.04.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 04:59:11 -0700 (PDT)
Date: Tue, 24 Mar 2020 07:59:05 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 20/22] drm/vkms: Use simple encoder
Message-ID: <20200324115905.dp5jqzbmvhbmk2rn@smtp.gmail.com>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-21-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200305155950.2705-21-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_045914_653637_2E7F93E5 
X-CRM114-Status: GOOD (  16.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, heiko@sntech.de,
 airlied@linux.ie, stefan@agner.ch, linux@armlinux.org.uk, paul@crapouillou.net,
 eric@anholt.net, thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sebastian.reichel@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, hjc@rock-chips.com, festevam@gmail.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, kgene@kernel.org, linux-imx@nxp.com,
 ck.hu@mediatek.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 alison.wang@nxp.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, john.stultz@linaro.org, jsarha@ti.com,
 matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, tomi.valkeinen@ti.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 zourongrong@gmail.com, linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============0812756399748209703=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0812756399748209703==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyxw5g6b72ps7vfq"
Content-Disposition: inline


--xyxw5g6b72ps7vfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

First of all, thanks for your patch!

I applied all your series, compiled it, and when I tried
`make INSTALL_MOD_PATH=3D/PATH/ modules_instal` I got the following
message:

 depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
 depmod: ERROR: Found 2 modules in dependency cycles!
 make: *** [Makefile:1317: _modinst_post] Error 1

I cleaned up my local files and tried again, but I got the same error;
If I just use `drm-misc-next` everything is fine.  Did I miss something?

Thanks

On 03/05, Thomas Zimmermann wrote:
> The vkms driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index fb1941a6522c..85afb77e97f0 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,6 +3,7 @@
>  #include "vkms_drv.h"
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> =20
>  static void vkms_connector_destroy(struct drm_connector *connector)
>  {
> @@ -17,10 +18,6 @@ static const struct drm_connector_funcs vkms_connector=
_funcs =3D {
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  };
> =20
> -static const struct drm_encoder_funcs vkms_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
>  	int count;
> @@ -70,8 +67,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int i=
ndex)
> =20
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> =20
> -	ret =3D drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
>  		goto err_encoder;
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--xyxw5g6b72ps7vfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl559gMACgkQWJzP/com
vP9BEQ//bENFpSJc2y0XTYIOh3A9lmWbJYMBLW1j5T3uUJJu8x0lC0hqd0fJW3V8
iT1Pedxmmf7duluAn7uKjUQ1sPztm2PcJB8F9ADs+bJdKN2CqmsL3kB4Ip1Q+US7
t7cptBTF6FrLPo4e1WpZAEEu4UdyVsq16+0v3+8icC0YSX6KMQdI9QNvvp/5PmXF
xYc6wwyGGqNZhmVRyLu0Im+zG5TvscTmK3iIu1BOMEubsgZD/BP8ZSx0efQJKRhA
aPhzGs8S7Sp+EnE4wiTU6iZch3+KUw6D0lc398rdlvbZXmvxSxe8WxCwciMksgu5
c+A/+oJ80KIhkjWCQNpF5oddWXUUqy6yHZrzIWzkPAj9oVxQa0jr7EwAkT1h+Zp1
wUDLrQw9ZRw/GHv6awiSFDukLpHIabDgN9F0fsvx9aa/PJ53FOR6hilCOn8tIVnJ
oZabUjqa7pV3L8N5CFott+8EV2y4GZK5R+VW6MX8px2bfa7SaJl+9HgeKssOYOkF
6cwm+IquaD3wz9h7elWGmEQgqj3jOviny3HT7I8U+ZlmMa6+JCMt4iq5e1R9q4du
PP4mh695VhSas/mbB3qjZFy/FCj1bvJ8J6AdHOoNDmjM4JVv9F5S5yi3UN5uEBXC
ZtKmSxghh2GJS2LFK6b88yxVNVNYrCX6bYWSyfovToU6C0QzbKs=
=srDw
-----END PGP SIGNATURE-----

--xyxw5g6b72ps7vfq--


--===============0812756399748209703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0812756399748209703==--

