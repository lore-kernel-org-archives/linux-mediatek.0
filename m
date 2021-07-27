Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E80C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE2F60FEE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFE2F60FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9iyXNlhnk7zyc03ilhSEx5DvY5D0K/z18G7ZHHx504=; b=GdDcWobTcrS9QG
	6Q7Tv6UGeUpi9COM3GafaIdeCw3r8240hLkbNbuvW7NBCs1fBWaDY2GwODT5lw0icgWuRLxIPiZGY
	0tNJv0hiMk3HapIG4V4Y9PL6UFI5brb9HuE14aIt5VDlYwzxHD2XZaJ7C55nBChCPBmE2Wg4dtNGV
	zUlEjnlMQ8eGiHbc1sp9jMahCCZ4IQrfiJFxtm6z9imPV8BOKIbjo486wTxUN3enzN+ZqKPeJk4TS
	fw3C9B97O4o5IOpK5jOW37FzwKhIlm3bXcKDp+m8rUX1h50FwYu6CTT7gXl2VPAY0HLTdZg5iHMC2
	6rGKYXVpO2+Y/xtAvQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8EgM-00D9dr-RX; Tue, 27 Jul 2021 04:27:06 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Efw-00D9Wv-Ni
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:26:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so2397520pjb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7VADpV20LIIOPDmppLIYFwFH7D9OS56fXUfMchxkWc=;
 b=jbxd4KMfw+jCA7eaA+em1PHyqmq4sURM5CUngBKaZLSqL0WLtHKAk7MZhGaZU9zGkF
 wfp/mgGSn3Kh4aDtvhLDtR8Bc3PC00IxGGpYsx7RXnvBcPEaF43nvXoIeHuFHUsSWr4W
 Pg3xhhlmrdZ0uBT2zXR5lG0cuJHNOAuat7+V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7VADpV20LIIOPDmppLIYFwFH7D9OS56fXUfMchxkWc=;
 b=V5JmzSJa/C8A5Vf+LzEzcoYk8VgfHX7wCWLuoqkZGTZSQ6cIg219QekENlua2UBB7/
 0BHlSWnWWh22SHuauQlC0zLBultFRUlv+I3g+MhKymA7ZrfjM+9oIpWkuYKCuu6feWaI
 /X+L6Rx4B2Fu3U+q1mr6Ad3UqNSCVj7P1hDROlzeCNY+FNroizBLzzAKf/OvWKcM2fJF
 JOP4OVwiKDCyOA33efgYnftYVij8gHIOhHdcjnzeY8D63zs1KhZqPKPDchSEzH7RCO41
 yHoxYlAlbwRDeCJ5/ZNLAvw+qN0VGe5U7zCAPp2oL1bV//yMJjMzpi+iyUTXl6WauPeO
 LqAA==
X-Gm-Message-State: AOAM531awWu2eCqUFLj+ZkzcTzrNL8PmA46/GYPml/rPjWEVlxag+/4M
 6aslMfJZN0Wc7IFaBX1Gqgh27QMGCxsCdOUOe7CLkg==
X-Google-Smtp-Source: ABdhPJxJbOEsuEnstVyJ2nOqS5R2gK1ictc4dBMDQSVZqDrX/iNvhVUGpDCcNdZd91NABcCbjrbrO1jzVB9uB1KOL7Q=
X-Received: by 2002:a17:90b:2251:: with SMTP id
 hk17mr2333136pjb.126.1627359999518; 
 Mon, 26 Jul 2021 21:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
 <20210706061920.16013-11-chun-jie.chen@mediatek.com>
In-Reply-To: <20210706061920.16013-11-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:26:28 +0800
Message-ID: <CAATdQgAgp1=J1ovR1KY8n1FE8Fb1zP6YzzUPSs-XvdE=z38Tzg@mail.gmail.com>
Subject: Re: [v13 10/21] clk: mediatek: Add MT8192 audio clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_212640_819393_771E5031 
X-CRM114-Status: GOOD (  23.61  )
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

On Tue, Jul 6, 2021 at 2:39 PM Chun-Jie Chen <chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 audio clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>


