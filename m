Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9567C001DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71Y7fvFf23DlcHVQnn1+VCuGejkZ90AHi9Sx80BiLrU=; b=n4U4XgEN0tY4tnBu8tRFjf8BMc
	y6xcBBfkM/95Rf8xrbZzWKwQH5f9yGs+igj3QU1moHt8oKeZNoK71sw9fwAMUR7IEQjjEDRGcGvPh
	PFf4xS828PKXZD8SV3ik2r18ibWRFDbreztvXmPkSUnuJxx3ueUdHXrIJE9568Jl0DABDiLLUogAE
	4apALWzfat0E/6DGVXjlGd24mNMVGlQYB3vn8X0EVqIo4DZixwEZpBJcqUgP3GtKrQG5n/12W4U/t
	QVLlBsT+3LXwtAW8qH2h4kGPs9B/l6zI9mHPY+cbdqJ96hZuCcOyhIN1PDXfH9QYPf8hKlt3TmTSq
	oV9cDDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqtq-00ByzU-09;
	Fri, 04 Aug 2023 09:15:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqtm-00ByyL-1A
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 09:15:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso17095525e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Aug 2023 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691140504; x=1691745304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71Y7fvFf23DlcHVQnn1+VCuGejkZ90AHi9Sx80BiLrU=;
        b=YCd0E+msh2iovWRHo6etrB96IEVPx9bTD6paLhaxTy410eEXt6Ao221ZgMRwlzMTg4
         TcLe0eyw/IncHgE4yhCcBKNE0U9v5ymweVIy7sO0fx56PieWmXvqa0QJdUb+P3tTFGF0
         MZYSPSTegQ9j4N3kCWnL3YdxPFpJQCXs3b3KyoQi7fzVH7OcsfVxBDOk67aah8VlAC8f
         FYBBNi92tWBGc2zmH5hPnB2ZIzShRwfxH/zrA/PxsegqvkEfyr3YVgdJ4/cv1rpVqq2U
         7P1Qy943XdbjQCSm8DR5A57Tj64iy2RSTxOrJSuEdD3cJUqwgcSByW2J8+ZTfQyQNsRG
         0Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691140504; x=1691745304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71Y7fvFf23DlcHVQnn1+VCuGejkZ90AHi9Sx80BiLrU=;
        b=MkQ5tNK8+wIE4Sy62xEbNNf6lkX4PlqiYPtDycGnSjOy8ghCnIauwOgmwDsB+VgdLF
         vt/SQ8gf73U/Ut0rNTbj+TYy+GLskL84ie8vhZ8P4FqRljq6U0Vme8kFgjNFSqZ4ns2m
         PUJ7wwxGMmuyIkSNKYyKRbcAf8hYcwnRFGfwQyzjqYzBIIbUPPCGnP/Zkru2ragufxLb
         EH3hVJPSGIRwten8DFdupaHapKD1l078oVt3qcQWwFY3+1Yrq5Bc3ToHOGKFUedjBiH/
         +EakFBTEfhWsnf9dmMr/nnWwnSfBPM7wVgPunf9U5kJKQOuolMHz30DJsHpMyhzs3Gf/
         3xww==
X-Gm-Message-State: AOJu0YwfDelA5x4kwJ2HPqOyP9E5w5eAjt9DqdNuP6DOxAxy2eiULU+f
	61MKv9KM9nkFJfZ1a0FWWVKO1w==
X-Google-Smtp-Source: AGHT+IEdwy67IM7wQzFY9zbOqk6aVpwyIEai6eqbnk6UqIWFL8cDm0ellxQL8yh/OIYFEy/H85s8JA==
X-Received: by 2002:a05:600c:452:b0:3fe:1660:7e71 with SMTP id s18-20020a05600c045200b003fe16607e71mr960232wmb.41.1691140503706;
        Fri, 04 Aug 2023 02:15:03 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm6224919wmc.0.2023.08.04.02.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 02:15:03 -0700 (PDT)
Message-ID: <a5a12190-f872-1fae-ad7a-7cf9ca7e9502@baylibre.com>
Date: Fri, 4 Aug 2023 11:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] ASoC: mediatek: mt7986: add common header
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-2-maso.huang@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230728090819.18038-2-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_021506_582390_B36FD96B 
X-CRM114-Status: GOOD (  18.68  )
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



