Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF02C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 04:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSVodW55Lz8Yo74rULgRg3K4BLTqjGnkiDPs9wS734I=; b=hIOSDaYtkyR1M2
	apy6G2OosONYhTjF2lbHlH92yNKdH+/bn1yzNoBol07JLDlWN4z8utj2rm/OdYeNJwonRIC45oZr9
	Z1mtddJmYClMoGes0cutT+afRT+NE95En6hy6Xl+J8hPS28KwJI66GWg4h+lEJ1MV3+4WvfuRO+CJ
	N2U38xL0xWz250xyfl9q3wovuE1M9b5Y5uBvisbGM0HBhdlXFIHk35CujW+4iZalkaF6NvqwgWjVD
	W1VBhBM1MVRD9eRZwckQTGHwVJS2yiW4MKc8302kVizVZYqk8zyqBlrFlDkIkUu2XtUme7yCeaz61
	TqK4hjtECQpbquJzLxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR55a-00FsQ9-VX; Mon, 07 Mar 2022 04:35:18 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR55Y-00FsP4-Dj
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 04:35:18 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso5648843pjc.0
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 20:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xw72VTJjU1TVPXynYf8jnF6SmvhBqkTzHJ15Pmkr7oc=;
 b=giHzfZkU2+QhgMbFo8goGNy16MEfE4kXD3lYrvgfYfInfSDChAakpFQrNnB4L4qmFB
 XiUl0PecGitYBYf3ZsFw7ra1GU9mVkN2ePF/oMANfuco2Xyby2V/smlXFl4lArtFixa6
 exCDKs9jnI5+rmuFxKJXZzNHxH3++A1ylbVtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xw72VTJjU1TVPXynYf8jnF6SmvhBqkTzHJ15Pmkr7oc=;
 b=NhL751JLYO98jTPs9ZJtphISJqwuV9KdhiMhbay7UKEH7CupFQ3APDvjmRYk9KpqKC
 I+p2MLACf0jt8GBIqZFLRpECu8+HNoUk2YdH3Xf25uXI3bDWIe/wWUar6vCkYAMQErJL
 xGkVe+nDBDc/L972H4IoqNvRonF4yV6WVmviyJAXorlg3bcMC1wYhOKkbOLiXaJxrRrW
 oyq+0lBJbkjwQd0r8fhAuem7inj0kmb7dJ+KWzcIJB7iAi3d8VkM1nLmI+wlXKADSPkG
 oAPOJdrXOMhR6PVKuz9fku7hpDsBeluUGRyV3NUFgcd0mdFkUC74c7MdLULB8uGtIQni
 uMyw==
X-Gm-Message-State: AOAM532617HXqyUnDmexUNIhgdmiIrR+cFxpEJAFnoVmISLGoQyp3Gqr
 lkuIZ0gF8+cGzrCyp8QPSeTFEmpws+2D9A==
X-Google-Smtp-Source: ABdhPJxzQaICbGiEVguS7McTdtDmoZ8obtHXS0czSr7bdGpphL4y7X9IGcA5rDjmVjuU7YN0GeEgrQ==
X-Received: by 2002:a17:902:f54c:b0:151:4cff:3f28 with SMTP id
 h12-20020a170902f54c00b001514cff3f28mr10060533plf.125.1646627715250; 
 Sun, 06 Mar 2022 20:35:15 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com.
 [209.85.210.174]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm11293466pjb.27.2022.03.06.20.35.14
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 20:35:14 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id p8so12679580pfh.8
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 20:35:14 -0800 (PST)
X-Received: by 2002:a05:6602:1605:b0:644:d491:1bec with SMTP id
 x5-20020a056602160500b00644d4911becmr8988537iow.63.1646627702687; Sun, 06 Mar
 2022 20:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20220307032859.3275-6-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 7 Mar 2022 12:34:24 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhWD=YX1k+8aWrwc9WhBaaoCg_pSaEKQVrsk6OGZxTjoA@mail.gmail.com>
Message-ID: <CAC=S1nhWD=YX1k+8aWrwc9WhBaaoCg_pSaEKQVrsk6OGZxTjoA@mail.gmail.com>
Subject: Re: [PATCH v16 5/8] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 moudy.ho@mediatek.com, roy-cw.yeh@mediatek.com, CK Hu <ck.hu@mediatek.com>, 
 Fabien Parent <fparent@baylibre.com>, Nancy Lin <nancy.lin@mediatek.com>,
 singo.chang@mediatek.com, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_203516_503900_A89F95FB 
