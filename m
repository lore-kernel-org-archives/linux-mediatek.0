Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11F5C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F5C61351
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79F5C61351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CzQziXCMhOwA6Ijndvg/W3eDwAMSb4y0fKUXqclQeSQ=; b=teLRyvXkTEzxDy6TEPLqVzz3I0
	3VSGyhKsfzNXIABsPuIvymnK9Fi96Wwa/nt22fvN6uBNlXBNuu7tKO/ezyG1tVZjXVM71Mbe7p83s
	5JGm8ygrIs9iegoARMhxb3pZHl4e2SNMvnxEJRUp5tzgVmQnphRVbhtFOWRau9xLSHJmG8Zglcl/2
	MS9GaoAQq0ujWu6pqhHjqjY5SAweZLHtwUBIp+LNa+6z1bdiOBX6RkFXXUkoYBPDQO1R0C2uqGc4B
	5B+TmJEOrDv/opHeoaDtBcjRimLT68E4OlpNAwBgIAwMPU18AZgnfzgnaHRh2QiEQTVOg0A+y3slN
	cAF6oobA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqss8-00C9A8-2x; Wed, 09 Jun 2021 07:43:32 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqss4-00C99Q-Jk; Wed, 09 Jun 2021 07:43:30 +0000
Received: by mail-wr1-f50.google.com with SMTP id a20so24383707wrc.0;
 Wed, 09 Jun 2021 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=So7c7JWPkLjUFwh5Mbzg+5acl7ZVlcpT5mPSiX7o4aQ=;
 b=ak/Oj0b7S2bRhaYUxnwunkIfDMKJLwBrLUHurksp7KJFEWifeLlzqDfEF118CCOREt
 W35tGqAIrHkjCav8TxrI2FTqonrRPWvTYYyCWJ2onfsLlc/8CJ5lcpgIqZPIMRhTKrub
 75ZxBq1Pi0iHFRlomG/3yoGuxe39NXEB7kehy9oz6lJcauqhWi7/5oFiUDJGK61WQWlu
 lJ1KqjdotIDP7f6mrXKg6x/jLK0VRMmEj3Ge98U0LWpYrgzdPOTmYVoP20GGWLnkPr+W
 jKL+jHNr8Cv3qJfkL//tu20lqsZof1ry8uhdJ+sRy8jpv8y5LJT3BxfaiGiYvDoOqYLd
 67dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=So7c7JWPkLjUFwh5Mbzg+5acl7ZVlcpT5mPSiX7o4aQ=;
 b=CSnH2jmhw7Hy2VgQRSlHExoSi6Qkp3KvvF2Z0DFxhxQVOuAqr08AsZ5owQgW0N6Pv9
 JHD2DvUB3/JahO2KEIuOz7unqSpTUDMYTPv9+bbw0bx4wDPn31Uzie4gBYQQuIg+QoLA
 jRv+eCIZkb5vBaAI92C12j0rgmk6/+fgjZ5g9534Y/f2icEKbSnlvoolvZEOLTeolJcN
 xEnGjdWUhl60lrTIp9S+Ag6gSClC70f0khuf8fIdxbPDmY6/NBv/FjSvpC6d+mprXArN
 pHNSHLQB4NJrN8Om3roEfUSmCCZytPxgl3sdXhvp/Y5+GrVcbRv9E9ZByHdd/X6pSVJC
 Hi1A==
X-Gm-Message-State: AOAM532MatCPQvB5eIJe/oGKESg1iNXFbNVePNQaN12uCNBPEZlu52x9
 iQTU+CRiJAXSC5vdE3XwoIg=
X-Google-Smtp-Source: ABdhPJzlKoBTyl107ZDIoOMGsxhiXisYxLa5tONf+ZkcfDuiJGC/CjWXYkP3mkHWKyfav5i5xCwmsw==
X-Received: by 2002:adf:efc3:: with SMTP id i3mr26786450wrp.356.1623224546286; 
 Wed, 09 Jun 2021 00:42:26 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id n7sm4709769wmq.37.2021.06.09.00.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:42:25 -0700 (PDT)
Subject: Re: [PATCH v5, 4/4] soc: mediatek: mmsys: Add mt8192 mmsys routing
 table
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-5-git-send-email-yongqiang.niu@mediatek.com>
 <f7fd0d7038361c7efae54ba96924105baa3fb033.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2e855ea5-232f-1fe6-46df-aeafd01a9ba6@gmail.com>
Date: Wed, 9 Jun 2021 09:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <f7fd0d7038361c7efae54ba96924105baa3fb033.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_004328_666475_9267C440 
X-CRM114-Status: GOOD (  20.98  )
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



