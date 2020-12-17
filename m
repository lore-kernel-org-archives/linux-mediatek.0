Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B125BC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 09:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228CC23437
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 09:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 228CC23437
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZieArfBN+nrhziYSNKXMXlXgSVq/VciAX8poyPiNOpE=; b=UV65X7cTsxdXX80KKqzrbzWH+
	zR6He56aoHH13ANG9jm6lB8LW/Ev+4AKxDNGTCZgQPNOiF8EQWoAWAzHBP2zG0pVEs2zv3JM3fQRE
	e/Rg0G7n8e+iMYdTxclSuKwD8ntIvy11Gpt4VxX3Fl4Kw8yveAWCZwneB2uLwYPCG/lCECHcYqkzg
	wCTLZ+sg9p2o6n1orGKNGZ6CMy0jHXYTfrT0H+YfErkibV1gkjjVsDYiOydyNg8zyASBPoDJdxxMH
	HAFG7zDMYLHxlsUMCAA9WXlVpKE/sTYvplF4gwBIQhocsgpfZFW40Pm6OCcfOteDtZozf2j8EU01K
	js8nRdiqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kppD0-0007gV-Jk; Thu, 17 Dec 2020 09:04:26 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kppCt-0007fP-Rv
 for linux-mediatek@lists.infradead.org; Thu, 17 Dec 2020 09:04:21 +0000
Received: by mail-io1-xd2b.google.com with SMTP id m23so12003240ioy.2
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Dec 2020 01:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wO5PdkW1h0hMqSfogzOe9zRiOHCL2Q7rrfsrpK94HwI=;
 b=FP7CYpsQuy86qnPV+sDFWgK6sj5ReWWecWwDT/HFoT4buDPtxUIIJ+AbFmoWJHCgS0
 EwTURlJrqD0uWvV1zZlmC9XYU1xL8CVCcckNfT4wNCLRhInh8sG1lhYOohkOIZDdwvwR
 TE1HbGWKgWoPxEdTf0UMwQ3wjj7NNUhsTw3CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wO5PdkW1h0hMqSfogzOe9zRiOHCL2Q7rrfsrpK94HwI=;
 b=eXFxyf4hBZ13PcKesc3zsFKLKAnEITmVpgBJYbSjVKB7t9UYDajOf9TTj9sNNlUvPA
 9adPBe/gs5cS7ItoMLQCWjI7ET941/h/Tm3SxQmhGYnS2tssK3ymOh7KYgULu1FClHOL
 52kizTpksVz9g9iElwMHY55NQ2cHfA86c4bp6lZSubBfNBVtk/3slMrecQ+Nzdq9usSP
 p2iaMn4uqJKgETmdwrg1i4TECRSxDvC1DcsfRR1fOwyq09MfSne1oIqHPg92sHaAG/GO
 D+AXT6t07mJ/zDZ2c+KOs9GTBjZStHlpjA5HYGYXBFPbo4UvppuYe//tNSv6ggp1RTIH
 r6OQ==
X-Gm-Message-State: AOAM533rN1HoMKravY3rXNThAlwes6tridAj8M5p9xybgDLmRBxHCMa1
 jCo7uy8ptud27QuuH4I4aezjah/EEqeTESORidD+MA==
X-Google-Smtp-Source: ABdhPJywqMThmvuS3pOWYs8OtKoGze+h43JEKfuJyX/5uakupcLxkSc1wlxjo5J3V0umBbt4crX06jSGenmYXkkzBMw=
X-Received: by 2002:a02:b011:: with SMTP id p17mr47557156jah.114.1608195857543; 
 Thu, 17 Dec 2020 01:04:17 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607591262-21736-7-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 17 Dec 2020 17:03:51 +0800
