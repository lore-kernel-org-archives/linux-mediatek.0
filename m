Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB90C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrq4qXlrXGvsjri+3GVwwbMWT6yHhcEYnxzTZHmNm14=; b=eBDwaI7ncp02L70N7Qv526l6sk
	vVTJTuEpZMl9whK8NgelrI4DmgljLE9SagoFlftC2bor7E5i1ywpAMaSsW5a0i3Wghm/jJyCWFa5E
	afqVtJCFSJYnKvFmPkz8R2NQyyDwtqwBbEwbDgQxl7FUqaFVoSNcWNm0hC8Czf/6O8psfJQ8T/uoQ
	7VYJwuG8VkDieaBNu98ke7LLEZGR84YUJxbRj8ZA9Hh5uzEctmKdWOb19zx4ESxvLo4ovOhMVZDpA
	J4jrezJzwMMdoUHbw91ZY8uZ+wTWhsb03zr1oVWJVeWLEHJQ4qT8vtxBpZ1VQjEhi1zYcRqKpUxw2
	Uc9llSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDc9-00000004Lhk-1i9n;
	Mon, 16 Sep 2024 15:26:09 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDa8-00000004LRx-1iDE;
	Mon, 16 Sep 2024 15:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726500245; x=1758036245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X867kVY3mwLewmvWQEQaqmOpFkKVgamKi/gS36af2Uo=;
  b=JNfbNhI2HkpFadDLnzdKVbwSlBa7Slf2zq8rmI9fwXSBjHiK2YG51mmw
   pvViBjrVnsLcJUivx9zhWfUETbn3e9JKdbJw0xG3F4u9OgE9g0HaMqvLU
   M8+rgFj8nddKxsJ/4Ee3DRM7DFl/VvT6deg/aA7u+n67Bp0rbJV8pnW+M
   XbePNFVUFSvY39RkSog34RdW+OUdOZkAj8DEfrhdoyPQ6M+w3Jr77KbhF
   jbm+LJ0VpmCmsjblAuwmKbVBtyLbsQGIsyQu+VQac52e/+1DT1RbraH9o
   bvFE75EMkKQ3YZTlybtqfKttjdfSawsWCaB0tafzqkgOzfgxtm0B2AIq4
   A==;
X-CSE-ConnectionGUID: HHcbIfiNSXyVDj90bv+UNA==
X-CSE-MsgGUID: 8O/4k96QT8GO6vBmx1szoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47839795"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="47839795"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:24:04 -0700
X-CSE-ConnectionGUID: NHqN84/5RaOVIOHMXmdfhA==
X-CSE-MsgGUID: NSzwDnfoTNWZlhN5umqf1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69380965"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:23:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqDa0-00000009VQS-1MWw;
	Mon, 16 Sep 2024 18:23:56 +0300
Date: Mon, 16 Sep 2024 18:23:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <ZuhNjHwwluF2wfoU@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-10-wenst@chromium.org>
 <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
 <CAGXv+5HRLHV2tDZxiqFRhz1p+_bhMzMXoJMBnhy-R=8C4hBjnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HRLHV2tDZxiqFRhz1p+_bhMzMXoJMBnhy-R=8C4hBjnQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_082404_527742_2C2AF121 
X-CRM114-Status: GOOD (  13.51  )
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

On Mon, Sep 16, 2024 at 04:58:51PM +0200, Chen-Yu Tsai wrote:
> On Sat, Sep 14, 2024 at 1:43 AM Doug Anderson <dianders@chromium.org> wrote:
> > On Wed, Sep 11, 2024 at 12:29 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > >  obj-$(CONFIG_CHROMEOS_LAPTOP)          += chromeos_laptop.o
> > >  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  += chromeos_privacy_screen.o
> > >  obj-$(CONFIG_CHROMEOS_PSTORE)          += chromeos_pstore.o
> > > +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    += chromeos_of_hw_prober.o
> >
> > "o" sorts before "p" so "of" should sort before "privacy"?
> >
> > I guess it's not exactly all sorted, but this small section is. Since
> > it's arbitrary you could preserve the existing sorting. :-P
> 
> To me it seemed more like they are just sorted in the order they were
> added.

If we can make it more ordered I'm for it.

Just my 2c.

-- 
With Best Regards,
Andy Shevchenko



