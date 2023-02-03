Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B6BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xH/JOB8zU8En813IYu3xj+q4Gm5xLusFrx2yI+U6Vw=; b=YdpYWzPRSaVk1LeALMvYM7M9F9
	ztRntTDsqb58PI9y1dOk4KxH6yTbldAcE32Tu9YPtEY+uK1eD1qTwLuL3oh/ZLm9LgEWWIuh/gIL9
	jBR60uWOIKBDZChsPqYuVJiMoPNHvNHBlc92so47/PUcnZkWB8eJwuVC9a6TPeHEMiMag0Hv/LVwX
	skInh8d+D6gMH/gNSeXgBAckvCvbOPl00AACVUApSls6A493aRKUkUueYu2j4ONpjQFRYM/NAk56Q
	r58Mah3URYSzlPjZVO1BWFOeoWYiS3MgBA8sqAxA2+mrgkZYN1MA9aKnCWDmb9ZRFbEyqpHQl7NiW
	pEgkwNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqPX-000mF0-Kq; Fri, 03 Feb 2023 07:23:03 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqPM-000mCS-85
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:22:55 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id bs10so2153671vkb.3
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xH/JOB8zU8En813IYu3xj+q4Gm5xLusFrx2yI+U6Vw=;
        b=CudXJU5MaF56CJCDdLED5+Z8mpV+dLvedI1Mdzn/1BZOADwfHYATooLXrETTFkhJZJ
         r8dNzRa6Nw+D+zMCI+zIQeYYgEvsafsE4X3iEeHyk0BhVJ4Xn+OpnrCFrIS9BBe7fgmJ
         dLGiaBKt67z/csygXYjO0TKDKQuPSsYLZwhZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xH/JOB8zU8En813IYu3xj+q4Gm5xLusFrx2yI+U6Vw=;
        b=w6k/IpO78SFLl1PVBD08lAf/H88IVA1J/Mxp4weHrylXIzncjKnCovft4CDhZ6ZB8P
         LdAR1W4bs5UASndSmQ/4B8BdIA5dbtppZCBLIAlJTvipm88zSD1z0QuwaSNpdrSnjb3a
         ksVh1JMb0PMeQ6qfs+OX6nFleK7banubcgwPbAltbId3hhrNrOfucU18mdgUVSTGGF86
         uFODp1FZa8KKABl8Mdf+0jR5iAGld8WXxOMj2/nfgzD7w7LNt9LyaGuQd18/jRFu1NGN
         H7tvfrpGPpOGeVP4GZmZ2kR+yfDrPDzUp+5CYHSg/6wiznb5q/nIhzhcFn+ioYdG7l3w
         nKcg==
X-Gm-Message-State: AO0yUKVZAwWQP0q3obgcrolnsyqpuMedmUfqLAiGcuMfcm6AlbzH+0rV
	Vel1KQOQjnLkG7mQhbxWPZwM2OR9L3SicVfrvGsWAA==
X-Google-Smtp-Source: AK7set9o0b7uOZGrGHb7Kvt/z3n60+DITe12npoh/JV0Z+TzPU/Gen75rB8uEzIL3NwFkJlDVHS4sR3k/P7LNeGXqKQ=
X-Received: by 2002:a05:6122:139:b0:3e1:a2f7:8b2a with SMTP id
 a25-20020a056122013900b003e1a2f78b2amr1365892vko.18.1675408970039; Thu, 02
 Feb 2023 23:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-14-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-14-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:22:39 +0800
Message-ID: <CAGXv+5Ei7RX1MRnf=kie+Xm6Q7X7uD0UUML5FFSBVqeaxwpfdQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] clk: mediatek: Add MT8188 vdosys1 clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_232252_296773_C3E11C00 
X-CRM114-Status: GOOD (  24.33  )
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

