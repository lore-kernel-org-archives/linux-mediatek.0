Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439B0C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 13:54:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B5861458
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 13:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B5861458
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fvf7EUi35F6JqAtPgvoCrFB+Lh5m4E8O93jCOtqUb90=; b=Ur0e+HYixmWMSdB/yASIXI2/8
	qrkkNmN3KXiKiUyrTQc90vEw0dZy7c632AQLY4+wnOy42TD9gJ2O2p2wvsl1ILM62bEoiXgrRw9/2
	t0K0LWLzeMr3k3RuKd+6KP3vy9z1hyS+0qNe/VVAz/YHs1lNo5Vrlz8uSt9CLVx3RxDYpCVgt3HAn
	azUGwGfVAqQMODV5Axkq5Q2oOgiZO5hqpeQMrrdKm5k9caEeWwOTCLMQGrDJTuQgXFccgdtiYOf94
	OJpznPBfhUsEgwyAmKfWWiDQ6ZhV5tld3rpRqCjP+a/9Hfxv++RFO2lqb4EWVA8QJIpjrTnjxpZgP
	JB3T+d2BQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZwFh-001cgb-Qs; Fri, 23 Apr 2021 13:53:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwFe-001cfr-6q
 for linux-mediatek@desiato.infradead.org; Fri, 23 Apr 2021 13:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=enxA0jDxQH8/90qRuPZ7QUhg+lPFtjYbIroTnbfeeGo=; b=kTh0iR/zwTtzowaVsFiC7G2VQi
 yErgYClMrJGY6nciPaYOU0WJlxf0cMP6RpT3uzIh3w4lZNEwM92o+qDmAG2Qll6sDZ6lZ4jvSVJqE
 xFO0q4JmWS5c5Ibp6SiDV0hB1Fo/iHQtTINmd9RZv/sp100fTKfM26Yw8dlsJH7q6R9vFUEmiC3N5
 An5UAeiHz1SYnoKpAc3x+jbiTwkqW1F3TbzJ99LzeTjva/VUQulMHLnJhiFDpbwagRVvmjBmc6Cvu
 rt+/iBeT5W+vzapTdGbtK6kFWwwQ6lywgV8GWwF64pvLpk+NntCrP+m3rK4Q39wXYI3rezCfs0aiE
 4kpuEOWA==;
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwFb-00ESCD-8D
 for linux-mediatek@lists.infradead.org; Fri, 23 Apr 2021 13:53:44 +0000
Received: by mail-il1-x134.google.com with SMTP id v13so988287ilj.8
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Apr 2021 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enxA0jDxQH8/90qRuPZ7QUhg+lPFtjYbIroTnbfeeGo=;
 b=HkKewWUBtZjysoTAN+6Napt2wK6vPpLfXArsR5jUF8bzLiOFZh5DHyYlQurNDqFCbg
 u9VdeqfbQoUhfKoZTsX9T0nXEybXc3mSuvKFfvsauiLZ8CULjE9pNibAvZAj5NrmlISi
 XA+qD0bBQqAtclwX8gCV+/RPZFVK1rpb099YEIutnqSfBUOe2WwOFW97MoHURyrShGMe
 An6gTkGr2o6fFCsLcarHTQF1jxVCQCpLXJSxx69SqflELDov2G3O7APVfjRGDr7u8/D0
 OO9l4OQ9mpA1HpRAiw2xXnkFZLf4PmelUEIZlZajQ09Y9SXbuvNLH+ENDaj3HHLbmehK
 2Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enxA0jDxQH8/90qRuPZ7QUhg+lPFtjYbIroTnbfeeGo=;
 b=moKOFd0GP7dKOfivGZcmQJ3zp9OBDHGPgDyWrMfh7w4qCgIypYU+U5I/v5nPfzfuB2
 SG6pXLI0gBbFX/HLZ1Zm9fNJL67JheX9iptgC8tq8M53ZcYz0o8JYsHQZcBIKOp/2oGO
 io9bb0ADejZpdeFMLKiCKMw6ao9cMvxaF6apqiqyGIDppmxARQt5Kx9oUN5Nh+q3E30H
 F/tIQ7cIk+S5vBWIHAAOACY8Y84oMjOjHbQrVJ6zhiLUN/6I6AbvzlYm/30vPW3kKy1z
 G9jys7//oGb0ES6exawayIzqWEIR4JbBdIO3ocufTupV/5DpGJG7Rn3t45JujNVZv9/R
 s/dA==
X-Gm-Message-State: AOAM533Zd4nclDXIW+sKc504Y2z6WXult6hIQSX139Lw+Zjzon1VYoo7
 btf4eXloCSfkmhIaADHI7b0KnPOMFOj3+L4Klec0OQ==
X-Google-Smtp-Source: ABdhPJyRuOcgN27WEgv2EuvmfXzx9OGUw3RQE4cZsvSCn4IKNCKY5uXhpcMAGC9Jn9ndKqUvOZFtXJwVRcRQywlErEw=
X-Received: by 2002:a05:6e02:1d06:: with SMTP id
 i6mr3030247ila.165.1619186018640; 
 Fri, 23 Apr 2021 06:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210409045314.3420733-1-hsinyi@chromium.org>
