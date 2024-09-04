Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7829CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHcwXAqDREi7D8HOPiIOnjfm+8S6YqXaux8R37jAQWU=; b=Fp3hYJQPJYHh5uLVO8CUve/2fD
	jaOip1ip3z15cHywNjtR/ej3lOWTIpAQ5M8YwLXD2z8Ci4AqFaPcmKNGnELyYduhANN8af9JnOXPx
	XpD+guD8XvrN/SDv1MCQIS/fmURQohtRVkoiR2kTw7z057PFgbGlivOb1V65V5JcPdxpF2FBpaJmu
	uSHxlbgsZE6mvLkbX96mKoDH5vdWHHhFZYA0qwQidExFcO7TuBfM57t4Ik0IeT/ONx8Du/noZImdx
	qQ+Po+l7MSwXJGFtPxcJr4A/Qeo7TNVLQUL6K6jBmZ76/pcZFpNSoEJALmSxaU5+WMFWq3+raWU9j
	P0Uu80uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqIB-00000004bsB-17ii;
	Wed, 04 Sep 2024 13:43:27 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqFQ-00000004b16-1gf8;
	Wed, 04 Sep 2024 13:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725457236; x=1756993236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+X9BbS+Ny+x3K1rDq6+5DqeLuJotN8s3i83EQ+4fy8=;
  b=E0kX0R7QLwNSVPQUNC3r2NhEaI0OlClNZirt03H4iAntjCUbLZUx6q9u
   1KPLUXfjbOQEOe7Eacc0QITjjwFNHHs/ulIJLSTTIpYSTYmZY7A/1PBrD
   6iF0aZnXUMztf44XG4oQ0DzQeNvAq05xZpxjeAmsWDfKlwnTsdIl6sS+/
   P6Uzys0E90VDyDDMu8ngqTW15mkd1sjgGJnT5FZCEFdgL34SVkX8L9PfB
   yByzJeqQsLKlFW/JL5Ekk+5+/3koGDC37NyzsUIVY1Y2B7E60hjVi5QdH
   oSpCN5XUhAu2kodyIE3egTSV2QoCUr0wjBwgPj2yln1oMCAICQY0ZZ9R+
   Q==;
X-CSE-ConnectionGUID: LaHOe7afSpyCIjnW/JBZxw==
X-CSE-MsgGUID: j0WFAPucTTG6+rM8OE9aRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24273799"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24273799"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:40:32 -0700
X-CSE-ConnectionGUID: Y21Wb7DAQuuM4Kja5IT+hw==
X-CSE-MsgGUID: FZl6wWkYTIasBVxJwoLAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="69692115"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:40:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqFF-000000054n4-0TIS;
	Wed, 04 Sep 2024 16:40:25 +0300
Date: Wed, 4 Sep 2024 16:40:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
Message-ID: <ZthjSK9N9z11YXi2@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_064036_483532_6782970D 
X-CRM114-Status: GOOD (  21.67  )
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

On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:
> The I2C device tree component prober needs to get and toggle GPIO lines
> for the components it intends to probe. These components may not use the
> same name for their GPIO lines, so the prober must go through the device
> tree, check each property to see it is a GPIO property, and get the GPIO
> line.
> 
> Instead of duplicating the GPIO suffixes, or exporting them to the
> prober to do pattern matching, simply add and export a new function that
> does the pattern matching and returns the length of the GPIO name. The
> caller can then use that to copy out the name if it needs to.

> Andy suggested a much shorter implementation.

No need to have this sentence in the commit message, changelog area is fine.
But if you wish... :-)

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

...

> +/**
> + * gpio_get_property_name_length - Returns the GPIO name length from a property name
> + * @propname:	name of the property to check
> + *
> + * This function checks if the given property name matches the GPIO property
> + * patterns, and returns the length of the name of the GPIO. The pattern is
> + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> + *
> + * Returns:
> + * The length of the string before '-<GPIO suffix>' if it matches
> + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> + * -EINVAL if the string doesn't match the pattern.

Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel-doc.

> + */

-- 
With Best Regards,
Andy Shevchenko



