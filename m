Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C36EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mKNxSg9zkk8YptXGonEl06pty+mcPcxNDUCj3/u7CI=; b=gN/a13Z+FO0unB
	wHCo176sZBbqtY7gKii7gIIXAbX3nu7afVNKsbYj7A5hnrgKigRri++JbL0wrPHQcVbXh1t1GFdw0
	epYri10Yl3QC/SRKe63hFX5UcNbA6Lvc+EaUwlAEA46a6Zmuu6K06ye9mrWWSOc99zH3+HuQbei6J
	tk67jhn/MfUnXWKXnMwFCXLE+OVMwYD+Ji5Od1ty/+ZXUkdAFYrV7Oxy52V7yyl8BKUQ/xo0+/yTp
	oPxy4V2625pG67daTY5n5tHC2IxI9CpRlqrM8Xvwy9Wsj1pAslfeROmHs7/gbgE5mB0HltTpB+R3U
	0TayOpl/3sWwv/uUEacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7v0k-0052Kh-Dd; Thu, 13 Jan 2022 07:59:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7v0g-0052IU-Ik; Thu, 13 Jan 2022 07:59:05 +0000
X-UUID: 6cb9bda4e1e84ae8b900523b95879961-20220113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UMcd9MxuWSQfgr0PwjtlgvbvPzm1rluvFR5cWUPCsAs=; 
 b=femvezSqqg0AYDtHcM4Vci97GoM0DBdJgVi66OrErdGEnHYxCW+nx+fz591fNQGV6JICkGRm+RAz26DTdMKtjYbpTYmWHgltHvtLj35bDC30Q32giqPPb6qrsvYLvuRXjMdgkrmj5TVm78OTbOfFfZzAuDCspJK/82xDdD0cOao=;
X-UUID: 6cb9bda4e1e84ae8b900523b95879961-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 860591233; Thu, 13 Jan 2022 00:58:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 23:58:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 13 Jan 2022 15:58:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 15:58:52 +0800
Message-ID: <83670f12a4eda1d8aecde3c0bf225642106d1267.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] mmc: mediatek: add support for SDIO eint irq
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
 <tiantao6@hisilicon.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 13 Jan 2022 15:58:52 +0800
In-Reply-To: <Yd1uJ+dX2CTEJfYY@smile.fi.intel.com>
References: <20220111014046.5864-1-axe.yang@mediatek.com>
 <20220111014046.5864-4-axe.yang@mediatek.com>
 <Yd1uJ+dX2CTEJfYY@smile.fi.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_235904_037339_C5F7A3DB 
X-CRM114-Status: GOOD (  29.28  )
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


Andy, thank you for the review.
But for the comment for 'dev_dbg', can you explain more about that?

On Tue, 2022-01-11 at 13:46 +0200, Andy Shevchenko wrote:
> On Tue, Jan 11, 2022 at 09:40:46AM +0800, Axe Yang wrote:
> > Add support for eint irq when MSDC is used as an SDIO host. This
> 
> IRQ
> 
> > feature requires SDIO device support async irq function. With this
> 
> IRQ
> 
> > feature,SDIO host can be awakened by SDIO card in suspend state,
> 
> feature, SDIO
> 
> > without additional pin.
> > 
> > MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> > turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> > resume, switch GPIO function back to DAT1 mode then turn on clock.
> > 
> > Some device tree property should be added or modified in msdc node
> 
> MSDC
> 
> > to support SDIO eint irq. Pinctrls named state_dat1 and state_eint
> 
> IRQ
> 
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
> 
> ...
> 
> > - * Copyright (c) 2014-2015 MediaTek Inc.
> > + * Copyright (c) 2014-2022 MediaTek Inc.
> 
> Shouldn't it be rather like
> 
>  * Copyright (c) 2014-2015,2022 MediaTek Inc.
> 
> ?
> 
> ...
> 
> > +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> > +{
> > +	unsigned long flags;
> > +	struct msdc_host *host = (struct msdc_host *)dev_id;
> 
> No casting is needed.
> 
> > +	struct mmc_host *mmc = mmc_from_priv(host);
> 
> Perhaps reversed xmas tree order
> 
> 	struct msdc_host *host = dev_id;
> 	struct mmc_host *mmc = mmc_from_priv(host);
> 	unsigned long flags;
> 
> ?
> 
> But hey, why do you need flags?
> 
> > +	spin_lock_irqsave(&host->lock, flags);
> > +	if (likely(host->sdio_irq_cnt > 0)) {
> > +		disable_irq_nosync(host->eint_irq);
> > +		disable_irq_wake(host->eint_irq);
> > +		host->sdio_irq_cnt--;
> > +	}
> > +	spin_unlock_irqrestore(&host->lock, flags);
> > +
> > +	sdio_signal_irq(mmc);
> > +
> > +	return IRQ_HANDLED;
> > +}
> 
> ...
> 
> > +static int msdc_request_dat1_eint_irq(struct msdc_host *host)
> > +{
> > +	struct gpio_desc *desc;
> > +	int irq, ret;
> > +
> > +	desc = devm_gpiod_get(host->dev, "eint", GPIOD_IN);
> > +	if (IS_ERR(desc))
> > +		return PTR_ERR(desc);
> > +
> > +	ret = gpiod_to_irq(desc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	irq = ret;
> > +	ret = devm_request_threaded_irq(host->dev, irq, NULL,
> > msdc_sdio_eint_irq,
> > +					IRQF_TRIGGER_LOW | IRQF_ONESHOT
> > | IRQF_NO_AUTOEN,
> > +					"sdio-eint", host);
> > +
> 
> Redundant blank line.
> 
> > +	if (!ret)
> > +		host->eint_irq = irq;
> > +
> > +	return ret;
> 
> I guess I have already commented on this, i.e. use standard pattern
> 
> 	if (ret)
> 		return ret;
> 
> 	...
> 	return 0;
> 
> > +}
> 
> ...
> 
> > +		host->pins_eint = pinctrl_lookup_state(host->pinctrl,
> > "state_eint");
> > +		if (IS_ERR(host->pins_eint)) {
> > +			dev_dbg(&pdev->dev, "Cannot find pinctrl
> > eint!\n");
> 
> In debug mode of pin control this will bring a duplicate message.

Can you explain more about this comment? 
I don't understand what the 'duplicate message' refers for.

> 
> > +		} else {
> > +			host->pins_dat1 = pinctrl_lookup_state(host-
> > >pinctrl, "state_dat1");
> > +			if (IS_ERR(host->pins_dat1)) {
> > +				ret = dev_err_probe(&pdev->dev,
> > PTR_ERR(host->pins_dat1),
> > +						    "Cannot find
> > pinctrl dat1!\n");
> > +				goto host_free;
> > +			}
> > +
> > +			host->sdio_eint_ready = true;
> > +		}
> > +	}
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
