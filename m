Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D65C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADI/JMbxw5pQH+0aG3W+oDghuJ0ix2nu4aszhgV14lo=; b=X0tARSJZTwJKKi
	ka1aNToDG2K7HNB63tJavinTKorXlIbxdoMxSO20pR+u2Jvsk91vT1JDCw999SCL8g1hHlx9y0K75
	Ax6Tp6L0KD2l4rENza3WDFHmnzC+w03XkKYbkyOycxXV3LTjSt4S1mOovawkq674noOE4fwP0Ob2J
	g4Hmry3MpuF04t6RM+2exisg2VZnSl5Yd1U8a/uq6WIFah+hedjP7IV73ieYqemhXvkSYMNWfv1zQ
	pqktDzr5/T8n84MhW42aCfujeN9D8nfaDGBhxe9OwKncqCXBZhw4xzn1EhXTukFIA/AASuFNj3s4F
	Y0Qa19pzVJ4VIJZVAgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTi2D-004zKY-Lh; Mon, 14 Mar 2022 10:34:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTi20-004zH9-9J; Mon, 14 Mar 2022 10:34:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 41CC61F43B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647254067;
 bh=NDvmjZYnQWqznSyedRPSl/wQ+D9+4vjA/lAgqizfY98=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I6YlEfdpUsEa48Pi5JMaX0Hp6Ta/m7aIphZKlTbj6jqKOFI14X7kPLe/lB8Z2SO9u
 dwwmeIYyFn3csID3+l0U1ZwEMSD6UfxgSgHvGPlPWgstjypHioci7zIg6maXYP8cSY
 i5jOeJIeI894XBqm51exce6kp5fdxjL5qrAsfH0jLgPvcWTEOqyIST7ZhcIEaHQG4c
 +1Ob6Rg5a0y+XGZcy8pIV5aLtVqU3hqc+66VSC/c3HgaAhaWRdf+a6ODRSCzj+6abn
 HC6hdgPxazs1rFtj5jfSe+6wervU0afSScuZL0eQQ6dGis/51ChQBsTaz+QxP0CV3U
 ammt+a0KEqKGA==
Message-ID: <4c695b65-a30b-f17c-762b-055987c7682e@collabora.com>
Date: Mon, 14 Mar 2022 11:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 09/19] ASoC: mediatek: mt8186: support src in platform driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-10-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-10-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_033428_639690_0AD2F1BA 
X-CRM114-Status: GOOD (  23.16  )
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add mt8186 src dai driver
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-src.c | 726 +++++++++++++++++++++
>   1 file changed, 726 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-src.c
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-src.c b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
> new file mode 100644
> index 000000000000..0277cb0ad3f2
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
> @@ -0,0 +1,726 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +//  MediaTek ALSA SoC Audio DAI SRC Control
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> +
> +#include <linux/regmap.h>
> +#include "mt8186-afe-common.h"
> +#include "mt8186-interconnection.h"
> +

..snip..

> +
> +static const unsigned int *get_iir_coeff(unsigned int rate_in,
> +					 unsigned int rate_out,
> +					 unsigned int *param_num)
> +{
> +	if (rate_in == 32000 && rate_out == 16000) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_32_to_16);
> +		return src_iir_coeff_32_to_16;
> +	} else if (rate_in == 44100 && rate_out == 16000) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_44_to_16);
> +		return src_iir_coeff_44_to_16;
> +	} else if (rate_in == 44100 && rate_out == 32000) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_44_to_32);
> +		return src_iir_coeff_44_to_32;
> +	} else if ((rate_in == 48000 && rate_out == 16000) ||
> +		   (rate_in == 96000 && rate_out == 32000)) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_48_to_16);
> +		return src_iir_coeff_48_to_16;
> +	} else if (rate_in == 48000 && rate_out == 32000) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_48_to_32);
> +		return src_iir_coeff_48_to_32;
> +	} else if (rate_in == 48000 && rate_out == 44100) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_48_to_44);
> +		return src_iir_coeff_48_to_44;
> +	} else if (rate_in == 96000 && rate_out == 16000) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_96_to_16);
> +		return src_iir_coeff_96_to_16;
> +	} else if ((rate_in == 96000 && rate_out == 44100) ||
> +		   (rate_in == 48000 && rate_out == 22050)) {
> +		*param_num = ARRAY_SIZE(src_iir_coeff_96_to_44);
> +		return src_iir_coeff_96_to_44;
> +	}
> +
> +	*param_num = 0;
> +	return NULL;
> +}
> +
> +#define DEBUG_COEFF

