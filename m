Return-Path: <SRS0=vEIf=YZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B45ECA9ECF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 14:24:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE922085B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 14:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5d4iQNU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="L9mkgsOe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE922085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0akZyZxRmO86V28dSZ955KcnVnwiaO6bK3Or8VQTaSg=; b=K5d4iQNU65CRjM
	5QhtJbta67oN0ztAnFw+gCQ70bQycJJEnSRiPMuChPTbPR4VvG/l1deFEkWWAzn3SzFNAM6Qw43v9
	6fEQ1nQDIOwhG5dywhTuogFjLNpIp9u/LY3Tra9/HVZZ5zKFT9+gD3sC5s3bVzZwWtz69vMN+pEHj
	NCarm7blPkQ/3YM3to2calHe3KHeKaMG9KjcXxH7xw375beiTYBsJWD2XAfm5f0z5YuKtslptFj0L
	v8LGe3329g3ObSRCm/yGWT1MTe1c0qr72SA+54p6MUI+pdFiyyoWPwYKZKNVxMhDVRFquGIyr4aO5
	Fk+RM8Nx5cgPk3eqKrwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQXqr-0001mk-TC; Fri, 01 Nov 2019 14:24:33 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQXqp-0001hG-6t
 for linux-mediatek@lists.infradead.org; Fri, 01 Nov 2019 14:24:32 +0000
Received: by mail-io1-xd44.google.com with SMTP id n17so11112602ioa.0
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Nov 2019 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+vng+J+x8nXnMK0HHy+Gog6stMzieYZQkzg6Lms2hs=;
 b=L9mkgsOeP8AqU8o8n+ekUfpsIyQ3KRaj1BZKKoHpDP2oa3tdd7xdWBPjNK6LfJi0NY
 pksrlocMn8kXwDiKL83WVfFe33M81phbZPhE7xogOl5y4BKhEcm8NOXh164yJsvpP8aH
 iFX3UiNoapjux3YdCx++qV7Gu3+0a9I48ta1RjYRfVlWsLNRAckj4cQF6yKtWBCeXwjl
 c0TatTBg5Js+gMI4v8N6+KQGUOCHeyFyMl/pCwGJfpbDhiFyfw6xiFo7/joc0UFRMOZJ
 B9R7p704QuE2ohW57iu/hHx57Nzom5UtFH9o234qQyjKaEYCmIPjLTKv1dMtrUqIc5Bp
 cR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+vng+J+x8nXnMK0HHy+Gog6stMzieYZQkzg6Lms2hs=;
 b=HeXNlPyZDgzT0B0wWhQMwKmwM7ivP4GtKw/GueysFHoq41HcNVvIR7kqr9xTFLnfWj
 8NCjKBMQot49lDMIAtTMBm+Q4vjS3lqoPKsBiqKTe6hyuwAS2GWiQ4gkUsXfcmi1Osqo
 3QSS2KCJhdX7sieL1aM8WJhQ7fvI23K/oDAv+h6ovCb+QdVu6e3gXAPsRNfo1h81XWJY
 fDgpaIKrYa6kOV2MGUGLdhk3jHrZ2m0H61GFsqNicggdWhbWShoRE8yh/YI0sUffvNBa
 l1Tq8JKh7gc/uMsqot046y80bHzc5cbHCExajsZuxtV7I2mP2Yp7XnX02NsoAEGO1vdV
 q8vg==
X-Gm-Message-State: APjAAAXfXzYjAvWUwjp3dlpGsTQSM/h42MkRruQhIkPcHK+l3byv2CL+
 lTbJTMTqQsoR4HKv/wNLcWfEFaTe3rMoPKos15hD0w==
X-Google-Smtp-Source: APXvYqzfPVi2/Z+rgUtPHPQHchTRbkYa5nQMNiBMdfzogx6iHFNX42+5L/njt4nEUIxQ8+6+wQ3nIYf1VjaDvbVKZAA=
X-Received: by 2002:a6b:d104:: with SMTP id l4mr10730180iob.50.1572618266728; 
 Fri, 01 Nov 2019 07:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191101132647.189033-1-sean@poorly.run>
