Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD50EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8G5ZfoZXu9l/wmdbX8XZKYgu7V2C5sjK+7N0KTELTk=; b=zt0jn3Qrx7YYqTiGJAR5RCx2/J
	0mywzX7SPkb1EmRClA7oVJ1PeBWcOve68pUBRUfzPwAeKxblvHQVVntfckO/AcubV5sANT0y3VnnO
	HZuGEQH4uHKBHEU2dXS8cckK7lFTHjlbTvLi85JdEjWyq9E8rsUyGZq8woy63wtrctEDK1GjbswMw
	3F+gVqvYZb0vZlyyVnPsuuF8Hj0KVrOHHBPWv6nrPe7ziTSQ8WVJFAaBuw/aluevVFRpzPnG4xaY3
	/0uuZUCaizZUPf707JTayoK1CLnbpH/aJ7tUA5UBIV+nDrNRNN/c98do2+oGdaYsFy2Wz8dIYyqzV
	zn0LRwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZdS-007nLd-F5; Wed, 12 Oct 2022 11:10:50 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZdQ-007nKM-AW; Wed, 12 Oct 2022 11:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665573048; x=1697109048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q7v71ZQ6SrTwwIFCLSZGjWB6QaC6SnhQ7675+Q8eeQw=;
  b=hMiNp/XyHrOhe/M/mqhucTwIs6m/rLJCPdgJdpM3QwatWRqS7XsaQQ3K
   TmhCpBzXssRgd/gz/NkJFZ7AZaQbIip5JTR8RPUg0b2kGk+JaFPIojgt/
   dFgEF4K6dBqUubfpUsn4D/PAQB9cmWaY0ksqtJ153Nanj827GqPsvLd8N
   PW9qD7IhTYf482KVZN9civjizZ9oEj6VzfL9MJlbUOA6o6fuy8j/+b0Yg
   zvnL9qFGyn+4TngfsnO8ss+zFPgyy3jV+PI5YHUMw96BJflIBzYccJpdd
   68wG6X8LcuJAjCkRyBZOB5QhVzQWP6E4RROTzXMxHSHaOzg1swDwyaq0v
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="302376685"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="302376685"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 04:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659892843"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="659892843"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 12 Oct 2022 04:10:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiZdG-005nZ6-0q;
	Wed, 12 Oct 2022 14:10:38 +0300
Date: Wed, 12 Oct 2022 14:10:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/7] gpiolib: of: factor out code overriding gpio line
 polarity
Message-ID: <Y0agrWGm5CR3Rk5e@smile.fi.intel.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-6-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v1-6-e01d9d3e7b29@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_041048_393366_BC7B0593 
X-CRM114-Status: GOOD (  13.90  )
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

On Tue, Oct 11, 2022 at 03:19:34PM -0700, Dmitry Torokhov wrote:
> There are several instances where we use a separate property to
> override polarity specified in gpio property. Factor it out into
> a separate function.

...

>  static void of_gpio_flags_quirks(const struct device_node *np,
>  				 const char *propname,
>  				 enum of_gpio_flags *flags,
> @@ -145,7 +167,7 @@ static void of_gpio_flags_quirks(const struct device_node *np,
>  	     (!(strcmp(propname, "enable-gpio") &&
>  		strcmp(propname, "enable-gpios")) &&
>  	      of_device_is_compatible(np, "regulator-gpio")))) {
> -		bool active_low = !of_property_read_bool(np,
> +		bool active_high = of_property_read_bool(np,

Defining

	bool active_high;

at the top of the function will save you a few ugly indented code lines here
and in the next patch.

-- 
With Best Regards,
Andy Shevchenko



