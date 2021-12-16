Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIoNPP/loTJVneGxJJVZrxNdWQ3mOnt9vCCu1tQpXO4=; b=ImKgMIieS5o6gX
	rewlfwxTqmrjMKpJX2P/YdZADaChN5Gh7BkYvXA6Uj+3eVr2QRKwpQIXh7xwKv70XCMwW5ZWEfsdt
	aV4yReZYKzgQQzlvvw5KMluxAwakco4LpO+AtKpxVFJKUgyUhVzOCo6exd4eUftGrcoKkOy/1CwXB
	dYQb9nrGTZiEu0uHmPFhoto18K6bC3Io/K4BFwZC/wT9rwrroKJORO1/+5fNdsvhvz7u2p0lv0Qvz
	nkIe+H1/IcwZyZAv/ORF1xTsVhwF07W6i8OQDSZx1Gwu2Sf8Q4CaMFNkj03EGkJJ4BEN/5YelEH3x
	AwDJg0n1JrniC5Ky+GJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxhaS-003TTL-2Y; Thu, 16 Dec 2021 03:37:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxhaP-003TSa-5I; Thu, 16 Dec 2021 03:37:42 +0000
X-UUID: 1911202eb1a4451f8a575f55ae93bb8e-20211215
X-UUID: 1911202eb1a4451f8a575f55ae93bb8e-20211215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1463673569; Wed, 15 Dec 2021 20:37:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 19:37:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 11:37:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 11:37:35 +0800
Message-ID: <0b99c46f84c98c56e8fc99b2e103f52f756b5bf9.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: update control for RT5682
 series
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <jiaxin.yu@mediatek.com>, <shumingf@realtek.com>
Date: Thu, 16 Dec 2021 11:37:34 +0800
In-Reply-To: <YbmlT+OSwpGuylsx@google.com>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <YbmlT+OSwpGuylsx@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_193741_242704_5845BF50 
X-CRM114-Status: GOOD (  30.01  )
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

Hi Tzung-Bi,
Thanks for your reviewing,