X-CRM114-Status: GOOD (  22.41  )
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

On Mon, Mar 7, 2022 at 11:30 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> Add mtk-mutex support for mt8195 vdosys0.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-mutex.c | 103 ++++++++++++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index aaf8fc1abb43..1c7ffcdadcea 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,6 +17,9 @@
>  #define MT8183_MUTEX0_MOD0                     0x30
>  #define MT8183_MUTEX0_SOF0                     0x2c
>
> +#define MT8195_DISP_MUTEX0_MOD0                        0x30
> +#define MT8195_DISP_MUTEX0_SOF                 0x2c
> +
>  #define DISP_REG_MUTEX_EN(n)                   (0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)                      (0x24 + 0x20 * (n))
>  #define DISP_REG_MUTEX_RST(n)                  (0x28 + 0x20 * (n))
> @@ -96,6 +99,36 @@
>  #define MT8173_MUTEX_MOD_DISP_PWM1             24
>  #define MT8173_MUTEX_MOD_DISP_OD               25
>
> +#define MT8195_MUTEX_MOD_DISP_OVL0             0
> +#define MT8195_MUTEX_MOD_DISP_WDMA0            1
> +#define MT8195_MUTEX_MOD_DISP_RDMA0            2
> +#define MT8195_MUTEX_MOD_DISP_COLOR0           3
> +#define MT8195_MUTEX_MOD_DISP_CCORR0           4
> +#define MT8195_MUTEX_MOD_DISP_AAL0             5
> +#define MT8195_MUTEX_MOD_DISP_GAMMA0           6
> +#define MT8195_MUTEX_MOD_DISP_DITHER0          7
> +#define MT8195_MUTEX_MOD_DISP_DSI0             8
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0  9
> +#define MT8195_MUTEX_MOD_DISP_OVL1             10
> +#define MT8195_MUTEX_MOD_DISP_WDMA1            11
> +#define MT8195_MUTEX_MOD_DISP_RDMA1            12
> +#define MT8195_MUTEX_MOD_DISP_COLOR1           13
> +#define MT8195_MUTEX_MOD_DISP_CCORR1           14
> +#define MT8195_MUTEX_MOD_DISP_AAL1             15
> +#define MT8195_MUTEX_MOD_DISP_GAMMA1           16
> +#define MT8195_MUTEX_MOD_DISP_DITHER1          17
> +#define MT8195_MUTEX_MOD_DISP_DSI1             18
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1  19
> +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE                20
> +#define MT8195_MUTEX_MOD_DISP_DP_INTF0         21
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0   22
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1   23
> +#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2   24
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3   25
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4   26
> +#define MT8195_MUTEX_MOD_DISP_PWM0             27
> +#define MT8195_MUTEX_MOD_DISP_PWM1             28
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2             10
>  #define MT2712_MUTEX_MOD_DISP_OVL0             11
>  #define MT2712_MUTEX_MOD_DISP_OVL1             12
> @@ -132,9 +165,21 @@
>  #define MT8167_MUTEX_SOF_DPI1                  3
>  #define MT8183_MUTEX_SOF_DSI0                  1
>  #define MT8183_MUTEX_SOF_DPI0                  2
> +#define MT8195_MUTEX_SOF_DSI0                  1
> +#define MT8195_MUTEX_SOF_DSI1                  2
> +#define MT8195_MUTEX_SOF_DP_INTF0              3
> +#define MT8195_MUTEX_SOF_DP_INTF1              4
> +#define MT8195_MUTEX_SOF_DPI0                  6 /* for HDMI_TX */
> +#define MT8195_MUTEX_SOF_DPI1                  5 /* for digital video out */
>
>  #define MT8183_MUTEX_EOF_DSI0                  (MT8183_MUTEX_SOF_DSI0 << 6)
>  #define MT8183_MUTEX_EOF_DPI0                  (MT8183_MUTEX_SOF_DPI0 << 6)
> +#define MT8195_MUTEX_EOF_DSI0                  (MT8195_MUTEX_SOF_DSI0 << 7)
> +#define MT8195_MUTEX_EOF_DSI1                  (MT8195_MUTEX_SOF_DSI1 << 7)
> +#define MT8195_MUTEX_EOF_DP_INTF0              (MT8195_MUTEX_SOF_DP_INTF0 << 7)
> +#define MT8195_MUTEX_EOF_DP_INTF1              (MT8195_MUTEX_SOF_DP_INTF1 << 7)
> +#define MT8195_MUTEX_EOF_DPI0                  (MT8195_MUTEX_SOF_DPI0 << 7)
> +#define MT8195_MUTEX_EOF_DPI1                  (MT8195_MUTEX_SOF_DPI1 << 7)
>
>  struct mtk_mutex {
>         int id;
> @@ -149,6 +194,9 @@ enum mtk_mutex_sof_id {
>         MUTEX_SOF_DPI1,
>         MUTEX_SOF_DSI2,
>         MUTEX_SOF_DSI3,
> +       MUTEX_SOF_DP_INTF0,
> +       MUTEX_SOF_DP_INTF1,
> +       DDP_MUTEX_SOF_MAX,
>  };
>
>  struct mtk_mutex_data {
> @@ -270,7 +318,23 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>         [DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
>  };
>
> -static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +       [DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
> +       [DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
> +       [DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
> +       [DDP_COMPONENT_COLOR0] = MT8195_MUTEX_MOD_DISP_COLOR0,
> +       [DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
> +       [DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
> +       [DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
> +       [DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
> +       [DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
> +       [DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
> +       [DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
> +       [DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
> +       [DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
> +};
> +
> +static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>         [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>         [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>         [MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
> @@ -280,7 +344,7 @@ static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>         [MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
>  };
>
> -static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>         [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>         [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>         [MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
> @@ -288,7 +352,7 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  };
>
>  /* Add EOF setting so overlay hardware can receive frame done irq */
> -static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>         [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>         [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
>         [MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> @@ -300,6 +364,26 @@ static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>         [MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 | MT8186_MUTEX_EOF_DPI0,
>  };
>
> +/*
> + * To support refresh mode(video mode), DISP_REG_MUTEX_SOF should
> + * select the EOF source and configure the EOF plus timing from the
> + * module that provides the timing signal.
> + * So that MUTEX can not only send a STREAM_DONE event to GCE
> + * but also detect the error at end of frame(EAEOF) when EOF signal
> + * arrives.
> + */
> +static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> +       [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +       [MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI0,
> +       [MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 | MT8195_MUTEX_EOF_DSI1,
> +       [MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 | MT8195_MUTEX_EOF_DPI0,
> +       [MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 | MT8195_MUTEX_EOF_DPI1,
> +       [MUTEX_SOF_DP_INTF0] =
> +               MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
> +       [MUTEX_SOF_DP_INTF1] =
> +               MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>         .mutex_mod = mt2701_mutex_mod,
>         .mutex_sof = mt2712_mutex_sof,
> @@ -351,6 +435,13 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
>         .mutex_sof_reg = MT8183_MUTEX0_SOF0,
>  };
>
> +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
> +       .mutex_mod = mt8195_mutex_mod,
> +       .mutex_sof = mt8195_mutex_sof,
> +       .mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> +       .mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>         struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -423,6 +514,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>         case DDP_COMPONENT_DPI1:
>                 sof_id = MUTEX_SOF_DPI1;
>                 break;
> +       case DDP_COMPONENT_DP_INTF0:
> +               sof_id = MUTEX_SOF_DP_INTF0;
> +               break;
>         default:
>                 if (mtx->data->mutex_mod[id] < 32) {
>                         offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> @@ -462,6 +556,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>         case DDP_COMPONENT_DSI3:
>         case DDP_COMPONENT_DPI0:
>         case DDP_COMPONENT_DPI1:
> +       case DDP_COMPONENT_DP_INTF0:
>                 writel_relaxed(MUTEX_SOF_SINGLE_MODE,
>                                mtx->regs +
>                                DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
> @@ -587,6 +682,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>           .data = &mt8186_mutex_driver_data},
>         { .compatible = "mediatek,mt8192-disp-mutex",
>           .data = &mt8192_mutex_driver_data},
> +       { .compatible = "mediatek,mt8195-disp-mutex",
> +         .data = &mt8195_mutex_driver_data},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
