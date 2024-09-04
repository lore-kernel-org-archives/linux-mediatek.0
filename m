Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7FECD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VIQJeUFbvmRQ0CvXtf2igDxWubCtc2ZBNfFt9cnZR0=; b=vKjidtH6Hd3JOItNt17CBx5YVP
	mR8ZGi0dxqwbsnanIl51og+dWuDTdK1jcdGwGHVopLBmuqXTkYeCN12DPGFL6XGx8S9uYoY6QYlM+
	5/YWjMNJJj5Qx5SMFk0HV75K7QHnTw6pK4jonGi3ppVAJTIe9uQrXFwHwgSfRK6QUUNn+nDh3q1wU
	D0kuYyYnCDPY8wVu7LwVnCg7xmAbH+Og9vSWZVEu+Vq+JssCULKSsuD7IpZaO2LlI/ScO+Ulfu3xa
	eYr+pOdjFvbqZm2Nyxy/96eGTGS4B8Q9JIe664Ows+h+tI6LPkhjQrQF+qVL8Opc7MfoImsmSEF4S
	Do1voFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slpgr-00000004TNg-2cJ2;
	Wed, 04 Sep 2024 13:04:53 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slpfu-00000004TBW-47MP;
	Wed, 04 Sep 2024 13:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455035; x=1756991035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lb17jyW+/eBb159TT79zQOd3wYy8PCRTcs7fuozS9Zw=;
  b=amMPTUsRLfNBwMdXb6flq9mMN5YnWo4TwXgE8E1kak4RbCDPjSuGSEP7
   FEUsi87uvr5mEBn/MsQFdXFW5uXc+jG5m1CglH+7AIxJ4CFJPpUxN9Jap
   kLoGYryvmLgr+9zzIbVazjvtiIzilQVvgJiBOfkHTukRsyhVhEmdGM6Pf
   Xjqq7CD9qDAHUynQIP69DljrTdnT2vz8hcRoFt4nfNjpfBMRjUHT7lT/T
   ptgrbYPTZVKBjErbgI+AyXYZR/JRgv8U834as8PN2u899YWFfnPATms2u
   feEER/43b3rNtHpaJvx92rJHD42ejzyfu69CimKLmgv2CXvbugeGWuEwG
   A==;
X-CSE-ConnectionGUID: FMVvb9uXS/iUeWpJTeRU8Q==
X-CSE-MsgGUID: Po15FY0tRPKKdRCnDdj8tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23676497"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="23676497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:03:55 -0700
X-CSE-ConnectionGUID: uJ0/BKc7S2uY7qJd8AsSzA==
X-CSE-MsgGUID: 5z4Z2P36S9KLE1W2boxnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69670390"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:03:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpfn-000000054F5-1ejW;
	Wed, 04 Sep 2024 16:03:47 +0300
Date: Wed, 4 Sep 2024 16:03:47 +0300
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
Subject: Re: [PATCH v6 02/12] of: base: Add
 for_each_child_of_node_with_prefix_scoped()
Message-ID: <Zthasx8VNCw_yj5q@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_060355_055629_838E34F8 
X-CRM114-Status: GOOD (  12.14  )
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

On Wed, Sep 04, 2024 at 05:00:04PM +0800, Chen-Yu Tsai wrote:
> There are cases where drivers would go through child device nodes and
> operate on only the ones whose node name starts with a given prefix.
> 
> Provide a helper for these users. This will mainly be used in a
> subsequent patch that implements a hardware component prober for I2C
> busses.

...

> +#define for_each_child_of_node_with_prefix_scoped(parent, child, prefix) \
> +	for (struct device_node *child __free(device_node) =		\
> +	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
> +	     child != NULL;						\
> +	     child = of_get_next_child_with_prefix(parent, child, prefix))

I'm wondering if we may drop _scoped from day 1. Yeah, probably a bit confusing
as the rest of APIs without that suffix do require reference count handling on
the loop abrupt.

-- 
With Best Regards,
Andy Shevchenko



