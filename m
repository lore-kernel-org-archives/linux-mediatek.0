Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C5AC18E5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 09:22:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6CE22146E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 09:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="isZi9km0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XRTznKKH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6CE22146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PiAYdiepiblGijHNUGzwuPDMEkjWlFbnuRF1okNamfA=; b=isZi9km0aHWolo
	j6r6C095uNLzor8i4iuv6tHIAgrUD3XXfRhyzXcFEKUQry25xWtAhYE+1dLNjspnz8Yw/MLhB4vo8
	+TFGPiysQ+oZr3BnCwt1RvsytlcSig27Ebtiy4VSBBAStElpLBb0s/TQM8R5dpvXEPjbsIsee5PRg
	dmJpT4iJwr2ug1/tUKku6IwS/1n4E/UAjkDVgvMUP+NTrDXoLEUoTl8bVV9Llq6WSBm9W3zHZtZGx
	BtK6juG6aSLkgBe1U94DqqarDPqmmjVFzROmk7WN5yTJL/YxdL/1zsXRWWNTb30/Q0WVapHZTzhdU
	XZLjl+bBoCvjlO4XvIUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBxZS-0006MF-O5; Wed, 11 Mar 2020 09:22:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBxZP-0006Kr-3c
 for linux-mediatek@lists.infradead.org; Wed, 11 Mar 2020 09:22:32 +0000
X-UUID: 48cff85ef19e4e65ab3232bfa7137170-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YWynqqGFWrui+bPw8+eUdxbiLNv0tlC1GONhbH/mI+0=; 
 b=XRTznKKHAFsg9QE1mAbgUxIFtukPH+quc0nt04/gwuBh3OKbgmYKWh3EigUYhv/qvykIRTsC1YMUjaQfxthivZGY+3vckBtNGwsNQknN436UPCz8QZ20/Al/YmFIL3OS7gV1IJbnP9lALGG7hiRY+Y0jovnN1pXKayg74URbXGI=;
X-UUID: 48cff85ef19e4e65ab3232bfa7137170-20200311
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1431225330; Wed, 11 Mar 2020 01:22:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 02:22:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 17:21:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 17:22:32 +0800
Message-ID: <1583918544.19248.69.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] ASoC: codec: mediatek: add mt6359 codec driver
From: Eason Yen <eason.yen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Mar 2020 17:22:24 +0800
In-Reply-To: <20200309131346.GF4101@sirena.org.uk>
References: <1583465622-16628-1-git-send-email-eason.yen@mediatek.com>
 <1583465622-16628-3-git-send-email-eason.yen@mediatek.com>
 <20200309131346.GF4101@sirena.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_022231_166108_0ABAA6DC 
