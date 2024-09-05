Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1279CE7A81
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4zPQRDA7o2vwbs3ywT0bhd26kc1dq+kSKWW9LdrSDI=; b=3Y1L9zh9TVNcKOyRvEQHtXzMYT
	uMio5+I/ajj4o61UvTDnA4+ex0hg7ncb2ZxbaabcRKtViCkE9jNLxzfu4KYer6T/JRQPMBORn3p3H
	IVY8rNOZAJm48pTDx4IkdtsDusOipIkxZ+j8yczypOLL9HRIhyEz9JOvIKAgGYrUTR3LBKxhnVTQa
	12OkE2xnjyKSJMakhsNYxGrP8khQHisOjVjVJcFPgllY1zm6WKs9D6LqoNXOa3okrofL1oa1IMuOc
	XxoKe0aoiR7RaHLLhkhB5XOwmQT0AVy344PG/pWBXUxOuE+tP63PVXXjt0gOVrlcL5yxf4n2QPsVL
	dSYaK4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHwb-00000009ZkJ-0M0i;
	Thu, 05 Sep 2024 19:15:01 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHvb-00000009ZbC-3tEK;
	Thu, 05 Sep 2024 19:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725563639; x=1757099639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mTBuLETswXC09QLI+VcdbP8CzYzFsrnsp5jHuVvS1JE=;
  b=TDeaqnd/93UT+hy2x7uT4MuFmMZUmz9ogMfn06htJM/mK3vhvwDBapYi
   bvxYQqfs9ClWVPhzfturSByJTjCwaHzsRAVBZgv1Pi5WiVendudbm7cqi
   Vw3NqZ945hiGu0LunYHJDNEFPQik6lhQX3SXcEDMwG5AEy8/gfSROJnYP
   8UPZlC5c4SAegQCp9yQVyTGt7orJiQxKbU8yaYPHnpPgwYfazC5RoTvFJ
   oMTkBKIVbJCoT3zvVKPeppbmBE0hjkZhiyplPvEcIx6PrRal5e6RxVlvd
   8OWXGbudyglavnhiEemxBwY7RraWBLBCZU9lPJskd8L1AXQ03ZvMswymU
   g==;
X-CSE-ConnectionGUID: IaxF74O7Sm+yMpYnLZlgtQ==
X-CSE-MsgGUID: tG94fPauTUCMvFKcCdPrlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24177449"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24177449"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:13:57 -0700
X-CSE-ConnectionGUID: TgQG9v7LRi+FWBovYgCPBg==
X-CSE-MsgGUID: 9vHutHYnQ6arZPaW9K8xIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65433332"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:13:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smHvS-00000005WYn-1sN5;
	Thu, 05 Sep 2024 22:13:50 +0300
Date: Thu, 5 Sep 2024 22:13:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <ZtoC7kz-5Cd4CZe5@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_121400_002078_AAE72272 
X-CRM114-Status: GOOD (  16.47  )
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

On Thu, Sep 05, 2024 at 11:14:58AM -0700, Doug Anderson wrote:
> On Thu, Sep 5, 2024 at 8:10 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> I guess I'd have to see how the code looks to know for sure, but if I
> understand it sounds a little awkward. Specifically, the "options"
> sound like they might become complicated enough that you're inventing
> your own little programming language (with delays, abilities to drive
> pins low and high, abilities to turn on/off clocks, and abilities to
> turn off/on regulators) and then probers need to code up their
> programs in this language.

You beat me up to it. I have the same thought.
However, what is described is exactly what a regular PMIC has.
They already have their own language for exactly this purposes.
(At least I see that in a few Intel SoC-based platforms.)

So, after all it may be not a bad idea But would be good to have it
standardized (if it's even possible :-).

-- 
With Best Regards,
Andy Shevchenko