On 09/06/2021 00:59, Chun-Jie Chen wrote:
> On Mon, 2021-04-12 at 22:04 +0800, Yongqiang Niu wrote:
>> mt8192 has different routing registers than mt8183
>>
>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>> ---
>>  drivers/soc/mediatek/mt8192-mmsys.h | 68
>> +++++++++++++++++++++++++++++++++++++
>>  drivers/soc/mediatek/mtk-mmsys.c    |  7 ++++
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
>>
>> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h
>> b/drivers/soc/mediatek/mt8192-mmsys.h
>> new file mode 100644
>> index 0000000..3179029
>> --- /dev/null
>> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __SOC_MEDIATEK_MT8192_MMSYS_H
>> +#define __SOC_MEDIATEK_MT8192_MMSYS_H
>> +
>> +#define MT8192_MMSYS_OVL_MOUT_EN		0xf04
>> +#define MT8192_DISP_OVL1_2L_MOUT_EN		0xf08
>> +#define MT8192_DISP_OVL0_2L_MOUT_EN		0xf18
>> +#define MT8192_DISP_OVL0_MOUT_EN		0xf1c
>> +#define MT8192_DISP_RDMA0_SEL_IN		0xf2c
>> +#define MT8192_DISP_RDMA0_SOUT_SEL		0xf30
>> +#define MT8192_DISP_CCORR0_SOUT_SEL		0xf34
>> +#define MT8192_DISP_AAL0_SEL_IN			0xf38
>> +#define MT8192_DISP_DITHER0_MOUT_EN		0xf3c
>> +#define MT8192_DISP_DSI0_SEL_IN			0xf40
>> +#define MT8192_DISP_OVL2_2L_MOUT_EN		0xf4c
>> +
>> +#define MT8192_DISP_OVL0_GO_BLEND			BIT(0)
>> +#define MT8192_DITHER0_MOUT_IN_DSI0			BIT(0)
>> +#define MT8192_OVL0_MOUT_EN_DISP_RDMA0			BIT(0)
>> +#define MT8192_OVL2_2L_MOUT_EN_RDMA4			BIT(0)
>> +#define MT8192_DISP_OVL0_GO_BG				BIT(1)
>> +#define MT8192_DISP_OVL0_2L_GO_BLEND			BIT(2)
>> +#define MT8192_DISP_OVL0_2L_GO_BG			BIT(3)
>> +#define MT8192_OVL1_2L_MOUT_EN_RDMA1			BIT(4)
>> +#define MT8192_OVL0_MOUT_EN_OVL0_2L			BIT(4)
>> +#define MT8192_RDMA0_SEL_IN_OVL0_2L			0x3
>> +#define MT8192_RDMA0_SOUT_COLOR0			0x1
>> +#define MT8192_CCORR0_SOUT_AAL0				0x1
>> +#define MT8192_AAL0_SEL_IN_CCORR0			0x1
>> +#define MT8192_DSI0_SEL_IN_DITHER0			0x1
>> +
>> +static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] =
>> {
>> +	{
>> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
>> +		MT8192_DISP_OVL0_2L_MOUT_EN,
>> MT8192_OVL0_MOUT_EN_DISP_RDMA0,
>> +	}, {
>> +		DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
>> +		MT8192_DISP_OVL2_2L_MOUT_EN,
>> MT8192_OVL2_2L_MOUT_EN_RDMA4
>> +	}, {
>> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
>> +		MT8192_DISP_DITHER0_MOUT_EN,
>> MT8192_DITHER0_MOUT_IN_DSI0
>> +	}, {
>> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
>> +		MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L
>> +	}, {
>> +		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
>> +		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0
>> +	}, {
>> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
>> +		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
>> +	}, {
>> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
>> +		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0
>> +	}, {
>> +		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
>> +		MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0
>> +	}, {
>> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
>> +		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
>> +	}, {
>> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
>> +		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
>> +	}
>> +};
>> +
>> +#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
>> +
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>> b/drivers/soc/mediatek/mtk-mmsys.c
>> index 79e5515..c755617 100644
>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>> @@ -12,6 +12,7 @@
>>  
>>  #include "mtk-mmsys.h"
>>  #include "mt8183-mmsys.h"
>> +#include "mt8192-mmsys.h"
>>  
>>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
>> {
>>  	.clk_driver = "clk-mt2701-mm",
>> @@ -45,6 +46,12 @@
>>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>>  };
>>  
>> +static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
>> {
>> +	.clk_driver = "clk-mt8192-mm",
>> +	.routes = mmsys_mt8192_routing_table,
>> +	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>> +};
>> +
>>  struct mtk_mmsys {
>>  	void __iomem *regs;
>>  	const struct mtk_mmsys_driver_data *data;
> 
> Hi Yongqiang,
> 
> There is 8192 mmsys compatible data in [1], but seems to lack of it in
> this patch, because mm clock driver will be bound to platform device 
> in mtk_mmsys_probe.
> 
> [1] 
> https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-11-git-send-email-yongqiang.niu@mediatek.com/

Yes, you should add a match in of_match_mtk_mmsys[] for the compatbile. The
clock driver should be implemented as a platform device.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
