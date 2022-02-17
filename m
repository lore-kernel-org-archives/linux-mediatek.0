Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F2AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQ1dNlxIpqpfiGpgh2dsxLUa7rIklbpdTs1/JqyZYBQ=; b=035QOCBliCrrmp
	Tm9fRrrhJ4nfRs3YSV5T9OXBqpFBzZtIianEbrSBVGPry4ES++PtWZTQIRz6sQ6j0leYl+AiLKNc2
	W8ALKwS2XrXt+bnDhu4vA7Fb1JQ0I70n7wW0a5EELsH4opSsk15NHgSDKA/+LR36Lw6vRf9ScylMI
	omrntSYf1xBtVRQ8f3yLu1ShYj2qGG9D/YjGixo8XgqKZR9aagmdgdivGSLTIPyV6KhKNqus5leNH
	3F6iJEz2Swj7B6KEN6r93HrqsQFy6Zy7sKqOS2nK589O8R5xS9VM8IrpfllcVc21QlU7Mv1YYk0do
	S9aZDa3pcU2IGjhV4NAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhej-00Ay77-GS; Thu, 17 Feb 2022 14:21:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhKY-00ApBb-Lm; Thu, 17 Feb 2022 14:00:34 +0000
X-UUID: 6697060fede54c13978403a2d04043fc-20220217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/q/Mc3kjDBu4bNtU6524go99lGpsl77vnzkdkle30d0=; 
 b=LaYV6UIgLqgejjqyCqB38FAKwBs0xW5OHdWPSU0x3V+arkTLexKyhFEjYeGmX77Pn2iNVaj9k5pOeYmpgq6s2viqhoJyj7CuI7cwe52gLMDYuwC7QEmr67J9O/H8Djl5RQbxpJnbUhRotk/6/ieGcaYrPNmFiga3LosBqXHZDoo=;
X-UUID: 6697060fede54c13978403a2d04043fc-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 517617583; Thu, 17 Feb 2022 07:00:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 06:00:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 22:00:16 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 22:00:15 +0800
Message-ID: <a912ed83c8d959fc3bb0a08f00b3fd036beee270.camel@mediatek.com>
Subject: Re: [PATCH 09/15] ASoC: mediatek: mt8186: support tdm in platform
 driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <zhangqilong3@huawei.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 17 Feb 2022 21:59:43 +0800
In-Reply-To: <YgZ/pzrJqvcAuzmE@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-10-jiaxin.yu@mediatek.com>
 <YgZ/pzrJqvcAuzmE@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_060022_759370_3873EBE8 
X-CRM114-Status: GOOD (  16.39  )
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

On Fri, 2022-02-11 at 15:24 +0000, Mark Brown wrote:
> On Fri, Feb 11, 2022 at 06:38:12PM +0800, Jiaxin Yu wrote:
> 
> Again, mostly looks good just fairly small and easily fixable issues:
> 
> > +static int mtk_tdm_hd_en_event(struct snd_soc_dapm_widget *w,
> > +			       struct snd_kcontrol *kcontrol,
> > +			       int event)
> > +{
> > +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w-
> > >dapm);
> > +
> > +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> > +		 __func__, w->name, event);
> > +
> > +	return 0;
> > +}
> 
> This does nothing, you can just remove it.

Yes, this is readlly useless, removed it in the v2 version.

> 
> > +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> > +	case SND_SOC_DAIFMT_NB_NF:
> > +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> > +		break;
> > +	case SND_SOC_DAIFMT_NB_IF:
> > +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_INV;
> > +		break;
> > +	case SND_SOC_DAIFMT_IB_NF:
> > +		tdm_priv->bck_invert = TDM_BCK_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> > +		break;
> > +	case SND_SOC_DAIFMT_IB_IF:
> > +	default:
> > +		tdm_priv->bck_invert = TDM_BCK_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_INV;
> 
> You should return an error in the default case rather than just
> picking
> one of the behaviours to help spot any configuration errors.

Done in the v2 version.

> 
> > +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > +	case SND_SOC_DAIFMT_CBM_CFM:
> > +		tdm_priv->slave_mode = false;
> > +		break;
> > +	case SND_SOC_DAIFMT_CBS_CFS:
> > +		tdm_priv->slave_mode = true;
> 
> We're trying to move away from these defines and the master/slave
> terminology to talk about clock providers instead - the new defines
> are
> _PROVIDER_MASK, _DAIFMT_CBP_CFP and _DAIFMT_CBC_CFC.

Done in the v2 version.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
