Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58909C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 19:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maWcCiNgGMMG4rUYtNG4atxIuJX6ngz35Pk0M1RrSM8=; b=VHVTPfySmLGdZF
	FZz9gWT5l515oqX5FUgUspG79bLLYyoH6njf28VYlw/d5zTN1xZyYZOjHj9F3AXnkt9HHhjvlb/iJ
	5hmfquHx2JCEg3/HCYXEjmXduaGY06ToNdqRfU1n33Br91CStcG2ZVLeka8mpwvFafTq6qR51T4Rn
	+dzeNO2AE2H+nSkGilTGBTpHixEViQMg+eeGnEhfm1glpZ4TuILCtKWE6rYcBaJe4Or3X73JhWL03
	7tWQSngGD7Dpda3JzrXzuJpFMcIH4xPfJWMyK8T/k7jlSZLqf7Ac+YMwmhY/rd47gU2kgBdWCUrKW
	2835irg+HwmYkpuVH8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAGxI-0078Rz-Ew; Wed, 19 Jan 2022 19:49:16 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAGxF-0078QC-7B; Wed, 19 Jan 2022 19:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642621753; x=1674157753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b6hbTfgj+fQHgPfsGt8652Hu8ggXWoxy8VkobZmzJEg=;
 b=fp+CMIhUqgMsN3Dk56OjY4cLDlSABvJ0868kdzL0e0/zBelWfvkRxIpw
 YVptkJFBL9u+9kba1tPVQLxP1NiI9z4uxFliBhMvMcxmAFL4sbfkQO5yW
 jN9h1bTsfWqIq+V9R1UrGbtrk7uQGJX4InRoFzHd50QYTV4HyQbLsQrz3
 RD7EPhRUNRJD1F18rukR+dI9aOw6FyF2nFXwLIHx9DMNNoLlf0pFhLI9b
 PN9gE2bZeuW+gTtJDQspfmKyDoNDxchbA2neNY2DigXerrsRmgMMWbkcQ
 MvfslZLzt6n6WbNrW2q++YyRx/1yIk1oFuWMPvp9ylTR662oLu23ATUPG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="308515059"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="308515059"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:49:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="622642667"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 11:49:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAGw0-00CEvS-JK; Wed, 19 Jan 2022 21:47:56 +0200
Date: Wed, 19 Jan 2022 21:47:56 +0200
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
 Tian Tao <tiantao6@hisilicon.com>,
 angelogioacchino.delregno@collabora.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>
Subject: Re: [PATCH v4 3/3] mmc: mediatek: add support for SDIO eint IRQ
Message-ID: <Yehq7L36yfJ8D/j2@smile.fi.intel.com>
References: <20220119103212.13158-1-axe.yang@mediatek.com>
 <20220119103212.13158-4-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119103212.13158-4-axe.yang@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_114913_370355_EEC6B3D5 
X-CRM114-Status: GOOD (  21.31  )
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

On Wed, Jan 19, 2022 at 06:32:12PM +0800, Axe Yang wrote:
> Add support for eint IRQ when MSDC is used as an SDIO host. This
> feature requires SDIO device support async IRQ function. With this
> feature, SDIO host can be awakened by SDIO card in suspend state,
> without additional pin.
> 
> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.
> 
> Some device tree property should be added or modified in MSDC node
> to support SDIO eint IRQ. Pinctrls named state_dat1 and state_eint
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
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

The submitters SoB must be last among all SoB tags. Please, read Submitting
Patches document carefully.

> Signed-off-by: Yong Mao <yong.mao@mediatek.com>

Who is they, why their SoB appeared here?

...

>  /*
> - * Copyright (c) 2014-2015 MediaTek Inc.
> + * Copyright (c) 2022 MediaTek Inc.

This doesn't feel right. Why did you remove old years?

>   * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
>   */

...

> +	desc = devm_gpiod_get(host->dev, "eint", GPIOD_IN);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);

> +	ret = gpiod_to_irq(desc);
> +	if (ret < 0)
> +		return ret;
> +
> +	irq = ret;

Since both of them are local variables and there is no specific use of the
returned value, I believe it's fine just to

	irq = gpiod_to_irq(desc);
	...

Hmm... I was wondering if you can use fwnode_irq_get_byname().
Ah, it's not (yet) in upstream.

...

>  static int __maybe_unused msdc_runtime_suspend(struct device *dev)
>  {
> +	unsigned long flags;

Can you keep reversed xmas tree order?

>  	struct mmc_host *mmc = dev_get_drvdata(dev);
>  	struct msdc_host *host = mmc_priv(mmc);

(it means to add new variable here)

>  	return 0;
>  }

...

>  static int __maybe_unused msdc_runtime_resume(struct device *dev)
>  {
> +	unsigned long flags;

Ditto.

>  	struct mmc_host *mmc = dev_get_drvdata(dev);
>  	struct msdc_host *host = mmc_priv(mmc);
>  	int ret;

>  	return 0;
>  }

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
