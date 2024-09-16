Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B700BC3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+7rcnYU9Xh7cExHFukAZWKlohG30FdP/pjZcJMgJMI=; b=Nh/dOaTlcfdGCsTNdeUy6ln1W7
	lrcgxwJyBX3uqvHSX3iQdgozyOmrKaRaJlRM5PEAWdPPe9oABNVaB5lKxtY1ae9DqwV7YTNXGmPVN
	OYdlj6tcEsk20QLWz93wvOzFzyuB9QNn/R5ZDwRIX2uv9zGrOG/lUEwTsYhI8BVtHu4vCYjrf7t5M
	t2BfC5nIBEA7nvXKzwIDtfoo1MOePV1MhPgyQaZFTVeZc3VMWlKuIaBDGOz3iDpvSfsMkofTsCUCQ
	dRFi08h3X9ZALqXyKmTcGp+4Hcfp/RCZx68SNgYK2WWkr3L/aGT5qF13L4XM+XiSsCCyTRWrzpFzw
	gvzzvXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq8kw-00000003fWK-1Qms;
	Mon, 16 Sep 2024 10:14:54 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq8jl-00000003fAz-3CRR;
	Mon, 16 Sep 2024 10:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726481622; x=1758017622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AJClUZHkcOc0nIkFKgtMeGqAt/Ij2O5DgRNhQvRHDw4=;
  b=Pfo7Hqv045ACqLVfMJZyhVER9wA0c6LnqJkZthK5K9bKJtcy17L6205J
   epbJLLOPyGyxNDkgb9BK0dXIoC2PdtpTwJ9cNiwU2bOO5IOvnQGeg+14m
   AtltoAfQ1/hE1kdphmd2W1WYyRMd/INkZdA9iA6RjU0Ed/SUvOvuunncu
   Ww7VIurBJS/7ruBSpIzV/U72nL8IHUAXN6d5pZq2N1rK+xYRIN6Rp3VJy
   tyZL9uCc4rGXCb/oqik0hDcO8fgkVpPH/V+ybF1L1M40voRUrCiTaUJP5
   98HEHc5u3kC40ZuygBW2j9CbGO06wDCY4jbQKNIPoPqgXefa/afLonOGa
   g==;
X-CSE-ConnectionGUID: ze6G2lKXTa2SLH++nZJg1w==
X-CSE-MsgGUID: 1wXCIeZnTJq7TRkdFss4DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="42815763"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="42815763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:13:38 -0700
X-CSE-ConnectionGUID: 6/QFDO/ZT/CAOga95eN+gA==
X-CSE-MsgGUID: 9nXYsiyvTTC1+eAvvYp/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73419425"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:13:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sq8jb-00000009Pyj-0z7J;
	Mon, 16 Sep 2024 13:13:31 +0300
Date: Mon, 16 Sep 2024 13:13:30 +0300
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
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZugEyqg-2ZL2VVEd@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
 <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_031341_872254_01FC9D61 
X-CRM114-Status: GOOD (  13.17  )
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

On Fri, Sep 13, 2024 at 04:43:04PM -0700, Doug Anderson wrote:
> On Wed, Sep 11, 2024 at 12:28 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > +static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node)
> > +{
> > +       int ret;
> > +
> > +       dev_info(dev, "Enabling %pOF\n", node);
> > +
> > +       struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
> > +       if (!ocs)
> > +               return -ENOMEM;
> 
> I guess the kernel lets you mix code and declarations now? I'm still
> used to all declarations being together but maybe I'm old school... I
> would have put the "dev_info" below the allocation...

In general yes, but we don't allow it everywhere for everything,
we have two exceptions:
1) for-loops;
2) __free() RAII.


-- 
With Best Regards,
Andy Shevchenko



