Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A69C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 11:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40AAC60E75
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 11:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40AAC60E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEcI/qZkOsrvpU7gUgwcXJisfviERO4y8gPow8bRCEY=; b=URbZxlBF9I1cCB
	iSzyp60st/zwg+AA/Kiuw/Jf9ZOSmaRgU7ZDO+C4T/cGTuoFfjDEBP3TSXvNTY/CR67dTFv8sA3se
	J8fLrzMeTDLL6MFhRtqTNH+edE1craNeMKgGfNxi1V+Ks7jFlCtju7d4lwvf0CpyYUqtZqg0C+X/L
	H53TTLVcYoWSi1r2qqCdwWD2cu6MqazD0Tl3ZsHFdHvX4fikrx1MNErCUQopVyMFeE661GPso2vnk
	qICX+YLMhT3OMI6tn7twRUtmfltGJ78mQgNAW4MWZCaevgBOczeb27mESNA2ef5uIBbuGtH7j7j4Q
	xPjBpnNghhSl71BvafaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6t0U-004RUo-8v; Fri, 23 Jul 2021 11:06:18 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6t0G-004RR0-4V; Fri, 23 Jul 2021 11:06:06 +0000
Received: by mail-oi1-x232.google.com with SMTP id u25so1415911oiv.5;
 Fri, 23 Jul 2021 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h3PVeHrBDfh+vFrvtg0HNvyd1nJwSx2sg1QYPbwvgc8=;
 b=r3xtxpPy/Wlh5EPI9uHsojLU4cR7W5jX1/bxV/RE4A3cw656GchXh4Z+ztQr48NvYw
 AAL0BjGdfuB/PlEXWDel4qbhyX2tzuEI6GIIUzFNuNB2avZPWiKnanbewjPaahAnrNG+
 fegLacht1UbyGOVvpKetZf5nezJo4YYjHcaShhuQ0V4TIr0KG8vv04mGEhUhOQFmjxzA
 houNicKD5zbedk1f8Jd91jqRkvRugGtzUKfHsmJNdh6mxDsvdHEfDR3loP0f+TiYEAd6
 zMY+WpfbfMYC29h5Mp0peZpFL5D93EwsWQBawIVG/s8bGvw5JA1dfUIB1mJj0LQtPyAn
 KJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3PVeHrBDfh+vFrvtg0HNvyd1nJwSx2sg1QYPbwvgc8=;
 b=puTKYOcCqOqj10KyVqTYR7KzNyA2yn+QQXKYJZibePjefKXeDDkdP1rT7X11u1JIeb
 voHQX9gfYvAi3hC56tFo9K/0hvb81aeAfK3qqqdD+yK0qq9YdsR2hrA6AOaP8VfbKSEP
 YK1mkt4P8Tud5xpNvqOnUph4rqgt0CFxCM4q0VDRXUP8o6/k+J8JpSUQvd3zAP/M1w3X
 zAlnTSwdD8h/pWHMNV3fMf2qvxWcq3fJtwBgSsN4QUfl5aKpshOjH60wUhY1jpYnSXuy
 5SGGTumAw/TFI3/ga04lyXiVzTdDT8w4rXHXxguAa8NH/CtBhQ7WrTL0ELAX20OJz3ta
 PG9Q==
X-Gm-Message-State: AOAM5328Mf916IIrrx0lFiz4hvXwaKls+YeUp2JO4yFByYE2bnVYR1v/
 P4B+7i0MfDrb0/LR001FLjgbv4DgFoCPye3DZtE=
X-Google-Smtp-Source: ABdhPJxyWrUCsIs5PyVujahPBnOFeUVNh+s71utnmwU97Qy+H7OuNz7AlcqsUFvGQerKg8vjMBcAoNL8Vpp+fWInSeU=
X-Received: by 2002:aca:3904:: with SMTP id g4mr8094234oia.129.1627038362981; 
 Fri, 23 Jul 2021 04:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-8-nancy.lin@mediatek.com>
In-Reply-To: <20210722094551.15255-8-nancy.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 13:05:50 +0200
Message-ID: <CAFqH_53UpoChfrhXf41YRMGGPzjC9N2g3yNQQxc-J=7uPE44Cw@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, 
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_040604_243504_32829B52 
X-CRM114-Status: GOOD (  20.89  )
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

