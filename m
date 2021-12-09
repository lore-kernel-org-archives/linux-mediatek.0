Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952FBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yo3l3Iu9Y2SRw/pMrhx6gaqJXHD/S4MM4c1oNcSs8XU=; b=h8CxXWJl3B29Ep
	MlUWC5nu3x2kOXDZ+2w1+u+tLd7esUzc0582uG0YQoTdfC4v8afX94Gz0aLB3kySwgxx6aSvTCEjH
	xNjTeIkWw60nWIcJNiEY7FT4nPlpWgTHdBLdWLwfFE5Sjz2dUpfHv020Ro+F7wvSqViZYPVk1Z76N
	5NyxKs+fbgsIiBeqs/MN4J/PkHq7I+EksBCWoB05uON5L4IcunkOYJyilSnLkBSLAcGwG8tAx6IRK
	oMHv+xiMs3UVBOgAaS+4gQ5L5ew5nWxSE9gG8qVZ21Z8HsXCw7VP2AwbjnXmDod2wyM2VE4lLYdo9
	df70i5s0Xjwe0E+MYPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvHOM-00FkVE-A2; Thu, 09 Dec 2021 11:15:14 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvHO3-00FkLg-SQ; Thu, 09 Dec 2021 11:14:57 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="238018913"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="238018913"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 03:14:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503453271"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 03:14:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mvHN1-0043tW-Mv; Thu, 09 Dec 2021 13:13:51 +0200
Date: Thu, 9 Dec 2021 13:13:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Sort Kconfig and Makefile entries
 alphabetically
Message-ID: <YbHk7wenlrhlizCA@smile.fi.intel.com>
References: <20211208092049.20792-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdb2ZnH7gi8TAQ_8hvbaAw=hqBZBjQftPOtyNMLR+c541g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdb2ZnH7gi8TAQ_8hvbaAw=hqBZBjQftPOtyNMLR+c541g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_031455_995325_67307A91 
X-CRM114-Status: GOOD (  15.07  )
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

On Thu, Dec 09, 2021 at 03:34:59AM +0100, Linus Walleij wrote:
> On Wed, Dec 8, 2021 at 10:20 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Sort Kconfig and Makefile entries alphabetically for better maintenance
> > in the future.
> >
> > While at it fix some style issues, such as wrong indentation.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Nice! I tried to apply it but I was queueing patches from other
> unreviewed threads and creating misc problems.
> Ideally I'd like a patch close to the merge window,  but if
> you rebase this on linux-next (or the "devel" branch in my
> tree that I insist on using) I can try to apply it again anyways,

Sure.

> we need to take the hit at some point.

v2 just has been sent!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
