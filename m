Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9BFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfrJtDTr5SzJemNVgFVSAHFBr8cXFvqlZigmS9ZVrzE=; b=i4H8WyYSZI92wtrPCwaEu+kVD7
	kc+UwzcTXmUFXHZCuZnAupRkosXZDaE0cGblNfnbsVMNli4eDoIYkAJnP/ZJ9wQnWnfcCZzyEMli7
	DJtrcagy/l4p2E130+91rdkvAzEW+/o5hAIpaW8ghbNrtfFZL0Z7tRp5PniWy87aXavUzHmhgW/Yd
	MtU9skylvKngoHI2R3S9BcDQpJH99d0RZihWv3zxkpAWNloRHsFr6lG40klxj1AKznwun7gQ84Uyx
	T6407Ao5d+SFXW/yInG8aaS++Hjco/EkKHSjRRrR+0B8OtRJsn+lVE8grC+dlukKRByRjW6JbaQJJ
	K8wrQPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeMV-0099RT-Gs; Tue, 04 Oct 2022 09:37:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeM6-0099JD-Mw; Tue, 04 Oct 2022 09:36:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D1C36601A43;
	Tue,  4 Oct 2022 10:36:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664876206;
	bh=7d/Gvp/hSj0W8fL9YlWbKoSabX//KYOwXW+EbP2DhMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f76M3RL3SMH4JYVyrZEKOA8W5XKDOyQ/AuJSRil+nsr+YyTM/9LU0ejEDkDQyGkeX
	 gdxULrN3DJI7XWWYTyjCrqPFSTqQJ8Umbaz3IZg8MibI29m/YOq21FuQ4L+uc0ZptZ
	 kgMIQC2vjaxJBh5RFFwOU/uxDm0/bdqaUKVjoUhP217zIMAMuqUsbkdTUA9pdwVBqD
	 Me08ieEpNgykKIcdUIxLfOC/COPk3ZmD+d8v/r59+j0u7dx6XHisThMSJ6H0dHfbCa
	 39RM9hV/qmcsW8QtslAwUxa/lnbt6YhP4+xlM0vNQmU3bHArD8XGQud1pVnZZow49z
	 Ip5gyZOSojuwQ==
Message-ID: <50e12f7a-bf15-9f27-0606-5d23b310bf2d@collabora.com>
Date: Tue, 4 Oct 2022 11:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/12] ASoC: mediatek: mt8188: add platform driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-9-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220930145701.18790-9-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_023651_118168_F67B0AC8 
X-CRM114-Status: GOOD (  24.17  )
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

Il 30/09/22 16:56, Trevor Wu ha scritto:
> Add mt8188 platform driver.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
> This patch depends on the following series that has not been accepted.
> 
> [1] Add power domain support for MT8188
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=681359
> (linux/soc/mediatek/infracfg.h is included)
> ---
>   sound/soc/mediatek/Kconfig                 |   13 +
>   sound/soc/mediatek/Makefile                |    1 +
>   sound/soc/mediatek/mt8188/Makefile         |   12 +
>   sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2945 ++++++++++++++++++++
>   4 files changed, 2971 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8188/Makefile
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 363fa4d47680..cf0e4c6b61e7 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -206,6 +206,19 @@ config SND_SOC_MTK_BTCVSD
>   	  Select Y if you have such device.
>   	  If unsure select "N".
>   
> +config SND_SOC_MT8188
> +	tristate "ASoC support for Mediatek MT8188 chip"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on COMMON_CLK
> +	select SND_SOC_MEDIATEK
> +	select SND_SOC_MT6359
> +	select MFD_SYSCON if SND_SOC_MT6359
> +	help
> +	  This adds ASoC platform driver support for Mediatek MT8188 chip
> +	  that can be used with other codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".
> +
>   config SND_SOC_MT8192
>   	tristate "ASoC support for Mediatek MT8192 chip"
>   	depends on ARCH_MEDIATEK
> diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
> index 5571c640a288..3de38cfc69e5 100644
> --- a/sound/soc/mediatek/Makefile
> +++ b/sound/soc/mediatek/Makefile
> @@ -5,5 +5,6 @@ obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
>   obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
>   obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
>   obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
> +obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
>   obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
>   obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
> diff --git a/sound/soc/mediatek/mt8188/Makefile b/sound/soc/mediatek/mt8188/Makefile
> new file mode 100644
> index 000000000000..fa5d383c5e47
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8188/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# platform driver
> +snd-soc-mt8188-afe-objs := \
> +	mt8188-afe-clk.o \
> +	mt8188-afe-pcm.o \
> +	mt8188-audsys-clk.o \
> +	mt8188-dai-adda.o \
> +	mt8188-dai-etdm.o \
> +	mt8188-dai-pcm.o
> +
> +obj-$(CONFIG_SND_SOC_MT8188) += snd-soc-mt8188-afe.o
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> new file mode 100644
> index 000000000000..5d8e01c99714
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> @@ -0,0 +1,2945 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek ALSA SoC AFE platform driver for 8188
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
> + *         Trevor Wu <trevor.wu@mediatek.com>
> + *         Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/soc/mediatek/infracfg.h>
> +#include <linux/soc/mediatek/mtk_sip_svc.h>
> +#include <sound/pcm_params.h>
> +#include "mt8188-afe-common.h"
> +#include "mt8188-afe-clk.h"
> +#include "mt8188-reg.h"
> +#include "../common/mtk-afe-platform-driver.h"
> +#include "../common/mtk-afe-fe-dai.h"
> +
> +#define MTK_SIP_AUDIO_CONTROL MTK_SIP_SMC_CMD(0x517)

This definition goes to include/linux/soc/mediatek/mtk_sip_svc.h

> +
> +#define MT8188_MEMIF_BUFFER_BYTES_ALIGN  (0x40)
> +#define MT8188_MEMIF_DL7_MAX_PERIOD_SIZE (0x3fff)
> +
> +#define MEMIF_AXI_MINLEN 9 //register default value

...and please fix comments style.

> +
> +struct mtk_dai_memif_priv {
> +	unsigned int asys_timing_sel;
> +	unsigned int fs_timing;
> +};
> +

..snip..

> +
> +MODULE_DESCRIPTION("Mediatek ALSA SoC AFE platform driver for 8188");

MediaTek SoC AFE platform driver for ALSA MT8188

> +MODULE_AUTHOR("Chun-Chia.Chiu <chun-chia.chiu@mediatek.com>");
> +MODULE_LICENSE("GPL");