In-Reply-To: <20210409045314.3420733-1-hsinyi@chromium.org>
From: Sean Paul <sean@poorly.run>
Date: Fri, 23 Apr 2021 09:53:02 -0400
Message-ID: <CAMavQKJUpYP8jo2JDGMYNBGtbPSSO7z9BAComm5JQoty=HPtJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: set panel orientation before
 drm_dev_register().
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_065343_367299_E5615AF5 
X-CRM114-Status: GOOD (  22.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 9, 2021 at 12:53 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> drm_dev_register() sets connector->registration_state to
> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> drm_connector_set_panel_orientation() is first called after
> drm_dev_register(), it will fail several checks and results in following
> warning. So set panel orientation in dsi before drm_dev_register() is
> called.
>
> [    4.480976] ------------[ cut here ]------------
> [    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
> <snip>
> [    4.609772] Call trace:
> [    4.612208]  __drm_mode_object_add+0xb4/0xbc
> [    4.616466]  drm_mode_object_add+0x20/0x2c
> [    4.620552]  drm_property_create+0xdc/0x174
> [    4.624723]  drm_property_create_enum+0x34/0x98
> [    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
> [    4.634716]  boe_panel_get_modes+0x88/0xd8
> [    4.638802]  drm_panel_get_modes+0x2c/0x48
> [    4.642887]  panel_bridge_get_modes+0x1c/0x28
> [    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.658266]  drm_mode_getconnector+0x1b4/0x45c
> [    4.662699]  drm_ioctl_kernel+0xac/0x128
> [    4.666611]  drm_ioctl+0x268/0x410
> [    4.670002]  drm_compat_ioctl+0xdc/0xf0
> [    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.678436]  el0_svc_common+0xf4/0x1c0
> [    4.682174]  do_el0_svc_compat+0x28/0x3c
> [    4.686088]  el0_svc_compat+0x10/0x1c
> [    4.689738]  el0_sync_compat_handler+0xa8/0xcc
> [    4.694171]  el0_sync_compat+0x178/0x180
> [    4.698082] ---[ end trace b4f2db9d9c88610b ]---
> [    4.702721] ------------[ cut here ]------------
> [    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
> <snip>
> [    4.833830] Call trace:
> [    4.836266]  drm_object_attach_property+0x48/0xb8
> [    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
> [    4.846432]  boe_panel_get_modes+0x88/0xd8
> [    4.850516]  drm_panel_get_modes+0x2c/0x48
> [    4.854600]  panel_bridge_get_modes+0x1c/0x28
> [    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.869978]  drm_mode_getconnector+0x1b4/0x45c
> [    4.874410]  drm_ioctl_kernel+0xac/0x128
> [    4.878320]  drm_ioctl+0x268/0x410
> [    4.881711]  drm_compat_ioctl+0xdc/0xf0
> [    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.890142]  el0_svc_common+0xf4/0x1c0
> [    4.893879]  do_el0_svc_compat+0x28/0x3c
> [    4.897791]  el0_svc_compat+0x10/0x1c
> [    4.901441]  el0_sync_compat_handler+0xa8/0xcc
> [    4.905873]  el0_sync_compat+0x178/0x180
> [    4.909783] ---[ end trace b4f2db9d9c88610c ]---
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index ae403c67cbd9..45a702ee09f3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -205,6 +205,7 @@ struct mtk_dsi {
>         u32 irq_data;
>         wait_queue_head_t irq_wait_queue;
>         const struct mtk_dsi_driver_data *driver_data;
> +       enum drm_panel_orientation orientation;
>  };
>
>  static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
> @@ -966,6 +967,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>         }
>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
> +       drm_connector_set_panel_orientation(dsi->connector, dsi->orientation);
> +
>         return 0;
>
>  err_cleanup_encoder:
> @@ -1029,6 +1032,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>                         ret = PTR_ERR(dsi->next_bridge);
>                         goto err_unregister_host;
>                 }
> +
> +               ret = of_drm_get_panel_orientation(panel->dev->of_node, &dsi->orientation);
> +               if (ret) {
> +                       dev_err(dev, "failed to get panel orientation %d\n", ret);
> +                       return ret;
> +               }

I don't think this is the right place to mine orientation since it
duplicates the call from the panel driver.

Instead, how about splitting out
property_create_enum/attach_orientation_property from
set_panel_orientation such that you can attach the property (with
UNKNOWN value) in the connector init and then leave the panel to set
it properly in get_modes (I kind of disagree with populating this in
get_modes as well, but I don't think there's anywhere else to stick it
right now)?

AFAICT orientation is the only property which has the create/attach
calls in the set function which seems like a perfect recipe for this
type of failure.


Sean

>         }
>
>         dsi->driver_data = of_device_get_match_data(dev);
> --
> 2.31.1.295.g9ea45b61b8-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