I think that this debugging hackery unintentionally slipped through... or was
that intentional?
In the latter case, if you want to provide a way to debug that, you should
use debugfs instead...

Please, either remove this debugging code, or use debugfs.

Thanks,
Angelo

> +static int mtk_set_src_1_param(struct mtk_base_afe *afe, int id)
> +{
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_afe_src_priv *src_priv = afe_priv->dai_priv[id];
> +	unsigned int iir_coeff_num;
> +	unsigned int iir_stage;
> +	int rate_in = src_priv->dl_rate;
> +	int rate_out = src_priv->ul_rate;
> +	unsigned int out_freq_mode = mtk_get_src_freq_mode(afe, rate_out);
> +	unsigned int in_freq_mode = mtk_get_src_freq_mode(afe, rate_in);
> +
> +	/* set out freq mode */
> +	regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON3,
> +			   G_SRC_ASM_FREQ_4_MASK_SFT,
> +			   out_freq_mode << G_SRC_ASM_FREQ_4_SFT);
> +
> +	/* set in freq mode */
> +	regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON4,
> +			   G_SRC_ASM_FREQ_5_MASK_SFT,
> +			   in_freq_mode << G_SRC_ASM_FREQ_5_SFT);
> +
> +	regmap_write(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON5, 0x3f5986);
> +	regmap_write(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON5, 0x3f5987);
> +	regmap_write(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON6, 0x1fbd);
> +	regmap_write(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON2, 0);
> +
> +	/* set iir if in_rate > out_rate */
> +	if (rate_in > rate_out) {
> +		int i;
> +#ifdef DEBUG_COEFF
> +		int reg_val;
> +#endif
> +		const unsigned int *iir_coeff = get_iir_coeff(rate_in, rate_out,
> +							      &iir_coeff_num);
> +
> +		if (iir_coeff_num == 0 || !iir_coeff) {
> +			dev_err(afe->dev, "%s(), iir coeff error, num %d, coeff %p\n",
> +				__func__, iir_coeff_num, iir_coeff);
> +			return -EINVAL;
> +		}
> +
> +		/* COEFF_SRAM_CTRL */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON0,
> +				   G_SRC_COEFF_SRAM_CTRL_MASK_SFT,
> +				   BIT(G_SRC_COEFF_SRAM_CTRL_SFT));
> +		/* Clear coeff history to r/w coeff from the first position */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON13,
> +				   G_SRC_COEFF_SRAM_ADR_MASK_SFT, 0);
> +		/* Write SRC coeff, should not read the reg during write */
> +		for (i = 0; i < iir_coeff_num; i++)
> +			regmap_write(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON12,
> +				     iir_coeff[i]);
> +
> +#ifdef DEBUG_COEFF
> +		regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON13,
> +				   G_SRC_COEFF_SRAM_ADR_MASK_SFT, 0);
> +
> +		for (i = 0; i < iir_coeff_num; i++) {
> +			regmap_read(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON12,
> +				    &reg_val);
> +			dev_info(afe->dev, "%s(), i = %d, coeff = 0x%x\n",
> +				 __func__, i, reg_val);
> +		}
> +#endif
> +		/* disable sram access */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON0,
> +				   G_SRC_COEFF_SRAM_CTRL_MASK_SFT, 0);
> +		/* CHSET_IIR_STAGE */
> +		iir_stage = (iir_coeff_num / 6) - 1;
> +		regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON2,
> +				   G_SRC_CHSET_IIR_STAGE_MASK_SFT,
> +				   iir_stage << G_SRC_CHSET_IIR_STAGE_SFT);
> +		/* CHSET_IIR_EN */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON2,
> +				   G_SRC_CHSET_IIR_EN_MASK_SFT,
> +				   BIT(G_SRC_CHSET_IIR_EN_SFT));
> +	} else {
> +		/* CHSET_IIR_EN off */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL1_ASRC_2CH_CON2,
> +				   G_SRC_CHSET_IIR_EN_MASK_SFT, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_set_src_2_param(struct mtk_base_afe *afe, int id)
> +{
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_afe_src_priv *src_priv = afe_priv->dai_priv[id];
> +	unsigned int iir_coeff_num;
> +	unsigned int iir_stage;
> +	int rate_in = src_priv->dl_rate;
> +	int rate_out = src_priv->ul_rate;
> +	unsigned int out_freq_mode = mtk_get_src_freq_mode(afe, rate_out);
> +	unsigned int in_freq_mode = mtk_get_src_freq_mode(afe, rate_in);
> +
> +	/* set out freq mode */
> +	regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON3,
> +			   G_SRC_ASM_FREQ_4_MASK_SFT,
> +			   out_freq_mode << G_SRC_ASM_FREQ_4_SFT);
> +
> +	/* set in freq mode */
> +	regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON4,
> +			   G_SRC_ASM_FREQ_5_MASK_SFT,
> +			   in_freq_mode << G_SRC_ASM_FREQ_5_SFT);
> +
> +	regmap_write(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON5, 0x3f5986);
> +	regmap_write(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON5, 0x3f5987);
> +	regmap_write(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON6, 0x1fbd);
> +	regmap_write(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON2, 0);
> +
> +	/* set iir if in_rate > out_rate */
> +	if (rate_in > rate_out) {
> +		int i;
> +#ifdef DEBUG_COEFF
> +		int reg_val;
> +#endif
> +		const unsigned int *iir_coeff = get_iir_coeff(rate_in, rate_out,
> +							      &iir_coeff_num);
> +
> +		if (iir_coeff_num == 0 || !iir_coeff) {
> +			dev_err(afe->dev, "%s(), iir coeff error, num %d, coeff %p\n",
> +				 __func__, iir_coeff_num, iir_coeff);
> +			return -EINVAL;
> +		}
> +
> +		/* COEFF_SRAM_CTRL */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON0,
> +				   G_SRC_COEFF_SRAM_CTRL_MASK_SFT,
> +				   BIT(G_SRC_COEFF_SRAM_CTRL_SFT));
> +		/* Clear coeff history to r/w coeff from the first position */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON13,
> +				   G_SRC_COEFF_SRAM_ADR_MASK_SFT, 0);
> +		/* Write SRC coeff, should not read the reg during write */
> +		for (i = 0; i < iir_coeff_num; i++)
> +			regmap_write(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON12,
> +				     iir_coeff[i]);
> +
> +#ifdef DEBUG_COEFF
> +		regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON13,
> +				   G_SRC_COEFF_SRAM_ADR_MASK_SFT, 0);
> +
> +		for (i = 0; i < iir_coeff_num; i++) {
> +			regmap_read(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON12,
> +				    &reg_val);
> +			dev_info(afe->dev, "%s(), i = %d, coeff = 0x%x\n",
> +				 __func__, i, reg_val);
> +		}
> +#endif
> +		/* disable sram access */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON0,
> +				   G_SRC_COEFF_SRAM_CTRL_MASK_SFT, 0);
> +		/* CHSET_IIR_STAGE */
> +		iir_stage = (iir_coeff_num / 6) - 1;
> +		regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON2,
> +				   G_SRC_CHSET_IIR_STAGE_MASK_SFT,
> +				   iir_stage << G_SRC_CHSET_IIR_STAGE_SFT);
> +		/* CHSET_IIR_EN */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON2,
> +				   G_SRC_CHSET_IIR_EN_MASK_SFT,
> +				   BIT(G_SRC_CHSET_IIR_EN_SFT));
> +	} else {
> +		/* CHSET_IIR_EN off */
> +		regmap_update_bits(afe->regmap, AFE_GENERAL2_ASRC_2CH_CON2,
> +				   G_SRC_CHSET_IIR_EN_MASK_SFT, 0);
> +	}
> +
> +	return 0;
> +}
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
