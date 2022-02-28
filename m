Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F90C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHqR7XMOaEBEoO6gGXBEG6HZzx/+E/7vblJ2v6iRVmI=; b=t6UgaoR3I6CFod
	BpgjWd/a1+lMQdRH6C8zElObLizdxxwrLOeRh2spG8VK9aJsceI7lsr0SNa7UXlSL4Fof2xXWBwWH
	VFjvdSHgBRD7/19Dy+MTbn9lLlM3T9rLrxtmU6Jgpo8WkLWCzbVLh5PMRfXdwSnHGh5E0r11SkwQ8
	g06XfMK3paTyPDPjPum4VvvssfEjKR+8XNYWZlqLkB5DI1VBZ6o4oa6YijUuRkVpN/AEPpJZ9+XHD
	EDb+LP5rZeQG18Zka2h2yL9luwiXPjeuCm3pHiizQvcSjYSHuDAhy+Hf8F4FfHxPxuDfDkTXxDA9Z
	wMN7yNNQUVpv+YyUxVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOefS-00C1sS-Tg; Mon, 28 Feb 2022 11:58:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe4n-00BoL7-G6; Mon, 28 Feb 2022 11:20:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 o62-20020a1ca541000000b00380e3cc26b7so5826952wme.0; 
 Mon, 28 Feb 2022 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NccQv4LgTdxbFFV06no50kiwLRDXEmMnkBFh0QCPhBk=;
 b=eJNhF7g9oc4xDjbR6Yf3EM+nErRCpUStHnVBRBwnjtvZ6xgdHPysfTRYYU+MZD1XRT
 nsKGXw2ByxKqC44mQl5r7boAD7j9hMUi0i44uoVPSGjDa7NdafIS0Ej1rwA3/NBVVgV2
 chA7ZPL/rGOzc7PJTjZ/SQrN2403vVHE2Hm3/qsajUIUW/yV3JcJSzXGrZhs458aC6ZK
 E0idJ9CC3XKoWjf/43G8zyBrHNP12gbW+lbR/1l/ltFSR7x/do84aiQpqKBF7pf3/jax
 5vSCBFWZveOn71YqVlKdN+Er/EsbW1A7oLhJrjo/FW7n5aXUlwrjR2nrOyhvv1G0gcIg
 w2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NccQv4LgTdxbFFV06no50kiwLRDXEmMnkBFh0QCPhBk=;
 b=pKhovl9JMzThBnu1R4kKriPmA3vxaAkrD+k7OwCqzMiditCyqWwS2qLATnI8LUBbMy
 PiEx7QMjhkwpruk6+yvUNGxVJpzVfUhz7Z3vpNGJUxMo3NQXiYoVyr/9srLu6/tLe4tz
 VHFf+2takagAVGqr7ig+ogyurUkuhH9odx2DDc1HKD86J1tWVcVLr2ZCxjLOFHqKOptW
 Ud/OpFtFg1lPo0nmAaStEj9xefLLI3kw24COYwSXSm1mBFRK8sSLjom61jU14BD9YYb/
 hMW0zDrjDJ3JEz1tFylv0nSxTWSd3FwKQtEy6hDa4Y9P5X5kKDRnmsl77jfivqgdfbtq
 ykzw==
X-Gm-Message-State: AOAM533YJby+qiR3sZNLr/oGj8PsHGJb6kEfRTD2CEr8PMViZi3ynFPl
 YIt6hvjfkZS3yNh5HbNceUs=
X-Google-Smtp-Source: ABdhPJxmBl1EpcRObVtB/hkFZeK7EFaScaFTcOoQofuXzqGQWUTkeSfN2I7XpWEitYnsdxfY9kTeVQ==
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr12762339wmj.98.1646047223541; 
 Mon, 28 Feb 2022 03:20:23 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c4f8400b00380e45cd564sm12245755wmq.8.2022.02.28.03.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 03:20:23 -0800 (PST)
Message-ID: <ad5e8d2c-4347-00a7-9e34-18601c6e1e11@gmail.com>
Date: Mon, 28 Feb 2022 12:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4,3/5] soc: mediatek: mmsys: add mt8186 mmsys routing
 table
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-4-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220222052803.3570-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_032025_648569_059BBF3F 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/02/2022 06:28, Rex-BC Chen wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add new routing table for MT8186.
> In MT8186, there are two routing pipelines for internal and external
> display.
> 
> Internal display: OVL0->RDMA0->COLOR0->CCORR0->AAL0->GAMMA->POSTMASK0->
> 		  DITHER->DSI0
> External display: OVL_2L0->RDMA1->DPI0
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

applied, thanks!

