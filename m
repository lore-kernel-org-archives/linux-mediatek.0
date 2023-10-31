Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5B1C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0aSRGK7V7Agk2EElJvIfXoGNzDMCct5cZHLWuLmi24=; b=SO1Lcy8tcawuaqCGklY8v0/JHv
	Gwk/gS+LEFNAYViwn4jKMfe1MNcdhD+4eWCCkCjxrlCcmg76q1szH0oisFov96fo3+4gn1CvBQQ8k
	CrltxKljlUJ1jhREkxsZnfMyajfTvUOcRXZVAuzCD3izEe+jgOPhdJhtMQpBcUQraUN4rPXfCiz3L
	CBpcut/eBYDY53DuvvIHB17f90b2spO+MO+TWtT4r7uH8wYY2TCr+F6Kq7PRFzYlyK1wiR7x33isG
	YszXmbxMXmKVZgONjLayEejI9PseOmie5Lqv5OTrUFxT9eUNOw4uyQ5JuZoKol75oLDcVjJyJ75Pa
	NlyLD2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrqJ-005iOV-1c;
	Tue, 31 Oct 2023 16:43:51 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrqH-005iL7-0o
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Oct 2023 16:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698770629; x=1730306629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7B5NIFZnAMgt5AVmwDkbgyLx7q+R9dV1QKWlaH93HYc=;
  b=RAguxMZVALAC5eHDxgNKSgBR/PfNjRIT6gf1bvok7pqvpzCJlFrsd2E0
   Nq99xX8kib6nSmWkP8fbbhbgzrfLhKfJfhFW2uOSl+1b1QE1pI+1ZFUAD
   DWALV3t48vK/WKOITdrzjnwH8JuAhIRTCAVA+6gZCR2pDcKyuCae/o02Z
   DFN7SlnHwwQqw3vGGCqO6ZInRbjLoS/j/3q8eZLMooVXiaeo/3RLiFzin
   xVHhY12XrBrY/DjPXR2rw5gwC0nxSGqN7QHxD9UNwhat8tQ2/fvAxm9Pc
   +V9KwBXOXDsl4mAO0ijx73RIkS48kEGrdADEbodBvXk0lUn6sZtmRvuJd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="6950417"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="6950417"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092068287"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1092068287"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:43:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qxrq6-0000000ACtG-3U8G;
	Tue, 31 Oct 2023 18:43:38 +0200
Date: Tue, 31 Oct 2023 18:43:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/3] media: i2c: Add driver for THine THP7312
Message-ID: <ZUEuuqLv7p0nB9a-@smile.fi.intel.com>
References: <20231017132103.9914-4-laurent.pinchart@ideasonboard.com>
 <ZTutbU1XG_jKZbIp@valkosipuli.retiisi.eu>
 <20231027124529.GA19539@pendragon.ideasonboard.com>
 <ZTvOIQSmpytUisUD@valkosipuli.retiisi.eu>
 <20231028151858.GB20465@pendragon.ideasonboard.com>
 <ZT9kwC3abUKR9fgQ@valkosipuli.retiisi.eu>
 <20231030104241.GJ12144@pendragon.ideasonboard.com>
 <ZUDatMX10WK0bdid@valkosipuli.retiisi.eu>
 <ZUEEBXfjTPqnnL9b@smile.fi.intel.com>
 <20231031142459.GB14322@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031142459.GB14322@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_094349_333712_739806A8 
X-CRM114-Status: GOOD (  15.75  )
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

On Tue, Oct 31, 2023 at 04:24:59PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 31, 2023 at 03:41:25PM +0200, Andy Shevchenko wrote:
> > On Tue, Oct 31, 2023 at 10:45:32AM +0000, Sakari Ailus wrote:

...

> > I agree with Sakari. Let's reduce the scope of ACPI/OF/etc-specific functions
> > in the drivers. There are really little that have no generic counterparts.
> > And most of the usages are special cases.
> 
> Sakar has submitted a patch to add one missing fwnode function.

I have reviewed it already :-)

> If it gets accepted, I'll try it out and see if I can convert this driver.

I'm sure we can make this happen, but let's see...

> I will still not do a partial conversion if I hit any other blocker.

If any other issues, don't hesitate to report!

-- 
With Best Regards,
Andy Shevchenko



