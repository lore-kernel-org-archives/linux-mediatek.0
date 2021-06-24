Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A044EC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:02:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F92E613DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F92E613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxl47NA7LPS0xviFBsjV6i4rYiCV+f8sL1jvmcgZmNw=; b=x8jw5aEASdix3tSE9IBWd0dL1g
	1YnUJTHT3vDWZIEkENcNZDDl84Ur2tXmLr5mZZUxxZVxO3eLf86YGZjQtYEYX30YolOGN5me4CD+a
	2PyJp2Bfd1QeUW/0+vxaYXOL/BQ/jKVNTYGyNBqJxvccKBsclWx08myRo31JvmPttrIaausBwQIXT
	5iN/6sDbAStjpzAut9hXhttpSDFRIN91D+LwbX+vg8SqnaEyUyyg5fQKVl+L6dqtsii0kwWv0JWGV
	tEFXbmrfBvz1G1tQBnXoRSXexu1AYzNOOflc+nvaus8NHS/eJyC1s6jVW/oiVv6GJVtDDfpEtx+zm
	1sdP89LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwO41-00EUuk-OD; Thu, 24 Jun 2021 12:02:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwO3y-00EUsQ-9o; Thu, 24 Jun 2021 12:02:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso3480518wmj.0; 
 Thu, 24 Jun 2021 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
 b=A4ZJSYnWcvNDaAGkscckQ1T0JedTdFDVSuL2YBNdwwF7acWK0AZcsU5zvsVBjaEnE0
 vsxLXeiOkPXV0sDkt5mf5/o226lI7HBeiLI3sEq1aMRGbypsf6Bch2Kg62wRL1La4pDI
 oGZydtxItkAsfL83TfuEmUWoDMxV7rufPNivK3ryBzWPLuL+5usBc6MglcCUM6IzelM8
 Nz6qtrU0C9W4JeYrs7rwBFAjukEAoFywD8y16Q8wkRFeIXm2GbxrFHrfjHBLNTda9rqV
 SY0IiWXgH48K8ZPh9MWtQ5Dh1jLdaybwti7HCY0TZjkN9TbYA/yL3MNnHzS9FYivGbwv
 lUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
 b=Oriwh2AsuX/7YiVwoE2OtOTzkGgWGHJqY5jh4gQJ7j2yS/F7m2NrRzJS7G9x4hrU9p
 TBxJIib6bWgk9vIM6u4CLp4A4xa6BKiOYhgEKi2SjjflWOY4BTkFw7stj63+BU5IxTlF
 m5SKSt+0M/NL+L7ejz5AdQq9DhkJdxLQIcgEhJH+bAUamft3Y/4FyjULQEQRVhFgtiw3
 W1la9hkWd+RXPg0az55KT9VwGkcm6SnGur+AdglWApwhEYf4dakqals9RckUEthh3AsE
 bUSOZAiOdxjXWluH4YC07Fsky9NT2GnX8DLBJQ2yVea1YOPfVMQhCAR2wwXv3SX7PmP9
 NdLg==
X-Gm-Message-State: AOAM533CUmqviyNeYs5dZDwbLhSe9xGj0HbjU2RRH3KQsZpgsSzgpSnZ
 XeT8yX4mLgRYPdksoAZP91Q=
X-Google-Smtp-Source: ABdhPJwnAQpQT/2sEz7viSMJ7t/+2zmdWLWtmPK9rh67Szq5oWv4lL/lZy1xAEGpP06+iHH3w5wUNg==
X-Received: by 2002:a05:600c:4a19:: with SMTP id
 c25mr3844668wmp.125.1624536148907; 
 Thu, 24 Jun 2021 05:02:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c12sm2972417wrw.46.2021.06.24.05.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:02:27 -0700 (PDT)
Date: Thu, 24 Jun 2021 14:04:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com,
 james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 21/27] drm/tegra: Don't set struct
 drm_device.irq_enabled
Message-ID: <YNR0zpVzMxQauzet@orome.fritz.box>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-22-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210624072916.27703-22-tzimmermann@suse.de>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_050230_386565_CDC8A7C4 
X-CRM114-Status: GOOD (  11.53  )
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
Content-Type: multipart/mixed; boundary="===============1771317871049516160=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1771317871049516160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ENqalYeZVO/RAx3+"
Content-Disposition: inline


--ENqalYeZVO/RAx3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 09:29:10AM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/tegra/drm.c | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ENqalYeZVO/RAx3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDUdM4ACgkQ3SOs138+
s6Ed0A/5ASxTJhpMIfL1u/g0kk5pjZX8ukNK72+ftE+sJWJhxDmTGuM+EzcPNaNg
sKT+65FK2YsGeoA5fnN9QKWuUyS+bpExys5n39Aty+YN4tI4CV7CbU9OJeYm9Iru
i+Ziu6gkJl2SYom/+cxuU42UkUDkQkWofYRel+HJZeDMogSRAIhiiQy5/fadGiJc
36fJrXjueiB3EZjkg7CubNsLgy08qblR+sZGpuq4RIc3aVe6j6U8QxHiZ1eA7tMD
ki2Nmub5WThcAUGn/ky+FD9m/yfieoI9sPkVWRpAF0oa6SDp6YO/oPFf2hJzl4jk
HPXABfAWIYFTEzjFkGdRHjOfGgahPAXvwd1ku5zjBuFSH3vM9kNaNRuIQe2Rg9ti
p3+b5RfPlO/1fiVRkuzXwROpjWNW44Y+eVVyee84h813aqYh9OOLJVrmxmrzZ1Xx
mzDTvyZXuxtVb79T4XSkb0LnRw3wrraylMLP1X4/QTqttUBoWgYeKM5MwDgy+6zH
Bx1VWtnjn9NmwEPfRmPpwIQNByNJ2DG/E8wZmEfeqJAEHo1SLOYaBixh9W7DUlWC
e9mZFcD+tYSTurqcg0mS5T1mSPJGyCjcZFP27RkFRSc9JbRAQt2uuKcr1R54mjTh
gAJ6mf8hPIWA8Q6ro+2TgW8p0X/wbPsnZdXjZrTGBsV1QA84k+M=
=pLLR
-----END PGP SIGNATURE-----

--ENqalYeZVO/RAx3+--


--===============1771317871049516160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1771317871049516160==--

