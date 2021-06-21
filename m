Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DC7C4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 15:06:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C336023F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 15:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C336023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6AYWGptNwNR2y1qklbLo6yg/dTNKPqoXqNNlQTV029Y=; b=oc4GxPViQdKxWBSu+M4Z5Lp99z
	Jyk/6jjG4RDVH4+f6wmvbZhBgxEBRCQAAl/EMugASGi7nkxfGLQJCMubP53lKBAReevF0lX4bqhNQ
	ilG61uPcxrpDyJaGLowc5B7tC4hvZAKFc4XIFIab2w+jYh+7x1i11JmlRFFOX1tPuFswlXzEA/Z2q
	Y6hWDS3mdxix0s9X0yj3GMH7k0mt+Vad3/4SmwQyVLb61iv+8cKXyeEC265oWAZfqg1Lse8r8iOTu
	uzPV1jP/vO7GyrQi7MUCya4GcWNvVDOJYi9+7Bk0vfcKVHw8I6V+GjO+OYQkw2Wh8L+JWmKJge1UE
	tPixysnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLUu-003sD0-Hm; Mon, 21 Jun 2021 15:06:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLUr-003sBs-86; Mon, 21 Jun 2021 15:05:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id i94so20053820wri.4;
 Mon, 21 Jun 2021 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EkUHhZgIHRHy9Rwlaqt/KDULyDuZV0eQJxfpTZj/p24=;
 b=Imrr/KjTNGL2JNuMSORgctgFvb1jqFCzpuXtDH0/K5JQWKBH3OUQV9P3jPyEN6DT94
 Ka2ZIDxPaeSQ6tNpo0OneQ8cmtudMXsfeYyorydLA4TWZi78LsxjcQeEd3v7vRRTO+/G
 8bEh01zGUQMbm+1scVcYqLAPsbUHTxkJ1gUKy0t3PTYAzvsFXhB/Coh7iia3gTZ9pOYe
 Wot5J+TvZ2yVSLHqouSYh/+0QiFjyianLZVNpMC3zhqEpoH0NA7/ghZrpQHPGyvSe30l
 e+HOofW/ORb+eLqGlZe4P6PlIiKeweJIJdFtHqTQySiVzeaOzUmikZbskuPLcEAaF/HK
 SNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EkUHhZgIHRHy9Rwlaqt/KDULyDuZV0eQJxfpTZj/p24=;
 b=WHqyJ4BJrYA7Cl+CksgroD5uAR9KqHnrrvBlPZbJ4zJvmN2RwLewHDNKFB2C06m5LN
 /G+zSyvUrBqr7aXyLFR2l/FNnje8g0pKjEFzo/pw2k1yeAB1gdUNRb/UKI8EO8EBS7Ex
 Q1qIzPjp0VnXBQfqyn9E1LZo8gfCLYGJ06AcnWDJzzjkKtHFMztA93zQVQ4NsKRT2BkR
 mAlYvMMiZpeXSJRStsG00P/UXCv8j15vw2F7p9wLyr9JmIC1h39zrchwSAzONDZeBFPw
 FSvohG/rUWGppgPTAuCOx+LbtO8B+O+6RJP8hOJnSfO1Nhv98uIph8NM6GUTTVPXyJOJ
 gnSQ==
X-Gm-Message-State: AOAM5307mbm1bRfy6KbZSIlqOCvyZhj1w2p1h9CgwD+iaf+YSsxmKMj6
 GRXWuXH38CxI03GCHUM6Jts=
X-Google-Smtp-Source: ABdhPJxeU0mR1NJJclVo6DU/Af5Z9JsVMZlPBNSTYnrpifYWwQry175E3dzr2NiROvdaKdGTuCFtyQ==
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr14873494wrw.302.1624287954846; 
 Mon, 21 Jun 2021 08:05:54 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id r10sm14059405wrq.17.2021.06.21.08.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:05:54 -0700 (PDT)
Subject: Re: [PATCH v10 15/19] clk: mediatek: Add MT8192 mmsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
 <20210616003643.28648-16-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6e94fe64-6f03-38e4-bffd-ff6ac786f3d3@gmail.com>
Date: Mon, 21 Jun 2021 17:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210616003643.28648-16-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_080557_361792_EA5DA894 
X-CRM114-Status: GOOD (  22.63  )
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



