Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85246C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 17:08:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49038238EE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 17:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49038238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XTJMu7gCiF7gSuLH7U+9LTTh5P/6CjbEPbP7so4rz8c=; b=MVqs7wpg8a/xjH6YMtGsrIqAo
	8Ga13yIeD4t3mGWrlhTccJ7svls19PrPj3h410JGm1kiCj3NGdJzMDn3TWn+Nz61rT/yB+JV99h4i
	tTyLyp+kYh/rkjnd3MZaWyqEBR+HFmIG6aOlDSwUPSdUbYC8fnuBmv8OjUwo0scz84W7sACkkldeu
	M0AR0IJ/HpPSHq/3wS6tK9hQx7o3M2YMZHucwvJ6MO0iaWs+fsMKA0BdjdPy/mN5vK2f8vQUPEM64
	AHNd8GH94vHX0pgO6SjKwLTrYhIjOAGBAR294UuGWq14ZHXp4kWQBo0ZZpjAROG+WwbO4omVTpbiz
	0FbOLXTqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SaG-0000Rg-34; Fri, 15 Jan 2021 17:08:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Sa4-0000NJ-I9; Fri, 15 Jan 2021 17:08:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69460222B3;
 Fri, 15 Jan 2021 17:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610730491;
 bh=TTxGRW3tiG7LwSjTKZStrgp68+J+/ZsXQqui4SyalIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gj5MA1QhIl6mv38/JorSQaBuTdgK7JhRQ8W4zqkwTY2LHofctJYuQC/F7ATNbm3q7
 J4z7W/PZKj4xzlJ7DnKO8070MiSiVtC6o/vJbUPNn42rfa3iEJq5ZhcIum2t5RiRqG
 WZ0J28wSu6CQtFLrZnKxueolRqXU0WBQYtqzXc/wDVQuftGXwKsQlG2bttiSIik1UV
 DoKyndUiOV9u7prRSzT6D/ahQ3wRtTTkFaQutL1lc/URgSVKjkkm3AKdgsKON3GzpS
 uf2xyFYGeD06X3z0195kB3GOim7nUK8uRoXRyHLuJRGVVT7cCWcG+GtEI1YnYd6Anr
 GZfk7L3DWyYGg==
Date: Fri, 15 Jan 2021 17:07:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Argus Lin <argus.lin@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt6359: add MT6359 accdet driver
Message-ID: <20210115170737.GE4384@sirena.org.uk>
References: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
 <1609935546-11722-3-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1609935546-11722-3-git-send-email-argus.lin@mediatek.com>
X-Cookie: Debug is human, de-fix divine.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_120812_843338_D92EDB4D 
X-CRM114-Status: GOOD (  36.61  )
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
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Chipeng Chang <chipeng.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Dan Murphy <dmurphy@ti.com>,
 Shuming Fan <shumingf@realtek.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Jack Yu <jack.yu@realtek.com>,
 "Shane.Chien" <shane.chien@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4310001415266292160=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4310001415266292160==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline


--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 06, 2021 at 08:19:06PM +0800, Argus Lin wrote:
> MT6359 audio codec support accessory detect features, adds MT6359
> accdet driver to support plug detection and key detection.

> ---
>  sound/soc/codecs/Kconfig         |    7 +
>  sound/soc/codecs/Makefile        |    2 +
>  sound/soc/codecs/mt6359-accdet.c | 1951 ++++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/mt6359-accdet.h |  136 +++
>  sound/soc/codecs/mt6359.h        | 1863 +++++++++++++++++++++++++++++++++---

This driver is *huge*.  Looking through the code it feels like there's a
lot of things that are written with mostly duplicated code that differs
only in data so you could shrink things down a lot by refactoring things
to have one copy of the code and pass different data into it.

>  	  Enable support for the platform which uses MT6359 as
>  	  external codec device.
> +config SND_SOC_MT6359_ACCDET

Missing blank line here.

> +++ b/sound/soc/codecs/mt6359-accdet.c
> @@ -0,0 +1,1951 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 MediaTek Inc.

Please make the entire comment a C++ one so things look more
intentional.

> +#include "mt6359-accdet.h"
> +#include "mt6359.h"
> +/* grobal variable definitions */

Spelling mistake and you need more blank lines here.

> +#define REGISTER_VAL(x)	((x) - 1)
> +#define HAS_CAP(_c, _x)	\
> +	({typeof(_c)c = (_c); \
> +	typeof(_x)x = (_x); \
> +	(((c) & (x)) == (x)); })

These need namepsacing.

> +static struct mt63xx_accdet_data *accdet;
> +
> +static struct head_dts_data accdet_dts;
> +struct pwm_deb_settings *cust_pwm_deb;

You'd need a *very* good reason to be using global data rather than
storing anything in the device's driver data like most drivers.  There's
extensive use of global data here, and lots of raw pr_ prints rather
than dev_ prints as well - this doesn't look like how a Linux driver is
supposed to be written.

> +
> +const struct of_device_id mt6359_accdet_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt6359-accdet",
> +		.data = &mt6359_accdet,

Given that this is specific to a particular PMIC why does this need a
compatible string?

> +/* global function declaration */
> +
> +static u64 mt6359_accdet_get_current_time(void)
> +{
> +	return sched_clock();
> +}

