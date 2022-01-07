Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E39C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 14:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+yCWjJBhigieYzgOTN8dFxILPgp28s1TkvYJps08E8=; b=SLogu6fQzLW+mUeWHBn8IM0KfW
	mmBQol4i+fuMGExAFcC4ESZVDCTO6CKk+6pf97Am6BpcesUWq2BxlpxMktbDohatwLuXJiOHApKEc
	aq18CPaFCPYQpzLOhuQjO5nhr6vcpYmtZDR2GfsCKvpjk2rQMQf/kDJWMlvC2RffmcHXRS2D8/Mn8
	51ZMcv78UIMfqndhypXNSd0BOgUqp4DpxDwunYy6+kOVr/KZ22sztxOam1WFCcpO7bK/SAdqHdbCO
	N5fAQzP2S4xpE8pmDQKPYtXJ5eKtmtb4T0Dl2VzX6Q8RyLbUoV5YxYWkNOk2eo11/s0Xaxez4v2c0
	rszPuw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qKo-004DU9-Nl; Fri, 07 Jan 2022 14:35:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qJc-004Ci6-Pt; Fri, 07 Jan 2022 14:34:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8838B1F4436E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641566039;
 bh=RldGw44u6+AGmi0efrlIYXk9AL8VfKkwLM4lhnsDUXI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cPIH1x39COm7u9UN9YtQk3OD7h2sjmU4rBEhVRJrW7XnaiAyvz+uI1H/W038yL4M6
 luSZUkBdKz8uItmPWQ26E2T1onNo4MrjjJcpQuKWv8EN6P2tIbdREp4XIZzQUkzu9c
 Sp5kVo/2FfqKP0cWK+jYe+3ktoC+c2zAICAh4TU7YqGOSGaLTHtLmIwPTGqQoKfkzK
 oY0Xgvq7NGNmtgIWNk0vNGNv/06N/hHvNPcF6r3I/04k8FP6kryoRQLCBwTKtmc5co
 DOLZtHiBdxgDwLp+jtf9DwXjEQ6aIFNCxa2Z91HwtvV17qhecSeP/agYLjN3cfWbWL
 Mnn+E+hCx393w==
Subject: Re: [PATCH v21 3/8] soc: mediatek: SVS: introduce MTK SVS engine
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-4-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <63d8884d-d02d-53f9-8524-4a074ca5bfea@collabora.com>
Date: Fri, 7 Jan 2022 15:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220107095200.4389-4-roger.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_063401_152865_2D122258 
X-CRM114-Status: GOOD (  22.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/01/22 10:51, Roger Lu ha scritto:
> The Smart Voltage Scaling(SVS) engine is a piece of hardware
> which calculates suitable SVS bank voltages to OPP voltage table.
> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> when receiving OPP_EVENT_ADJUST_VOLTAGE.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig   |   10 +
>   drivers/soc/mediatek/Makefile  |    1 +
>   drivers/soc/mediatek/mtk-svs.c | 1446 ++++++++++++++++++++++++++++++++
>   3 files changed, 1457 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mtk-svs.c
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index fdd8bc08569e..3c3eedea35f7 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -73,4 +73,14 @@ config MTK_MMSYS
>   	  Say yes here to add support for the MediaTek Multimedia
>   	  Subsystem (MMSYS).
>   
> +config MTK_SVS
> +	tristate "MediaTek Smart Voltage Scaling(SVS)"
> +	depends on MTK_EFUSE && NVMEM
> +	help
> +	  The Smart Voltage Scaling(SVS) engine is a piece of hardware
> +	  which has several controllers(banks) for calculating suitable
> +	  voltage to different power domains(CPU/GPU/CCI) according to
> +	  chip process corner, temperatures and other factors. Then DVFS
> +	  driver could apply SVS bank voltage to PMIC/Buck.
> +
>   endmenu
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 90270f8114ed..0e9e703c931a 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>   obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
> +obj-$(CONFIG_MTK_SVS) += mtk-svs.o
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> new file mode 100644
> index 000000000000..fc7e2ee44a92
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -0,0 +1,1446 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_qos.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +/* svs bank 1-line sw id */
> +#define SVSB_CPU_LITTLE			BIT(0)
> +#define SVSB_CPU_BIG			BIT(1)
> +#define SVSB_CCI			BIT(2)
> +#define SVSB_GPU			BIT(3)
> +
> +/* svs bank mode support */
> +#define SVSB_MODE_ALL_DISABLE		0
> +#define SVSB_MODE_INIT01		BIT(1)
> +#define SVSB_MODE_INIT02		BIT(2)
> +
> +/* svs bank volt flags */
> +#define SVSB_INIT01_PD_REQ		BIT(0)
> +#define SVSB_INIT01_VOLT_IGNORE		BIT(1)
> +#define SVSB_INIT01_VOLT_INC_ONLY	BIT(2)
> +
> +/* svs bank common setting */
> +#define MAX_OPP_ENTRIES			16
> +#define SVSB_DC_SIGNED_BIT		BIT(15)
> +#define SVSB_DET_CLK_EN			BIT(31)
> +#define SVSB_DET_MAX			0xffff
> +#define SVSB_DET_WINDOW			0xa28
> +#define SVSB_DTHI			0x1
> +#define SVSB_DTLO			0xfe
> +#define SVSB_EN_INIT01			0x1
> +#define SVSB_EN_INIT02			0x5
> +#define SVSB_EN_MASK			0x7
> +#define SVSB_EN_OFF			0x0
> +#define SVSB_INTEN_INIT0x		0x00005f01
> +#define SVSB_INTSTS_CLEAN		0x00ffffff
> +#define SVSB_INTSTS_COMPLETE		0x1
> +#define SVSB_RUNCONFIG_DEFAULT		0x80000000
> +
> +static DEFINE_SPINLOCK(svs_lock);

snip....


> +
> +struct svs_platform_data {
> +	char *name;
> +	struct svs_bank *banks;
> +	bool (*efuse_parsing)(struct svs_platform *svsp);
> +	unsigned long irqflags;
> +	const u32 *regs;
> +	u32 bank_max;
> +	int (*probe)(struct svs_platform *svsp);
> +};
> +

Please move the definition of struct svs_platform_data at the beginning of
the file for increased readability.

With that done,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
