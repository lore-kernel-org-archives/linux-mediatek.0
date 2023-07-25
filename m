Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCCCC001DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=763j7V/00Nxjo+RTtI4xDX/AjPQ4mlcsjWOYTOBfaN8=; b=I7pay4oRZAhld7wRwEITSqAOVV
	9cCLw/gO6Ea3HCPP+Fy0e1EFb5Jl6uYRv1/B08eS0Y+bugz6s+FEqCNiMmQjxclXYpzyMAxaY7D9D
	Bril46b6clAi0Pl7gWBABzK+DYAOobIBl6YSORVFyCyO/VvAG8KweiPgp7yel0uQvtV6PxNl11iyU
	pwvlfCVTABprHwOr47vCXh+DiyrlEA1kLF68U/B4hAEttB+OizOMx/J5TfqAXHvGyyMsmMAZJxDCS
	f3nPT62t5csDhoJNspXFqvwpry6e9ZbQhvo9cncOXIxKtnbDwpnrO+qPbpzBR4GAtlZx16L93BrmX
	y17au7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOI2w-007dBh-2m;
	Tue, 25 Jul 2023 13:25:50 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOI2s-007dAW-1t;
	Tue, 25 Jul 2023 13:25:48 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398633747"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="398633747"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 06:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="839864648"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="839864648"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2023 06:25:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qOI2l-00BM3E-1h;
	Tue, 25 Jul 2023 16:25:39 +0300
Date: Tue, 25 Jul 2023 16:25:39 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com, brgl@bgdev.pl, linus.walleij@linaro.org,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH] gpio: mt7621: remove unnecessary call to
 platfrom_set_drvdata()
Message-ID: <ZL/NUySYJnOrc5Qs@smile.fi.intel.com>
References: <20230721130838.26616-1-aboutphysycs@gmail.com>
 <ZLqf6P22HC0Dd4G5@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLqf6P22HC0Dd4G5@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_062546_636903_D8431410 
X-CRM114-Status: GOOD (  16.30  )
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

On Fri, Jul 21, 2023 at 06:10:32PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 21, 2023 at 04:08:38PM +0300, Andrei Coardos wrote:
> > This function call was found to be unnecessary as there is no equivalent
> > platform_get_drvdata() call to access the private data of the driver.

Not true.

> > Also, the private data is defined in this driver, so there is no risk of
> > it being accessed outside of this driver file.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

I have to withdraw this, the patch is wrong.
NAK.

Sorry for the confusion (I have looked for the wrong pattern).

-- 
With Best Regards,
Andy Shevchenko



