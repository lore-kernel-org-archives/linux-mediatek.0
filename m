Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0661CC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkwsXmghgJOjo9kyImySZM5XLEaBoch6Gqk2fOQTcMM=; b=cSn65Gc113bZ/k+hLkzVsoIu6t
	nEFDE2a7rd7mXC+/lB++IEzf2PgCpKt1Ad4nhqXEBTUuWjV33JUQUxUXsooHCiqqeOsjYzqqNPfQ2
	h+SBJvZy5vHL6og5FMjRgiAtYWm7kfmGYX1ij6QeUGh8qn9YHG5zzpjhx8esoSIc7xXEV3daqYM4Z
	lSgEXOvA4YskK3Bf/67tfydymJH4mXaMGRdfxACu3+NQxoSO3X8gpLIHY+yU1Xa1gS6li8sA2eE1t
	9aStfm7S9cL7UY0PIsp0THtOaT0qbMe9esnB+amsoMW4iNW/3ImEQc08OPo7cwM7sG5ghFyszy2Jp
	WbSuYIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhTG-00000007tnK-3TDt;
	Fri, 22 Mar 2024 16:10:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhSq-00000007tay-1N4v;
	Fri, 22 Mar 2024 16:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711123793; x=1742659793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuGiQISoVKHBaZbLIVHnraYHHoAO1WEtkqCEo2+zeaY=;
  b=cVysgCUjthGXsXESrmm6GvwBx3Ubd3mW30jUrr6yqd1d+PIwUoQCDscs
   szlw+EIeVIN9I1FabCKBUzlt7qLnfoKqfL3QmxnBsRYiRwkbH68qs4BIL
   cweH4b76wwphHndDsgb3NIOzIr3Gy6iiZT6RASzNib6olEPHxKyzUNEbe
   7mIfLJ44yc13Lq4JO4SpcUMa2RCk5teisaG1D0rf3e8gmw4HZ78EuIcFV
   l1v1dnGAHPTA63f77HJ5tk1UKfXBm+62cp1lGSX8j6s68CJ9qtzChnPWz
   /a8hOhJsRS2f6VZjn4LDg+MS6qlODy/6wTTfPh2EIO2SWPAcW3q8SG4lO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23634252"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="23634252"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914747988"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="914747988"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:09:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rnhSi-0000000FCTj-1lkG;
	Fri, 22 Mar 2024 18:09:44 +0200
Date: Fri, 22 Mar 2024 18:09:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_090952_514740_4A494AA1 
X-CRM114-Status: GOOD (  12.73  )
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

On Fri, Mar 22, 2024 at 02:25:57PM +0100, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.

...

>  static const struct i2c_algorithm at91_twi_algorithm = {
> -	.master_xfer	= at91_twi_xfer,
> +	.xfer	= at91_twi_xfer,

Seems you made this by a script, can you check the indentations afterwards?

>  	.functionality	= at91_twi_func,
>  };

-- 
With Best Regards,
Andy Shevchenko



