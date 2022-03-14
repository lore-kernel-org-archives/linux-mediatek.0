Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 03:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwCnu2ScxgA2PF4A+X9gEAHFscj0+fxnyFqXI/pDt+E=; b=1xDzuWhCI03arN
	NlWqCiE5HoGCycF4XNhkmVgrqp5eCNtGxu76GkgNnWzWzyYkGoBpOrm3ronv2OOp/LPJa4h5Ck6jx
	h/8ay8RbMESHQeLmRDl2mdMTzrFyYMc9ao1uKR7/fQhF95iOA41fUxT2IUTxZNGOJzhk03+U1RdAK
	LCD6FZ3UMGT7vR8/QFOCpWhaooJdRESIL4NYLFw1hcj4bIsXhQj5mln4BX9XxgvQ7sO7aX2JPCQQT
	OkXxrZRV60yn/+5CRK7JdwJ8Qq94iTzFSNeW4QxkODjRB8zhqGNP4KPLAWSpAn7frXcOz/QCTonbe
	xPFqvvKLhcvfkQy+e22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTbCZ-003iBu-NN; Mon, 14 Mar 2022 03:16:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTbCN-003iAz-Qd; Mon, 14 Mar 2022 03:16:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F62D60F7C;
 Mon, 14 Mar 2022 03:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70CC340E9;
 Mon, 14 Mar 2022 03:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647227801;
 bh=pqkDNAeAEYNvG49k/Hx0tByN0ecvsp2DdmQ6if+3LdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K6stHjXByT/LIIEPIIN7gV5+ue1kVhi02UDo/UKc/m29vF0fX3xut4Yg4viAqkjQ6
 1xe5srH6/IkKVbXiIHrX2MrjP8vuOu03F5X+2fbduJUhQ7Fnk1h9me4H3aqfbCngOp
 dxsGOek5ppdJBELp7JOkg0DA8kH+UwxOsJ9fdy27kGaHlG8nEHE8jQIV+W4X8tUxOg
 azJ/56yD5EYylptV+CI2SzgAZhq4poAfP/p1mNf5P3Vk5pqFwi56V3pfdYEm4pX+aN
 Y1vEaMqAca9yOZE7ajA25CxUIDKZDeJH6MVkyab2wvikK3vpXfRqig5ckIY6hTAcJj
 fR4pOtOJOq5Qw==
Date: Mon, 14 Mar 2022 11:16:36 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 kernel test robot <lkp@intel.com>
Subject: Re: [v4 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <Yi6zlIvA6t+yEbza@google.com>
References: <20220311162213.6942-1-jiaxin.yu@mediatek.com>
 <20220311162213.6942-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311162213.6942-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_201643_991480_2B2E2E2C 
X-CRM114-Status: GOOD (  21.16  )
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

On Sat, Mar 12, 2022 at 12:22:13AM +0800, Jiaxin Yu wrote:
> Supports machines with rt1015p and rt5682s. Uses new proposed compatible
> string "mt8192_mt6359_rt1015p_rt5682s". Using define to simplifies card
> name and compatible name, and uses the snd_soc_of_get_dai_link_codecs()
> to complete the configuration of dai_link's codecs.

Rephrase the paragraph and consider to use imperative mood as [1] suggests.

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

The patch includes multiple changes.  Could you further separate it into:
1. Refactor for I2S3 DAI links for original amps.
2. Refactor for I2S8 and I2S9 DAI links for original headset codec RT5682.
3. Support mt8192_mt6359_rt1015p_rt5682s for RT5682S.

> Reported-by: kernel test robot <lkp@intel.com>

The tag can be dropped as "Supports machines with rt1015p and rt5682s" is not
an idea from the bot.  Put it in change logs if you would like it to be a
record.

> +static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
> +					  struct snd_soc_dai_link *link,
> +					  struct device_node *node,
> +					  char *link_name)
> +{
> +	int ret;
> +
> +	if (node && strcmp(link->name, link_name) == 0) {
> +		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
> +		if (ret < 0) {
> +			dev_err(card->dev, "get dai link codecs fail\n");

How about using dev_err_probe()?  As the callers also report errors if
mt8192_mt6359_card_set_be_link() fails, the log can be dropped.

>  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card;
> -	struct device_node *platform_node, *hdmi_codec;
> +	struct device_node *platform_node, *hdmi_codec, *headset_codec, *speaker_codec;
>  	int ret, i;
>  	struct snd_soc_dai_link *dai_link;
>  	struct mt8192_mt6359_priv *priv;
> +	struct device *dev;
[...]
> +	dev = &pdev->dev;

I don't think it could help too much unless it was struggling for code
columns.  Please consider to drop the variable or you should s/&pdev->dev/dev/g
for the function.

> +	speaker_codec = of_get_child_by_name(dev->of_node, "mediatek,speaker-codec");
> +	if (!speaker_codec) {
> +		ret = -EINVAL;
> +		dev_err_probe(dev, ret, "Property 'speaker_codec' missing or invalid\n");
> +		goto err_speaker_codec;
> +	}
> +
> +	headset_codec = of_get_child_by_name(dev->of_node, "mediatek,headset-codec");
> +	if (!headset_codec) {
> +		ret = -EINVAL;
> +		dev_err_probe(dev, ret, "Property 'headset_codec' missing or invalid\n");
> +		goto err_headset_codec;
> +	}

Are these new DT bindings?  They are not in
Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml.

> +		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",

As mentioned above, I don't think `dev` could help too much.  However, to be
consistent, either drop the `dev` variable or use `dev` here.

> +		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S8");
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
> +				      dai_link->name);

Ditto.

> +		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S9");
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
> +				      dai_link->name);

Ditto.

>  	ret = mt8192_afe_gpio_init(&pdev->dev);
>  	if (ret) {
> -		dev_err(&pdev->dev, "init gpio error %d\n", ret);
> -		goto put_hdmi_codec;
> +		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);

Ditto.

>  	ret = devm_snd_soc_register_card(&pdev->dev, card);
> -
> -put_hdmi_codec:
> +	if (ret)
> +		dev_err_probe(&pdev->dev, ret,

Ditto.

> +err_probe:
> +	of_node_put(headset_codec);
> +err_headset_codec:
> +	of_node_put(speaker_codec);
> +err_speaker_codec:
>  	of_node_put(hdmi_codec);
> -put_platform_node:
> +err_hdmi_codec:
>  	of_node_put(platform_node);
> +err_platform_node:
> +

The new line can be dropped.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
