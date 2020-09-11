Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119B1C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 15:01:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBD1222BA
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 15:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXiZ1dj+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="HRwiQff+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BBD1222BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2KHjGMYeNu4k7h39kcJNYwPRsbKbk1GUcUxkB2ruxgY=; b=hXiZ1dj+WNwRn6VVwQbd+QJTU
	13qaqEXgj2QMm7Ua0lRiqac4lCG0P72KP4McJ/OR7rrWojKwsBCa+wky+aCRXbO/XKwtoZGqhRDtY
	SSFZsh3yqEZW2UVZWslxxJ+Z0aApiuHh6MG4kzpd7MXOk10pByUF2IjyzCZSx2IHRVUW7LMLmf5k/
	DwQAKzWyYGDk1efgfZeGCzCx4RnZ/X2ZqirNyIifcrGXjEE/SSVzkLBou9V/SvT07Ghp7Q+AUtisp
	Qxdib8JIAeoVqo2gTKObne2thTNcWirnoMlK07oYFZJ/L8OiRT6afBcH/m7MSSnLTVPJzqt7m6ei9
	VN73VJq6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGkXx-0000NH-Mv; Fri, 11 Sep 2020 15:01:05 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGkXs-0000MG-OU; Fri, 11 Sep 2020 15:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599836457;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=HxVrrGD2kLhJ6RXz9xL0pT6u48do7GUFCv4skGWY/sQ=;
 b=HRwiQff+aGHyEN52Z4U3opyfBH/qEGgVztDgDEKlxw2tPLicD+yc54x+0qPrsJHrTa
 2MWyHQGPAt4o2Zai16xoyoVHZnV3e+IKhRJWnjqc8pxU37GwI5NOBqs+EDTxSYek2D4k
 cZSscopyQylPHp/qljSFM/7E93P2609d+XHeDTXwr9QS3X34WanIk+Nxz1BpdKRHpdcq
 B6b6hqoSYIGB3TOBP2tZFZjVdVAcJLs3P4LmOTsQeCAafFJE4JpDqyaKg3rAPzOaQp2o
 OkoKJhOwI50+kd9FOGK3NtqZ3aD3NVvgimH3RdRj/wllbASdK5nR0GHEaOcLthSPjWGB
 GFqA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEIdhPgVC7iy9yGr7ESbX"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id g0b6c1w8BF0mNYQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 11 Sep 2020 17:00:48 +0200 (CEST)
Date: Fri, 11 Sep 2020 17:00:44 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v9 3/3] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
Message-ID: <20200911150044.GA2352@gerhold.net>
References: <20200911102259.3667381-1-cychiang@chromium.org>
 <20200911102259.3667381-4-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911102259.3667381-4-cychiang@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_110101_005913_31058D36 
X-CRM114-Status: GOOD (  28.00  )
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
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Ajit Pandey <ajitp@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, Jaroslav Kysela <perex@perex.cz>,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Thanks for removing the weird use of auxilliary devices :)

On Fri, Sep 11, 2020 at 06:22:59PM +0800, Cheng-Yi Chiang wrote:
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
>  sound/soc/qcom/sc7180.c | 267 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 281 insertions(+)
>  create mode 100644 sound/soc/qcom/sc7180.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index a607ace8b089..0459185ee243 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -116,4 +116,16 @@ config SND_SOC_SDM845
>  	  SDM845 SoC-based systems.
>  	  Say Y if you want to use audio device on this SoCs.
>  
> +config SND_SOC_SC7180
> +	tristate "SoC Machine driver for SC7180 boards"
> +	depends on I2C
> +	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_LPASS_SC7180
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_RT5682_I2C
> +	help
> +	  To add support for audio on Qualcomm Technologies Inc.
> +	  SC7180 SoC-based systems.
> +	  Say Y if you want to use audio device on this SoCs.
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
> index 000000000000..40bc4fc98842
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,267 @@
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
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +#include "../codecs/rt5682.h"
> +#include "common.h"
> +#include "lpass.h"
> +
> +#define DEFAULT_SAMPLE_RATE_48K		48000
> +#define DEFAULT_MCLK_RATE		19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
> +
> +struct sc7180_snd_data {
> +	u32 pri_mi2s_clk_count;
> +	struct snd_soc_jack hs_jack;
> +	struct snd_soc_jack hdmi_jack;
> +};

[...]

> +
> +static const struct snd_soc_ops sc7180_ops = {
> +	.startup = sc7180_snd_startup,
> +	.shutdown = sc7180_snd_shutdown,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static struct snd_soc_card sc7180_card = {
> +	.owner = THIS_MODULE,
> +	.dapm_widgets = sc7180_snd_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> +};

Given that you modify this struct and already allocate some memory
dynamically (sc7810_snd_data), it might be a bit cleaner to avoid
modifying global memory and instead allocate snd_soc_card dynamically as
well. Could just add it to sc7180_snd_data for example (see e.g. apq8016_sbc)

> +
> +static void sc7180_add_ops(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, link) {
> +		link->ops = &sc7180_ops;
> +		link->init = sc7180_init;
> +	}
> +}
> +
> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = &sc7180_card;
> +	struct sc7180_snd_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	/* Allocate the private data */
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	card->dev = dev;
> +	snd_soc_card_set_drvdata(card, data);
> +
> +	ret = qcom_snd_parse_of(card);
> +	if (ret) {
> +		dev_err(dev, "Error parsing OF data\n");

This will just add noise in case of probe deferral. qcom_snd_parse_of()
already logs a message for most errors so you can just remove this one.

> +		return ret;
> +	}
> +
> +	sc7180_add_ops(card);
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id sc7180_snd_device_id[]  = {
> +	{ .compatible = "qcom,sc7180-sndcard" },

Will all SC7180 use the configuration in this driver? (With RT5682,
HDMI, the jack configuration etc). Otherwise a more specific compatible
string might be better, so other device-specific ones can be added later.

Thanks!
Stephan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