Hi Nancy,

Thank you for your patch.

Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de jul.
2021 a les 11:45:
>
> Add mt8195 vdosys1 clock driver name and routing table to
> the driver data of mtk-mmsys.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 83 ++++++++++++++++++++++++--
>  drivers/soc/mediatek/mtk-mmsys.c       | 10 ++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  2 +
>  3 files changed, 90 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index 73e9e8286d50..104ba575f765 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -64,16 +64,16 @@
>  #define SOUT_TO_VPP_MERGE0_P1_SEL                              (1 << 0)
>
>  #define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL                      0xf40
> -#define SOUT_TO_HDR_VDO_FE0                                    (0 << 0)

This definition was introduced in this patch [1] that didn't land yet.
And you're removing it now. Could you sync with Jason and only
introduce the bits that are needed for your patches. Also all the
comments I made to the Jason's patch apply here.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-3-jason-jh.lin@mediatek.com/

> +#define SOUT_TO_MIXER_IN1_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL                      0xf44
> -#define SOUT_TO_HDR_VDO_FE1                                    (0 << 0)
> +#define SOUT_TO_MIXER_IN2_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL                      0xf48
> -#define SOUT_TO_HDR_GFX_FE0                                    (0 << 0)
> +#define SOUT_TO_MIXER_IN3_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL                      0xf4c
> -#define SOUT_TO_HDR_GFX_FE1                                    (0 << 0)
> +#define SOUT_TO_MIXER_IN4_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MIXER_IN1_SOUT_SEL                         0xf58
>  #define MIXER_IN1_SOUT_TO_DISP_MIXER                           (0 << 0)
> @@ -88,7 +88,7 @@
>  #define MIXER_IN4_SOUT_TO_DISP_MIXER                           (0 << 0)
>
>  #define MT8195_VDO1_MIXER_OUT_SOUT_SEL                         0xf34
> -#define MIXER_SOUT_TO_HDR_VDO_BE0                              (0 << 0)
> +#define MIXER_SOUT_TO_MERGE4_ASYNC_SEL                         (1 << 0)
>
>  #define MT8195_VDO1_MERGE4_SOUT_SEL                            0xf18
>  #define MERGE4_SOUT_TO_VDOSYS0                                 (0 << 0)
> @@ -185,6 +185,79 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>         }, {
>                 DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
>                 MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN1_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN2_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN3_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN4_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_OUT_SOUT_SEL, MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN1_SEL_IN, MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN2_SEL_IN, MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN3_SEL_IN, MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN4_SEL_IN, MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_SOUT_SEL_IN, MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE4_ASYNC_SEL_IN, MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +               MT8195_VDO1_DISP_DPI1_SEL_IN, DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +               MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DPI1_SEL
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +               MT8195_VDO1_DISP_DP_INTF0_SEL_IN,
> +               DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +               MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DP_INTF0_SEL
>         }
>  };
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 1fb241750897..9e31aad6c5c8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -59,6 +59,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>         .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> +       .clk_driver = "clk-mt8195-vdo1",
> +       .routes = mmsys_mt8195_routing_table,
> +       .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>  struct mtk_mmsys {
>         void __iomem *regs;
>         const struct mtk_mmsys_driver_data *data;
> @@ -168,6 +174,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>                 .compatible = "mediatek,mt8195-vdosys0",
>                 .data = &mt8195_vdosys0_driver_data,
>         },
> +       {
> +               .compatible = "mediatek,mt8195-vdosys1",

Why do you need a second compatible, isn't this the same IP block? I
mean, I understand that you have 2 mmsys blocks, but both are the same
IP block, right? or are they different?

Thanks,
  Enric

> +               .data = &mt8195_vdosys1_driver_data,
> +       },
>         { }
>  };
>
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 34cb605e5df9..338c71570aeb 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -49,6 +49,8 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_DSC1,
>         DDP_COMPONENT_DSC1_VIRTUAL0,
>         DDP_COMPONENT_DP_INTF0,
> +       DDP_COMPONENT_DP_INTF1,
> +       DDP_COMPONENT_PSEUDO_OVL,
>         DDP_COMPONENT_ID_MAX,
>  };
>
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
