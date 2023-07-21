Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E439EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NOK9r+MEc5HxDRXe9MS6XVu84aOCndhJ1grbyvne3E=; b=CDWqJUjq5KH6fBtpaVv9dIO3IV
	hJ8R+4W6XKxuWXhr/WKqodneQa+acGMdhlQa8+X7gsjK7rkRyefUZp8g4+wSlk53D0G/eoZwCw/X5
	FKjeg1xqauJvhm2FCBGNLNvB0/PDF6mZ3V0Gs4O0m9yIhQLYAH8APD9fTZL8k391u3H4oigV01pw8
	P/gpI0GefeUc1OkSTqghJK2b4Eh6iGdYUIBtaH1Trp4mzs7/Vt6JbSqtZvu9vGf3AOGnd41o0jwvn
	cLI9iRm2vqajzM0HbH9LM31l1E40BGgRZXPoreVpNoAaNIyRtP6qj8e45YZ37nOnmybALsFiuS4J7
	dXRwVp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrmE-00EOWT-0u;
	Fri, 21 Jul 2023 15:10:42 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrmA-00EOVH-1x;
	Fri, 21 Jul 2023 15:10:41 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433276974"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="433276974"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="814992250"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="814992250"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jul 2023 08:10:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMrm5-009lZN-0J;
	Fri, 21 Jul 2023 18:10:33 +0300
Date: Fri, 21 Jul 2023 18:10:32 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com, brgl@bgdev.pl, linus.walleij@linaro.org,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH] gpio: mt7621: remove unnecessary call to
 platfrom_set_drvdata()
Message-ID: <ZLqf6P22HC0Dd4G5@smile.fi.intel.com>
References: <20230721130838.26616-1-aboutphysycs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721130838.26616-1-aboutphysycs@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_081038_732145_9089759C 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, Jul 21, 2023 at 04:08:38PM +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver.
> Also, the private data is defined in this driver, so there is no risk of
> it being accessed outside of this driver file.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



