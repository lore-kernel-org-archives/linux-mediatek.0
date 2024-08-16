Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9BCC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 04:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hm9RkZoG1ER1oXNh7yUPZZVN27VQKQBvHKAhbCWqwGI=; b=XchRAfJr9UWsC/gRf5obdJMxQf
	iWmdZKjplja5cpzLE59kN7kZFug2ja7Xv+IcmxthZVNcpwFabqkdbyHqFUMmosUHuD9smDdXmmfWJ
	BGz+O6rcY1V6eefkQ8/PVVZpGeY2T/j9mhkve/EaZz5eoLU0mqpyMBMeVdNrVGlv1ExLr9l4n4lXu
	X8mQIIR9VXw3m5JSSKhi/74iWIeMlzsPml0m6XitjxOjeBqVCMihlpzvJrV7C7Yy/y/1RwrARHKg0
	F1QgT4m7zgc3NFfLeR+QDQZGarY5c02TdToDr9HVywTsHRRaU6ZkWItFyeN9Sak9arfHx7c1MoqTT
	YbeHBGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seoBq-0000000Bi3Y-2Mll;
	Fri, 16 Aug 2024 04:03:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seoBA-0000000Bhu3-1UYN;
	Fri, 16 Aug 2024 04:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5287D620A6;
	Fri, 16 Aug 2024 04:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0967AC4AF0B;
	Fri, 16 Aug 2024 04:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723780987;
	bh=4GAZmM/9DtLX0KB1XpogjgnI+I82wrlfm93YsGzxfUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=on5KeV0PxSGfPznPYYdE3sSbG/h09J6k5lCwbFnFCEc01E5MhV5C61w17T8qpqe3t
	 bFFnR9OXSGtUXdi0CwKFVH3OYb22qSYqczfWCxYN2tindoi7O2UkYOtdrPe5rMOYCn
	 2OUpibCt3w05PEuHYCN7H8je0qBbyvWbkhQPJlxzbWRa51PeYzjWFWboA1h8pPRBN0
	 e/8J4DTW8NIi3mKTYlV30b6te+PgPtSMgw8RB7nUlF2G9qfnPRe3orkmdk7iUQASqE
	 Tdq/AhabJP5BBBg08+nXL9d+XZwLYnGvKqNinguAX9FpTfwuhNHFr+zq4BX42yo1tv
	 81YAIk4MGpg5A==
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7c1f480593bso1246525a12.0;
        Thu, 15 Aug 2024 21:03:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiEp5dC7HTxupP0AZ/plFxFIvH8ZEqg5Jc9P44Y5J5sUpd/WsGkNn2fq2fzwvf0WqLa97SjfaPrEWNDjP9/bRshPKgSjj63wmuRdyOYKwd8qqvkJSR2B/h+KIDdkVS3gkCR5WatYoQtM+j5o/XauCMeX+oxl67L54=
X-Gm-Message-State: AOJu0Yyu+4KaFx3kpxId+12lnUWlFa6LXUKG0lPCbKgpaLOzW3HIPkLe
	fBMAjX+KOW/mcnnuuNmW0mxQ+VmQt7TGT4+saZouMvcdM/COQD0tWIFVLcpOkcXwmWPTGrrN4Ce
	u08ZneanITPsLnjgha/1FOuYqTA==
X-Google-Smtp-Source: AGHT+IEOGuaBfZk2Mttwbtdt3blKF/XU9pCPPCi7eO6Mh8VFFnf3M2v3Xsh5ll49RERqc+5RGbfiKUdsPEq0KZMsMrY=
X-Received: by 2002:a17:90a:6fa3:b0:2c9:7616:dec7 with SMTP id
 98e67ed59e1d1-2d3dfc2b2dbmr1932025a91.6.1723780986477; Thu, 15 Aug 2024
 21:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 16 Aug 2024 12:03:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY__xOVgdF1iEtcbXrmnM40og8XJGZ+-5K02q58XbYY3GGQ@mail.gmail.com>
Message-ID: <CAAOTY__xOVgdF1iEtcbXrmnM40og8XJGZ+-5K02q58XbYY3GGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Jeffrey Kardatzke <jkardatzke@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_210308_515182_49BCEEC7 
X-CRM114-Status: GOOD (  19.94  )
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B47=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:33=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
> generate instructions to cmdq_handle, such as:
>   state->pending_config
>   mtk_crtc->pending_planes
>   plane_state->pending.config
>   mtk_crtc->pending_async_planes
>   plane_state->pending.async_config
>
> These configuration flags may be set to false when a GCE IRQ comes callin=
g
> ddp_cmdq_cb(). This may result in missing prepare instructions,
> especially if mtk_crtc_update_config() with the flase need_vblank (no nee=
d
> to wait for vblank) cases.
>
> Therefore, use the mtk_crtc->config_updating flag set at the beginning of
> mtk_crtc_update_config() to ensure that these configuration flags won't b=
e
> changed when the mtk_crtc_ddp_config() is preparing instructions.
>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 34 +++++++++++++++--------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 6f34f573e127..bc3bf0c3edd9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -314,30 +314,32 @@ static void ddp_cmdq_cb(struct mbox_client *cl, voi=
d *mssg)
>
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
> -       state->pending_config =3D false;
> +       if (!mtk_crtc->config_updating) {
> +               state->pending_config =3D false;

I think if mtk_crtc->config_updating =3D=3D true, the whole clear job
could be skipped.
And use spin_lock to protect the clear job in irq.

/*
spin_lock():
if (mtk_crtc->config_updating) {
        spin_unlock();
        goto out;
}

/* clear job */

spin_unlock();
*/
out:

In mtk_crtc_config_update(), use spin_lock to protect mtk_crtc->config_upda=
ting:

spin_lock();
mtk_crtc->config_updating =3D true;
spin_unlock();
...
spin_lock();
mtk_crtc->config_updating =3D false;
spin_unlock();

Regards,
Chun-Kuang.


>
> -       if (mtk_crtc->pending_planes) {
> -               for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> -                       struct drm_plane *plane =3D &mtk_crtc->planes[i];
> -                       struct mtk_plane_state *plane_state;
> +               if (mtk_crtc->pending_planes) {
> +                       for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +                               struct drm_plane *plane =3D &mtk_crtc->pl=
anes[i];
> +                               struct mtk_plane_state *plane_state;
>
> -                       plane_state =3D to_mtk_plane_state(plane->state);
> +                               plane_state =3D to_mtk_plane_state(plane-=
>state);
>
> -                       plane_state->pending.config =3D false;
> +                               plane_state->pending.config =3D false;
> +                       }
> +                       mtk_crtc->pending_planes =3D false;
>                 }
> -               mtk_crtc->pending_planes =3D false;
> -       }
>
> -       if (mtk_crtc->pending_async_planes) {
> -               for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> -                       struct drm_plane *plane =3D &mtk_crtc->planes[i];
> -                       struct mtk_plane_state *plane_state;
> +               if (mtk_crtc->pending_async_planes) {
> +                       for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +                               struct drm_plane *plane =3D &mtk_crtc->pl=
anes[i];
> +                               struct mtk_plane_state *plane_state;
>
> -                       plane_state =3D to_mtk_plane_state(plane->state);
> +                               plane_state =3D to_mtk_plane_state(plane-=
>state);
>
> -                       plane_state->pending.async_config =3D false;
> +                               plane_state->pending.async_config =3D fal=
se;
> +                       }
> +                       mtk_crtc->pending_async_planes =3D false;
>                 }
> -               mtk_crtc->pending_async_planes =3D false;
>         }
>
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
> --
> 2.18.0
>

