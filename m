Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B4AC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:55:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DC261490
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3DC261490
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hvL6demKrDB00uX7VR5/b/PqP5PV3SBUvevkKXP63Ns=; b=Z6peFcc170mW6FdR4TwyWtz3u
	iZrNp4gnrOU4zVgIbDtyHvr7sGdl+7hSvqA88y9p7//0nAja1Fqhs4zgZYJhltz2IIbJMmTWgX7WJ
	P+bdb2wiaOCv8IdAQDFMIG82DKYIWBUXaZZA+pEmcoycUOvOQd2tCjXD1gSia6be/2e5FLR5wj/lm
	/6nsCd9JvtBCNkNUQ4UJspCkgoPr68G2gKgsiFG0Gsmty17ZxePeuAIDpnaOJUFaxIekYqBlq4iTp
	PDqx42+nsoHw1Ani02lR1+Pm1peQQjGVnjbO7FdCaxlcCAfH5xjWT7qiAuLTBjZr40z4dRCGfH+j4
	Dcslp210w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRC21-003Tp6-1c; Tue, 30 Mar 2021 10:55:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRC1s-003TnY-6P; Tue, 30 Mar 2021 10:55:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b9so15753684wrt.8;
 Tue, 30 Mar 2021 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zdE5Fc8jLem2B9Qy48G9g0/1kUGnbcvZCpMV8AzrKEM=;
 b=H9tk91yek2J1Y1tyh0XM2q3G/b+Nvp2kUxPqqRIoSggREMNckFAO0SNb1uTBTmuZSB
 teUjQUnAsphpTEZkAT/H7zJNCRShXzU3+HYSpeTTbyjz+ctSKS276oBAUx8IRJ0Ko9e7
 AETVZWZRPxoCW3CZf9JDpbAyrYd9rSXplwUrJEzPqniPsFqSwKxe5hyEYOd+v1fl2bDJ
 g9amZYnjUXwC7+6i1+6rYtcRtuL1meArgxwNMil1RhLyJHKHn+DWqfecEg8Jzg9aqHv1
 XoIi8jP6BNa2PQDwH307OI7cgTHVgMpLLWU4nHe4UjY9Kta31TsldDio8DHZupKpP/dn
 TJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zdE5Fc8jLem2B9Qy48G9g0/1kUGnbcvZCpMV8AzrKEM=;
 b=UxggftLGmepOd8F1hDi5SGLiD+4wXcPL4qnCs1JnSg5B7IH+mouaohjq0Hr+lq2+F3
 gOXggZGml5Fg/OEF7sp3M6/KOs80Y1Jw9Rd9EXBi5qZfSzuMad06tFYtt9kC+beoTJ5s
 Vt1ydjpOt44UJR/dC0vTvw71n94NuoPiYquM/wR1qNuZ9aneaAefFKPYSFUbxHU5hP9U
 gZ42h3pqi65PXuyL0OAmiBxmYgzYnDpi8m4zhh+R+ZiT7tVOFkghG1UEerAK/4W1nNVv
 Voq8zgrO4rhZ5/d5JEHAY5kBmVSAoMlS4jgEz3Xen5coNbwfQGCcGgIscSXnp8BKgMTG
 Dp2w==
X-Gm-Message-State: AOAM533tHD8b7G7RMDeGUV/3x3miRwRPZqmOlFGclSkfM9WK6rK98l3k
 qlZ8+5ouoivB6lq1FXdLkd4=
X-Google-Smtp-Source: ABdhPJz81MZ4dAglYXBBgnyQTkAYA3/Xi5muiyQxbDAJWWnx3S/5t2YuFkHCrMeVqoIE7E4pnLGxWA==
X-Received: by 2002:adf:f307:: with SMTP id i7mr33454467wro.142.1617101723156; 
 Tue, 30 Mar 2021 03:55:23 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id j123sm2970592wmb.1.2021.03.30.03.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:55:22 -0700 (PDT)
