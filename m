Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D28C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:54:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E128208D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:54:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HwrrAxOP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NCxMoMNZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E128208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Wfq39EsDl/Hj9CqooxFM48GbAep0fL3TBwwp4E0E4A=; b=HwrrAxOPq/ENNdxhvRtPYxJzH
	xE2SXouJN5/X/DQ5zYfwY3B9p/6pj6HQvMDOv02IXBmoE14+/d/LVmKosqShL4TjEW01FVngvRGxN
	NMLlAxDEjUHUjuaMkO1zuDC7Iu5j/qQIW0LcrmLZS8LtZUI+6AYfsr+bBPzZCi10iS8H3/bvfy+NY
	o3gHUDoRBfMAZIp+7a1jZjeRZ/jOdxk0UEqAdL9f5W6XOY69NrNYJL3LOvvmaxZjYphJy/jyc9TPp
	iT9LgZsSC4GBXmlFlZATKv25S4Rljnis40vWRIX93peA5XX5ejBG6D5tzX4PPCoMvJLvB2CAaRMP4
	Mj1yVlm5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSHwl-0007Fm-QI; Tue, 13 Oct 2020 10:54:23 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSHwg-0007E5-S4
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 10:54:19 +0000
Received: by mail-vk1-xa41.google.com with SMTP id z10so4513341vkn.0
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ynUyUlf8ZBc/wosstkfDmHSkC80iEcSV9kvyuaRkng4=;
 b=NCxMoMNZHtR/f6uBXfzdJQk8jzrc8dbrfZvgIF6hyvcC214r0LB+m+NNlUMfQGJLdP
 /zg9yuYcYn5wAPieHv5PsxM9+sloG71VPrC41niSEVM377SaFTB3shYj8zCNTNyIbua6
 iOWtDADZ+xIDrzoOMJULESyfqCSmB0DeWUMpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ynUyUlf8ZBc/wosstkfDmHSkC80iEcSV9kvyuaRkng4=;
 b=tNimhSIYMxM0u8PgVSyEXKBKiACu3TMJPVmyeWZAhl+rzvX/XhdaBDh9mQrfQCECYh
 n89H+uuQ6xTHCpWS6dNOKQici6tbMUHeSUb02nQIl5jrkT3medflCZ5xx1pDSShTwYVz
 HQUyTNgjTBSTJysIFa4StYEZmWmc5shjyDWiqi2ZSIFQ4tSo+FG/dYe7ysxXrQFNTeym
 GDgzT/14a/fd095qF0M56ewexSE4AG9UfkH9QFKapBN6RXSN8TaWNTtayRT7meSlzCOr
 7Bhz9eQrJDOmAKuvs8NPkVZieXxmkEC2Sxi1FO3utyFuG+JhDIbxUHuAB7G/GkcCIteP
 RonQ==
X-Gm-Message-State: AOAM533VQslY6KU4UZG1gwZwWXd0Ld0x6hqZWV02oeQF/CliAGJrOxNZ
 CjLy2JbvYgyLeYy3QkeINzSo+NfzszASpJs3aRS7iA==
X-Google-Smtp-Source: ABdhPJysPQ5eomCeyfTMzrgpCupOQSNSpjtTrgtpcQZw7r3iRalZSOO25Xe+CvFq/MXGQdp/beZjzKxff66coldxr7U=
X-Received: by 2002:a1f:2450:: with SMTP id k77mr15393251vkk.13.1602586457062; 
 Tue, 13 Oct 2020 03:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201013100625.13056-1-jitao.shi@mediatek.com>
 <20201013100625.13056-2-jitao.shi@mediatek.com>
In-Reply-To: <20201013100625.13056-2-jitao.shi@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 13 Oct 2020 18:54:05 +0800
Message-ID: <CANMq1KBvG54ZW5gCzp4c_cpQjP6pZ9svngvvRUpWJn7FuMHt3Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/mediatek: dsi: fix scrolling of panel with
 small hfp or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_065418_924412_932402D2 
