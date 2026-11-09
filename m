Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC4606A338
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GvzwCpef;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lZOkUfga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=; b=GvzwCpefd3c8hb
	/Q2bhkmSyjBBbpeUgroTfFF3My0fdKNyR5lIMMlqvhEAOxo/MXKR0tvmrr8qUA95zMXoAP58sCsc3
	nLkNeSq4ga8xoilrKY+4br4+vvW/b6tXlkDlQ+OQBjx/g+YFslOPkowK7Da+8ilKalBdAfGLduI3/
	hWoe6l/XlAYHMX6qN7Gb6l5+P7B34ERkumgRv2Nw1RNn2ac8dTSiw/fAqTFDWtjQklCxZimU7Ui/Q
	MK/RjrJKeQ6UtcNOkpkbVIcgIVovzeBxGpR5t9OY8kRxdbuwhNlk3XirItgMGP3iHydlMSeyZ39vt
	TRZNgpCeSDQASeCmpVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLzH-00000000IJC-2ZCj;
	Mon, 09 Nov 2026 09:48:27 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLzF-00000000IIS-0TS8
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 09:48:26 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso208968a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 01:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794217704; x=1794822504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=lZOkUfgaDsjOuTXkpGmKhNmVVPX3jVQv58/pqOWkppvkIj1GrbUIp0FN9Q8XFrNXF9
         n3dVA+HJFe4q+riNYRd3SNCaMfKBa9yXs94HN/etkYJfnrNmjiLvGEgFoHOHY7wvMMHy
         gjpmkUtSdPGMDqApy3yRpzmpIEVWp2/6cD8Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217704; x=1794822504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=uOtxXkU7E8myxIYsS1vSpW8uUiLrE/br7RRma0aMCtzaNGGbgkBVwisvIes0/ZjhnI
         N3RCQRDes8+NKsQClv3qCNeb5obQDnYXA1ZvQyHWLW2WSBPxaE7ctxKYg/kbzQtCd8sq
         Pr8j82JyoQz/kjxL0Wr+2THOp9u6/vACy14BLrvOFbp3gQ8A8dyMDxbTUJqD7IUmQ+J7
         z6TJiD3gzKf28P6oir0HnHUXhcYxhn4Xtg1BV2csaNPf+glJSl3Clp/UzGi+EkFOkFcJ
         N+Vkx7T3yExr9C2VuWtWB+3KBKlMbv7gURqfQd6rlyBncgrBz+sPQS3UQl4Qxxoq9c8l
         QwOA==
X-Forwarded-Encrypted: i=1; AL+hErH6iGyVNrVUMmIVTYXxjduDfhwRJuTHPV+iFRNwON5HDF5ZNMR+Z6cj9zy4gQ6LodlXlhw/GVi9wfefAkoSHg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/+UFh+5sc8Hs+wZSl+DDbbW4LT40lwr1B3z6hDEJO7YhRCIfvB
	t+6ixCifXDgGr97tFAsAvddrqXU96u27uHwj5nqr4O4rW9Ycc9zF2T/+SdP29yRnLVc4RKU/eQ+
	1yRR9Sw==
X-Gm-Gg: AYBFou2bv4wxnW/rLo4/13+sT98RAprs3cPxDb8fWQ86UCZGqQ7LFS/GHlWav0vk0vs
	Zf/XKuy6zSkR54umAocWAyUZSTenWRKb3G3e0zraZhgAt4w37JuMYozv6eUTKvb72iFAxdXsmlY
	8R8AWgFCfjd/fXLqGKlFtvrASAXKxXhWFFcZsQv6vl2/aAyGnH3e0TZ/nlBIohNscIia4tKo0eh
	nARcWmOALVwiyNp9yBtrfWt/5L1fSxcYSy/HYmo+jYJNO9FkPe7fic/aW2yMT1UOnVwcp29c2yt
	80eZAQ9y/LTWBTpuXW/q33eOodItAyFDpMrqjzdQ60RnWO0wTZ/NvUkTChTAh6UAek8MFiDHO53
	BUVUORId1lD2V6es50PgzrnnJbvSBBMo7WiQUkJNnW5bilkYLwBd9XZabj3dEV/5Fm5YqimSNFf
	lYu4B1LegpiNoElAKAkoHG3H0CxNq7DAsy7ujJoS4wV3QXlZPbq5/MN8s0ijg7D1xJZ8WyBg1Sh
	9f/3ZM8RZOiqNl/0h+nXN8E4arYXqmjzYGlgPwJPtag83/bcYIayKd2DuTYCMlE7WpGa+tSNhJf
	m1/t0lA/L7gNEdfo96gutT3/2MJbK8sp59Q9bO04dit9PxMZNRMyTPk6wfV12Q==
