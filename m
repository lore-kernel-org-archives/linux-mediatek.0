Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A56C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 07:30:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 671A6204EC
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 07:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WWPOPqxl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JZcT24Hh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 671A6204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=khmXojSsMGhSIJSEiqNWXcJXdTv+BYSlpSNq1wlYo/U=; b=WWPOPqxlxHKHOfAoJKT6Y+f7l
	X0pJzyg2qignLzIa3rBTywwOUynnlByctexTRaN9YSjDJ7zspCn7LCxpdq1yNAn2RwdYi2Qgldl0/
	YtmxFEIjt5EnV1c89xeLHAzj6XA1BcXP5SaA/BDRfNDeqVxQyYonGapnILexUrPzL9+d9i67DIzd+
	ic+2tA5Dtj+lcwWqv5HtXOLfItLZ5NmzHOiSi2qmeoLy+xrc+XleH4ps1D3Xu60+Ox313F9UYq6/D
	4xt7eaPeTWQq16wOE8O5rt3GzPbCSrlJJftlowfr7jsob1tyLrhkOo1BPu3vN3lkAx9Z7EumHqLOY
	uv/i7WOKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5lDP-0000fj-3R; Wed, 12 Aug 2020 07:30:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5lDJ-0000eL-OJ; Wed, 12 Aug 2020 07:30:23 +0000
X-UUID: de8c8af7ce0141af854cead022e6a5e3-20200811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2f2b1fQK5k9viNAfZ6b5HGQYyZyp/SEvBXD6QVEm6VM=; 
 b=JZcT24Hh5miQrUaDH1vUIsfgoB4qGVSOhlghs9vfnUKUa0Ja36aldiZISaE50Q3F7NmBKvxAdVCX4a9Tmbm763nPDk1kDb4MAD53EnoPD7/Ki8nXN1FOQbVwklzk3fNo0uhLRqbLwOext6HScR6b8fRq//5iB1e+fFu3zuQJmOI=;
