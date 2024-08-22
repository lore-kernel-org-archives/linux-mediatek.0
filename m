Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC69CC52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJPx8cFyB+Lc5qDoDiGVXWVhhvLCmqXlFPDH880gfQE=; b=txFVP8F07qNxvpjDCGR/IRLzoM
	0Jr0zgNblWG433FAwCfn+AWBgxI7S8LlhQWWjPpN5iIfXdCKP9tjU4y7wHEjnxz8mfK6Vs6hEMR/k
	HC1kBRyyCrx17hyCg/xJvf+fmJKr3r7Cry5xafuGfethHcFA7Owek6ITTpsXB1LQA91TERmk+JWir
	I3vjZ9mIpHX/KpWf2eyKnmrdtSb09mM6r+OWeKcqU0/bKb6wYEaJ4h2PBZjODGVLoWZq9twIsrefj
	Cys+EyD9iuFOFSvHJ3hMv/DQIzzDwrkoBgfK0oFceevOobrCGEedBad1m4QzSQ2XDUCbYkfZ8z0P9
	ICBCX35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8Ax-0000000D0sc-0hY2;
	Thu, 22 Aug 2024 13:48:31 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8AA-0000000D0bs-2gKz;
	Thu, 22 Aug 2024 13:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724334463; x=1755870463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gERz56/N7TCq6I811PLRHpo7iVU0CMV6axNB79Zx+8Y=;
  b=INGK0nNUOoWqpvN31n15YwcrJRuUhl9+Rbf+999Vv2emnTaCiPPqIxzz
   cV0hnwiKVQZYgg/x0pUh8mV6JgobDMZaBAvoE64DuNKWTBwTZPqoPyiW5
   8nFvPmDZu4z7ewO1M6iLqKOKPXqCMF6+l6Y+92JjQF8TYaDXs11R0xhew
   zBhtjyjOPop+06lB8bHpQbjMgWH3YvL5XPzLrJLhq533mT/FEX6L5FVJ+
   jA+N7GriZCp7ORdMuKp68pm/poM+ba6uXiHs6gsS23SWdX0PHCvNdq+FH
   faFyyps+59hZfg/suVcj2rPfrHx/z69men3EyrMWfakbosO6uYloY5cNQ
   w==;
X-CSE-ConnectionGUID: 5mz9RSoZSlSKCTdTWt38bw==
X-CSE-MsgGUID: G4qbOnfzRdes53FKKYs0hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22903156"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22903156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:47:42 -0700
X-CSE-ConnectionGUID: 6BZ2mrHpTuKonItbJ9JQUw==
X-CSE-MsgGUID: Qmx3MU8CSxO5tx3hGOy4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66132920"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:47:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8A2-00000000T7v-0IEx;
	Thu, 22 Aug 2024 16:47:34 +0300
Date: Thu, 22 Aug 2024 16:47:33 +0300
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
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZsdBddTDuvNasHNq@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_064742_747326_BEB04F75 
X-CRM114-Status: GOOD (  20.88  )
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

On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:
> There's still a bit of OF-specific code in the regulator device lookup
> function.
> 
> Move those bits of code over to of_regulator.c, and create a new
> function of_regulator_dev_lookup() to encapsulate the code moved out of
> regulator_dev_lookup().
> 
> Also mark of_find_regulator_by_node() as static, since there are no
> other users in other compile units.
> 
> There are no functional changes.

...

> +/**
> + * of_get_child_regulator - get a child regulator device node
> + * based on supply name
> + * @parent: Parent device node
> + * @prop_name: Combination regulator supply name and "-supply"
> + *
> + * Traverse all child nodes.
> + * Extract the child regulator device node corresponding to the supply name.
> + * returns the device node corresponding to the regulator if found, else
> + * returns NULL.

At the same time you may fix kernel-doc warnings (no "Return" section) in these
three (on your wish you may fix others in a separate change, but it's not
related to this series).

> + */

...

> +/** of_regulator_dev_lookup - lookup a regulator device with device tree only

Something went wrong with the indentation.

> + * @dev: Device pointer for regulator supply lookup.
> + * @supply: Supply name or regulator ID.
> + *
> + * If successful, returns a struct regulator_dev that corresponds to the name
> + * @supply and with the embedded struct device refcount incremented by one.
> + * The refcount must be dropped by calling put_device().
> + * On failure one of the following ERR-PTR-encoded values is returned:
> + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
> + * in the future.
> + */

-- 
With Best Regards,
Andy Shevchenko



