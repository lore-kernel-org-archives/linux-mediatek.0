Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F63C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 04:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n781wfEaeqGddmF9CuHs8EanqbwnC/f9O4XVNECUyFg=; b=HV7O4ZAxgNQxnj
	Nwhsmr0ZkO6BMBXjga/Ysy6fqX4QKB65q6wLXm4quc4cjWG2HMKMkSSe9cZDsNkjWw2ZQTMwSF96b
	C1fzbAyVwPVXx+edjMRDADmQWQMPVSNm8NhuJEa8ctTSzI6NBiKQQ/Lz6xL3ZKLQhoB5a4YP5Mtvw
	l3Fxn6hZLd9U60fOK3z3Rkv1d3D3G9iGEWY5ChOIR6aVaDTp7Et2O52MWBOby+cZ4B5yiNmsURhIy
	s1QgVdPiEXulwWrxRyWa68yIS4iey7opypDSYRdbkzQSJeSTwesReDXlPuxvVSyZBhvLz9Nxt9aMT
	Xu5P6mWpzWBCv8gW5DyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPGON-001QqV-Ut; Wed, 02 Mar 2022 04:15:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPGO8-001QoF-5Z; Wed, 02 Mar 2022 04:15:01 +0000
X-UUID: 371bed17fe1d448585cd663fc03a2b5d-20220301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uay/e8C1DeA423jVWYPW76oAFb3+e0tHTIDQTm43Mr0=; 
 b=GIBI6ufR+O31902zzh0CS1wx73DKZ679Uj2k2vtS2CvNyaJ/A5nNrXKBflGOWvALy2dnNO0iSpEbWUgrHjuFttF2xWd1Y0CWPI85wveH+GiSScDeY2XhZ0umC1CbVBc0wdpHOo5D6yVRKfS+96n8PxxkJnP4lfSR7kquRM59vDw=;
X-UUID: 371bed17fe1d448585cd663fc03a2b5d-20220301
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1318696977; Tue, 01 Mar 2022 21:14:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 20:07:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 2 Mar 2022 12:07:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Mar 2022 12:07:39 +0800
Message-ID: <0b8a5c22acb87b49de0380c7cb4e49030f93d715.camel@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.corp-partner.google.com>
Date: Wed, 2 Mar 2022 12:07:39 +0800
In-Reply-To: <Yh3hcQpLngg8Pnd4@google.com>
References: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
 <20220301072924.24814-3-jiaxin.yu@mediatek.com>
 <Yh3hcQpLngg8Pnd4@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_201458_097308_CC302F4A 
X-CRM114-Status: GOOD (  20.91  )
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

On Tue, 2022-03-01 at 17:03 +0800, Tzung-Bi Shih wrote:
> On Tue, Mar 01, 2022 at 03:29:24PM +0800, Jiaxin Yu wrote:
> > From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>
> 
> The environment didn't configure properly so that the header showed
> up.
> See [1].
> 
> [1]: 
> https://git-scm.com/docs/git-send-email#Documentation/git-send-email.txt---fromltaddressgt
> 
Ok, I will take a look at the "from: " header.

> > diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-
> > rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> 
> [...]
> > +static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682s_card = {
> > +	.name = "mt8192_mt6359_rt1015p_rt5682s",
> > +	.owner = THIS_MODULE,
> > +	.dai_link = mt8192_mt6359_dai_links,
> > +	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
> > +	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
> > +	.num_controls =
> > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
> > +	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
> > +	.num_dapm_widgets =
> > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
> > +	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
> > +	.num_dapm_routes =
> > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
> > +};
> 
> Are the two cards only different from names
> (mt8192_mt6359_rt1015p_rt5682_card vs.
> mt8192_mt6359_rt1015p_rt5682s_card)?
> 
Yes, they are only different form names.