X-Received: by 2002:a17:90b:1d05:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b12d3a219fmr3345319a91.47.1794217703907;
        Mon, 09 Nov 2026 01:48:23 -0800 (PST)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com. [74.125.82.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b139d0a166sm3936208a91.3.2026.11.09.01.48.23
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:48:23 -0800 (PST)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1028168c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 01:48:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHHDF9dkmhPz1r3OHb/1IRj18Wy6tSTn/YP7H7FzjSe1AenS7pgvyRo6HPDwcu6dTYHlZlHQqasjER3vTGKWQ==@lists.infradead.org
X-Received: by 2002:a05:7300:ce86:b0:35e:f1a5:9ba6 with SMTP id
 5a478bee46e88-37252b4c091mr6436576eec.5.1794217702332; Mon, 09 Nov 2026
 01:48:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 9 Nov 2026 17:47:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
X-Gm-Features: AclHuK_kbp2RlyhWxo_Xx4hVQaPPUEY10kfNvYs17nATUWr47nBdslkFDfWhjSg
Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
Subject: Re: [PATCH v2 09/46] drm/mediatek: De-duplicate internal component checks
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
X-CRM114-CacheID: sfid-20261109_014825_190347_5CA7D002 
X-CRM114-Status: GOOD (  28.10  )
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

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Both mtk_ddp_comp and mtk_drm_drv are performing similar checks
> to distinguish components that have an external driver from ones
> that don't - with the exception of mtk_ddp_comp also checking if
> the component is related to a backlight driver.
>
> Create helper functions in the main component management driver
> mtk_ddp_comp, one to check if the currently checked component is
> internal/simple, and one (static, internal to mtk_ddp_comp only)
> to check if it is a backlight related one.
>
> Since the amount of internal/simple components is lower than the
> amount of ones having a specific driver, and since it is expected
> that most of (if not all) of any new hardware support will need a
> specific driver as well, the helpers are doing an inverted check
> compared to what the code was doing before, as both mtk_ddp_comp
> and mtk_drm_drv were checking for external component explicitly,
> while now they're doing the same, but checking if NOT internal.
>
> Also, while at it, for the OVL_ADAPTOR components case, instead
> of checking for MTK_DISP_OVL_ADAPTOR, call the already provided
> mtk_ovl_adaptor_is_comp_present() function to check for this type
> of component.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 46 ++++++++++++++-----------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 16 ++-------
>  3 files changed, 29 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.c
> index 2ba2123238b3..a9c3e29fb340 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c

[snip]

> @@ -700,26 +720,12 @@ int mtk_ddp_comp_init(struct device *dev, struct de=
vice_node *node,
>         if (ret)
>                 return ret;
>
> -       if (type =3D=3D MTK_DISP_AAL ||
> -           type =3D=3D MTK_DISP_BLS ||
> -           type =3D=3D MTK_DISP_CCORR ||
> -           type =3D=3D MTK_DISP_COLOR ||
> -           type =3D=3D MTK_DISP_DSC ||
> -           type =3D=3D MTK_DISP_GAMMA ||
> -           type =3D=3D MTK_DISP_MERGE ||
> -           type =3D=3D MTK_DISP_OVL ||
> -           type =3D=3D MTK_DISP_OVL_2L ||
> -           type =3D=3D MTK_DISP_PWM ||
> -           type =3D=3D MTK_DISP_RDMA ||
> -           type =3D=3D MTK_DISP_WDMA ||
> -           type =3D=3D MTK_DISP_DPI ||
> -           type =3D=3D MTK_DISP_DP_INTF ||
> -           type =3D=3D MTK_DISP_DSI)
> -               goto end;
> -
> -       ret =3D mtk_ddp_comp_init_internal_comp(dev, comp->dev);
> -       if (ret)
> -               return ret;
> +       /* If there's no external driver for this component, allocate and=
 init now */
> +       if (mtk_ddp_comp_is_internal_comp(type) || mtk_ddp_comp_is_backli=
ght_comp(type)) {

If I understand this correctly, MTK_DISP_BLS and MTK_DISP_PWM are
bound by the standalone pwm-mtk-disp driver. Initializing them as
internal components requests the same exclusive MMIO region and fails
with -EBUSY on whichever driver probes second.

Drop `mtk_ddp_comp_is_backlight_comp()` here so backlight nodes skip
internal init as before.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index e956e1966b86..18683aee61ff 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1166,20 +1166,8 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>                  * blocks have separate component platform drivers and in=
itialize their own
>                  * DDP component structure. The others are initialized he=
re.
>                  */
> -               if (comp_type =3D=3D MTK_DISP_AAL ||
> -                   comp_type =3D=3D MTK_DISP_CCORR ||
> -                   comp_type =3D=3D MTK_DISP_COLOR ||
> -                   comp_type =3D=3D MTK_DISP_DSC ||
> -                   comp_type =3D=3D MTK_DISP_GAMMA ||
> -                   comp_type =3D=3D MTK_DISP_MERGE ||
> -                   comp_type =3D=3D MTK_DISP_OVL ||
> -                   comp_type =3D=3D MTK_DISP_OVL_2L ||
> -                   comp_type =3D=3D MTK_DISP_OVL_ADAPTOR ||
> -                   comp_type =3D=3D MTK_DISP_RDMA ||
> -                   comp_type =3D=3D MTK_DISP_WDMA ||
> -                   comp_type =3D=3D MTK_DISP_DP_INTF ||
> -                   comp_type =3D=3D MTK_DISP_DPI ||
> -                   comp_type =3D=3D MTK_DISP_DSI) {
> +               if (!mtk_ddp_comp_is_internal_comp(comp_type) &&
> +                   !mtk_ovl_adaptor_is_comp_present(node)) {

And here, pwm-mtk-disp isn't a component driver and never registers a
component. Adding a backlight component may prevent the DRM master
from ever binding on SoCs.

Add `!mtk_ddp_comp_is_backlight_comp()` here, and in
`mtk_drm_register_sibling()` in patch 40/46.

Regards,
Fei

