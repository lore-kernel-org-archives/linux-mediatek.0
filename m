Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B33C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 02:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P77HP4xexm9/rJk+I0EojZG6mNfJN2+lSmyhoYFdaFk=; b=WlxFodIEQil9Sn
	VE6oBq8L8qUgy6hViawPqvLbGJtoatV+39c+/ozZuqP4NG8PuREu7Z5pr3Cp5hULhcx5pFybwPOIe
	YR5a4mNagERuxQXyIqSH1jx287upmfVF9D3Cf7t56rOmg1EcTtAoCCgENIufRoNl8TYJ9g5BaewQx
	z7YKcDDH5Txzkxb6SF0+HbuXWDFb+fz7nz8wY9Pe1/tAp1zQUiITpKmdd0G1vsfslwglk4Sc1/gmq
	ulD2YPmxy6V91wbEM9dT7uc0mA5r7S7wzeP3cUwgAtUdRmxG1MbSl3soRe4XKl+lfGojZYq0Xw5Kc
	OExMeN1B1p0sPV3KIuAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUfoT-00Eip9-6h; Thu, 17 Mar 2022 02:24:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUfoH-00Eing-IQ; Thu, 17 Mar 2022 02:24:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B11F60FD3;
 Thu, 17 Mar 2022 02:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB34C340E9;
 Thu, 17 Mar 2022 02:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647483856;
 bh=Ix1jQ+FTzwE7Py6xt22i052YfsEmKH5ZWqPAWdPOfew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOU9qujVX+uI4/9wMBgvpeASYF6Pp7QCCm7v8rFExMAZYljME4XvGhHrvM8+Lem7q
 dreeq5nCd89J0a1oej6Lz3z0E6cLTph6Fa7Gc0Nm8DCa48vEsk3izsQSCWvvUnirVQ
 oYW3k5XYpC9y+mkIaDGQsdG9Pb6gBdS+weljL0jRp7OwM9vD5sfrISLVQjehrQoY2A
 6+RimgJFqSLbg7rKS/Kvrno9QzEDM1kC3Td2OMrG9mzOj+XJ4CSiHI+AcF72nRjQ4e
 0SaPZfS/oGJwWGDgjLVJvMsXjJtFs8eeuKVLfpmo9AadwgL/RqoVOhwsG04c99WOTt
 Fd+wbtdwqIQQw==
Date: Thu, 17 Mar 2022 10:24:11 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v2 1/5] ASoC: mediatek: mt8195: merge machine driver
Message-ID: <YjKby/RYpMtcxeUm@google.com>
References: <20220316060139.6211-1-trevor.wu@mediatek.com>
 <20220316060139.6211-2-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316060139.6211-2-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_192417_726427_127BF673 
X-CRM114-Status: GOOD (  22.77  )
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

Hi,
I didn't review too many details because I found the patch is not easy to
review.  Please consider to not reorder symbols if it can.  If it is still
hard to generate reasonable chunks or the reorders are necessary, it could
put some refactor patches prior to the "merge".

On Wed, Mar 16, 2022 at 02:01:35PM +0800, Trevor Wu wrote:
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
[...]
>  #include <linux/input.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <sound/jack.h>
>  #include <sound/pcm_params.h>
>  #include <sound/rt5682.h>
> -#include <sound/sof.h>

Why does it remove the header?

> +struct mt8195_mt6359_priv {
> +	struct snd_soc_jack headset_jack;
> +	struct snd_soc_jack dp_jack;
> +	struct snd_soc_jack hdmi_jack;
> +	struct clk *i2so1_mclk;
> +};
> +
> +struct mt8195_card_data {
> +	const char *name;
> +	unsigned long quirk;
> +};
> +
> +struct sof_conn_stream {
> +	const char *normal_link;
> +	const char *sof_link;
> +	const char *sof_dma;
> +	int stream_dir;
> +};
[...]
> -struct sof_conn_stream {
> -	const char *normal_link;
> -	const char *sof_link;
> -	const char *sof_dma;
> -	int stream_dir;
> -};
> -
> -struct mt8195_mt6359_rt1019_rt5682_priv {
> -	struct snd_soc_jack headset_jack;
> -	struct snd_soc_jack dp_jack;
> -	struct snd_soc_jack hdmi_jack;
> -	struct clk *i2so1_mclk;
> -};

The effective operation here: rename from mt8195_mt6359_rt1019_rt5682_priv
to mt8195_mt6359_priv.  However, it somehow reorders the code.  As a result,
the change looks like more complicated than just a "merge" operation.

> -static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
> -	/* speaker */
> -	{ "Speakers", NULL, "Speaker" },
> +static const struct snd_kcontrol_new mt8195_mt6359_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +};
> +
> +static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
>  	/* headset */
>  	{ "Headphone Jack", NULL, "HPOL" },
>  	{ "Headphone Jack", NULL, "HPOR" },
> @@ -80,55 +94,31 @@ static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
>  	{"I021", NULL, SOF_DMA_DL3},
>  };
>  
> -static const struct snd_kcontrol_new mt8195_mt6359_rt1019_rt5682_controls[] = {
> -	SOC_DAPM_PIN_SWITCH("Speakers"),
> -	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> -	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +static const struct snd_soc_dapm_widget mt8195_dual_speaker_widgets[] = {
> +	SND_SOC_DAPM_SPK("Left Speaker", NULL),
> +	SND_SOC_DAPM_SPK("Right Speaker", NULL),
>  };
>  
> -static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
> -					struct snd_pcm_hw_params *params)
> -{
[...]
> +static const struct snd_kcontrol_new mt8195_dual_speaker_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Left Speaker"),
> +	SOC_DAPM_PIN_SWITCH("Right Speaker"),
> +};

Ditto.  I would expect it only renames and adds something.  However, if you
look at the block and the following, it looks like changed a lot.

> @@ -143,20 +133,20 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>  	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
>  	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>  	struct mtkaif_param *param = &afe_priv->mtkaif_params;
> -	int phase;
> -	unsigned int monitor;
> -	int mtkaif_calibration_num_phase;
> +	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> +	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
>  	int test_done_1, test_done_2, test_done_3;
>  	int cycle_1, cycle_2, cycle_3;
> -	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
> -	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> -	int counter;
> -	bool mtkaif_calibration_ok;
>  	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
>  	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
> +	int mtkaif_calibration_num_phase;
> +	bool mtkaif_calibration_ok;
> +	unsigned int monitor;
> +	int counter;
> +	int phase;
>  	int i;

The reorder of variable declaration is irrelevant to the patch.  Drop them.
If it has good reason to do so, send another patch for the purpose.

> @@ -513,7 +446,7 @@ static int mt8195_playback_startup(struct snd_pcm_substream *substream)
>  	return 0;
>  }
>  
> -static const struct snd_soc_ops mt8195_playback_ops = {
> +const struct snd_soc_ops mt8195_playback_ops = {
>  	.startup = mt8195_playback_startup,

Why does it remove the `static`?

> +static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
>  {
[...]
> +	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
> +	if (!match || !match->data)
> +		return -EINVAL;
> +
> +	card_data = (struct mt8195_card_data *)match->data;

Use of_device_get_match_data().

> -static const struct dev_pm_ops mt8195_mt6359_rt1019_rt5682_pm_ops = {
> +const struct dev_pm_ops mt8195_mt6359_pm_ops = {
>  	.poweroff = snd_soc_poweroff,
>  	.restore = snd_soc_resume,
>  };

Why does it remove the `static`?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
