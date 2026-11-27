Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873B606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwOVG5pB;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fcOu6ktJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=; b=WwOVG5pBBY17HA
	VfYzG+RzbiUxM6fkPAU5NlIaoboMqshHZB+AKVMxmmfZxtOU59oe2EUCBx4ou16pmpueu+a9EKIQO
	Zvt/v4SmNMtCA3E/wu1qdRu9dlYtEkwRB9c+xJqMONaFv/DUVXLdabSZG6jZezzubheNzAP7v6N7j
	+Arl4GzSIInv4d/6jrDVRYWJkhvVrstJVygaLz8U4j1IKN6id/i7w3YQF3cmVyDNSQop6JZ1wLQM8
	ELthW47CvEO4RJx3s43z4cz+UWuz/RTh5MuPVc5P4juVPMQhsJolgfKywpM7RuKhBf9URIV2we4um
	C+soChWo5xX8w/+CB8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtX9-0000000FgBw-2DMF;
	Fri, 27 Nov 2026 10:50:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtX5-0000000FgAn-215m
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 10:50:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8a070755c8cso3830951b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795776623; x=1796381423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=fcOu6ktJ8GAJTNlGt0buhnM4G7OHGrK6gjMulHo+Buz29++4RG9Z0PKMFAU0bRadyi
         kOJBuiJTYGi7ytyjTg/dLz5Xe4WrStB2xl6m1ErgY6yKPjEZqLtiyzABff5XIYHYAfab
         jeP42YPb9h0KTKk6YtjELut2vrF6VFEnVyLV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776623; x=1796381423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=g/4djKb5Yq1cBTpYeQFHgLe1fJ7dIBcyL0+1clji5xb/5//suxExQa6aDHk9yDf0pk
         kRp//QUcGnRSulHKcrqi605YbtYG3vuhD1KvRZ5awKwnU2mR2GbfZlX3xp0ctClDMzEU
         jH8zTviFxcPlRObqYrFZKeT5vcb+QKmkvqOieah69isGAudhS2l7ApCbr7eDRIiMenwN
         BN5JafxYx5+pP0EFXriunEk2GhcoIbjqnuTUtWWmEsK4+nVXsvMoRbKpsKq2/3gqvHFH
         Q3TGrnpvOMrSYhzzxEZ5lngnN55i96Q2fAPQ6Lnww24vZQi/ZgHwUazTNnOLPlCeFBHb
         RAaw==
X-Forwarded-Encrypted: i=1; AL+hErGc57awoL3sCJ8WRymXkXkeVzAUPBd4SkIFoWIgYTEk55xz1uMOuQlJdM79sUwQMFGudesbMLm54mhtcInfRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9TpixS0vfpOX8ixjr9+WvKL/U++iLdMcra1Y0ezY2w0FE81SaK
	lON9oI1OzYnIjmNjCVtOJQRsmJSEM1QmmSMrFcJWZkuewY58ofHxFpEfA/PxL9rHcqC/8HMO5hp
	ReuqMpg==
X-Gm-Gg: AZFdTZelsXkPhys4JjZiOm0uyGIDsYM87JXFgDN6x7rIucUj1evzzndQFJe3Quj37Jb
	51nk9kOh3NgxKX4sHKiMY4zM4fRSXz6N7pjEuk5/S6KD6sPMvP4X4AHmqs+D+wmp5C+yEKqdgZp
	DQHck9EXZQRqSUoG8+cY7dswd8VwCToKMZV4JaSUIdrlYhU3Qd6qBcNdLFpGL8WPkNjWmMSfUO5
	ZAONP1dScKV1estozCvltOA9bGzmuqs2cW2NYNCItxIRYwgFoY2aRTnOBIulrt2mdNihP/tAiLW
	ss6bYau2dnND5ja1rMxSr8v1/h/LWpG88N0xjD/vMfHPTCQC3SwyuZgxmTai8Ig2lKkc/1dxf9Y
	zCWd3MIbNA294ceYy4os7HofyQ58A71IqoaK9LgBBP2dj73o/g7apUUagUhM0NGHYCmgN1cLFBE
	Kcou+JZKhBbQXD0YpBdJcy+2P64NTtR+sCTzoUYfsmytHouyNybailR8DZ9/TQuHY9UKhrCP2zB
	4HN5O7Pb7jPc7upe6n1wP8RylimbaCIFitGg5z6OQKjvumOr8vAAfeaOPm22rd9pJqzBJVhEH+h
	MdzmW2cmyMSEYLhYIakwc5DVnKVqix1ynAPAJvvUlTUB9eY1v7pp1k42Lk0I1hWmUm4=
