Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F808C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q28+nFPGKxLTY1adyRKes3CBL+itPaAvGVmeRRVDJt0=; b=Ahr4FasZ3ZpWJ3
	oDOJ1AYUQ0YSIAKDCWEfLwLs3cHf6OVN6h+xkFlBrk0cNa0dLkYATh7G2h4Ndk2F4izRd8Z3HxB6v
	JAIzrZNnNGj4jG27SzLs4p0jDB4DZRuy7lRKylBWq0GmYBngOGgnyc5274ka1Y9lmHJXMB7adFhkt
	Fh3tS1clQKmlU0lDLasW0fzMan3cW3ufizCW0LgSWJIBQR8jOr1h8+QEX40+nWy0v7Qo5HUWmXekW
	cgLxpMnRQK4eSERjX2VfhL8bTnE5r3ZrbPceNjH5sgBQV15xIwRQdVylidOQ69F92ZfHAxtLxG0lw
	xwxZAv7fUcZU84KlEZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPpRv-007Lib-5z; Thu, 03 Mar 2022 17:41:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPpRH-007LL3-Rq; Thu, 03 Mar 2022 17:40:33 +0000
X-UUID: 070ea495582548ab96a694c54bbf70c2-20220303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JQT4EHdrup8ZxMpI8744DeOfGYnGxOr3qsyoJfz5Mb0=; 
 b=Y2ys9A+U8BWA3veZCdCiofh2f+H3iGu0w4jR117IWEKoWrtpJ4TizR4t/f1btm6uszw/+GHSePc9URw12yVSMjBAa/4wOPCZsNmiREkYX2vKDni9Io8oIuqlm9K09gsB350YWX1+r8cTwQRodSmGO8zWbQO/lC+h7blFSUzNHTI=;
X-UUID: 070ea495582548ab96a694c54bbf70c2-20220303
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1502633324; Thu, 03 Mar 2022 10:40:26 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 09:40:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Mar 2022 01:40:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 01:40:10 +0800
Message-ID: <a8edf274beffbdbadec39d7283ebbab5699ef4d4.camel@mediatek.com>
Subject: Re: [v2 09/17] ASoC: mediatek: mt8186: support tdm in platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Fri, 4 Mar 2022 01:39:05 +0800
In-Reply-To: <6bc78592-36c0-8462-f4f8-ad9e04a13da6@collabora.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-10-jiaxin.yu@mediatek.com>
 <fcae42a5-6e11-e683-8f3a-453650f08d38@collabora.com>
 <9ba63387baecf598db696d0ebbc1583406a57a62.camel@mediatek.com>
 <6bc78592-36c0-8462-f4f8-ad9e04a13da6@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_094031_936431_482D36AC 
X-CRM114-Status: GOOD (  39.25  )
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

