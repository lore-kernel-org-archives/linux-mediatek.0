Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7CCC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=263kdZgnRqzerSWib+mCg2La+YNAoMyoPbgONXVRiM4=; b=Bah7NfrZF2o3afWegVe3d3bUp+
	WpsPXUEEzke6EjI3GSiocEFdcgeLCp7i+kpIfmKU1mgm3yjUWxe2fCuTLEWkFC78ClOROEBQhu7AQ
	nEekZgu/rMlnpUDNt4UgnuXwlS2z04ec6gh8kWkmGBomprPqNeeXtwl95LWn3twkSvUcqQ47DqXNc
	DE4972daFsocP9YbzWBV11KSyiCSWCdghJM3vLyLgcEbyJtjT8rxyL58xcK354o2jgn0WA7viPGMW
	NE8Qxay946h30YTPh/YoUMMk31Z7HsOpBL0U/eKFy44qHEp0Jn149AsO0xV2GbNojvCax5GWE9nvA
	lUyVbc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGiL-005mVF-DG; Fri, 15 Jul 2022 08:30:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGiA-005mT4-Tf; Fri, 15 Jul 2022 08:30:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A0B06601A3F;
	Fri, 15 Jul 2022 09:30:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657873809;
	bh=yV+EX0IUwg0zIL0JwslSh38WgL8nzrwNzm1NDjXhZVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NPw6pWWqRz6rvL3VqqcHhHNCjH4Y9tl2A+101/CFbnBZn4lp3svR7iW7ikOlN8wJz
	 4mZSeZKYmiWE1+KnbpNAMSC8l61ztZCbtZZ8b9uDvS2WYv3lFngFOyOjop+aagY6W9
	 +hSlgDyJD2d51NXLFw8Ows4j0ogBE8OUsW3N8bj+ojVMugDVvB5+2fnBHZxjfebGXF
	 Gyzvzv9lWns3jG8KgVnh81F7Mx3hc/lvoeOBLRRwUdLoS8+d4IzbfEW9xDa4A1qiW/
	 h2GYz+eKljD3NXBEYXIkEojVqe0Bm6YnKi0PH9f0UMgOrQcGWD8hSmyOBtNeovWMqn
	 3TRH7sDDZFj+g==
Message-ID: <b2dc196f-19d2-4d9a-4feb-ec335249aaad@collabora.com>
Date: Fri, 15 Jul 2022 10:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: mediatek: mt8195: extract SOF common code
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: matthias.bgg@gmail.com, trevor.wu@mediatek.com, tzungbi@google.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220715034223.3897-1-chunxu.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715034223.3897-1-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_013011_122704_028935A7 
X-CRM114-Status: GOOD (  18.81  )
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

Il 15/07/22 05:42, Chunxu Li ha scritto:
> The functions related to SOF can be reused in different machine drivers,
> such as mt8195 or mt8186, so extract the common code to avoid duplication.
> 
> Set mtk_soc_card_data which include machine private data and SOF private
> data as card drvdata, then the difference between machine private can be
> ignored such as mt8195_mt6359_priv or mt8186_mt6366_priv, at the same
> time the SOF related code can be reused in different machine drivers.
> 
> Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
> ---
>   sound/soc/mediatek/common/Makefile            |   2 +-
>   .../soc/mediatek/common/mtk-dsp-sof-common.c  | 196 +++++++++++++++
>   .../soc/mediatek/common/mtk-dsp-sof-common.h  |  35 +++
>   sound/soc/mediatek/common/mtk-soc-card.h      |  17 ++
>   sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 233 ++++--------------
>   5 files changed, 300 insertions(+), 183 deletions(-)
>   create mode 100644 sound/soc/mediatek/common/mtk-dsp-sof-common.c
>   create mode 100644 sound/soc/mediatek/common/mtk-dsp-sof-common.h
>   create mode 100644 sound/soc/mediatek/common/mtk-soc-card.h
> 
> diff --git a/sound/soc/mediatek/common/Makefile b/sound/soc/mediatek/common/Makefile
> index acbe01e9e928..576deb7f8cce 100644
> --- a/sound/soc/mediatek/common/Makefile
> +++ b/sound/soc/mediatek/common/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # platform driver
> -snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o
> +snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o
>   obj-$(CONFIG_SND_SOC_MEDIATEK) += snd-soc-mtk-common.o
>   
>   obj-$(CONFIG_SND_SOC_MTK_BTCVSD) += mtk-btcvsd.o
> diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
> new file mode 100644
> index 000000000000..1098694f4f36
> --- /dev/null
> +++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mtk-dsp-sof-common.c  --  MediaTek dsp sof common ctrl
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chunxu Li <chunxu.li@mediatek.com>
> + */
> +
> +#include <mtk-dsp-sof-common.h>
> +#include <mtk-soc-card.h>

Did you mean.....

#include "mtk-dsp-sof-common.h"
#include "mtk-soc-card.h"


> +
> +/* fixup the BE DAI link to match any values from topology */
> +int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
> +			   struct snd_pcm_hw_params *params)
> +{

..snip..

> diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.h b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
> new file mode 100644
> index 000000000000..f02ba2ce3718
> --- /dev/null
> +++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mtk-dsp-sof-common.h  --  MediaTek dsp sof common definition
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chunxu Li <chunxu.li@mediatek.com>
> + */
> +
> +#ifndef _MTK_DSP_SOF_COMMON_H_
> +#define _MTK_DSP_SOF_COMMON_H_
> +
> +#include <sound/soc.h>

Leave a blank line here.

> +struct sof_conn_stream {
> +	const char *normal_link;
> +	const char *sof_link;
> +	const char *sof_dma;
> +	int stream_dir;
> +};
> +

Thanks,
Angelo

