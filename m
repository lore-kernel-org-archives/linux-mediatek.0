Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F768EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGaQkTb7NVL71r3VqkfBk/1SCRC9sQdqYnOL9DOZuBk=; b=JSfZ1h3001UWJxTiX+46ltirmq
	X9GPEuEY5uPP4YvBDq8ICPmgTwtd7mjyapA/U/IG+9+1xVA3/fgeYqPH9pVlgNIaQ8ZLRO/7ueAFl
	IZ71VmozZSzE/DkcC6+l3Z3JdH/xL4LYFi82KSpEMPIhrHIBWSYjupORDkUofRxwPZiPKBx9Jd0Gx
	osgdyHi7pF5N8HoxfVhjcCIl+EpEiwhKJMLeTAICMcq4xXmo17dxLm41ct9tA2QAV6KThYmkkIw3T
	z8Nwg0mW/mRiDJUvDiTGDRNSv7GEIH6xsVjPDle/USA2UWIh1FN4Wj3+cFp2LjtTR3b4nDGncUtdg
	6Kst/dYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbuP-00CeFi-0n;
	Tue, 04 Jul 2023 09:01:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbuM-00CeEg-1L;
	Tue, 04 Jul 2023 09:01:15 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E5D856606ED1;
	Tue,  4 Jul 2023 10:01:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688461272;
	bh=Sc7fq+rTOlTB0mP3kaMF9Dy8NIoMJX8FCQ4muEAYp6A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=O2D7hTO3dCooM7TV2L607b3CAeHCPy9CXrnmemtTqdcNVqW3OaHCRHR7Xei0SA5X1
	 vR/6dkqKCAqnF1iRFd2yFrNM+f0POcDBln/YzdOD1ymssEJMSXIcUgLELMu/sLZEeY
	 n4zoBbPJpqXb6euNRgMglQZzpvMxg21TtOct7VM2CnY94lp7H+Vbob7KG1rg1EGRpG
	 9WfDXiRGDAc56LsxFAjplAI1ZXwOXwvFq38TS1FF5ClTKSIRaiwKJl2ftQ2qvmPGW6
	 oYmxqDzfh34SUJECqwaNwfc5Bgat0skEr9UrvPg6b38fUwaS3HauJbn4ExwnCMPnkG
	 l0WxMXD+1tSRg==
Message-ID: <bb13702f-801d-57f4-64d1-077dd977d43b@collabora.com>
Date: Tue, 4 Jul 2023 11:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/7] ASoC: mediatek: mt7986: add common header
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-2-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626023501.11120-2-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_020114_594744_C0A61DC0 
X-CRM114-Status: GOOD (  18.75  )
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

Il 26/06/23 04:34, Maso Huang ha scritto:
> Add header files for register definition and structure.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/mt7986/mt7986-afe-common.h |  51 +++++
>   sound/soc/mediatek/mt7986/mt7986-reg.h        | 206 ++++++++++++++++++
>   2 files changed, 257 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-common.h b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
> new file mode 100644
> index 000000000000..646e1be4fdce
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt7986-afe-common.h  --  MediaTek 7986 audio driver definitions
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Vic Wu <vic.wu@mediatek.com>
> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#ifndef _MT_7986_AFE_COMMON_H_
> +#define _MT_7986_AFE_COMMON_H_
> +
> +#include <sound/soc.h>
> +#include <linux/clk.h>
> +#include <linux/list.h>
> +#include <linux/regmap.h>
> +#include "../common/mtk-base-afe.h"
> +
> +enum {
> +	MT7986_MEMIF_DL1,
> +	MT7986_MEMIF_VUL12,
> +	MT7986_MEMIF_NUM,
> +	MT7986_DAI_ETDM = MT7986_MEMIF_NUM,
> +	MT7986_DAI_NUM,
> +};
> +
> +enum {
> +	MT7986_IRQ_0,
> +	MT7986_IRQ_1,
> +	MT7986_IRQ_2,
> +	MT7986_IRQ_NUM,
> +};
> +
> +struct clk;
> +
> +struct mt7986_afe_private {
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +
> +	int pm_runtime_bypass_reg_ctl;
> +
> +	/* dai */
> +	void *dai_priv[MT7986_DAI_NUM];
> +};
> +
> +unsigned int mt7986_afe_rate_transform(struct device *dev,
> +				       unsigned int rate);
> +
> +/* dai register */
> +int mt7986_dai_etdm_register(struct mtk_base_afe *afe);
> +#endif
> diff --git a/sound/soc/mediatek/mt7986/mt7986-reg.h b/sound/soc/mediatek/mt7986/mt7986-reg.h
> new file mode 100644
> index 000000000000..6433cdf3da92
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-reg.h
> @@ -0,0 +1,206 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt7986-reg.h  --  MediaTek 7986 audio driver reg definition
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Vic Wu <vic.wu@mediatek.com>
> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#ifndef _MT7986_REG_H_
> +#define _MT7986_REG_H_

..snip..

> +/* ETDM_OUT5_CON4 */
> +#define OUT_RELATCH(x)                  ((x) << 24)
> +#define OUT_RELATCH_SFT                 24
> +#define OUT_RELATCH_MASK                GENMASK(28, 24)
> +#define OUT_CLK_SRC(x)                  ((x) << 6)
> +#define OUT_CLK_SRC_SFT                 6
> +#define OUT_CLK_SRC_MASK                GENMASK(8, 6)
> +#define OUT_SEL_FS(x)                   ((x) << 0)

A number shifted by zero bits is equal to itself, so, this statement doesn't
make sense. I understand why you want a OUT_SEL_FS(x) definition though, so
you could do it like:

#define OUT_SEL_FS(x)			(x)

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

