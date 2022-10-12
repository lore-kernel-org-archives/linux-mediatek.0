Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2BAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+XC0o/Plp/xNIpjDbJNdUHcdlF8eXV//fvx4EMxcgI=; b=jguLEIucuW7PZ2FBcj23p0I+73
	BfvFfd/lTmzMiX6mDFY4olOVcziea/LZVNhRIRqoDJ5mpXBWMfh9MRVm96EUWtVx80MQnQjqtjhd1
	RFwShpkwPGZXii8WAw+dEccAPBS/Eun8uPMVfNRlVd2wtA1HONLTZtp4DHBK0h4AlkOKGBX2P4plg
	f4eBEe5ksMKXVWwlsEd0xwcguLEt0v2wqNOQ3R6otEEGnshNaPB+A9t8pMuKTMKgR19wPdiDC7mB3
	BfMy+IsvQMzCTG/dDc/wPzmHq62sJMqqeE1yXEbXyOyP7bVdaW3GfVNFJB0XYUujqTJfFV4pVA5z6
	cCpsPTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibog-008By2-42; Wed, 12 Oct 2022 13:30:34 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiboN-008Br0-Oo; Wed, 12 Oct 2022 13:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665581415; x=1697117415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tV/ZvJGYw4mf000OleNKwCzv+JZQjAKj+4wcxHqkOco=;
  b=ZBQy9cLxZEYf6ipbM+i5e1QUWaVw0TwqFLAThFamFphnPRvkFmbyXM7Y
   RIZMWkMDyIuPLZ93OpdGtjLqfOnGcgjOuRF9ynCJmhrR9U1fhu15GA97D
   q3pVBpfUq7YA4dsvPSnKq7vUfDIPgTiTQJFLNe50BdURcO8BJlaoJQvTq
   hostlSwkqQ73sqY+zb52glZp/Cis8UMAkGTiAa8VSK7Lywfx4wrepS/lC
   1KRe064a9aVoPZ+NAQUmj2JTRiRI5NV4ONyT1QbANjiyRL5ikkedMet0m
   N8uIIdUdrvSDR3wxXZHpfGvbDTU0eBHbvELMUeMhfP+76re++Ethc1cfM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="304779003"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="304779003"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 06:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="626766256"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="626766256"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 12 Oct 2022 06:30:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiboD-005qlS-1e;
	Wed, 12 Oct 2022 16:30:05 +0300
Date: Wed, 12 Oct 2022 16:30:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0SyVwjDl7NGfTPn@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_063015_850618_6D583E6C 
X-CRM114-Status: GOOD (  12.75  )
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

On Tue, Oct 11, 2022 at 08:01:27AM +0800, Kent Gibson wrote:
> On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > -#include <linux/gpio.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/gpio.h>

> But moving the gpio subsystem header after the gpio/driver is not
> alphabetical ('.' precedes '/') and it read better and made more sense
> to me the way it was.

Okay, I will move it back.

...

> > +#include <linux/seq_file.h>
> 
> I wasn't aware that we use anything from seq_file.
> What am I missing?


Eventually I can answer to your question: the commit 0ae3109a8391
("gpiolib: cdev: add fdinfo output for line request file descriptors")
is what you are missing.

That said, we need this patch.

-- 
With Best Regards,
Andy Shevchenko



