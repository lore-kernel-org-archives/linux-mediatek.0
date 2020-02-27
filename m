Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DD6C4BA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 01:19:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73F624672
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 01:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P3XZy+qR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UtKQrtG9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73F624672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZIStRApCi0i642QofMJwMliTKkB/P14IyY662XtWh4=; b=P3XZy+qRt9Rxus
	GVKXT38RqyGgCkl7xYKtMNiM5cEvJu97A4HRHzihIKHq3IxFCDLWfvF0Du4M1tYcDVk6RxOK4RD7W
	JfThMbXWop1P2QNUSfdxQ4d2/Q48CBDdj6Bcz6eKfwiw7NUCMVukx8kvt0Qb8qhc9GbO3HNZai8TC
	tbEhmvPJVBBhWZuf02/m/hJvSbt4wI8jvnzF9HGOxoKIdOOmtvjBCVZiZLPnxXbuzguoqiNgRK4Vs
	kC11ReCLPYG6CP+n4AKa6xf791/eNJnNOpwPKvlT8BHHjR8oNpDQX4cMKFgQPNYDdCg/iEuAmursC
	7F30liuKVUahucJgPxDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j77pJ-0003xi-TM; Thu, 27 Feb 2020 01:18:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j77pG-0003wL-Bk; Thu, 27 Feb 2020 01:18:56 +0000
X-UUID: 5052c0c08d6e40b481bef530dbedd889-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yXW8DIWB0/OF+vlxKwtMdA9ZUE5alnauOjBVkRixaho=; 
 b=UtKQrtG9tksb/cEl/2nkoget1sJkqS/veERIP2lHjry4+ZmSqAZ5ND3ebndPK4FzjVUADk43UTvsGvB+WoB6LLYtU0nCT8UQttuxI2SKpjQpdgCQ3IOUmbB4kKAZowSAUAXEwuMm2xf0zZOLeD7Wr7+f5MITqQXh2uoYvGZnMC4=;
X-UUID: 5052c0c08d6e40b481bef530dbedd889-20200226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1483041600; Wed, 26 Feb 2020 17:18:51 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 17:19:55 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 09:17:55 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 09:18:37 +0800
Message-ID: <1582766327.20746.4.camel@mtksdaap41>
Subject: Re: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform driver
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 27 Feb 2020 09:18:47 +0800
In-Reply-To: <20200226105419.632771-4-enric.balletbo@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-4-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_171854_418850_716F489A 
X-CRM114-Status: GOOD (  19.92  )
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora
 Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, frank-w@public-files.de, Seiya
 Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Wed, 2020-02-26 at 11:54 +0100, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> There is no strong reason for this to use CLK_OF_DECLARE instead of
