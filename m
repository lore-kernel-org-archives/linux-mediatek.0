Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 03:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A3AD610C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 03:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A3AD610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUbehJlZ5y/qd1qxNRTpQDYmBeWhEOh43PGeP06VzdY=; b=3L1hS4hRKVt6qT
	aFt9SBuIQoJIYsd112byS/70cIa+PfhP5+8s/Mg9aor9lwo48EFyOjGGNfm6PJtzTvkzlb5Q8r7fo
	gS1YBgHqGsepX6AuDVvI0kmTHkCuwTyQs5JZlDR0gXGFw/+d0n64j1/HWl+0Fb5tiF9WE2i7q3Xka
	aHm9cRLDO7degYUNVqkhHOo8H5hMjg2zljaVk9xvVqMqjAOtKEyAfnjhE+inLvF5aFoOufb4E6Deu
	Z5HV/fhnuiu2lbTHvwlPa5O6e88H+a7aLJetRuelBzORVqHUfgWhK9KsDEnJzIUOks5SCvRSBMRCF
	5SM/ZEwV9KhV+SqSVaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTcId-00D3ip-BI; Fri, 24 Sep 2021 03:54:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTcIa-00D3hn-GA; Fri, 24 Sep 2021 03:54:58 +0000
X-UUID: a22d505ee5884f13b14be5386451a60b-20210923
X-UUID: a22d505ee5884f13b14be5386451a60b-20210923
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 337109526; Thu, 23 Sep 2021 20:54:53 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:54:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Sep 2021 11:54:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 11:54:49 +0800
Message-ID: <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: add machine driver with
 mt6359, rt1011 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <aaronyu@google.com>, <linux-arm-kernel@lists.infradead.org>,
 <trevor.wu@mediatek.com>
Date: Fri, 24 Sep 2021 11:54:49 +0800
In-Reply-To: <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
 <20210910104405.11420-2-trevor.wu@mediatek.com>
 <10fc49fa-9791-0225-365d-e3074680596c@linux.intel.com>
 <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_205456_590303_26A05F4D 
X-CRM114-Status: GOOD (  33.23  )
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

Hi Pierre-Louis,

On Mon, 2021-09-13 at 18:24 +0800, Trevor Wu wrote:
> On Fri, 2021-09-10 at 11:47 -0500, Pierre-Louis Bossart wrote:
> > > 
> 
> > > +
> > > +	param->mtkaif_calibration_ok = false;
> > > +	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++) {
> > > +		param->mtkaif_chosen_phase[i] = -1;
> > > +		param->mtkaif_phase_cycle[i] = 0;
> > > +		mtkaif_chosen_phase[i] = -1;
> > > +		mtkaif_phase_cycle[i] = 0;
> > > +	}
> > > +
> > > +	if (IS_ERR(afe_priv->topckgen)) {
> > > +		dev_info(afe->dev, "%s() Cannot find topckgen
> > > controller\n",
> > > +			 __func__);
> > > +		return 0;
> > 
> > is this not an error? Why not dev_err() and return -EINVAL or
> > something?
> > 
> 
> Should I still return an error, even if the caller didn't check it?
> 
> Based on my understanding, the calibration function is used to make
> the
> signal more stable. 
> Most of the time, mtkaif still works, even though the calibration
> fails.
> I guess that's why the caller(I refered to the implementation of
> mt8192.) didn't check the return value of calibration function.
> 
> 
> > > +	}
> > > +
> > > +	pm_runtime_get_sync(afe->dev);
> > 
> > test if this worked?
> > 
> 
> Yes, if I didn't add pm_runtime_get_sync here, the calibration
> failed.
> 
> > > +	mt6359_mtkaif_calibration_enable(cmpnt_codec);
> > > +
> > > 
[...]
> > > +	mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
> > > +					    chosen_phase_1,
> > > +					    chosen_phase_2,
> > > +					    chosen_phase_3);
> > > +
> > > +	mt6359_mtkaif_calibration_disable(cmpnt_codec);
> > > +	pm_runtime_put(afe->dev);
> > > +
> > > +	param->mtkaif_calibration_ok = mtkaif_calibration_ok;
> > > +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] =
> > > chosen_phase_1;
> > > +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] =
> > > chosen_phase_2;
> > > +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] =
> > > chosen_phase_3;
> > > +	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++)
> > > +		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
> > > +
> > > +	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
> > > +		 __func__, param->mtkaif_calibration_ok);
> > 
> > dev_dbg?
> > 
> 
> Because we don't regard calibration failure as an error, it is a hint
> to show the calibration result.
> I prefer to keep dev_info here.
> Is it OK?
> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream
> > > *substream)
> > > +{
> > > +	static const unsigned int rates[] = {
> > > +		48000
> > > +	};
> > > +	static const unsigned int channels[] = {
> > > +		2, 4, 6, 8
> > > +	};
> > > +	static const struct snd_pcm_hw_constraint_list
> > > constraints_rates = {
> > > +		.count = ARRAY_SIZE(rates),
> > > +		.list  = rates,
> > > +		.mask = 0,
> > > +	};
> > > +	static const struct snd_pcm_hw_constraint_list
> > > constraints_channels = {
> > > +		.count = ARRAY_SIZE(channels),
> > > +		.list  = channels,
> > > +		.mask = 0,
> > > +	};
> > 
> > you use the same const tables several times, move to a higher scope
> > and
> > reuse?
> > 
> 
> There is little difference in channels between these startup ops.
> 
> > > +	struct snd_soc_pcm_runtime *rtd =
> > > asoc_substream_to_rtd(substream);
> > > +	struct snd_pcm_runtime *runtime = substream->runtime;
> > > +	int ret;
> > > +
> > > +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> > > +					 SNDRV_PCM_HW_PARAM_RATE,
> > > +					 &constraints_rates);
> > > +	if (ret < 0) {
> > > +		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> > > +					 SNDRV_PCM_HW_PARAM_CHANNELS,
> > > +					 &constraints_channels);
> > > +	if (ret < 0) {
> > > +		dev_err(rtd->dev, "hw_constraint_list channel
> > > failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > 
> > > +
> > > +static struct platform_driver mt8195_mt6359_rt1011_rt5682_driver
> > > =
> > > {
> > > +	.driver = {
> > > +		.name = "mt8195_mt6359_rt1011_rt5682",
> > > +#ifdef CONFIG_OF
> > > +		.of_match_table = mt8195_mt6359_rt1011_rt5682_dt_match,
> > > +#endif
> > > +		.pm = &mt8195_mt6359_rt1011_rt5682_pm_ops,
> > > +	},
> > > +	.probe = mt8195_mt6359_rt1011_rt5682_dev_probe,
> > > +};
> > > +
> > > +module_platform_driver(mt8195_mt6359_rt1011_rt5682_driver);
> > > +
> > > +/* Module information */
> > > +MODULE_DESCRIPTION("MT8195-MT6359-RT1011-RT5682 ALSA SoC machine
> > > driver");
> > > +MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
> > > +MODULE_LICENSE("GPL v2");
> > 
> > "GPL" is enough
> > 
> 
> I see many projects use GPL v2 here, and all mediatek projects use
> GPL
> v2, too.
> I'm not sure which one is better.
> Do I need to modify this?
> 

> 
> > > +MODULE_ALIAS("mt8195_mt6359_rt1011_rt5682 soc card");
> > > 

Gentle ping.

Thanks,
Trevor


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
