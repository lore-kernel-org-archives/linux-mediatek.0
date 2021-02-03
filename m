Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB68C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 04:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F7164DE1
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 04:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F7164DE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uDlB/XHEiX6IcG9sMnYr100XQ2e4PhnqpJjxMGYh/bw=; b=dSxRXk4u4kAvjGmeyCE33/uds
	PhYquMcl6pH+KUDo0Gp/lBY83FZdRojBpc5d67HvQn4oqFPq+0BI5bFlOdzlAof516iyR+fnkkSYd
	V2FFhOEr3K1b6ubH7UKEZAShG7MjEeAAvjKYog1gDLLYRQl7gicgsS+XnMW7Qv4KjLNuPhPigdhAn
	lr5VulXc9aNtUXJgttYpHCMpCi1/JH4i2lS/fSVikck0AXrwPlq/IRLzkXgA/QZq1JvaEGfIsj8+0
	tp2i8o/23OrnzEYxHwgxjcrzZYZtE4zBpfnpqCX2fG2YyU84xobz28vRzJVbT/BgNpH8ZKY0ITub4
	hOntsqeeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l79Nr-0002zQ-Eg; Wed, 03 Feb 2021 04:03:15 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l79No-0002yk-Qu
 for linux-mediatek@lists.infradead.org; Wed, 03 Feb 2021 04:03:14 +0000
Received: by mail-ua1-x92d.google.com with SMTP id i3so7883865uai.3
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Feb 2021 20:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRmcBS+D8ie4DR9UuABqvgaIR3BnrLM49K5MwM/jb2k=;
 b=Cnkmlci4Z9x+W9PJgvly/S+T/Xk7q2JAM0NOGhqlpC7cCWxjELth6QexjoNksXnl6A
 8s+rwaY5mTIEe4ADvKzRHYkx7aSYUlCpD4R4kj0eZ4g0FW05K0f+7JiWwws/L8HU0LbI
 nMCwrt8I+1VHLGlwxeOCno6OZ/UhCde+lxvCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRmcBS+D8ie4DR9UuABqvgaIR3BnrLM49K5MwM/jb2k=;
 b=GU+vpNVFG3uMzCLhkS4ZxekamCBd0um1J/ClGEvavuCdK90fxVmVP2B1ScZQ5WO1hg
 pBC4jvawrv0ZMQh1qoLogXNimSqc8VAJ1iY5k5SLsAoEaCtv0OT2YY6GP9URcAwS3E5G
 EAGMlJKz7sdWCQIM41kJfcryw4QeB2I2dQgkPbD9L6/umMPZhye0SF2HmJ2/BgIGoAN5
 QrsUBQzHkx7u4Uo0HnXKdkBdzxSh8XraScZk2EP+HoLQqxVYI8pgYQae0dIDx2drK5XE
 CmmA0S69YQ1ph0ZRM3/KodzoVhzRKm4K1JnDeD0PX24K/Gb5iMyOtIdDHTaJGD5yS3id
 LFhw==
X-Gm-Message-State: AOAM530qJffRUhZA5Py2OzCUHmcIfFolWalNXpnzW4Jpu6paigt8goA5
 pUCKc+avDE4wnCYFWQZQlUCd5hrlLgs5cyIc1skSYw==
X-Google-Smtp-Source: ABdhPJzKgdO699d7NEidKkYUFGCitxzY1h0GLirMYgqHTXBy0DPlWTL+v/D9UP+CXksw/KwcJdfdGHR++aPPOFRquR8=
X-Received: by 2002:ab0:3043:: with SMTP id x3mr748227ual.88.1612324988471;
 Tue, 02 Feb 2021 20:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20210201034755.15793-1-jitao.shi@mediatek.com>
In-Reply-To: <20210201034755.15793-1-jitao.shi@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 3 Feb 2021 12:02:57 +0800
Message-ID: <CANMq1KA4nXBuy50pANw1MKbOm0DKNBgBTcHTmMoPFEq-GskKxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fine tune the data lane trail by project dts
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_230312_917951_90FBE917 
X-CRM114-Status: GOOD (  22.00  )
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
 cawa cheng <cawa.cheng@mediatek.com>, shuijing.li@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 1, 2021 at 11:48 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
>
> Some panels or bridges require customized hs_da_trail time.
> So add a property in devicetree for this panels and bridges.

Since this changes the device tree, you also need to upload a binding
document change.

>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 8c70ec39bfe1..6e7092fa2fee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -194,6 +194,7 @@ struct mtk_dsi {
>         struct clk *hs_clk;
>
>         u32 data_rate;
> +       u32 da_trail_delta;
>
>         unsigned long mode_flags;
>         enum mipi_dsi_pixel_format format;
> @@ -234,7 +235,7 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
>         timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
>         timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
>                              timing->da_hs_prepare;
> -       timing->da_hs_trail = timing->da_hs_prepare + 1;
> +       timing->da_hs_trail = timing->da_hs_prepare + 1 + dsi->da_trail_delta;
>
>         timing->ta_go = 4 * timing->lpx - 2;
>         timing->ta_sure = timing->lpx + 2;
> @@ -1094,6 +1095,13 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>                 goto err_unregister_host;
>         }
>
> +       ret = of_property_read_u32_index(dev->of_node, "da_trail_delta", 0,
> +                                        &dsi->da_trail_delta);
> +       if (ret) {
> +               dev_info(dev, "Can't get da_trail_delta, keep it as 0: %d\n", ret);
> +               dsi->da_trail_delta = 0;
> +       }
> +
>         comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DSI);
>         if (comp_id < 0) {
>                 dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
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
