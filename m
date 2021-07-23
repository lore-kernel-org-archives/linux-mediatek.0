Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE9EC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 10:09:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98624608FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 10:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98624608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PofhHu+eN9UOizsS3MkKDoKbFn8raBKsaR253ANFAU=; b=Wj2/XPwX06J858
	Sa+UosrQVsQZwanb24yxxVC8LHOx7EgGmg6e6iNF3+qJRdqTwzjBIPlDEsfKi35QBwE1/eILFrDnX
	YUF6SZ3Jt9snCyKjZ/M5gdlPMgE2seb4seQiCXg8OOl/NfKl+fKAXqM2qsk7F85k5UEXdJ8h7/mA2
	/KT06tB4/OcOfwGkbe0AB4lrErb8Y2iaxEvRxRUuhuvnT/ZkQwP3lVMUf/QIj0aCERBOg0Sg+3VCW
	OG6d/7s3SHNSGBE/mlifMEJqkb/q22Jn2S0p886Ka0jtmAzZhKAXUK7XVpni/5xkxlV3Ra635pRKZ
	p2co7WI3y6bx+eiKnFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6s7M-004IaZ-4d; Fri, 23 Jul 2021 10:09:20 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6s7I-004IYe-G1; Fri, 23 Jul 2021 10:09:18 +0000
Received: by mail-oi1-x235.google.com with SMTP id x15so1252551oic.9;
 Fri, 23 Jul 2021 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lx0HOe+Z6BBwt59UG6eCKRmK9Viuj/9oSnno3+yWzY4=;
 b=ff6NTrdWVtN8/FBzuq8QsyNqKDQFhd1rMjVG24r5elm860ArdmynqAI0M0a1Je8JM+
 FLgHQ5kpkS7dOcnUVjEopqQ2+DxHMgDB9hVabOWm0jlpbgKhAZAauBu7PH3KGP5wRTAg
 37Pdr0BrdZlV5Jzv4cecNsLfGX1NPVA4YdMkBbzzNnIuF6KuENPPX86J+nYIWX3qUXC+
 m2Z1ycFw+Bt+q1Fa4+uL1wYFXXwwRgyoeUjH6yYryBhjqvylL70+SQEsETU3zmP0U8vL
 7l9sIXxsrPmINQu8DOwouz2kzK+APsKl8kGHkLVTKWgXVbvY0eyhQRcdzBB6kWS+Qn2P
 7ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lx0HOe+Z6BBwt59UG6eCKRmK9Viuj/9oSnno3+yWzY4=;
 b=YJtphA7g2JB8Q/A0c0ziOs/N6KjkFKaO5ABBDpoyCtyZgRB0M+C2CQSGIcJ9WqLa4u
 lodZ2qBeyadN5ySQ0VKsv+qx91PuT0Lq6Q6Sv3zz0SfNUx5zbIg/a0ZjX+h4IL8iDlSP
 nH6XeQlvCCEEGwwyLlCX6UZnI0dgktI+VRU7y1pbAe0rjyJ18kAKX/1O22OsnnWlTFbc
 6zwJwpmUupnTnCeW0apaWM1pagVed5T/9mNAnQUhNCFMACOgZs2VHPXWFkFsuJmnUE8V
 Xa4RTG0SE7IVDhdE5kYQg+SuX6rj1zV4HHu8F76Rh1Au/wsAhaEpIveVCIlvF1W4EcaD
 J0KA==
X-Gm-Message-State: AOAM531KyOA7ik5I5CmXtHXnqlB7B5tR0OWN9xu8Dyayb9zFq3wS1vkn
 rmj2MXzYCX4fcEUip3+poI1yrq9OSr7lG0TgC88=
X-Google-Smtp-Source: ABdhPJxodtuMOt27FfyYoSdUutPccafgkl+lqr0ZOHsrXbV9EZjkKo5AIP7cnR5BC1ZT58uOQDjDvLHjgo15w9pLH2U=
X-Received: by 2002:aca:3904:: with SMTP id g4mr7975490oia.129.1627034955268; 
 Fri, 23 Jul 2021 03:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210723090233.24007-1-jason-jh.lin@mediatek.com>
 <20210723090233.24007-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20210723090233.24007-3-jason-jh.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 12:09:03 +0200
