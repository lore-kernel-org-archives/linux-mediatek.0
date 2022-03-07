Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9784C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 04:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vr7aq/PYH2ElDPR/DSG9eeEsOYuce4mgLhFK364Myo=; b=uDsfcP6g2XjlwA
	dvhAT3O3k3UDFx9DXWXV+CzrB28MoDqMcId9rTs/cs3GXSJ8Cz2zseguv/QeHt6WLMFDmwjLgBbTx
	gTHLy2o3M9apn3EdTQy0rqRyOWpb3e9mMq2bxeMk5eDPIwqWmAClzutslGItZPOIGKhY7xKLBU0fU
	EMjOnnBH4huHDd0CaNNjJLQ4CbNu3rRkmOS3Pr4DCd5k/mpD1M2lIUF6Bp+DPupiwI676EcB8FEeQ
	VaCguTir8gY97qorLvhdcCcre2M8EcGlg/9kGW+0napOfZqvh7C5tsXXSKAsXLv9u3iGudERLFwhz
	+L0r6A0nLFCM2zzev5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR54j-00FsDz-Nb; Mon, 07 Mar 2022 04:34:25 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR54g-00FsDH-Mz
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 04:34:24 +0000
Received: by mail-il1-x130.google.com with SMTP id h2so377473ila.12
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 20:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bjv6LCJxAZSQQFHnal+Fzv3rUjp0Qsile4meIkT81UU=;
 b=FXa4P7CgQyiStvvjzNbUa9zlUSzG0kwdzgejIP7/H2nRyc8KWONAsh4s9FuoVfpubg
 kFK0musktYKhp/HQa1k+wsbRrO4G348ExOyZosojG+BPITxRcxWt+zhn1aWSfaUC60JI
 BCo0+oihApJeKMeQ6ugAz0YNiQ0Z97gkbLlTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bjv6LCJxAZSQQFHnal+Fzv3rUjp0Qsile4meIkT81UU=;
 b=WOGNYI8C6X/tH5UyPhzaZ3eHl5bQ0UFnGMcf94nWcMBjLWSLM0wFF2ZZSL0f9K+9Q4
 YjzhsgPoj+b0kjxb4PzjGIYiZpDpOY5TW7TQZc0suH/Z3uHkQZ0OV8LPy/tYIq7se5OT
 8eOr4xKzCLvNr/bKAHSjhxsC4RJQYvd1SXxZXuvD2NCS1Npw1Ai3Hy/SZoz0cQSJBA6i
 RuKpGVaxggM/ZfHFy5RaaC5VIgTmbwYzHZN6yN0xEe6i4Vm4Cioy/SeyDt0IuU3IW4B0
 BWvzH3f6QUIKqUiMKMRaRGabxSf3pCYSKjNfzjZtI00isl0zwHHcBD3+tA7VAnFkK82F
 Y/5g==
X-Gm-Message-State: AOAM531wlEvVSjU+j40HkAyGVFaAecJPb1dux78iWNK33Tb77qmS/1nM
 m8yStuGzfASAYH2NCQRJ+LcWknlKiDQgrg==
X-Google-Smtp-Source: ABdhPJx/zTf+xDUeVDnWqkLFBJ/1ccX+dv48Rcx0b5XEZW0HXJoQlcYGJY7Z1OsaYoU4DyVFg45wAw==
X-Received: by 2002:a92:4a10:0:b0:2c6:3c0c:840b with SMTP id
 m16-20020a924a10000000b002c63c0c840bmr4551972ilf.127.1646627660694; 
 Sun, 06 Mar 2022 20:34:20 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169]) by smtp.gmail.com with ESMTPSA id
 d7-20020a5d9647000000b00638d53cd21esm8690129ios.26.2022.03.06.20.34.20
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 20:34:20 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id b14so284809ilf.6
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 20:34:20 -0800 (PST)
X-Received: by 2002:a05:6e02:128b:b0:2c6:49a4:ad23 with SMTP id
 y11-20020a056e02128b00b002c649a4ad23mr1158525ilq.251.1646627648731; Sun, 06
 Mar 2022 20:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20220307032859.3275-5-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 7 Mar 2022 12:33:30 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngHthMe8oOQksf34OPvX071uT=AHnvjAoSs3-oReNynvA@mail.gmail.com>
Message-ID: <CAC=S1ngHthMe8oOQksf34OPvX071uT=AHnvjAoSs3-oReNynvA@mail.gmail.com>
Subject: Re: [PATCH v16 4/8] soc: mediatek: add mtk-mmsys support for mt8195
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
X-CRM114-CacheID: sfid-20220306_203422_768640_A952E635 
X-CRM114-Status: GOOD (  20.58  )
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
> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

We've verified this on MT8195 on our end, so
Tested-by: Fei Shao <fshao@chromium.org>


