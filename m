Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48331C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 06:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342AA206F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 06:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j8gcrSnM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qQCIngbE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342AA206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxrKmufdsYiP/425l4WySAlhIHScxcvYR930uX3JrEo=; b=j8gcrSnMhk8SYp
	G5s+HNe9P7oeB/23Sv9eHjd7JL93nR/S727a+wYt22plHhv5c7j/ym60aGab4iT6X5XihFlhL6v2N
	VuWKyQ8wIRsxaozjeiDBsHx1iDeHRxI52uKeTOgyg40UlnZsc/knf/Qnwu9PE+wbsh3k+eMGF4pQq
	u3tASNdo7agZGmFMh45poxrCF7ofjOIrXq2aT/BXqN5xcgKF6FKIKyenqgUO65d9sSi807S+LcS+r
	2WFaC1dsUjs19ePnniwq2RcQrIS7tR0HCg/WvMj0GCNby5fGBot34X9BsHTTNiESC/JQqHAF/3xdT
	psXXHLMteKCUxx7NBgng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCHZ8-0000a7-Oi; Thu, 12 Mar 2020 06:43:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCHZ5-0000ZX-3w
 for linux-mediatek@lists.infradead.org; Thu, 12 Mar 2020 06:43:32 +0000
X-UUID: acb318589ef94900a4756dc6963ce96a-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rinSa8EsJcmludQxreBMnGxS1wahGrKb0fmkSN6e91s=; 
 b=qQCIngbEP27t/cdKWvdAfYYbGQIumJZv7qqqvK2Uba08IllSFfiq7p0w0Vg8KiIOW+5JJOwnY9CpEIKuSc6lGXnjW1eKBsIQ/FE33sqZ9hktWoYwuQCvbRnqn616XndYZrOU6LDrLFDKQrRGs9sYRpcnfyH6HkvNbJNG8DsFvE8=;
X-UUID: acb318589ef94900a4756dc6963ce96a-20200311
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 49166336; Wed, 11 Mar 2020 22:43:10 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 23:43:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Mar 2020 14:42:09 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Mar 2020 14:43:12 +0800
Message-ID: <1583995387.19248.93.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] ASoC: codec: mediatek: add mt6359 codec driver
From: Eason Yen <eason.yen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 12 Mar 2020 14:43:07 +0800
In-Reply-To: <20200311121232.GB5411@sirena.org.uk>
References: <1583465622-16628-1-git-send-email-eason.yen@mediatek.com>
 <1583465622-16628-3-git-send-email-eason.yen@mediatek.com>
 <20200309131346.GF4101@sirena.org.uk>
 <1583918544.19248.69.camel@mtkswgap22>
 <20200311121232.GB5411@sirena.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_234331_175652_0AFA3E09 
X-CRM114-Status: GOOD (  34.82  )
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

	Thanks for your viewing.

On Wed, 2020-03-11 at 12:12 +0000, Mark Brown wrote:
> On Wed, Mar 11, 2020 at 05:22:24PM +0800, Eason Yen wrote:
> > On Mon, 2020-03-09 at 13:13 +0000, Mark Brown wrote:
> > > On Fri, Mar 06, 2020 at 11:33:42AM +0800, Eason Yen wrote:
> 
> > > This looks like things that might be better exposed via pinctrl and
> > > gpiolib for board specific configuration - what exactly are these GPIOs
> > > doing?  A lot of this code looks like it might be board specific.
> 
> > MT6359 has some gpios (pad_aud_*) for downlink/uplink.
> > And these pins is connected between AP part and PMIC part.
> > (1) For AP part, user need to set gpio pinmux for these gpio using DT.
> > (2) For pmic part, gpio are configured at codec driver by default.
> 
> > For PMIC part, user need to set in these register :
> > GPIO_MODE1/GPIO_MODE2/GPIO_MODE3
> 
> > The following functions are used to set:
> > - playback_gpio_set/playback_gpio_reset
> > - capture_gpio_set/capture_gpio_reset
> > - vow_gpio_set/vow_gpio_reset
> 
> This sounds like it should be handled at the machine driver level, it's
> possible some system integrator will wire things up differently.
> 