Message-ID: <CAFqH_53BRm51qYCqms1VA62sMUs7d3Lu79YC9NeVuTB=juLEdw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 fshao@chromium.org, 
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, nancy.lin@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_030916_607537_202CB39B 
X-CRM114-Status: GOOD (  22.15  )
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

Hi Jason,

Thank you for your patch.

Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dv., 23
de jul. 2021 a les 11:02:
>
> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is base on [1]
>
> [1]add mt8195 SoC DRM binding
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 191 +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
>  include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
>  3 files changed, 211 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
>
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..73e9e8286d50
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,191 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN                                        0xf14
> +#define MOUT_DISP_OVL0_TO_DISP_RDMA0                           BIT(0)

This define and the others should use the MT8195_ prefix, as these are
MT8195 afaik


> +#define MOUT_DISP_OVL0_TO_DISP_WDMA0                           BIT(1)
> +#define MOUT_DISP_OVL0_TO_DISP_OVL1                            BIT(2)
> +#define MOUT_DISP_OVL1_TO_DISP_RDMA1                           BIT(4)
> +#define MOUT_DISP_OVL1_TO_DISP_WDMA1                           BIT(5)
> +#define MOUT_DISP_OVL1_TO_DISP_OVL0                            BIT(6)
> +
> +#define MT8195_VDO0_SEL_IN                                     0xf34
> +#define SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT                    (0 << 0)
> +#define SEL_IN_VPP_MERGE_FROM_DISP_DITHER1                     (1 << 0)
> +#define SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0                    (2 << 0)
> +#define SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0                  (0 << 4)
> +#define SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE                     (1 << 4)
> +#define SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1                  (0 << 5)
> +#define SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE                     (1 << 5)
> +#define SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE                    (0 << 8)
> +#define SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT                        (1 << 8)
> +#define SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT                        (0 << 9)
> +#define SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT                     (0 << 12)
> +#define SEL_IN_DP_INTF0_FROM_VPP_MERGE                         (1 << 12)
> +#define SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0                     (2 << 12)
> +#define SEL_IN_DSI0_FROM_DSC_WRAP0_OUT                         (0 << 16)
> +#define SEL_IN_DSI0_FROM_DISP_DITHER0                          (1 << 16)
> +#define SEL_IN_DSI1_FROM_DSC_WRAP1_OUT                         (0 << 17)
> +#define SEL_IN_DSI1_FROM_VPP_MERGE                             (1 << 17)
> +#define SEL_IN_DISP_WDMA1_FROM_DISP_OVL1                       (0 << 20)
> +#define SEL_IN_DISP_WDMA1_FROM_VPP_MERGE                       (1 << 20)
> +#define SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN                 (0 << 21)
> +#define SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1                 (1 << 21)
> +#define SEL_IN_DISP_WDMA0_FROM_DISP_OVL0                       (0 << 22)
> +#define SEL_IN_DISP_WDMA0_FROM_VPP_MERGE                       (1 << 22)
> +
> +#define MT8195_VDO0_SEL_OUT                                    0xf38
> +#define SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN                      (0 << 0)
> +#define SOUT_DISP_DITHER0_TO_DSI0                              (1 << 0)
> +#define SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN                      (0 << 1)
> +#define SOUT_DISP_DITHER1_TO_VPP_MERGE                         (1 << 1)
> +#define SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT                     (2 << 1)
> +#define SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE                                (0 << 4)
> +#define SOUT_VDO1_VIRTUAL0_TO_DP_INTF0                         (1 << 4)
> +#define SOUT_VPP_MERGE_TO_DSI1                                 (0 << 8)
> +#define SOUT_VPP_MERGE_TO_DP_INTF0                             (1 << 8)
> +#define SOUT_VPP_MERGE_TO_SINA_VIRTUAL0                                (2 << 8)
> +#define SOUT_VPP_MERGE_TO_DISP_WDMA1                           (3 << 8)
> +#define SOUT_VPP_MERGE_TO_DSC_WRAP0_IN                         (4 << 8)
> +#define SOUT_VPP_MERGE_TO_DSC_WRAP1_IN                         (0 << 11)
> +#define SOUT_VPP_MERGE_TO_DISP_WDMA0                           (1 << 11)
> +#define SOUT_DSC_WRAP0_OUT_TO_DSI0                             (0 << 12)
> +#define SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0                    (1 << 12)
> +#define SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE                                (2 << 12)
> +#define SOUT_DSC_WRAP1_OUT_TO_DSI1                             (0 << 16)
> +#define SOUT_DSC_WRAP1_OUT_TO_DP_INTF0                         (1 << 16)
> +#define SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0                    (2 << 16)
> +#define SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE                                (3 << 16)
> +
> +#define MT8195_VDO1_VPP3_ASYNC_SOUT                            0xf54
> +#define SOUT_TO_VPP_MERGE0_P0_SEL                              (0 << 0)
> +#define SOUT_TO_VPP_MERGE0_P1_SEL                              (1 << 0)
> +
> +#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL                      0xf40
> +#define SOUT_TO_HDR_VDO_FE0                                    (0 << 0)
> +
> +#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL                      0xf44
> +#define SOUT_TO_HDR_VDO_FE1                                    (0 << 0)
> +
> +#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL                      0xf48
> +#define SOUT_TO_HDR_GFX_FE0                                    (0 << 0)
> +
> +#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL                      0xf4c
> +#define SOUT_TO_HDR_GFX_FE1                                    (0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN1_SOUT_SEL                         0xf58
> +#define MIXER_IN1_SOUT_TO_DISP_MIXER                           (0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN2_SOUT_SEL                         0xf5c
> +#define MIXER_IN2_SOUT_TO_DISP_MIXER                           (0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN3_SOUT_SEL                         0xf60
> +#define MIXER_IN3_SOUT_TO_DISP_MIXER                           (0 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN4_SOUT_SEL                         0xf64
> +#define MIXER_IN4_SOUT_TO_DISP_MIXER                           (0 << 0)
> +
> +#define MT8195_VDO1_MIXER_OUT_SOUT_SEL                         0xf34
> +#define MIXER_SOUT_TO_HDR_VDO_BE0                              (0 << 0)
> +
> +#define MT8195_VDO1_MERGE4_SOUT_SEL                            0xf18