> ---
>   drivers/soc/mediatek/mt8186-mmsys.h | 113 ++++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c    |  11 +++
>   2 files changed, 124 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> new file mode 100644
> index 000000000000..7de329f2d729
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> +#define __SOC_MEDIATEK_MT8186_MMSYS_H
> +
> +#define MT8186_MMSYS_OVL_CON			0xF04
> +#define MT8186_MMSYS_OVL0_CON_MASK			0x3
> +#define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> +#define MT8186_OVL0_GO_BLEND				BIT(0)
> +#define MT8186_OVL0_GO_BG				BIT(1)
> +#define MT8186_OVL0_2L_GO_BLEND				BIT(2)
> +#define MT8186_OVL0_2L_GO_BG				BIT(3)
> +#define MT8186_DISP_RDMA0_SOUT_SEL		0xF0C
> +#define MT8186_RDMA0_SOUT_SEL_MASK			0xF
> +#define MT8186_RDMA0_SOUT_TO_DSI0			(0)
> +#define MT8186_RDMA0_SOUT_TO_COLOR0			(1)
> +#define MT8186_RDMA0_SOUT_TO_DPI0			(2)
> +#define MT8186_DISP_OVL0_2L_MOUT_EN		0xF14
> +#define MT8186_OVL0_2L_MOUT_EN_MASK			0xF
> +#define MT8186_OVL0_2L_MOUT_TO_RDMA0			BIT(0)
> +#define MT8186_OVL0_2L_MOUT_TO_RDMA1			BIT(3)
> +#define MT8186_DISP_OVL0_MOUT_EN		0xF18
> +#define MT8186_OVL0_MOUT_EN_MASK			0xF
> +#define MT8186_OVL0_MOUT_TO_RDMA0			BIT(0)
> +#define MT8186_OVL0_MOUT_TO_RDMA1			BIT(3)
> +#define MT8186_DISP_DITHER0_MOUT_EN		0xF20
> +#define MT8186_DITHER0_MOUT_EN_MASK			0xF
> +#define MT8186_DITHER0_MOUT_TO_DSI0			BIT(0)
> +#define MT8186_DITHER0_MOUT_TO_RDMA1			BIT(2)
> +#define MT8186_DITHER0_MOUT_TO_DPI0			BIT(3)
> +#define MT8186_DISP_RDMA0_SEL_IN		0xF28
> +#define MT8186_RDMA0_SEL_IN_MASK			0xF
> +#define MT8186_RDMA0_FROM_OVL0				0
> +#define MT8186_RDMA0_FROM_OVL0_2L			2
> +#define MT8186_DISP_DSI0_SEL_IN			0xF30
> +#define MT8186_DSI0_SEL_IN_MASK				0xF
> +#define MT8186_DSI0_FROM_RDMA0				0
> +#define MT8186_DSI0_FROM_DITHER0			1
> +#define MT8186_DSI0_FROM_RDMA1				2
> +#define MT8186_DISP_RDMA1_MOUT_EN		0xF3C
> +#define MT8186_RDMA1_MOUT_EN_MASK			0xF
> +#define MT8186_RDMA1_MOUT_TO_DPI0_SEL			BIT(0)
> +#define MT8186_RDMA1_MOUT_TO_DSI0_SEL			BIT(2)
> +#define MT8186_DISP_RDMA1_SEL_IN		0xF40
> +#define MT8186_RDMA1_SEL_IN_MASK			0xF
> +#define MT8186_RDMA1_FROM_OVL0				0
> +#define MT8186_RDMA1_FROM_OVL0_2L			2
> +#define MT8186_RDMA1_FROM_DITHER0			3
> +#define MT8186_DISP_DPI0_SEL_IN			0xF44
> +#define MT8186_DPI0_SEL_IN_MASK				0xF
> +#define MT8186_DPI0_FROM_RDMA1				0
> +#define MT8186_DPI0_FROM_DITHER0			1
> +#define MT8186_DPI0_FROM_RDMA0				2
> +
> +static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8186_DISP_OVL0_MOUT_EN, MT8186_OVL0_MOUT_EN_MASK,
> +		MT8186_OVL0_MOUT_TO_RDMA0
> +	},
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8186_DISP_RDMA0_SEL_IN, MT8186_RDMA0_SEL_IN_MASK,
> +		MT8186_RDMA0_FROM_OVL0
> +	},
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_CON_MASK,
> +		MT8186_OVL0_GO_BLEND
> +	},
> +	{
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +		MT8186_DISP_RDMA0_SOUT_SEL, MT8186_RDMA0_SOUT_SEL_MASK,
> +		MT8186_RDMA0_SOUT_TO_COLOR0
> +	},
> +	{
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
> +		MT8186_DITHER0_MOUT_TO_DSI0,
> +	},
> +	{
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
> +		MT8186_DSI0_FROM_DITHER0
> +	},
> +	{
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +		MT8186_DISP_OVL0_2L_MOUT_EN, MT8186_OVL0_2L_MOUT_EN_MASK,
> +		MT8186_OVL0_2L_MOUT_TO_RDMA1
> +	},
> +	{
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +		MT8186_DISP_RDMA1_SEL_IN, MT8186_RDMA1_SEL_IN_MASK,
> +		MT8186_RDMA1_FROM_OVL0_2L
> +	},
> +	{
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_2L_CON_MASK,
> +		MT8186_OVL0_2L_GO_BLEND
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8186_DISP_RDMA1_MOUT_EN, MT8186_RDMA1_MOUT_EN_MASK,
> +		MT8186_RDMA1_MOUT_TO_DPI0_SEL
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8186_DISP_DPI0_SEL_IN, MT8186_DPI0_SEL_IN_MASK,
> +		MT8186_DPI0_FROM_RDMA1
> +	},
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8186_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 1e448f1ffefb..0da25069ffb3 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -15,6 +15,7 @@
>   #include "mtk-mmsys.h"
>   #include "mt8167-mmsys.h"
>   #include "mt8183-mmsys.h"
> +#include "mt8186-mmsys.h"
>   #include "mt8192-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
> @@ -56,6 +57,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
> +	.clk_driver = "clk-mt8186-mm",
> +	.routes = mmsys_mt8186_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8192-mm",
>   	.routes = mmsys_mt8192_routing_table,
> @@ -242,6 +249,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>   		.compatible = "mediatek,mt8183-mmsys",
>   		.data = &mt8183_mmsys_driver_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt8186-mmsys",
> +		.data = &mt8186_mmsys_driver_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8192-mmsys",
>   		.data = &mt8192_mmsys_driver_data,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
