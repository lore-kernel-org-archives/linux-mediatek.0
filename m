Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E34606A33B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIWStMwZ;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+fedFhO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=; b=zIWStMwZ78hivK
	i4ad+MH2NFAw/m/Bly0Fp5tB72v5Dzdn9HmNYK+XEKOImtsu/ygGH5gmMJRAPwXM2oRTjNWfilqyi
	Rnl5H0bALnY3RXFx9P7lY1+4E3FzfuSInuvupy7nd2f3+hK9V0Xwm0qmpWOv+7VuyIpAy/GTqjtOF
	v5+atWkl+xLnOXua0pPFAoX7UNMr0UWdRdl0thnUhi/zAwnS32BQ7PnntnNqEg6hBARgVWRNDzBRF
	F2Ply+taKAoWdADX4HeyksCxyZhxEkGYl+FJOLPDx6r8sX4UJgUGWMDyg9baH88VPMO1qlSbrxXjN
	yrgkU52TmImK3TF/BjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUHW-0000000CKIM-0kDb;
	Thu, 26 Nov 2026 07:52:38 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUHT-0000000CKHs-2SaV
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 07:52:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3554843b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795679555; x=1796284355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=;
        b=K+fedFhOHUtGX1V+sRcqpyM1n7j+nQRIs01LTPA9du44oOGXFz+qrC5Pw2W4rMDtjt
         jEiiapYfeM6lJ/Vr499dPY/VO3fWaQd1yBB/BJKEyUSF6QRpZQIHbDP8/wTs9jb5xhFT
         PH4UGT9zzyiW8BkUfYbumL8hyOL4e6VkwqzEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679555; x=1796284355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=;
        b=rPbdoJf730uwCfkuz+xalC3YDSr7KjAYMPxIuoF4tKp8x7wOjfIZm8QKkARYiT3CvP
         QQnNt0Ums4Fy2ubTkGXtfCcc7ajByqTqrz/5rATmI5SO8n2KbiyGRibHmQy327n3jZot
         5O71JK4WfZDDC1oH3flCwzYskiLk8vtWNq1FJ7j3P95Q/x0o2Ck6Cy6a3ps2nRdaVmE2
         cLmbg2N0cWU9JiiRhd+rLtWuwLBUf1cSo+kH5403Z9kcgXzSSRZ8xmvDILyZhKf7T0y2
         kAd4E9VcnTQ5vuASYC38Tc4ViMN9rvXkKDPclVy55zegWWd+nePRT7WmbY2+mBIst+6h
         xayg==
X-Forwarded-Encrypted: i=1; AL+hErEQIn7DR8CKLKJMQPi6mEmu0VjNDlJQGDjSizzX4W3knTZuLBgsurSAYfsZlC71514TCAzkP4VrOgIqf1tp7w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/NjmEQxyOhfiqwQM+PGpBfoq4jGLwaYrJLSq4mIwip3KXlWNoM
	holKmzLg9K9H4jq1FN1ys9B4oiMYk15Q0b2JGlZWyp+KlYm3VeppDOIie2c+wfPk/f09uG+Fjcj
	xnP97Lg==
