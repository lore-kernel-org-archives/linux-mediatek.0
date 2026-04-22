Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B92F9EDC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2026 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDSgJd5ud0PAJSXfHnvD2sBdeWGRCxEcEKwxJ3247bs=; b=ewDsGDBMQPEspadGu7/s3/ZqvF
	vSanYQs5xyF8QCWMYnaKQzaOBrOLcrEJ6vCwtPP2LjFUMvrU7P0bwXeEZSPRDlK4UiFPp4kP8Z3QT
	jISKK/Gc7mWxo9j7nC7NQcnoLWBqxRBFZrHng5+S3POULPYghWFYb9u1OlGa5oftVeUhOokBFnJUx
	WNOFpv0Ymrq9GD//pR/gASUPbjpCF+7C/y/aoHO+9dEZsDxCdCLdJUpeUPusoCVvfsT0LhAVQovVv
	Lsh4BZgwN9PW29l2hKKXmgRopxFm5vUs9CjcMie7EVDsIjBxiBC53ga/kpkIjtiYhFQCsP+eidojX
	ujso+xWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWx3-0000000AEc9-27wV;
	Wed, 22 Apr 2026 12:45:09 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWx0-0000000AEbQ-1wqx
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Apr 2026 12:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776861907; x=1808397907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uj+LL1Po7hnPnTKAi6dksaa1sxESLP9XwcWHu/2yDM0=;
  b=SBexOGzU63D1pSyHk1FopnAaS5YiUdDrwLGjomXCWUw8KQ48cN2TCavy
   IksURit2Net1JmABsvn6BJzcjJBkwgjPBiKXyRXhRfD/VxTiTmv7kKveH
   xMbjyf+7WYKK5a9kWF/3W//+pixjcpsbae/zMVdxXEakW7FO0z5yQ6yPT
   vq1SM2DWmRMTOYTefhIvrH/RdYThjgzvj3se+hScs+nR5Q8BfrHbpCwh7
   H+TLnTSgMj8T9LzqMptT0DRe7RHwWyTquNW5rFAHpRlDyw/gtA/J98NFa
   WO5SQVjeCgFU/GN+7+9uevOnd2karEggw4i6Dh0O1GtZmlyyI4tBgn8ft
   g==;
X-CSE-ConnectionGUID: NB+M2u/iQg+9mEfpTZIqyQ==
X-CSE-MsgGUID: 2O5iI/4GT86iPKThdre3hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81422487"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="81422487"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:45:05 -0700
X-CSE-ConnectionGUID: 4uy75dGYTMuQYqV/z6ZZ3w==
X-CSE-MsgGUID: fpclPLiPSDO72NzcK6mJsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="231449355"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:44:59 -0700
Date: Wed, 22 Apr 2026 15:44:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux-mmc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
	linux-bluetooth@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <aejCyTzwVAeNt5YK@ashevche-desk.local>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
 <aecu1ixyHP2hQvgE@monoceros>
 <aehwG2Egt93-sPVB@ashevche-desk.local>
 <aeipQfCYKjl006uM@cae.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeipQfCYKjl006uM@cae.in-ulm.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_054506_544462_6029E227 
X-CRM114-Status: GOOD (  21.17  )
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

On Wed, Apr 22, 2026 at 12:56:01PM +0200, Christian A. Ehrhardt wrote:
> On Wed, Apr 22, 2026 at 09:52:11AM +0300, Andy Shevchenko wrote:
> > > To be honest, with the involved void* this isn't really type-safe
> > > either, but at least the data keeps being a pointer which is really
> > > helpful on CHERI. FTR: The alternative would be to use uintptr_t instead
> > > of unsigned long, which also has proponents in the CHERI community and
> > > which is used in the current vendor patch stack.
> > 
> > FWIW, Linus categorically told that it has to be no uintptr_t in the
> > Linux kernel.
> 
> This is probably not the correct context to discuss this but
> I will point out that if/when CHERI support is added to the
> kernel we will need a way to distinguish between
> * A (fat) pointer converted to an integer type (in order to do
>   integer arithmetic on the address) that might be converted back
>   to a pointer in the future and
> * A plain address "extracted" from a fat pointer.
> Using `uintptr_t` for the former and `unsigned long` for the
> latter seems like a reasonable choice but there are certainly
> other options.
> 
> Sorting out the difference between the two is a very large
> part of the diff required to port Linux (or in fact any piece
> of low-level software) to a CHERI system.

Right, whatever CHERI needs is has to be discussed with the project leader(s)
first. But thanks for giving more information on this.

-- 
With Best Regards,
Andy Shevchenko



