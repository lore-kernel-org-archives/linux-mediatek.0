Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2F7CAC58C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a57dqRojQ5ZwDkbLdxwi9CCCBvYs9uVbR8wSnb6tTHE=; b=4JvdnBDbxp/nEt6NWuG6OfRBin
	mo27ucHBfIC8F/4spA46cPWvdMgyfQXZcTw66Ud6FrarzhUnIKemX0r1KIXWCVwcUJ8gPOvotq4Rm
	mF9Id1ZLhneRwKrB3Qj36PGX6tWMYOZGfa9fa7lznhSu2h3I/dSsj+B7cBpLrIrTRz1RKbKCceJmp
	VO45SZzVvN4zY175QOHGs+2wbAU006XnvT8YwwjxtUMOnDsp7dSLXvQlOUfVEqqAcr0Xr6UjxtLDG
	V5qlYTxDaYFFPoh0uTcwWjN6xMDqpyFnoDEg90fv7rvy+y6z6S1oCmMjmRetCQub8r+g/CXM5oJLg
	pgDfNv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21D-00000008wQJ-1ucI;
	Tue, 09 Sep 2025 17:20:35 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyvw-00000007ai9-3Jmn;
	Tue, 09 Sep 2025 14:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757426577; x=1788962577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PyP1a8xmh42gYWEndpBNTjWqCkcaPl/QUUp6gJ3BY2g=;
  b=TA5GwGk0KkWwqpxCnmqfwNwI1uRICTO7Xlvy6EJrD4qS8j06PcEpLfk2
   KjfIBtW9lt3Dpz+NqHicyv/BATMFIsar/nNz6CZp9G+2Oo/UD7lE3lVJV
   uj2D94JQ7jmq9sXy6NtZ3qydDOgjO1vZquAS/al5h+1yXygtWbRoWifGT
   tkrVB4FyZcXzjOIzXJWXpDqJd/vYpvEaMvOhvUfLNc7pcE2lA5vp0q4P0
   SAQUS9iyD+YhJJCqEYQJDPhFB294N9Su3goLdMWlBfpXudPLe/vS7ruQh
   foZK16GpgpwNTunGa40N27kqPQHVNWQkVw7jE/rPOjKdxEQ9C4ljhxsoH
   w==;
X-CSE-ConnectionGUID: tv0np2gQRRO+X5KSlIEotQ==
X-CSE-MsgGUID: wimbDSy0RH2KnyxBJ9s0Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59637911"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59637911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 07:02:56 -0700
X-CSE-ConnectionGUID: EuRcTEMrQAmZQt5EaJp+DA==
X-CSE-MsgGUID: WWEJI342Q1WIfol7oak04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172685288"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 07:02:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvyvF-00000001V3U-0RwC;
	Tue, 09 Sep 2025 17:02:13 +0300
Date: Tue, 9 Sep 2025 17:02:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Message-ID: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com>
 <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_070256_903009_465163A2 
X-CRM114-Status: GOOD (  11.92  )
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

On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 9, 2025 at 3:47 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > TBH, I think those 6 all made the same mistake, i.e. thinking of the compound
> > literal as a cast. Which is not!
> 
> What do you suggest?

Write it in less odd way :-)

foo = (struct bar) { ... };

> And are we not allowed to use C99 features now anyway?

It's fine, it's not about the C standard number.

-- 
With Best Regards,
Andy Shevchenko



