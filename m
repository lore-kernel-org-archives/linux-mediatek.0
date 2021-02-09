Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8B9C433E9
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 14:48:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F56E64E30
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 14:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F56E64E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FH4Fw0aDfGMvKqGTuLrogQf673zj8eBPyIS0cmZUWks=; b=O3fr0Col/9hiPL52Wm9nup6+K
	CI24IVe13sh/yjkTyWIz+XXWNkLsDF+OTi8RCLo443zVkTC6X/0Xd1m6cS4NSjhHajYF+oiLs7JiG
	6xQFvOIRqJfsEee34M2zETbrRskfG2kNzBo0Wlyt2M84UzMONBeDjAgqOYHW60d1I2MOTolyNjrGd
	shBLmXZLkQ9GreI4MNhfX3+4dQJp2X4ytly18EFNKTnO2a/0WFDi/4V0WYcaZP4aEoRqr8kD3VElQ
	Sh2jFBXVag/88WOS8PmafhoxOQrkZqTrbX9xi76DRIlRaanlPHRuZvaOGpCRcI1385RZ2tm++Cyon
	zaUPbST/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9UJr-0001kr-BO; Tue, 09 Feb 2021 14:48:47 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9UJo-0001ia-GJ; Tue, 09 Feb 2021 14:48:45 +0000
Received: by mail-oi1-x22d.google.com with SMTP id d20so19642232oiw.10;
 Tue, 09 Feb 2021 06:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aM7dO3tp79jO0fPJZv7YJSSQzHPVyz/cquYYOxatg1s=;
 b=TakrWn6MQhdn0N6JvhltplGzffQ4B9foAeAxgUhk1txhp3OWj+nbUPSzodZrHB1/mb
 jwFb2KCApPJ7tzMDAt/bTm4fSNM3CSuwYODCBzXs90rVSfPLyImvA8pjYIkFgy/nK502
 HYQenV5BZ/vvOPRgegiNFzshJMqIjxcB/Oacdt5zs/v5sV828tC9Mk+nim5Gwfye+Wgq
 HWixy+7a/KfXWs7NnmrqcLz+5//dgts7yuCANGlKBLOPqie9y8t/D0TwGn3ENoX1kHgT
 btcaqfEjoaSEJHLCshCcpq/nywWxm/Ewem3JFzPt9yjHKrUZow1w/BdTSTveMKu0JFif
 tpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aM7dO3tp79jO0fPJZv7YJSSQzHPVyz/cquYYOxatg1s=;
 b=LvRpJuOZCDsRrT/GE5dkaTf813SCziFG9n65v0msfFBKarAO4mesSrRWD9+BzQkGzN
 QgT3FnSkD4A9nK0FJSgvumSlQ1sp8rWh5OWJ/ay9TQcP9vrdrjUews6F8KVJB1u3/c/b
 T9jQre5a5y+qJfze04iy5u2Jwgm4oQGiraBv55k4/8DrwTSk9G6y4IDkrl6Jiw8hzkBP
 PxsiNoZp8yOLs6hlH64APA202ArASA4vM71rFL4Tib9I86dPzYHYw0BC5fsxkkmBuPWu
 Mix1/YVBvBZ6HZr7MHR2Q7ueEkGP99QOU/k6Mvl1vuZAN57pp0ekxr66K4mM99FQZkI0
 L0aw==
X-Gm-Message-State: AOAM531BCr6GWkygGvXpaC2gQgK2XVVMYdlzuzLlKZRkQ21dcJ0jTPnj
 4YvY34oStV+V2Yhll4lWqcn/b5BoTNou/U/BMgI=
X-Google-Smtp-Source: ABdhPJw/p815QsBu3fqLfKcPhGH0uCCJ1J2JQsOu2oSqCmhb8MyHUZopZ7pb49H23pc2XUeiLU321Biifhn1wyJ4zXY=
X-Received: by 2002:aca:b683:: with SMTP id g125mr2559278oif.47.1612882119731; 
 Tue, 09 Feb 2021 06:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-8-hsinyi@chromium.org>
