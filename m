Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463C8606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nlQ8DwUg;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z92sl3Sy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=; b=nlQ8DwUgOvY2vj
	JqILcuz6Ch3gfHNX3nocyejbrBf1mhKf/CfNZw0vP7KKrMAluk5yB7AquB0/FJpUdgOcDen3gHrCH
	odHj27mYk2p+DHftBFUNTv8kY38Auvcran5s7wPFcuc8VFwmx1sSoBP0TPolulHzd0rh6W75+sij5
	XqIHMrj4qIGgjuVU5Tdw/mfJfWt/THzR/02PaF/leMuYxZny4jRSXbNSnEwqsBzM3mlKWMz7bTxHj
	Fe32Ixy8RDffsnLQGu/XqjeA1CCWLf9iAWIeeCllL9zQFB2imegrlGZEIse86K/IHMHL9JQiZJHSX
	U0mQkWXt3p5MwgFbhX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXJB-0000000ConU-053B;
	Thu, 26 Nov 2026 11:06:33 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXJ7-0000000Coma-0diO
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 11:06:31 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc758830601so5150347a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795691188; x=1796295988; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=Z92sl3SyOT4kk/yUvKEBSsQddxe3XG94YatCZCagMc4od/jnNZTpsBe1huVtkO5tCe
         P/nxh89u9skSlEGuVxI7YSAZ7QWM/HhJIi9kjs9dQj5sh5GLhsudD54EGx6fxlhLAnry
         31x0zCyCwji9eTKwh+GiSdHiYHOj1gMZ5ofPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691188; x=1796295988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=byMtjpWylOLYXhc5HeXUWURDk+rvGBuQr+wBfAqiL4ZVgoMnCgjfqzODuYgnR4JHix
         N+KAcBvWu/JDRUWQPtg0oxNdZsnJhlCixEYKsnS5BtK07PMT3L2EMgb1T7fj3ZBjuTA7
         kAXFJKKNjMBo0B/llAAX0Hqwv6koPKSIKN/7XM/9BCsuy3f5nyTgh1tpzCLYvx+zoNRH
         UOD+aa7KpDA+C7KTPLijh2ogvvSSkwDsYkmqM0680/kW6uZMyy6pnYUbVuDYEbF5POGH
         phqZ1d85A2cFQO9GD1WuwEdWw0SCw4qrB6p9TIA8IVTcDfcD6QgvDhZY5+lY5rRQ4Rw0
         jrNA==
X-Forwarded-Encrypted: i=1; AL+hErFn9uaSUQGBGeuRT0KjC90CIS9ae+D+mgWHnbBsUFU1fcmDvQCBlQs1nc/LfhIQLxSmhGfqimzVOzNVL81U4g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Cp81qegcQZHmqjkC6/h/mL9uZ0LXdmdfdnPXGidSnNmuLQ5Ho
	8JEdFZfpP2XkPUGlDQYVwaAG/Yxrqg+ChoGDx0MDZZ8UcTDJnCLTXhFotRQsEXNwIh81X+LYzJ1
	d5aRVyw==
X-Gm-Gg: AZFdTZcbpbapD4eO/P2mTjtxSZV6Sy4EdswiPX2ODmTAcHf0R6gb0sjdcjONE6ovyYU
	ZJWhntbq6ENygmP9VnFbddP259zAWCobN/VCb1lQt4zSBlysb+iR/9qtZj5hKkSnuHJJhZ0s+vY
	z41IqFFmQRjwJuDy5ZR0BPJvNHS4r3K6eGXxVrWXjm2GNuzNRyiuM511VSba6T8g3NzZrNJm5pR
	iNeTWTzeRCR2I1YpUsnejJaKGIRzS8cik0TWZJDUJ9MjHTsb3ZSi0fNKj8Dn+i6joJozr8zof3y
	fPyC41Rfc/AU1N7rPFvx3Uwmme+B56PrcBILcXxGGzefoDvLnR/zAxZ0+cMHE8agZR0jJibo2J8
	+l8Y7nljKQfSFN9urn1n9CuJ13s7stokDaG1UqMsaMcfZFduaAYjoAsL6uaE4mi0bB4Q6R2A+Kj
	eX+Jti95J2Vo7FJ3y3Eo7eL/0NP+fIuUq+Srynb4Y7oJIUP5Q3z2SmP1cg5FfDqVJFVqhKbtpz3
	ZylpxT+56h1XM67A4ubr2gLL3SwApqM3gcSv0shfQPym7Mw5neEjBeMqeZjBxtG/YDF1FBew0gL
	aLmgK27bUOhq+xisQuN4MvJ4/ePAZI1RFQSDyNpmXtn4IQNHP2IqxYUZ+OTBufy9S5Q=
