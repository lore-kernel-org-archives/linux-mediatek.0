Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CF5C11F69
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31A561004
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31A561004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w7HREHTZ5vqC2vwJCvrxn8+rBBI5KE02Q/RcDQqtto=; b=dth5Fuc6O3uooS
	YpYVgAbLifn8bXCID529LxYvr0K8UK3L03ZjjKCd0E2mXnWqH214xWkTWH+wGIWB2yiMovNvymI+E
	5wiEoY5KkMFD4sUOtUjagEaBKO55ssNpiTaVaH2Vw0usULw82nvPHrKjT2tJFAsVzXQPv55FQiXy8
	4XaR5Bvbn72DgbAms2PaiMgWvm52KNk4lMYZbVj9EpqZbNjHYUfn2rY3piSKdzPA/tlzowjhnPCmB
	MoulQmtNV+oQbhD682i0E1JyKLM0RRPUPlbB15T4PRjciTD1yt/J/TuP74rd0ck8h73xgolNUUBH0
	X22mhcjSM3mAQLrwc8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2pst-006CEa-U9; Mon, 12 Jul 2021 06:57:43 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2psg-006CCF-KS
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 06:57:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id r20so22437064ljd.10
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Jul 2021 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4SeDONJoAbR7SmDbEZVaj/9q86NqUT+93EyEB49Ezg=;
 b=hxdhm31s8NbXxRbRK21cNfg5Yyk+BL4iL1CydJJFztrq+S8btnk6yQQfrom9iE0uYU
 UYVTcVzIxfoyISOI4TuM3Gy+sMMyke7IG6MVqDoLApmTP8iEGKhhxkfv6ZKl6m5vsvmv
 Q2eu2JvocfkLJgjF/eZORrELX7PkHBXchY5ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4SeDONJoAbR7SmDbEZVaj/9q86NqUT+93EyEB49Ezg=;
 b=Tly2Ce4gWzlAF94G8gHIdxhqF5zNoPfrnOgtROVHfPLYksCUAmdkOmRUjyIEqZ7BRX
 72F8ALlyJ/NXStnqvehEP62JOlGvk+CX7pYdEEntyZhwPp+6J/c5IbHROtPCsIqN8S4D
 dqEsmxbHjs1v5T4VqKU6GhTVA9LGlD+ieu6V/rXCcwxC8ME14uTd2d1zU5O+x62TdwAw
 ITK9uAldQpLtB2LYJLurJlKGIx7hoLmfRVrVV4seg+TfbdyXlw1BePGph7w6uZs11hGF
 54X3OATvxycDyNpuvTm8ykUnam1J4TGVtIKk4fPGHNA2HzI+GArUZ+dwwBWAg/kUlJHp
 fiUw==
X-Gm-Message-State: AOAM530Yg0AAzNSG4Xf2AN3jl5/fhN+6ozLpOWqmJrbi+S5v5wMnl4KZ
 kLpKjEYnrlpZVNe2kVsS13yQW30Tr9PnomK5A/yACA==
X-Google-Smtp-Source: ABdhPJzcCnZYJ5XQhl7vebCWsp/6OgyUuNLP5zzuFG3UENJnaDRvsx9Z05O9E0/jNb7ulpBm9ZFHIO8hC5ehzrD1oWM=
X-Received: by 2002:a05:651c:211a:: with SMTP id
 a26mr29019154ljq.91.1626073047904; 
 Sun, 11 Jul 2021 23:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
 <20210629014736.31153-6-trevor.wu@mediatek.com>
In-Reply-To: <20210629014736.31153-6-trevor.wu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jul 2021 14:57:16 +0800
Message-ID: <CAGXv+5FzOs+=9PbYAEahVXvdJG1FnRkSUo_r3AVYZzNKGqg0oA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] ASoC: mediatek: mt8195: add platform driver
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, 
 bicycle.tsai@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 cychiang@google.com, aaronyu@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_235730_704067_2F6425D4 
