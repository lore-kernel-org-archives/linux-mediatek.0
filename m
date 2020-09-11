Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0710C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 17:15:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 909892075B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 17:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsgQ415r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oAO+O+j6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 909892075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ypRUE6LCgHxSvF1YFeNTHXklJBgib4R02PJ/3r5fkBY=; b=dsgQ415rKwCIaJLIv0x5uzXjX
	RwPfCHJe3cOdbuU1j8AiZmuViXd7BMYvi/vnUWquoHzL0G+g9tnKXUUENseY26d6j4WTMNpBWwnNW
	Qg0VKxmXdHXZf0ss0N5qtr5KN2ZOyRosxhq1chPZZG8ZYb++71Jaqqr4tqGl20kwMBHrKO+aW01a3
	u40V6EVdhOSKa6K4AAdX+d1y9cY3DcPyswllOrTzmcQuzAsW1Tuf54gQ+APf0rMOFntY26TE3cA8Y
	MLAlP12wc/Cn/beQt++P8dYlHcS18wLa5cz/aTE+nJgtfrXmGMXPcONoVAjZJfL2mvDJEzGVceQH3
	NKvPOSeUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGme7-0000GZ-C8; Fri, 11 Sep 2020 17:15:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGme2-0000Ei-PT
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 17:15:32 +0000
Received: by mail-wr1-x443.google.com with SMTP id e16so12233632wrm.2
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IytQlyBm2J+C+0xQONWM1nAS/rbsPardD0SVB1HzZVE=;
 b=oAO+O+j6fCroBlWBpo9zT37KQA5EIqYtYqrdKq+o+Mp3A2uP3ZHCBksWAGt2yTKEs2
 ZrV0F+4rRjQ7XZn9OtgxWD/aQyczoV4iyMzXKXyFJC2fj1L7/3ChWtOOt9lMkUmxodAw
 jxPdCgj9yZ5oDuRDBbFVWDNeLuhnkjK5q9+ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IytQlyBm2J+C+0xQONWM1nAS/rbsPardD0SVB1HzZVE=;
 b=GydG1Th0GLDOtlv/Jr0+gqc4HQvl5Ot0fYJWqxtMR0LO/WRNnGCPuG8ZLb6bivoq4g
 8mZAwBKHRuZtz7xAKItqcmc9a8XPmooujwnE1Q8jNhmIbG6Op8e53ySZ+Woq1tmohQmA
 17ifQNjq69C6c3vlAUeagTB0uckc++dMikcX94p38izw2Ysy1AB+ySV7UCgskjOc/gdS
 D2/ZKTJI4mj04zkwm4mHn5vUdhKrE5F2/ngPitf8DyiIB6duS4qyquc/JnRPu8xBOijO
 EXwwXL1txAtF5OkABvcceiqDBCUSUo14TjKmtLIKXgCsj3Ubo0RH3LxHHsA+qCzp1/6r
 lWlQ==
X-Gm-Message-State: AOAM531fv+X3v7Ll8U/15if9lWBYb0Rrdk1vHTBg4F8IosIaYErGEznE
 /0R0xiTLX7X8kcnnxUuW8XC2z/066OREOIL9CcVBhQ==
X-Google-Smtp-Source: ABdhPJxkL6ugQfLKjDoTaw8dYhcw8lds7rJ4YM1MA1f1c9zmEH9NT/CrVR+DG4P59XzhF5mw2fmzfpCEmZQtR4iUBKE=
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr2984957wrv.404.1599844527125; 
 Fri, 11 Sep 2020 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200911102259.3667381-1-cychiang@chromium.org>
 <20200911102259.3667381-4-cychiang@chromium.org>
 <4d25337d-3d23-9fca-9617-da54a4fdba97@linaro.org>
