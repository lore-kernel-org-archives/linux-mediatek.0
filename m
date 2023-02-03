Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2B2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 10:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mNPM59NZfPt74XCdMSNUxhGoNpm0PDUHgH4apSJc+Y=; b=x/JKfUAem98LcIfaPIEoBmBQnh
	rzWeKqrmKcWLeS2jcRKtkxwuzxnRiViGhP8P3gfD3rmcz4ay/sDMh4GDHUXSa8LX8ZYHX8TMJOHB6
	fQZ1oWVvMgUGXAyaYl8724NlwT6V4N6kFEQFaCwvFW+u/lHsHv38WaiLoD1O+O65HBF81LpYpNQpS
	yIM6W/otSn81sm2tPqndanG1gvEABR+eco4T+2l8vfgT30JTtibkU4Lj2wp6pIjEhzwy58+XQw7Dg
	CeQt4Cx0bNE8sUJ965+a2DbmRYaU+C+0utxPttoIenDqd01ztevUVFFvEKJg6rCI0izTNRrPXJK+I
	vBT1TPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtdN-001Sm4-Jv; Fri, 03 Feb 2023 10:49:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtd8-001Sb1-C0; Fri, 03 Feb 2023 10:49:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A41A26602DD9;
	Fri,  3 Feb 2023 10:49:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675421353;
	bh=OEAlKXvNZbN7zCP3R26EWPKYcVOYNKvfqjU+fbC8Rxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ex4Gihtt0x0Mr8GaRT/cRrDvvvv79EE8h/QBWXa7GxQfagDXi19/r260L7hcuAhM1
	 0Ub1fZhz0NjX/m6nxxoCV0CK67ZRDTaMbcUMDRM3KkmEzd515O3Hu8l+lY5HZfPJkz
	 OlEXt5PYDIt1Ud12NTg2PChrFPsZmQpKZLWwltPZHRVSml8S0MuoEuIiFrzVp539pF
	 5lJWOHEHjHsOavqRYXRVLm6Py/3SFi5wAMvEPHuV33dxxTa8WcQt9uSymA6zQpF6cO
	 jB/+defNk0H4pRN3VDZ9tadpp8CiGjz3pWCs6rxrMOfFNl3VWZxMfzLOl8JmVz97Mg
	 GuHZW44JsBqtA==
Message-ID: <76f33f1f-53ab-65a9-f6e8-23db4ca0e0b5@collabora.com>
Date: Fri, 3 Feb 2023 11:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 12/19] clk: mediatek: Add MT8188 vdosys0 clock support
To: Chen-Yu Tsai <wenst@chromium.org>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
 <20230119124848.26364-13-Garmin.Chang@mediatek.com>
 <CAGXv+5Fysy4iCvHEXWtf5oXCHkaKezPqcrGd8QzhnaTrYdyecA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Fysy4iCvHEXWtf5oXCHkaKezPqcrGd8QzhnaTrYdyecA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_024918_716644_B69FE869 
X-CRM114-Status: GOOD (  20.31  )
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

