Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAE4C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 12:00:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6056A64E3B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 12:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6056A64E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hiCC66zRDgGAu6qRSPIyWkFewgsQHQ1dWe9YJ2OSI2o=; b=l43xmIJXT6S7uOJkxTy+GQFyQ
	NecDoxToGCtefkwzEI1jXW4vtVzuLDvS/+TpdxWqCXXisbcioenU7ixd5ezWGn0V0Rc9CM3kP6JOA
	2676hj1ed11vK88zn5VZzQOcDEAhY2iU+ULLvnDx2eEIgrcTQ0+9LZS5Pj9VKb3KviVX7x180vD8m
	7178tLG6mgnPfYnMUPzJw1Q4OChXFKzS9Jynnw61kTLmbdEDoTmZsCg7cad3VP+O5W6QtlNApmRoZ
	RhEVTmuDNcGN96/LC6y3I0ijKdBbliPdXk9BxcGQmKtZKUgoxb09RJogje5zMEcHvn201DTnfvcRb
	z2TJAou5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9oAC-0002v8-38; Wed, 10 Feb 2021 12:00:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9oA3-0002s5-PF; Wed, 10 Feb 2021 12:00:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q8so2128630wru.13;
 Wed, 10 Feb 2021 03:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m2GfCWADMbpgDGcjhPVOzqnjWPiPIbGvcI9CdHXiz2E=;
 b=c6Rvst11GIwNOVd7M5mt2CQPOlHp8zu3wt52dmrJK4qgitj2fNfn49p26xbyYP/yfP
 X3z6AVnDI5I/N2SXoUAsnPIOCY6Ec2KE4jN4vE2CGBHAYT9NJnm1N1TYHDy1YVhcbhGb
 ECozy5QuZwxwWqM+oGkLly19X4TpY7AzZStTdAjm9uMGZVYgAni5IDp+YpmK/8QJx2V1
 OMg46178GfgddpG3DRVXCL3wS1TITY9YKem6pVrk5kAnqHGYFzLUEipENv3xL39IQC67
 0DPaXCFevZPZGEwWYqa3fsVI978z0PnhLqPBIcihIljpowysxPTWrz/5u+JAYLS7zaj0
 U9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2GfCWADMbpgDGcjhPVOzqnjWPiPIbGvcI9CdHXiz2E=;
 b=sW4H53vyoXkTlpsvw5NFXpA8MykA9UArq7A80zXzI/ZWFkgpU1TaEGg/esskwYRgJk
 4Rdy4xs/Kj75uPuSeqe+tyxu4Lqj3A00qWsbPtE1M9eZksc38G6Pwb1fZdPkq2ulF5af
 XMp6rpsBicJsszOaJUipwjFIpIIdSikyq4U4sz8TQ8A0R2QkZfz1SbiCtHdmpP5GO45s
 r/dY7g8JaZNwSFBcwY2l+0nViWm8AktCP26dAI3MJeAYihz3xjkZOezEJ5eAqvCv8/SF
 XHOqm87Yv9GpXKDVqLd74e867r8CdtU1rmcbzviF8hhK8q1VdhJV/PEDSQmPKSt2LcSR
 iHKg==
X-Gm-Message-State: AOAM530LXVevWJsdqumr9FDVXULN98qO+jHI95NNeXJlsOweKAwxVl2w
 QDzdd2mSNnQKayJnhcyDjHcaJ98ilFs=
X-Google-Smtp-Source: ABdhPJzRA3+2mT2hxzd6AtpQ10th8PDlUYDumfqXmO2nqEfRdbpUM/SUeZzayG514EOOWyjbs23l0g==
X-Received: by 2002:a5d:4287:: with SMTP id k7mr3206029wrq.317.1612958398098; 
 Wed, 10 Feb 2021 03:59:58 -0800 (PST)
Received: from ziggy.stardust (static-188-169-27-46.ipcom.comunitel.net.
 [46.27.169.188])
 by smtp.gmail.com with ESMTPSA id m24sm2116234wmi.24.2021.02.10.03.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:59:57 -0800 (PST)