X-CRM114-Status: GOOD (  30.29  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Mark,

	Thanks for your attentive review.
	The following is my feedback.
	Please kindly give suggestion, thanks.

On Mon, 2020-03-09 at 13:13 +0000, Mark Brown wrote:
> On Fri, Mar 06, 2020 at 11:33:42AM +0800, Eason Yen wrote:
> 
> > +static void capture_gpio_reset(struct mt6359_priv *priv)
> > +{
> > +	/* set pad_aud_*_miso to GPIO mode and dir input
> > +	 * reason:
> > +	 * pad_aud_clk_miso, because when playback only the miso_clk
> > +	 * will also have 26m, so will have power leak
> > +	 * pad_aud_dat_miso*, because the pin is used as boot strap
> > +	 */
> 
> This looks like things that might be better exposed via pinctrl and
> gpiolib for board specific configuration - what exactly are these GPIOs
> doing?  A lot of this code looks like it might be board specific.
> 
MT6359 has some gpios (pad_aud_*) for downlink/uplink.
And these pins is connected between AP part and PMIC part.
(1) For AP part, user need to set gpio pinmux for these gpio using DT.
(2) For pmic part, gpio are configured at codec driver by default.

For PMIC part, user need to set in these register :
GPIO_MODE1/GPIO_MODE2/GPIO_MODE3

The following functions are used to set:
- playback_gpio_set/playback_gpio_reset
- capture_gpio_set/capture_gpio_reset
- vow_gpio_set/vow_gpio_reset


> > +/* use only when not govern by DAPM */
> > +static int mt6359_set_dcxo(struct mt6359_priv *priv, bool enable)
> > +{
> 
> Why might this sometimes be controlled outside of DAPM?
> 
mt6359_set_dcxo is used at mt6359_mtkaif_calibration_enable/disable.

mtkaif_calibration process needs be completed at booting stage once.
And it has a specific control sequence provided by codec designer.
So it need to be controlled outside of DAPM.

> > +/* reg idx for -40dB*/
> > +#define PGA_MINUS_40_DB_REG_VAL 0x1f
> > +#define HP_PGA_MINUS_40_DB_REG_VAL 0x3f
> > +static const char *const dl_pga_gain[] = {
> > +	"8Db", "7Db", "6Db", "5Db", "4Db",
> > +	"3Db", "2Db", "1Db", "0Db", "-1Db",
> > +	"-2Db", "-3Db",	"-4Db", "-5Db", "-6Db",
> > +	"-7Db", "-8Db", "-9Db", "-10Db", "-40Db"
> > +};
> > +
> > +static const char *const hp_dl_pga_gain[] = {
> > +	"8Db", "7Db", "6Db", "5Db", "4Db",
> > +	"3Db", "2Db", "1Db", "0Db", "-1Db",
> > +	"-2Db", "-3Db",	"-4Db", "-5Db", "-6Db",
> > +	"-7Db", "-8Db", "-9Db", "-10Db", "-11Db",
> > +	"-12Db", "-13Db", "-14Db", "-15Db", "-16Db",
> > +	"-17Db", "-18Db", "-19Db", "-20Db", "-21Db",
> > +	"-22Db", "-40Db"
> > +};
> 
> I can't see any users of these tables in the driver?  That's good since
> the driver should be translating these into TLV controls rather than
> using enums but these variables aren't used then so should be removed.
> 
Yes, you are right. These enum are useless and I will remove it at next
patch.


> > +
> > +	if (!is_valid_hp_pga_idx(from) || !is_valid_hp_pga_idx(to))
> > +		dev_warn(priv->dev, "%s(), volume index is not valid, from %d, to %d\n",
> > +			 __func__, from, to);
> 
> Shouldn't we return an error then?
> 
Yes, you are right. I will add error handling in headset_volume_ramp()
at next patch.

> > +
> > +	dev_info(priv->dev, "%s(), from %d, to %d\n",
> > +		 __func__, from, to);
> 
> At most this should be a dev_dbg(), having a dev_info() log is going to
> be far too verbose.  There's a lot of these in the driver.
> 
ok, I will replace dev_info with dev_dgb for these degug logs.

> > +static const char *const mic_type_mux_map[] = {
> > +	"Idle",
> > +	"ACC",
> > +	"DMIC",
> > +	"DCC",
> > +	"DCC_ECM_DIFF",
> > +	"DCC_ECM_SINGLE",
> > +	"VOW_ACC",
> > +	"VOW_DMIC",
> > +	"VOW_DMIC_LP",
> > +	"VOW_DCC",
> > +	"VOW_DCC_ECM_DIFF",
> > +	"VOW_DCC_ECM_SINGLE"
> > +};
> 
> This looks like something that should be being set by DT or other
> platform data rather than at runtime - we're not likely to change from a
> digital to analogue microphone at runtime for example.
> 

For mic1, it's mic_type can set one of mic_type_mux_map[] at different
scenario.
(1) When mic1 is not used, it should be set as "Idle"
(2) When mic1 is ACC mode and used at normal capture scenario, it should
be set as "ACC"
(3) When mic1 is ACC mode and used at Voice Wakeup scenario, it should
be set as "VOW_ACC"

So mic's type may runtime changed by user scenario. And with different
mic type, setting in mt_mic_bias_*_event() is also different.


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
> > +
> > +	switch (mc->reg) {
> > +	case MT6359_ZCD_CON2:
> > +		regmap_read(priv->regmap, MT6359_ZCD_CON2, &reg);
> > +		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] =
> > +			(reg >> RG_AUDHPLGAIN_SFT) & RG_AUDHPLGAIN_MASK;
> > +		priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] =
> > +			(reg >> RG_AUDHPRGAIN_SFT) & RG_AUDHPRGAIN_MASK;
> > +		break;
> 
> It's unclear what's going on with this custom function.  As far as I can
> see all it's doing is taking a copy of the gain setting for later use by
> rampig functions but since we're immediately writing the set value into
> the register map surely we don't need that as we can just read the value
> back from the register?
> 
Yes, it saves gain setting at register map, and also save at priv->ana_gain[].
When device(headset/receiver/lineout) is enable or disable, it can take 
priv->ana_gain[] for gain ramping instead of reading back from register again.

It is referenced another codec driver(mt6358.c).

> > +static const struct snd_kcontrol_new mt6359_snd_controls[] = {
> > +	/* dl pga gain */
> > +	SOC_SINGLE_EXT_TLV("HeadsetL Volume",
> > +			   MT6359_ZCD_CON2, 0, 0x1E, 0,
> > +			   snd_soc_get_volsw, mt6359_put_volsw,
> > +			   hp_playback_tlv),
> > +	SOC_SINGLE_EXT_TLV("HeadsetR Volume",
> > +			   MT6359_ZCD_CON2, 7, 0x1E, 0,
> > +			   snd_soc_get_volsw, mt6359_put_volsw,
> > +			   hp_playback_tlv),
> > +	SOC_SINGLE_EXT_TLV("LineoutL Volume",
> > +			   MT6359_ZCD_CON1, 0, 0x12, 0,
> > +			   snd_soc_get_volsw, mt6359_put_volsw, playback_tlv),
> > +	SOC_SINGLE_EXT_TLV("LineoutR Volume",
> > +			   MT6359_ZCD_CON1, 7, 0x12, 0,
> > +			   snd_soc_get_volsw, mt6359_put_volsw, playback_tlv),
> 
> These should be stereo controls not pairs of mono controls.
> 
It is more flexible for customization.

For example, customer may use lineout path for stereo speaker amp.
And for specific amp, it need different gain on channel L and channel R.


> > +	/* ul pga gain */
> > +	SOC_SINGLE_EXT_TLV("PGAL Volume",
> > +			   MT6359_AUDENC_ANA_CON0, RG_AUDPREAMPLGAIN_SFT, 4, 0,
> > +			   snd_soc_get_volsw, mt6359_put_volsw, capture_tlv),
> > +	SOC_SINGLE_EXT_TLV("PGAR Volume",
> > +			   MT6359_AUDENC_ANA_CON1, RG_AUDPREAMPRGAIN_SFT, 4, 0,
> > +			   snd_soc_get_volsw, mt6359_put_volsw, capture_tlv),
> 
> Same here.

Each mic may has it's different gain setting in different scenario.

For example, in phone calling scenario, mic1 is main mic and mic2 is
reference mic.
And in video recording scenario, mic1 is reference mic and mic2 is main
mic.

PGAL is for mic1, PGAR is for mic2, PGA3 is for mic3.
We think it is more flexible in different user scenario.

> 
> > +static const char * const lo_in_mux_map[] = {
> > +	"Open", "Playback_L_DAC", "Playback", "Test Mode"
> > +};
> > +
> > +static int lo_in_mux_map_value[] = {
> > +	0x0, 0x1, 0x2, 0x3,
> > +};
> 
> Why use a value enum here, a normal mux should be fine?
> 

Could I modify as follow:

/* LOL MUX */
enum {
	LO_MUX_OPEN = 0,
	LO_MUX_L_DAC,
	LO_MUX_3RD_DAC,
	LO_MUX_TEST_MODE,
	LO_MUX_MASK = 0x3,
};

static const char * const lo_in_mux_map[] = {
	"Open", "Playback_L_DAC", "Playback", "Test Mode"
};

static int lo_in_mux_map_value[] = {
	LO_MUX_OPEN,
	LO_MUX_L_DAC,
	LO_MUX_3RD_DAC,
	LO_MUX_TEST_MODE,
};

> > +static int mt_delay_250_event(struct snd_soc_dapm_widget *w,
> > +			      struct snd_kcontrol *kcontrol,
> > +			      int event)
> > +{
> > +	switch (event) {
> > +	case SND_SOC_DAPM_POST_PMU:
> > +	case SND_SOC_DAPM_PRE_PMD:
> > +		usleep_range(250, 270);
> 
> Why would having a sleep before power down be useful?

It is based on designer's control sequence to add some delay while
PMU/PMD.

For "AUD_CK" power widget:

	SND_SOC_DAPM_SUPPLY_S("AUD_CK", SUPPLY_SEQ_TOP_CK_LAST,
			      MT6359_AUD_TOP_CKPDN_CON0,
			      RG_AUD_CK_PDN_SFT, 1,
			      mt_delay_250_event,
			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),														


> 
> > +static int mt6359_codec_probe(struct snd_soc_component *cmpnt)
> > +{
> > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> > +	int ret;
> > +
> > +	snd_soc_component_init_regmap(cmpnt, priv->regmap);
> > +
> > +	snd_soc_add_component_controls(cmpnt,
> > +				       mt6359_snd_vow_controls,
> > +				       ARRAY_SIZE(mt6359_snd_vow_controls));
> 
> Use the controls member of the component driver struct.
> 

Do you mean that I should merge mt6359_snd_vow_controls into
mt6359_snd_controls?

mt6359_snd_controls is defined at :

static const struct snd_soc_component_driver mt6359_soc_component_driver
= {
	.controls = mt6359_snd_controls,


> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTL] = 8;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_HPOUTR] = 8;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP1] = 3;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP2] = 3;
> > +	priv->ana_gain[AUDIO_ANALOG_VOLUME_MICAMP3] = 3;
> 
> These should be left at the hardware defaults.

These setting can be removed because it is align with register default.
> 
> > +	priv->avdd_reg = devm_regulator_get(priv->dev, "vaud18");
> > +	if (IS_ERR(priv->avdd_reg)) {
> > +		dev_err(priv->dev, "%s(), have no vaud18 supply", __func__);
> > +		return PTR_ERR(priv->avdd_reg);
> > +	}
> 
> The driver should request resources during device model probe rather
> than component probe.
> 

Do you mean that it need be requested at mt6359_platform_driver_probe()
instead of mt6359_codec_probe() ?

> > +	ret = regulator_enable(priv->avdd_reg);
> > +	if (ret)
> > +		return ret;
> > +
> 
> There's nothing to disable this on remove.

Do you mean that I should add a remove function to execute
regulator_disable()?


static struct platform_driver mt6359_platform_driver = {
...
	.probe = mt6359_platform_driver_probe,
	.remove = mt6359_platform_driver_remove,  /* add this */
};


Great thanks for your review again.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
