Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 05:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJQWQ/Sy44Z6qZWUFVuXoF2FARo/fFV924wlK9uJLoU=; b=ADGIA4h0UZj52r
	B0ZtpRD1Sp3Nm78/+7doOXD8WmaNESaGdspWRAspcx5TFxhXt8ps0mgA6IBQX5Ab7c3GCKPCbFcJo
	G6UMKXnhAM+tBzarrFBE7uLuCKaAZu8FBmflQiJcGUCd2Muc0/7wzL6GoVEtdy7J35lGmQM1Y4PAW
	1HC2r958IycDVF/YxJzuNhLYz3JfqMVS0vhUZcFVozu6ewioppbQOjfbBNhZbmDL529z/mb37Pm0U
	r6XMlOjZabO1FpfUshBjybQrCf341ZBKS4xEfdQGq63kCunq7JjMFldwRCSqZvxDcQWjAkzBj7seN
	A2JmV7HV0Adsekhm2fTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAQ5f-008pfW-Ry; Thu, 20 Jan 2022 05:34:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAQ5R-008pch-F4; Thu, 20 Jan 2022 05:34:20 +0000
X-UUID: b7a7cc655ce04adea08e05433d8ad820-20220119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ervncUxhYOmnL0EQuvSlPxBZePxd9USgOVUSXJoXNv4=; 
 b=Nbh/NHuK/Pgy4PJedpyO6BcKWUAOOEcacr71v1pEMIurHxrBex9/HVZOCZjt5MbvBrKbc3uNHy6fGBDbPIwTBWkQw6qTlY2m9t76Hbk4wf1+gdcbrnnYUdRnq3edldvnQE5dpVGZuslh6uffVR0akHML50IUK0WfLPtoaFRA4Ig=;
X-UUID: b7a7cc655ce04adea08e05433d8ad820-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2021403513; Wed, 19 Jan 2022 22:34:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 21:34:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Jan 2022 13:34:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 13:34:08 +0800
Message-ID: <0b6ef0ce05bb92cd458043be2441101e20166242.camel@mediatek.com>
Subject: Re: [PATCH v4 3/3] mmc: mediatek: add support for SDIO eint IRQ
From: Axe Yang <axe.yang@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, "Yoshihiro
 Shimoda" <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "Lucas
 Stach" <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>
Date: Thu, 20 Jan 2022 13:34:08 +0800
In-Reply-To: <Yehq7L36yfJ8D/j2@smile.fi.intel.com>
References: <20220119103212.13158-1-axe.yang@mediatek.com>
 <20220119103212.13158-4-axe.yang@mediatek.com>
 <Yehq7L36yfJ8D/j2@smile.fi.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_213418_928481_5C269A76 
X-CRM114-Status: GOOD (  30.91  )
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

On Wed, 2022-01-19 at 21:47 +0200, Andy Shevchenko wrote:
> On Wed, Jan 19, 2022 at 06:32:12PM +0800, Axe Yang wrote:
> > Add support for eint IRQ when MSDC is used as an SDIO host. This
> > feature requires SDIO device support async IRQ function. With this
> > feature, SDIO host can be awakened by SDIO card in suspend state,
> > without additional pin.
> > 
> > MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> > turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> > resume, switch GPIO function back to DAT1 mode then turn on clock.
> > 
> > Some device tree property should be added or modified in MSDC node
> > to support SDIO eint IRQ. Pinctrls named state_dat1 and state_eint
> > are mandatory. And cap-sdio-async-irq flag is necessary since this
> > feature depends on asynchronous interrupt:
> >         &mmcX {
> >                 ...
> >                 pinctrl-names = "default", "state_uhs",
> > "state_eint",
> >                                 "state_dat1";
> >                 ...
> >                 pinctrl-2 = <&mmc2_pins_eint>;
> >                 pinctrl-3 = <&mmc2_pins_dat1>;
> >                 ...
> >                 cap-sdio-async-irq;
> >                 ...
> >         };
> > 
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> 
> The submitters SoB must be last among all SoB tags. Please, read
> Submitting
> Patches document carefully.
> 
> > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> 
> Who is they, why their SoB appeared here?
> 

Yong Mao is the co-developer of this patch, I will reorder the SoB
chains.

> ...
> 
> >  /*
> > - * Copyright (c) 2014-2015 MediaTek Inc.
> > + * Copyright (c) 2022 MediaTek Inc.
> 
> This doesn't feel right. Why did you remove old years?

I should keep the publish year 2014 of this driver.
But I still think range 2014-2022 is the most appropriate way to change
the copyright time. Over these years, mediatek is keeping maintaining
this driver continuously. What do you think?

> 
> >   * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
> >   */
> 
> ...
> 
> > +	desc = devm_gpiod_get(host->dev, "eint", GPIOD_IN);
> > +	if (IS_ERR(desc))
> > +		return PTR_ERR(desc);
> > +	ret = gpiod_to_irq(desc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	irq = ret;
> 
> Since both of them are local variables and there is no specific use
> of the
> returned value, I believe it's fine just to
> 
> 	irq = gpiod_to_irq(desc);
> 	...

I agree, will fix in next version.

> Hmm... I was wondering if you can use fwnode_irq_get_byname().
> Ah, it's not (yet) in upstream.
> 
> ...
> 
> >  static int __maybe_unused msdc_runtime_suspend(struct device *dev)
> >  {
> > +	unsigned long flags;
> 
> Can you keep reversed xmas tree order?
> 
> >  	struct mmc_host *mmc = dev_get_drvdata(dev);
> >  	struct msdc_host *host = mmc_priv(mmc);
> 
> (it means to add new variable here)

Will fix it in next version.

> 
> >  	return 0;
> >  }
> 
> ...
> 
> >  static int __maybe_unused msdc_runtime_resume(struct device *dev)
> >  {
> > +	unsigned long flags;
> 
> Ditto.

Will fix it in next version.

> 
> >  	struct mmc_host *mmc = dev_get_drvdata(dev);
> >  	struct msdc_host *host = mmc_priv(mmc);
> >  	int ret;
> >  	return 0;
> >  }
> 

--
Best Regard,
Axe Yang

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