In-Reply-To: <20191101132647.189033-1-sean@poorly.run>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 1 Nov 2019 10:24:15 -0400
Message-ID: <CAC0gqY4cK7wZ97ory-kPEBAcqUsC2GLv9LOQw+QMODe=pKz5NQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Support reflect-y plane rotation
To: Sean Paul <sean@poorly.run>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_072431_268358_506F6BBC 
X-CRM114-Status: GOOD (  20.69  )
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
Cc: Daniele Castagna <dcastagna@chromium.org>, dri-devel@lists.freedesktop.org,
 CK Hu <ck.hu@mediatek.com>, Miguel Casas <mcasas@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested it on my end and confirmed that it works as intended.

On Fri, Nov 1, 2019 at 9:26 AM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Expose the rotation property and handle REFLECT_Y rotations.
>
> Cc: Fritz Koenig <frkoenig@chromium.org>
> Cc: Daniele Castagna <dcastagna@chromium.org>
> Cc: Miguel Casas <mcasas@chromium.org>
> Cc: Mark Yacoub <markyacoub@google.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>
> The hardware also supports REFLECT_X, but I just could not figure out
> how to get it working. If someone is interested in getting this going,
> I'm happy to share notes and my WIP patch. For now, though, I actually
> only need y-flip so I'm giving up on x-flip.
>
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  6 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 ++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 14878ebf59d7..6505479ee506 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -50,6 +50,7 @@
>                                         OVL_CON_CLRFMT_RGB : 0)
>  #define        OVL_CON_AEN             BIT(8)
>  #define        OVL_CON_ALPHA           0xff
> +#define        OVL_CON_VIRT_FLIP       BIT(9)
>
>  struct mtk_disp_ovl_data {
>         unsigned int addr;
> @@ -229,6 +230,11 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
>         if (idx != 0)
>                 con |= OVL_CON_AEN | OVL_CON_ALPHA;
>
> +       if (pending->rotation & DRM_MODE_REFLECT_Y) {
> +               con |= OVL_CON_VIRT_FLIP;
> +               addr += (pending->height - 1) * pending->pitch;
> +       }
> +
>         writel_relaxed(con, comp->regs + DISP_REG_OVL_CON(idx));
>         writel_relaxed(pitch, comp->regs + DISP_REG_OVL_PITCH(idx));
>         writel_relaxed(src_size, comp->regs + DISP_REG_OVL_SRC_SIZE(idx));
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 584a9ecadce6..4d8f2b55334b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -88,6 +88,9 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>         if (!fb)
>                 return 0;
>
> +       if (fb->format->is_yuv && (state->rotation & ~DRM_MODE_ROTATE_0) != 0)
> +               return -EINVAL;
> +
>         if (!state->crtc)
>                 return 0;
>
> @@ -132,6 +135,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>         state->pending.y = plane->state->dst.y1;
>         state->pending.width = drm_rect_width(&plane->state->dst);
>         state->pending.height = drm_rect_height(&plane->state->dst);
> +       state->pending.rotation = plane->state->rotation;
>         wmb(); /* Make sure the above parameters are set before update */
>         state->pending.dirty = true;
>  }
> @@ -166,7 +170,12 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                 return err;
>         }
>
> -       drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
> +       err = drm_plane_create_rotation_property(plane, 0,
> +                                                DRM_MODE_ROTATE_0 |
> +                                                DRM_MODE_REFLECT_Y);
> +       if (err)
> +               DRM_INFO("Create rotation property failed, continuing...\n");
>
> +       drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 6f842df722c7..83b634a997cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -20,6 +20,7 @@ struct mtk_plane_pending_state {
>         unsigned int                    y;
>         unsigned int                    width;
>         unsigned int                    height;
> +       unsigned int                    rotation;
>         bool                            dirty;
>  };
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