On 28/07/2023 11:08, Maso Huang wrote:
> Add header files for register definition and structure.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   sound/soc/mediatek/mt7986/mt7986-afe-common.h |  49 +++++
>   sound/soc/mediatek/mt7986/mt7986-reg.h        | 206 ++++++++++++++++++
>   2 files changed, 255 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-common.h b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
> new file mode 100644
> index 000000000000..1c59549d91b4
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt7986-afe-common.h  --  MediaTek 7986 audio driver definitions
> + *
> + * Copyright (c) 2021 MediaTek Inc.

2023

> + * Author: Vic Wu <vic.wu@mediatek.com>

Authors

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
> index 000000000000..88861f81890f
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-reg.h
> @@ -0,0 +1,206 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt7986-reg.h  --  MediaTek 7986 audio driver reg definition
> + *
> + * Copyright (c) 2021 MediaTek Inc.

Ditto

> + * Author: Vic Wu <vic.wu@mediatek.com>

Ditto

> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#ifndef _MT7986_REG_H_
> +#define _MT7986_REG_H_
> +
> +#define AUDIO_TOP_CON2                  0x0008
> +#define AUDIO_TOP_CON4                  0x0010
> +#define AUDIO_ENGEN_CON0                0x0014
> +#define AFE_IRQ_MCU_EN                  0x0100
> +#define AFE_IRQ_MCU_STATUS              0x0120
> +#define AFE_IRQ_MCU_CLR                 0x0128
> +#define AFE_IRQ0_MCU_CFG0               0x0140
> +#define AFE_IRQ0_MCU_CFG1               0x0144
> +#define AFE_IRQ1_MCU_CFG0               0x0148
> +#define AFE_IRQ1_MCU_CFG1               0x014c
> +#define AFE_IRQ2_MCU_CFG0               0x0150
> +#define AFE_IRQ2_MCU_CFG1               0x0154
> +#define ETDM_IN5_CON0                   0x13f0
> +#define ETDM_IN5_CON1                   0x13f4
> +#define ETDM_IN5_CON2                   0x13f8
> +#define ETDM_IN5_CON3                   0x13fc
> +#define ETDM_IN5_CON4                   0x1400
> +#define ETDM_OUT5_CON0                  0x1570
> +#define ETDM_OUT5_CON4                  0x1580
> +#define ETDM_OUT5_CON5                  0x1584
> +#define ETDM_4_7_COWORK_CON0            0x15e0
> +#define ETDM_4_7_COWORK_CON1            0x15e4
> +#define AFE_CONN018_1                   0x1b44
> +#define AFE_CONN018_4                   0x1b50
> +#define AFE_CONN019_1                   0x1b64
> +#define AFE_CONN019_4                   0x1b70
> +#define AFE_CONN124_1                   0x2884
> +#define AFE_CONN124_4                   0x2890
> +#define AFE_CONN125_1                   0x28a4
> +#define AFE_CONN125_4                   0x28b0
> +#define AFE_CONN_RS_0                   0x3920
> +#define AFE_CONN_RS_3                   0x392c
> +#define AFE_CONN_16BIT_0                0x3960
> +#define AFE_CONN_16BIT_3                0x396c
> +#define AFE_CONN_24BIT_0                0x3980
> +#define AFE_CONN_24BIT_3                0x398c
> +#define AFE_MEMIF_CON0                  0x3d98
> +#define AFE_MEMIF_RD_MON                0x3da0
> +#define AFE_MEMIF_WR_MON                0x3da4
> +#define AFE_DL0_BASE_MSB                0x3e40
> +#define AFE_DL0_BASE                    0x3e44
> +#define AFE_DL0_CUR_MSB                 0x3e48
> +#define AFE_DL0_CUR                     0x3e4c
> +#define AFE_DL0_END_MSB                 0x3e50
> +#define AFE_DL0_END                     0x3e54
> +#define AFE_DL0_RCH_MON                 0x3e58
> +#define AFE_DL0_LCH_MON                 0x3e5c
> +#define AFE_DL0_CON0                    0x3e60
> +#define AFE_VUL0_BASE_MSB               0x4220
> +#define AFE_VUL0_BASE                   0x4224
> +#define AFE_VUL0_CUR_MSB                0x4228
> +#define AFE_VUL0_CUR                    0x422c
> +#define AFE_VUL0_END_MSB                0x4230
> +#define AFE_VUL0_END                    0x4234
> +#define AFE_VUL0_CON0                   0x4238
> +
> +#define AFE_MAX_REGISTER AFE_VUL0_CON0
> +#define AFE_IRQ_STATUS_BITS             0x7
> +#define AFE_IRQ_CNT_SHIFT               0
> +#define AFE_IRQ_CNT_MASK	        0xffffff
> +
> +/* AUDIO_TOP_CON2 */
> +#define CLK_OUT5_PDN                    BIT(14)
> +#define CLK_OUT5_PDN_MASK               BIT(14)
> +#define CLK_IN5_PDN                     BIT(7)
> +#define CLK_IN5_PDN_MASK                BIT(7)
> +
> +/* AUDIO_TOP_CON4 */
> +#define PDN_APLL_TUNER2                 BIT(12)
> +#define PDN_APLL_TUNER2_MASK            BIT(12)
> +
> +/* AUDIO_ENGEN_CON0 */
> +#define AUD_APLL2_EN                    BIT(3)
> +#define AUD_APLL2_EN_MASK               BIT(3)
> +#define AUD_26M_EN                      BIT(0)
> +#define AUD_26M_EN_MASK                 BIT(0)
> +
> +/* AFE_DL0_CON0 */
> +#define DL0_ON_SFT                      28
> +#define DL0_ON_MASK                     0x1
> +#define DL0_ON_MASK_SFT                 BIT(28)
> +#define DL0_MINLEN_SFT                  20
> +#define DL0_MINLEN_MASK                 0xf
> +#define DL0_MINLEN_MASK_SFT             (0xf << 20)
> +#define DL0_MODE_SFT                    8
> +#define DL0_MODE_MASK                   0x1f
> +#define DL0_MODE_MASK_SFT               (0x1f << 8)
> +#define DL0_PBUF_SIZE_SFT               5
> +#define DL0_PBUF_SIZE_MASK              0x3
> +#define DL0_PBUF_SIZE_MASK_SFT          (0x3 << 5)
> +#define DL0_MONO_SFT                    4
> +#define DL0_MONO_MASK                   0x1
> +#define DL0_MONO_MASK_SFT               BIT(4)
> +#define DL0_HALIGN_SFT                  2
> +#define DL0_HALIGN_MASK                 0x1
> +#define DL0_HALIGN_MASK_SFT             BIT(2)
> +#define DL0_HD_MODE_SFT                 0
> +#define DL0_HD_MODE_MASK                0x3
> +#define DL0_HD_MODE_MASK_SFT            (0x3 << 0)
> +
> +/* AFE_VUL0_CON0 */
> +#define VUL0_ON_SFT                     28
> +#define VUL0_ON_MASK                    0x1
> +#define VUL0_ON_MASK_SFT                BIT(28)
> +#define VUL0_MODE_SFT                   8
> +#define VUL0_MODE_MASK                  0x1f
> +#define VUL0_MODE_MASK_SFT              (0x1f << 8)
> +#define VUL0_MONO_SFT                   4
> +#define VUL0_MONO_MASK                  0x1
> +#define VUL0_MONO_MASK_SFT              BIT(4)
> +#define VUL0_HALIGN_SFT                 2
> +#define VUL0_HALIGN_MASK                0x1
> +#define VUL0_HALIGN_MASK_SFT            BIT(2)
> +#define VUL0_HD_MODE_SFT                0
> +#define VUL0_HD_MODE_MASK               0x3
> +#define VUL0_HD_MODE_MASK_SFT           (0x3 << 0)
> +
> +/* AFE_IRQ_MCU_CON */
> +#define IRQ_MCU_MODE_SFT                4
> +#define IRQ_MCU_MODE_MASK               0x1f
> +#define IRQ_MCU_MODE_MASK_SFT           (0x1f << 4)
> +#define IRQ_MCU_ON_SFT                  0
> +#define IRQ_MCU_ON_MASK                 0x1
> +#define IRQ_MCU_ON_MASK_SFT             BIT(0)
> +#define IRQ0_MCU_CLR_SFT                0
> +#define IRQ0_MCU_CLR_MASK               0x1
> +#define IRQ0_MCU_CLR_MASK_SFT           BIT(0)
> +#define IRQ1_MCU_CLR_SFT                1
> +#define IRQ1_MCU_CLR_MASK               0x1
> +#define IRQ1_MCU_CLR_MASK_SFT           BIT(1)
> +#define IRQ2_MCU_CLR_SFT                2
> +#define IRQ2_MCU_CLR_MASK               0x1
> +#define IRQ2_MCU_CLR_MASK_SFT           BIT(2)
> +
> +/* ETDM_IN5_CON2 */
> +#define IN_CLK_SRC(x)                   ((x) << 10)
> +#define IN_CLK_SRC_SFT                  10
> +#define IN_CLK_SRC_MASK                 GENMASK(12, 10)
> +
> +/* ETDM_IN5_CON3 */
> +#define IN_SEL_FS(x)                    ((x) << 26)
> +#define IN_SEL_FS_SFT                   26
> +#define IN_SEL_FS_MASK                  GENMASK(30, 26)
> +
> +/* ETDM_IN5_CON4 */
> +#define IN_RELATCH(x)                   ((x) << 20)
> +#define IN_RELATCH_SFT                  20
> +#define IN_RELATCH_MASK                 GENMASK(24, 20)
> +#define IN_CLK_INV                      BIT(18)
> +#define IN_CLK_INV_MASK                 BIT(18)
> +
> +/* ETDM_IN5_CON0 & ETDM_OUT5_CON0 */
> +#define RELATCH_SRC(x)                  ((x) << 28)
> +#define RELATCH_SRC_SFT                 28
> +#define RELATCH_SRC_MASK                GENMASK(30, 28)
> +#define ETDM_CH_NUM(x)                  (((x) - 1) << 23)
> +#define ETDM_CH_NUM_SFT                 23
> +#define ETDM_CH_NUM_MASK                GENMASK(27, 23)
> +#define ETDM_WRD_LEN(x)                 (((x) - 1) << 16)
> +#define ETDM_WRD_LEN_SFT                16
> +#define ETDM_WRD_LEN_MASK               GENMASK(20, 16)
> +#define ETDM_BIT_LEN(x)                 (((x) - 1) << 11)
> +#define ETDM_BIT_LEN_SFT                11
> +#define ETDM_BIT_LEN_MASK               GENMASK(15, 11)
> +#define ETDM_FMT(x)                     ((x) << 6)
> +#define ETDM_FMT_SFT                    6
> +#define ETDM_FMT_MASK                   GENMASK(8, 6)
> +#define ETDM_SYNC                       BIT(1)
> +#define ETDM_SYNC_MASK                  BIT(1)
> +#define ETDM_EN                         BIT(0)
> +#define ETDM_EN_MASK                    BIT(0)
> +
> +/* ETDM_OUT5_CON4 */
> +#define OUT_RELATCH(x)                  ((x) << 24)
> +#define OUT_RELATCH_SFT                 24
> +#define OUT_RELATCH_MASK                GENMASK(28, 24)
> +#define OUT_CLK_SRC(x)                  ((x) << 6)
> +#define OUT_CLK_SRC_SFT                 6
> +#define OUT_CLK_SRC_MASK                GENMASK(8, 6)
> +#define OUT_SEL_FS(x)                   (x)
> +#define OUT_SEL_FS_SFT                  0
> +#define OUT_SEL_FS_MASK                 GENMASK(4, 0)
> +
> +/* ETDM_OUT5_CON5 */
> +#define ETDM_CLK_DIV                    BIT(12)
> +#define ETDM_CLK_DIV_MASK               BIT(12)
> +#define OUT_CLK_INV                     BIT(9)
> +#define OUT_CLK_INV_MASK                BIT(9)
> +
> +/* ETDM_4_7_COWORK_CON0 */
> +#define OUT_SEL(x)                      ((x) << 12)
> +#define OUT_SEL_SFT                     12
> +#define OUT_SEL_MASK                    GENMASK(15, 12)
> +#endif

-- 
Regards,
Alexandre