On Wed, 2021-12-15 at 16:20 +0800, Tzung-Bi Shih wrote:
> On Wed, Dec 15, 2021 at 02:58:34PM +0800, Trevor Wu wrote:
> > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
> > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
> 
> [...]
> > +static int mt8195_set_bias_level_post(struct snd_soc_card *card,
> > +	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level
> > level)
> > +{
> > +	struct snd_soc_component *component = dapm->component;
> > +	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
> > +		snd_soc_card_get_drvdata(card);
> > +	int ret = 0;
> 
> ret doesn't need to be initialized.
> 
Originally, I initailize "ret", because it will be returned at the end
of the function. To be concise, I will return 0 directly and remove the
initialization.

> > +	/*
> > +	 * It's required to control mclk directly in the
> > set_bias_level_post
> > +	 * function for rt5682 and rt5682s codec, or the unexpected pop
> > happens
> > +	 * at the end of playback.
> > +	 */
> > +	if (!component ||
> > +	    (strcmp(component->name, RT5682_DEV0_NAME) &&
> > +	    strcmp(component->name, RT5682S_DEV0_NAME)))
> > +		return 0;
> > +
> > +	if (IS_ERR(priv->i2so1_mclk))
> > +		return 0;
> 
> I doubt if it needs to check priv->i2so1_mclk.  In other words, if
> IS_ERR(priv->i2so1_mclk) is true in _probe, does
> mt8195_set_bias_level_post() get called?
> 

Now, i2so1_mclk is a required property.
I will remove the condition in v2.

> > +	switch (level) {
> > +	case SND_SOC_BIAS_OFF:
> > +		if (!__clk_is_enabled(priv->i2so1_mclk))
> > +			return 0;
> > +
> > +		dev_dbg(card->dev, "Disable i2so1");
> > +		clk_disable_unprepare(priv->i2so1_mclk);
> 
> I would suggest move dev_dbg() later than clk_disable_unprepare()
> which means "Disable i2so1" is done.
> 
OK.

> > +		break;
> > +	case SND_SOC_BIAS_ON:
> > +		dev_dbg(card->dev, "Enable i2so1");
> > +		ret = clk_prepare_enable(priv->i2so1_mclk);
> > +		if (ret) {
> > +			dev_err(card->dev, "Can't enable mclk, err:
> > %d\n", ret);
> 
> The error message can be more specific.  "Cannot enable i2so1" for
> example.
> 
OK.

> > +			return ret;
> > +		}
> 
> Also, I would suggest move dev_dbg() later than
> clk_prepare_enable().  Otherwise, it could fail to prepare or enable
> but still can see "Enable i2so1" message.
> 
Yes, that's correct.
I will move it to a proper position.

> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return ret;
> 
> The function doesn't use any gotos.  To be concise, "return 0;".
OK.

> 
> > @@ -1072,6 +1119,19 @@ static int
> > mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
> >  		return -EINVAL;
> >  	}
> >  
> > +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> > +	if (IS_ERR(priv->i2so1_mclk)) {
> > +		ret = PTR_ERR(priv->i2so1_mclk);
> > +		if (ret == -ENOENT) {
> > +			dev_dbg(&pdev->dev,
> > +				"Failed to get i2so1_mclk, defer
> > probe\n");
> > +			return -EPROBE_DEFER;
> > +		}
> 
> Does devm_clk_get_optional() could make the block more concise?

Even though we use devm_clk_get_optional, we still have to handle the
(-ENOENT) case in probe function. In my opinion, original
implementation could be kept.

> 
> > +
> > +		dev_err(&pdev->dev, "Failed to get i2so1_mclk,
> > err:%d\n", ret);
> 
> If devm_clk_get() is possible to return -EPROBE_DEFER too, use
> dev_err_probe().
Ok.

> 
> > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> 
> [...]
> > +static int mt8195_set_bias_level_post(struct snd_soc_card *card,
> > +	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level
> > level)
> > +{
> > +	struct snd_soc_component *component = dapm->component;
> > +	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
> > +		snd_soc_card_get_drvdata(card);
> > +	int ret = 0;
> 
> Ditto, see comments above.
> 
OK.

> > +
> > +	/*
> > +	 * It's required to control mclk directly in the
> > set_bias_level_post
> > +	 * function for rt5682 and rt5682s codec, or the unexpected pop
> > happens
> > +	 * at the end of playback.
> > +	 */
> > +	if (!component ||
> > +	    (strcmp(component->name, RT5682_DEV0_NAME) &&
> > +	    strcmp(component->name, RT5682S_DEV0_NAME)))
> > +		return 0;
> > +
> > +	if (IS_ERR(priv->i2so1_mclk))
> > +		return 0;
> 
> Ditto, see comments above.
> 
OK.

> > +
> > +	switch (level) {
> > +	case SND_SOC_BIAS_OFF:
> > +		if (!__clk_is_enabled(priv->i2so1_mclk))
> > +			return 0;
> > +
> > +		dev_dbg(card->dev, "Disable i2so1");
> > +		clk_disable_unprepare(priv->i2so1_mclk);
> > +		break;
> > +	case SND_SOC_BIAS_ON:
> > +		dev_dbg(card->dev, "Enable i2so1");
> > +		ret = clk_prepare_enable(priv->i2so1_mclk);
> > +		if (ret) {
> > +			dev_err(card->dev, "Can't enable mclk, err:
> > %d\n", ret);
> > +			return ret;
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> 
> Ditto, see comments above for the block.
> 
OK.

> > +
> > +	return ret;
> 
> Ditto, see comments above.
> 
OK.

> > @@ -1285,6 +1326,19 @@ static int
> > mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
> >  		return -EINVAL;
> >  	}
> >  
> > +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> > +	if (IS_ERR(priv->i2so1_mclk)) {
> > +		ret = PTR_ERR(priv->i2so1_mclk);
> > +		if (ret == -ENOENT) {
> > +			dev_dbg(&pdev->dev,
> > +				"Failed to get i2so1_mclk, defer
> > probe\n");
> > +			return -EPROBE_DEFER;
> > +		}
> > +
> > +		dev_err(&pdev->dev, "Failed to get i2so1_mclk,
> > err:%d\n", ret);
> > +		return ret;
> > +	}
> 
> Ditto, see comments above for the block.
OK.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