Subject: Re: [PATCH v4, 01/10] soc: mediatek: mmsys: create mmsys folder
To: Enric Balletbo Serra <eballetbo@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAFqH_53Fbncu5BVDX7idfTN5sF6y6tnO8X3iFn=PQpuE=bbvWw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <84b6787b-392a-2b5e-d10f-d9ee3a7da7d0@gmail.com>
Date: Wed, 10 Feb 2021 12:59:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqH_53Fbncu5BVDX7idfTN5sF6y6tnO8X3iFn=PQpuE=bbvWw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_065959_913113_887F1E65 
X-CRM114-Status: GOOD (  27.02  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/02/2021 16:38, Enric Balletbo Serra wrote:
> Hi Yongqiang Niu,
> 
> Thank you for your patch.
> 
> Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dt., 5
> de gen. 2021 a les 4:07:
>>
>> the mmsys will more and more complicated after support
>> more and more SoCs, add an independent folder will be
>> more clear
>>
>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>> ---
>>  drivers/soc/mediatek/Makefile          |   2 +-
> 
> It will not apply cleanly anymore after the below commit that is
> already queued. Maybe you could rebase the patches and resend them
> again?
> 

Please don't do that, as I pointed out in [1] I don't like the approach of a new
folder. If you disagree please let me know why. Otherwise please send a new
version with the changes suggested by me :)

Regards,
Matthias

[1]
https://lore.kernel.org/linux-mediatek/4cadc9f0-0761-7609-abac-d2211b097bda@gmail.com/