In-Reply-To: <4d25337d-3d23-9fca-9617-da54a4fdba97@linaro.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Sat, 12 Sep 2020 01:14:55 +0800
Message-ID: <CAFv8NwJe+Qi7roHRCnQf16YwC-wzPiwPugg=W-wvRrk0MV_v5A@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_131530_915456_4BBF0485 
X-CRM114-Status: GOOD (  32.30  )
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
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Ajit Pandey <ajitp@codeaurora.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 7:05 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 11/09/2020 11:22, Cheng-Yi Chiang wrote:
> > From: Ajit Pandey <ajitp@codeaurora.org>
> >
> > Add new driver to register sound card on sc7180 trogdor board and
> > do the required configuration for lpass cpu dai and external codecs
> > connected over MI2S interfaces.
> >
> > Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >   sound/soc/qcom/Kconfig  |  12 ++
> >   sound/soc/qcom/Makefile |   2 +
> >   sound/soc/qcom/sc7180.c | 267 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 281 insertions(+)
> >   create mode 100644 sound/soc/qcom/sc7180.c
> >
> ...
> >
> >   obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
> >   obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
> >   obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
> >   obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
> > +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
> >   obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> >
> >   #DSP lib
> > diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> > new file mode 100644
> > index 000000000000..40bc4fc98842
> > --- /dev/null
> > +++ b/sound/soc/qcom/sc7180.c
> > @@ -0,0 +1,267 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > +//
> > +// sc7180.c -- ALSA SoC Machine driver for SC7180
> > +
> > +#include <dt-bindings/sound/sc7180-lpass.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <sound/core.h>
> > +#include <sound/jack.h>
> > +#include <sound/pcm.h>
> > +#include <sound/pcm_params.h>
> Do you need this header?
>
Hi Srinivas, thanks for taking a closer look!
I will remove it in v10.
>
> > +#include <sound/soc.h>
> > +#include <uapi/linux/input-event-codes.h>
> > +
> > +#include "../codecs/rt5682.h"
> > +#include "common.h"
> > +#include "lpass.h"
> > +
> > +#define DEFAULT_SAMPLE_RATE_48K              48000
>
> Looks like ^ is Not used!
>
I will remove it in v10.

>
> Overall the driver looks much cleaner now!
>
> Also to make progress on this patch, may be you add define for HDMI with
> a comment!


After discussion with Srinivasa Rao, we plan to use a new name that is
more specific to lpass-sc7180 DP dai:

// This will be defined in include/dt-bindings/sound/sc7180-lpass.h
#define SC7180_LPASS_DP 2
Do you think it is okay ?
Thanks!

