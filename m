Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C904FA373F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/1QsP0hsT70oKJN6+h5TtodoxkV9YN38i7uu4UVbsM=; b=pbnbihnPetoHxFwRrmC/XUiYFr
	LQkLUXXgJPKWm0NmXj8DtzC8BTYBHCFTRO6irgQ4DfXLiAWT0bZD7KtjQT8Kl5tCl0vyizVenLurE
	DKXtK3M04zfcKE/vFKWaq35mcCCnnQSUDIexDScKXBA+3p3QAq+QukFnlW846ytWUvo9i8w+yOgAX
	J7acAqh6QUxiwolEAmR5PT+l1KkAJl7GpGl7J3h70VGD42Mpu40N0AI3zDBWT+exVTg6Vk+Ac0kJT
	ac2UfwU1+u9AMv438twnpMOKMaq7XWZOF5FET0MzK41vNIfAYJCCrwg6cwNfioAU5NaPMgqC/A+YC
	bbqsoeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3XQ-0000000Fbml-2iEV;
	Fri, 13 Sep 2024 10:28:28 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3WK-0000000Fbb9-0XBH;
	Fri, 13 Sep 2024 10:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223240; x=1757759240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TrwaSnGSZr2bfjo3SWe2U7AL25TlCBVEkrZRf6lgy8A=;
  b=iO75FJDiOU9imPJqYvx05WtFszyJy0NZyfMyzxmBBz1bv4ZNt2T2qfro
   nwphJXJSRN5LuU2gAsstjkgNxYy8NdgD9eUPGuIwz/ZfZlj/6uvj1Kroy
   pW5ViF0AeMCbOEwgZLQhwg1HuPUHJS0lDrfIot8ag9YqzA3arLvggZgj5
   4V0DUg0U2wfqIaCSyn7qG0MMkcwkrwTmzGxU34a6ydqUzi18jyuOyxrMY
   UGrcC1f6xnadUvQWGyO9BcHwY5elBxcAEl2gmciOulLB2JCH4HTMNjGCw
   19QmEUkx7sYHh4/LFjmRA4wGzGfFcq//uUQthrx/MIpxp2ALFZmjE6fvv
   A==;
X-CSE-ConnectionGUID: OXjrG9NSQZ6YO1wrBkhT+Q==
X-CSE-MsgGUID: Df4oh0IERG2Al1w8dbuHoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28863701"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28863701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:27:18 -0700
X-CSE-ConnectionGUID: oXOdqqt7RNywTmc/BAEEVQ==
X-CSE-MsgGUID: wq3nQX7HT92g5GEvSvGEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72813103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:27:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3WB-00000008GC9-1PTf;
	Fri, 13 Sep 2024 13:27:11 +0300
Date: Fri, 13 Sep 2024 13:27:11 +0300
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
Subject: Re: [PATCH v7 03/10] regulator: Split up _regulator_get()
Message-ID: <ZuQTf0MiktCGAELP@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_032720_238697_49CD75CC 
X-CRM114-Status: GOOD (  12.20  )
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

On Wed, Sep 11, 2024 at 03:27:41PM +0800, Chen-Yu Tsai wrote:
> _regulator_get() contains a lot of common code doing checks prior to the
> regulator lookup and housekeeping work after the lookup. Almost all the
> code could be shared with a OF-specific variant of _regulator_get().
> 
> Split out the common parts so that they can be reused. The OF-specific
> version of _regulator_get() will be added in a subsequent patch.
> No functional changes were made.

I think this patch makes sense on its own, but it of course up to Mark.
FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



