Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43734C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LRg6xX7drNEX807kG+D2kJbFHuidjdLCDLXLV0tEwQ=; b=IHep3lTUoI/HB9
	IR//ekBlDfbKiDdO0PDIFSqbU7ak8BjWOtQGZj9OUtB2YyNQ5AtLe/wGpaGnG441xv5Pkq7rZq300
	o1zwD4y/70dS6+nwefMLPM2Jq+WvyLznIpsiqXCVX+8k89vh050hanXAWKsBsGJ3uY436EC7dTqyG
	MNj4YktTG3OFrVj7tAgEkF9eGkWK0428hOAO3BmmGP8xakc6XyV2HlihX0gkqIwVpLmBC/sZR4G8E
	xOelmUkIWVTfNqzuK5VDk1eTfWvqpe2Ly2lVG1nnqtDGkkGfEF+s2Agh83MW/HJ66Eno+/I1CxUo7
	3T+kNyYH3frimWFGtoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZaAr-00GXlI-4s; Wed, 30 Mar 2022 15:23:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZa7g-00GWJS-P3; Wed, 30 Mar 2022 15:20:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 112231F45044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648653635;
 bh=62VOmuT6t0x2pqTpy3t9E42OjHWjGuZ/ZV9Yo+IzaOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dw1SxPbk+AGfAp47BCkrkLPByFHQ0a5eeUwM5pxBFtLh/cUDa98YhrETr8hDjVNU+
 OwIqaSyxottFSq7HlSZbfNmN6j9YP26sIvygcl7t1Ch005K41XymeHYhNcRBQuGkeB
 X+V2UOdoj1Y9M2NusjzWJ8qyfI325cEkv+fgg4oR+wExH1OPn6fPy68+HRxnRBUmZA
 HK+TgH0Fjcy1Z04U351GLD5OqfPqokDCmj0WLck8JzdE4aefM2+gDDj0ATAsYwrDkL
 UJp5mPrOgtge7jmP2Fy+L9pBgUVMIofsLwHzgM47GBilcBA9KQTi7JAx+hRDW6O0oF
 UzEWkoXAAV6LQ==
