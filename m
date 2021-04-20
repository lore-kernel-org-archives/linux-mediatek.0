Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C5FC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:06:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1853611F0
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1853611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9nl77uASGWf8OvZUZlS1Hi4IU7ep4S2E5mQPGj4zLr0=; b=nlOWQwHYEuScm8aLFnaj58dbt
	5GDbdPU9uv5NyiTVSmK142Hh6ZYMG4nMOcVurxVuwoYOgHIR3Mi1ND3r9rOCxYFHTiny4LVHv00D8
	0dNYFuX8oGOQ81Zen+At4kXhapEUeXPZbk42mC+kvdFlHQCxFz7XeHtKOuvLXxEg2bDvmJkJRDSxu
	88hMuXtuCYjzG+fy6fT/3J5SFj5v5al14dM6/iVZVZvoXC+i/zq/1500VoZICCGSIyPxnZ1ce+o1M
	0WaX8nQYwEjaNpIYiBzmBvYL2mxrPoh5X6J9NOAsPdd1+fcGAt2hffC+ZWx8NmHV28ETh6i57dQoi
	CMiJIfGug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYmKP-00Bfag-AJ; Tue, 20 Apr 2021 09:05:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmKC-00BfZz-Vc
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 09:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Sky0InoRGfz08ZIPfmMoicP8h0LTiiMAffpNGDgYJbs=; b=iA3Sdoj4z4QeA1sOf7wSQHKLNM
 /xx/hc927wbyCynNontIfFX3bmSJU8cVCLOMpSDDbph7YIvpUdenUFiRZC8Ke0mnw3u2oYV/lKVEq
 6gJcoZ9siEKMrL4M8WNh4HG0EiHn71pkCPHssAosoOWOKd9uyte9SZ7/zRcxJEPUgzxR8l9lMCXnm
 xfukZFlMKuJFqurWlejP9/S219M2N8zstWBgaPdKyckgqMvgoGTAr+GXRJV1n7E+CogHhSDbcFbry
 kKMu6eU02bkBwoC3zmwSU97qLanFEl+GDNpdOxMDqhXeKTczJJ0W3/Dj4TE3Ey2Kt0JhhERc0LJLA
 a3PcksAg==;
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmK7-00BxEA-25
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 09:05:39 +0000
Received: by mail-io1-xd2b.google.com with SMTP id v123so30882732ioe.10
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sky0InoRGfz08ZIPfmMoicP8h0LTiiMAffpNGDgYJbs=;
 b=nXMxTLh0sKp6GpxETText2EprCJ00h2r68bNjyo/IF5LUKD5vBUWvHwARRPAn+uyrJ
 kQjDZ0KCSUQEIki+oYck1Elb/FO48FaV2LtgbHDizELXrrlpNqUAtUVQ5tTUE9mHKyB5
 ZbQXnv+ZIdsOqZz8tjBc7JlTrPQwcxVciypAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sky0InoRGfz08ZIPfmMoicP8h0LTiiMAffpNGDgYJbs=;
 b=r1b9W7qPYre5r2TZmvBaWD97xGaMJg2iJCuJTYPRo+SCnqWYqDzWx90GZA/JmyjjKo
 qgsqvui5yx6cppTF5Qlvtgdf/JKxvXJMsz7C5v81w6ba4yVem/JuCgq1NsiSeVyuOTOA
 s99tmWEANtkgVaKnFEgJVCkI9g2ZPsS9Z4lh6YdED5LRUfI6FtZ1XSdAtqKsjeWhvjPi
 YCS3vuZatFo/8b5kYz6gL8frrBVSJ53b5Y9+zIUqSUpiEIZCyTnduN9rmX39ks1J9Z3O
 FYpOXztD5h4W2HaFhCWDBH1/SDS5MHPTJz9CEZNRBsQwKCOm4xFPDjSUSwZNu9/auMal
 bDoQ==
X-Gm-Message-State: AOAM530qxSxn+dDx6Du5+VxjfxhUYg7yJ6fXbwELux/YDltYynY5DfTG
 UBXSr1c0aUpqKU1Mn2pWYVLF7E+du3ZUl2jOVjL9Fg==
X-Google-Smtp-Source: ABdhPJzFCTPxONwGXoOnArB99NKE78wLC243d0eUdaQKA1eYD2nbVDr80hIVXEpRVLb15Vj/6o9+Igu1fSkXz87MjDc=
X-Received: by 2002:a5d:9682:: with SMTP id m2mr18657371ion.20.1618909533198; 
 Tue, 20 Apr 2021 02:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210409045314.3420733-1-hsinyi@chromium.org>
In-Reply-To: <20210409045314.3420733-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 20 Apr 2021 17:05:06 +0800
Message-ID: <CAJMQK-gFk8WV0W2TTP7=OTsBqgWmy_eKSd42Xa5dJzvUFDTAXQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: set panel orientation before
 drm_dev_register().
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Devicetree List <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_020535_144251_824AD1F0 
X-CRM114-Status: GOOD (  19.79  )
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

On Fri, Apr 9, 2021 at 12:53 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
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

ping on the thread, thanks.

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