Il 03/02/23 08:19, Chen-Yu Tsai ha scritto:
> On Thu, Jan 19, 2023 at 8:54 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>>
>> Add MT8188 vdosys0 clock controller which provides clock gate
>> control in video system. This is integrated with mtk-mmsys
>> driver which will populate device by platform_device_register_data
>> to start vdosys clock driver.
>>
>> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
>> ---
>>   drivers/clk/mediatek/Makefile          |   3 +-
>>   drivers/clk/mediatek/clk-mt8188-vdo0.c | 134 +++++++++++++++++++++++++
>>   2 files changed, 136 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo0.c
>>
>> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
>> index 7d09e9fc6538..df78c0777fef 100644
>> --- a/drivers/clk/mediatek/Makefile
>> +++ b/drivers/clk/mediatek/Makefile
>> @@ -86,7 +86,8 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
>>   obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>>                                     clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>>                                     clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
>> -                                  clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o
>> +                                  clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
>> +                                  clk-mt8188-vdo0.o
>>   obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>>   obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>>   obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
>> diff --git a/drivers/clk/mediatek/clk-mt8188-vdo0.c b/drivers/clk/mediatek/clk-mt8188-vdo0.c
>> new file mode 100644
>> index 000000000000..30dd64374ace
>> --- /dev/null
>> +++ b/drivers/clk/mediatek/clk-mt8188-vdo0.c
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright (c) 2022 MediaTek Inc.
>> +// Author: Garmin Chang <garmin.chang@mediatek.com>
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include <dt-bindings/clock/mediatek,mt8188-clk.h>
>> +
>> +#include "clk-gate.h"
>> +#include "clk-mtk.h"
>> +
>> +static const struct mtk_gate_regs vdo0_0_cg_regs = {
>> +       .set_ofs = 0x104,
>> +       .clr_ofs = 0x108,
>> +       .sta_ofs = 0x100,
>> +};
>> +
>> +static const struct mtk_gate_regs vdo0_1_cg_regs = {
>> +       .set_ofs = 0x114,
>> +       .clr_ofs = 0x118,
>> +       .sta_ofs = 0x110,
>> +};
>> +
>> +static const struct mtk_gate_regs vdo0_2_cg_regs = {
>> +       .set_ofs = 0x124,
>> +       .clr_ofs = 0x128,
>> +       .sta_ofs = 0x120,
>> +};
>> +
>> +#define GATE_VDO0_0(_id, _name, _parent, _shift)                       \
>> +       GATE_MTK(_id, _name, _parent, &vdo0_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
>> +
>> +#define GATE_VDO0_1(_id, _name, _parent, _shift)                       \
>> +       GATE_MTK(_id, _name, _parent, &vdo0_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
>> +
>> +#define GATE_VDO0_2(_id, _name, _parent, _shift)                       \
>> +       GATE_MTK(_id, _name, _parent, &vdo0_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
>> +
>> +#define GATE_VDO0_2_FLAGS(_id, _name, _parent, _shift, _flags)         \
>> +       GATE_MTK_FLAGS(_id, _name, _parent, &vdo0_2_cg_regs, _shift,    \
>> +       &mtk_clk_gate_ops_setclr, _flags)
>> +
>> +static const struct mtk_gate vdo0_clks[] = {
>> +       /* VDO0_0 */
>> +       GATE_VDO0_0(CLK_VDO0_DISP_OVL0, "vdo0_disp_ovl0", "top_vpp", 0),
>> +       GATE_VDO0_0(CLK_VDO0_FAKE_ENG0, "vdo0_fake_eng0", "top_vpp", 2),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_CCORR0, "vdo0_disp_ccorr0", "top_vpp", 4),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_MUTEX0, "vdo0_disp_mutex0", "top_vpp", 6),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_GAMMA0, "vdo0_disp_gamma0", "top_vpp", 8),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_DITHER0, "vdo0_disp_dither0", "top_vpp", 10),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_WDMA0, "vdo0_disp_wdma0", "top_vpp", 17),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_RDMA0, "vdo0_disp_rdma0", "top_vpp", 19),
>> +       GATE_VDO0_0(CLK_VDO0_DSI0, "vdo0_dsi0", "top_vpp", 21),
>> +       GATE_VDO0_0(CLK_VDO0_DSI1, "vdo0_dsi1", "top_vpp", 22),
>> +       GATE_VDO0_0(CLK_VDO0_DSC_WRAP0, "vdo0_dsc_wrap0", "top_vpp", 23),
>> +       GATE_VDO0_0(CLK_VDO0_VPP_MERGE0, "vdo0_vpp_merge0", "top_vpp", 24),
>> +       GATE_VDO0_0(CLK_VDO0_DP_INTF0, "vdo0_dp_intf0", "top_vpp", 25),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_AAL0, "vdo0_disp_aal0", "top_vpp", 26),
>> +       GATE_VDO0_0(CLK_VDO0_INLINEROT0, "vdo0_inlinerot0", "top_vpp", 27),
>> +       GATE_VDO0_0(CLK_VDO0_APB_BUS, "vdo0_apb_bus", "top_vpp", 28),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_COLOR0, "vdo0_disp_color0", "top_vpp", 29),
>> +       GATE_VDO0_0(CLK_VDO0_MDP_WROT0, "vdo0_mdp_wrot0", "top_vpp", 30),
>> +       GATE_VDO0_0(CLK_VDO0_DISP_RSZ0, "vdo0_disp_rsz0", "top_vpp", 31),
>> +       /* VDO0_1 */
>> +       GATE_VDO0_1(CLK_VDO0_DISP_POSTMASK0, "vdo0_disp_postmask0", "top_vpp", 0),
>> +       GATE_VDO0_1(CLK_VDO0_FAKE_ENG1, "vdo0_fake_eng1", "top_vpp", 1),
>> +       GATE_VDO0_1(CLK_VDO0_DL_ASYNC2, "vdo0_dl_async2", "top_vpp", 5),
>> +       GATE_VDO0_1(CLK_VDO0_DL_RELAY3, "vdo0_dl_relay3", "top_vpp", 6),
>> +       GATE_VDO0_1(CLK_VDO0_DL_RELAY4, "vdo0_dl_relay4", "top_vpp", 7),
>> +       GATE_VDO0_1(CLK_VDO0_SMI_GALS, "vdo0_smi_gals", "top_vpp", 10),
>> +       GATE_VDO0_1(CLK_VDO0_SMI_COMMON, "vdo0_smi_common", "top_vpp", 11),
>> +       GATE_VDO0_1(CLK_VDO0_SMI_EMI, "vdo0_smi_emi", "top_vpp", 12),
>> +       GATE_VDO0_1(CLK_VDO0_SMI_IOMMU, "vdo0_smi_iommu", "top_vpp", 13),
>> +       GATE_VDO0_1(CLK_VDO0_SMI_LARB, "vdo0_smi_larb", "top_vpp", 14),
>> +       GATE_VDO0_1(CLK_VDO0_SMI_RSI, "vdo0_smi_rsi", "top_vpp", 15),
>> +       /* VDO0_2 */
>> +       GATE_VDO0_2(CLK_VDO0_DSI0_DSI, "vdo0_dsi0_dsi", "top_dsi_occ", 0),
>> +       GATE_VDO0_2(CLK_VDO0_DSI1_DSI, "vdo0_dsi1_dsi", "top_dsi_occ", 8),
>> +       GATE_VDO0_2_FLAGS(CLK_VDO0_DP_INTF0_DP_INTF, "vdo0_dp_intf0_dp_intf",
>> +               "top_edp", 16, CLK_SET_RATE_PARENT),
>> +};
>> +
>> +static int clk_mt8188_vdo0_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *node = dev->parent->of_node;
>> +       struct clk_hw_onecell_data *clk_data;
>> +       int r;
>> +
>> +       clk_data = mtk_alloc_clk_data(CLK_VDO0_NR_CLK);
>> +       if (!clk_data)
>> +               return -ENOMEM;
>> +
>> +       r = mtk_clk_register_gates(node, vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
> 
> This API was changed. Please rebase onto the latest -next and update.
> 
> Angelo (CC-ed) also mentioned a new simple probe variant for non-DT
> clock drivers is being developed. He didn't mention a timeline though.

I've already tested the new simple probe variant for non-DT clock drivers and
it works fine on MT8173, MT8192 and MT8195.

Timeline - I should be able to push the part 2 series next week, which will include
more conversion to simple probe and almost all clock drivers changed to allow
building as modules.

Cheers,
Angelo


