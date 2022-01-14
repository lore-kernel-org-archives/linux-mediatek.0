Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 03:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVaR+AbNOIX8I1tJ7yw3d6P9ruMNyed7vu9SEF4qbiY=; b=liI1V5iiBoI7oX
	IvW0obyQQL6Sb1A2E4XMN/Xwfa4Lq7Kze/WoUPqrtzI/bnI4dZDqqtUd9sVUCFiE+yOs4sgm1SWHq
	TDQ1rHoZvg06Ko2f2Gwq3gLO3vQmujFBHcV1JFUviutxJe3N/hAJnr+obruGI9dw/hQVoYpfnbufp
	U/4IfKNTIu7o+AECIwWTs8R3ud2uDXWec+c3aaXMTMdu1tcWeWXWuBSo3W0yDver0UJTaI2RWzRL2
	Wugbrjim1dmsG7CIeylJUHoHJUuDxYkM4ZsG+nTrz7ppdcIPwBeA7Y5YRRLu1RbTXSqLRDfX5QvzT
	MHmiAGB0AlhSFv/a71Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8D4y-007aj6-Bt; Fri, 14 Jan 2022 03:16:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8D4l-007afr-J7; Fri, 14 Jan 2022 03:16:29 +0000
X-UUID: 64af1738fe6647f88d6c286e06e18c99-20220113
X-UUID: 64af1738fe6647f88d6c286e06e18c99-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 830499906; Thu, 13 Jan 2022 20:16:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 19:16:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 11:16:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 11:16:21 +0800
Message-ID: <bc5f284872c44c6fa9f5eb6bb7a49db5ff6e0794.camel@mediatek.com>
Subject: Re: [PATCH v13 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Liam Girdwood <lgirdwood@gmail.com>, "Ranjani
 Sridharan" <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>
Date: Fri, 14 Jan 2022 11:16:21 +0800
In-Reply-To: <c876eda8-1fde-6c40-117a-12dde042780d@linux.intel.com>
References: <20220113082103.27911-1-allen-kh.cheng@mediatek.com>
 <20220113082103.27911-3-allen-kh.cheng@mediatek.com>
 <c876eda8-1fde-6c40-117a-12dde042780d@linux.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_191627_706488_792CE869 
X-CRM114-Status: GOOD (  13.87  )
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

On Thu, 2022-01-13 at 12:47 -0600, Pierre-Louis Bossart wrote:
> > +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct mtk_adsp_mbox_priv *priv;
> > +	const struct mtk_adsp_mbox_cfg *cfg;
> > +	struct mbox_controller *mbox;
> > +	int ret, irq;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	mbox = &priv->mbox;
> > +	mbox->dev = dev;
> > +	mbox->ops = &mtk_adsp_mbox_chan_ops;
> > +	mbox->txdone_irq = false;
> > +	mbox->txdone_poll = true;
> > +	mbox->of_xlate = mtk_adsp_mbox_xlate;
> > +	mbox->num_chans = 1;
> > +	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans),
> > GFP_KERNEL);
> > +	if (!mbox->chans)
> > +		return -ENOMEM;
> > +
> > +	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(priv->va_mboxreg))
> > +		return PTR_ERR(priv->va_mboxreg);
> > +
> > +	priv->cfg = of_device_get_match_data(dev);
> 
> question: is any error handling needed here? some drivers do, others
> don't, but that function can return NULL.
> 

Hi Pierre,

Thanks for your question.

I prefer my previous version which check NULL from
of_device_get_match_data.

I will revert this part in the next version.

Thanks.

> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
> > +					mtk_adsp_mbox_isr,
> > IRQF_TRIGGER_NONE,
> > +					dev_name(dev), mbox->chans);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	return devm_mbox_controller_register(dev, &priv->mbox);
> > +}
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
