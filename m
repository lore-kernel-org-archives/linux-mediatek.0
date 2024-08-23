Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB2C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MVJzU2a5ov+eDR3lGenq9JjzKKeLnKX8nzHYi4cAYU=; b=ZQiy9DDZq7pXTmtczDjqlwjfiv
	rbDbB/92fyTcz7x1JhqGXZ89ZDJz9hNBoXgjViJ9MNXNnZF0YjKF8Z3VVylARv6hUSAy/vuFuAxQU
	EKrmaiGqtkUJpv5LoNUwRyT0oYntnPiA2FQzLZIuUBcKG8P1xdbJ4Z6w+JTCodCAnCQXMp7syZyMx
	gru7OaMnogXEyELiwVZJT68f+RxomhKZ7k74qKTuGH2JzF9J6kBV/U1fzKOP5LDA/4nizDhPk1bK0
	K0AvFPleehbZ32jwZwrG6iqO2RYVUqQLxV2W75+bEl0+IqEs378t4z5DlBdpY7XEKP8v+ccjqPosx
	NRUnjHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUmi-0000000Gxr3-199z;
	Fri, 23 Aug 2024 13:57:00 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUlw-0000000Gxid-1co2;
	Fri, 23 Aug 2024 13:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421372; x=1755957372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gndjyeqaytEaKYf1kOK8jLLgaJjwQwTw8djDulGw++U=;
  b=e48TG8FIs9pvwDdpP6MAFtI8hjEhC/wXyoOyJRUktA37zhlsZW7D9srF
   YiessI4lG813oTE4L0jjQ0e0zHUPsMb6hY/Tn9uLvA1JmeipCrIfF/lHB
   2925rsU0voC5p+cjFSw7SKNfTa0Tt+j7x+NajbiUuZYLDUJgB7PBEk4jB
   uYek/eW/ODhTjsjPt8eu7+cU+hcqpORNfIBTDK+oN7ggHFX2u7awd80/+
   rO5GanvqSIp42v+G9np59DvYvigmMEh+8PEOPABmM93edMi1xoLAQXtZP
   wmprKUiyWx2UhRRQSe01LrTzVVwAnHZJBidpr4iKMytD4HND9Q0qjxokG
   Q==;
X-CSE-ConnectionGUID: qepwajUCQ9u47P66f7r4nQ==
X-CSE-MsgGUID: rttmnTkMRDONSKWmBhDstg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33513416"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33513416"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:56:10 -0700
X-CSE-ConnectionGUID: qYpLNdWxRbOic97zRlbH/g==
X-CSE-MsgGUID: M4YCAqa4Q1u89Ebl/F3u5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62104859"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:56:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUln-00000000oMz-1Rih;
	Fri, 23 Aug 2024 16:56:03 +0300
Date: Fri, 23 Aug 2024 16:56:03 +0300
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
Subject: Re: [PATCH v5 07/10] i2c: of-prober: Add regulator support
Message-ID: <ZsiU81fYfy8WTk_5@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-8-wenst@chromium.org>
 <ZsdGlMyq4pwWAOk4@smile.fi.intel.com>
 <CAGXv+5FWaN4gGksCF7k3emuDyCmAtx7+DBwHHbFhf_FLpP+=aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FWaN4gGksCF7k3emuDyCmAtx7+DBwHHbFhf_FLpP+=aw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_065612_481362_31AA4BB6 
X-CRM114-Status: GOOD (  23.22  )
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

On Fri, Aug 23, 2024 at 05:35:59PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:20:00PM +0800, Chen-Yu Tsai wrote:

...

> > Hmm... why not
> >
> > static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
> >                                 struct i2c_of_probe_data *data)
> > {
> >         struct property *prop;
> >         int ret;
> >
> >         ret = i2c_of_probe_get_regulator(dev, node, data);
> >         if (ret < 0) {
> >                 i2c_of_probe_free_res(data);
> >                 return dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
> >         }
> >
> >         return 0;
> > }
> 
> That would be more churn in the next patch, which introduces another
> error condition requiring the same cleanup.

OK!

...

> > > +     /* largest post-power-on pre-reset-deassert delay seen among drivers */
> > > +     msleep(500);
> >
> > How would we monitor if any [new] driver wants to use bigger timeout?
> 
> The assumption is that the person doing the integration should test for
> this. This prober doesn't get called everywhere. It needs a driver to
> call it, and that driver is written by someone for some specific platform.
> Maybe I should explicitly spell that out in the function description?
> Or even make it a parameter?
> 
> Also, having an arbitrarily large number here doesn't help platforms that
> want to minimize boot time. On that front I'm also thinking about whether
> it is possible to do a handover to the actual driver so that the latter
> doesn't have to go through the whole power sequence again.

Yeah, I think the best effort is to have a parameter.

-- 
With Best Regards,
Andy Shevchenko