Message-ID: <CAJMQK-gVkYqZqnKOVNwoPzV9mmomWKfKAh_mwu4BkMHDAxTw6w@mail.gmail.com>
Subject: Re: [PATCH v8, 6/6] drm/mediatek: add support for mediatek SOC MT8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_040419_982281_0D3E4E54 
X-CRM114-Status: GOOD (  22.75  )
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
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 9:07 AM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> This patch add support for mediatek SOC MT8183
> 1. add ovl private data
> 2. add rdma private data
> 3. add mutes private data
> 4. add main and external path module for crtc create
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 18 ++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c   | 47 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 43 +++++++++++++++++++++++++++++
>  4 files changed, 114 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 28651bc..8cf9f3b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -430,11 +430,29 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
>         .fmt_rgb565_is_0 = true,
>  };
>
> +static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
> +       .addr = DISP_REG_OVL_ADDR_MT8173,
> +       .gmc_bits = 10,
> +       .layer_nr = 4,
> +       .fmt_rgb565_is_0 = true,
> +};
> +
> +static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
> +       .addr = DISP_REG_OVL_ADDR_MT8173,
> +       .gmc_bits = 10,
> +       .layer_nr = 2,
> +       .fmt_rgb565_is_0 = true,
> +};
> +
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>         { .compatible = "mediatek,mt2701-disp-ovl",
>           .data = &mt2701_ovl_driver_data},
>         { .compatible = "mediatek,mt8173-disp-ovl",
>           .data = &mt8173_ovl_driver_data},
> +       { .compatible = "mediatek,mt8183-disp-ovl",
> +         .data = &mt8183_ovl_driver_data},
> +       { .compatible = "mediatek,mt8183-disp-ovl-2l",
> +         .data = &mt8183_ovl_2l_driver_data},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 0508392..86e77c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -359,11 +359,17 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
>         .fifo_size = SZ_8K,
>  };
>
> +static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
> +       .fifo_size = 5 * SZ_1K,
> +};
> +
>  static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>         { .compatible = "mediatek,mt2701-disp-rdma",
>           .data = &mt2701_rdma_driver_data},
>         { .compatible = "mediatek,mt8173-disp-rdma",
>           .data = &mt8173_rdma_driver_data},
> +       { .compatible = "mediatek,mt8183-disp-rdma",
> +         .data = &mt8183_rdma_driver_data},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 014c1bb..60788c1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -15,6 +15,8 @@
>
>  #define MT2701_DISP_MUTEX0_MOD0                        0x2c
>  #define MT2701_DISP_MUTEX0_SOF0                        0x30
> +#define MT8183_DISP_MUTEX0_MOD0                        0x30
> +#define MT8183_DISP_MUTEX0_SOF0                        0x2c
>
>  #define DISP_REG_MUTEX_EN(n)                   (0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)                      (0x24 + 0x20 * (n))
> @@ -25,6 +27,18 @@
>
>  #define INT_MUTEX                              BIT(1)
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
> @@ -74,6 +88,10 @@
>  #define MUTEX_SOF_DSI2                 5
>  #define MUTEX_SOF_DSI3                 6
>
> +#define MT8183_MUTEX_SOF_DPI0                  2
> +#define MT8183_MUTEX_EOF_DSI0                  (MUTEX_SOF_DSI0 << 6)
> +#define MT8183_MUTEX_EOF_DPI0                  (MT8183_MUTEX_SOF_DPI0 << 6)
> +
>
>  struct mtk_disp_mutex {
>         int id;
> @@ -153,6 +171,20 @@ struct mtk_ddp {
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
>  static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
>         [DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>         [DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -163,6 +195,12 @@ struct mtk_ddp {
>         [DDP_MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
>  };
>
> +static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
> +       [DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +       [DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> +       [DDP_MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> +};
> +
>  static const struct mtk_ddp_data mt2701_ddp_driver_data = {
>         .mutex_mod = mt2701_mutex_mod,
>         .mutex_sof = mt2712_mutex_sof,
> @@ -184,6 +222,13 @@ struct mtk_ddp {
>         .mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>  };
>
> +static const struct mtk_ddp_data mt8183_ddp_driver_data = {
> +       .mutex_mod = mt8183_mutex_mod,
> +       .mutex_sof = mt8183_mutex_sof,
> +       .mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
> +       .mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,

Tested on an mt8183 device, and get:

[   10.014978] mediatek-ddp 14016000.mutex: Failed to get clock
[   10.026441] mediatek-ddp: probe of 14016000.mutex failed with error -2

Since mt8183 mutex doesn't need clock, I think this should add
.no_clk = true,


> +};
> +
>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
>  {
>         struct mtk_ddp *ddp = dev_get_drvdata(dev);
> @@ -402,6 +447,8 @@ static int mtk_ddp_remove(struct platform_device *pdev)
>           .data = &mt2712_ddp_driver_data},
>         { .compatible = "mediatek,mt8173-disp-mutex",
>           .data = &mt8173_ddp_driver_data},
> +       { .compatible = "mediatek,mt8183-disp-mutex",
> +         .data = &mt8183_ddp_driver_data},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, ddp_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 59c85c6..a7e9f88 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -131,6 +131,24 @@
>         DDP_COMPONENT_DPI0,
>  };
>
> +static const enum mtk_ddp_comp_id mt8183_mtk_ddp_main[] = {
> +       DDP_COMPONENT_OVL0,
> +       DDP_COMPONENT_OVL_2L0,
> +       DDP_COMPONENT_RDMA0,
> +       DDP_COMPONENT_COLOR0,
> +       DDP_COMPONENT_CCORR,
> +       DDP_COMPONENT_AAL0,
> +       DDP_COMPONENT_GAMMA,
> +       DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
> +       DDP_COMPONENT_OVL_2L1,
> +       DDP_COMPONENT_RDMA1,
> +       DDP_COMPONENT_DPI0,
> +};
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>         .main_path = mt2701_mtk_ddp_main,
>         .main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -163,6 +181,13 @@
>         .ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> +       .main_path = mt8183_mtk_ddp_main,
> +       .main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
> +       .ext_path = mt8183_mtk_ddp_ext,
> +       .ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
> +};
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>         struct mtk_drm_private *private = drm->dev_private;
> @@ -403,12 +428,20 @@ static void mtk_drm_unbind(struct device *dev)
>           .data = (void *)MTK_DISP_OVL },
>         { .compatible = "mediatek,mt8173-disp-ovl",
>           .data = (void *)MTK_DISP_OVL },
> +       { .compatible = "mediatek,mt8183-disp-ovl",
> +         .data = (void *)MTK_DISP_OVL },
> +       { .compatible = "mediatek,mt8183-disp-ovl-2l",
> +         .data = (void *)MTK_DISP_OVL_2L },
>         { .compatible = "mediatek,mt2701-disp-rdma",
>           .data = (void *)MTK_DISP_RDMA },
>         { .compatible = "mediatek,mt8173-disp-rdma",
>           .data = (void *)MTK_DISP_RDMA },
> +       { .compatible = "mediatek,mt8183-disp-rdma",
> +         .data = (void *)MTK_DISP_RDMA },
>         { .compatible = "mediatek,mt8173-disp-wdma",
>           .data = (void *)MTK_DISP_WDMA },
> +       { .compatible = "mediatek,mt8183-disp-ccorr",
> +         .data = (void *)MTK_DISP_CCORR },
>         { .compatible = "mediatek,mt2701-disp-color",
>           .data = (void *)MTK_DISP_COLOR },
>         { .compatible = "mediatek,mt8173-disp-color",
> @@ -417,22 +450,30 @@ static void mtk_drm_unbind(struct device *dev)
>           .data = (void *)MTK_DISP_AAL},
>         { .compatible = "mediatek,mt8173-disp-gamma",
>           .data = (void *)MTK_DISP_GAMMA, },
> +       { .compatible = "mediatek,mt8183-disp-dither",
> +         .data = (void *)MTK_DISP_DITHER },
>         { .compatible = "mediatek,mt8173-disp-ufoe",
>           .data = (void *)MTK_DISP_UFOE },
>         { .compatible = "mediatek,mt2701-dsi",
>           .data = (void *)MTK_DSI },
>         { .compatible = "mediatek,mt8173-dsi",
>           .data = (void *)MTK_DSI },
> +       { .compatible = "mediatek,mt8183-dsi",
> +         .data = (void *)MTK_DSI },
>         { .compatible = "mediatek,mt2701-dpi",
>           .data = (void *)MTK_DPI },
>         { .compatible = "mediatek,mt8173-dpi",
>           .data = (void *)MTK_DPI },
> +       { .compatible = "mediatek,mt8183-dpi",
> +         .data = (void *)MTK_DPI },
>         { .compatible = "mediatek,mt2701-disp-mutex",
>           .data = (void *)MTK_DISP_MUTEX },
>         { .compatible = "mediatek,mt2712-disp-mutex",
>           .data = (void *)MTK_DISP_MUTEX },
>         { .compatible = "mediatek,mt8173-disp-mutex",
>           .data = (void *)MTK_DISP_MUTEX },
> +       { .compatible = "mediatek,mt8183-disp-mutex",
> +         .data = (void *)MTK_DISP_MUTEX },
>         { .compatible = "mediatek,mt2701-disp-pwm",
>           .data = (void *)MTK_DISP_BLS },
>         { .compatible = "mediatek,mt8173-disp-pwm",
> @@ -451,6 +492,8 @@ static void mtk_drm_unbind(struct device *dev)
>           .data = &mt2712_mmsys_driver_data},
>         { .compatible = "mediatek,mt8173-mmsys",
>           .data = &mt8173_mmsys_driver_data},
> +       { .compatible = "mediatek,mt8183-mmsys",
> +         .data = &mt8183_mmsys_driver_data},
>         { }
>  };
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