Please order the file by register value. i.e
MT8195_VDO1_MERGE4_SOUT_SEL (0xf18) should go before
MT8195_VDO1_MIXER_OUT_SOUT_SE (0xf34). Having the register in order
makes reviewers' life a bit easier and can help to avoid redefinitions
in future.

> +#define MERGE4_SOUT_TO_VDOSYS0                                 (0 << 0)
> +#define MERGE4_SOUT_TO_DPI0_SEL                                        (1 << 0)
> +#define MERGE4_SOUT_TO_DPI1_SEL                                        (2 << 0)
> +#define MERGE4_SOUT_TO_DP_INTF0_SEL                            (3 << 0)
> +
> +#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN                       0xf04
> +#define VPP_MERGE0_P0_SEL_IN_FROM_SVPP2                                (0 << 0)
> +#define VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0                    (1 << 0)
> +
> +#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN                       0xf08
> +#define VPP_MERGE0_P1_SEL_IN_FROM_SVPP3                                (0 << 0)
> +#define VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1                    (1 << 0)
> +
> +#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN                       0xf3c
> +#define VPP_MERGE1_P0_SEL_IN_FROM_VPP3_ASYNC_SOUT              (0 << 0)
> +#define VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2                    (1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN1_SEL_IN                           0xf24
> +#define MIXER_IN1_SEL_IN_FROM_HDR_VDO_FE0                      (0 << 0)
> +#define MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT                        (1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN2_SEL_IN                           0xf28
> +#define MIXER_IN2_SEL_IN_FROM_HDR_VDO_FE1                      (0 << 0)
> +#define MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT                        (1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN3_SEL_IN                           0xf2c
> +#define MIXER_IN3_SEL_IN_FROM_HDR_GFX_FE0                      (0 << 0)
> +#define MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT                        (1 << 0)
> +
> +#define MT8195_VDO1_MIXER_IN4_SEL_IN                           0xf30
> +#define MIXER_IN4_SEL_IN_FROM_HDR_GFX_FE1                      (0 << 0)
> +#define MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT                        (1 << 0)
> +
> +#define MT8195_VDO1_MIXER_SOUT_SEL_IN                          0xf68
> +#define MIXER_SOUT_SEL_IN_FROM_DISP_MIXER                      (0 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN1_SOUT                  (1 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN2_SOUT                  (2 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN3_SOUTR                 (3 << 0)
> +#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN4_SOUTR                 (4 << 0)
> +
> +#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN                                0xf50
> +#define MERGE4_ASYNC_SEL_IN_FROM_HDR_VDO_BE0                   (0 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT                        (1 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE0_ASYNC_SOUT             (2 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE1_ASYNC_SOUT             (3 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE2_ASYNC_SOUT             (4 << 0)
> +#define MERGE4_ASYNC_SEL_IN_FROM_MERGE3_ASYNC_SOUT             (5 << 0)
> +
> +#define MT8195_VDO1_DISP_DPI0_SEL_IN                           0xf0c
> +#define DISP_DPI0_SEL_IN_FROM_VPP_MERGE4_MOUT                  (0 << 0)
> +#define DISP_DPI0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT         (1 << 0)
> +#define DISP_DPI0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT           (2 << 0)
> +
> +#define MT8195_VDO1_DISP_DPI1_SEL_IN                           0xf10
> +#define DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT                  (0 << 0)
> +#define DISP_DPI1_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT         (1 << 0)
> +#define DISP_DPI1_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT           (2 << 0)
> +
> +#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN                       0xf14
> +#define DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT              (0 << 0)

