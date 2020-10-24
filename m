Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3187AC55178
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 16:23:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B312087C
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 16:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PUQcV+aw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sdiKsUzL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B312087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LnE8a2pWjFlvgc6Ei677D4lNcEb8ba04gh6aUpdNov4=; b=PUQcV+awAdhlgJqdvPBi7Ipm5
	c6gwJo1FYmyQ/O7evhgNWpL6umVzfQTcpnOdjqkIdhhHk7FrrDuoMmxQQ96MpwRYnpWUNGQWLih1R
	vNsKhxXZIeB5zQdGvBmpj6cMiU3CaIcRuz9V0Yp9Zia/NCOAMgVptx1ijW4JXYSL00gxSNjFnMTRX
	X67rENSDqcm7cZHElgt4H39Hq/y3c/salS3T9UfIokWajQawnKrxKTQt+VdfSyIDQh+KPSrxFBuj8
	Q+P9ujhqtLNV21ydVbdumV3OvhcASib9WIWM1FOu87UjWKuVnB6Kcnk6HYFZU2UwjcJR0+0mqsNQE
	RVqxRAWuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWMJi-0003Ap-CU; Sat, 24 Oct 2020 16:22:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWMJc-00038A-Jd; Sat, 24 Oct 2020 16:22:50 +0000
X-UUID: 0d7c04f6cf494f8b96f7dd10da8c86b3-20201024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=clO7x/VOL80tb0fdj/oUgJ/S8826gq/72f6K4BLeZc8=; 
 b=sdiKsUzLPhVCy/zztNbQ1pmzh5iRJ3jpC1dx6qyvpEKtRcuyePMXz5+UN4qvhdeqyE/UIYze4RMh2zDInWTJXYt7Cz4dgx7sYQv/tVLBgF+s/9GLcOWnGC9013IBOhH7kFj64xhMuerh0gESrP6ZjavGQogSKq5p2ld/PDoRXIE=;
X-UUID: 0d7c04f6cf494f8b96f7dd10da8c86b3-20201024
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1023938168; Sat, 24 Oct 2020 08:22:39 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 09:22:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 25 Oct 2020 00:22:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 25 Oct 2020 00:22:34 +0800
Message-ID: <1603556556.28119.4.camel@mtksdaap41>
Subject: Re: [PATCH v4 19/34] clk: mediatek: Add MT8192 imp i2c wrapper c
 clock support
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Date: Sun, 25 Oct 2020 00:22:36 +0800
In-Reply-To: <1603370247-30437-20-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
 <1603370247-30437-20-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_122248_860546_DD81376A 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-10-22 at 20:37 +0800, Weiyi Lu wrote:
> Add MT8192 imp i2c wrapper c clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig                     |  6 +++
>  drivers/clk/mediatek/Makefile                    |  1 +
>  drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c | 62 ++++++++++++++++++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 99b0168..a0eb76d 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -491,6 +491,12 @@ config COMMON_CLK_MT8192_IMGSYS2
>  	help
>  	  This driver supports MediaTek MT8192 imgsys2 clocks.
>  
> +config COMMON_CLK_MT8192_IMP_IIC_WRAP_C
> +	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_c"
> +	depends on COMMON_CLK_MT8192
> +	help
> +	  This driver supports MediaTek MT8192 imp_iic_wrap_c clocks.
> +
>  config COMMON_CLK_MT8516
>  	bool "Clock driver for MediaTek MT8516"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 012a01a..8aac821 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -69,5 +69,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWB) += clk-mt8192-cam_rawb.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWC) += clk-mt8192-cam_rawc.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS2) += clk-mt8192-img2.o
> +obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_C) += clk-mt8192-imp_iic_wrap_c.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
> new file mode 100644
> index 0000000..e7a0033
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +// Author: Weiyi Lu <weiyi.lu@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8192-clk.h>
> +
> +static const struct mtk_gate_regs imp_iic_wrap_c_cg_regs = {
> +	.set_ofs = 0xe08,
> +	.clr_ofs = 0xe04,
> +	.sta_ofs = 0xe00,
> +};
> +
> +#define GATE_IMP_IIC_WRAP_C(_id, _name, _parent, _shift)			\
> +	GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_c_cg_regs, _shift,	\
> +		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
> +
> +static const struct mtk_gate imp_iic_wrap_c_clks[] = {
> +	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C10, "imp_iic_wrap_c_i2c10", "infra_i2c0", 0),
> +	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C11, "imp_iic_wrap_c_i2c11", "infra_i2c0", 1),
> +	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C12, "imp_iic_wrap_c_i2c12", "infra_i2c0", 2),
> +	GATE_IMP_IIC_WRAP_C(CLK_IMP_IIC_WRAP_C_I2C13, "imp_iic_wrap_c_i2c13", "infra_i2c0", 3),
> +};
> +
> +static int clk_mt8192_imp_iic_wrap_c_probe(struct platform_device *pdev)
> +{
> +	struct clk_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_C_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, imp_iic_wrap_c_clks, ARRAY_SIZE(imp_iic_wrap_c_clks),
> +			clk_data);
> +	if (r)
> +		return r;
> +
> +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
> +static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_c[] = {
> +	{ .compatible = "mediatek,mt8192-imp_iic_wrap_c", },
> +	{}
> +};

It seems these mt8192-imp_iic_wrap_* drivers are very similar.
I think it make more sense to use 1 single driver to provide them, ie:

+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_c", imp_iic_wrap_c_clks},
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_e", imp_iic_wrap_e_clks},
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_n", imp_iic_wrap_n_clks},
....
+	{}
+};

Maybe other clk drivers can be merged to the same driverl.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