Date: Wed, 30 Mar 2022 11:20:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <20220330152026.6nuigsldx46lue44@notapiano>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_082037_145660_CC481B1D 
X-CRM114-Status: GOOD (  39.18  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 30, 2022 at 10:33:06AM +0800, Jiaxin Yu wrote:
> On Tue, 2022-03-29 at 18:30 -0400, N=EDcolas F. R. A. Prado wrote:
> > Hi Jiaxin,
> > =

> > On Thu, Mar 24, 2022 at 02:45:09PM +0800, Jiaxin Yu wrote:
> > > MT8192 platform will use rt1015 or rt105p codec, so through the
> > > snd_soc_of_get_dai_link_codecs() to complete the configuration
> > > of dai_link's codecs.
> > > =

> > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > ---
> > >  .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 108 ++++++++++--
> > > ------
> > >  1 file changed, 59 insertions(+), 49 deletions(-)
> > > =

> > > diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-
> > > rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> > > index ee91569c0911..837c2ccd5b3d 100644
> > > --- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> > > +++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> > > @@ -604,17 +604,9 @@ SND_SOC_DAILINK_DEFS(i2s2,
> > >  		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
> > >  		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > >  =

> > > -SND_SOC_DAILINK_DEFS(i2s3_rt1015,
> > > +SND_SOC_DAILINK_DEFS(i2s3,
> > >  		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
> > > -		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
> > > -						   RT1015_CODEC_DAI),
> > > -					COMP_CODEC(RT1015_DEV1_NAME,
> > > -						   RT1015_CODEC_DAI)),
> > > -		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > > -
> > > -SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
> > > -		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
> > > -		     DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi")),
> > > +		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
> > >  		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > >  =

> > >  SND_SOC_DAILINK_DEFS(i2s5,
> > > @@ -929,6 +921,7 @@ static struct snd_soc_dai_link
> > > mt8192_mt6359_dai_links[] =3D {
> > >  		.dpcm_playback =3D 1,
> > >  		.ignore_suspend =3D 1,
> > >  		.be_hw_params_fixup =3D mt8192_i2s_hw_params_fixup,
> > > +		SND_SOC_DAILINK_REG(i2s3),
> > >  	},
> > >  	{
> > >  		.name =3D "I2S5",
> > > @@ -1100,55 +1093,64 @@ static struct snd_soc_card
> > > mt8192_mt6359_rt1015p_rt5682_card =3D {
> > >  	.num_dapm_routes =3D
> > > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
> > >  };
> > >  =

> > > +static int mt8192_mt6359_card_set_be_link(struct snd_soc_card
> > > *card,
> > > +					  struct snd_soc_dai_link
> > > *link,
> > > +					  struct device_node *node,
> > > +					  char *link_name)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (node && strcmp(link->name, link_name) =3D=3D 0) {
> > > +		ret =3D snd_soc_of_get_dai_link_codecs(card->dev, node,
> > > link);
> > > +		if (ret < 0) {
> > > +			dev_err_probe(card->dev, ret, "get dai link
> > > codecs fail\n");
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
> > >  {
> > >  	struct snd_soc_card *card;
> > > -	struct device_node *platform_node, *hdmi_codec;
> > > +	struct device_node *platform_node, *hdmi_codec, *speaker_codec;
> > >  	int ret, i;
> > >  	struct snd_soc_dai_link *dai_link;
> > >  	struct mt8192_mt6359_priv *priv;
> > >  =

> > > -	platform_node =3D of_parse_phandle(pdev->dev.of_node,
> > > -					 "mediatek,platform", 0);
> > > -	if (!platform_node) {
> > > -		dev_err(&pdev->dev, "Property 'platform' missing or
> > > invalid\n");
> > > +	card =3D (struct snd_soc_card *)of_device_get_match_data(&pdev-
> > > >dev);
> > > +	if (!card)
> > >  		return -EINVAL;
> > > +	card->dev =3D &pdev->dev;
> > > +
> > > +	platform_node =3D of_parse_phandle(pdev->dev.of_node,
> > > "mediatek,platform", 0);
> > > +	if (!platform_node) {
> > > +		ret =3D -EINVAL;
> > > +		dev_err_probe(&pdev->dev, ret, "Property 'platform'
> > > missing or invalid\n");
> > > +		goto err_platform_node;
> > >  	}
> > >  =

> > > -	card =3D (struct snd_soc_card *)of_device_get_match_data(&pdev-
> > > >dev);
> > > -	if (!card) {
> > > +	hdmi_codec =3D of_parse_phandle(pdev->dev.of_node,
> > > "mediatek,hdmi-codec", 0);
> > > +	if (!hdmi_codec) {
> > >  		ret =3D -EINVAL;
> > > -		goto put_platform_node;
> > > +		dev_err_probe(&pdev->dev, ret, "Property 'hdmi-codec'
> > > missing or invalid\n");
> > > +		goto err_hdmi_codec;
> > =

> > You're making hdmi-codec a required property, since now the driver
> > fails to
> > probe without it. Is it really required though? The driver code still
> > checks for
> > the presence of hdmi_codec before using it, so shouldn't it be fine
> > to let it be
> > optional?
> > =

> > If it is really required now though, then I guess at least the dt-
> > binding should
> > be updated accordingly. (Although I think this would technically
> > break the ABI?)
> > =

> > Thanks,
> > N=EDcolas
> =

> Hi N=EDcolas,
> =

> Thanks for your comment. Indeed I made hdmi-codec a required property,
> because it is a must in this machine driver. I prefer to report errors
> during the registration rather than during the use.

But what do you mean that it is required in this machine driver? The code c=
hecks
for presence of hdmi_codec and ignores it if it's not set, so it does really
seem optional to me. Also, I have tested this driver on mt8192-asurada-sphe=
rion
without hdmi-codec set in the DT and the speaker and headphone sound works =
just
fine.

Besides, there might be machines using this driver that don't support HDMI,=
 and
requiring an hdmi-codec in the DT for them would not make any sense. So kee=
ping
hdmi-codec as optional seems like the most sensible solution to me, really.

Thanks,
N=EDcolas

> =

> So I'd like to take your second suggestion. I need to update dt-binding =

> that set hdmi-codec as required property.
> =

> "(Although I think this would technicallybreak the ABI?)"
> =3D=3D> I can't understand this question, could you help explain it in mo=
re
> detail.
> =

> Thanks,
> Jiaxin.Yu
> =

> > =

> >  	}
> > > -	card->dev =3D &pdev->dev;
> > >  =

> > > -	hdmi_codec =3D of_parse_phandle(pdev->dev.of_node,
> > > -				      "mediatek,hdmi-codec", 0);
> > > +	speaker_codec =3D of_get_child_by_name(pdev->dev.of_node,
> > > "speaker-codecs");
> > > +	if (!speaker_codec) {
> > > +		ret =3D -EINVAL;
> > > +		dev_err_probe(&pdev->dev, ret, "Property 'speaker-
> > > codecs' missing or invalid\n");
> > > +		goto err_speaker_codec;
> > > +	}
> > >  =

> > =

> snip...
> > >  =

> > > -put_hdmi_codec:
> > > +err_probe:
> > > +	of_node_put(speaker_codec);
> > > +err_speaker_codec:
> > >  	of_node_put(hdmi_codec);
> > > -put_platform_node:
> > > +err_hdmi_codec:
> > >  	of_node_put(platform_node);
> > > +err_platform_node:
> > >  	return ret;
> > >  }
> > >  =

> > > -- =

> > > 2.18.0
> > > =

> > > =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