I see some definitions that are not used. Is it a good practice to
only include the ones that are used and remove the others. Then
introduce the other when are really required.

Thanks,
  Enric

> +#define DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT     (1 << 0)
> +#define DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT       (2 << 0)
> +
> +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +               MT8195_VDO0_OVL_MOUT_EN, MOUT_DISP_OVL0_TO_DISP_RDMA0
> +       }, {
> +               DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> +               MT8195_VDO0_OVL_MOUT_EN, MOUT_DISP_OVL1_TO_DISP_RDMA1
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +               MT8195_VDO0_SEL_IN, SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +               MT8195_VDO0_SEL_IN, SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_IN, SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_IN, SEL_IN_DSI0_FROM_DISP_DITHER0
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +               MT8195_VDO0_SEL_OUT, SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_OUT, DDP_COMPONENT_DSI0
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +               MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_DSI0
> +       }, {
> +               DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +               MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> +       }
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..1fb241750897 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -13,6 +13,7 @@
>  #include "mtk-mmsys.h"
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
> +#include "mt8195-mmsys.h"
>
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>         .clk_driver = "clk-mt2701-mm",
> @@ -52,6 +53,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>         .num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +       .clk_driver = "clk-mt8195-vdo0",
> +       .routes = mmsys_mt8195_routing_table,
> +       .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>  struct mtk_mmsys {
>         void __iomem *regs;
>         const struct mtk_mmsys_driver_data *data;
> @@ -157,6 +164,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>                 .compatible = "mediatek,mt8183-mmsys",
>                 .data = &mt8183_mmsys_driver_data,
>         },
> +       {
> +               .compatible = "mediatek,mt8195-vdosys0",

I'm not against it but I think it would be more coherent following the
current compatible naming, why not 'mediatek,mt8195-mmsys' ?

Thanks,
  Enric

> +               .data = &mt8195_vdosys0_driver_data,
> +       },
>         { }
>  };
>
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 2228bf6133da..01bedfb08094 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -39,6 +39,15 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_UFOE,
>         DDP_COMPONENT_WDMA0,
>         DDP_COMPONENT_WDMA1,
> +       DDP_COMPONENT_MERGE0,
> +       DDP_COMPONENT_MERGE1,
> +       DDP_COMPONENT_MERGE2,
> +       DDP_COMPONENT_MERGE3,
> +       DDP_COMPONENT_MERGE4,
> +       DDP_COMPONENT_MERGE5,
> +       DDP_COMPONENT_DSC0,
> +       DDP_COMPONENT_DSC1,
> +       DDP_COMPONENT_DP_INTF0,
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
