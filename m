Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9394CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwEfdm4q+wfr0l6mlGCoktTiJUKUaRM/VZwyRBPBIlI=; b=y0tiNzlqRt8YSHYd70M38/yB6H
	XkXFN77Pbg/RAiEqNcN1JRC9ZnHDOap3RN9PrZq5cqkpxrEFgDzG0t5gl/hq4BVPylhptoYoV1d/d
	V3+3vk1ApzwlxLQHlXX+RplJd79KZZ+NA+/3tD85fO3K4DZLKoCdMSNcWtAbAvF4BPzTwtJzwUlCi
	lUJnzC+11SzAjXAWTaTP+d2EEvJrhtB8s2sVLht3ALUhD+2RYZh77Jk/swS9Vde/pD2xcHWZu6IzJ
	KyRVLi7C6LT/uTVIeRmwV6QYTQf/v0dKMue+KVYgiItUXHXyAqctJGDxxfFGVG4g9HseTcsjgwCUn
	5CpI8PWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqJ7-00000004cA2-2Bug;
	Wed, 04 Sep 2024 13:44:25 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqGz-00000004bTq-2QlH;
	Wed, 04 Sep 2024 13:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725457333; x=1756993333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NINj+1oq4hrfppG9fWwkMRuDXoIUekzuXgqNElLQs0M=;
  b=ExMSmYtEjiTuTRLZRzTjdiRp1iqMaRKxxr+CZJBn9TOMALh7LjWIqB3i
   UWbAqTpTf+CTWIuwPWOQlAGujo0xYqfCOk1IOjxKABX+z5bZt1s7xbwQX
   um1ZDH6Tcb+5267BZC1dUD92ovPe1m3kjWdv8vm0VkkhtJfrZguYJqzME
   bl3bGiesMXzGGIqpWJr8wkhHocaWdg69r5cw8N3LglnUpxxjU3LYDN5ip
   rK5UiWdy9iNZrug4ZARsnVbXj69E5kRVnAI64qOgSYB3uziWYSm1CLpAZ
   X8sj2UIfHRmfbSogYe/UZOuNU75mbwdTh1tt1HN/YEnaj6MiykraymEhd
   g==;
X-CSE-ConnectionGUID: DJaBRa1AQki+2fGE0ior8w==
X-CSE-MsgGUID: KOjqhJ2qRUC+7pzxL7T/sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24070508"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24070508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:42:12 -0700
X-CSE-ConnectionGUID: 9OjySTKyQw6NDxzamnIErA==
X-CSE-MsgGUID: 0+LQUU0fQKa5kG2MyEgvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65618042"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:42:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqGq-000000054o4-3OEs;
	Wed, 04 Sep 2024 16:42:04 +0300
Date: Wed, 4 Sep 2024 16:41:36 +0300
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
Subject: Re: [PATCH v6 07/12] i2c: core: Remove extra space in Makefile
Message-ID: <ZthjkJwtpz9gU9hI@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_064213_689476_3F18C82E 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 04, 2024 at 05:00:09PM +0800, Chen-Yu Tsai wrote:
> Some lines in the Makefile have a space before tabs. Remove those.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