> ---
>  drivers/clk/mediatek/Kconfig          |   6 ++
>  drivers/clk/mediatek/Makefile         |   1 +
>  drivers/clk/mediatek/clk-mt8192-aud.c | 118 ++++++++++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 6075b48377d5..909f423d7c4c 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -508,6 +508,12 @@ config COMMON_CLK_MT8192
>         help
>           This driver supports MediaTek MT8192 basic clocks.
>
> +config COMMON_CLK_MT8192_AUDSYS
> +       bool "Clock driver for MediaTek MT8192 audsys"
> +       depends on COMMON_CLK_MT8192
> +       help
> +         This driver supports MediaTek MT8192 audsys clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index fcde42160720..1d0f2e8e9661 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -68,5 +68,6 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
> +obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
> new file mode 100644
> index 000000000000..f28d56628045
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8192-aud.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8192-clk.h>
> +
> +static const struct mtk_gate_regs aud0_cg_regs = {
> +       .set_ofs = 0x0,
> +       .clr_ofs = 0x0,
> +       .sta_ofs = 0x0,
> +};
> +
> +static const struct mtk_gate_regs aud1_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x4,
> +       .sta_ofs = 0x4,
> +};
> +
> +static const struct mtk_gate_regs aud2_cg_regs = {
> +       .set_ofs = 0x8,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x8,
> +};
> +
> +#define GATE_AUD0(_id, _name, _parent, _shift) \
> +       GATE_MTK(_id, _name, _parent, &aud0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
> +
> +#define GATE_AUD1(_id, _name, _parent, _shift) \
> +       GATE_MTK(_id, _name, _parent, &aud1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
> +
> +#define GATE_AUD2(_id, _name, _parent, _shift) \
> +       GATE_MTK(_id, _name, _parent, &aud2_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
> +
> +static const struct mtk_gate aud_clks[] = {
> +       /* AUD0 */
> +       GATE_AUD0(CLK_AUD_AFE, "aud_afe", "audio_sel", 2),
> +       GATE_AUD0(CLK_AUD_22M, "aud_22m", "aud_engen1_sel", 8),
> +       GATE_AUD0(CLK_AUD_24M, "aud_24m", "aud_engen2_sel", 9),
> +       GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "aud_engen2_sel", 18),
> +       GATE_AUD0(CLK_AUD_APLL_TUNER, "aud_apll_tuner", "aud_engen1_sel", 19),
> +       GATE_AUD0(CLK_AUD_TDM, "aud_tdm", "aud_1_sel", 20),
> +       GATE_AUD0(CLK_AUD_ADC, "aud_adc", "audio_sel", 24),
> +       GATE_AUD0(CLK_AUD_DAC, "aud_dac", "audio_sel", 25),
> +       GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "audio_sel", 26),
> +       GATE_AUD0(CLK_AUD_TML, "aud_tml", "audio_sel", 27),
> +       GATE_AUD0(CLK_AUD_NLE, "aud_nle", "audio_sel", 28),
> +       /* AUD1 */
> +       GATE_AUD1(CLK_AUD_I2S1_B, "aud_i2s1_b", "audio_sel", 4),
> +       GATE_AUD1(CLK_AUD_I2S2_B, "aud_i2s2_b", "audio_sel", 5),
> +       GATE_AUD1(CLK_AUD_I2S3_B, "aud_i2s3_b", "audio_sel", 6),
> +       GATE_AUD1(CLK_AUD_I2S4_B, "aud_i2s4_b", "audio_sel", 7),
> +       GATE_AUD1(CLK_AUD_CONNSYS_I2S_ASRC, "aud_connsys_i2s_asrc", "audio_sel", 12),
> +       GATE_AUD1(CLK_AUD_GENERAL1_ASRC, "aud_general1_asrc", "audio_sel", 13),
> +       GATE_AUD1(CLK_AUD_GENERAL2_ASRC, "aud_general2_asrc", "audio_sel", 14),
> +       GATE_AUD1(CLK_AUD_DAC_HIRES, "aud_dac_hires", "audio_h_sel", 15),
> +       GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "audio_h_sel", 16),
> +       GATE_AUD1(CLK_AUD_ADC_HIRES_TML, "aud_adc_hires_tml", "audio_h_sel", 17),
> +       GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "audio_sel", 20),
> +       GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "audio_h_sel", 21),
> +       GATE_AUD1(CLK_AUD_3RD_DAC, "aud_3rd_dac", "audio_sel", 28),
> +       GATE_AUD1(CLK_AUD_3RD_DAC_PREDIS, "aud_3rd_dac_predis", "audio_sel", 29),
> +       GATE_AUD1(CLK_AUD_3RD_DAC_TML, "aud_3rd_dac_tml", "audio_sel", 30),
> +       GATE_AUD1(CLK_AUD_3RD_DAC_HIRES, "aud_3rd_dac_hires", "audio_h_sel", 31),
> +       /* AUD2 */
> +       GATE_AUD2(CLK_AUD_I2S5_B, "aud_i2s5_b", "audio_sel", 0),
> +       GATE_AUD2(CLK_AUD_I2S6_B, "aud_i2s6_b", "audio_sel", 1),
> +       GATE_AUD2(CLK_AUD_I2S7_B, "aud_i2s7_b", "audio_sel", 2),
> +       GATE_AUD2(CLK_AUD_I2S8_B, "aud_i2s8_b", "audio_sel", 3),
> +       GATE_AUD2(CLK_AUD_I2S9_B, "aud_i2s9_b", "audio_sel", 4),
> +};
> +
> +static int clk_mt8192_aud_probe(struct platform_device *pdev)
> +{
> +       struct clk_onecell_data *clk_data;
> +       struct device_node *node = pdev->dev.of_node;
> +       int r;
> +
> +       clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r = mtk_clk_register_gates(node, aud_clks, ARRAY_SIZE(aud_clks), clk_data);
> +       if (r)
> +               return r;
> +
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r)
> +               return r;
> +
> +       r = devm_of_platform_populate(&pdev->dev);
> +       if (r)
> +               of_clk_del_provider(node);
> +
> +       return r;
> +}
> +
> +static const struct of_device_id of_match_clk_mt8192_aud[] = {
> +       { .compatible = "mediatek,mt8192-audsys", },
> +       {}
> +};
> +
> +static struct platform_driver clk_mt8192_aud_drv = {
> +       .probe = clk_mt8192_aud_probe,
> +       .driver = {
> +               .name = "clk-mt8192-aud",
> +               .of_match_table = of_match_clk_mt8192_aud,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8192_aud_drv);
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
