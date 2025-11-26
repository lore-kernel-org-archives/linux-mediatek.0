Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC31D1118C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTzSgWiz+ksWM/3sebFO5tfl1UhGLkjsrlxpVbtwCJA=; b=0j9DPxH2dq8/jKmIwGamEufDes
	neWkUlku1M71k/ga8QL2GqrFkjHA0ku3u5U+9dvKPnWxD3WsCGeclHTLUUU+8gWWqbK+MiZNafO9a
	84Ip9QoHMIAaH52T5pXJ9VlDaGS2Ijt5ts8Q1Egk2z8/kUk8ku4ZbbhJyqfXrjgXdJRZoh5j7eVQ4
	xQhXRLaJHNZe1NR7eWJdzlhk2+K9qSdKGXw5QX5f/yJ4h2gz8NzIWt2ksK6w6c2RHJNMqWCM5mOs8
	gNdOcFZ9mIxo/rTeqAuI84elB19YIaC+l0u+E6joiuhZHnVPVs86GaR9julmIOOg0TGDOHKFbVXPW
	+lxd1zGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJus-0000000FTAR-23fV;
	Wed, 26 Nov 2025 18:06:58 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJun-0000000FT95-31nc;
	Wed, 26 Nov 2025 18:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180413; x=1795716413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jj8WUTEqL7QvdCd8iQY3mdeC7Yp4r4T7oSOKPInFmKM=;
  b=Fdnrno60hLKaYtAhf3BlTzMfECzSXmj3jpIkCoNEw/d8NJguH7AdWDBt
   RrqBLm4u51dlmGDRQcigE+groDM1I2oJ6ZBDQJ78NhRXSn9/LyUmFpCuc
   SnxDeBqV0HLqtY06vGya4kRbx9SLPNgozi6HOCy14k5kJhb+3qnS0DXpz
   EWPP5lo6nusw8oaz8KNjw0xAg+gG0LlTakDCMmb7pOd4SFN/GDyK8tffu
   xdG6W9gPDz2mH8etCAkJTbEths+tgRnxZZ/kM75eRS+rat1mTvtpRi974
   BuYWKuphJPkQ0Ow+l+LkVS4m9FZ7Ft7mdg0HHMa7vO+LieebqZVsNrXza
   w==;
X-CSE-ConnectionGUID: doR0/gXFRqG02WdkyMKnEw==
X-CSE-MsgGUID: 7h//wanLSg+oXk9suSF7bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76550447"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76550447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:06:52 -0800
X-CSE-ConnectionGUID: u6MYmWlrQDOKXyHhNm56hw==
X-CSE-MsgGUID: bArNWwrLSt685F6MVj/PFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193094093"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 10:06:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A0C9EA0; Wed, 26 Nov 2025 19:06:47 +0100 (CET)
Date: Wed, 26 Nov 2025 19:06:47 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lei Xue <lei.xue@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	yong.mao@mediatek.com, qingliang.li@mediatek.com,
	Fred-WY.Chen@mediatek.com, ot_cathy.xu@mediatek.com,
	ot_shunxi.zhang@mediatek.com, ot_yaoy.wang@mediatek.com,
	ot_ye.wang@mediatek.com
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Message-ID: <aSdBt937C6Cjj_8s@black.igk.intel.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-2-lei.xue@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125023639.2416546-2-lei.xue@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_100653_800011_FD67D55B 
X-CRM114-Status: GOOD (  13.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 25, 2025 at 10:36:34AM +0800, Lei Xue wrote:
> Kernel GPIO subsystem mapping hardware pin number to a different
> range of gpio number. Add gpio-range structure to hold
> the mapped gpio range in pinctrl driver. That enables the kernel
> to search a range of mapped gpio range against a pinctrl device.

...

>  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>  {
>  	struct gpio_chip *chip = &hw->chip;

>  	if (ret < 0)
>  		return ret;
>  
> +	mtk_pinctrl_gpio_range_init(hw, chip);
> +
>  	return 0;

We have a callback for that in struct gpio_chip. Any reason not to use it?

>  }

...

> +	pinctrl_add_gpio_range(hw->pctrl, &hw->range);

Not sure if this is needed.

-- 
With Best Regards,
Andy Shevchenko