On 16/06/2021 02:36, Chun-Jie Chen wrote:
> Add MT8192 mmsys clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/clk/mediatek/Kconfig         |   6 ++
>  drivers/clk/mediatek/Makefile        |   1 +
>  drivers/clk/mediatek/clk-mt8192-mm.c | 108 +++++++++++++++++++++++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index e212f3416855..5b89a4dbe2b9 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -550,6 +550,12 @@ config COMMON_CLK_MT8192_MFGCFG
>  	help
>  	  This driver supports MediaTek MT8192 mfgcfg clocks.
>  
> +config COMMON_CLK_MT8192_MMSYS
> +	bool "Clock driver for MediaTek MT8192 mmsys"
> +	depends on COMMON_CLK_MT8192
> +	help
> +	  This driver supports MediaTek MT8192 mmsys clocks.
> +
>  config COMMON_CLK_MT8516
>  	bool "Clock driver for MediaTek MT8516"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 024841a79f1c..838bb0131c97 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -75,5 +75,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP) += clk-mt8192-imp_iic_wrap.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_IPESYS) += clk-mt8192-ipe.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_MDPSYS) += clk-mt8192-mdp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
> +obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
> new file mode 100644
> index 000000000000..4a0b4c4bc06a
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8192-mm.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8192-clk.h>
> +
> +static const struct mtk_gate_regs mm0_cg_regs = {
> +	.set_ofs = 0x104,
> +	.clr_ofs = 0x108,
> +	.sta_ofs = 0x100,
> +};
> +
> +static const struct mtk_gate_regs mm1_cg_regs = {
> +	.set_ofs = 0x114,
> +	.clr_ofs = 0x118,
> +	.sta_ofs = 0x110,
> +};
> +
> +static const struct mtk_gate_regs mm2_cg_regs = {
> +	.set_ofs = 0x1a4,
> +	.clr_ofs = 0x1a8,
> +	.sta_ofs = 0x1a0,
> +};
> +
> +#define GATE_MM0(_id, _name, _parent, _shift)	\
> +	GATE_MTK(_id, _name, _parent, &mm0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_MM1(_id, _name, _parent, _shift)	\
> +	GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_MM2(_id, _name, _parent, _shift)	\
> +	GATE_MTK(_id, _name, _parent, &mm2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate mm_clks[] = {
> +	/* MM0 */
> +	GATE_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "disp_sel", 0),
> +	GATE_MM0(CLK_MM_DISP_CONFIG, "mm_disp_config", "disp_sel", 1),
> +	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "disp_sel", 2),
> +	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "disp_sel", 3),
> +	GATE_MM0(CLK_MM_DISP_OVL0_2L, "mm_disp_ovl0_2l", "disp_sel", 4),
> +	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp_sel", 5),
> +	GATE_MM0(CLK_MM_DISP_UFBC_WDMA0, "mm_disp_ufbc_wdma0", "disp_sel", 6),
> +	GATE_MM0(CLK_MM_DISP_RSZ0, "mm_disp_rsz0", "disp_sel", 7),
> +	GATE_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp_sel", 8),
> +	GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp_sel", 9),
> +	GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp_sel", 10),
> +	GATE_MM0(CLK_MM_SMI_INFRA, "mm_smi_infra", "disp_sel", 11),
> +	GATE_MM0(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp_sel", 12),
> +	GATE_MM0(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "disp_sel", 13),
> +	GATE_MM0(CLK_MM_DISP_DSC_WRAP0, "mm_disp_dsc_wrap0", "disp_sel", 14),
> +	GATE_MM0(CLK_MM_DSI0, "mm_dsi0", "disp_sel", 15),
> +	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp_sel", 16),
> +	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "disp_sel", 17),
> +	GATE_MM0(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp_sel", 18),
> +	GATE_MM0(CLK_MM_DISP_FAKE_ENG1, "mm_disp_fake_eng1", "disp_sel", 19),
> +	GATE_MM0(CLK_MM_MDP_TDSHP4, "mm_mdp_tdshp4", "disp_sel", 20),
> +	GATE_MM0(CLK_MM_MDP_RSZ4, "mm_mdp_rsz4", "disp_sel", 21),
> +	GATE_MM0(CLK_MM_MDP_AAL4, "mm_mdp_aal4", "disp_sel", 22),
> +	GATE_MM0(CLK_MM_MDP_HDR4, "mm_mdp_hdr4", "disp_sel", 23),
> +	GATE_MM0(CLK_MM_MDP_RDMA4, "mm_mdp_rdma4", "disp_sel", 24),
> +	GATE_MM0(CLK_MM_MDP_COLOR4, "mm_mdp_color4", "disp_sel", 25),
> +	GATE_MM0(CLK_MM_DISP_Y2R0, "mm_disp_y2r0", "disp_sel", 26),
> +	GATE_MM0(CLK_MM_SMI_GALS, "mm_smi_gals", "disp_sel", 27),
> +	GATE_MM0(CLK_MM_DISP_OVL2_2L, "mm_disp_ovl2_2l", "disp_sel", 28),
> +	GATE_MM0(CLK_MM_DISP_RDMA4, "mm_disp_rdma4", "disp_sel", 29),
> +	GATE_MM0(CLK_MM_DISP_DPI0, "mm_disp_dpi0", "disp_sel", 30),
> +	/* MM1 */
> +	GATE_MM1(CLK_MM_SMI_IOMMU, "mm_smi_iommu", "disp_sel", 0),
> +	/* MM2 */
> +	GATE_MM2(CLK_MM_DSI_DSI0, "mm_dsi_dsi0", "disp_sel", 0),
> +	GATE_MM2(CLK_MM_DPI_DPI0, "mm_dpi_dpi0", "dpi_sel", 8),
> +	GATE_MM2(CLK_MM_26MHZ, "mm_26mhz", "clk26m", 24),
> +	GATE_MM2(CLK_MM_32KHZ, "mm_32khz", "clk32k", 25),
> +};
> +
> +static int clk_mt8192_mm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
> +	if (r)
> +		return r;
> +
> +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
> +static struct platform_driver clk_mt8192_mm_drv = {
> +	.probe = clk_mt8192_mm_probe,
> +	.driver = {
> +		.name = "clk-mt8192-mm",
> +	},
> +};
> +
> +builtin_platform_driver(clk_mt8192_mm_drv);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
