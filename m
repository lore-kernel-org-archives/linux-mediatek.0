Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0033CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Rpv7pLZ7ZW8DuHqhgsXpwEat0Wv8FrpCHvkttIvhM0=; b=MAi1kZZI0mFdqrvYs1wxrtFpnl
	ZK5C2rMsYVX0IRRk3ZRY75WQuX8a6D70SoRYG1tdL284Z6XFQYdDmlp0hk/WYV+efL8ZuhW9pPBas
	gh9Ls9/1BZqSs0un4NLtNxmE0P/pDeqMEinxCbQx7Ct3sqE9MJDScElS1cotuo0JjrJ+2/NGKMV85
	8Kh2hQFgRjyD8VhjMbxFs6WCV/JsgzMdRql8NFCS0O44ClRGVNCV/BI6PaKalKEt72q7pAJrwS1HT
	W+ePdwNcGfSjEi1YzCghWOoiB7vnUPvTM+5SuA74Lp9zsuGw1DqCTGItKkHTzc/jTYyfq486ymZDo
	RblRY/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okllX-006cB7-03; Tue, 18 Oct 2022 12:32:15 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okllL-006c7K-38; Tue, 18 Oct 2022 12:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666096323; x=1697632323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=679yrLLfz5kJkADoDvJtXHkNCdTyNEeZjUBrx5uh7Gg=;
  b=X7IKGcoJjIBaQCxoOEvI/OEg3aMXzvhnTNAVyT0i+kXGdXUzjH63BOmk
   0Qpv5qnLwOE+cxhDWnSxouKQO58uMAm7UEoaBq6Hhj9ar23VIb10YqOCf
   MPCQ52B8DVqwk3as6DHiPQVgy+1gfljdslxS987k3yIXys8QCYuV45j8o
   2KypPNE3G4VwmkrGaWjx05lTZyIMDb75Gd+gRmaf1XUgwbC8aYs7AyX9B
   RhCyXjM9M7EixQRkh3nxyINGj54CrwR7dcikk7TLAT7wXnrI0tGcVs3GG
   npt8IXryVS5tiUdX6Qoxk0LFQYbx/L4cLNumQwfuZGTUjOcsOKEJyPov6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="285810342"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="285810342"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 05:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="733605367"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="733605367"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2022 05:32:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1okllG-009M9O-2Q;
	Tue, 18 Oct 2022 15:31:58 +0300
Date: Tue, 18 Oct 2022 15:31:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 00/10] gpiolib: more quirks to handle legacy names
Message-ID: <Y06cvrpcHn0jwZxU@smile.fi.intel.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_053203_172193_4998EAFF 
X-CRM114-Status: GOOD (  18.08  )
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

On Mon, Oct 17, 2022 at 10:41:01PM -0700, Dmitry Torokhov wrote:
> In preparation to converting several drivers to gpiod API, and to keep
> existing DTS working, this series adds additional quirks to locate
> gpio lines with legacy names.
> 
> Additionally the quirk handling has been reworked (once again) to pull
> all simple renames (ones that do not involve change of indices or other
> complex manipulations) into a single quirk with a table containing
> transformations. This should make adding new quirks easier.
> When using legacy names gpiolib will emit a message to nudge users to
> update DTSes (when possible).
> 
> Note that the last patch requires the following change from the OF tree:
> 
>         88269151be67 ("of: base: make of_device_compatible_match() accept const device node")
> 
> The change is also available in mainline - it has been merged in 6.1
> merge window.

I was wondering if we can use the approach that ACPI chose for itself,
i.e.  the separate data that can be filled by the corresponding driver
and then GPIO OF common code may use it. In that case each driver knows
the exact list of compatible strings and associated quirks.

-- 
With Best Regards,
Andy Shevchenko