X-Received: by 2002:a05:6a20:b720:b0:40a:5b71:5a4c with SMTP id adf61e73a8af0-40a5b715aa7mr1097476637.44.1795691188098;
        Thu, 26 Nov 2026 03:06:28 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0332bfsm10925990a12.22.2026.11.26.03.06.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:06:27 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so2593041eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 03:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH/bzaP0diqSOgO51fpwUjWOJWfA0ydwRm4+7t2HqOWlumL/OBthOZmH4kfwNOGbOFdfRhUD+mz+qYFLJreMA==@lists.infradead.org
X-Received: by 2002:a05:7301:240a:b0:386:cd71:b714 with SMTP id
 5a478bee46e88-386cd71ce89mr5908411eec.35.1795691185712; Thu, 26 Nov 2026
 03:06:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 19:05:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
X-Gm-Features: Aa3M54q46fTI_3jhRSfuxLJf-vqFgr66vNyr9HYUTk_fEMF24HCMszULS2t_YS0
Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/46] drm/mediatek: mtk_crtc: Dynamically find
 suitable CRTC DMA device
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
X-CRM114-CacheID: sfid-20261126_030630_816752_88DF2180 
X-CRM114-Status: GOOD (  26.33  )
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

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that the vblank and config components are being dynamically
> selected, the only hardcoded strategy that is left is selecting
> a DMA device for a CRTC that is being created.
>
> In order to support pipelines including an embedded multimedia
> controller (like MDP3) chained with the display controller and
> pipelines chaining multiple display controllers together, stop
> assuming that the first component in the pipeline is suited to
> do DMA operations and implement support to dynamically find not
> only a suitable DMA device, but also the best one.
>
> This finds the first device that provides DMA and the first one
> that is also behind an IOMMU.
>
> The criteria for selecting the best device is to prefer a DMA
> device behind an IOMMU; if not found, the first DMA capable
> one is selected instead.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 68 ++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 3cb2d1a28987..16c9ff2cfe32 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -1132,6 +1132,60 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crt=
c *crtc)
>         return mtk_crtc->dma_dev;
>  }
>
> +static int mtk_crtc_find_suitable_dma_dev(struct mtk_drm_private *priv,
> +                                         struct mtk_crtc *mtk_crtc,
> +                                         const struct mtk_drm_path_defin=
ition *path)
> +{
> +       struct mtk_ddp_comp *dma_comp =3D NULL, *dma_comp_mmu =3D NULL;
> +       int i;
> +
> +       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               const struct mtk_drm_comp_definition *cdef =3D path[i].co=
mp;

`path` points to a single `mtk_drm_path_definition`, did you mean
`&path->comp[i]`? Or use `mtk_crtc->ddp_comp[i]` directly here since
patch 38/46 switches to it anyway.

> +               struct mtk_ddp_comp *comp;
> +
> +               comp =3D mtk_ddp_comp_find_by_id(&priv->hlist,
> +                                              cdef->type, cdef->inst_id)=
;
> +               if (!comp)
> +                       continue;
> +
> +               /*
> +                * Check if this is a legacy OVL_ADAPTOR component and, i=
f so, this
> +                * has to forcefully be the DMA device for this CRTC: ass=
ign it to
> +                * dma_comp_mmu to force that.
> +                */
> +               if (comp->type =3D=3D MTK_DISP_OVL_ADAPTOR) {
> +                       dma_comp_mmu =3D comp;
> +                       break;
> +               }
> +
> +               if (!comp->dev || !comp->dev->of_node)
> +                       continue;
> +
> +               /* Find the first device provides DMA... */
> +               if (!dma_comp) {
> +                       if (of_property_present(comp->dev->of_node, "#dma=
-cells"))
> +                               dma_comp =3D comp;
> +               }
> +
> +               /* ...and check if that device is also behind an IOMMU */
> +               if (!of_property_present(comp->dev->of_node, "iommus"))
> +                       continue;

Checking `#dma-cells` (a dmaengine provider property) and unscoped
`iommus` can be fragile: if the leading plane reader has no `iommus`,
this loop keeps scanning and can pick a downstream non-plane block
that has `iommus`.
Maybe filter by `mtk_ddp_comp_layer_nr(comp, i)` to skip non-plane
components instead:

if (!mtk_ddp_comp_layer_nr(comp, i))
    continue;
if (!dma_comp)
    dma_comp =3D comp;
if (of_property_present(comp->dev->of_node, "iommus")) {
    dma_comp_mmu =3D comp;
    break;
}

Regards,
Fei

