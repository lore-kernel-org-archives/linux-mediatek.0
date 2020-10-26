Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FDDC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:30:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5DC622281
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WzDrfY1K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5DC622281
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xdNO/ZQ7PHLf3ilw4F4dnIXq4/f9DKsCXX9fbO4nUxE=; b=WzDrfY1KAx8tmmt+Sp3uqTEcM
	8BzOw/I6G8hbDPvCgL2uvme2ppaTrq7RyqoyN/4kKUizer93C6oB201PJ6teLiYGT5ZvQjEny+MfG
	qsy6XjFWuH9vA450hxxN6BwQKFpSZNvqqjpESmI2nFtz+/2VognOBQVI5RvQlBCjqf2iv87/3Pkpx
	QetjmDCNyhQS+CK6UplYr4qCmQzB4yQ6r5KXXlpG7KGaikBCZvMvPhFRUqA6U7j3BDgVqRPGLbmy/
	jUMBRWD6yrsjfiBv6hvIwslDkYNn7bCVLjnXpb1PfyYGUf1gMJx1FgZJSrBQjPniOAuoIj3lwidwr
	91zEsQQPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX2Ze-0005mq-Ns; Mon, 26 Oct 2020 13:30:10 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX2Zc-0005mB-Jy; Mon, 26 Oct 2020 13:30:09 +0000
Received: by mail-oi1-f196.google.com with SMTP id x1so2666583oic.13;
 Mon, 26 Oct 2020 06:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=55mmDZwvwfu3pBHO1p8hdZSEV0EaVu21eFAlZpXqlsE=;
 b=Z4I5gFQD1hZOSF0/FOt+10mKwMuVQeoRB4/b+z//KlhflotWCCIfmHBZd5iMVonC+F
 3YkeQ66gB8JwKHvqWpGX+xnmIe8be3iNPgcXnTX6x2Jg5d5tUmK65ZqyuMxzhtK9Qz4S
 40MrULHGbr+FQcEJwy5xnZVp1FFJdj1/ZAxkGzFAUH7IkVU7aEHfA15RMByDBb8u5C/d
 j4nsO20ss9pt4cOcHQRA/KOmA4FBkPtRnglwf2ZOaFyJOETTpTLJ/+uhhY/S/NkAkbuk
 VkMX+W50NliGK5/cBxghsbxTRmvSyAHm6pNXn88j2iaDc3yRHn20aOK9N6Sq2PW2+aj9
 S9gA==
X-Gm-Message-State: AOAM530//ByNTGvxHvwPIbBfmZfl4cq8TZ8/nf+XiRkMC0C4Ea2V8Sxc
 VGbRPMhUg/SaYnAS7Rct7w==
X-Google-Smtp-Source: ABdhPJx0tSc7GtNFGJCgVxd1q41YYXbi/LbclPPEyv6mtyiUIy3cALbdZC5ZrMbTq4kiKwYJvwmytQ==
X-Received: by 2002:aca:e185:: with SMTP id y127mr13913476oig.57.1603719007873; 
 Mon, 26 Oct 2020 06:30:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h32sm3525486oth.2.2020.10.26.06.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:30:07 -0700 (PDT)
Received: (nullmailer pid 32618 invoked by uid 1000);
 Mon, 26 Oct 2020 13:30:06 -0000
Date: Mon, 26 Oct 2020 08:30:06 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 2/2] clocksource: mediatek: add clk13m and bus clock
 support
Message-ID: <20201026133006.GA29275@bogus>
References: <20201017153857.2494845-1-fparent@baylibre.com>
 <20201017153857.2494845-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017153857.2494845-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_093008_997263_D65E102B 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 17, 2020 at 05:38:57PM +0200, Fabien Parent wrote:
> Some MediaTek SoC like MT8516 need to enable additional clocks
> for the GPT timer. Enable them if present.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/clocksource/timer-mediatek.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 9318edcd8963..42e2d2090484 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -9,6 +9,7 @@
>  
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>  
> +#include <linux/clk.h>
>  #include <linux/clockchips.h>
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
> @@ -278,8 +279,19 @@ static int __init mtk_syst_init(struct device_node *node)
>  
>  static int __init mtk_gpt_init(struct device_node *node)
>  {
> +	struct clk *clk_13m, *clk_bus;
>  	int ret;
>  
> +	/* Optional clock*/

Then use the optional api variant.

> +	clk_13m = of_clk_get_by_name(node, "clk13m");
> +	if (!IS_ERR(clk_13m))

And then you can drop this check (or handle it for any error other than 
clock is not present).

> +		clk_prepare_enable(clk_13m);
> +
> +	/* Optional clock*/
> +	clk_bus = of_clk_get_by_name(node, "bus");
> +	if (!IS_ERR(clk_bus))
> +		clk_prepare_enable(clk_bus);
> +
>  	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
>  	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
>  	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
> -- 
> 2.28.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
