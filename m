Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5707C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XevMSrZR+TjMj+uR8dIvgjdDgfbe8hL2bW7iiMXmAKs=; b=EGXLROdCrTUYiJFyWtMCqmgyOb
	3EZ2zz7r6rC5H5xpsqN3u/XDI62eoKp5FPrI0Wad3KZBJRqHKKD6aP+PuY9NHlekrZyOMEp123GUk
	rfUBX5WUQ/6jFsCVIbD6GjDEt6Xn1+77YdNl/50DC23BflgtpVylAy5SgWASwaBDstQzaBWJDOA4/
	SsZ5ekoOC+3q8zYYODJNVx0VXH4eZIMlkPBaelbW8W+4abdkwr6hWWpCJF65Z9qKA2QMqI2lvR2pa
	9yZ9kjoawGTwdJcbf9x7UVKjXrZpm4N4AwgbRKO5+12CwUem4e174JbsLAJXvKxQKLg5llPRrpWal
	trb2UU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Rl2-000000035bC-1CU6;
	Mon, 29 Apr 2024 14:13:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Rky-000000035aX-2hYB;
	Mon, 29 Apr 2024 14:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38B0FCE0BB1;
	Mon, 29 Apr 2024 14:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06CDC113CD;
	Mon, 29 Apr 2024 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714400001;
	bh=618JHK33NfWpe17uC+zkMyziNzW0BIM5OKg4SY19Z4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pRi/v7m69mn8YjGwqv5JxC0uIfVArly6v1eFC5p2vwvEERWe47HOeeZv9VFHvg8oy
	 ceOoJLDgAWB8NlyggIdoUfXpf1IdFvvdtvX1xqGlhs1ymXqGrJuILz5ZgDqb/Tb3uY
	 cZZTFB3BZ5736Z9/wwc0OD55Qg+f7JhJakp3ufd5XubEM8sNCYpUvY+OdBrmc1F0T2
	 STml+I0UGIK4YMkQHmzKPdt4RdL/3i3OfBUfYRSkK0yPNlS4aKkoq9NQ9oR09J5mbx
	 mrMxE6GeYQQOG68nIxBIaH1GiHVidZGwFgN8xHiWQcfe93DuacfCx8pjkSOFPVG1Co
	 8ieLALYIWNNMQ==
Message-ID: <c3531f5f-7aaa-4363-8bfe-ac90521d7a0e@kernel.org>
Date: Mon, 29 Apr 2024 17:13:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] soc: mediatek: Add MediaTek DVFS Resource
 Collector (DVFSRC) driver
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 keescook@chromium.org, gustavoars@kernel.org, henryc.chen@mediatek.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, amergnat@baylibre.com,
 Dawei Chien <dawei.chien@mediatek.com>
References: <20240424095416.1105639-1-angelogioacchino.delregno@collabora.com>
 <20240424095416.1105639-5-angelogioacchino.delregno@collabora.com>
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20240424095416.1105639-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_071325_263096_957A8072 
X-CRM114-Status: GOOD (  17.60  )
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

On 24.04.24 12:54, AngeloGioacchino Del Regno wrote:
> The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
> Hardware module used to collect all the requests from both software and the
> various remote processors embedded into the SoC and decide about a minimum
> operating voltage and a minimum DRAM frequency to fulfill those requests in
> an effort to provide the best achievable performance per watt.
> 
> This hardware IP is capable of transparently performing direct register R/W
> on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> 
> This driver includes support for MT8183, MT8192 and MT8195.
> 
> Co-Developed-by: Dawei Chien <dawei.chien@mediatek.com>
> [Angelo: Partial refactoring and cleanups]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks for reviving this patchset!

