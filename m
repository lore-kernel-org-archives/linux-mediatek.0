Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 04:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4EGGKa0zFgIjq6l4aLPI+J7/aR8FLgS6rp2eV+hN/U=; b=IYJ6E64i9Iwuqc
	BRNRN5ASJQol0/XpwoOP8O2nrMUdv65YuXBHcaLvsUqGbNVNLzl4aTFO0Ylv7fDo1BT7KA0fOVegV
	4VCKyklUY2iKLA8gPb2ZxjFeSTQp3ZOllr6urhK/hkHhfWWC3TtmFbsF/SD6cDvS96zIGz3PbAIh1
	KzqyNDeg+aG3tAm7fecagq15Kk6Mfkm3qGAvO8BW/NfBnbRAcYVzyGDn6ice9t3M8BqQL1bMP+zMf
	jOyjeocljqgwE8Go6dAmNuotSiRy2bJP8TaKeI2P3wdpWmYw+W1z+Bw1JF8XWxQCwDgdSqaBhmYhI
	HLCYbvh5Kst1fgKSFU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUha1-00Estn-Tz; Thu, 17 Mar 2022 04:17:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUhZy-00EstM-OI; Thu, 17 Mar 2022 04:17:40 +0000
X-UUID: b8707a4d61144de5b91a3cbdd1a205cf-20220316
X-UUID: b8707a4d61144de5b91a3cbdd1a205cf-20220316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1578025385; Wed, 16 Mar 2022 21:17:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 21:17:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 12:17:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 12:17:30 +0800
Message-ID: <946a35efc1983c8f941f2350d4f9e0245dcbf95a.camel@mediatek.com>
Subject: Re: [PATCH v2 1/5] ASoC: mediatek: mt8195: merge machine driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <yc.hung@mediatek.com>,
 <aaronyu@google.com>, <linux-arm-kernel@lists.infradead.org>,
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 17 Mar 2022 12:17:30 +0800
In-Reply-To: <YjKby/RYpMtcxeUm@google.com>
References: <20220316060139.6211-1-trevor.wu@mediatek.com>
 <20220316060139.6211-2-trevor.wu@mediatek.com>
 <YjKby/RYpMtcxeUm@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_211738_837726_75862271 
X-CRM114-Status: GOOD (  34.84  )
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

On Thu, 2022-03-17 at 10:24 +0800, Tzung-Bi Shih wrote:
> Hi,
> I didn't review too many details because I found the patch is not
> easy to
> review.  Please consider to not reorder symbols if it can.  If it is
> still
> hard to generate reasonable chunks or the reorders are necessary, it
> could
> put some refactor patches prior to the "merge".

Hi Tzung-Bi,

Thanks for your suggestion.
Originally, I try to delete the old machine drivers and create a new
one, so the layout is reordered and some functions are copied from
mt8195-mt6359-rt1011-rt5682.c. But the git patch becomes a diff with
mt8195-mt6359-rt1019-rt5682.c.

I can split the one into two patches in v3, one is "merge" and another
one is "revise".
I hope it can make the review easier.

> 
> On Wed, Mar 16, 2022 at 02:01:35PM +0800, Trevor Wu wrote:
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-
> > rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> 
> [...]
> >  #include <linux/input.h>
> >  #include <linux/module.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <sound/jack.h>
> >  #include <sound/pcm_params.h>
> >  #include <sound/rt5682.h>
> > -#include <sound/sof.h>
> 
> Why does it remove the header?
It seems that the header is redundant, because the driver works on my
platform.
But I will double confirm it.