It is probably best to remove this wrapper.

> +static bool mt6359_accdet_timeout_ns(u64 start_time_ns, u64 timeout_time_ns)
> +{
> +	u64 cur_time = 0;
> +	u64 elapse_time = 0;
> +
> +	/* get current tick, ns */
> +	cur_time = mt6359_accdet_get_current_time();
> +	if (cur_time < start_time_ns) {
> +		start_time_ns = cur_time;
> +		/* 400us */
> +		timeout_time_ns = 400 * 1000;
> +	}
> +	elapse_time = cur_time - start_time_ns;
> +
> +	/* check if timeout */
> +	if (timeout_time_ns <= elapse_time)
> +		return false;
> +
> +	return true;
> +}

There must be a generic implementation of this already surely?

> +static unsigned int check_key(unsigned int v)
> +{

This looks a lot like open coding of the functionality of the extcon
adc_jack functionality.

> +static void send_key_event(unsigned int keycode, unsigned int flag)
> +{
> +	int report = 0;
> +
> +	switch (keycode) {
> +	case DW_KEY:
> +		if (flag != 0)
> +			report = SND_JACK_BTN_1;

What does flag mean?  At the very least it needs renaming.

> +static void send_status_event(unsigned int cable_type, unsigned int status)
> +{
> +	int report = 0;

This is one of those places that looks like it could be code with
different data passed in.

> +
> +	switch (cable_type) {
> +	case HEADSET_NO_MIC:
> +		if (status)
> +			report = SND_JACK_HEADPHONE;
> +		else
> +			report = 0;
> +		snd_soc_jack_report(&accdet->jack, report, SND_JACK_HEADPHONE);
> +		/* when plug 4-pole out, if both AB=3 AB=0 happen,3-pole plug
> +		 * in will be incorrectly reported, then 3-pole plug-out is
> +		 * reported,if no mantory 4-pole plug-out, icon would be
> +		 * visible.
> +		 */
> +		if (status == 0) {
> +			report = 0;
> +			snd_soc_jack_report(&accdet->jack, report, SND_JACK_MICROPHONE);
> +		}
> +		pr_info("accdet HEADPHONE(3-pole) %s\n",
> +			status ? "PlugIn" : "PlugOut");

You shouldn't be spamming the logs for normal events like this.

> +	regmap_read(accdet->regmap, ACCDET_IRQ_ADDR, &val);
> +	while (val & ACCDET_IRQ_MASK_SFT &&
> +	       mt6359_accdet_timeout_ns(cur_time, ACCDET_TIME_OUT))
> +		;

This is open coding regmap_read_poll_timeout(), this pattern is repeated
in several places.

> +static inline void clear_accdet_eint(unsigned int eintid)
> +{
> +	if ((eintid & PMIC_EINT0) == PMIC_EINT0) {

The == part is redundant here, and again this is another place where it
feels like there's duplicated code that should be using data.  All this
interrupt handling code is really extremely difficult to follow, there's
*lots* of functions all open coding many individual register bits
sometimes redundantly and it's very hard to follow what it's supposed to
be doing.  I can't help but think that in addition to making things data
driven writing more linear code without these abstraction layers would
help a lot with comprehensibility.

> +static irqreturn_t mtk_accdet_irq_handler_thread(int irq, void *data)
> +{
> +	accdet_irq_handle();
> +
> +	return IRQ_HANDLED;
> +}

Why does this wrapper function exist - AFAICT it's just introducing a
bug given that the called function is able to detect spurious interrupts
but this unconditionally reports IRQ_HANDLED.

> +int mt6359_accdet_init(struct snd_soc_component *component,
> +		       struct snd_soc_card *card)
> +{
> +	int ret = 0;
> +	struct mt63xx_accdet_data *priv =
> +			snd_soc_card_get_drvdata(component->card);

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mt6359_accdet_init);

This is a weird interface, what's going on here?

> +int mt6359_accdet_set_drvdata(struct snd_soc_card *card)
> +{
> +	snd_soc_card_set_drvdata(card, accdet);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt6359_accdet_set_drvdata);

This is setting off *massive* alarm bells in that it seems to try to
claim the card level driver data for this specific driver, again what's
going on here?

> +module_init(mt6359_accdet_soc_init);
> +module_exit(mt6359_accdet_soc_exit);

module_platform_driver()

--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmABy9gACgkQJNaLcl1U
h9DY/gf/fHBtIfQbXuCCr1+QvKa57mk9zIvrlJKMEtVByp+AvZkXaTLoyMIg1JcO
4rAyQrhsqr3HcLdUVrzQqljjDGREnMvwZOUB9EeEnREwj+vtYm/ogs4ccXmpmCES
tIhNW4JpGfVxCVhM0XfUz8s86Y7mo4bv0pDy6aZMop4p2wG4lZvOcdXDdqVFXVyG
YkT3A7fNgJ5Hi7K3BGViNNLEvCjkXt6KmFjNTPpyc4zUXoOJNkqHv5gUn/NhW9Lv
BYOuUVlwjlJC4SANqXz/5WYI0aux1tFpgnkASGWV1K7TyFyjzEJklB1vmGHE/e+6
WDE6B01vYILmCPElPN8uHzwXEYzv6Q==
=azMJ
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--


--===============4310001415266292160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4310001415266292160==--

