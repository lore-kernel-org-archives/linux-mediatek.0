Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CEDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Rleh36mrWo5OrcXITShw2jPaIRA5udIBd7E7mLpWng=; b=2pQvSxeAfKrc4oP7Hz0ovH8/dd
	tUGl/sblbdDueDf2a5AcE+iRFoumBvpMzO8QNB1BSFTqadXYv7pvxwIQcwX0X0FiQyhNLD4f9u4Dm
	OvSpPxuVexI+FAFrEcakyCt+NV+4v6vHZtDRdSoOUICcZewB4jlwW0L3k63NOKIAy7bbjNz26ne5u
	l/b4q0QZVc1z+PJbudRpMgfeGAxlqP0o5TLtfZRKKpWybovsysppG2uHXbjLP3FWc+T3bPZOPARdx
	b0Ekj4lwo/ic2myRLLK2p9s3G6y+aYyBdYtTt37OP/7iDINkdMnqdnJUIqw3Caa/FBPm8Gy7QRWJU
	EVrVF2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiGF9-004UYM-8L; Tue, 11 Oct 2022 14:28:27 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiGEz-004UWJ-8i; Tue, 11 Oct 2022 14:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665498497; x=1697034497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tDN8pO8vkYfi7aIzDYMNy5iW/C9igDir6WIyp4TE2LA=;
  b=eH4vEjGN6wYsexT/t6SzLQN0qFJTZ9fs2gKEtkxB0/9OZrnsVN2trhwt
   WUyBnQgLgIQwS5ooiKenqkrs7pZhi3PpgQOXGsyPnwWUVjpHbxyz6FdIE
   Wlcn0m5ApJV+XExm+KU6ziTTklnW4dzHN0qNxsFrf6uor2jo98gIgEDkN
   8aOhEeAgLm1e0eqZXW7bDFei/ykG+EB8rC6UbOBIxy0zMHwszQgZo7Wbg
   f7JaGmT/0QUehchZTtz0FldBPFQFQCCXqRmAkRQoKuNHa5tDOYWsn8qEV
   GOg5o4+iotMifyX21zwF39sJ4akZnB6d2UsPjlBrnzBVNr3l7TT3pq2e5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284245095"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="284245095"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 07:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="628713444"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="628713444"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 11 Oct 2022 07:28:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiGEq-005LfS-1Y;
	Tue, 11 Oct 2022 17:28:08 +0300
Date: Tue, 11 Oct 2022 17:28:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
 <Y0V57gI75ik4ki3A@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0V57gI75ik4ki3A@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_072817_336663_45E28F37 
X-CRM114-Status: GOOD (  17.43  )
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

On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > > > > -#include <linux/gpio.h>
> > > > >  #include <linux/gpio/driver.h>
> > > > > +#include <linux/gpio.h>
> > > > > +#include <linux/hte.h>
> > > >
> > > > Ok with the hte re-order.
> > > >
> > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > to me the way it was.
> > > 
> > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > follow the locale settings...
> > 
> > I have checked, the shell and vim sort gave the same result as in this patch.
> > 
> 
> The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> and that still returns the same result.  That matches what I would
> expect to see given the content of the text.
> 
> And for me vim also gives the original order.
> 
> Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

$ LC_COLLATE=C sort test1.txt
#include <linux/gpio.h>
#include <linux/gpio/driver.h>

$ LC_COLLATE= sort test1.txt
#include <linux/gpio/driver.h>
#include <linux/gpio.h>

I guess this explains the difference. Currently I have en_US.UTF-8.

-- 
With Best Regards,
Andy Shevchenko