> 
> > +struct mt8195_mt6359_priv {
> > +	struct snd_soc_jack headset_jack;
> > +	struct snd_soc_jack dp_jack;
> > +	struct snd_soc_jack hdmi_jack;
> > +	struct clk *i2so1_mclk;
> > +};
> > +
> > +struct mt8195_card_data {
> > +	const char *name;
> > +	unsigned long quirk;
> > +};
> > +
> > +struct sof_conn_stream {
> > +	const char *normal_link;
> > +	const char *sof_link;
> > +	const char *sof_dma;
> > +	int stream_dir;
> > +};
> 
> [...]
> > -struct sof_conn_stream {
> > -	const char *normal_link;
> > -	const char *sof_link;
> > -	const char *sof_dma;
> > -	int stream_dir;
> > -};
> > -
> > -struct mt8195_mt6359_rt1019_rt5682_priv {
> > -	struct snd_soc_jack headset_jack;
> > -	struct snd_soc_jack dp_jack;
> > -	struct snd_soc_jack hdmi_jack;
> > -	struct clk *i2so1_mclk;
> > -};
> 
> The effective operation here: rename from
> mt8195_mt6359_rt1019_rt5682_priv
> to mt8195_mt6359_priv.  However, it somehow reorders the code.  As a
> result,
> the change looks like more complicated than just a "merge" operation.
> 
> > -static const struct snd_soc_dapm_route
> > mt8195_mt6359_rt1019_rt5682_routes[] = {
> > -	/* speaker */
> > -	{ "Speakers", NULL, "Speaker" },
> > +static const struct snd_kcontrol_new mt8195_mt6359_controls[] = {
> > +	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> > +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> > +};
> > +
> > +static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
> >  	/* headset */
> >  	{ "Headphone Jack", NULL, "HPOL" },
> >  	{ "Headphone Jack", NULL, "HPOR" },
> > @@ -80,55 +94,31 @@ static const struct snd_soc_dapm_route
> > mt8195_mt6359_rt1019_rt5682_routes[] = {
> >  	{"I021", NULL, SOF_DMA_DL3},
> >  };
> >  
> > -static const struct snd_kcontrol_new
> > mt8195_mt6359_rt1019_rt5682_controls[] = {
> > -	SOC_DAPM_PIN_SWITCH("Speakers"),
> > -	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> > -	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> > +static const struct snd_soc_dapm_widget
> > mt8195_dual_speaker_widgets[] = {
> > +	SND_SOC_DAPM_SPK("Left Speaker", NULL),
> > +	SND_SOC_DAPM_SPK("Right Speaker", NULL),
> >  };
> >  
> > -static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream
> > *substream,
> > -					struct snd_pcm_hw_params
> > *params)
> > -{
> 
> [...]
> > +static const struct snd_kcontrol_new
> > mt8195_dual_speaker_controls[] = {
> > +	SOC_DAPM_PIN_SWITCH("Left Speaker"),
> > +	SOC_DAPM_PIN_SWITCH("Right Speaker"),
> > +};
> 
> Ditto.  I would expect it only renames and adds something.  However,
> if you
> look at the block and the following, it looks like changed a lot.
> 
> > @@ -143,20 +133,20 @@ static int
> > mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
> >  	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt_afe);
> >  	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> >  	struct mtkaif_param *param = &afe_priv->mtkaif_params;
> > -	int phase;
> > -	unsigned int monitor;
> > -	int mtkaif_calibration_num_phase;
> > +	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> > +	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
> >  	int test_done_1, test_done_2, test_done_3;
> >  	int cycle_1, cycle_2, cycle_3;
> > -	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
> > -	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> > -	int counter;
> > -	bool mtkaif_calibration_ok;
> >  	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
> >  	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
> > +	int mtkaif_calibration_num_phase;
> > +	bool mtkaif_calibration_ok;
> > +	unsigned int monitor;
> > +	int counter;
> > +	int phase;
> >  	int i;
> 
> The reorder of variable declaration is irrelevant to the patch.  Drop
> them.
> If it has good reason to do so, send another patch for the purpose.

This function is copied from mt8195-mt6359-rt1011-rt5682.c, because
this is the latest version of mt8195_mt6359_mtkaif_calibration().
The reordering is suggested by the reviewer.


> 
> > @@ -513,7 +446,7 @@ static int mt8195_playback_startup(struct
> > snd_pcm_substream *substream)
> >  	return 0;
> >  }
> >  
> > -static const struct snd_soc_ops mt8195_playback_ops = {
> > +const struct snd_soc_ops mt8195_playback_ops = {
> >  	.startup = mt8195_playback_startup,
> 
> Why does it remove the `static`?

Sorry, I will add it in v3.

> 
> > +static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
> >  {
> 
> [...]
> > +	match = of_match_device(pdev->dev.driver->of_match_table,
> > &pdev->dev);
> > +	if (!match || !match->data)
> > +		return -EINVAL;
> > +
> > +	card_data = (struct mt8195_card_data *)match->data;
> 
> Use of_device_get_match_data().

OK.

> 
> > -static const struct dev_pm_ops mt8195_mt6359_rt1019_rt5682_pm_ops
> > = {
> > +const struct dev_pm_ops mt8195_mt6359_pm_ops = {
> >  	.poweroff = snd_soc_poweroff,
> >  	.restore = snd_soc_resume,
> >  };
> 
> Why does it remove the `static`?

I will add it in v3.

Thanks,
Trevor


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
