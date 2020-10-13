Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F2FC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 03:51:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC142080A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 03:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+dEpvfw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jYq8OhSh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC142080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4WSHVWJhs1DU7il1asRQAmXojtLkmxty/Ak4CpiVZuA=; b=O+dEpvfwsp9CDlPM8igUVQdKY
	pqsvFFZt7Vvu3DQCkMUfG4ocx3ktydi95uw6DqML6gZ8/IKeUvL6w1trOZX7N3ye/43ybOxp7Kq74
	+gpku3g0rPlNeZXV4xHu1y7PS4E787jUdQ4IKfiKTxK2hNOVZPY90dEqTSZueBoZRv120q1EG3+v5
	z39eT9m9ICdGf+Hh2zLZKwXug3GqQGCXIxgk0wKGEdDHFv0UVC1MvkqLegxriJNG4eIwp8rvpXnd9
	eCp+vkXolSYYEMstnv78GhMjxlkocyabJzkulINoiNsWJdedsuz0WdEaDoBKUUJkP0nq8dUFD0bsx
	ZcIBHJtJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSBL3-0005yG-AY; Tue, 13 Oct 2020 03:51:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSBKy-0005wf-K5
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 03:50:58 +0000
Received: by mail-wm1-x344.google.com with SMTP id b127so7403926wmb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2020 20:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qDCMKHshKP3zG0OPxiLxiPyZNbz/zT6YVDt42yxlHiM=;
 b=jYq8OhShuoKv6k74L+LFlPfMkU5S91wfmZLrssTnD4omW6ESE2sbL/moYo4vlrYV1E
 HzYwYZEu4ECA3yUAHG0rO1fz5p9/GYM2uSi97TpxzKxP5F3jgaq9UzAtEko6bviK0OE0
 eN1QTIIrOGdmF/ftDVvARAfU0cc3KGnPK2rPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDCMKHshKP3zG0OPxiLxiPyZNbz/zT6YVDt42yxlHiM=;
 b=tUC+o8dFGECnGECk4J9UlkVXN196czI3x4gUd7EA5K5X0A/2s3/4yMYe1wAOA0XCTP
 sAtOFtBuw3MdI9gNJB5AEOJAa5iNciqmUJDk8NTittk9HErnUxz5074YHN8d5+G+vVCa
 vTvgWBACbiohX7+AVNipFKRKmukktFIeUcEK4VWFvDoBjdVUcZaUCvkb3avf1lDZo+fp
 dVYx43sag5VIE//mUOuYT1UbEEyq5jiN3sbgHt6oWlQPj3LAa164gldYb9RVtD0WkJ/x
 M/M7KdRzf5ETonUbzOcsue+vQb2a7FtUfb+bma/veqyxQG3aDDfCVEPYlzBxNXfLiJRw
 3TnQ==
X-Gm-Message-State: AOAM532y0RagTpuliCihyo8+d1NhSqS9Lo1kT3oR5Gs4IGGeerh8OWCP
 oQVdMoLfEhk0J+gY6sA4lqUeDW1SYCQBr6AowqcO6w==
X-Google-Smtp-Source: ABdhPJznLuWLo4JKv3VPdSCX4D2TYNaXFLecHX0q7UqoFehDlv3flDgzxCxcqWqs7fdPG8urdepL0RlrRcXIq/y+e+0=
X-Received: by 2002:a1c:b6d4:: with SMTP id
 g203mr10140545wmf.132.1602561055132; 
 Mon, 12 Oct 2020 20:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-4-cychiang@chromium.org>
