Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C06DC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXOOHyoxUqctoRVkEDAoHJjfXaPLdEr4gdXpjHZMdnI=; b=R2hpAWk7TQzuvFlAnsJO+WLmvJ
	Kxb28wfQBBdZ6GgSsRUBoux5U7c84OvUAGUCYBoQlo+lSbhHIEvscMSYnXur/VSyy6BYGW1AnWCI3
	HZGdC9hHmd9F1P6aQoucutn+hKEHOw0k5fTafHpbXc43CWi1/MRuIoHv+oYNWfiM720aUvRa06NR+
	bPJdH9uUGDW/bU2yF/ZwA/V0NsIx1o9zENYViqtzk1bHiTiD9QUJeWrlYaJiUU2ZDhPpfJFEH+8kL
	94ZP7p1O+iy3ZtRPyv+2RBQtsRlW6XEKH8S23dxH6FnwcYSvudNctohH4QS+fsQVHEiAHHR8wYjZK
	MKxSd5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80P5-005k9o-22;
	Tue, 28 Nov 2023 15:53:39 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80P2-005k8U-1A;
	Tue, 28 Nov 2023 15:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701186816; x=1732722816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sEPbvoTt9M7AzxsulQ/KXP+SKFVRFBlAEP7wQyvf3hM=;
  b=HEw8adtIQQJu+WNF9UmwWSjSKq6sDkXozC/svoHZ9Zm71aoE8ARSn+LB
   sbcgio0qapQa7+lpDlkPi2Xtg9T65nb0+y8yy9NMjwNwNlQsgrKX9UAJM
   J1qYhHngfKHKe/k1+oPp6bU4Lqte5OI/d37LWXwpXRxvZzBYh/psDRo5g
   xXObImz2m7bGWRlT//Fhqu21C5c27W0KNcLGhxmHllg5RCD2ip1p15ac4
   YmDe4lpEWozkjCIbtc1pYardYidxgvwzdJtucLR8XXL3+erhP2F7Q3df8
   2pvc6+Wm9lJgpsWtChtuZgjHuE5KfHWRJEWcLTJVqsakt1LV1LKEqGwO0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383336618"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="383336618"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772352569"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="772352569"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:53:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80On-00000000CZZ-06Ld;
	Tue, 28 Nov 2023 17:53:21 +0200
Date: Tue, 28 Nov 2023 17:53:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 12/21] pinctrl: core: Embed struct pingroup into
 struct group_desc
Message-ID: <ZWYM8Pjl-S-8CMPu@smile.fi.intel.com>
References: <20231123193355.3400852-13-andriy.shevchenko@linux.intel.com>
 <202311250448.uz5Yom3N-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311250448.uz5Yom3N-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_075336_463167_17D65D21 
X-CRM114-Status: GOOD (  10.84  )
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

On Sat, Nov 25, 2023 at 07:39:02AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:

> [also build test ERROR on linusw-pinctrl/for-next next-20231124]

Hmm... I have compiled tested on Linux Next it several times, I can't reproduce
this neither with GCC nor with LLVM.

-- 
With Best Regards,
Andy Shevchenko