> ---
> Impelmentation patch of vdosys1 can be refered to [1]
>
> [1] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20220222100741.30138-6-nancy.lin@mediatek.com/
> ---
>
>  drivers/soc/mediatek/mt8195-mmsys.h    | 130 +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       |  11 +++
>  include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
>  3 files changed, 150 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
>
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..24a3afe23bc8
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN                                        0xf14
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0                    BIT(0)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0                    BIT(1)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1                     BIT(2)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1                    BIT(4)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1                    BIT(5)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0                     BIT(6)
> +
> +#define MT8195_VDO0_SEL_IN                                     0xf34
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_MASK                      GENMASK(1, 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT             (0 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1              (1 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0             (2 << 0)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK                   GENMASK(4, 4)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0           (0 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE              (1 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK                   GENMASK(5, 5)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1           (0 << 5)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE              (1 << 5)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK                  GENMASK(8, 8)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE             (0 << 8)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT         (1 << 8)
> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK                  GENMASK(9, 9)
> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT         (0 << 9)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_MASK                       GENMASK(13, 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT              (0 << 0)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE                  (1 << 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0              (2 << 12)
> +#define MT8195_SEL_IN_DSI0_FROM_MASK                           GENMASK(16, 16)
> +#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT                  (0 << 16)
> +#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0                   (1 << 16)
> +#define MT8195_SEL_IN_DSI1_FROM_MASK                           GENMASK(17, 17)
> +#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT                  (0 << 17)
> +#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE                      (1 << 17)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_MASK                     GENMASK(20, 20)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1                        (0 << 20)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE                        (1 << 20)
> +#define MT8195_SEL_IN_DSC_WRAP1_FROM_MASK                      GENMASK(21, 21)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN          (0 << 21)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1          (1 << 21)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_MASK                     GENMASK(22, 22)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0                        (0 << 22)
> +
> +#define MT8195_VDO0_SEL_OUT                                    0xf38
> +#define MT8195_SOUT_DISP_DITHER0_TO_MASK                       BIT(0)
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN               (0 << 0)
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSI0                       (1 << 0)
> +#define MT8195_SOUT_DISP_DITHER1_TO_MASK                       GENMASK(2, 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN               (0 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE                  (1 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT              (2 << 1)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK                      GENMASK(4, 4)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE                 (0 << 4)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0                  (1 << 4)
> +#define MT8195_SOUT_VPP_MERGE_TO_MASK                          GENMASK(10, 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSI1                          (0 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0                      (1 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0                 (2 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1                    (3 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN                  (4 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK             GENMASK(11, 11)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN                  (0 << 11)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK                      GENMASK(13, 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0                      (0 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0             (1 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE                 (2 << 12)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK                      GENMASK(17, 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1                      (0 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0                  (1 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0             (2 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE                 (3 << 16)
> +
> +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +               MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
> +               MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
> +       }, {
> +               DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> +               MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
> +               MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +               MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
> +               MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> +       }, {
> +               DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> +               MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
> +               MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +               MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
> +               MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
> +               MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
> +               MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +               MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
> +               MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
> +               MT8195_SOUT_DISP_DITHER0_TO_DSI0
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
> +               MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +               MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
> +               MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> +       }, {
> +               DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> +               MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +               MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
> +       }
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 4fc4c2c9ea20..dc5c51f0ccc8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -17,6 +17,7 @@
>  #include "mt8183-mmsys.h"
>  #include "mt8186-mmsys.h"
>  #include "mt8192-mmsys.h"
> +#include "mt8195-mmsys.h"
>  #include "mt8365-mmsys.h"
>
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> @@ -72,6 +73,12 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>         .num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +       .clk_driver = "clk-mt8195-vdo0",
> +       .routes = mmsys_mt8195_routing_table,
> +       .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>         .clk_driver = "clk-mt8365-mm",
>         .routes = mt8365_mmsys_routing_table,
> @@ -260,6 +267,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>                 .compatible = "mediatek,mt8192-mmsys",
>                 .data = &mt8192_mmsys_driver_data,
>         },
> +       {
> +               .compatible = "mediatek,mt8195-vdosys0",
> +               .data = &mt8195_vdosys0_driver_data,
> +       },
>         {
>                 .compatible = "mediatek,mt8365-mmsys",
>                 .data = &mt8365_mmsys_driver_data,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 4bba275e235a..64c77c4a6c56 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -17,13 +17,22 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_COLOR0,
>         DDP_COMPONENT_COLOR1,
>         DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_DP_INTF0,
>         DDP_COMPONENT_DPI0,
>         DDP_COMPONENT_DPI1,
> +       DDP_COMPONENT_DSC0,
> +       DDP_COMPONENT_DSC1,
>         DDP_COMPONENT_DSI0,
>         DDP_COMPONENT_DSI1,
>         DDP_COMPONENT_DSI2,
>         DDP_COMPONENT_DSI3,
>         DDP_COMPONENT_GAMMA,
> +       DDP_COMPONENT_MERGE0,
> +       DDP_COMPONENT_MERGE1,
> +       DDP_COMPONENT_MERGE2,
> +       DDP_COMPONENT_MERGE3,
> +       DDP_COMPONENT_MERGE4,
> +       DDP_COMPONENT_MERGE5,
>         DDP_COMPONENT_OD0,
>         DDP_COMPONENT_OD1,
>         DDP_COMPONENT_OVL0,
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
