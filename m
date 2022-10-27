Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF0C67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLKfya7jF5oZzVR95qYngYqVmABk/nBEHRJFBItDdyo=; b=RfQ4LNu3J91x+vIyDo8rNMG9Bi
	+eFxEjJAJQ7QepACN3mf5W+81pQP+7lVYT/7yxHxQ0Fh8fJ5Rrvbt4xRVe9eHMZ4QM4N8pzYK4RqR
	3lfFgs6A2fIprLCnst229QTzcb/OomqvlVdRSwdtOCvAhcIgAhd3n9UTmBbpe1YehElwVw+uQWEby
	JmGtyQs348PEUoFOt6n5NK1pddRBy499/40YavzqxfQnuK6Kq64mAAJ9YpafkvsbZOsLiql4rRmBu
	/+yGU1d3au72XbmUAAXj8NFxyYYLNhwNtcE5Dp9sA4wU0dx79hDL1zky7G1Bw4o/ZCLZIF5oSipZf
	F1c/wn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onyB8-00CNDB-1q; Thu, 27 Oct 2022 08:23:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onyAu-00CN7X-2m; Thu, 27 Oct 2022 08:23:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4649D66028BE;
	Thu, 27 Oct 2022 09:23:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666859018;
	bh=/jwDS3QbZfRcGewQkh8GqK9+PG6pPsrzVesZzj+NEmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cAgm1JQUQTkRnNBO0wZLz88LKPBhm1qnScqLHK1J/ZaInJ6Y+p6tmsoYucfo/Y4h5
	 YGpSUdmRgMW39PA2Q4nxb+wZhyyyUmZ4gSXvir8PY4thQBBD7mDfiWl5ScItMwxFIx
	 faHIjNSLU8TfbJsa5rKAJ6NKN5fLEzZweKAM7aaP1c0mhZLENPlXvYqnduzewNyuFa
	 l3409yBpDJrNHsUOEDybymGLJJjz7K9GRWtxTr3jsX4s0USOXoxAEa23maP6rzFgNm
	 p67wLTaL3Q4rtAijwUeQwurLDg8vnx3TFhtvJ48FYXzG9lcP480rBnEp8fN2e9Egpq
	 Su55dhTwuTayQ==
Message-ID: <5e71c0b1-d645-1900-282d-df7d13cc60f8@collabora.com>
Date: Thu, 27 Oct 2022 10:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 10/19] clk: mediatek: Add MT8188 mfgcfg clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221024094254.29218-1-Garmin.Chang@mediatek.com>
 <20221024094254.29218-11-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024094254.29218-11-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_012340_292520_AA2D54EA 
X-CRM114-Status: GOOD (  16.66  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/10/22 11:42, Garmin.Chang ha scritto:
> Add MT8188 mfg clock controller which provides clock gate
> control for GPU.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>   drivers/clk/mediatek/Makefile         |  2 +-
>   drivers/clk/mediatek/clk-mt8188-mfg.c | 50 +++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/clk/mediatek/clk-mt8188-mfg.c
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 21b05e880a3a..cd8870c28146 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -85,7 +85,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
>   obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>   				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>   				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
> -				   clk-mt8188-ipe.o
> +				   clk-mt8188-ipe.o clk-mt8188-mfg.o
>   obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>   obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>   obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-mfg.c b/drivers/clk/mediatek/clk-mt8188-mfg.c
> new file mode 100644
> index 000000000000..3a75cd7443fd
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-mfg.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Garmin Chang <garmin.chang@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +static const struct mtk_gate_regs mfgcfg_cg_regs = {
> +	.set_ofs = 0x4,
> +	.clr_ofs = 0x8,
> +	.sta_ofs = 0x0,
> +};
> +
> +#define GATE_MFGCFG(_id, _name, _parent, _shift)			\
> +	GATE_MTK(_id, _name, _parent, &mfgcfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate mfgcfg_clks[] = {
> +	GATE_MFGCFG(CLK_MFGCFG_BG3D, "mfgcfg_bg3d", "top_mfg_core_tmp", 0),
> +};

This will make it impossible to properly perform GPU DVFS.

Hint:

#define GATE_MFG(_id, _name, _parent, _shift)			\
	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs,	\
		       _shift, &mtk_clk_gate_ops_setclr,	\
		       CLK_SET_RATE_PARENT)

Regards,
Angelo