X-Gm-Gg: AZFdTZducpR6oXqck8czHo90BkKFXoQQAfdrIQi/LigjdfT4xboT7f8uqy+YJrtBIBe
	J5FeURMuLlpL8JAVFM8rRLdrauhVnvAVzGwB2i5r+Pkscw2i18p9wc2Bauvj+s4+Z491l/sxdnL
	hmWtZgEH71o/z60JUDGFz2SFVjUTIIdpykKiQ/UNrpYvoAnlpleRUIFYSKiILD+L93I1FEnznAC
	YRRZOBKGfZmJdR2GG4qlmpScuZlg0besY9QMaLKSKy4NPnqBU0AM977GXFMkrnyzx7VenA9DLJw
	5iRzsyfkjGmwFhIrF+uNpbelX+UYWCVUN/0Ar2QKYZ0Ut+mt4lhGWr/VJSl0y25V+Ch8UvcbSWH
	u2gznCrIyWc31R/89Tp7NiiAos0QUwo5E1IcQYIWgY2AMI5iGNOwvjSRx1lc81aDpZE10Ev2gu7
	3JZ1hRd7zkmh7dZJKHfJ1GPRlBY8b6xnQdhJ6an0zp3vfzMKCTLyCWA5moUyowbFR99T6pKvKTb
	T1WslTGMKsjUagwBmHKCFNgbuBZMM5TrC66GT7/iefYQ+KxbkVN2uTHtsHTFKWN8VDATC3FPH+5
	SxOCD9W2NbyxJjIv/xtun7EqYllQvIg4iwkI8BwhhU1x4qx4WSj0XXYK5Lgl3oP4lSQ2wvNqq4l
	JTcEv4pFAKZ6E
X-Received: by 2002:a05:6a00:2451:b0:899:27b5:214e with SMTP id d2e1a72fcca58-8c87c38b7c8mr17942243b3a.30.1795679554652;
        Wed, 25 Nov 2026 23:52:34 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm10398106b3a.17.2026.11.25.23.52.33
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:52:34 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38431138772so8727194eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 23:52:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEuSVhxwmirhHjN0qmUMRCnLOjYXJgstOb8MRRh459mqtYuhoJ1X4CsN0xyVi2wUR5T+0HiswzBaOtVv72c9Q==@lists.infradead.org
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id
 5a478bee46e88-386b8963d3amr10022337eec.35.1795679552269; Wed, 25 Nov 2026
 23:52:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-18-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 15:51:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngJz=WR=dynO0O4FiAW3rqADNCvEGa9cPn1b-Dfkxi6LQ@mail.gmail.com>