On Thu, Jan 19, 2023 at 8:51 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 vdosys1 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile          |   2 +-
>  drivers/clk/mediatek/clk-mt8188-vdo1.c | 181 +++++++++++++++++++++++++
>  2 files changed, 182 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo1.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index df78c0777fef..c654f4288e09 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -87,7 +87,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
>                                    clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>                                    clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
>                                    clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
> -                                  clk-mt8188-vdo0.o
> +                                  clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-vdo1.c b/drivers/clk/mediatek/clk-mt8188-vdo1.c
> new file mode 100644
> index 000000000000..be658c6a95bf
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-vdo1.c
> @@ -0,0 +1,181 @@
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
> +static const struct mtk_gate_regs vdo1_0_cg_regs = {
> +       .set_ofs = 0x104,
> +       .clr_ofs = 0x108,
> +       .sta_ofs = 0x100,
> +};
> +
> +static const struct mtk_gate_regs vdo1_1_cg_regs = {
> +       .set_ofs = 0x114,
> +       .clr_ofs = 0x118,
> +       .sta_ofs = 0x110,
> +};
> +
> +static const struct mtk_gate_regs vdo1_2_cg_regs = {
> +       .set_ofs = 0x124,
> +       .clr_ofs = 0x128,
> +       .sta_ofs = 0x120,
> +};
> +
> +static const struct mtk_gate_regs vdo1_3_cg_regs = {
> +       .set_ofs = 0x134,
> +       .clr_ofs = 0x138,
> +       .sta_ofs = 0x130,
> +};
> +
> +static const struct mtk_gate_regs vdo1_4_cg_regs = {
> +       .set_ofs = 0x144,
> +       .clr_ofs = 0x148,
> +       .sta_ofs = 0x140,
> +};
> +
> +#define GATE_VDO1_0(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO1_1(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vdo1_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO1_2(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vdo1_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO1_3(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO1_3_FLAGS(_id, _name, _parent, _shift, _flags)         \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &vdo1_3_cg_regs, _shift,    \
> +                      &mtk_clk_gate_ops_setclr, _flags)

You could reverse GATE_VDO1_3 and GATE_VDO1_3_FLAGS, and then define
GATE_VDO1_3 with GATE_VDO1_3_FLAGS. You could do the same for vdosys0
driver as well.