> commit e1e4f7fea37572f0ccf3887430e52c491e9accb6
> Author: CK Hu <ck.hu@mediatek.com>
> Date:   Tue Jul 21 15:46:06 2020 +0800
> 
>     soc / drm: mediatek: Move mtk mutex driver to soc folder
> 
>     mtk mutex is used by DRM and MDP driver, and its function is SoC-specific,
>     so move it to soc folder.
> 
> With that fixed,
> 
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> Thanks,
>   Enric
> 
>>  drivers/soc/mediatek/mmsys/Makefile    |   2 +
>>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 373 +++++++++++++++++++++++++++++++++
>>  drivers/soc/mediatek/mtk-mmsys.c       | 373 ---------------------------------
>>  4 files changed, 376 insertions(+), 374 deletions(-)
>>  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
>>  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
>>  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>>
>> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
>> index b6908db..eca9774 100644
>> --- a/drivers/soc/mediatek/Makefile
>> +++ b/drivers/soc/mediatek/Makefile
>> @@ -5,4 +5,4 @@ obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>>  obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
>> -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>> +obj-$(CONFIG_MTK_MMSYS) += mmsys/
>> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
>> new file mode 100644
>> index 0000000..f44eadc
>> --- /dev/null
>> +++ b/drivers/soc/mediatek/mmsys/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>> diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
>> new file mode 100644
>> index 0000000..18f9397
>> --- /dev/null
>> +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
>> @@ -0,0 +1,373 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2014 MediaTek Inc.
>> + * Author: James Liao <jamesjj.liao@mediatek.com>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>> +
>> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
>> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
>> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
>> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
>> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
>> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
>> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
>> +#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
>> +#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
>> +#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
>> +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
>> +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
>> +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
>> +#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
>> +
>> +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
>> +#define DISP_REG_CONFIG_OUT_SEL                        0x04c
>> +#define DISP_REG_CONFIG_DSI_SEL                        0x050
>> +#define DISP_REG_CONFIG_DPI_SEL                        0x064
>> +
>> +#define OVL0_MOUT_EN_COLOR0                    0x1
>> +#define OD_MOUT_EN_RDMA0                       0x1
>> +#define OD1_MOUT_EN_RDMA1                      BIT(16)
>> +#define UFOE_MOUT_EN_DSI0                      0x1
>> +#define COLOR0_SEL_IN_OVL0                     0x1
>> +#define OVL1_MOUT_EN_COLOR1                    0x1
>> +#define GAMMA_MOUT_EN_RDMA1                    0x1
>> +#define RDMA0_SOUT_DPI0                                0x2
>> +#define RDMA0_SOUT_DPI1                                0x3
>> +#define RDMA0_SOUT_DSI1                                0x1
>> +#define RDMA0_SOUT_DSI2                                0x4
>> +#define RDMA0_SOUT_DSI3                                0x5
>> +#define RDMA1_SOUT_DPI0                                0x2
>> +#define RDMA1_SOUT_DPI1                                0x3
>> +#define RDMA1_SOUT_DSI1                                0x1
>> +#define RDMA1_SOUT_DSI2                                0x4
>> +#define RDMA1_SOUT_DSI3                                0x5
>> +#define RDMA2_SOUT_DPI0                                0x2
>> +#define RDMA2_SOUT_DPI1                                0x3
>> +#define RDMA2_SOUT_DSI1                                0x1
>> +#define RDMA2_SOUT_DSI2                                0x4
>> +#define RDMA2_SOUT_DSI3                                0x5
>> +#define DPI0_SEL_IN_RDMA1                      0x1
>> +#define DPI0_SEL_IN_RDMA2                      0x3
>> +#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
>> +#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
>> +#define DSI0_SEL_IN_RDMA1                      0x1
>> +#define DSI0_SEL_IN_RDMA2                      0x4
>> +#define DSI1_SEL_IN_RDMA1                      0x1
>> +#define DSI1_SEL_IN_RDMA2                      0x4
>> +#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
>> +#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
>> +#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
>> +#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
>> +#define COLOR1_SEL_IN_OVL1                     0x1
>> +
>> +#define OVL_MOUT_EN_RDMA                       0x1
>> +#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
>> +#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
>> +#define DSI_SEL_IN_BLS                         0x0
>> +#define DPI_SEL_IN_BLS                         0x0
>> +#define DSI_SEL_IN_RDMA                                0x1
>> +
>> +struct mtk_mmsys_driver_data {
>> +       const char *clk_driver;
>> +};
>> +
>> +static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>> +       .clk_driver = "clk-mt2701-mm",
>> +};
>> +
>> +static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>> +       .clk_driver = "clk-mt2712-mm",
>> +};
>> +
>> +static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
>> +       .clk_driver = "clk-mt6779-mm",
>> +};
>> +
>> +static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
>> +       .clk_driver = "clk-mt6797-mm",
>> +};
>> +
>> +static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>> +       .clk_driver = "clk-mt8173-mm",
>> +};
>> +
>> +static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>> +       .clk_driver = "clk-mt8183-mm",
>> +};
>> +
>> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
>> +                                         enum mtk_ddp_comp_id next,
>> +                                         unsigned int *addr)
>> +{
>> +       unsigned int value;
>> +
>> +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> +               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>> +               value = OVL0_MOUT_EN_COLOR0;
>> +       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>> +               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>> +               value = OVL_MOUT_EN_RDMA;
>> +       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>> +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> +               value = OD_MOUT_EN_RDMA0;
>> +       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>> +               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>> +               value = UFOE_MOUT_EN_DSI0;
>> +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> +               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>> +               value = OVL1_MOUT_EN_COLOR1;
>> +       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>> +               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>> +               value = GAMMA_MOUT_EN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>> +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> +               value = OD1_MOUT_EN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +               value = RDMA0_SOUT_DPI0;
>> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +               value = RDMA0_SOUT_DPI1;
>> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +               value = RDMA0_SOUT_DSI1;
>> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +               value = RDMA0_SOUT_DSI2;
>> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +               value = RDMA0_SOUT_DSI3;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +               value = RDMA1_SOUT_DSI1;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +               value = RDMA1_SOUT_DSI2;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +               value = RDMA1_SOUT_DSI3;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +               value = RDMA1_SOUT_DPI0;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +               value = RDMA1_SOUT_DPI1;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +               value = RDMA2_SOUT_DPI0;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +               value = RDMA2_SOUT_DPI1;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +               value = RDMA2_SOUT_DSI1;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +               value = RDMA2_SOUT_DSI2;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +               value = RDMA2_SOUT_DSI3;
>> +       } else {
>> +               value = 0;
>> +       }
>> +
>> +       return value;
>> +}
>> +
>> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
>> +                                        enum mtk_ddp_comp_id next,
>> +                                        unsigned int *addr)
>> +{
>> +       unsigned int value;
>> +
>> +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> +               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>> +               value = COLOR0_SEL_IN_OVL0;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +               value = DPI0_SEL_IN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +               value = DPI1_SEL_IN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +               value = DSI0_SEL_IN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> +               value = DSI1_SEL_IN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +               value = DSI2_SEL_IN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> +               value = DSI3_SEL_IN_RDMA1;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +               value = DPI0_SEL_IN_RDMA2;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +               value = DPI1_SEL_IN_RDMA2;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +               value = DSI0_SEL_IN_RDMA2;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> +               value = DSI1_SEL_IN_RDMA2;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +               value = DSI2_SEL_IN_RDMA2;
>> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +               value = DSI3_SEL_IN_RDMA2;
>> +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> +               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>> +               value = COLOR1_SEL_IN_OVL1;
>> +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> +               *addr = DISP_REG_CONFIG_DSI_SEL;
>> +               value = DSI_SEL_IN_BLS;
>> +       } else {
>> +               value = 0;
>> +       }
>> +
>> +       return value;
>> +}
>> +
>> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
>> +                                  enum mtk_ddp_comp_id cur,
>> +                                  enum mtk_ddp_comp_id next)
>> +{
>> +       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> +               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>> +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
>> +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>> +               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>> +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
>> +               writel_relaxed(DSI_SEL_IN_RDMA,
>> +                              config_regs + DISP_REG_CONFIG_DSI_SEL);
>> +               writel_relaxed(DPI_SEL_IN_BLS,
>> +                              config_regs + DISP_REG_CONFIG_DPI_SEL);
>> +       }
>> +}
>> +
>> +void mtk_mmsys_ddp_connect(struct device *dev,
>> +                          enum mtk_ddp_comp_id cur,
>> +                          enum mtk_ddp_comp_id next)
>> +{
>> +       void __iomem *config_regs = dev_get_drvdata(dev);
>> +       unsigned int addr, value, reg;
>> +
>> +       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>> +       if (value) {
>> +               reg = readl_relaxed(config_regs + addr) | value;
>> +               writel_relaxed(reg, config_regs + addr);
>> +       }
>> +
>> +       mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
>> +
>> +       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>> +       if (value) {
>> +               reg = readl_relaxed(config_regs + addr) | value;
>> +               writel_relaxed(reg, config_regs + addr);
>> +       }
>> +}
>> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>> +
>> +void mtk_mmsys_ddp_disconnect(struct device *dev,
>> +                             enum mtk_ddp_comp_id cur,
>> +                             enum mtk_ddp_comp_id next)
>> +{
>> +       void __iomem *config_regs = dev_get_drvdata(dev);
>> +       unsigned int addr, value, reg;
>> +
>> +       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>> +       if (value) {
>> +               reg = readl_relaxed(config_regs + addr) & ~value;
>> +               writel_relaxed(reg, config_regs + addr);
>> +       }
>> +
>> +       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>> +       if (value) {
>> +               reg = readl_relaxed(config_regs + addr) & ~value;
>> +               writel_relaxed(reg, config_regs + addr);
>> +       }
>> +}
>> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>> +
>> +static int mtk_mmsys_probe(struct platform_device *pdev)
>> +{
>> +       const struct mtk_mmsys_driver_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct platform_device *clks;
>> +       struct platform_device *drm;
>> +       void __iomem *config_regs;
>> +       int ret;
>> +
>> +       config_regs = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(config_regs)) {
>> +               ret = PTR_ERR(config_regs);
>> +               dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       platform_set_drvdata(pdev, config_regs);
>> +
>> +       data = of_device_get_match_data(&pdev->dev);
>> +
>> +       clks = platform_device_register_data(&pdev->dev, data->clk_driver,
>> +                                            PLATFORM_DEVID_AUTO, NULL, 0);
>> +       if (IS_ERR(clks))
>> +               return PTR_ERR(clks);
>> +
>> +       drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>> +                                           PLATFORM_DEVID_AUTO, NULL, 0);
>> +       if (IS_ERR(drm)) {
>> +               platform_device_unregister(clks);
>> +               return PTR_ERR(drm);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id of_match_mtk_mmsys[] = {
>> +       {
>> +               .compatible = "mediatek,mt2701-mmsys",
>> +               .data = &mt2701_mmsys_driver_data,
>> +       },
>> +       {
>> +               .compatible = "mediatek,mt2712-mmsys",
>> +               .data = &mt2712_mmsys_driver_data,
>> +       },
>> +       {
>> +               .compatible = "mediatek,mt6779-mmsys",
>> +               .data = &mt6779_mmsys_driver_data,
>> +       },
>> +       {
>> +               .compatible = "mediatek,mt6797-mmsys",
>> +               .data = &mt6797_mmsys_driver_data,
>> +       },
>> +       {
>> +               .compatible = "mediatek,mt8173-mmsys",
>> +               .data = &mt8173_mmsys_driver_data,
>> +       },
>> +       {
>> +               .compatible = "mediatek,mt8183-mmsys",
>> +               .data = &mt8183_mmsys_driver_data,
>> +       },
>> +       { }
>> +};
>> +
>> +static struct platform_driver mtk_mmsys_drv = {
>> +       .driver = {
>> +               .name = "mtk-mmsys",
>> +               .of_match_table = of_match_mtk_mmsys,
>> +       },
>> +       .probe = mtk_mmsys_probe,
>> +};
>> +
>> +builtin_platform_driver(mtk_mmsys_drv);
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>> deleted file mode 100644
>> index 18f9397..0000000
>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>> +++ /dev/null
>> @@ -1,373 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright (c) 2014 MediaTek Inc.
>> - * Author: James Liao <jamesjj.liao@mediatek.com>
>> - */
>> -
>> -#include <linux/device.h>
>> -#include <linux/io.h>
>> -#include <linux/of_device.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/soc/mediatek/mtk-mmsys.h>
>> -
>> -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
>> -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
>> -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
>> -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
>> -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
>> -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
>> -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
>> -#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
>> -#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
>> -#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
>> -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
>> -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
>> -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
>> -#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
>> -
>> -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
>> -#define DISP_REG_CONFIG_OUT_SEL                        0x04c
>> -#define DISP_REG_CONFIG_DSI_SEL                        0x050
>> -#define DISP_REG_CONFIG_DPI_SEL                        0x064
>> -
>> -#define OVL0_MOUT_EN_COLOR0                    0x1
>> -#define OD_MOUT_EN_RDMA0                       0x1
>> -#define OD1_MOUT_EN_RDMA1                      BIT(16)
>> -#define UFOE_MOUT_EN_DSI0                      0x1
>> -#define COLOR0_SEL_IN_OVL0                     0x1
>> -#define OVL1_MOUT_EN_COLOR1                    0x1
>> -#define GAMMA_MOUT_EN_RDMA1                    0x1
>> -#define RDMA0_SOUT_DPI0                                0x2
>> -#define RDMA0_SOUT_DPI1                                0x3
>> -#define RDMA0_SOUT_DSI1                                0x1
>> -#define RDMA0_SOUT_DSI2                                0x4
>> -#define RDMA0_SOUT_DSI3                                0x5
>> -#define RDMA1_SOUT_DPI0                                0x2
>> -#define RDMA1_SOUT_DPI1                                0x3
>> -#define RDMA1_SOUT_DSI1                                0x1
>> -#define RDMA1_SOUT_DSI2                                0x4
>> -#define RDMA1_SOUT_DSI3                                0x5
>> -#define RDMA2_SOUT_DPI0                                0x2
>> -#define RDMA2_SOUT_DPI1                                0x3
>> -#define RDMA2_SOUT_DSI1                                0x1
>> -#define RDMA2_SOUT_DSI2                                0x4
>> -#define RDMA2_SOUT_DSI3                                0x5
>> -#define DPI0_SEL_IN_RDMA1                      0x1
>> -#define DPI0_SEL_IN_RDMA2                      0x3
>> -#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
>> -#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
>> -#define DSI0_SEL_IN_RDMA1                      0x1
>> -#define DSI0_SEL_IN_RDMA2                      0x4
>> -#define DSI1_SEL_IN_RDMA1                      0x1
>> -#define DSI1_SEL_IN_RDMA2                      0x4
>> -#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
>> -#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
>> -#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
>> -#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
>> -#define COLOR1_SEL_IN_OVL1                     0x1
>> -
>> -#define OVL_MOUT_EN_RDMA                       0x1
>> -#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
>> -#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
>> -#define DSI_SEL_IN_BLS                         0x0
>> -#define DPI_SEL_IN_BLS                         0x0
>> -#define DSI_SEL_IN_RDMA                                0x1
>> -
>> -struct mtk_mmsys_driver_data {
>> -       const char *clk_driver;
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>> -       .clk_driver = "clk-mt2701-mm",
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>> -       .clk_driver = "clk-mt2712-mm",
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
>> -       .clk_driver = "clk-mt6779-mm",
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
>> -       .clk_driver = "clk-mt6797-mm",
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>> -       .clk_driver = "clk-mt8173-mm",
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>> -       .clk_driver = "clk-mt8183-mm",
>> -};
>> -
>> -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
>> -                                         enum mtk_ddp_comp_id next,
>> -                                         unsigned int *addr)
>> -{
>> -       unsigned int value;
>> -
>> -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> -               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>> -               value = OVL0_MOUT_EN_COLOR0;
>> -       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>> -               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>> -               value = OVL_MOUT_EN_RDMA;
>> -       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>> -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> -               value = OD_MOUT_EN_RDMA0;
>> -       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>> -               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>> -               value = UFOE_MOUT_EN_DSI0;
>> -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> -               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>> -               value = OVL1_MOUT_EN_COLOR1;
>> -       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>> -               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>> -               value = GAMMA_MOUT_EN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>> -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> -               value = OD1_MOUT_EN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -               value = RDMA0_SOUT_DPI0;
>> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -               value = RDMA0_SOUT_DPI1;
>> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -               value = RDMA0_SOUT_DSI1;
>> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -               value = RDMA0_SOUT_DSI2;
>> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -               value = RDMA0_SOUT_DSI3;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -               value = RDMA1_SOUT_DSI1;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -               value = RDMA1_SOUT_DSI2;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -               value = RDMA1_SOUT_DSI3;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -               value = RDMA1_SOUT_DPI0;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -               value = RDMA1_SOUT_DPI1;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -               value = RDMA2_SOUT_DPI0;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -               value = RDMA2_SOUT_DPI1;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -               value = RDMA2_SOUT_DSI1;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -               value = RDMA2_SOUT_DSI2;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -               value = RDMA2_SOUT_DSI3;
>> -       } else {
>> -               value = 0;
>> -       }
>> -
>> -       return value;
>> -}
>> -
>> -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
>> -                                        enum mtk_ddp_comp_id next,
>> -                                        unsigned int *addr)
>> -{
>> -       unsigned int value;
>> -
>> -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> -               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>> -               value = COLOR0_SEL_IN_OVL0;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -               value = DPI0_SEL_IN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -               value = DPI1_SEL_IN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -               value = DSI0_SEL_IN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> -               value = DSI1_SEL_IN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -               value = DSI2_SEL_IN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> -               value = DSI3_SEL_IN_RDMA1;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -               value = DPI0_SEL_IN_RDMA2;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -               value = DPI1_SEL_IN_RDMA2;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -               value = DSI0_SEL_IN_RDMA2;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> -               value = DSI1_SEL_IN_RDMA2;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -               value = DSI2_SEL_IN_RDMA2;
>> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -               value = DSI3_SEL_IN_RDMA2;
>> -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> -               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>> -               value = COLOR1_SEL_IN_OVL1;
>> -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> -               *addr = DISP_REG_CONFIG_DSI_SEL;
>> -               value = DSI_SEL_IN_BLS;
>> -       } else {
>> -               value = 0;
>> -       }
>> -
>> -       return value;
>> -}
>> -
>> -static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
>> -                                  enum mtk_ddp_comp_id cur,
>> -                                  enum mtk_ddp_comp_id next)
>> -{
>> -       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> -               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>> -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
>> -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>> -               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>> -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
>> -               writel_relaxed(DSI_SEL_IN_RDMA,
>> -                              config_regs + DISP_REG_CONFIG_DSI_SEL);
>> -               writel_relaxed(DPI_SEL_IN_BLS,
>> -                              config_regs + DISP_REG_CONFIG_DPI_SEL);
>> -       }
>> -}
>> -
>> -void mtk_mmsys_ddp_connect(struct device *dev,
>> -                          enum mtk_ddp_comp_id cur,
>> -                          enum mtk_ddp_comp_id next)
>> -{
>> -       void __iomem *config_regs = dev_get_drvdata(dev);
>> -       unsigned int addr, value, reg;
>> -
>> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>> -       if (value) {
>> -               reg = readl_relaxed(config_regs + addr) | value;
>> -               writel_relaxed(reg, config_regs + addr);
>> -       }
>> -
>> -       mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
>> -
>> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>> -       if (value) {
>> -               reg = readl_relaxed(config_regs + addr) | value;
>> -               writel_relaxed(reg, config_regs + addr);
>> -       }
>> -}
>> -EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>> -
>> -void mtk_mmsys_ddp_disconnect(struct device *dev,
>> -                             enum mtk_ddp_comp_id cur,
>> -                             enum mtk_ddp_comp_id next)
>> -{
>> -       void __iomem *config_regs = dev_get_drvdata(dev);
>> -       unsigned int addr, value, reg;
>> -
>> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>> -       if (value) {
>> -               reg = readl_relaxed(config_regs + addr) & ~value;
>> -               writel_relaxed(reg, config_regs + addr);
>> -       }
>> -
>> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>> -       if (value) {
>> -               reg = readl_relaxed(config_regs + addr) & ~value;
>> -               writel_relaxed(reg, config_regs + addr);
>> -       }
>> -}
>> -EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>> -
>> -static int mtk_mmsys_probe(struct platform_device *pdev)
>> -{
>> -       const struct mtk_mmsys_driver_data *data;
>> -       struct device *dev = &pdev->dev;
>> -       struct platform_device *clks;
>> -       struct platform_device *drm;
>> -       void __iomem *config_regs;
>> -       int ret;
>> -
>> -       config_regs = devm_platform_ioremap_resource(pdev, 0);
>> -       if (IS_ERR(config_regs)) {
>> -               ret = PTR_ERR(config_regs);
>> -               dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
>> -               return ret;
>> -       }
>> -
>> -       platform_set_drvdata(pdev, config_regs);
>> -
>> -       data = of_device_get_match_data(&pdev->dev);
>> -
>> -       clks = platform_device_register_data(&pdev->dev, data->clk_driver,
>> -                                            PLATFORM_DEVID_AUTO, NULL, 0);
>> -       if (IS_ERR(clks))
>> -               return PTR_ERR(clks);
>> -
>> -       drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>> -                                           PLATFORM_DEVID_AUTO, NULL, 0);
>> -       if (IS_ERR(drm)) {
>> -               platform_device_unregister(clks);
>> -               return PTR_ERR(drm);
>> -       }
>> -
>> -       return 0;
>> -}
>> -
>> -static const struct of_device_id of_match_mtk_mmsys[] = {
>> -       {
>> -               .compatible = "mediatek,mt2701-mmsys",
>> -               .data = &mt2701_mmsys_driver_data,
>> -       },
>> -       {
>> -               .compatible = "mediatek,mt2712-mmsys",
>> -               .data = &mt2712_mmsys_driver_data,
>> -       },
>> -       {
>> -               .compatible = "mediatek,mt6779-mmsys",
>> -               .data = &mt6779_mmsys_driver_data,
>> -       },
>> -       {
>> -               .compatible = "mediatek,mt6797-mmsys",
>> -               .data = &mt6797_mmsys_driver_data,
>> -       },
>> -       {
>> -               .compatible = "mediatek,mt8173-mmsys",
>> -               .data = &mt8173_mmsys_driver_data,
>> -       },
>> -       {
>> -               .compatible = "mediatek,mt8183-mmsys",
>> -               .data = &mt8183_mmsys_driver_data,
>> -       },
>> -       { }
>> -};
>> -
>> -static struct platform_driver mtk_mmsys_drv = {
>> -       .driver = {
>> -               .name = "mtk-mmsys",
>> -               .of_match_table = of_match_mtk_mmsys,
>> -       },
>> -       .probe = mtk_mmsys_probe,
>> -};
>> -
>> -builtin_platform_driver(mtk_mmsys_drv);
>> --
>> 1.8.1.1.dirty
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