> > @@ -1150,6 +1177,52 @@ static int mt8192_mt6359_dev_probe(struct
> > platform_device *pdev)
> >  				dai_link->num_platforms =
> >  					ARRAY_SIZE(i2s3_rt1015p_platfor
> > ms);
> >  			}
> > +		} else if (strcmp(dai_link->name, "I2S8") == 0) {
> > +			if (card == &mt8192_mt6359_rt1015_rt5682_card
> > ||
> > +			    card == &mt8192_mt6359_rt1015p_rt5682_card)
> > {
> > +				dai_link->cpus = i2s8_rt5682_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s8_rt5682_cpus);
> > +				dai_link->codecs = i2s8_rt5682_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s8_rt5682_codecs);
> > +				dai_link->platforms =
> > i2s8_rt5682_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s8_rt5682_platform
> > s);
> > +			} else if (card ==
> > &mt8192_mt6359_rt1015p_rt5682s_card) {
> > +				dai_link->cpus = i2s8_rt5682s_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s8_rt5682s_cpus);
> > +				dai_link->codecs = i2s8_rt5682s_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s8_rt5682s_codecs)
> > ;
> > +				dai_link->platforms =
> > i2s8_rt5682s_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s8_rt5682s_platfor
> > ms);
> > +			}
> > +		} else if (strcmp(dai_link->name, "I2S9") == 0) {
> > +			if (card == &mt8192_mt6359_rt1015_rt5682_card
> > ||
> > +			    card == &mt8192_mt6359_rt1015p_rt5682_card)
> > {
> > +				dai_link->cpus = i2s9_rt5682_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s9_rt5682_cpus);
> > +				dai_link->codecs = i2s9_rt5682_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s9_rt5682_codecs);
> > +				dai_link->platforms =
> > i2s9_rt5682_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s9_rt5682_platform
> > s);
> > +			} else if (card ==
> > &mt8192_mt6359_rt1015p_rt5682s_card) {
> > +				dai_link->cpus = i2s9_rt5682s_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s9_rt5682s_cpus);
> > +				dai_link->codecs = i2s9_rt5682s_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s9_rt5682s_codecs)
> > ;
> > +				dai_link->platforms =
> > i2s9_rt5682s_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s9_rt5682s_platfor
> > ms);
> > +			}
> 
> After seeing the code, I am starting to wonder if the reuse is
> overkill.  If
> they (RT5682 vs. RT5682S) only have some minor differences, probably
> it could
> reuse more by:
> 
> SND_SOC_DAILINK_DEFS(i2s8, ...
> SND_SOC_DAILINK_DEFS(i2s9, ...
> 
> ...
> 
> if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
>         i2s8_codecs.name = RT5682S_DEV0_NAME;
>         i2s8_codecs.dai_name = RT5682S_CODEC_DAI;
>         ...
> }
> 
> Or even uses of_device_is_compatible() if it would like to reuse the
> struct
> snd_soc_card.
If we reuse the struct snd_soc_card, the card .name will be same.
Should I change the card .name through of_device_is_compatible()?

Maybe like below:

Remove rt5682x related words for snd_soc_card.
static struct snd_soc_card mt8192_mt6359_rt1015p_card = {
	.owner = THIS_MODULE,
	.dai_link = mt8192_mt6359_dai_links,
	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
	.controls = mt8192_mt6359_rt1015p_controls,
	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_controls),
	.dapm_widgets = mt8192_mt6359_rt1015p_widgets,
	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_widgets),
	.dapm_routes = mt8192_mt6359_rt1015p_routes,
	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_routes),
};

static const struct of_device_id mt8192_mt6359_dt_match[] = {
	{
		.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",
		.data = &mt8192_mt6359_rt1015_rt5682_card,
	},
	{
		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682",
		.data = &mt8192_mt6359_rt1015p_card,
	},
	{
		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s",
		.data = &mt8192_mt6359_rt1015p_card,
	},
	{}
};

if (of_device_is_compatible(np, "mediatek,
mt8192_mt6359_rt1015p_rt5682")) {
	card.name = "mt8192_mt6359_rt1015p_rt5682";
	...
} else if (of_device_is_compatible(np, "mediatek,
mt8192_mt6359_rt1015p_rt5682s")) {
	card.name = "mt8192_mt6359_rt1015p_rt5682s";
	...
}





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