On Thu, 2022-03-03 at 16:08 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/03/22 15:10, Jiaxin Yu ha scritto:
> > On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> > > > This patch adds mt8186 tdm dai driver.
> > > > 
> > > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > > ---
> > > >    sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 713
> > > > +++++++++++++++++++++
> > > >    1 file changed, 713 insertions(+)
> > > >    create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-
> > > > tdm.c
> > > > 
> > > > diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> > > > b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> > > > new file mode 100644
> > > > index 000000000000..28dd3661f0e0
> > > > --- /dev/null
> > > > +++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> > > > @@ -0,0 +1,713 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +//
> > > > +// MediaTek ALSA SoC Audio DAI TDM Control
> > > > +//
> > > > +// Copyright (c) 2022 MediaTek Inc.
> > > > +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > > +
> 
> ..snip..
> 
> > > > +
> > > > +static int mtk_dai_tdm_hw_params(struct snd_pcm_substream
> > > > *substream,
> > > > +				 struct snd_pcm_hw_params
> > > > *params,
> > > > +				 struct snd_soc_dai *dai)
> > > > +{
> > > > +	struct mtk_base_afe *afe =
> > > > snd_soc_dai_get_drvdata(dai);
> > > > +	struct mt8186_afe_private *afe_priv = afe-
> > > > >platform_priv;
> > > > +	int tdm_id = dai->id;
> > > > +	struct mtk_afe_tdm_priv *tdm_priv = afe_priv-
> > > > >dai_priv[tdm_id];
> > > > +	unsigned int tdm_mode = tdm_priv->tdm_mode;
> > > > +	unsigned int data_mode = tdm_priv->data_mode;
> > > > +	unsigned int rate = params_rate(params);
> > > > +	unsigned int channels = params_channels(params);
> > > > +	snd_pcm_format_t format = params_format(params);
> > > > +	unsigned int bit_width =
> > > > +		snd_pcm_format_physical_width(format);
> > > > +	unsigned int tdm_channels = (data_mode ==
> > > > TDM_DATA_ONE_PIN) ?
> > > > +		get_tdm_ch_per_sdata(tdm_mode, channels) : 2;
> > > > +	unsigned int lrck_width =
> > > > +		get_tdm_lrck_width(format, tdm_mode);
> > > > +	unsigned int tdm_con = 0;
> > > > +	bool slave_mode = tdm_priv->slave_mode;
> > > > +	bool lrck_inv = tdm_priv->lck_invert;
> > > > +	bool bck_inv = tdm_priv->bck_invert;
> > > > +	unsigned int ctrl_reg;
> > > > +	unsigned int ctrl_mask;
> > > > +	unsigned int tran_rate;
> > > > +	unsigned int tran_relatch_rate;
> > > > +
> > > > +	if (tdm_priv)
> > > > +		tdm_priv->rate = rate;
> > > > +	else
> > > > +		dev_info(afe->dev, "%s(), tdm_priv == NULL",
> > > > __func__);
> > > > +
> > > > +	tran_rate = mt8186_rate_transform(afe->dev, rate, dai-
> > > > >id);
> > > > +	tran_relatch_rate =
> > > > mt8186_tdm_relatch_rate_transform(afe->dev,
> > > > rate);
> > > > +
> > > > +	/* calculate mclk_rate, if not set explicitly */
> > > > +	if (!tdm_priv->mclk_rate) {
> > > > +		tdm_priv->mclk_rate = rate * tdm_priv-
> > > > >mclk_multiple;
> > > > +		mtk_dai_tdm_cal_mclk(afe,
> > > > +				     tdm_priv,
> > > > +				     tdm_priv->mclk_rate);
> > > > +	}
> > > > +
> > > > +	/* ETDM_IN1_CON0 */
> > > > +	tdm_con |= slave_mode <<
> > > > ETDM_IN1_CON0_REG_SLAVE_MODE_SFT;
> > > > +	tdm_con |= tdm_mode << ETDM_IN1_CON0_REG_FMT_SFT;
> > > > +	tdm_con |= (bit_width - 1) <<
> > > > ETDM_IN1_CON0_REG_BIT_LENGTH_SFT;
> > > > +	tdm_con |= (bit_width - 1) <<
> > > > ETDM_IN1_CON0_REG_WORD_LENGTH_SFT;
> > > > +	tdm_con |= (tdm_channels - 1) <<
> > > > ETDM_IN1_CON0_REG_CH_NUM_SFT;
> > > > +	/* default disable sync mode */
> > > > +	tdm_con |= 0 << ETDM_IN1_CON0_REG_SYNC_MODE_SFT;
> > > 
> > > 0 << (anything) == 0
> > > 
> > > (number |= 0) == number
> > > 
> > > Is this a mistake, or are you really doing nothing here?
> > > 
> > 
> > No, this is just to emphasize the need to set this bit to 0.
> > It really do nothing here, just link a reminder.
> > Can I keep this sentence?
> 
> If, in your judgement, it is very important to have a reminder about
> that
> bit having to be unset, then add a comment in the code saying so.
> Don't simply comment out the statement as it is.
> 
> A good way would be something like
> /* sync mode bit has to be unset because this that reason, otherwise
> X happens */

I see, thanks for your kind advise.
> 
> > > 
> > > > +	/* relatch fix to h26m */
> > > > +	tdm_con |= 0 <<
> > > > ETDM_IN1_CON0_REG_RELATCH_1X_EN_SEL_DOMAIN_SFT;
> > > > +
> > > > +	ctrl_reg = ETDM_IN1_CON0;
> > > > +	ctrl_mask = ETDM_IN_CON0_CTRL_MASK;
> > > > +	regmap_update_bits(afe->regmap, ctrl_reg, ctrl_mask,
> > > > tdm_con);
> > > > +
> > > > +	/* ETDM_IN1_CON1 */
> > > > +	tdm_con = 0;
> > > > +	tdm_con |= 0 << ETDM_IN1_CON1_REG_LRCK_AUTO_MODE_SFT;
> > > > +	tdm_con |= 1 << ETDM_IN1_CON1_PINMUX_MCLK_CTRL_OE_SFT;
> > > > +	tdm_con |= (lrck_width - 1) <<
> > > > ETDM_IN1_CON1_REG_LRCK_WIDTH_SFT;
> > > > +
> > > > +	ctrl_reg = ETDM_IN1_CON1;
> > > > +	ctrl_mask = ETDM_IN_CON1_CTRL_MASK;
> > > > +	regmap_update_bits(afe->regmap, ctrl_reg, ctrl_mask,
> > > > tdm_con);
> > > 
> > > You don't need the ctrl_reg, nor ctrl_mask variables...
> > 
> > I was trying to avoid a line of more than 80 words, so I shortened
> > the
> > number of words through variables.
> > 
> 
> Yes, I know, I did understand what you were trying to do...
> ...but it's fine to go past 80: in this case this would be 88
> columns,
> which is still ok to have!
> 
> And note, this is the case with all of similar calls present in this
> function,
> that's why I said that you don't need these two variables! :)
> 
> Thank you,
> Angelo
Ok, I got it. This function will be corrected in the next version.

Thank you.
Jiaxin.Yu


> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