> ---
>   drivers/soc/mediatek/Kconfig             |  11 +
>   drivers/soc/mediatek/Makefile            |   1 +
>   drivers/soc/mediatek/mtk-dvfsrc.c        | 551 +++++++++++++++++++++++
>   include/linux/soc/mediatek/dvfsrc.h      |  36 ++
>   include/linux/soc/mediatek/mtk_sip_svc.h |   3 +
>   5 files changed, 602 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
>   create mode 100644 include/linux/soc/mediatek/dvfsrc.h
> 
[..]
> +++ b/drivers/soc/mediatek/mtk-dvfsrc.c
> @@ -0,0 +1,551 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Copyright (c) 2024 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/bitfield.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/dvfsrc.h>
> +#include <linux/soc/mediatek/mtk_sip_svc.h>
> +
> +/* DVFSRC_LEVEL */
> +#define DVFSRC_V1_LEVEL_TARGET_LEVEL	GENMASK(15, 0)
> +#define DVFSRC_TGT_LEVEL_IDLE		0x00
> +#define DVFSRC_V1_LEVEL_CURRENT_LEVEL	GENMASK(31, 16)
> +
> +/* DVFSRC_SW_REQ, DVFSRC_SW_REQ2 */
> +#define DVFSRC_V1_SW_REQ2_DRAM_LEVEL	GENMASK(1, 0)
> +#define DVFSRC_V1_SW_REQ2_VCORE_LEVEL	GENMASK(3, 2)
> +
> +#define DVFSRC_V2_SW_REQ_DRAM_LEVEL	GENMASK(3, 0)
> +#define DVFSRC_V2_SW_REQ_VCORE_LEVEL	GENMASK(6, 4)
> +
> +/* DVFSRC_VCORE */
> +#define DVFSRC_V2_VCORE_REQ_VSCP_LEVEL	GENMASK(14, 12)
> +
> +#define KBPS_TO_MBPS(x)			((x) / 1000)
> +
> +#define DVFSRC_POLL_TIMEOUT_US		1000
> +#define STARTUP_TIME_US			1
> +
> +#define MTK_SIP_DVFSRC_INIT		0x0
> +#define MTK_SIP_DVFSRC_START		0x1
> +
> +struct dvfsrc_bw_constraints {
> +	u16 max_dram_nom_bw;
> +	u16 max_dram_peak_bw;
> +	u16 max_dram_hrt_bw;
> +};
> +
> +struct dvfsrc_opp {
> +	u32 vcore_opp;
> +	u32 dram_opp;
> +};
> +
> +struct dvfsrc_opp_desc {
> +	const struct dvfsrc_opp *opps;
> +	u32 num_opp;
> +};
> +
> +struct dvfsrc_soc_data;
> +struct mtk_dvfsrc {
> +	struct device *dev;
> +	struct platform_device *icc;
> +	struct platform_device *regulator;
> +	const struct dvfsrc_soc_data *dvd;
> +	const struct dvfsrc_opp_desc *curr_opps;
> +	void __iomem *regs;
> +	int dram_type;
> +};
> +
> +struct dvfsrc_soc_data {
> +	const int *regs;
> +	const struct dvfsrc_opp_desc *opps_desc;
> +	u32 (*get_target_level)(struct mtk_dvfsrc *dvfsrc);
> +	u32 (*get_current_level)(struct mtk_dvfsrc *dvfsrc);
> +	u32 (*get_vcore_level)(struct mtk_dvfsrc *dvfsrc);
> +	u32 (*get_vscp_level)(struct mtk_dvfsrc *dvfsrc);
> +	void (*set_dram_bw)(struct mtk_dvfsrc *dvfsrc, u64 bw);
> +	void (*set_dram_peak_bw)(struct mtk_dvfsrc *dvfsrc, u64 bw);
> +	void (*set_dram_hrt_bw)(struct mtk_dvfsrc *dvfsrc, u64 bw);
> +	void (*set_opp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
> +	void (*set_vcore_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
> +	void (*set_vscp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
> +	int (*wait_for_opp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
> +	int (*wait_for_vcore_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
> +	const struct dvfsrc_bw_constraints *bw_constraints;
> +};
> +
> +static u32 dvfsrc_readl(struct mtk_dvfsrc *dvfs, u32 offset)
> +{
> +	return readl(dvfs->regs + dvfs->dvd->regs[offset]);
> +}
> +
> +static void dvfsrc_writel(struct mtk_dvfsrc *dvfs, u32 offset, u32 val)
> +{
> +	writel(val, dvfs->regs + dvfs->dvd->regs[offset]);
> +}
> +
> +#define dvfsrc_rmw(dvfs, offset, val, mask, shift) \
> +	dvfsrc_writel(dvfs, offset, \
> +		(dvfsrc_readl(dvfs, offset) & ~(mask << shift)) | (val << shift))

Nit: The above macro seems unused?

BR,
Georgi

> +enum dvfsrc_regs {
> +	DVFSRC_SW_REQ,
> +	DVFSRC_SW_REQ2,
> +	DVFSRC_LEVEL,
> +	DVFSRC_TARGET_LEVEL,
> +	DVFSRC_SW_BW,
> +	DVFSRC_SW_PEAK_BW,
> +	DVFSRC_SW_HRT_BW,
> +	DVFSRC_VCORE,
> +	DVFSRC_REGS_MAX,
> +};
> +


