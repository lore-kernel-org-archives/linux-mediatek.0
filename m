Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6345C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2THNUmnLVGKzfAMUlFEnicNMC6DGUfDCGp+hk1AU9IY=; b=mKWVK3JstgXDgS
	gtQfT5wJOaO4dN+V/ZK46u2EkF4hjBzZgAc9SCvsE13Dr/nCNC5c9l0VwRVvlDi0YQ2x3Wco8C5JL
	ATicMdbuWE5KIEws+6WEoWaDWgu8QC2pFeVp/9542wMS4urJ5obY5PonG1SoPrSmEPvlBfG16RaZw
	VaKs2WDt93++zaQVE+s4fAos89Fb6Ii0WXcQtalpR0m5lE1Rvj0tc0c9qv6S4iEVhSOF7K7nqLTTQ
	uJ2zTbXanQZeghKmJq0trPbAe89W5v+Fq7Y5JHLp1+Rq5SqCxe1VjQH0HAugXGSuGL/bmsK2K/vQQ
	TKxJ3TTZIgs8TMuh220A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkNkA-00AjkX-Cz; Fri, 29 Apr 2022 10:20:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkNXg-00AdFz-VK; Fri, 29 Apr 2022 10:08:06 +0000
X-UUID: ccdac3bd1e8e4138b261737678404629-20220429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cwIRd04UmkGgL+1avBYdugOPKP3hMNfhfN+KgAjWeXg=; 
 b=psUuC8cjQQPyYUswBizn66R77+GBtH7JwuzvYYAYgcO2WkL+dbYuBggc0/EPTy4vyZhnmoyBjoZus5FsXAP6CACwn5cqekK0k/EbOMMgZcquf+6MHuqHArRrbP0uorGXbXHSmnjXQHDiSsR9HtZQF3TexCW+IyzVH9Y6nFJ3Ae8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f9fdcffa-8212-41f6-95f3-7cc68f6eb210, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:263ef6c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ccdac3bd1e8e4138b261737678404629-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 434125664; Fri, 29 Apr 2022 03:07:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 03:07:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 18:07:53 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 18:07:52 +0800
Message-ID: <99c329534a462b39d9b39ba04851318e7823e54c.camel@mediatek.com>
Subject: Re: [v4 13/18] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>,
 <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
 <tzungbi@google.com>, <julianbraha@gmail.com>, <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Apr 2022 18:07:52 +0800
In-Reply-To: <YmqCORqp6nYuQJZf@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-14-jiaxin.yu@mediatek.com>
 <YmqCORqp6nYuQJZf@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_030805_091195_511AFC68 
X-CRM114-Status: GOOD (  28.77  )
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

On Thu, 2022-04-28 at 13:02 +0100, Mark Brown wrote:
> On Thu, Apr 28, 2022 at 05:33:50PM +0800, Jiaxin Yu wrote:
> > Add mt8186 platform and affiliated driver.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  sound/soc/mediatek/Kconfig                    |   44 +
> >  sound/soc/mediatek/Makefile                   |    1 +
> >  sound/soc/mediatek/mt8186/Makefile            |   22 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
> >  .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
> >  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3005
> > +++++++++++++++++
> >  .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
> >  .../soc/mediatek/mt8186/mt8186-misc-control.c |  294 ++
> >  .../mediatek/mt8186/mt8186-mt6366-common.c    |   59 +
> >  .../mediatek/mt8186/mt8186-mt6366-common.h    |   17 +
> >  sound/soc/mediatek/mt8186/mt8186-reg.h        | 2913
> > ++++++++++++++++
> >  11 files changed, 6920 insertions(+)
> 
> This looks mostly good though it is enormous so I might've missed
> some
> things.  The patch series is already very large but it might still be
> worth splitting this up a bit more, perhaps split the code and data
> tables/register definitions into separate patches?
> 
Yes, agree with you.

I will spit them into three patches:

PATCH 1: 
  - mt8186-reg.h
  - mt8186-interconnection.h
  - mt8186-misc-control.c

PATCH 2:
  - mt8186-mt6366-common.c
  - mt8186-mt6366-common.h

PATCH 3:
  - sound/soc/mediatek/Kconfig 
  - sound/soc/mediatek/Makefile
  - sound/soc/mediatek/mt8186/Makefile
  - sound/soc/mediatek/mt8186/mt8186-afe-common.h
  - .../soc/mediatek/mt8186/mt8186-afe-control.c
  - sound/soc/mediatek/mt8186/mt8186-afe-pcm.c

> A few relatively minor issues with the controls.
> 
> > +/* this order must match reg bit amp_div_ch1/2 */
> > +static const char * const mt8186_sgen_amp_str[] = {
> > +	"1/128", "1/64", "1/32", "1/16", "1/8", "1/4", "1/2", "1" };
> > +static const char * const mt8186_sgen_mute_str[] = {
> > +	"Off", "On"
> > +};
> 
> On/off controls should be normal Switch controls not enums so
> userspace
> can display things sensibly.
> 
> > +static int mt8186_sgen_set(struct snd_kcontrol *kcontrol,
> > +			   struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *cmpnt =
> > snd_soc_kcontrol_component(kcontrol);
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	struct soc_enum *e = (struct soc_enum *)kcontrol-
> > >private_value;
> > +	int mode;
> > +	int mode_idx;
> > +
> > +	if (ucontrol->value.enumerated.item[0] >= e->items)
> > +		return -EINVAL;
> 
> ...
> 
> > +				   0x3f << INNER_LOOP_BACK_MODE_SFT);
> > +	}
> > +
> > +	afe_priv->sgen_mode = mode;
> > +
> > +	return 0;
> > +}
> 
> This should return 1 if the value is different from the previous
> value
> so event generation works, please run mixer-test against a system
> using
> the driver to help spot issues like this.  The same issue applies to
> at
> least some of the other custom controls.
> 
Got it.

> > +static int mt8186_sgen_mute_set(struct snd_kcontrol *kcontrol,
> > +				struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *cmpnt =
> > snd_soc_kcontrol_component(kcontrol);
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt);
> > +	struct soc_enum *e = (struct soc_enum *)kcontrol-
> > >private_value;
> > +	int mute;
> > +
> > +	if (ucontrol->value.enumerated.item[0] >= e->items)
> > +		return -EINVAL;
> > +
> > +	mute = ucontrol->value.integer.value[0];
> > +
> > +	dev_dbg(afe->dev, "%s(), kcontrol name %s, mute %d\n",
> > +		__func__, kcontrol->id.name, mute);
> > +
> > +	if (strcmp(kcontrol->id.name, SGEN_MUTE_CH1_KCONTROL_NAME) ==
> > 0) {
> > +		regmap_update_bits(afe->regmap, AFE_SINEGEN_CON0,
> > +				   MUTE_SW_CH1_MASK_SFT,
> > +				   mute << MUTE_SW_CH1_SFT);
> > +	} else {
> > +		regmap_update_bits(afe->regmap, AFE_SINEGEN_CON0,
> > +				   MUTE_SW_CH2_MASK_SFT,
> > +				   mute << MUTE_SW_CH2_SFT);
> > +	}
> > +
> > +	return 0;
> > +}
> 
> I can't tell why some of these are done with custom code rather than
> using a normal SOC_SINGLE()?

Yes, it's better to use SOC_SINGLE. I will fix them in next version.

Thanks,
Jiaxin.yu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
