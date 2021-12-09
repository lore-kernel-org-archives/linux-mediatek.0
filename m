Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4408FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 17:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPzbP9C7fXAa9rMTmeILxIWLQOuf2PrB7o3f4Nl9Ifc=; b=uNpaokj5r7sbnS
	2clPsrCPkMuS2ZUNJHJS3idtjjEETvhvYdUBGnsdgt8N+Neo0rk4Ecd3wD7ggvEZMph8ZBZ+t0Nx5
	wSBTqepmflXq0WoGtJ0iUM+UPAjrLYc7iSTIcnaO0/e86jv8u2zhPggGjnYF5uAO5RU5Zk2bGj267
	wbzKhxzBKjSfRUBoWdHv6kUT7teXLEBJ7PnyZSdbjcX1GlL+mrewGiPTx/RNZwyYxQnb6v+X3hMnf
	SGdUt85+FGn5bVYhcwU6WwwMYDv3ISLCMrEFsEzoaXRaKHtny5Fx+na4D3aQ3CGhZ3WRTDrUNoMMR
	PQTUKJBNFa2O1IEH6asQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvN1K-00GurK-To; Thu, 09 Dec 2021 17:15:50 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvN16-00Gulr-Az; Thu, 09 Dec 2021 17:15:37 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="324419347"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="324419347"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:12:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="462215498"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:12:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mvMxT-004BEu-Hb; Thu, 09 Dec 2021 19:11:51 +0200
Date: Thu, 9 Dec 2021 19:11:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: Sort Kconfig and Makefile entries
 alphabetically
Message-ID: <YbI411MeojRNlc2+@smile.fi.intel.com>
References: <20211209113456.33977-1-andriy.shevchenko@linux.intel.com>
 <YbI2Xb7gBfN4Kyid@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbI2Xb7gBfN4Kyid@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_091536_419064_9AEAE118 
X-CRM114-Status: GOOD (  10.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 09, 2021 at 07:01:18PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 09, 2021 at 01:34:56PM +0200, Andy Shevchenko wrote:

...

> > v3: fixed more grammar issues in AMD text
> 
> I have noticed that you applied v2, thanks!
> Do you want me to sent a followup that fixes AMD help text?

I sent a follow up, do what you think is better (reapply v3 or
the mentioned follow up), thanks!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
