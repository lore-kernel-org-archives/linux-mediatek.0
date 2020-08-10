Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2EEC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 19:17:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B9D2080C
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 19:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EVQ0UFdP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RalHA/4+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMSpvbZo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48B9D2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WH1Vi6bZv1+g6pj8Iif/gCs7yUBnHzAzAa1PmQRGqgU=; b=EVQ0UFdPKBD95ogUVBmgOeCKg
	gVc/a6Xp/X5dyvZ7EA9uZPee75X0qEkGEyzsdGjWtDZmSdyYpcXuRqXG1gocHdqU37JwkWLCs6Pjs
	0qc0wfBCpCYHPF8nXhQXIbZjLYFSWzTdLQoSHCVqHg9n1hQeAjGrw/NhXVLpS6I0X0QjcZdwAqaDB
	poxRIXj7/GZm28Kggdh2kxAzkf6pgXZPtHNevbtrU06bfbWT1VPhggcZWB5fKUIK77Rmq8T9pExj2
	MjRuXMrXt0FZrIQXKSjIgn9Y4tUdirKwxGVZDkvGvYlqgOqhZKAg/aIjnxaTVWKPPbYynx/A1Cu1c
	k+i+7CJcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5DIR-0001BE-8P; Mon, 10 Aug 2020 19:17:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5DI6-00010e-AK; Mon, 10 Aug 2020 19:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oSdDu/oe+7lC7iCCSLwdJOWyBtbfEmy0k1aDXacoqqg=; b=RalHA/4+sAbSZfcxM/Blkl6pTg
 fmu673RdDPQiqtH/MhPQTXfg19hl2t31fc2Na2z8T7TbbUFlgD4lwgv0H8u7gbQFSawE2hFcACSrn
 xNVLmnWRMS6C2N4Bv7eNQ8rAsW/UclXYmpT07dMD3nuW2LhWgb7jW5kwHlrODFXlj6rQOSBHC7yKO
 SA86jrFfse4CISQ2Ymva78OWRAvyk7CDeYffHI8TuqW3IX5rZcZHg+/F6RBG+fYJdhBPXux4lNTaT
 KGbu3qLiV/OWUX9X8yKFX4XZAUeWUiDm/U7S/0cL9OelyegDNRz9Dbsl8JWGD1Qb/azeHWi184goN
 zewynIyg==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5D1i-0000ir-Tk; Mon, 10 Aug 2020 19:01:26 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36726221E2;
 Mon, 10 Aug 2020 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597085998;
 bh=0HJsvBhDgtMd4mAfQ0IClkR95U5B70Iyt02xN0TkLRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aMSpvbZonA3oWK0xvB/yax4FSrQgALfDEtyp7u69heNiQkz85DxmhF24Zwy83vKAU
 Mfm7ehaatohrYVb7vx7e/NX3PkpY8YH5ZmgDV8s5rCJHfonsIVyD23cgmOs3P1ot9d
 IJqH8xPbXjukRPEjSOp0pxkpna/oN2MvpjTv42+w=
Date: Mon, 10 Aug 2020 19:59:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
Message-ID: <20200810185933.GI6438@sirena.org.uk>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_200010_561247_7C8A3950 
X-CRM114-Status: GOOD (  33.05  )
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
Content-Type: multipart/mixed; boundary="===============8140390521562291330=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8140390521562291330==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tctmm6wHVGT/P6vA"
Content-Disposition: inline


--tctmm6wHVGT/P6vA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 10, 2020 at 11:05:53AM +0800, Jiaxin Yu wrote:

> +void mt6359_set_playback_gpio(struct snd_soc_component *cmpnt)
> +{
> +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);

> +void mt6359_reset_playback_gpio(struct snd_soc_component *cmpnt)
> +{
> +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);

