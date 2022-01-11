Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4968CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFqNpvtWvB/AN0BrddzS0THZO0RPzeIHIPJK3N1uUQo=; b=Xpz96NyqJs/Uj9
	Rt+rcMjAN3I/BBCp8MsrkUm/vGPiybqR3iLtIzK5uSj0LdA/qQh0YTrQqQTJdXa67yVOdXjiiE6Hc
	UsS1q195yUKGCgQ5bxbtGqR0ZKqiAlR+qGL8rAvx9dI7YTz0grWww2RAGmsJubFYJ/dJqNpUFuPVR
	vNvL+i7W9JKmW7pIq7p+L+JhJLkKwQZo9jNFJPgqOxxyLsxKVvP2oLnfL9IyJl05U7XBwcTGy8P8/
	jczPL3hb16XvECVuLnIUWVac7U8EVC4Z6CBc9qRwu3NZPKRvXfajNP9AQ7zK2FFrake7JHglO1RUQ
	hXcahQG9gxUeeDuJMWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FdU-00G73Y-UI; Tue, 11 Jan 2022 11:48:20 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FdI-00G71x-Mc; Tue, 11 Jan 2022 11:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641901688; x=1673437688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JuYmIBkvpvdVhi31jq6e1BbQrmM5iNvrfA4jT6YwXCQ=;
 b=cNivgiFt2A7qge6l1u3Wi6lCAsZHmEvyS5ss+jDuwz2EskVrEBAnUjil
 QmAEBFP38XTn7BSNIYqf/qGWuusADKHW/usPKnnHvzKMU/unk/bKtC1C7
 U4zUvr9P4/p4/X7ne5rn77froT1t/iyk5D5Y9/WMcZnRQpTCBMGKZz51R
 x2oXV6t71FMO+kR6fbf0Nzoe+DJo3lWZu3ZsACQpVnAPAIYCOmoCj9ZeJ
 axgOgZVNLXU04m2y3hZDoGbp+EHaNRk9Gz/yeG6W9jltYfgTkd/OfIPEQ
 iGEZWU9EfTYPURUnDFwsvqjcP2TzDqLch9S92FfyfhUQTGRXy5cUA79Gt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243421332"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="243421332"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 03:48:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="490353874"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 03:48:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n7Fc0-009D0g-4e; Tue, 11 Jan 2022 13:46:48 +0200
Date: Tue, 11 Jan 2022 13:46:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lucas Stach <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] mmc: mediatek: add support for SDIO eint irq
Message-ID: <Yd1uJ+dX2CTEJfYY@smile.fi.intel.com>
References: <20220111014046.5864-1-axe.yang@mediatek.com>
 <20220111014046.5864-4-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220111014046.5864-4-axe.yang@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_034808_819326_C5415A82 
X-CRM114-Status: GOOD (  23.78  )
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

On Tue, Jan 11, 2022 at 09:40:46AM +0800, Axe Yang wrote:
> Add support for eint irq when MSDC is used as an SDIO host. This

IRQ

> feature requires SDIO device support async irq function. With this

IRQ

> feature,SDIO host can be awakened by SDIO card in suspend state,

feature, SDIO

> without additional pin.
> 
> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.
> 
> Some device tree property should be added or modified in msdc node

MSDC

> to support SDIO eint irq. Pinctrls named state_dat1 and state_eint

IRQ

> are mandatory. And cap-sdio-async-irq flag is necessary since this
> feature depends on asynchronous interrupt:
>         &mmcX {
>                 ...
>                 pinctrl-names = "default", "state_uhs", "state_eint",
>                                 "state_dat1";
>                 ...
>                 pinctrl-2 = <&mmc2_pins_eint>;
>                 pinctrl-3 = <&mmc2_pins_dat1>;
>                 ...
>                 cap-sdio-async-irq;
>                 ...
>         };

...

> - * Copyright (c) 2014-2015 MediaTek Inc.
> + * Copyright (c) 2014-2022 MediaTek Inc.

Shouldn't it be rather like

 * Copyright (c) 2014-2015,2022 MediaTek Inc.

?

...

> +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> +{
> +	unsigned long flags;
> +	struct msdc_host *host = (struct msdc_host *)dev_id;

No casting is needed.

> +	struct mmc_host *mmc = mmc_from_priv(host);

Perhaps reversed xmas tree order

	struct msdc_host *host = dev_id;
	struct mmc_host *mmc = mmc_from_priv(host);
	unsigned long flags;

?

But hey, why do you need flags?

> +	spin_lock_irqsave(&host->lock, flags);
> +	if (likely(host->sdio_irq_cnt > 0)) {
> +		disable_irq_nosync(host->eint_irq);
> +		disable_irq_wake(host->eint_irq);
> +		host->sdio_irq_cnt--;
> +	}
> +	spin_unlock_irqrestore(&host->lock, flags);
> +
> +	sdio_signal_irq(mmc);
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int msdc_request_dat1_eint_irq(struct msdc_host *host)
> +{
> +	struct gpio_desc *desc;
> +	int irq, ret;
> +
> +	desc = devm_gpiod_get(host->dev, "eint", GPIOD_IN);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
> +
> +	ret = gpiod_to_irq(desc);
> +	if (ret < 0)
> +		return ret;
> +
> +	irq = ret;
> +	ret = devm_request_threaded_irq(host->dev, irq, NULL, msdc_sdio_eint_irq,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"sdio-eint", host);

> +

Redundant blank line.

> +	if (!ret)
> +		host->eint_irq = irq;
> +
> +	return ret;

I guess I have already commented on this, i.e. use standard pattern

	if (ret)
		return ret;

	...
	return 0;

> +}

...

> +		host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
> +		if (IS_ERR(host->pins_eint)) {

> +			dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");

In debug mode of pin control this will bring a duplicate message.

> +		} else {
> +			host->pins_dat1 = pinctrl_lookup_state(host->pinctrl, "state_dat1");
> +			if (IS_ERR(host->pins_dat1)) {
> +				ret = dev_err_probe(&pdev->dev, PTR_ERR(host->pins_dat1),
> +						    "Cannot find pinctrl dat1!\n");
> +				goto host_free;
> +			}
> +
> +			host->sdio_eint_ready = true;
> +		}
> +	}


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