machine driver will set default at booting stage to execute
mt6359_mtkaif_calibration_enable and mt6359_mtkaif_calibration_disable.

And at runtime stage, it is triggered by mt_dl_gpio_event and
mt_ul_gpio_event while playback or capture.


> > > > +/* use only when not govern by DAPM */
> > > > +static int mt6359_set_dcxo(struct mt6359_priv *priv, bool enable)
> > > > +{
> 
> > > Why might this sometimes be controlled outside of DAPM?
> 
> > mt6359_set_dcxo is used at mt6359_mtkaif_calibration_enable/disable.
> 
> > mtkaif_calibration process needs be completed at booting stage once.
> > And it has a specific control sequence provided by codec designer.
> > So it need to be controlled outside of DAPM.
> 
> OK, this should explicitly say that this is for use during calibration
> then.
> 
> > > > +static const char *const mic_type_mux_map[] = {
> > > > +	"Idle",
> > > > +	"ACC",
> > > > +	"DMIC",
> > > > +	"DCC",
> > > > +	"DCC_ECM_DIFF",
> > > > +	"DCC_ECM_SINGLE",
> > > > +	"VOW_ACC",
> > > > +	"VOW_DMIC",
> > > > +	"VOW_DMIC_LP",
> > > > +	"VOW_DCC",
> > > > +	"VOW_DCC_ECM_DIFF",
> > > > +	"VOW_DCC_ECM_SINGLE"
> > > > +};
> 
> > > This looks like something that should be being set by DT or other
> > > platform data rather than at runtime - we're not likely to change from a
> > > digital to analogue microphone at runtime for example.
> 
> > For mic1, it's mic_type can set one of mic_type_mux_map[] at different
> > scenario.
> > (1) When mic1 is not used, it should be set as "Idle"
> > (2) When mic1 is ACC mode and used at normal capture scenario, it should
> > be set as "ACC"
> > (3) When mic1 is ACC mode and used at Voice Wakeup scenario, it should
> > be set as "VOW_ACC"
> 
> That still doesn't mean you should have control over things like if the
> microphone is single ended or differential at runtime.  This at least
> needs to be a higher level control, it should be integrated with both
> board data and DAPM.  You can at least select idle mode with DAPM, and
> you may be able to select voice wakeup that way too (by looking at where
> things are routed).
> 

OK. So it is better to fix mic_type (ACC/DMIC/DCC/DCC_*) at init stage
because it will not be changed at runtime.

And use another dpam mux or kcontrol to enable/disable vow for low power
scenario.

Is it right?

> > > > +	SOC_SINGLE_EXT_TLV("LineoutR Volume",
> > > > +			   MT6359_ZCD_CON1, 7, 0x12, 0,
> > > > +			   snd_soc_get_volsw, mt6359_put_volsw, playback_tlv),
> 
> > > These should be stereo controls not pairs of mono controls.
> 
> > It is more flexible for customization.
> 
> > For example, customer may use lineout path for stereo speaker amp.
> > And for specific amp, it need different gain on channel L and channel R.
> 
> You can set the gains of stereo pairs independently, that's not a
> problem.
> 
> > > > +static const char * const lo_in_mux_map[] = {
> > > > +	"Open", "Playback_L_DAC", "Playback", "Test Mode"
> > > > +};
> > > > +
> > > > +static int lo_in_mux_map_value[] = {
> > > > +	0x0, 0x1, 0x2, 0x3,
> > > > +};
> > > 
> > > Why use a value enum here, a normal mux should be fine?
> > > 
> 
> > Could I modify as follow:
> 
> > /* LOL MUX */
> > enum {
> > 	LO_MUX_OPEN = 0,
> > 	LO_MUX_L_DAC,
> > 	LO_MUX_3RD_DAC,
> > 	LO_MUX_TEST_MODE,
> > 	LO_MUX_MASK = 0x3,
> > };
> 
> > static const char * const lo_in_mux_map[] = {
> > 	"Open", "Playback_L_DAC", "Playback", "Test Mode"
> > };
> 
> > static int lo_in_mux_map_value[] = {
> > 	LO_MUX_OPEN,
> > 	LO_MUX_L_DAC,
> > 	LO_MUX_3RD_DAC,
> > 	LO_MUX_TEST_MODE,
> > };
> 
> Why bother with the value mapping at all?
> 

ok, I will refine it as follow. is it ok?

And remove 
/* remove it
static int lo_in_mux_map_value[] = {
	0x0, 0x1, 0x2, 0x3,
};
*/

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

static SOC_ENUM_SINGLE_DECL(lo_in_mux_map_enum,
			    SND_SOC_NOPM, 0, lo_in_mux_map);

static const struct snd_kcontrol_new lo_in_mux_control =
	SOC_DAPM_ENUM("LO Select", lo_in_mux_map_enum);


The refine will apply on RCV MUX and HP MUX ,too.


> > > > +static int mt_delay_250_event(struct snd_soc_dapm_widget *w,
> > > > +			      struct snd_kcontrol *kcontrol,
> > > > +			      int event)
> > > > +{
> > > > +	switch (event) {
> > > > +	case SND_SOC_DAPM_POST_PMU:
> > > > +	case SND_SOC_DAPM_PRE_PMD:
> > > > +		usleep_range(250, 270);
> 
> > > Why would having a sleep before power down be useful?
> 
> > It is based on designer's control sequence to add some delay while
> > PMU/PMD.
> 
> But how does the designer know when the sequence starts?  Don't they
> mean to have a delay *after* power down?
> 

For PMU, designer think 
"AUD_CK" --> wait at least 250ms --> "AUDIF_CK" --> next ...

For PMD, designer think 
"AUDIF_CK" --> wait at least 250ms --> "AUD_CK" --> next ...

	SND_SOC_DAPM_SUPPLY_S("ZCD13M_CK", SUPPLY_SEQ_TOP_CK,
			      MT6359_AUD_TOP_CKPDN_CON0,
			      RG_ZCD13M_CK_PDN_SFT, 1, NULL, 0),

	SND_SOC_DAPM_SUPPLY_S("AUD_CK", SUPPLY_SEQ_TOP_CK_LAST,
			      MT6359_AUD_TOP_CKPDN_CON0,
			      RG_AUD_CK_PDN_SFT, 1,
			      mt_delay_250_event,
			      SND_SOC_DAPM_POST_PMU | 	SND_SOC_DAPM_PRE_PMD),

	SND_SOC_DAPM_SUPPLY_S("AUDIF_CK", SUPPLY_SEQ_TOP_CK,
			      MT6359_AUD_TOP_CKPDN_CON0,
			      RG_AUDIF_CK_PDN_SFT, 1, NULL, 0),

So I add a mt_delay_250_event while "AUD_CK" POST_PMU and PRE_PMD.


> > > > +static int mt6359_codec_probe(struct snd_soc_component *cmpnt)
> > > > +{
> > > > +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> > > > +	int ret;
> > > > +
> > > > +	snd_soc_component_init_regmap(cmpnt, priv->regmap);
> > > > +
> > > > +	snd_soc_add_component_controls(cmpnt,
> > > > +				       mt6359_snd_vow_controls,
> > > > +				       ARRAY_SIZE(mt6359_snd_vow_controls));
> 
> > > Use the controls member of the component driver struct.
> 
> > Do you mean that I should merge mt6359_snd_vow_controls into
> > mt6359_snd_controls?
> 
> Yes, you're unconditionally registering these so there's no sense in
> splitting them.
> 
> > > > +	priv->avdd_reg = devm_regulator_get(priv->dev, "vaud18");
> > > > +	if (IS_ERR(priv->avdd_reg)) {
> > > > +		dev_err(priv->dev, "%s(), have no vaud18 supply", __func__);
> > > > +		return PTR_ERR(priv->avdd_reg);
> > > > +	}
> 
> > > The driver should request resources during device model probe rather
> > > than component probe.
> 
> > Do you mean that it need be requested at mt6359_platform_driver_probe()
> > instead of mt6359_codec_probe() ?
> 
> Yes.
> 
> > > > +	ret = regulator_enable(priv->avdd_reg);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> 
> > > There's nothing to disable this on remove.
> 
> > Do you mean that I should add a remove function to execute
> > regulator_disable()?
> 
> Yes.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
