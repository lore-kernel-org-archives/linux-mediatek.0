Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E2EC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:54:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D106198F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D106198F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UxF8e9/myTtZDJ4ypzsEtzAEJvYOducQ1RhaiVARkqk=; b=khm1/nFEelDWbrzW+k0+nYzUT
	BUa47rhc5Il4q+kUSGJTC9oTX9G62Kedll2g2EIj4YaP2YMNt6ZcfyXaMlRageM2gxWU4tvnLqpQt
	Q7L6/goQfcpDvMUNwxp2DGzdCrwem0fkKHu0hWGMAGNLHPdP7VBxlYE5nF/taMj1KDgEYjnposzO+
	1Eesl9YHvjEtkkC43d0Zo2R9wz9dMnXv5DqESd3JSC5vPv3W871aDqTVr+ZPrXKo8vf2XGO8Xpmwe
	HDSoBM/pwEZg4y1gTnyFO7m6+XD5yFVaPmNKpuOfKbCjaNS+HjdjrVfXHVTPl3ImuIQivl9laykGj
	/EXnsIBgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRZQK-006VDh-Ag; Wed, 31 Mar 2021 11:54:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRZQE-006VCy-Qz; Wed, 31 Mar 2021 11:54:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so998968wmd.4; 
 Wed, 31 Mar 2021 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wOUvR5UZkhr2U8Db9QDiTATjD+koxDFWTiWbqaITOdI=;
 b=E1x/9BvV21kUWB1h48F2mlMhFSlXG/eoXFucxVazGTFHI5bbjx0PR0+BF/2ePiJGhV
 munPoUHN+Hc6IddswFdxoErn78k2OzhAE5aZLeMTwpm5FUi8XXLSMp68Ot4pv7TVpLJT
 4royuAZKga/EytxKLmx+iaAjUr/Yz/c3kSkqhKPQiq9fhdMkmGjLRXITrOaaoUQkwD3x
 l7q3RsTzsKzgpcFzZ0T1gREW70Sbj5Y4Af6TDUxzkyGEmejhcKTXo9ImsdM6TffRhihL
 g7wT1Z1zlBmbJSDL8VDRDRiw9tGe/HnUKIsNsE+xKWfr0wkCckTitDZB+bBQJ1kJytq9
 7J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOUvR5UZkhr2U8Db9QDiTATjD+koxDFWTiWbqaITOdI=;
 b=Ii9AH9AQMJu0sCnB7QK4PsARtmn6xcSXJbGoiyhia/+7J0zy/KugeOha/AaknxbzqR
 Cm51Agw4mgajo3hLgLtfY9MoMUWGUDR7TencNvU6wiNqKebR4LShgiDyMHnDE4+MvPtY
 kKju3WJ5m6r/8ZgWj+n6sClDnowWKua9+q5ROwAS/GrSPqoqf2Jlqm4I0GM56jSn11Zd
 mUDAfTyhBGaOoSe6pJlEvOSZeEY+l74jEDAvY2JNGS1dcLKYZJF0TbIn+CLW5VpBrDt2
 nrWmoOV+JIwoVohqOoUYXa6xtxlNt12qXJF6wreftE7LU3OUKksTyy8T3k2sifdZyx7M
 zZ1g==
X-Gm-Message-State: AOAM530U1xgArNvrKYpL5Xs6iIeEIfXMdLzc7w0ouBYp3xLu4R3vnl9x
 Yyug3dmoTx4pryX5LIBPS/Y=
X-Google-Smtp-Source: ABdhPJyfd4P1sadVVcCK7G1FwTbi2uaOyuSyCHf/gyU7bg4PD08sTXOfNJDXLQOdpv1SpG3e2hELjA==
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr2879392wmj.185.1617191646149; 
 Wed, 31 Mar 2021 04:54:06 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id s13sm4183559wrv.80.2021.03.31.04.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 04:54:05 -0700 (PDT)
Subject: Re: [PATCH v3] soc: mediatek: mmsys: Add mt8183 mmsys routing table
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 enric.balletbo@collabora.com
References: <20210330110423.3542163-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e8c75361-69cf-5516-5fcc-4fae79988418@gmail.com>
Date: Wed, 31 Mar 2021 13:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330110423.3542163-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_125407_071812_02568E33 
X-CRM114-Status: GOOD (  20.35  )
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



On 30/03/2021 13:04, Hsin-Yi Wang wrote:
> mt8183 has different routing registers than mt8173.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.12-next/soc

Thanks!

> ---
> v2->v3:
> Fix comments.
> 
> v1->v2:
> Move mt8183 routing table to mt8183-mmsys.h
> 
> This patch is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v5.12-next/soc
> ---
>  drivers/soc/mediatek/mt8183-mmsys.h | 54 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    |  3 ++
>  2 files changed, 57 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8183-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
> new file mode 100644
> index 000000000000..579dfc8dc8fc
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8183_MMSYS_H
> +#define __SOC_MEDIATEK_MT8183_MMSYS_H
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
> index c46d8ab8b0c2..79e55150210e 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -11,6 +11,7 @@
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>  
>  #include "mtk-mmsys.h"
> +#include "mt8183-mmsys.h"
>  
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.clk_driver = "clk-mt2701-mm",
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