In-Reply-To: <20200914080619.4178587-4-cychiang@chromium.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 13 Oct 2020 11:50:28 +0800
Message-ID: <CAFv8NwJFxZEk8j-40-AAkAF++CZoq=RGvgAsoYxFz_URJO0sUw@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_235056_700223_52BB9753 
X-CRM114-Status: GOOD (  31.95  )
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
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Ajit Pandey <ajitp@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2020 at 4:06 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> From: Ajit Pandey <ajitp@codeaurora.org>
>
> Add new driver to register sound card on sc7180 trogdor board and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S interfaces.
>
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  sound/soc/qcom/Kconfig  |  12 ++
>  sound/soc/qcom/Makefile |   2 +
>  sound/soc/qcom/sc7180.c | 266 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 sound/soc/qcom/sc7180.c
>
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index a607ace8b089..0459185ee243 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -116,4 +116,16 @@ config SND_SOC_SDM845
>           SDM845 SoC-based systems.
>           Say Y if you want to use audio device on this SoCs.
>
> +config SND_SOC_SC7180
> +       tristate "SoC Machine driver for SC7180 boards"
> +       depends on I2C
> +       select SND_SOC_QCOM_COMMON
> +       select SND_SOC_LPASS_SC7180
> +       select SND_SOC_MAX98357A
> +       select SND_SOC_RT5682_I2C
> +       help
> +         To add support for audio on Qualcomm Technologies Inc.
> +         SC7180 SoC-based systems.
> +         Say Y if you want to use audio device on this SoCs.
> +
>  endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 7972c9479ab0..0cdcbf367ef1 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -17,12 +17,14 @@ snd-soc-storm-objs := storm.o
>  snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>  snd-soc-apq8096-objs := apq8096.o
>  snd-soc-sdm845-objs := sdm845.o
> +snd-soc-sc7180-objs := sc7180.o
>  snd-soc-qcom-common-objs := common.o
>
>  obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>  obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>  obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
>  obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
> +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
>
>  #DSP lib
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> new file mode 100644
> index 000000000000..0e90448523b0
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +//
> +// sc7180.c -- ALSA SoC Machine driver for SC7180
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +#include "../codecs/rt5682.h"
> +#include "common.h"
> +#include "lpass.h"
> +
> +#define DEFAULT_MCLK_RATE              19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
> +
> +// This will be defined in include/dt-bindings/sound/sc7180-lpass.h
> +#define LPASS_DP_RX 2
> +
> +struct sc7180_snd_data {
> +       struct snd_soc_card card;
> +       u32 pri_mi2s_clk_count;
> +       struct snd_soc_jack hs_jack;
> +       struct snd_soc_jack hdmi_jack;
> +};
> +
> +static void sc7180_jack_free(struct snd_jack *jack)
> +{
> +       struct snd_soc_component *component = jack->private_data;
> +
> +       snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +       struct snd_soc_component *component = codec_dai->component;
> +       struct snd_jack *jack;
> +       int rval;
> +
> +       rval = snd_soc_card_jack_new(
> +                       card, "Headset Jack",
> +                       SND_JACK_HEADSET |
> +                       SND_JACK_HEADPHONE |
> +                       SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +                       SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +                       &pdata->hs_jack, NULL, 0);
> +
> +       if (rval < 0) {
> +               dev_err(card->dev, "Unable to add Headset Jack\n");
> +               return rval;
> +       }
> +
> +       jack = pdata->hs_jack.jack;
> +
> +       snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +       snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +       snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +       snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +       jack->private_data = component;
> +       jack->private_free = sc7180_jack_free;
> +
> +       return snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
> +}
> +
> +static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +       struct snd_soc_component *component = codec_dai->component;
> +       struct snd_jack *jack;
> +       int rval;
> +
> +       rval = snd_soc_card_jack_new(
> +                       card, "HDMI Jack",
> +                       SND_JACK_LINEOUT,
> +                       &pdata->hdmi_jack, NULL, 0);
> +
> +       if (rval < 0) {
> +               dev_err(card->dev, "Unable to add HDMI Jack\n");
> +               return rval;
> +       }
> +
> +       jack = pdata->hdmi_jack.jack;
> +       jack->private_data = component;
> +       jack->private_free = sc7180_jack_free;
> +
> +       return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
> +}
> +
> +static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case MI2S_PRIMARY:
> +               return sc7180_headset_init(rtd);
> +       case MI2S_SECONDARY:
> +               return 0;
> +       case LPASS_DP_RX:
> +               return sc7180_hdmi_init(rtd);
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +                       cpu_dai->id);
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +       int ret;
> +
> +       switch (cpu_dai->id) {
> +       case MI2S_PRIMARY:
> +               if (++data->pri_mi2s_clk_count == 1) {
> +                       snd_soc_dai_set_sysclk(cpu_dai,
> +                                              LPASS_MCLK0,
> +                                              DEFAULT_MCLK_RATE,
> +                                              SNDRV_PCM_STREAM_PLAYBACK);
> +               }
> +
> +               snd_soc_dai_set_fmt(codec_dai,
> +                                   SND_SOC_DAIFMT_CBS_CFS |
> +                                   SND_SOC_DAIFMT_NB_NF |
> +                                   SND_SOC_DAIFMT_I2S);
> +
> +               /* Configure PLL1 for codec */
> +               ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> +                                         DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> +               if (ret) {
> +                       dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +                       return ret;
> +               }
> +
> +               /* Configure sysclk for codec */
> +               ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> +                                            RT5682_PLL1_FREQ,
> +                                            SND_SOC_CLOCK_IN);
> +               if (ret)
> +                       dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +                               ret);
> +
> +               break;
> +       case MI2S_SECONDARY:
> +               break;
> +       case LPASS_DP_RX:
> +               break;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +                       cpu_dai->id);
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case MI2S_PRIMARY:
> +               if (--data->pri_mi2s_clk_count == 0) {
> +                       snd_soc_dai_set_sysclk(cpu_dai,
> +                                              LPASS_MCLK0,
> +                                              0,
> +                                              SNDRV_PCM_STREAM_PLAYBACK);
> +               }
> +               break;
> +       case MI2S_SECONDARY:
> +               break;
> +       case LPASS_DP_RX:
> +               break;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +                       cpu_dai->id);
> +               break;
> +       }
> +}
> +
> +static const struct snd_soc_ops sc7180_ops = {
> +       .startup = sc7180_snd_startup,
> +       .shutdown = sc7180_snd_shutdown,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
> +       SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +       SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static void sc7180_add_ops(struct snd_soc_card *card)
> +{
> +       struct snd_soc_dai_link *link;
> +       int i;
> +
> +       for_each_card_prelinks(card, i, link) {
> +               link->ops = &sc7180_ops;
> +               link->init = sc7180_init;
> +       }
> +}
> +
> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct sc7180_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       /* Allocate the private data */
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card = &data->card;
> +       snd_soc_card_set_drvdata(card, data);
> +
> +       card->owner = THIS_MODULE,
> +       card->dev = dev;
> +       card->dapm_widgets = sc7180_snd_widgets;
> +       card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
> +
> +       ret = qcom_snd_parse_of(card);
> +       if (ret)
> +               return ret;
> +
> +       sc7180_add_ops(card);
> +
> +       return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id sc7180_snd_device_id[]  = {
> +       { .compatible = "qcom,sc7180-sndcard-rt5682-m98357-1mic" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
> +
> +static struct platform_driver sc7180_snd_driver = {
> +       .probe = sc7180_snd_platform_probe,
> +       .driver = {
> +               .name = "msm-snd-sc7180",
> +               .of_match_table = sc7180_snd_device_id,
> +       },
> +};
> +module_platform_driver(sc7180_snd_driver);
> +
> +MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.28.0.618.gf4bc123cb7-goog
>

Hi Srini and Stephan,
May I get your Reviewed-By for this patch ?
There are some patches on the machine driver for different
configurations pending on this one so I would hope to get this one
merged first.

Thanks a lot for reviewing it!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
