Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxn3fovJbFp79sGwRjoKjz40CE3OTKXMoCiq4xyx6a8=; b=OCJAVoUCBjte/v
	EfxNxkOobq+1MdvXrMg7xyhhBcObZ6+jByZdJSINaKeSyeHcU3de8AntZzVXmlAk4575Jutd0WoLI
	cFEIvA05/XLm8WWnv3A+OG0j7NEc0RxfNU3iQbw2wphhNRHPYPXLeyChuXAq9/t3/wX7QWbAIOZoz
	lX3AH/dNFn0n9dtoSsRPUfNbXdvj2BV8Ni/DXcmgN58p/yYxoZCJlQ1X5Lmrz/ZzNjsAlTKbzwyuk
	7xQP3R5c2hqq+Rx1VRNwC8thEE59PhuCIpjsFZX135InagYT5/JRSR3dqoaEMk7vuYqChb82M6Olb
	zvbJGZ1LpVjShsCy33Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6bk-00GEia-28; Thu, 27 Jan 2022 15:22:44 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6bU-00GEcy-TI; Thu, 27 Jan 2022 15:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643296948; x=1674832948;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VuKbH3kWAdwpcevHZKsh6LuPUBEA54hne+chkbg+oBI=;
 b=oCbz9tv4o+yzSACs+7QHinJKcbi6AunybZFNg9nZ4t647Oy4ohNm3ZSx
 sU1h4THFXozwfFRvdCz35vgFX/ygLbxgDsAvDxkZbxd2/Lxx11gM770QL
 IVqqz1bhpJzfeIEUGyrKjiHhs0Hs/mvY4yY+Ijl9wQNVgfUvJnxb8+wKQ
 Dcpn+QZANheKXoRk+iqTH/lpubQsUSWaHmvKgYAKPtZAzsqtAxCw/Qe83
 tKH3ekbyDnzhwKqzHt1Nhy2Saw8BSd/YMa/aDAjiZz57Y3LC2QZGfZpI7
 wkbAH3JVa0jbgJDzAma0/0v52o0m/Jcbc9aV2WOnGM6hxGwx6laBvGkz3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="227555645"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="227555645"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 07:22:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="696686312"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 07:21:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nD6Zt-00F1OR-Lf; Thu, 27 Jan 2022 17:20:49 +0200
Date: Thu, 27 Jan 2022 17:20:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
Message-ID: <YfK4UcuCfF7JfI7H@smile.fi.intel.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
 <20220127111526.3716689-3-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127111526.3716689-3-mkorpershoek@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_072228_993298_CC7BA99D 
X-CRM114-Status: GOOD (  14.18  )
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

On Thu, Jan 27, 2022 at 12:15:25PM +0100, Mattijs Korpershoek wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch adds matrix keypad support for Mediatek SoCs.

Some comments which may be addressed now or in the follow-up patch(es).
Up to you.

...

> +static const struct regmap_config mt6779_keypad_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,

> +	.reg_stride = sizeof(u32),

I'm wondering if we need this when we have reg_bits = 32 already.

> +	.max_register = 36,
> +};

...

> +	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
> +		     (debounce * 32) & MTK_KPD_DEBOUNCE_MASK);

I'm wondering if << 5 is more specific to show that the value
is based on 2^5 units.

...

> +	error = devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disable, keypad->clk);

You have this long line...

> +	error = devm_request_threaded_irq(&pdev->dev, irq,
> +					  NULL, mt6779_keypad_irq_handler,
> +					  IRQF_ONESHOT,
> +					  MTK_KPD_NAME, keypad);

...at the same time you may reduce LOCs here...

> +	if (error) {
> +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
> +			irq, error);

...and here.

> +		return error;
> +	}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
