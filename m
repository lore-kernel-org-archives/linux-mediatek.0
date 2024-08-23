Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B96C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 13:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+LfpHPR4Cn2VBkJYqJXef228/jWqLXKnL6htQPAa6s=; b=3V3DT1fJdSyAIznJ6IIp6nTajN
	HKTP1bZ/x7ucO+oQCejd4me7KOUGxclXS6ETSrb6Y4sZlDGhi8a5pZtgZpgUYlHIjzv63S0Tncoww
	vX2Nze6zkp/M62PceMXSFNpMFOhm1JmmaE5dPBIBPlQZHJAKZYw6+Tbp4O1IxX1epoo19tmYI2Hv3
	4k/xLcNlsLDvDmTxT1/doyRfehzFoYglH3C0WFdFc/9hQTg0d/VYJGGOzLOfg+dida6qNWIrkS0R9
	nbJD1WTCiABefhwx/uATele5QscsO+jNM56u26rFsRlq8OtFdxmWmxIPaCTOC4k/OY0MG/VAHGvmj
	s2DPnUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUjd-0000000GxLO-43fu;
	Fri, 23 Aug 2024 13:53:49 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUis-0000000GxE0-3UtM;
	Fri, 23 Aug 2024 13:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421183; x=1755957183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NMdfI/OWHRYSTSw6L7RpviVNsUSKd3nDock7vtJ+5b8=;
  b=XF1PnJHsFxGUuBJjN0G0hH5u4rhtk4KdiiFjaJXzKXHERrWDrWptwvUQ
   IlalE7/RatkE6ecl+MTePh2NI+PwTmHMukf69icfAgwASCO9TKyVDAh1A
   UROClwBCJwnEs/9AvGvgvSZHdhqePwsOOoGdJotEh06cHeT7yAzRuINZQ
   102+H+aOWzSHFhNwGsu02PguZn4tUH9bRCwfQVqyn2/HMuaUZfTxAvamY
   TkCFfTr1c+mVzjWxcbINxFvM72m2YVC+3Ed63AFRDAiI1w6mLu0pCmNgM
   i3FIO3fXS5Nr7v400gWPzGTQN5DIrVGk2BKdSPcsEVGRj3vZdRYnFQ3GW
   A==;
X-CSE-ConnectionGUID: ih/y0XFsQtGZKFGL9c4B0g==
X-CSE-MsgGUID: N6ovDtTITX6RYeQH2jKUUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22770927"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22770927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:53:02 -0700
X-CSE-ConnectionGUID: 3J6bHqD+RnmlS77hRXo7Tw==
X-CSE-MsgGUID: KG6Te0ezSfyzu69uRTTi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="92527922"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:52:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUik-00000000oKZ-1854;
	Fri, 23 Aug 2024 16:52:54 +0300
Date: Fri, 23 Aug 2024 16:52:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 06/10] i2c: Introduce OF component probe function
Message-ID: <ZsiUNodqp9PgzbP-@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-7-wenst@chromium.org>
 <ZsdE0PxKnGRjzChl@smile.fi.intel.com>
 <CAGXv+5HtjWi60OnMrjR3fnO3T=7uyMazr1aKBFjuPmWuE9NK6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HtjWi60OnMrjR3fnO3T=7uyMazr1aKBFjuPmWuE9NK6g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_065302_940554_7677DC8D 
X-CRM114-Status: GOOD (  17.48  )
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

On Fri, Aug 23, 2024 at 04:40:36PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:02 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:19:59PM +0800, Chen-Yu Tsai wrote:

...

> > > +     ret = of_changeset_apply(ocs);
> > > +     if (!ret) {
> >
> > Why not positive conditional?
> 
> No real reason. I suppose having the error condition come first is more
> common.

Yes, when you have something like

	if (err) {
		...
		return err;
	} else {
		...
	}


But you don't. That's why I commented on this.

> Not sure if it makes any difference in this case though?

! is hard to read by a human being, easy to make a mistake in the brain of
reader and with inverted logic the code reading becomes harder. So, it's pure
about cognitive function.

> > > +             /*
> > > +              * ocs is intentionally kept around as it needs to
> > > +              * exist as long as the change is applied.
> > > +              */
> > > +             void *ptr __always_unused = no_free_ptr(ocs);
> > > +     } else {
> > > +             /* ocs needs to be explicitly cleaned up before being freed. */
> > > +             of_changeset_destroy(ocs);
> > > +     }

-- 
With Best Regards,
Andy Shevchenko