X-Gm-Features: Aa3M54pxRAeFEOdKGCuQ1O6Bt_XOraD0DZxugIMunZCy7TNnnfXexdvBZJe7MKU
Message-ID: <CAC=S1ngJz=WR=dynO0O4FiAW3rqADNCvEGa9cPn1b-Dfkxi6LQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/46] drm/mediatek: Add support for hardware
 multi-stage layers
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
X-CRM114-CacheID: sfid-20261125_235235_681304_72A6D3A7 
X-CRM114-Status: GOOD (  29.32  )
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
> In preparation for adding support for newer, more complex, display
> controllers like the ones found in the MediaTek Kompanio Ultra and
> Genio Pro 5100 (MT8196/MT8894), add support for multi-stage layers
> as in newer hardware, there is a special strategy using multiple
> hardware components of one (or multiple) display controller(s) to
> form one single layer.
>
> Multi-stage layers are one more step towards extra flexibility of
> the Display Subsystem, making it possible to change capabilities
> of Display Controller Pipelines depending on the final application
> of a board: for example, one board may choose to use fewer layers
> per pipeline to achieve more pipelines (more concurrent outputs),
> or more layers to achieve less, but more capable (as in offloading
> and in achievable bandwidth) concurrent outputs.
>
> This currently adds boilerplate to support this hardware, but does
> not yet implement the IP-specific support for MT8196/8894, which
> will be done after all preparation is done.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c           | 304 ++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  15 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  12 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +-
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |   2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   9 +-
>  drivers/gpu/drm/mediatek/mtk_disp_wdma.c      |   2 +-
>  7 files changed, 246 insertions(+), 110 deletions(-)
>
[snip]
> @@ -992,15 +974,15 @@ static int mtk_crtc_init_comp_planes(struct drm_dev=
ice *drm_dev,
>                                      struct mtk_crtc *mtk_crtc,
>                                      int comp_idx, int pipe)
>  {
> -       int num_planes =3D mtk_crtc_num_comp_planes(mtk_crtc, comp_idx);
>         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx];
> +       unsigned int num_planes =3D mtk_ddp_comp_layer_nr(comp, comp_idx)=
;
>         int i, ret;
>
>         for (i =3D 0; i < num_planes; i++) {
> -               ret =3D mtk_plane_init(drm_dev,
> -                               &mtk_crtc->planes[mtk_crtc->layer_nr],
> -                               BIT(pipe),
> -                               mtk_crtc_plane_type(mtk_crtc->layer_nr, n=
um_planes),
> +               struct mtk_crtc_hw_layer *hwlayer =3D &mtk_crtc->hwlayers=
[mtk_crtc->hwlayer_nr];
> +
> +               ret =3D mtk_plane_init(drm_dev, &hwlayer->plane, BIT(pipe=
),
> +                               mtk_crtc_plane_type(mtk_crtc->hwlayer_nr,=
 num_planes),

I hope it's not too late for new comments...

IIUC, mtk_crtc->hwlayer_nr is the CRTC-wide plane index, while
num_planes is only the plane count of the current component.
When a CRTC spans multiple 1-plane components (such as four EXDMA
blocks on MT8196), hwlayer_nr is 1..3 but num_planes - 1 is 0, so no
cursor plane is created.
You might need to forward the CRTC total num_comp_planes to
mtk_crtc_plane_type() instead.

>                                 mtk_ddp_comp_supported_rotations(comp),
>                                 mtk_ddp_comp_get_blend_modes(comp),
>                                 mtk_ddp_comp_get_formats(comp),
[snip]
> +static int mtk_crtc_init_layer_stages(struct mtk_crtc *mtk_crtc)
> +{
> +       unsigned int prev_master_layer_component =3D UINT_MAX;
> +       unsigned int master_layer_component =3D 0;
> +       unsigned int comp_idx;
> +
> +       for (comp_idx =3D 0; comp_idx < mtk_crtc->ddp_comp_nr; comp_idx++=
) {
> +               struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx=
];
> +               struct mtk_crtc_hw_layer *hwlayer =3D NULL;
[snip]
> +               if (master_layer_component !=3D prev_master_layer_compone=
nt) {
> +                       hwlayer =3D mtk_crtc_find_hwlayer_with_comp(mtk_c=
rtc, master_layer_component);
> +                       if (!hwlayer) {
> +                               drm_err(mtk_crtc->base.dev,
> +                                       "Could not find layer master for =
%d!\n",
> +                                       master_layer_component);
> +                               continue;
> +                       }
> +                       prev_master_layer_component =3D master_layer_comp=
onent;
> +               }
> +
> +               /* Add the newly found layer stage to the correct layer m=
aster */
> +               hwlayer->layer_stages[hwlayer->layer_stages_nr] =3D comp_=
idx;
> +               hwlayer->layer_stages_nr++;

hwlayer is declared as NULL inside the loop. On a second stage
component for the same master layer, the lookup above is skipped, so
dereferencing hwlayer leads to crashes. Declare hwlayer outside the
loop.

>         }
>         return 0;
>  }
> @@ -1039,6 +1112,7 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>         struct mtk_ddp_comp *dma_comp;
>         struct mtk_crtc *mtk_crtc;
>         unsigned int num_comp_planes =3D 0;
> +       unsigned int max_comp_stages =3D 0;
>         int ret;
>         int i, j;
>         bool has_ctm =3D false;
> @@ -1121,20 +1195,54 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>                                                 &mtk_crtc->base);
>         }
>
> -       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++)
> -               num_comp_planes +=3D mtk_crtc_num_comp_planes(mtk_crtc, i=
);
> +       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[i];
> +
> +               num_comp_planes +=3D mtk_ddp_comp_layer_nr(comp, 0);

Passing 0 instead of i here skips the `pipeline_index > 0` check in
mtk_rdma_layer_nr() and over-counts num_comp_planes (also carried into
patch 38/46).
Pass i (j in patch 38/46) as the pipeline index.

> +               max_comp_stages =3D MAX(mtk_ddp_comp_stage_nr(comp), max_=
comp_stages);
> +       }
[snip]

Regards,
Fei

