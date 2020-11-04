Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158B9C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 06:51:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC052236F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 06:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dm35CHui";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Dp4TDRxh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC052236F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RvRUB4nB5F27vS0qGUGULgbvX2L3j7FdeqrfJFWD8Tk=; b=dm35CHuiHbn3iK7wUJOK+g9Mt
	zGVBuR9jZPnKsKO6WpuLdHyN1KgdXE9ovje0NBOhzHQCY9sHAj2e2yOV0f9yTLtuR9gki1hhusN8m
	njZCcFkNcSPJVS/LGpbBjaSpArJj1rvopbuhGJnf5BfldwmLHakoYO5yTI6nB+ry0UBqgZC1dA2Ag
	TV3uX0OBmZnNDYDzYM2XFkYYrZt12twP7SZtTlWFSfivXgGG2BWa//FABhkJAhoplgLpv1LdgyMqr
	CitfeZCjebSHNQUlKVAtigdHBNqD+LD2FCf1APiXgFUV0LcFKMwsVVwSh3R/6eQnjSRItf2gNcpzv
	rMn84/tQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaCdN-0005Ny-CA; Wed, 04 Nov 2020 06:51:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaCdI-0005LS-6X; Wed, 04 Nov 2020 06:51:01 +0000
X-UUID: 706320c8f2b24787be61b5ad18c366dc-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UekoF2NkcIAbphiY/goCm0eSyGMBmiPCbvSp/O9/Sgw=; 
 b=Dp4TDRxhU/fzcpAEaw89Z9dlx5NRb3q9m7bI2bE8doxyEd7jrGM1Azh9lMRXgEFC30UHYovcTOCRUDkyTxdwc4pK0z+I5abMRSzwfkob7gtdAna57LM7TSRXmrjgrkoep25jHa0y0S4SWYbnhHCYoOjRj25HBgc3YenrMFf/nJk=;
X-UUID: 706320c8f2b24787be61b5ad18c366dc-20201103
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1861672131; Tue, 03 Nov 2020 22:50:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 22:50:54 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 4 Nov 2020 14:50:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Nov 2020 14:50:52 +0800
Message-ID: <1604472652.26523.14.camel@mhfsdcap03>
Subject: Re: [PATCH v3 3/9] ASoC: mediatek: mt8192: support i2s in platform
 driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 4 Nov 2020 14:50:52 +0800
In-Reply-To: <20201030143729.GF4405@sirena.org.uk>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603526339-15005-4-git-send-email-jiaxin.yu@mediatek.com>
 <20201030143729.GF4405@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_015100_408858_BB246B43 
X-CRM114-Status: GOOD (  19.84  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com,
 Bicycle.Tsai@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-30 at 14:37 +0000, Mark Brown wrote:
> On Sat, Oct 24, 2020 at 03:58:53PM +0800, Jiaxin Yu wrote:
> 
> > +static const struct soc_enum mt8192_i2s_enum[] = {
> > +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8192_i2s_hd_str),
> > +			    mt8192_i2s_hd_str),
> > +};
> 
> Why is this declared as a single element array?  It just makes all the
> usages look odd for no obvious gain.
> 
> > +static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
> > +			    struct snd_kcontrol *kcontrol,
> > +			    int event)
> 
> > +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> > +		 __func__, w->name, event);
> 
> This should be dev_dbg() at most, _info() will be too noisy in the logs.
> Same for a lot of functions, including the stream callbacks.
> 
> > +static int mtk_i2s_hd_en_event(struct snd_soc_dapm_widget *w,
> > +			       struct snd_kcontrol *kcontrol,
> > +			       int event)
> > +{
> > +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> > +
> > +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> > +		 __func__, w->name, event);
> > +
> > +	return 0;
> > +}
> 
> This should just be removed entirely, there's trace in the core if you
> need logging in production systems - the tracepoints in particular are
> good for just leaving on all the time without adding overhead.
> 
> > +	return (i2s_need_apll == cur_apll) ? 1 : 0;
> 
> Please write normal conditional statements to improve legiblity.
> 
> > +	if (rate == 44100)
> > +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001B9000);
> > +	else if (rate == 32000)
> > +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x140000);
> > +	else
> > +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001E0000);
> 
> This would be better written as a switch statement.
> 
> > +	/* Calibration setting */
> > +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON4, 0x00140000);
> > +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON9, 0x00036000);
> > +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON10, 0x0002FC00);
> > +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON6, 0x00007EF4);
> > +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON5, 0x00FF5986);
> 
> Are you sure this isn't system dependant?
Hi Mark,
Yes, this is a system independent setting. And I fixed other comments
you pointed out then send "PATCH v4".


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
