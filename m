Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD00C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:23:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC6861466
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC6861466
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiwiwCk5xc5V8Xq5jKC9FmA46QmpEAwSXBLBPX28dPE=; b=22GOSMSKRXfDxVeQGeolBVfHsJ
	OvP67Essiqz592q9cz6yBcZbjkspOaNMiWE+Av4u8J+SkTJLGc10pnt3N5ULmZuS/hldWStcvydw2
	lSpHXLjNuMedJj2qqUVtPQOxvDVyZ9keTYM2VJ1w7TQW2ivdyClRAPRq17CRvLB1POugSvChR9lAt
	+ydfXv72EjT5An1bZ/5XMHUhCD0z7ANS5xIiQO20cw2sd/S3roVAMClCY95qsiGanQ4UptGpv6Aeg
	mO4R7h1HpjWND5uIwJbYCAJ2zlVKnz2kBP6rdrMsZxNWtiU366p2/lG/TFUpE4XXnM6VdNDeSoLpM
	bNL4YiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxkgJ-006yV2-Vp; Mon, 28 Jun 2021 06:23:44 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxkgH-006ySs-DI; Mon, 28 Jun 2021 06:23:42 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A375B22358;
 Mon, 28 Jun 2021 06:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624861415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=jJM/B+QJ0HaTwqIYl1RXnmf+3kS01V89ycXtkk6p6XRsDI0f0fsSYWSMxuQjKP4pqQ0E+1
 s8MITUczcRX2a8uMHRISVlbqGN7L1AmLkau+jzoUaW2yOqZOzt5T1SrWObCQMTd+s9ffpr
 ATR41EBppViL088sYF/EuuEt0QBmJHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624861415;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=NBW1kkaGRxLiRwOxNiLCHy+jTq7PDtH+lJSbjdqofRosiUym/h3BpEXG8WHWk0LKYIFlQF
 Iy0+1fzHScVjq3CA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 73EFC118DD;
 Mon, 28 Jun 2021 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624861415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=jJM/B+QJ0HaTwqIYl1RXnmf+3kS01V89ycXtkk6p6XRsDI0f0fsSYWSMxuQjKP4pqQ0E+1
 s8MITUczcRX2a8uMHRISVlbqGN7L1AmLkau+jzoUaW2yOqZOzt5T1SrWObCQMTd+s9ffpr
 ATR41EBppViL088sYF/EuuEt0QBmJHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624861415;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=NBW1kkaGRxLiRwOxNiLCHy+jTq7PDtH+lJSbjdqofRosiUym/h3BpEXG8WHWk0LKYIFlQF
 Iy0+1fzHScVjq3CA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id T4qyGuZq2WDleAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Jun 2021 06:23:34 +0000
Subject: Re: [PATCH v4 05/27] drm/armada: Don't set struct
 drm_device.irq_enabled
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-6-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <57eb0ca1-e1a3-495e-926e-0d02634f096f@suse.de>
Date: Mon, 28 Jun 2021 08:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625082222.3845-6-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_232341_665426_A8E0AF89 
X-CRM114-Status: GOOD (  18.38  )
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
Content-Type: multipart/mixed; boundary="===============4226647666765932927=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4226647666765932927==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI
Content-Type: multipart/mixed; boundary="ZsJWMZ3fKnfvZTQNCUxxACBUzMa2385FX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <57eb0ca1-e1a3-495e-926e-0d02634f096f@suse.de>
Subject: Re: [PATCH v4 05/27] drm/armada: Don't set struct
 drm_device.irq_enabled
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-6-tzimmermann@suse.de>
In-Reply-To: <20210625082222.3845-6-tzimmermann@suse.de>

--ZsJWMZ3fKnfvZTQNCUxxACBUzMa2385FX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 25.06.21 um 10:22 schrieb Thomas Zimmermann:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in armada.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

R-b'ed by Laurent via IRC

> ---
>   drivers/gpu/drm/armada/armada_drv.c | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/arma=
da/armada_drv.c
> index dab0a1f0983b..4a64f1b9ec4d 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -130,8 +130,6 @@ static int armada_drm_bind(struct device *dev)
>   	if (ret)
>   		goto err_comp;
>  =20
> -	priv->drm.irq_enabled =3D true;
> -
>   	drm_mode_config_reset(&priv->drm);
>  =20
>   	ret =3D armada_fbdev_init(&priv->drm);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZsJWMZ3fKnfvZTQNCUxxACBUzMa2385FX--

--i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDZauUFAwAAAAAACgkQlh/E3EQov+BI
/hAAwo/d/PjJfngTOTApUkdBmvqLyDR9l5V4s4HUVyGrzgf1k3ANJUoqAEBC0li07IImisiMhKK8
8wmGPIQHSU3aRLQy+IbasD12kuSAJXTiFc8KZ41WpXafVHPiumFm5LRhKTGDC9jw1NtbjnRpaJLR
qng3SVUTGFmAcFjzS4rm+eVvFy6d0S667p+A04vRcWLgMkmZJt8l6mM235cyRVKidi1aoejJLVCd
MgfPBD6QopEOl+KU3aggPK0b+iNk5I8vBTiSGosBFFNF1HAr6YjzyYodpHn1xX7Y9aUIPkoEYmIa
nhym33NotP/6vZJIedE3tHo92o1oRWlB6k36FdX4fRJBkcPoGVDOnm3Q7xZXDTV+bAEKGO4xy//z
FUK8NXmy1vNd5aAt7F2cQPNO0vq6pa0Se8GaIGteQqFbd2LfTdHaZHlEmNb6x+NA1r4uMoTKsbHd
XiGVGBFETOR3ElshkxJGL/aACPeELm/CxMYCCHVYOjakNn7MGDJmQyMlJyzPcEEelXCOOuO7HnOY
Meb9ovN73XEjZcxq4KzOS/sc5FpDU/Te6DQpjFKxKwudZaZrLMLuUypbmmlMP1o1G0hepbNe3rey
eFdvCeu1rBsor2Ae6ooTqoc4SdsyqzHnYfAvQuAkeWUBOW3fekUl8r0Viqxkv1BaYBgK4FW4pNLD
bu8=
=AJ6t
-----END PGP SIGNATURE-----

--i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI--


--===============4226647666765932927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4226647666765932927==--

