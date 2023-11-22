Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EEDC61D9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1llURtEeiXVOu8VYlaDqtKVEcAPxiOFUx67gWDK0hY=; b=bZSXUj5dD09kNOJRSZzb04YhTD
	sloUx9350cBV3z3MJJbL6IQzeCVeFYspq5kVrRpHAsXO7DitFpT/TsWiaWhQzNYJHD5j9mfnqje0T
	nuyOIJcM1p68WbCZxAaZ44fa6ZfQ6VCcLeYCB0QaxdkhbqJ4O3+GR/SNCGg1ZJlE1PuKvkvOihX1J
	im6a2iLm7Nae0grjOGCF32JBJBom0iTUlpCr70RHZ2GqGcQAisbsSoUGQq/8fFiNLQ9kSkD1kX2eP
	2NxvT1Es0KWq6Y+g05ZwWCjmlz/jdJRRKLMgFQeZQ/oceCclVGblj3Cfk9jyzB+t3zSkUt2fta0XR
	AXPVu2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kDD-001On7-09;
	Wed, 22 Nov 2023 10:12:03 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kDA-001OmR-2C;
	Wed, 22 Nov 2023 10:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700647920; x=1732183920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gaoHnn56Y6+Ub/jBzpLAMFS55DafKsAcyZeW1d0lVsw=;
  b=Vy/PvN9bqZv/GE+x34VsMewd/2zzZkyPIKPiWfgbyJhHymI2tZZPAPyN
   YcTHPrL8/ZE4tkPr21g3KwJZ3bd2n4fa0H/O4LMDVkDHgYsOxElKlArWr
   Z2/basAKSqKGNuBkmWqDTc9KKTPeWDJ3WotJz5qTnZ76Xl3gYbnHpUgHO
   5MYTNkCEXGKkrcwsTcNxzc4NiyaSqxuUiooCz+iMCQfE9kOFWQvXF1a+W
   R+TI3LcOzuIFijzjbRlTEFGC5FcciHjuh/vvWXOX9qPineNcbgd6wpubZ
   WAWe0IMnjq/DR1ybPzDlh0om/ZNzFR/JzfmbmgweebyFo4KDdZAcL6hZS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="371374804"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="371374804"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884546050"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="884546050"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:10:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5kBP-0000000G3iF-0D7Y;
	Wed, 22 Nov 2023 12:10:11 +0200
Date: Wed, 22 Nov 2023 12:10:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/1] pinctrl: mediatek: Switch to use no-IRQ PM helpers
Message-ID: <ZV3TglMV4A43OVnd@smile.fi.intel.com>
References: <20231120171754.1665539-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120171754.1665539-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_021200_729261_8D7EF5BF 
X-CRM114-Status: GOOD (  11.55  )
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

On Mon, Nov 20, 2023 at 07:15:31PM +0200, Andy Shevchenko wrote:
> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.

...

> +EXPORT_GPL_DEV_PM_OPS(mtk_eint_pm_ops) = {

> +EXPORT_GPL_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops) = {

These should be EXPORT_GPL_DEV_SLEEP_PM_OPS().

I'll fix it in next version.

-- 
With Best Regards,
Andy Shevchenko