>
> Once unused remove, pl feel free to add !
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
>
> --srini
>
>
> > +#define DEFAULT_MCLK_RATE            19200000
> > +#define RT5682_PLL1_FREQ (48000 * 512)
> > +
> > +struct sc7180_snd_data {
> > +     u32 pri_mi2s_clk_count;
> > +     struct snd_soc_jack hs_jack;
> > +     struct snd_soc_jack hdmi_jack;
> > +};
> > +
> > +static void sc7180_jack_free(struct snd_jack *jack)
> > +{
> > +     struct snd_soc_component *component = jack->private_data;
> > +
> > +     snd_soc_component_set_jack(component, NULL, NULL);
> > +}
> > +
> > +static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +     struct snd_soc_component *component = codec_dai->component;
> > +     struct snd_jack *jack;
> > +     int rval;
> > +
> > +     rval = snd_soc_card_jack_new(
> > +                     card, "Headset Jack",
> > +                     SND_JACK_HEADSET |
> > +                     SND_JACK_HEADPHONE |
> > +                     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> > +                     SND_JACK_BTN_2 | SND_JACK_BTN_3,
> > +                     &pdata->hs_jack, NULL, 0);
> > +
> > +     if (rval < 0) {
> > +             dev_err(card->dev, "Unable to add Headset Jack\n");
> > +             return rval;
> > +     }
> > +
> > +     jack = pdata->hs_jack.jack;
> > +
> > +     snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> > +     snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> > +
> > +     jack->private_data = component;
> > +     jack->private_free = sc7180_jack_free;
> > +
> > +     return snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
> > +}
> > +
> > +static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +     struct snd_soc_component *component = codec_dai->component;
> > +     struct snd_jack *jack;
> > +     int rval;
> > +
> > +     rval = snd_soc_card_jack_new(
> > +                     card, "HDMI Jack",
> > +                     SND_JACK_LINEOUT,
> > +                     &pdata->hdmi_jack, NULL, 0);
> > +
> > +     if (rval < 0) {
> > +             dev_err(card->dev, "Unable to add HDMI Jack\n");
> > +             return rval;
> > +     }
> > +
> > +     jack = pdata->hdmi_jack.jack;
> > +     jack->private_data = component;
> > +     jack->private_free = sc7180_jack_free;
> > +
> > +     return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
> > +}
> > +
> > +static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +
> > +     switch (cpu_dai->id) {
> > +     case MI2S_PRIMARY:
> > +             return sc7180_headset_init(rtd);
> > +     case MI2S_SECONDARY:
> > +             return 0;
> > +     case HDMI:
> > +             return sc7180_hdmi_init(rtd);
> > +     default:
> > +             dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> > +                     cpu_dai->id);
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +     struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +     int ret;
> > +
> > +     switch (cpu_dai->id) {
> > +     case MI2S_PRIMARY:
> > +             if (++data->pri_mi2s_clk_count == 1) {
> > +                     snd_soc_dai_set_sysclk(cpu_dai,
> > +                                            LPASS_MCLK0,
> > +                                            DEFAULT_MCLK_RATE,
> > +                                            SNDRV_PCM_STREAM_PLAYBACK);
> > +             }
> > +
> > +             snd_soc_dai_set_fmt(codec_dai,
> > +                                 SND_SOC_DAIFMT_CBS_CFS |
> > +                                 SND_SOC_DAIFMT_NB_NF |
> > +                                 SND_SOC_DAIFMT_I2S);
> > +
> > +             /* Configure PLL1 for codec */
> > +             ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> > +                                       DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> > +             if (ret) {
> > +                     dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> > +                     return ret;
> > +             }
> > +
> > +             /* Configure sysclk for codec */
> > +             ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> > +                                          RT5682_PLL1_FREQ,
> > +                                          SND_SOC_CLOCK_IN);
> > +             if (ret)
> > +                     dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> > +                             ret);
> > +
> > +             break;
> > +     case MI2S_SECONDARY:
> > +             break;
> > +     case HDMI:
> > +             break;
> > +     default:
> > +             dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> > +                     cpu_dai->id);
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct snd_soc_card *card = rtd->card;
> > +     struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +
> > +     switch (cpu_dai->id) {
> > +     case MI2S_PRIMARY:
> > +             if (--data->pri_mi2s_clk_count == 0) {
> > +                     snd_soc_dai_set_sysclk(cpu_dai,
> > +                                            LPASS_MCLK0,
> > +                                            0,
> > +                                            SNDRV_PCM_STREAM_PLAYBACK);
> > +             }
> > +             break;
> > +     case MI2S_SECONDARY:
> > +             break;
> > +     case HDMI:
> > +             break;
> > +     default:
> > +             dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> > +                     cpu_dai->id);
> > +             break;
> > +     }
> > +}
> > +
> > +static const struct snd_soc_ops sc7180_ops = {
> > +     .startup = sc7180_snd_startup,
> > +     .shutdown = sc7180_snd_shutdown,
> > +};
> > +
> > +static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
> > +     SND_SOC_DAPM_HP("Headphone Jack", NULL),
> > +     SND_SOC_DAPM_MIC("Headset Mic", NULL),
> > +};
> > +
> > +static struct snd_soc_card sc7180_card = {
> > +     .owner = THIS_MODULE,
> > +     .dapm_widgets = sc7180_snd_widgets,
> > +     .num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> > +};
> > +
> > +static void sc7180_add_ops(struct snd_soc_card *card)
> > +{
> > +     struct snd_soc_dai_link *link;
> > +     int i;
> > +
> > +     for_each_card_prelinks(card, i, link) {
> > +             link->ops = &sc7180_ops;
> > +             link->init = sc7180_init;
> > +     }
> > +}
> > +
> > +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct snd_soc_card *card = &sc7180_card;
> > +     struct sc7180_snd_data *data;
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +
> > +     /* Allocate the private data */
> > +     data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     card->dev = dev;
> > +     snd_soc_card_set_drvdata(card, data);
> > +
> > +     ret = qcom_snd_parse_of(card);
> > +     if (ret) {
> > +             dev_err(dev, "Error parsing OF data\n");
> > +             return ret;
> > +     }
> > +
> > +     sc7180_add_ops(card);
> > +
> > +     return devm_snd_soc_register_card(dev, card);
> > +}
> > +
> > +static const struct of_device_id sc7180_snd_device_id[]  = {
> > +     { .compatible = "qcom,sc7180-sndcard" },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
> > +
> > +static struct platform_driver sc7180_snd_driver = {
> > +     .probe = sc7180_snd_platform_probe,
> > +     .driver = {
> > +             .name = "msm-snd-sc7180",
> > +             .of_match_table = sc7180_snd_device_id,
> > +     },
> > +};
> > +module_platform_driver(sc7180_snd_driver);
> > +
> > +MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
> > +MODULE_LICENSE("GPL v2");
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
