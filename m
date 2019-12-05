Return-Path: <SRS0=lqdO=Z3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60912C43603
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 06:16:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DBA22464
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 06:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrOjB3lw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OpbZtYc6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DBA22464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXZ3IiT4ZTqhwRi1wXPYr1srN6n2Q/Au9s8XuankmyU=; b=lrOjB3lwh/X8Jh
	ssUAo4gpAutj9MAlTRBmooGAJoNj3GfEGeIW1CmOQJeXq7r9VyUctPUEBHc65DPrd64iQtQjln+ks
	AgwhGYH4VDSvXqiYskAn0iaMOuIu8hf4TpXEUgj3YjesPfEPB/T4Kczb0eOv6Kw87qNfkQZfCUf9r
	4Jbex56lKlYkFeDkvefNKYLAA2embd4wAjNNUq4Eg2CHMJ2uzgi6Y1oU0U+xgwvDJidhm+RTvloUH
	w1fJGCwLIiGVVeuhZtlC+Wp0buCaLMvp4laT7Un6We7YzsF3X2JdSHa/U1F2hke5tGwZ3C421TxXX
	n2bgT8nf4CvdTzpUbfqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ickRG-0005ex-Ia; Thu, 05 Dec 2019 06:16:34 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ickR7-0005Xb-5c
 for linux-mediatek@lists.infradead.org; Thu, 05 Dec 2019 06:16:26 +0000
Received: by mail-io1-xd42.google.com with SMTP id k24so2405575ioc.4
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Dec 2019 22:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sagxzG2UOJgqtCWMTEvuG8BujWW/Ac96ALrG1/iNc1g=;
 b=OpbZtYc602v9GzttMW4clzIL5MO4H74stJoLKvSgJ9YuuzxyAVwKg2x2E5bGNMS8Ix
 VDGM0ySfeLoY9+ChJHUdC74eBzZEuLW95Lorx6yqi4GfEEPEMk7F9nkm/1HdMBuXIe8W
 5dmUXfLm7RO8hDMjSRzUREtQ0GULXDZwxm5Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sagxzG2UOJgqtCWMTEvuG8BujWW/Ac96ALrG1/iNc1g=;
 b=neWVunyIqF+Ce2KBvKAplnI0TX7JqDpamh84IRiCRgDncl9pes7hDNpoQO8OuVSePE
 JsBKiuT6IM8vt1yywRjch5OZGgks3S8K0uYg3K3Afyugpf2ebDf3f0bTA4IrDyvOKVps
 mGD5V0UwfwJGxCWHlFqBBU+9bHBd2RVnx5KQxJykhmCZyI88rrcVYPJro6Ba/Yiz2o8N
 Wh+WKWeN1kNIAOq3zzNr3KCPfK6jDHwsEoyymromymLRZ6+e3AkJmJ5qzP64t2LHnT2o
 nUCzbe/5y5ZFkLYLQivMJyxCizJ45Jd5rsTgknV9Vh04hPa0rp1OUmTwatgS/UIZE3AI
 0N2g==
X-Gm-Message-State: APjAAAVxtZKFdFxo7/dXh7CWiMs5LGgDzgnvc/LH1oarTIUDaW+eKGqt
 o/sMxNwvF3x/cRBEhBwkJl5xhe28l+xS8aUiDxy3WQ==
X-Google-Smtp-Source: APXvYqwd0SY25U4cq3pwuC4ufVW/oZZK/mthsjkNg5Pt9lukryHB6LaDPd57XgXny29wudUpug6IojBLFRTn9swdYmo=
X-Received: by 2002:a02:b18d:: with SMTP id t13mr158882jah.4.1575526583427;
 Wed, 04 Dec 2019 22:16:23 -0800 (PST)