In-Reply-To: <20210129092209.2584718-8-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 9 Feb 2021 15:48:28 +0100
Message-ID: <CAFqH_53pqgxV0UotaaXNTN=3gfDyHfAzZv6QH9JOdKyg2TEKvw@mail.gmail.com>
Subject: Re: [PATCH v13 7/8] soc: mediatek: add mtk mutex support for MT8183
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_094844_596518_8EE38B80 
X-CRM114-Status: GOOD (  23.95  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for your patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dv., 29 de gen.
2021 a les 10:23:
>
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> Add mtk mutex support for MT8183 SoC.
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

FWIW this patch is required to have the display working on the
Chromebook IdeaPad Duet, so

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Matthias, If I am not wrong, this patch is the only one that is not
applied for this series. I know that is too late for 5.12, but If
you're fine with it, could you pick this patch directly or do you
prefer a resend of this patch alone once you will start to accept
patches for the next release?

Thanks,
  Enric

> ---
>  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index f531b119da7a9..718a41beb6afb 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -14,6 +14,8 @@
>
>  #define MT2701_MUTEX0_MOD0                     0x2c
>  #define MT2701_MUTEX0_SOF0                     0x30
> +#define MT8183_MUTEX0_MOD0                     0x30
> +#define MT8183_MUTEX0_SOF0                     0x2c
>
>  #define DISP_REG_MUTEX_EN(n)                   (0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)                      (0x24 + 0x20 * (n))
> @@ -37,6 +39,18 @@
>  #define MT8167_MUTEX_MOD_DISP_DITHER           15
>  #define MT8167_MUTEX_MOD_DISP_UFOE             16
>
> +#define MT8183_MUTEX_MOD_DISP_RDMA0            0
> +#define MT8183_MUTEX_MOD_DISP_RDMA1            1
> +#define MT8183_MUTEX_MOD_DISP_OVL0             9
> +#define MT8183_MUTEX_MOD_DISP_OVL0_2L          10
> +#define MT8183_MUTEX_MOD_DISP_OVL1_2L          11
> +#define MT8183_MUTEX_MOD_DISP_WDMA0            12
> +#define MT8183_MUTEX_MOD_DISP_COLOR0           13
> +#define MT8183_MUTEX_MOD_DISP_CCORR0           14
> +#define MT8183_MUTEX_MOD_DISP_AAL0             15
> +#define MT8183_MUTEX_MOD_DISP_GAMMA0           16
> +#define MT8183_MUTEX_MOD_DISP_DITHER0          17
> +
>  #define MT8173_MUTEX_MOD_DISP_OVL0             11
>  #define MT8173_MUTEX_MOD_DISP_OVL1             12
>  #define MT8173_MUTEX_MOD_DISP_RDMA0            13
> @@ -87,6 +101,11 @@
>  #define MT2712_MUTEX_SOF_DSI3                  6
>  #define MT8167_MUTEX_SOF_DPI0                  2
>  #define MT8167_MUTEX_SOF_DPI1                  3
> +#define MT8183_MUTEX_SOF_DSI0                  1
> +#define MT8183_MUTEX_SOF_DPI0                  2
> +
> +#define MT8183_MUTEX_EOF_DSI0                  (MT8183_MUTEX_SOF_DSI0 << 6)
> +#define MT8183_MUTEX_EOF_DPI0                  (MT8183_MUTEX_SOF_DPI0 << 6)
>
>  struct mtk_mutex {
>         int id;
> @@ -181,6 +200,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>         [DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
>  };
>
> +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +       [DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> +       [DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> +       [DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> +       [DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> +       [DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> +       [DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> +       [DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> +       [DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> +       [DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> +       [DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> +       [DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>         [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>         [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -198,6 +231,13 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>         [MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
>  };
>
> +/* Add EOF setting so overlay hardware can receive frame done irq */
> +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +       [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +       [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> +       [MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>         .mutex_mod = mt2701_mutex_mod,
>         .mutex_sof = mt2712_mutex_sof,
> @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
>         .mutex_sof_reg = MT2701_MUTEX0_SOF0,
>  };
>
> +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
> +       .mutex_mod = mt8183_mutex_mod,
> +       .mutex_sof = mt8183_mutex_sof,
> +       .mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +       .mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +       .no_clk = true,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>         struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>           .data = &mt8167_mutex_driver_data},
>         { .compatible = "mediatek,mt8173-disp-mutex",
>           .data = &mt8173_mutex_driver_data},
> +       { .compatible = "mediatek,mt8183-disp-mutex",
> +         .data = &mt8183_mutex_driver_data},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> --
> 2.30.0.365.g02bc693789-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
