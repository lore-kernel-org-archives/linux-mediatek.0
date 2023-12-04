Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787CBC10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stA+FMH5CBJo+8X/c9AmmtIaulIDzgpBtKqOxrxQHfs=; b=km69vPXeai5Z1gn5Xqc7QW5Jtp
	IdgMiXrkrSMjo3duQb6bNEQbOmXsfwVA/31VsxCxGOOpFrFHs/mDUbqVErS9ZgguqBMcKVO6zNw/A
	hZzu5sa4wPm1J0tTQSJElPbfyntECTHj2gVL1uf1jj6FfNQRoS2xuSWK082Q8tIOaX5IApy60pgoY
	ePYmgXQ3EKJ/2fpx+9mDVm5UuNWy3Vlrh9xanxtn7lhnWT5h/tR4+G876/bztUt4MAbhHlORLw4/d
	fcpMkVQtU+O8WdbW5b22C9fbcLcEVg++nYrpn1nvOUuqdOeLXIeXRM0lN01u8LxWXR2OhenqO1gmR
	frcDP02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAkY-004w5u-0x;
	Mon, 04 Dec 2023 15:20:46 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAkU-004w5H-32;
	Mon, 04 Dec 2023 15:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701703243; x=1733239243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qEhcxASuizJtM7lcwqFFlnnisGnpfIA8jp4KVzQJVnU=;
  b=UdbzLsD6y4RmtRc66lTrx8ZxfgozSrnsf1S/7VfdBDnLRnjMyZnhPbM9
   ix/EkRf33DM/wTe6nT2lWzWb2TD9Ij+zb6d1RBead9qx/ck4XZtNhUO7e
   FtoGmObgGxx8D3jOTR7oVNH3lidobj2fl14aYKoswcDOsBPvig6rs/Bhq
   ViaYlNa57e+0rZnbrUcQr6EowgCGWFH4+WyVLjTaWAknSxsFDE6GHp1FP
   v8aVrr4OPKVEr7nZDc11qmqvkxH8YPP4HdSl/FX2bQCTn9RrBfklxYtT5
   xqWq3gubB84gPM/7yUG77Qus+19PfPsS9qK1ti60yiwRRGiRJYIxNmKjb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="15293973"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15293973"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841086629"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="841086629"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 07:20:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rAAkK-00000001muJ-2OQO;
	Mon, 04 Dec 2023 17:20:32 +0200
Date: Mon, 4 Dec 2023 17:20:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, sean.wang@kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: arm: gcc-8: drivers/pinctrl/mediatek/../core.h:211:21: error:
 initializer element is not constant (struct group_desc)
Message-ID: <ZW3uQFWeogUhwuA9@smile.fi.intel.com>
References: <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
 <ad6afb94-e221-4adb-a942-af59f5d7b92f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad6afb94-e221-4adb-a942-af59f5d7b92f@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_072042_993126_382F0A01 
X-CRM114-Status: GOOD (  16.93  )
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

On Mon, Dec 04, 2023 at 04:11:11PM +0100, Arnd Bergmann wrote:
> On Mon, Dec 4, 2023, at 13:08, Naresh Kamboju wrote:
> > Following build errors noticed on Linux next-20231204 tag with gcc-8 toolchain
> > for arm and arm64.
> >
> > ## Test Regressions (compared to next-20231201)
> > * arm, build
> >   - gcc-8-defconfig
> >
> > * arm64, build
> >   - gcc-8-defconfig
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Build log arm and arm64:
> > ------------
> > In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
> >                  from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
> > drivers/pinctrl/mediatek/../core.h:211:21: error: initializer element
> > is not constant
> >  (struct group_desc) {      \
> 
> This apparently comes from c0c8dd0a7773 ("pinctrl: core: Add a
> convenient define PINCTRL_GROUP_DESC()") and following patches
> from Andy Shevchenko (added to Cc).
> 
> I also checked different compiler versions and found that the
> new code works fine with gcc-13.2.0, but not with gcc-12 or
> older.

Thank you, Linus already dropped problematic changes.

-- 
With Best Regards,
Andy Shevchenko