> +#define GATE_VDO1_4(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate vdo1_clks[] = {
> +       /* VDO1_0 */
> +       GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
> +       GATE_VDO1_0(CLK_VDO1_SMI_LARB3, "vdo1_smi_larb3", "top_vpp", 1),
> +       GATE_VDO1_0(CLK_VDO1_GALS, "vdo1_gals", "top_vpp", 2),
> +       GATE_VDO1_0(CLK_VDO1_FAKE_ENG0, "vdo1_fake_eng0", "top_vpp", 3),
> +       GATE_VDO1_0(CLK_VDO1_FAKE_ENG1, "vdo1_fake_eng1", "top_vpp", 4),
> +       GATE_VDO1_0(CLK_VDO1_MDP_RDMA0, "vdo1_mdp_rdma0", "top_vpp", 5),
> +       GATE_VDO1_0(CLK_VDO1_MDP_RDMA1, "vdo1_mdp_rdma1", "top_vpp", 6),
> +       GATE_VDO1_0(CLK_VDO1_MDP_RDMA2, "vdo1_mdp_rdma2", "top_vpp", 7),
> +       GATE_VDO1_0(CLK_VDO1_MDP_RDMA3, "vdo1_mdp_rdma3", "top_vpp", 8),
> +       GATE_VDO1_0(CLK_VDO1_VPP_MERGE0, "vdo1_vpp_merge0", "top_vpp", 9),
> +       GATE_VDO1_0(CLK_VDO1_VPP_MERGE1, "vdo1_vpp_merge1", "top_vpp", 10),
> +       GATE_VDO1_0(CLK_VDO1_VPP_MERGE2, "vdo1_vpp_merge2", "top_vpp", 11),
> +       /* VDO1_1 */
> +       GATE_VDO1_1(CLK_VDO1_VPP_MERGE3, "vdo1_vpp_merge3", "top_vpp", 0),
> +       GATE_VDO1_1(CLK_VDO1_VPP_MERGE4, "vdo1_vpp_merge4", "top_vpp", 1),
> +       GATE_VDO1_1(CLK_VDO1_VPP2_TO_VDO1_DL_ASYNC, "vdo1_vpp2_to_vdo1_dl_async", "top_vpp", 2),
> +       GATE_VDO1_1(CLK_VDO1_VPP3_TO_VDO1_DL_ASYNC, "vdo1_vpp3_to_vdo1_dl_async", "top_vpp", 3),
> +       GATE_VDO1_1(CLK_VDO1_DISP_MUTEX, "vdo1_disp_mutex", "top_vpp", 4),
> +       GATE_VDO1_1(CLK_VDO1_MDP_RDMA4, "vdo1_mdp_rdma4", "top_vpp", 5),
> +       GATE_VDO1_1(CLK_VDO1_MDP_RDMA5, "vdo1_mdp_rdma5", "top_vpp", 6),
> +       GATE_VDO1_1(CLK_VDO1_MDP_RDMA6, "vdo1_mdp_rdma6", "top_vpp", 7),
> +       GATE_VDO1_1(CLK_VDO1_MDP_RDMA7, "vdo1_mdp_rdma7", "top_vpp", 8),
> +       GATE_VDO1_1(CLK_VDO1_DP_INTF0_MMCK, "vdo1_dp_intf0_mmck", "top_vpp", 9),
> +       GATE_VDO1_1(CLK_VDO1_DPI0_MM, "vdo1_dpi0_mm_ck", "top_vpp", 10),
> +       GATE_VDO1_1(CLK_VDO1_DPI1_MM, "vdo1_dpi1_mm_ck", "top_vpp", 11),
> +       GATE_VDO1_1(CLK_VDO1_MERGE0_DL_ASYNC, "vdo1_merge0_dl_async", "top_vpp", 13),
> +       GATE_VDO1_1(CLK_VDO1_MERGE1_DL_ASYNC, "vdo1_merge1_dl_async", "top_vpp", 14),
> +       GATE_VDO1_1(CLK_VDO1_MERGE2_DL_ASYNC, "vdo1_merge2_dl_async", "top_vpp", 15),
> +       GATE_VDO1_1(CLK_VDO1_MERGE3_DL_ASYNC, "vdo1_merge3_dl_async", "top_vpp", 16),
> +       GATE_VDO1_1(CLK_VDO1_MERGE4_DL_ASYNC, "vdo1_merge4_dl_async", "top_vpp", 17),
> +       GATE_VDO1_1(CLK_VDO1_DSC_VDO1_DL_ASYNC, "vdo1_dsc_vdo1_dl_async", "top_vpp", 18),
> +       GATE_VDO1_1(CLK_VDO1_MERGE_VDO1_DL_ASYNC, "vdo1_merge_vdo1_dl_async", "top_vpp", 19),
> +       GATE_VDO1_1(CLK_VDO1_PADDING0, "vdo1_padding0", "top_vpp", 20),
> +       GATE_VDO1_1(CLK_VDO1_PADDING1, "vdo1_padding1", "top_vpp", 21),
> +       GATE_VDO1_1(CLK_VDO1_PADDING2, "vdo1_padding2", "top_vpp", 22),
> +       GATE_VDO1_1(CLK_VDO1_PADDING3, "vdo1_padding3", "top_vpp", 23),
> +       GATE_VDO1_1(CLK_VDO1_PADDING4, "vdo1_padding4", "top_vpp", 24),
> +       GATE_VDO1_1(CLK_VDO1_PADDING5, "vdo1_padding5", "top_vpp", 25),
> +       GATE_VDO1_1(CLK_VDO1_PADDING6, "vdo1_padding6", "top_vpp", 26),
> +       GATE_VDO1_1(CLK_VDO1_PADDING7, "vdo1_padding7", "top_vpp", 27),
> +       GATE_VDO1_1(CLK_VDO1_DISP_RSZ0, "vdo1_disp_rsz0", "top_vpp", 28),
> +       GATE_VDO1_1(CLK_VDO1_DISP_RSZ1, "vdo1_disp_rsz1", "top_vpp", 29),
> +       GATE_VDO1_1(CLK_VDO1_DISP_RSZ2, "vdo1_disp_rsz2", "top_vpp", 30),
> +       GATE_VDO1_1(CLK_VDO1_DISP_RSZ3, "vdo1_disp_rsz3", "top_vpp", 31),
> +       /* VDO1_2 */
> +       GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE0, "vdo1_hdr_vdo_fe0", "top_vpp", 0),
> +       GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE0, "vdo1_hdr_gfx_fe0", "top_vpp", 1),
> +       GATE_VDO1_2(CLK_VDO1_HDR_VDO_BE, "vdo1_hdr_vdo_be", "top_vpp", 2),
> +       GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE1, "vdo1_hdr_vdo_fe1", "top_vpp", 16),
> +       GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE1, "vdo1_hdr_gfx_fe1", "top_vpp", 17),
> +       GATE_VDO1_2(CLK_VDO1_DISP_MIXER, "vdo1_disp_mixer", "top_vpp", 18),
> +       GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE0_DL_ASYNC, "vdo1_hdr_vdo_fe0_dl_async", "top_vpp", 19),
> +       GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE1_DL_ASYNC, "vdo1_hdr_vdo_fe1_dl_async", "top_vpp", 20),
> +       GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE0_DL_ASYNC, "vdo1_hdr_gfx_fe0_dl_async", "top_vpp", 21),
> +       GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE1_DL_ASYNC, "vdo1_hdr_gfx_fe1_dl_async", "top_vpp", 22),
> +       GATE_VDO1_2(CLK_VDO1_HDR_VDO_BE_DL_ASYNC, "vdo1_hdr_vdo_be_dl_async", "top_vpp", 23),
> +       /* VDO1_3 */
> +       GATE_VDO1_3(CLK_VDO1_DPI0, "vdo1_dpi0_ck", "top_vpp", 0),
> +       GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPI0, "vdo1_disp_monitor_dpi0_ck", "top_vpp", 1),
> +       GATE_VDO1_3(CLK_VDO1_DPI1, "vdo1_dpi1_ck", "top_vpp", 8),
> +       GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPI1, "vdo1_disp_monitor_dpi1_ck", "top_vpp", 9),
> +       GATE_VDO1_3_FLAGS(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_dp", 16, CLK_SET_RATE_PARENT),
> +       GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf_ck", "top_vpp", 17),
> +       /* VDO1_4 */
> +       GATE_VDO1_4(CLK_VDO1_26M_SLOW, "vdo1_26m_slow_ck", "clk26m", 8),
> +};
> +
> +static int clk_mt8188_vdo1_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_hw_onecell_data *clk_data;
> +       int r;
> +
> +       clk_data = mtk_alloc_clk_data(CLK_VDO1_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r = mtk_clk_register_gates(node, vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);

Same as vdosys0 patch, this API was changed and the usage here needs to
be updated.

ChenYu

> +       if (r)
> +               goto free_vdo1_data;
> +
> +       r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +       if (r)
> +               goto unregister_gates;
> +
> +       platform_set_drvdata(pdev, clk_data);
> +
> +       return r;
> +
> +unregister_gates:
> +       mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
> +free_vdo1_data:
> +       mtk_free_clk_data(clk_data);
> +       return r;
> +}
> +
> +static int clk_mt8188_vdo1_remove(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +       of_clk_del_provider(node);
> +       mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
> +       mtk_free_clk_data(clk_data);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver clk_mt8188_vdo1_drv = {
> +       .probe = clk_mt8188_vdo1_probe,
> +       .remove = clk_mt8188_vdo1_remove,
> +       .driver = {
> +               .name = "clk-mt8188-vdo1",
> +       },
> +};
> +builtin_platform_driver(clk_mt8188_vdo1_drv);
> --
> 2.18.0
>
>

