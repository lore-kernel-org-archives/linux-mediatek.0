Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906B8C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESqpgXASMhYP4fTQPFY8dz7/EmYLD0Rzk+MUzqAI9/E=; b=IaeT7wxPtN2YjJIA0QsCnNsMOu
	JmWBQcsbszHjr8b+zsZBfEUhZS1ubqgaTfv1+ZOJlAxKakm2bDroZJZhNsD4mP5FxndusaBQHAqWN
	74BrJnLCoWvB59mFg020QuuyrTythAPtaowBxNytQtkdUUs16t6PU8FM9ddd1fqAAnP4CUtvrfFmI
	+Luewp9fZ5u7XJerPcJUBEdy38JkTaabumkTNfDqSPSnjx/gANbgV8SEnXCFfK4b4ltkllC2KufP7
	FdWlyzonSLalD/YWXEc1MS3U6eTp6XPu9ONkcVPcUPKarSP8kATBokmVJE/noZvg+2KPpwakZ3mOw
	otlslcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs3e-00000000fzg-3K9Y;
	Wed, 19 Jun 2024 09:56:50 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs35-00000000fes-14uy;
	Wed, 19 Jun 2024 09:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790973;
	bh=tkiOYw0eqhfAoX/D0XNFeQSiPHu0lcAvizVef5/AGeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xl9tcqIB9kCQUbIu61a+gI584SUMFbXK5vMZW1Ne2z9NB9ZDNFr1ukxIFTS1ePq6t
	 FI33J3UP6XUOmnkZdKtpQmLvYpMIxXSeRqmGBqL3vdpSvBLQd5uRYE9jcziRnU6Y5T
	 ncjtl2haOgXwVahYD+s9ZaG2BiSh1sXb0wjBnBia9srSgo/cScxwrKal+BYczxK4nP
	 xyoaR7RWRqVV+EfnA/tMjMA5gfNvvQTLmCL0FkmgaDJU6mZIasMahQ+izXciHa350M
	 hg0xanxGVUVafyR81PBKsbat/D6CWpZZ91dc+uNX58jq+dC8q9DBXv+Ia5LUWjNvHl
	 nWuXQ7sKLbiCQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 646883782163;
	Wed, 19 Jun 2024 09:56:12 +0000 (UTC)
Message-ID: <966d5c3d-0595-4113-a507-4b8348ac4a77@collabora.com>
Date: Wed, 19 Jun 2024 11:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 04/16] ASoC: mediatek: mt8365: Add common header
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-4-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-4-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_025615_580856_B195E8C7 
X-CRM114-Status: GOOD (  19.82  )
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

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add header files for register definition and structure.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-common.h | 491 +++++++++++++
>   sound/soc/mediatek/mt8365/mt8365-reg.h        | 991 ++++++++++++++++++++++++++
>   2 files changed, 1482 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-common.h b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> new file mode 100644
> index 000000000000..4d8f8c4b19e3
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> @@ -0,0 +1,491 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Mediatek 8365 audio driver common definitions
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Jia Zeng <jia.zeng@mediatek.com>
> + *          Alexandre Mergnat <amergnat@baylibre.com>
> + */
> +
> +#ifndef _MT8365_AFE_COMMON_H_
> +#define _MT8365_AFE_COMMON_H_
> +
> +#define COMMON_CLOCK_FRAMEWORK_API
> +#define IDLE_TASK_DRIVER_API
> +#define ENABLE_AFE_APLL_TUNER

Those three definitions do not exist upstream. Please remove.

> +
> +#include <linux/clk.h>
> +#include <linux/list.h>
> +#include <linux/regmap.h>
> +#include <sound/soc.h>
> +#include <sound/asound.h>
> +#include "../common/mtk-base-afe.h"
> +#include "mt8365-reg.h"
> +
> +#define ENUM_TO_STR(enum) #enum

Unused definition