> +void mt6359_set_capture_gpio(struct snd_soc_component *cmpnt)
> +{

> +void mt6359_reset_capture_gpio(struct snd_soc_component *cmpnt)
> +{

What are these, should they not be managed through gpiolib and/or
pinctrl?

> +/* use only when doing mtkaif calibraiton at the boot time */
> +static int mt6359_set_dcxo(struct mt6359_priv *priv, bool enable)
> +{
> +	regmap_update_bits(priv->regmap, MT6359_DCXO_CW12,
> +			   0x1 << RG_XO_AUDIO_EN_M_SFT,
> +			   (enable ? 1 : 0) << RG_XO_AUDIO_EN_M_SFT);
> +	return 0;

Either don't have a return value or use the result of
regmap_update_bits().  There's similar issues with some other functions
in here.

> +int mt6359_mtkaif_calibration_enable(struct snd_soc_pcm_runtime *rtd)
> +{

> +EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_enable);

Why is this exported?

> +static void hp_aux_feedback_loop_gain_ramp(struct mt6359_priv *priv, bool up)
> +{
> +	int i = 0, stage = 0;
> +
> +	/* Reduce HP aux feedback loop gain step by step */
> +	for (i = 0; i <= 0xf; i++) {
> +		stage = up ? i : 0xf - i;

Please write normal conditional statements, it helps legibility.

> +static int mt6359_put_volsw(struct snd_kcontrol *kcontrol,
> +			    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +			snd_soc_kcontrol_component(kcontrol);
> +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +			(struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int reg;
> +	int index = ucontrol->value.integer.value[0];
> +	int ret;
> +
> +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
> +	if (ret < 0)
> +		return ret;

So we make the volume change actually take effect...

> +	switch (mc->reg) {
> +	case MT6359_ZCD_CON2:
> +		regmap_read(priv->regmap, MT6359_ZCD_CON2, &reg);
> +		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] =
> +			(reg >> RG_AUDHPLGAIN_SFT) & RG_AUDHPLGAIN_MASK;
> +		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] =
> +			(reg >> RG_AUDHPRGAIN_SFT) & RG_AUDHPRGAIN_MASK;
> +		break;

...then read the value that was set and store it elsewhere.  What's
going on here?

> +/*HP MUX */
> +static const char * const hp_in_mux_map[] = {
> +	"Open",
> +	"LoudSPK Playback",
> +	"Audio Playback",
> +	"Test Mode",
> +	"HP Impedance",
> +	"undefined1",
> +	"undefined2",
> +	"undefined3",
> +};

Why expose undefined (and presumably out of spec) values to userspace?

> +static int mt_clksq_event(struct snd_soc_dapm_widget *w,
> +			  struct snd_kcontrol *kcontrol,
> +			  int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> +
> +	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		/* audio clk source from internal dcxo */
> +		regmap_update_bits(priv->regmap, MT6359_AUDENC_ANA_CON23,
> +				   RG_CLKSQ_IN_SEL_TEST_MASK_SFT,
> +				   0x0);

This also appeared to be controlled in _set_clkseq() - are we sure that
things couldn't get confused about the state?

> +	/* HP damp circuit enable */
> +	/*Enable HPRN/HPLN output 4K to VCM */

Spaces around the /* */

> +static int mt_hp_event(struct snd_soc_dapm_widget *w,
> +		       struct snd_kcontrol *kcontrol,
> +		       int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> +	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
> +	int device = DEVICE_HP;
> +
> +	dev_dbg(priv->dev, "%s(), event 0x%x, dev_counter[DEV_HP] %d, mux %u\n",
> +		__func__, event, priv->dev_counter[device], mux);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		priv->dev_counter[device]++;
> +		if (priv->dev_counter[device] > 1)
> +			break;	/* already enabled, do nothing */
> +		else if (priv->dev_counter[device] <= 0)

Why are we doing additional refcounting on top of what DAPM is doing?
This seems like there should be at least one widget representing the
shared bits of the audio path.

> +#define MT6359_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
> +			SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |\
> +			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
> +			SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |\
> +			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
> +			SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE)

The driver doesn't appear to configure anything except the sample rate -
how are all these formats supported?

> +	/* hp gain ctl default choose ZCD */
> +	priv->hp_gain_ctl = HP_GAIN_CTL_ZCD;
> +	hp_gain_ctl_select(priv, priv->hp_gain_ctl);

Why not use the hardware default?

> +	mt6359_codec_init_reg(cmpnt);
> +
> +	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] = 8;
> +	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] = 8;
> +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1] = 3;
> +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2] = 3;
> +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP3] = 3;

Same here.

> +	ret = regulator_enable(priv->avdd_reg);
> +	if (ret) {
> +		dev_err(priv->dev, "%s(), failed to enable regulator!\n",
> +			__func__);
> +		return ret;
> +	}

Perhaps make this a DAPM widget?

> +	priv->avdd_reg = devm_regulator_get(&pdev->dev, "vaud18");
> +	if (IS_ERR(priv->avdd_reg)) {
> +		dev_err(&pdev->dev, "%s(), have no vaud18 supply", __func__);
> +		return PTR_ERR(priv->avdd_reg);
> +	}

It's better to print error codes to help people debugging problems.

> +static const struct of_device_id mt6359_of_match[] = {
> +	{.compatible = "mediatek,mt6359-sound",},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6359_of_match);

We don't need a compatible here, we know that this device is here since
it's part of the parent device and isn't something that might appear in
another device.  This is reflecting the Linux driver model, not the
hardware.

--tctmm6wHVGT/P6vA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8xmRQACgkQJNaLcl1U
h9AwIgf/ayU+/rwIHTkJ6VHfejmdeAG1IuGX9PJk/02XeL8eLs6JB9rj9SSoU2pO
G0QckxHzOBj3IgDORpJy47BJv7U2KM5LH5XctLsQGImG9/M+eZcQ/1lAymOqJIcx
PEzpnBRXrIwwJYwWw+mr3EZB0fqpDUW2mXiNQ7izPT2AVi7zb0DFXFNaptVHxXoc
EeL/LPmaj53Gla+Yzf7jgx7D3aVqD2jBvSbn7ZUdxC9UZ251BNUhgfp3qL0AoUZS
maoxcbO9NL3J9L03l9EGTOUY1lqIqV086dq9Li6SShSkhBa75Qi62p5ekPMqzNZo
iOIMD+8g6aPEauTaCnT4ozpXpwiPvA==
=J0i4
-----END PGP SIGNATURE-----

--tctmm6wHVGT/P6vA--


--===============8140390521562291330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8140390521562291330==--