X-Received: by 2002:a05:6a21:170f:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-4014c258979mr24576001637.50.1795776622576;
        Fri, 27 Nov 2026 02:50:22 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0100ccsm12541145a12.17.2026.11.27.02.50.21
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:50:21 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso16916925eec.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 02:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHCvOhR8sJo+b/888IWJxXvZmcyIVjNWz4bphR4OK4fcyls1vieMDerpU57CztCaeLXYr4dWhH+x5x7k9S+Lw==@lists.infradead.org
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id
 5a478bee46e88-3869c6a3f0fmr19991102eec.15.1795776620365; Fri, 27 Nov 2026
 02:50:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 18:49:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
X-Gm-Features: Aa3M54rQkdVsbW33JjuQjGjC9MCiVwfA-JMszG-a0o7TcRXKKUJN-zbdfm4qHSM
Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
Subject: Re: [PATCH v2 38/46] drm/mediatek: Enable bring-up of
 multi-controller CRTC paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025023_524066_4CAD3C4F 
X-CRM114-Status: GOOD (  21.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Introduce support for actaully bringing up a full crtc path that
> features multiple display controllers: this enables acquisition
> and writing to multiple MMSYS and MuteX instances to connect the
> multiple display controllers and enable trigger signals from the
> various hardware sub-components at the same time.
>
> This currently only works for rather rare display pipelines that
> can make use of multi-controller without DirectLink architecture.
>
> This change is also the final preparation to introduce support
> for handling DirectLink Display Controller paths, found in the
> MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894 and also
> in the Dimensity 9400 MT6991, Dimensity 9500 MT6993 SoCs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c     | 513 ++++++++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   6 +-
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   4 +
>  3 files changed, 398 insertions(+), 125 deletions(-)
>
[snip]
> +static int mtk_crtc_init_multi_controller_properties(struct device *dev,
> +                                                    struct mtk_crtc *mtk=
_crtc)
> +{
> +       struct drm_crtc *crtc =3D &mtk_crtc->base;
> +       unsigned long controllers_mask =3D 0;
> +       struct mtk_drm_private *priv;
> +       unsigned int i, j, k, z;
[snip]
> +                       mtk_crtc->controller_idmap[z] =3D mtk_crtc->ddp_c=
omp[j]->controller_id;
> +                       z++;

`z` is uninitialized.

> +       for (i =3D 0; i < mtk_crtc->num_controllers; i++) {
> +               u8 controller_num =3D mtk_crtc->controller_idmap[i];
> +               struct mtk_drm_private *priv =3D mtk_crtc_get_controller_=
priv(mtk_crtc, controller_num);
> +
> +               if (!priv)
> +                       return -ENODEV;
> +
> +               mtk_crtc->mutex[i] =3D mtk_mutex_get(priv->mutex_dev);
> +               if (IS_ERR(mtk_crtc->mutex[i])) {
> +                       ret =3D PTR_ERR(mtk_crtc->mutex[i]);
> +                       dev_err(dev, "Failed to get Controller %u MuteX: =
%d\n", i, ret);
> +                       return ret;

If a later iteration fails, the mutexes claimed in earlier iterations
are leaked. Unwind them with mtk_mutex_put() on error.

> -       ret =3D mtk_crtc_find_suitable_dma_dev(priv, mtk_crtc, output_pat=
h);
> +       ret =3D mtk_crtc_find_suitable_dma_dev(mtk_crtc);
>         if (ret) {
>                 dev_err(dev, "Could not find appropriate DMA device!\n");
>                 return -EINVAL;

This is a legacy direct return. It needs to jump to a cleanup path below.

> @@ -1446,4 +1700,19 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>         }
>
>         return 0;
> +
> +err_free_idmap:
> +       devm_kfree(dev, mtk_crtc->controller_idmap);
> +err_free_layer_stages:
> +       for (i =3D 0; i < num_comp_planes; i++) {
> +               struct mtk_crtc_hw_layer *comp_plane =3D &mtk_crtc->hwlay=
ers[i];
> +
> +               if (comp_plane->layer_stages)
> +                       devm_kfree(dev, comp_plane->layer_stages);
> +       }
> +       devm_kfree(dev, mtk_crtc->hwlayers);
> +err_free_crtc:
> +       devm_kfree(dev, mtk_crtc);

Before these error jumps, mtk_crtc_init_comp_planes() and
mtk_crtc_init_drm_crtc() have already linked `drm_plane` / `drm_crtc`
structs into `.plane_list` / `.crtc_list` under `drm_dev->mode_config`
(via drm_universal_plane_init() / drm_crtc_init_with_planes()), so
freeing `mtk_crtc->hwlayers` and `mtk_crtc` without calling
drm_plane_cleanup() and drm_crtc_cleanup() can cause UAF. Please clean
up the registered planes and CRTC before freeing them.

Regards,
Fei

