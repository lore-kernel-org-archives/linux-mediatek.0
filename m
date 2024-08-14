Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25371C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Aug 2024 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RROH81GztSUclOcN12aLztcNK8PhtfjksjOFiy7bHSg=; b=sosEq+elgtNsjD6hbT5gR8NMoq
	FrYQUt59cKKMEe0XWVrrq1mYE5knq/I0iIG/Bq/rAqV4X0Xql9TWwFU0Ln9LVfEcwILOcYbLlRM1y
	2uGT7afi38z9Vm9yTnTosOJWC/J88F9YJ/WM1Qqc8ZT6dyTWGlxO0UkHdMDCyuELhuL5RwTEyRBWI
	T7O6T2GWokSf4bpBVTl2B4Te+i5jYo8P6H04WqpxTzJammMIhpf48SRkQ1ajssVvmKkqxuw1w/bGj
	GUnyGKmNRdxh9zAzVdd1lEspa3vP9UooPF6zk8GO4qR9mUdf8nJWCyxqS/aeRhjXDgk5rZ01JmfCw
	pn75Yw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEGx-000000078IV-12N1;
	Wed, 14 Aug 2024 13:42:43 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEGI-000000078CN-1BM0;
	Wed, 14 Aug 2024 13:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723642922; x=1755178922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hqcfXdtGQKVWLTvbdhM5pBJQQzUtmGdgqcjPbawdyX8=;
  b=K5XlGbwXmqAw6ZT2boG0SKeWbEndaXsn6Y4yWPo+kLQpRsSmEsBsgvoh
   K82E5ZphnM68/L24OTwQXuoZBJQZU1IHdzgJLq6TISkoty6jyxE3qYpeG
   E9SZ6VRKUmRhHXlGOr07ElWJALy1WBwatjPz2alrp0sY0XrwoL+/q5p58
   RYK0cylH3Ctfzm/nTGsxoR9ZM73Szm2cRpedTElkEFFi3preVpNIMw6/b
   W4P6dukPQgmVhzLArhW/qJE5OtV/zyhH6w2NTkAo129hTUEs8Q/oDxBgZ
   /a2ZijQ7Ud6RzxK273wf9MFglqrYuuwABsVLwtKhcBfvU/dX05Q9lnT9P
   A==;
X-CSE-ConnectionGUID: MDY8eAONRJ6SwZld7HKiaw==
X-CSE-MsgGUID: tzM+0ThcSUyavqsIgxY+VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32536642"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="32536642"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:41:58 -0700
X-CSE-ConnectionGUID: BVNQACSMRPqinWY3Kn6FPQ==
X-CSE-MsgGUID: /UK/S/1HTIe2pQFmOaearg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="89818646"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:41:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seEG8-0000000FC4y-17jJ;
	Wed, 14 Aug 2024 16:41:52 +0300
Date: Wed, 14 Aug 2024 16:41:52 +0300
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
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Zry0ILkU4VrL3Mms@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-6-wenst@chromium.org>
 <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
 <CAGXv+5EgqdziyheOt7wzkbe036fqPcw_UpSHiMsB3W_nTB3NWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EgqdziyheOt7wzkbe036fqPcw_UpSHiMsB3W_nTB3NWQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_064203_960460_4240580D 
X-CRM114-Status: GOOD (  20.00  )
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

On Wed, Aug 14, 2024 at 06:10:03PM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 13, 2024 at 7:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 08, 2024 at 05:59:28PM +0800, Chen-Yu Tsai wrote:

...

> > > +static void chromeos_of_hw_prober_driver_exit(void)
> > > +{
> > > +     if (!chromeos_of_hw_prober_pdev)
> > > +             return;
> >
> > First of all, this is dup for the next call, second, when may this conditional
> > be true?
> 
> When the module is loaded on a machine that doesn't match any entry,
> neither the driver nor the device are registered. Hence the check.
> 
> Or maybe the proper way to handle it is to return -ENODEV or something?
> I'll work towards that.

The rule of thumb is the _exit() is called when your _init() finished with
success. This conditional seems confusing and likely reveals the logic issue
in _init(). Yes, _init() needs to return an error when there is no devices are
registered or expected to be registered. If there are devices that may appear
later on, this should be split to pure device driver and board file that
instantiate device for the known cases.

> > > +     platform_device_unregister(chromeos_of_hw_prober_pdev);
> > > +     platform_driver_unregister(&chromeos_of_hw_prober_driver);
> > > +}

-- 
With Best Regards,
Andy Shevchenko