> being a platform driver. Plus, this driver provides clocks but also
> a shared register space for the mediatek-drm and the mediatek-mdp
> driver. So move to drivers/soc/mediatek as a platform driver.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v9:
> - Move mmsys to drivers/soc/mediatek (CK)
> 
> Changes in v8:
> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> 
> Changes in v7:
> - Free clk_data->clks as well
> - Get rid of private data structure
> 
>  drivers/clk/mediatek/clk-mt8173.c   | 104 ---------------------
>  drivers/soc/mediatek/Kconfig        |   7 ++
>  drivers/soc/mediatek/Makefile       |   1 +
>  drivers/soc/mediatek/mt8173-mmsys.c | 137 ++++++++++++++++++++++++++++
>  4 files changed, 145 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mt8173-mmsys.c
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index 537a7f49b0f7..8f898ac476c0 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -753,93 +753,6 @@ static const struct mtk_gate img_clks[] __initconst = {
>  	GATE_IMG(CLK_IMG_FD, "img_fd", "mm_sel", 11),
>  };
>  
> -static const struct mtk_gate_regs mm0_cg_regs __initconst = {
> -	.set_ofs = 0x0104,
> -	.clr_ofs = 0x0108,
> -	.sta_ofs = 0x0100,
> -};
> -
> -static const struct mtk_gate_regs mm1_cg_regs __initconst = {
> -	.set_ofs = 0x0114,
> -	.clr_ofs = 0x0118,
> -	.sta_ofs = 0x0110,
> -};
> -
> -#define GATE_MM0(_id, _name, _parent, _shift) {			\
> -		.id = _id,					\
> -		.name = _name,					\
> -		.parent_name = _parent,				\
> -		.regs = &mm0_cg_regs,				\
> -		.shift = _shift,				\
> -		.ops = &mtk_clk_gate_ops_setclr,		\
> -	}
> -
> -#define GATE_MM1(_id, _name, _parent, _shift) {			\
> -		.id = _id,					\
> -		.name = _name,					\
> -		.parent_name = _parent,				\
> -		.regs = &mm1_cg_regs,				\
> -		.shift = _shift,				\
> -		.ops = &mtk_clk_gate_ops_setclr,		\
> -	}
> -
> -static const struct mtk_gate mm_clks[] __initconst = {
> -	/* MM0 */
> -	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
> -	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
> -	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
> -	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
> -	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
> -	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
> -	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
> -	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
> -	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
> -	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
> -	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
> -	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
> -	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
> -	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
> -	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
> -	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
> -	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
> -	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
> -	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
> -	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
> -	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
> -	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
> -	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
> -	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
> -	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
> -	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
> -	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
> -	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
> -	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
> -	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
> -	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
> -	/* MM1 */
> -	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
> -	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
> -	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
> -	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
> -	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
> -	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
> -	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
> -	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
> -	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
> -	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
> -	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
> -	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
> -	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
> -	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
> -	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
> -	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
> -	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
> -	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
> -	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
> -	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
> -	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
> -};
> -
>  static const struct mtk_gate_regs vdec0_cg_regs __initconst = {
>  	.set_ofs = 0x0000,
>  	.clr_ofs = 0x0004,
> @@ -1144,23 +1057,6 @@ static void __init mtk_imgsys_init(struct device_node *node)
>  }
>  CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
>  
> -static void __init mtk_mmsys_init(struct device_node *node)
> -{
> -	struct clk_onecell_data *clk_data;
> -	int r;
> -
> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> -
> -	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -						clk_data);
> -
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> -		pr_err("%s(): could not register clock provider: %d\n",
> -			__func__, r);
> -}
> -CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
> -
>  static void __init mtk_vdecsys_init(struct device_node *node)
>  {
>  	struct clk_onecell_data *clk_data;
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 2114b563478c..dcd6481a14d0 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -44,4 +44,11 @@ config MTK_SCPSYS
>  	  Say yes here to add support for the MediaTek SCPSYS power domain
>  	  driver.
>  
> +config MT8173_MMSYS
> +	bool "MediaTek MT8173 MMSYS Support"
> +	depends on COMMON_CLK_MT8173
> +	help
> +	  Say yes here to add support for the MediaTek MT8173 Multimedia
> +	  Subsystem (MMSYS).
> +
>  endmenu
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index b01733074ad6..a185e4ee7601 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> +obj-$(CONFIG_MT8173_MMSYS) += mt8173-mmsys.o
> diff --git a/drivers/soc/mediatek/mt8173-mmsys.c b/drivers/soc/mediatek/mt8173-mmsys.c
> new file mode 100644
> index 000000000000..48e6c157d28e
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8173-mmsys.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: James Liao <jamesjj.liao@mediatek.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "../../clk/mediatek/clk-gate.h"
> +#include "../../clk/mediatek/clk-mtk.h"
> +
> +#include <dt-bindings/clock/mt8173-clk.h>
> +
> +static const struct mtk_gate_regs mm0_cg_regs = {
> +	.set_ofs = 0x0104,
> +	.clr_ofs = 0x0108,
> +	.sta_ofs = 0x0100,
> +};
> +
> +static const struct mtk_gate_regs mm1_cg_regs = {
> +	.set_ofs = 0x0114,
> +	.clr_ofs = 0x0118,
> +	.sta_ofs = 0x0110,
> +};
> +
> +#define GATE_MM0(_id, _name, _parent, _shift) {			\
> +		.id = _id,					\
> +		.name = _name,					\
> +		.parent_name = _parent,				\
> +		.regs = &mm0_cg_regs,				\
> +		.shift = _shift,				\
> +		.ops = &mtk_clk_gate_ops_setclr,		\
> +	}
> +
> +#define GATE_MM1(_id, _name, _parent, _shift) {			\
> +		.id = _id,					\
> +		.name = _name,					\
> +		.parent_name = _parent,				\
> +		.regs = &mm1_cg_regs,				\
> +		.shift = _shift,				\
> +		.ops = &mtk_clk_gate_ops_setclr,		\
> +	}
> +
> +static const struct mtk_gate mm_clks[] = {
> +	/* MM0 */
> +	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
> +	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
> +	GATE_MM0(CLK_MM_CAM_MDP, "mm_cam_mdp", "mm_sel", 2),
> +	GATE_MM0(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "mm_sel", 3),
> +	GATE_MM0(CLK_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 4),
> +	GATE_MM0(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "mm_sel", 5),
> +	GATE_MM0(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "mm_sel", 6),
> +	GATE_MM0(CLK_MM_MDP_RSZ2, "mm_mdp_rsz2", "mm_sel", 7),
> +	GATE_MM0(CLK_MM_MDP_TDSHP0, "mm_mdp_tdshp0", "mm_sel", 8),
> +	GATE_MM0(CLK_MM_MDP_TDSHP1, "mm_mdp_tdshp1", "mm_sel", 9),
> +	GATE_MM0(CLK_MM_MDP_WDMA, "mm_mdp_wdma", "mm_sel", 11),
> +	GATE_MM0(CLK_MM_MDP_WROT0, "mm_mdp_wrot0", "mm_sel", 12),
> +	GATE_MM0(CLK_MM_MDP_WROT1, "mm_mdp_wrot1", "mm_sel", 13),
> +	GATE_MM0(CLK_MM_FAKE_ENG, "mm_fake_eng", "mm_sel", 14),
> +	GATE_MM0(CLK_MM_MUTEX_32K, "mm_mutex_32k", "rtc_sel", 15),
> +	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "mm_sel", 16),
> +	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "mm_sel", 17),
> +	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "mm_sel", 18),
> +	GATE_MM0(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 19),
> +	GATE_MM0(CLK_MM_DISP_RDMA2, "mm_disp_rdma2", "mm_sel", 20),
> +	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "mm_sel", 21),
> +	GATE_MM0(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "mm_sel", 22),
> +	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "mm_sel", 23),
> +	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "mm_sel", 24),
> +	GATE_MM0(CLK_MM_DISP_AAL, "mm_disp_aal", "mm_sel", 25),
> +	GATE_MM0(CLK_MM_DISP_GAMMA, "mm_disp_gamma", "mm_sel", 26),
> +	GATE_MM0(CLK_MM_DISP_UFOE, "mm_disp_ufoe", "mm_sel", 27),
> +	GATE_MM0(CLK_MM_DISP_SPLIT0, "mm_disp_split0", "mm_sel", 28),
> +	GATE_MM0(CLK_MM_DISP_SPLIT1, "mm_disp_split1", "mm_sel", 29),
> +	GATE_MM0(CLK_MM_DISP_MERGE, "mm_disp_merge", "mm_sel", 30),
> +	GATE_MM0(CLK_MM_DISP_OD, "mm_disp_od", "mm_sel", 31),
> +	/* MM1 */
> +	GATE_MM1(CLK_MM_DISP_PWM0MM, "mm_disp_pwm0mm", "mm_sel", 0),
> +	GATE_MM1(CLK_MM_DISP_PWM026M, "mm_disp_pwm026m", "pwm_sel", 1),
> +	GATE_MM1(CLK_MM_DISP_PWM1MM, "mm_disp_pwm1mm", "mm_sel", 2),
> +	GATE_MM1(CLK_MM_DISP_PWM126M, "mm_disp_pwm126m", "pwm_sel", 3),
> +	GATE_MM1(CLK_MM_DSI0_ENGINE, "mm_dsi0_engine", "mm_sel", 4),
> +	GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "dsi0_dig", 5),
> +	GATE_MM1(CLK_MM_DSI1_ENGINE, "mm_dsi1_engine", "mm_sel", 6),
> +	GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "dsi1_dig", 7),
> +	GATE_MM1(CLK_MM_DPI_PIXEL, "mm_dpi_pixel", "dpi0_sel", 8),
> +	GATE_MM1(CLK_MM_DPI_ENGINE, "mm_dpi_engine", "mm_sel", 9),
> +	GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "lvds_pxl", 10),
> +	GATE_MM1(CLK_MM_DPI1_ENGINE, "mm_dpi1_engine", "mm_sel", 11),
> +	GATE_MM1(CLK_MM_HDMI_PIXEL, "mm_hdmi_pixel", "dpi0_sel", 12),
> +	GATE_MM1(CLK_MM_HDMI_PLLCK, "mm_hdmi_pllck", "hdmi_sel", 13),
> +	GATE_MM1(CLK_MM_HDMI_AUDIO, "mm_hdmi_audio", "apll1", 14),
> +	GATE_MM1(CLK_MM_HDMI_SPDIF, "mm_hdmi_spdif", "apll2", 15),
> +	GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "lvds_pxl", 16),
> +	GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "lvds_cts", 17),
> +	GATE_MM1(CLK_MM_SMI_LARB4, "mm_smi_larb4", "mm_sel", 18),
> +	GATE_MM1(CLK_MM_HDMI_HDCP, "mm_hdmi_hdcp", "hdcp_sel", 19),
> +	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
> +};
> +
> +static int mt8173_mmsys_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct clk_onecell_data *clk_data;
> +	int ret;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	ret = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> +				     clk_data);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id of_match_mt8173_mmsys[] = {
> +	{ .compatible = "mediatek,mt8173-mmsys", },
> +	{ }
> +};
> +
> +static struct platform_driver mt8173_mmsys_drv = {
> +	.driver = {
> +		.name = "mt8173-mmsys",
> +		.of_match_table = of_match_mt8173_mmsys,
> +	},
> +	.probe = mt8173_mmsys_probe,
> +};
> +
> +builtin_platform_driver(mt8173_mmsys_drv);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