> +
> +#define snd_soc_dai_stream_active_playback(dai) \
> +		snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_PLAYBACK)
> +#define snd_soc_dai_stream_active_capture(dai) \
> +		snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_CAPTURE)
> +

Those are used only once and only in mt8365-dai-pcm.c, and I just noticed that.

Can you please just remove those two and directly call snd_soc_dai_stream_active()
with the right params in function mt8365_dai_pcm1_prepare()?

> +enum {
> +	MT8365_AFE_MEMIF_DL1,
> +	MT8365_AFE_MEMIF_DL2,
> +	MT8365_AFE_MEMIF_TDM_OUT,

..snip..

> +
> +#ifdef CONFIG_MTK_HIFIXDSP_SUPPORT

This configuration option doesn't exist.

Please remove the ifdef and the enclosed code entirely, as it's unused.

> +struct mt8365_adsp_data {
> +	/* information adsp supply */
> +	bool adsp_on;
> +	int (*hostless_active)(void);
> +	/* information afe supply */
> +	int (*set_afe_memif)(struct mtk_base_afe *afe,
> +			     int memif_id,
> +			     unsigned int rate,
> +			     unsigned int channels,
> +			     snd_pcm_format_t format);
> +	int (*set_afe_memif_enable)(struct mtk_base_afe *afe,
> +				    int memif_id,
> +				    unsigned int rate,
> +				    unsigned int period_size,
> +				    int enable);
> +	void (*get_afe_memif_sram)(struct mtk_base_afe *afe,
> +				   int memif_id,
> +				   unsigned int *paddr,
> +				   unsigned int *size);
> +	void (*set_afe_init)(struct mtk_base_afe *afe);
> +	void (*set_afe_uninit)(struct mtk_base_afe *afe);
> +};
> +#endif
> +
> +struct mt8365_afe_private {
> +	struct clk *clocks[MT8365_CLK_NUM];
> +	struct regmap *topckgen;
> +	struct mt8365_fe_dai_data fe_data[MT8365_AFE_MEMIF_NUM];
> +	struct mt8365_be_dai_data be_data[MT8365_AFE_BACKEND_NUM];
> +	struct mt8365_control_data ctrl_data;
> +	struct mt8365_gasrc_data gasrc_data[MT8365_TDM_ASRC_NUM];
> +#ifdef CONFIG_MTK_HIFIXDSP_SUPPORT
> +	struct mt8365_adsp_data adsp_data;

ditto

> +#endif
> +	int afe_on_ref_cnt;
> +	int top_cg_ref_cnt[MT8365_TOP_CG_NUM];
> +	void __iomem *afe_sram_vir_addr;
> +	unsigned int afe_sram_phy_addr;
> +	unsigned int afe_sram_size;
> +	/* locks */
> +	spinlock_t afe_ctrl_lock;
> +	struct mutex afe_clk_mutex;	/* Protect & sync APLL TUNER registers access*/
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry *debugfs_dentry[MT8365_AFE_DEBUGFS_NUM];
> +#endif
> +	int apll_tuner_ref_cnt[MT8365_AFE_APLL_NUM];
> +	unsigned int tdm_out_mode;
> +	unsigned int cm2_mux_input;
> +
> +	/* dai */
> +	bool dai_on[MT8365_AFE_BACKEND_END];
> +	void *dai_priv[MT8365_AFE_BACKEND_END];
> +};
> +

....

> +#ifdef CONFIG_MTK_HIFIXDSP_SUPPORT

same

> +struct mtk_base_afe *mt8365_afe_pcm_get_info(void);
> +#endif
> +
> +int mt8365_dai_i2s_register(struct mtk_base_afe *afe);
> +int mt8365_dai_set_priv(struct mtk_base_afe *afe,
> +			int id,
> +			int priv_size,
> +			const void *priv_data);
> +

Everything else looks good.

After applying the proposed cleanups,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

