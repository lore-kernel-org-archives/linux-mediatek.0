Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE8FFD4F19
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 19:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+VRYmjKjhhBwQJNlVzstz52ORkPEilAeg4NoVyuM3c=; b=LdrnrQLJRhjxV7wO1yVw/M6TXk
	hd3/HXUlu1DyeZOW0ggtaNpXYFrP19PaNQLoy7Pz17KZeK6wqMbvSpu90LFOwEw0QwvGKo6uxqY+P
	lE42jfPlV+/9WgFYkb5/L8LMmIMGLDrch3lP7m1er7FqueOuphL+ou9jfit7Ncoyo2855bAwqZOcG
	ra9howr8QGhoXclQAMfYgvQjpbiR5s8Ox2wanXaVXzbnG3RjXtEdF0YS1E8kJKER9/e7hdPpkaPC8
	3wMay8SkKOd7Iz7rrXAd6vEQCzmmzr8/zRj5Mmpf6T5aAJyGg/NKT2XjBnTYsmDfVvk+ae9HkCiJf
	ZpWcGSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02bD-0000000AAa0-2WS9;
	Tue, 10 Mar 2026 19:18:35 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02bB-0000000AAZY-0IhN;
	Tue, 10 Mar 2026 19:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773170313; x=1804706313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xcdQ7ftwUAonmlIubDJUO2exQTONEx2whkAN5AV9mXY=;
  b=b6HNWNRn9xN6zqV3f9lTpEFQ3YavurSZ6j4t4UYWt5xGBzKKkkwJasRQ
   1LUp7zhRAlUMo9N6jhepsNSJsOOCU3XhoFRX7r29rJBuDWayZQDBSEnOh
   NlMwx+t7qpmvplRDz9sOUA2WsREZpzIx8QTzODQs8ukZYVgDANZlpn5TV
   vCy3C09GcM48wGhmy90T1nhnK4pZY6KGT9x2yJVY7Ud0ZPw4LA+vq/LPx
   hNJXz6fO4BmB92mXDlfmFW8HR3jA4LkGrk2W8QuiW589TM47iZ7Ep827G
   LZxCU91MoHGIeLBaYzZLM1DotxeYa2psV7Gwxd/EoGyv0cBoUwSO81Ou/
   w==;
X-CSE-ConnectionGUID: 1JW5V0uiTA2mZ/fl4I+hug==
X-CSE-MsgGUID: J8Xrv+C+SI+ev7tn1VK+WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77833325"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77833325"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:18:32 -0700
X-CSE-ConnectionGUID: 1b+o1Bi+StapWP0nj7nQpw==
X-CSE-MsgGUID: i7vlGp/0RdKlly7MEgNErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220396741"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:18:26 -0700
Date: Tue, 10 Mar 2026 21:18:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, robin@protonic.nl, andy@kernel.org,
	geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lee@kernel.org,
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <abBugQOUWG_FTs4f@ashevche-desk.local>
References: <20260305192101.2125660-1-hugo@hugovil.com>
 <20260305192101.2125660-5-hugo@hugovil.com>
 <aari1Y1CPZSYEVj3@ashevche-desk.local>
 <abBkk4Ng-_MDHd6t@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abBkk4Ng-_MDHd6t@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121833_179709_805DE262 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Mar 10, 2026 at 06:37:34PM +0000, Dmitry Torokhov wrote:
> On Fri, Mar 06, 2026 at 04:21:09PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 05, 2026 at 02:20:50PM -0500, Hugo Villeneuve wrote:

...

> > > +	int oline;
> > 
> > Why signed?
> > 
> > > +	int code;
> > > +
> > > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> > 
> > Can be like
> > 
> > 	code = 0;
> > 	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> > 
> > as iterator is not used outside the loop.
> > 
> > > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> > 
> > > +		int iline;
> > 
> > Why signed?
> 
> Does it make any difference given practical limits on nlines?

Maybe not, but might lead to interesting bugs in the future in case if used in
some arithmetics.

-- 
With Best Regards,
Andy Shevchenko