MIME-Version: 1.0
References: <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 5 Dec 2019 14:15:57 +0800
Message-ID: <CAJMQK-iDnOWCYmxcREGschD=sDfU6yKpUu+koP3YDeO3MPCdhQ@mail.gmail.com>
Subject: Re: [v1,1/2] drm/mediatek: Fixup external display black screen issue
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_221625_233460_17C19A56 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 1:17 AM <yongqiang.niu@mediatek.com> wrote:
>
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> Problem:
> overlay hangup when external display hotplut test
>
> Fix:
> disable overlay when crtc disable
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 39 +++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>
> --
> 1.8.1.1.dirty
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 4fb346c..7eca02f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -369,6 +369,20 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>         mtk_disp_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
>         mtk_disp_mutex_enable(mtk_crtc->mutex);
>
> +       /* Initially configure all planes */
> +       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +               struct drm_plane *plane = &mtk_crtc->planes[i];
> +               struct mtk_plane_state *plane_state;
> +               struct mtk_ddp_comp *comp;
> +               unsigned int local_layer;
> +
> +               plane_state = to_mtk_plane_state(plane->state);
> +               comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> +               if (comp)
> +                       mtk_ddp_comp_layer_config(comp, local_layer,
> +                                                 plane_state, NULL);
> +       }
> +
>         for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>                 struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
>                 enum mtk_ddp_comp_id prev;
> @@ -385,20 +399,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>                 mtk_ddp_comp_start(comp);
>         }
>
> -       /* Initially configure all planes */
> -       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> -               struct drm_plane *plane = &mtk_crtc->planes[i];
> -               struct mtk_plane_state *plane_state;
> -               struct mtk_ddp_comp *comp;
> -               unsigned int local_layer;
> -
> -               plane_state = to_mtk_plane_state(plane->state);
> -               comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> -               if (comp)
> -                       mtk_ddp_comp_layer_config(comp, local_layer,
> -                                                 plane_state, NULL);
> -       }
> -
>         return 0;
>
>  err_mutex_unprepare:
> @@ -607,10 +607,21 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>         for (i = 0; i < mtk_crtc->layer_nr; i++) {
>                 struct drm_plane *plane = &mtk_crtc->planes[i];
>                 struct mtk_plane_state *plane_state;
> +               struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> +               unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
> +               unsigned int local_layer;
>
>                 plane_state = to_mtk_plane_state(plane->state);
>                 plane_state->pending.enable = false;
>                 plane_state->pending.config = true;
> +
> +               if (i >= comp_layer_nr) {
> +                       comp = mtk_crtc->ddp_comp[1];
> +                       local_layer = i - comp_layer_nr;
> +               } else
> +                       local_layer = i;
> +               mtk_ddp_comp_layer_config(comp, local_layer,
> +                                         plane_state, NULL);
This part should be moved to mtk_crtc_ddp_hw_fini(), or at least
called after drm_crtc_vblank_off(). Otherwise we would see
drm_wait_one_vblank warnings on 8173 when display turns off.

[   25.696182] Call trace:
[   25.698624]  drm_wait_one_vblank+0x1f0/0x1fc
[   25.702886]  drm_crtc_wait_one_vblank+0x20/0x2c
[   25.707415]  mtk_drm_crtc_atomic_disable+0xf0/0x308
[   25.712287]  drm_atomic_helper_commit_modeset_disables+0x1b8/0x3c0
[   25.718461]  mtk_atomic_complete+0x88/0x16c
[   25.722638]  mtk_atomic_commit+0xa8/0xb0
[   25.726553]  drm_atomic_commit+0x50/0x5c
[   25.730469]  drm_atomic_helper_set_config+0x98/0xa0
[   25.735341]  drm_mode_setcrtc+0x280/0x608
[   25.739344]  drm_ioctl_kernel+0xcc/0x10c
[   25.743261]  drm_ioctl+0x240/0x3c0
[   25.746658]  drm_compat_ioctl+0xd8/0xe8
[   25.750487]  __se_compat_sys_ioctl+0x100/0x26fc
[   25.755009]  __arm64_compat_sys_ioctl+0x20/0x2c
[   25.759534]  el0_svc_common+0xa4/0x154
[   25.763277]  el0_svc_compat_handler+0x2c/0x38
[   25.767628]  el0_svc_compat+0x8/0x18
[   25.771195] ---[ end trace f4619fdac8f1c0ff ]---

>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
