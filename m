Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7A0C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 08:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5XSGgt22gfhlNdwJOJsw/pH5jU2PiKPxPPeoeirhoI=; b=1zEmHt80zjmGx7
	mhD5kxsSMqaIR7w6+v8IN9mT68Y+szv/Jnhuk5p6e+e90wVmqtYpjpAzmtrGo0CxYlBlhcjLaS7AW
	dWC6h4TslRt0GbHCfSJ8aAwOVyFhE0UlfvGUb9jcGeKlhDyvBhgDM6jwoctDLwZx6NtHT+1iOE9E2
	DnV0PBMrsx/gQlM2lFpbC2aJcGoXQNh+LmSf6r3cd1j717S96kIhkuhp7F7pzwKpxSWstTsnZRITF
	Q0c4O1KtRFq6LRUFJLme7QCOTQCqPbo93m0aJPq2cuTx1W+qkOsp/c0uKeupmpbdEKpK4ozi8TvD9
	aP9H1tqUZNf1ooy/j1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMpx-0000000GTUh-1c68;
	Thu, 18 Jul 2024 08:50:05 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMpZ-0000000GTJY-17wG
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 08:49:43 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2eee083c044so6348801fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721292579; x=1721897379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5XSGgt22gfhlNdwJOJsw/pH5jU2PiKPxPPeoeirhoI=;
        b=Lo7vP4kpvx2XS1MnKSQGRiRDRk6UEb2GkeKn16ZYR9C+0/0UNW5jsXQ9h4jOZ9NtTv
         Y13K/3paNkxR1K7nwJ0t/SUdtkiGLhAlE531FrVIpwM5HAu3S9a/SgaeLD4V/JzCQxSq
         2HH1Wo27aX6qIz8lP6TccbqdtcG8DbURwkMCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721292579; x=1721897379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5XSGgt22gfhlNdwJOJsw/pH5jU2PiKPxPPeoeirhoI=;
        b=S2VgGzvCf4Ul4T0KVfa+x+SW2g4WW9xC7ESo/yGKj8pBl1BINxGEpa+y4bsFroUp/c
         4qvCYQ5zd+kKCZWybDPcdF33RIDUB+8F3FfFMEP/VHzxrv+rMoFmKomRsIGKZGhv98C0
         j1CJf5ntvmOU09Iy58EXGkhiunJigTwRwoth8QVLfnef0PgBGxF9lm3XyRnz0cYe1/am
         lH+/xM/Eo4Im0YlpTiGm274Kn6/COLWx03L/EeBS2EHR8VWdviU+2SDya9WEMT+eMAwg
         ANo+Lq3guwIcYW3O7s4eCHgF/j/BnEmB88ZagpCdJgVYm4ZMDYLNLdfc9haVZxPFMSRh
         xksg==
X-Forwarded-Encrypted: i=1; AJvYcCUmBmYX0WuaYxRREkn9ag5Cts68owWdrqswpOPO5IrMfAAIBeV8PE6yx5y8TEbRe32dq6fJxMy3dX3CiY17tkQWQ5+s34YTb6CQc3SCf4N50T7g
X-Gm-Message-State: AOJu0YwWAGY+7T8tliEQFg/UiyuR5hdHL73hudd+zvOGemCl5Sbn8Hzo
	V3I9s9tl4UvkXbxqR7LRGra9Cqf5qI3jCoDi2uQvbfaA9iuVfbLfuslTRteM0iqWHBNe+ISQea6
	wW8B2WTt0Oix+HF9xcZPcKkIjou8MLA7WqFM+
X-Google-Smtp-Source: AGHT+IG2DjunGNz+AEb1WXabve2JGyl+FmIAwPg8sY9p8UhtyfkrR6meUMRp3lKB0WgoJmvcUUvoRzt5fDDJIVdF3V8=
X-Received: by 2002:a2e:9b89:0:b0:2ec:5945:6301 with SMTP id
 38308e7fff4ca-2ef05c79995mr11185471fa.18.1721292578930; Thu, 18 Jul 2024
 01:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 18 Jul 2024 16:49:27 +0800
Message-ID: <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_014941_324327_491482A4 
X-CRM114-Status: GOOD (  19.75  )
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
Cc: chunkuang.hu@kernel.org, daniel@ffwll.ch, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, linux-mediatek@lists.infradead.org, shawn.sung@mediatek.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

(CC-ed Fei Shao)

On Thu, Jul 18, 2024 at 4:24=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Hardware-speaking, there is no feature-reduced cursor specific
> plane, so this driver reserves the last all Overlay plane as a
> Cursor plane, but sets the maximum cursor width/height to the
> maximum value that the full overlay plane can use.
>
> While this could be ok, it raises issues with common userspace
> using libdrm (especially Mutter, but other compositors too) which
> will crash upon performing allocations and/or using said cursor
> plane.
>
> Reduce the maximum width/height for the cursor to 512x512 pixels,
> value taken from IGT's maximum cursor size test, which succeeds.
>
> Fixes: a4c9410b31ca ("drm/mediatek: Set DRM mode configs accordingly")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6f0b415a978d..b96763664c4f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -540,8 +540,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         }
>
>         /* IGT will check if the cursor size is configured */
> -       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> -       drm->mode_config.cursor_height =3D drm->mode_config.max_height;
> +       drm->mode_config.cursor_width =3D 512;
> +       drm->mode_config.cursor_height =3D 512;

Fei already did the same (?) workaround downstream just recently.

OOTH, Intel recently added a feature for enumerating "suggested"
cursor sizes. See https://patchwork.freedesktop.org/patch/583299/

Not sure if other compositors will end up using it or not.

ChenYu

>         /* Use OVL device for all DMA memory allocations */
>         crtc =3D drm_crtc_from_index(drm, 0);
> --
> 2.45.2
>