X-CRM114-Status: GOOD (  21.45  )
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
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 cawa cheng <cawa.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 6:06 PM Jitao Shi <jitao.shi@mediatek.com> wrote:
>
> Replace horizontal_backporch_byte with vm->hback_porch * bpp to aovid
> flowing judgement negative number.
>
> if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
>         data_phy_cycles * dsi->lanes + delta)
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 65 +++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 80b7a082e874..ddddf69ebeaf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -445,6 +445,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>         u32 horizontal_backporch_byte;
>         u32 horizontal_frontporch_byte;
>         u32 dsi_tmp_buf_bpp, data_phy_cycles;
> +       u32 delta;
>         struct mtk_phy_timing *timing = &dsi->phy_timing;
>
>         struct videomode *vm = &dsi->vm;
> @@ -466,50 +467,34 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>         horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
>
>         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> -               horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
> +               horizontal_backporch_byte =
> +                       (vm->hback_porch * dsi_tmp_buf_bpp - 10);

These parentheses are not required, but it might be a little clearer to write:
(vm->hback_porch * dsi_tmp_buf_bpp) - 10;

>         else
> -               horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
> -                                           dsi_tmp_buf_bpp;
> +               horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
> +                       dsi_tmp_buf_bpp - 10);

ditto:
((vm->hback_porch + vm->hsync_len) * dsi_tmp_buf_bpp) - 10;

But then, _maybe_ it's clearer to drop this hunk and just add this
below the if/else:

horizontal_backporch_byte -= 10;

>
>         data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> -                         timing->da_hs_zero + timing->da_hs_exit;
> -
> -       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> -               if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
> -                   data_phy_cycles * dsi->lanes + 18) {
> -                       horizontal_frontporch_byte =
> -                               vm->hfront_porch * dsi_tmp_buf_bpp -
> -                               (data_phy_cycles * dsi->lanes + 18) *
> -                               vm->hfront_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -
> -                       horizontal_backporch_byte =
> -                               horizontal_backporch_byte -
> -                               (data_phy_cycles * dsi->lanes + 18) *
> -                               vm->hback_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -               } else {
> -                       DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> -                       horizontal_frontporch_byte = vm->hfront_porch *
> -                                                    dsi_tmp_buf_bpp;
> -               }
> +                         timing->da_hs_zero + timing->da_hs_exit + 3;

(for reference, apart from this `+ 3`, there is no functional change
in this hunk: this just moves delta outside of the if/else block,
which is a good idea for readability)

> +
> +       delta = (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) ? 18 : 12;
> +
> +       if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
> +           data_phy_cycles * dsi->lanes + delta) {
> +               horizontal_frontporch_byte =
> +                       vm->hfront_porch * dsi_tmp_buf_bpp -
> +                       (data_phy_cycles * dsi->lanes + delta) *
> +                       vm->hfront_porch /
> +                       (vm->hfront_porch + vm->hback_porch);
> +
> +               horizontal_backporch_byte =
> +                       horizontal_backporch_byte -
> +                       (data_phy_cycles * dsi->lanes + delta) *
> +                       vm->hback_porch /
> +                       (vm->hfront_porch + vm->hback_porch);
>         } else {
> -               if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
> -                   data_phy_cycles * dsi->lanes + 12) {
> -                       horizontal_frontporch_byte =
> -                               vm->hfront_porch * dsi_tmp_buf_bpp -
> -                               (data_phy_cycles * dsi->lanes + 12) *
> -                               vm->hfront_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -                       horizontal_backporch_byte = horizontal_backporch_byte -
> -                               (data_phy_cycles * dsi->lanes + 12) *
> -                               vm->hback_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -               } else {
> -                       DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> -                       horizontal_frontporch_byte = vm->hfront_porch *
> -                                                    dsi_tmp_buf_bpp;
> -               }
> +               DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
> +               horizontal_frontporch_byte = vm->hfront_porch *
> +                                            dsi_tmp_buf_bpp;
>         }
>
>         writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> --
> 2.12.5
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
