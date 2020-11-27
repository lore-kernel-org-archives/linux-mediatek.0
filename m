Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0452C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 23:35:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528DB2223D
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 23:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OnV403qw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1UcnmWn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528DB2223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/I87C0cM4EDfps3WjT/cngVXzW6cq29eSHia6Y16hqI=; b=OnV403qw3ieerCsrNJUluTdBt
	Cwp6mrJIgReNb+hd2qwTc3iU5oAswUVnvcjeDxItlA+U/+/6IqKjdYxoYA9Ji1s5OTcjFc0tMES3J
	aknY8/v/nR/PHGyH1nrNIMbI+oEuyOWvLpTXERD9rHe5JSHXOByPmjRr2nYQ55j/jHfoyODep6r9H
	dHDNYa/wSgqymdGn/YCGy4w2kdVw5QkNpbxCUPocCYIdXDMbUO8AaKlAb7imRtTYfM/N9PLMI/2mn
	mhkdv1cowZLBpwlDGfozCPlkc+AzMTP470qAtmGZl2bCnaccbNq6d/wU2ecG9iE1clVCSBqcPqU1G
	Iq4iFLn/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kinGv-0005XE-Ob; Fri, 27 Nov 2020 23:35:25 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kinGs-0005W8-Q2; Fri, 27 Nov 2020 23:35:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id 3so4093669wmg.4;
 Fri, 27 Nov 2020 15:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4F/42hYjyqyL+aZY2Lepn5obAALGh+LegP2VS6nWf7s=;
 b=G1UcnmWnAQHFsBAZskAa4olwjSkYMi/D4LHXjWPn9C1QhmCdRTzoJfLpPuEaHQ4r+F
 11mNqiw/uzcKu19G+VyXyS9xqAu52XloAZy+fcx9MZCmV5f2Fmkvvqc5TWQnVQGjzXNt
 6q0sl2SBqvqUjZBE8xod9R9AeRfYV7/cThIoBt9bh0N7vrP6xDHJIX98FXYywmnPKHwa
 YmulnIsv0S9bRy1utyPSV1bri8Tdtn/irRYMw5ZePwk/GfzKYirg0zsrmfcIVqVNNc5U
 /D2Cz2cM9zULqQxJpbd6ZtSkIjs7Pn+CBspTC03nBwBLRfKQy/Y6052bq+r5JpCiuARi
 wjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4F/42hYjyqyL+aZY2Lepn5obAALGh+LegP2VS6nWf7s=;
 b=ftwxUkl5yRefNtZgXbbPoYBQndvq/IQXs81/mq4vW/RuZNLgMP+kPKpiUzwUwz8HLz
 seLw6rL3bKRhCOn74LkSTcQRo0nVjqFLYVGLnjSO6/EQTx6jJighXHKhu9xgaXAXFW49
 NKJs4ZlmhpgkwqdKg3x0bjNdMz1n8Ey7cSTamJJ7qBvdibTBA9GXfmPGBUiKA6yR461Q
 1U/ie+SLdE44Ja6famZdy42JYgsvWrIGLw+juH4Jfh/7HCZDI52UfGg4U4jUmegqMV0y
 u/DWPToS8fexs8LFQyYSspcqgAfAOqBM6VPBxqVDRWM7ORUsYjIdXdj0Zb7GkKtScVel
 NIzA==
X-Gm-Message-State: AOAM532K3Oj/+j2pZz+DCMpNJvS759lCm2g7KerqJnYD7L9GGez2euHE
 ir/1J54qFZ0u84tGBZGDcmacSb38mCF15g==
X-Google-Smtp-Source: ABdhPJwft7Sf+k6f33QQ7aIuDGIaAlTA/RUoe+AlXUi5qgEUy4DOTmyQnKKGhy+g6qHsh7ZeOJz9ow==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr11782565wmc.144.1606520121447; 
 Fri, 27 Nov 2020 15:35:21 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id w21sm15028929wmi.29.2020.11.27.15.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 15:35:19 -0800 (PST)