X-CRM114-Status: GOOD (  27.73  )
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

 are all internal Hi,

On Tue, Jun 29, 2021 at 9:49 AM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> This patch adds mt8195 platform and affiliated driver.
>
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  sound/soc/mediatek/Kconfig                     |    9 +
>  sound/soc/mediatek/Makefile                   |    1 +
>  sound/soc/mediatek/mt8195/Makefile            |   11 +
>  sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  899 +++++
>  sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  201 +
>  sound/soc/mediatek/mt8195/mt8195-afe-common.h |  200 +
>  sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3264 +++++++++++++++++
>  sound/soc/mediatek/mt8195/mt8195-reg.h        | 2793 ++++++++++++++
>  8 files changed, 7378 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8195/Makefile
>  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
>  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
>  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-common.h
>  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
>  create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 74dae4332d17..3389f382be06 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -184,3 +184,12 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
>           with the MT6359 RT1015 RT5682 audio codec.
>           Select Y if you have such device.
>           If unsure select "N".
> +
> +config SND_SOC_MT8195
> +       tristate "ASoC support for Mediatek MT8195 chip"
> +       select SND_SOC_MEDIATEK
> +       help
> +         This adds ASoC platform driver support for Mediatek MT8195 chip
> +         that can be used with other codecs.
> +         Select Y if you have such device.
> +         If unsure select "N".
> diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
> index f6cb6b8508e3..34778ca12106 100644
> --- a/sound/soc/mediatek/Makefile
> +++ b/sound/soc/mediatek/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
>  obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
>  obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
>  obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
> +obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
> diff --git a/sound/soc/mediatek/mt8195/Makefile b/sound/soc/mediatek/mt8195/Makefile
> new file mode 100644
> index 000000000000..b2c9fd88f39e
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8195/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# platform driver
> +snd-soc-mt8195-afe-objs := \
> +       mt8195-afe-clk.o \
> +       mt8195-afe-pcm.o \
> +       mt8195-dai-adda.o \
> +       mt8195-dai-etdm.o \
> +       mt8195-dai-pcm.o
> +
> +obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-afe.o
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> new file mode 100644
> index 000000000000..57aa799b4f41
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -0,0 +1,899 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mt8195-afe-clk.c  --  Mediatek 8195 afe clock ctrl
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
> + *         Trevor Wu <trevor.wu@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +
> +#include "mt8195-afe-common.h"
> +#include "mt8195-afe-clk.h"
> +#include "mt8195-reg.h"
> +
> +static const char *aud_clks[MT8195_CLK_NUM] = {

Most of these clocks are not described in the device tree binding. If
the driver needs to reference them, they should be described. We should
not be hard-coding clock names across different drivers.

The more important question is, why does the driver need to reference
all of them? Maybe we should take a step back and draw out a clock tree
diagram for the hardware?

> +       /* xtal */
> +       [MT8195_CLK_XTAL_26M] = "clk26m",
> +       /* pll */
> +       [MT8195_CLK_APMIXED_APLL1] = "apll1",
> +       [MT8195_CLK_APMIXED_APLL2] = "apll2",
> +       [MT8195_CLK_APMIXED_APLL3] = "apll3",
> +       [MT8195_CLK_APMIXED_APLL4] = "apll4",
> +       [MT8195_CLK_APMIXED_APLL5] = "apll5",
> +       [MT8195_CLK_APMIXED_HDMIRX_APLL] = "hdmirx_apll",
> +       /* divider */
> +       [MT8195_CLK_TOP_APLL1] = "apll1_ck",
> +       [MT8195_CLK_TOP_APLL1_D4] = "apll1_d4",
> +       [MT8195_CLK_TOP_APLL2] = "apll2_ck",
> +       [MT8195_CLK_TOP_APLL2_D4] = "apll2_d4",
> +       [MT8195_CLK_TOP_APLL3] = "apll3_ck",
> +       [MT8195_CLK_TOP_APLL3_D4] = "apll3_d4",
> +       [MT8195_CLK_TOP_APLL4] = "apll4_ck",
> +       [MT8195_CLK_TOP_APLL4_D4] = "apll4_d4",
> +       [MT8195_CLK_TOP_APLL5] = "apll5_ck",
> +       [MT8195_CLK_TOP_APLL5_D4] = "apll5_d4",
> +       [MT8195_CLK_TOP_APLL12_DIV0] = "apll12_div0",
> +       [MT8195_CLK_TOP_APLL12_DIV1] = "apll12_div1",
> +       [MT8195_CLK_TOP_APLL12_DIV2] = "apll12_div2",
> +       [MT8195_CLK_TOP_APLL12_DIV3] = "apll12_div3",
> +       [MT8195_CLK_TOP_APLL12_DIV4] = "apll12_div4",
> +       [MT8195_CLK_TOP_APLL12_DIV9] = "apll12_div9",
> +       [MT8195_CLK_TOP_HDMIRX_APLL] = "hdmirx_apll_ck",
> +       [MT8195_CLK_TOP_MAINPLL_D4_D4] = "mainpll_d4_d4",
> +       [MT8195_CLK_TOP_MAINPLL_D5_D2] = "mainpll_d5_d2",
> +       [MT8195_CLK_TOP_MAINPLL_D7_D2] = "mainpll_d7_d2",
> +       [MT8195_CLK_TOP_UNIVPLL_D4] = "univpll_d4",
> +       /* mux */
> +       [MT8195_CLK_TOP_APLL1_SEL] = "apll1_sel",
> +       [MT8195_CLK_TOP_APLL2_SEL] = "apll2_sel",
> +       [MT8195_CLK_TOP_APLL3_SEL] = "apll3_sel",
> +       [MT8195_CLK_TOP_APLL4_SEL] = "apll4_sel",
> +       [MT8195_CLK_TOP_APLL5_SEL] = "apll5_sel",
> +       [MT8195_CLK_TOP_A1SYS_HP_SEL] = "a1sys_hp_sel",
> +       [MT8195_CLK_TOP_A2SYS_SEL] = "a2sys_sel",
> +       [MT8195_CLK_TOP_A3SYS_SEL] = "a3sys_sel",
> +       [MT8195_CLK_TOP_A4SYS_SEL] = "a4sys_sel",
> +       [MT8195_CLK_TOP_ASM_H_SEL] = "asm_h_sel",
> +       [MT8195_CLK_TOP_ASM_M_SEL] = "asm_m_sel",
> +       [MT8195_CLK_TOP_ASM_L_SEL] = "asm_l_sel",
> +       [MT8195_CLK_TOP_AUD_IEC_SEL] = "aud_iec_sel",
> +       [MT8195_CLK_TOP_AUD_INTBUS_SEL] = "aud_intbus_sel",
> +       [MT8195_CLK_TOP_AUDIO_H_SEL] = "audio_h_sel",
> +       [MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL] = "audio_local_bus_sel",
> +       [MT8195_CLK_TOP_DPTX_M_SEL] = "dptx_m_sel",
> +       [MT8195_CLK_TOP_INTDIR_SEL] = "intdir_sel",
> +       [MT8195_CLK_TOP_I2SO1_M_SEL] = "i2so1_m_sel",
> +       [MT8195_CLK_TOP_I2SO2_M_SEL] = "i2so2_m_sel",
> +       [MT8195_CLK_TOP_I2SI1_M_SEL] = "i2si1_m_sel",
> +       [MT8195_CLK_TOP_I2SI2_M_SEL] = "i2si2_m_sel",
> +       /* clock gate */
> +       [MT8195_CLK_TOP_MPHONE_SLAVE_B] = "mphone_slave_b",
> +       [MT8195_CLK_TOP_CFG_26M_AUD] = "cfg_26m_aud",
> +       [MT8195_CLK_INFRA_AO_AUDIO] = "infra_ao_audio",
> +       [MT8195_CLK_INFRA_AO_AUDIO_26M_B] = "infra_ao_audio_26m_b",
> +       [MT8195_CLK_SCP_ADSP_AUDIODSP] = "scp_adsp_audiodsp",


> +       [MT8195_CLK_AUD_AFE] = "aud_afe",
> +       [MT8195_CLK_AUD_LRCK_CNT] = "aud_lrck_cnt",
> +       [MT8195_CLK_AUD_SPDIFIN_TUNER_APLL] = "aud_spdifin_tuner_apll",
> +       [MT8195_CLK_AUD_SPDIFIN_TUNER_DBG] = "aud_spdifin_tuner_dbg",
> +       [MT8195_CLK_AUD_UL_TML] = "aud_ul_tml",
> +       [MT8195_CLK_AUD_APLL1_TUNER] = "aud_apll1_tuner",
> +       [MT8195_CLK_AUD_APLL2_TUNER] = "aud_apll2_tuner",
> +       [MT8195_CLK_AUD_TOP0_SPDF] = "aud_top0_spdf",
> +       [MT8195_CLK_AUD_APLL] = "aud_apll",
> +       [MT8195_CLK_AUD_APLL2] = "aud_apll2",
> +       [MT8195_CLK_AUD_DAC] = "aud_dac",
> +       [MT8195_CLK_AUD_DAC_PREDIS] = "aud_dac_predis",
> +       [MT8195_CLK_AUD_TML] = "aud_tml",
> +       [MT8195_CLK_AUD_ADC] = "aud_adc",
> +       [MT8195_CLK_AUD_DAC_HIRES] = "aud_dac_hires",
> +       [MT8195_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
> +       [MT8195_CLK_AUD_AFE_DMIC1] = "aud_afe_dmic1",
> +       [MT8195_CLK_AUD_AFE_DMIC2] = "aud_afe_dmic2",
> +       [MT8195_CLK_AUD_AFE_DMIC3] = "aud_afe_dmic3",
> +       [MT8195_CLK_AUD_AFE_DMIC4] = "aud_afe_dmic4",
> +       [MT8195_CLK_AUD_AFE_26M_DMIC_TM] = "aud_afe_26m_dmic_tm",
> +       [MT8195_CLK_AUD_UL_TML_HIRES] = "aud_ul_tml_hires",
> +       [MT8195_CLK_AUD_ADC_HIRES] = "aud_adc_hires",
> +       [MT8195_CLK_AUD_ADDA6_ADC] = "aud_adda6_adc",
> +       [MT8195_CLK_AUD_ADDA6_ADC_HIRES] = "aud_adda6_adc_hires",
> +       [MT8195_CLK_AUD_LINEIN_TUNER] = "aud_linein_tuner",
> +       [MT8195_CLK_AUD_EARC_TUNER] = "aud_earc_tuner",
> +       [MT8195_CLK_AUD_I2SIN] = "aud_i2sin",
> +       [MT8195_CLK_AUD_TDM_IN] = "aud_tdm_in",
> +       [MT8195_CLK_AUD_I2S_OUT] = "aud_i2s_out",
> +       [MT8195_CLK_AUD_TDM_OUT] = "aud_tdm_out",
> +       [MT8195_CLK_AUD_HDMI_OUT] = "aud_hdmi_out",
> +       [MT8195_CLK_AUD_ASRC11] = "aud_asrc11",
> +       [MT8195_CLK_AUD_ASRC12] = "aud_asrc12",
> +       [MT8195_CLK_AUD_MULTI_IN] = "aud_multi_in",
> +       [MT8195_CLK_AUD_INTDIR] = "aud_intdir",
> +       [MT8195_CLK_AUD_A1SYS] = "aud_a1sys",
> +       [MT8195_CLK_AUD_A2SYS] = "aud_a2sys",
> +       [MT8195_CLK_AUD_PCMIF] = "aud_pcmif",
> +       [MT8195_CLK_AUD_A3SYS] = "aud_a3sys",
> +       [MT8195_CLK_AUD_A4SYS] = "aud_a4sys",
> +       [MT8195_CLK_AUD_MEMIF_UL1] = "aud_memif_ul1",
> +       [MT8195_CLK_AUD_MEMIF_UL2] = "aud_memif_ul2",
> +       [MT8195_CLK_AUD_MEMIF_UL3] = "aud_memif_ul3",
> +       [MT8195_CLK_AUD_MEMIF_UL4] = "aud_memif_ul4",
> +       [MT8195_CLK_AUD_MEMIF_UL5] = "aud_memif_ul5",
> +       [MT8195_CLK_AUD_MEMIF_UL6] = "aud_memif_ul6",
> +       [MT8195_CLK_AUD_MEMIF_UL8] = "aud_memif_ul8",
> +       [MT8195_CLK_AUD_MEMIF_UL9] = "aud_memif_ul9",
> +       [MT8195_CLK_AUD_MEMIF_UL10] = "aud_memif_ul10",
> +       [MT8195_CLK_AUD_MEMIF_DL2] = "aud_memif_dl2",
> +       [MT8195_CLK_AUD_MEMIF_DL3] = "aud_memif_dl3",
> +       [MT8195_CLK_AUD_MEMIF_DL6] = "aud_memif_dl6",
> +       [MT8195_CLK_AUD_MEMIF_DL7] = "aud_memif_dl7",
> +       [MT8195_CLK_AUD_MEMIF_DL8] = "aud_memif_dl8",
> +       [MT8195_CLK_AUD_MEMIF_DL10] = "aud_memif_dl10",
> +       [MT8195_CLK_AUD_MEMIF_DL11] = "aud_memif_dl11",
> +       [MT8195_CLK_AUD_GASRC0] = "aud_gasrc0",
> +       [MT8195_CLK_AUD_GASRC1] = "aud_gasrc1",
> +       [MT8195_CLK_AUD_GASRC2] = "aud_gasrc2",
> +       [MT8195_CLK_AUD_GASRC3] = "aud_gasrc3",
> +       [MT8195_CLK_AUD_GASRC4] = "aud_gasrc4",
> +       [MT8195_CLK_AUD_GASRC5] = "aud_gasrc5",
> +       [MT8195_CLK_AUD_GASRC6] = "aud_gasrc6",
> +       [MT8195_CLK_AUD_GASRC7] = "aud_gasrc7",
> +       [MT8195_CLK_AUD_GASRC8] = "aud_gasrc8",
> +       [MT8195_CLK_AUD_GASRC9] = "aud_gasrc9",
> +       [MT8195_CLK_AUD_GASRC10] = "aud_gasrc10",
> +       [MT8195_CLK_AUD_GASRC11] = "aud_gasrc11",
> +       [MT8195_CLK_AUD_GASRC12] = "aud_gasrc12",
> +       [MT8195_CLK_AUD_GASRC13] = "aud_gasrc13",
> +       [MT8195_CLK_AUD_GASRC14] = "aud_gasrc14",
> +       [MT8195_CLK_AUD_GASRC15] = "aud_gasrc15",
> +       [MT8195_CLK_AUD_GASRC16] = "aud_gasrc16",
> +       [MT8195_CLK_AUD_GASRC17] = "aud_gasrc17",
> +       [MT8195_CLK_AUD_GASRC18] = "aud_gasrc18",
> +       [MT8195_CLK_AUD_GASRC19] = "aud_gasrc19",

The MT8195_CLK_AUD_* clocks are all internal to the audio subsystem:
the bits that control these clock gates are in the same address space
as the audio parts. Would it be possible to model them as internal
ASoC SUPPLY widgets? The external ones could be modeled using ASoC
CLK_SUPPLY widgets, and the dependencies could be modeled with ASoC
routes. The ASoC core could then handle power sequencing, which the
driver currently does manually.

IMO this is better than having two drivers handling two aspects of
the same piece of hardware, while the two aspects are intertwined.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