Subject: Re: [PATCH v2] soc: mediatek: mmsys: Add mt8183 mmsys routing table
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 enric.balletbo@collabora.com
References: <20210330104432.3432574-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <bb100c42-a295-1b94-ada2-069ab397dffd@gmail.com>
Date: Tue, 30 Mar 2021 12:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330104432.3432574-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_115525_153735_0819826A 
X-CRM114-Status: GOOD (  21.00  )
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



On 30/03/2021 12:44, Hsin-Yi Wang wrote:
> mt8183 has different routing registers than mt8173.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> v1->v2:
> Move mt8183 routing table to mt8183-mmsys.h
> 
> This patch is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v5.12-next/soc
> ---
>  drivers/soc/mediatek/mt8183-mmsys.h | 56 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    |  3 ++
>  2 files changed, 59 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8183-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
> new file mode 100644
> index 000000000000..38e9f683e5bd
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8183_MMSYS_H
> +#define __SOC_MEDIATEK_MT8183_MMSYS_H
> +
> +#include "mtk-mmsys.h"

We can drop this, see below.

> +
> +#define MT8183_DISP_OVL0_MOUT_EN		0xf00
> +#define MT8183_DISP_OVL0_2L_MOUT_EN		0xf04
> +#define MT8183_DISP_OVL1_2L_MOUT_EN		0xf08
> +#define MT8183_DISP_DITHER0_MOUT_EN		0xf0c
> +#define MT8183_DISP_PATH0_SEL_IN		0xf24
> +#define MT8183_DISP_DSI0_SEL_IN			0xf2c
> +#define MT8183_DISP_DPI0_SEL_IN			0xf30
> +#define MT8183_DISP_RDMA0_SOUT_SEL_IN		0xf50
> +#define MT8183_DISP_RDMA1_SOUT_SEL_IN		0xf54
> +
> +#define MT8183_OVL0_MOUT_EN_OVL0_2L		BIT(4)
> +#define MT8183_OVL0_2L_MOUT_EN_DISP_PATH0	BIT(0)
> +#define MT8183_OVL1_2L_MOUT_EN_RDMA1		BIT(4)
> +#define MT8183_DITHER0_MOUT_IN_DSI0		BIT(0)
> +#define MT8183_DISP_PATH0_SEL_IN_OVL0_2L	0x1
> +#define MT8183_DSI0_SEL_IN_RDMA0		0x1
> +#define MT8183_DSI0_SEL_IN_RDMA1		0x3
> +#define MT8183_DPI0_SEL_IN_RDMA0		0x1
> +#define MT8183_DPI0_SEL_IN_RDMA1		0x2
> +#define MT8183_RDMA0_SOUT_COLOR0		0x1
> +#define MT8183_RDMA1_SOUT_DSI0			0x1
> +
> +static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +		MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L
> +	}, {
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8183_DISP_OVL0_2L_MOUT_EN, MT8183_OVL0_2L_MOUT_EN_DISP_PATH0
> +	}, {
> +		DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
> +		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0
> +	}, {
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8183_DISP_PATH0_SEL_IN, MT8183_DISP_PATH0_SEL_IN_OVL0_2L
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8183_DISP_DPI0_SEL_IN, MT8183_DPI0_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +		MT8183_DISP_RDMA0_SOUT_SEL_IN, MT8183_RDMA0_SOUT_COLOR0
> +	}
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8183_MMSYS_H */
> +
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index c46d8ab8b0c2..ac68a989854e 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -10,6 +10,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>  
> +#include "mt8183-mmsys.h"

Just add the SoC specific header after mtk-mmsys.h include.

Other then that patch looks good.

Matthias


>  #include "mtk-mmsys.h"
>  
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> @@ -40,6 +41,8 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>  
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  	.clk_driver = "clk-mt8183-mm",
> +	.routes = mmsys_mt8183_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>  
>  struct mtk_mmsys {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