X-UUID: de8c8af7ce0141af854cead022e6a5e3-20200811
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 486935650; Tue, 11 Aug 2020 23:30:12 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 00:30:09 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Aug 2020 15:30:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 15:30:05 +0800
Message-ID: <1597217353.23246.45.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2020 15:29:13 +0800
In-Reply-To: <20200810185933.GI6438@sirena.org.uk>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200810185933.GI6438@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 88F3FBB46F83E01A2B8413515E7631FBCEBB150A4347EE5EB913520D28AC67AE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_033022_063188_286474A2 
X-CRM114-Status: GOOD (  43.45  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-10 at 19:59 +0100, Mark Brown wrote:
> On Mon, Aug 10, 2020 at 11:05:53AM +0800, Jiaxin Yu wrote:
> 
> > +void mt6359_set_playback_gpio(struct snd_soc_component *cmpnt)
> > +{
> > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> 
> > +void mt6359_reset_playback_gpio(struct snd_soc_component *cmpnt)
> > +{
> > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> 
> > +void mt6359_set_capture_gpio(struct snd_soc_component *cmpnt)
> > +{
> 
> > +void mt6359_reset_capture_gpio(struct snd_soc_component *cmpnt)
> > +{
> 
> What are these, should they not be managed through gpiolib and/or
> pinctrl?

These are the functions that control the mux of input or output
signal. I refer to the other codec drivers, most of them are manipulate
the regs in their codec drivers also. Maybe it's easier to control?

> > +/* use only when doing mtkaif calibraiton at the boot time */
> > +static int mt6359_set_dcxo(struct mt6359_priv *priv, bool enable)
> > +{
> > +	regmap_update_bits(priv->regmap, MT6359_DCXO_CW12,
> > +			   0x1 << RG_XO_AUDIO_EN_M_SFT,
> > +			   (enable ? 1 : 0) << RG_XO_AUDIO_EN_M_SFT);
> > +	return 0;
> 
> Either don't have a return value or use the result of
> regmap_update_bits().  There's similar issues with some other functions
> in here.
> 

Yes, I will refine them.

> > +int mt6359_mtkaif_calibration_enable(struct snd_soc_pcm_runtime *rtd)
> > +{
> 
> > +EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_enable);
> 
> Why is this exported?
> 

This function is exported to machine driver to do calibration when
registering. The interface between MT6359 and MTK SoC is a special
interface that named MTKAIF. Therefore, if MT6359 is to be used
normally, it needs to rely on the platform for calibration when
registering.

> > +static void hp_aux_feedback_loop_gain_ramp(struct mt6359_priv *priv, bool up)
> > +{
> > +	int i = 0, stage = 0;
> > +
> > +	/* Reduce HP aux feedback loop gain step by step */
> > +	for (i = 0; i <= 0xf; i++) {
> > +		stage = up ? i : 0xf - i;
> 
> Please write normal conditional statements, it helps legibility.
> 

/* Increase/Reduce HP aux feedback loop gain step by step */
This is to prevent sudden changes in volume.

> > +static int mt6359_put_volsw(struct snd_kcontrol *kcontrol,
> > +			    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *component =
> > +			snd_soc_kcontrol_component(kcontrol);
> > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(component);
> > +	struct soc_mixer_control *mc =
> > +			(struct soc_mixer_control *)kcontrol->private_value;
> > +	unsigned int reg;
> > +	int index = ucontrol->value.integer.value[0];
> > +	int ret;
> > +
> > +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
> > +	if (ret < 0)
> > +		return ret;
> 
> So we make the volume change actually take effect...
> 
> > +	switch (mc->reg) {
> > +	case MT6359_ZCD_CON2:
> > +		regmap_read(priv->regmap, MT6359_ZCD_CON2, &reg);
> > +		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] =
> > +			(reg >> RG_AUDHPLGAIN_SFT) & RG_AUDHPLGAIN_MASK;
> > +		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] =
> > +			(reg >> RG_AUDHPRGAIN_SFT) & RG_AUDHPRGAIN_MASK;
> > +		break;
> 
> ..then read the value that was set and store it elsewhere.  What's
> going on here?
> 

Because we can adjust the volume at two points, before and during the
playback or capture. In addition, we will do volume ramp when opening
the driver. If we set the volume before opening the driver, we need get
the value to do volume ramp during opening the driver.

> > +/*HP MUX */
> > +static const char * const hp_in_mux_map[] = {
> > +	"Open",
> > +	"LoudSPK Playback",
> > +	"Audio Playback",
> > +	"Test Mode",
> > +	"HP Impedance",
> > +	"undefined1",
> > +	"undefined2",
> > +	"undefined3",
> > +};
> 
> Why expose undefined (and presumably out of spec) values to userspace?
> 

Removed them.

> > +static int mt_clksq_event(struct snd_soc_dapm_widget *w,
> > +			  struct snd_kcontrol *kcontrol,
> > +			  int event)
> > +{
> > +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> > +
> > +	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
> > +
> > +	switch (event) {
> > +	case SND_SOC_DAPM_PRE_PMU:
> > +		/* audio clk source from internal dcxo */
> > +		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON23,
> > +				   RG_CLKSQ_IN_SEL_TEST_MASK_SFT,
> > +				   0x0);
> 
> This also appeared to be controlled in _set_clkseq() - are we sure that
> things couldn't get confused about the state?
> 

_set_clkseq() will only be run at the time of mtkaif calibraiton, and
the calibration only run once when the codec driver probe. So it won't
get confused about the state. But it really only needs to be set up once
at mt6359_codec_init_reg(). I will remove the unnecesary settings.

> > +	/* HP damp circuit enable */
> > +	/*Enable HPRN/HPLN output 4K to VCM */
> 
> Spaces around the /* */
> 

Sorry, fixed it.

> > +static int mt_hp_event(struct snd_soc_dapm_widget *w,
> > +		       struct snd_kcontrol *kcontrol,
> > +		       int event)
> > +{
> > +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> > +	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
> > +	int device = DEVICE_HP;
> > +
> > +	dev_dbg(priv->dev, "%s(), event 0x%x, dev_counter[DEV_HP] %d, mux %u\n",
> > +		__func__, event, priv->dev_counter[device], mux);
> > +
> > +	switch (event) {
> > +	case SND_SOC_DAPM_PRE_PMU:
> > +		priv->dev_counter[device]++;
> > +		if (priv->dev_counter[device] > 1)
> > +			break;	/* already enabled, do nothing */
> > +		else if (priv->dev_counter[device] <= 0)
> 
> Why are we doing additional refcounting on top of what DAPM is doing?
> This seems like there should be at least one widget representing the
> shared bits of the audio path.
> 

We have "HPL Mux" and "HPR Mux", there will be two paths enabled when
playback throuh HP. But actually they share the same control sequences.
So in order to prevent setting it one more time we do additional
refcouting.


> > +#define MT6359_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
> > +			SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |\
> > +			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
> > +			SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |\
> > +			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
> > +			SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE)
> 
> The driver doesn't appear to configure anything except the sample rate -
> how are all these formats supported?
> 

The interface between MT6359 and MTK SoC is a special interface that
named MTKAIF. Because of its unique hardware settings, it really doesn't
to set format argument. The capability of pcm driver mainly depends on
cpu-dai driver to limit.

> > +	/* hp gain ctl default choose ZCD */
> > +	priv->hp_gain_ctl = HP_GAIN_CTL_ZCD;
> > +	hp_gain_ctl_select(priv, priv->hp_gain_ctl);
> 
> Why not use the hardware default?
> 

We have two ways to control the volume, there is to select ZCD. Because
the other one it not often used, ZCD is used by default. 

> > +	mt6359_codec_init_reg(cmpnt);
> > +
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] = 8;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] = 8;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1] = 3;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2] = 3;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP3] = 3;
> 
> Same here.
> 

Removed them.

> > +	ret = regulator_enable(priv->avdd_reg);
> > +	if (ret) {
> > +		dev_err(priv->dev, "%s(), failed to enable regulator!\n",
> > +			__func__);
> > +		return ret;
> > +	}
> 
> Perhaps make this a DAPM widget?
> 

"vaud18" needs to be always on so we enable it when codec probe.

> > +	priv->avdd_reg = devm_regulator_get(&pdev->dev, "vaud18");
> > +	if (IS_ERR(priv->avdd_reg)) {
> > +		dev_err(&pdev->dev, "%s(), have no vaud18 supply", __func__);
> > +		return PTR_ERR(priv->avdd_reg);
> > +	}
> 
> It's better to print error codes to help people debugging problems.
> 

Yes, I will print the error codes.

> > +static const struct of_device_id mt6359_of_match[] = {
> > +	{.compatible = "mediatek,mt6359-sound",},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6359_of_match);
> 
> We don't need a compatible here, we know that this device is here since
> it's part of the parent device and isn't something that might appear in
> another device.  This is reflecting the Linux driver model, not the
> hardware.

Removed them.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