Subject: Re: [PATCH 1/4] soc / drm: mediatek: Move DDP component defines into
 mtk-mmsys.h
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-2-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5b6816ca-f3c9-3048-57ca-f6af128fbb0b@gmail.com>
Date: Sat, 28 Nov 2020 00:35:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201006193320.405529-2-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_183522_905201_02998FFE 
X-CRM114-Status: GOOD (  24.61  )
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 yongqiang.niu@mediatek.com, hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/10/2020 21:33, Enric Balletbo i Serra wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> MMSYS is the driver which controls the routing of these DDP components,
> so the definition of the mtk_ddp_comp_id enum should be placed in mtk-mmsys.h
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> This patch was previously part of another series, but has no
> dependencies and can be applied independently. As the latest version
> sent is from two months ago, I resent this patch because the next patches
> of this series depends on it to apply cleanly.
> 

Applied to v5.10-next/soc

Thanks

> [1] https://patchwork.kernel.org/patch/11706243
> 
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 34 +--------------------
>   drivers/soc/mediatek/mtk-mmsys.c            |  4 +--
>   include/linux/soc/mediatek/mtk-mmsys.h      | 33 ++++++++++++++++++++
>   3 files changed, 35 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index debe36395fe7..161201fe5179 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -7,6 +7,7 @@
>   #define MTK_DRM_DDP_COMP_H
>   
>   #include <linux/io.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>   
>   struct device;
>   struct device_node;
> @@ -35,39 +36,6 @@ enum mtk_ddp_comp_type {
>   	MTK_DDP_COMP_TYPE_MAX,
>   };
>   
> -enum mtk_ddp_comp_id {
> -	DDP_COMPONENT_AAL0,
> -	DDP_COMPONENT_AAL1,
> -	DDP_COMPONENT_BLS,
> -	DDP_COMPONENT_CCORR,
> -	DDP_COMPONENT_COLOR0,
> -	DDP_COMPONENT_COLOR1,
> -	DDP_COMPONENT_DITHER,
> -	DDP_COMPONENT_DPI0,
> -	DDP_COMPONENT_DPI1,
> -	DDP_COMPONENT_DSI0,
> -	DDP_COMPONENT_DSI1,
> -	DDP_COMPONENT_DSI2,
> -	DDP_COMPONENT_DSI3,
> -	DDP_COMPONENT_GAMMA,
> -	DDP_COMPONENT_OD0,
> -	DDP_COMPONENT_OD1,
> -	DDP_COMPONENT_OVL0,
> -	DDP_COMPONENT_OVL_2L0,
> -	DDP_COMPONENT_OVL_2L1,
> -	DDP_COMPONENT_OVL1,
> -	DDP_COMPONENT_PWM0,
> -	DDP_COMPONENT_PWM1,
> -	DDP_COMPONENT_PWM2,
> -	DDP_COMPONENT_RDMA0,
> -	DDP_COMPONENT_RDMA1,
> -	DDP_COMPONENT_RDMA2,
> -	DDP_COMPONENT_UFOE,
> -	DDP_COMPONENT_WDMA0,
> -	DDP_COMPONENT_WDMA1,
> -	DDP_COMPONENT_ID_MAX,
> -};
> -
>   struct mtk_ddp_comp;
>   struct cmdq_pkt;
>   struct mtk_ddp_comp_funcs {
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a55f25511173..36ad66bb221b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -5,13 +5,11 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/io.h>
>   #include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
>   
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
> -
>   #define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
>   #define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
>   #define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 7bab5d9a3d31..2228bf6133da 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -9,6 +9,39 @@
>   enum mtk_ddp_comp_id;
>   struct device;
>   
> +enum mtk_ddp_comp_id {
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_AAL1,
> +	DDP_COMPONENT_BLS,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_COLOR1,
> +	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DPI0,
> +	DDP_COMPONENT_DPI1,
> +	DDP_COMPONENT_DSI0,
> +	DDP_COMPONENT_DSI1,
> +	DDP_COMPONENT_DSI2,
> +	DDP_COMPONENT_DSI3,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_OD0,
> +	DDP_COMPONENT_OD1,
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_OVL_2L1,
> +	DDP_COMPONENT_OVL1,
> +	DDP_COMPONENT_PWM0,
> +	DDP_COMPONENT_PWM1,
> +	DDP_COMPONENT_PWM2,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_RDMA2,
> +	DDP_COMPONENT_UFOE,
> +	DDP_COMPONENT_WDMA0,
> +	DDP_COMPONENT_WDMA1,
> +	DDP_COMPONENT_ID_MAX,
> +};
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
