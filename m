Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB4BC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 11:41:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9435206D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 11:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8PuQE7c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9435206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfmUe8m62oO7nSyQoi59bzK3igem6GBi3HVUa6Keiqk=; b=C8PuQE7ciRtla8
	ffmBUbfLcRoPdwa3E/XgI9ufYCxbedM/B6Z1IfLugE57ljI4MLf6jsbIodY0rYP2uGJLFUsNC5VEa
	hq5hX6GzychP/UAYCKr/kHx94laUDx0l4fswzQ8T61anAfMPdVJNNk4XS+RnvT3rGluQzNcZ4dGmh
	Wjg5yxaG6CEQDRyK8yp/1XTVXts1SBewklKfOlvQH5jmtcoqq+p4x/YSSKB8ffI4hoaF1cGUPzD6/
	pCTRud0xIGtyX3IesAaO4NANu4NyQXBkQ8AnuXPdEORSBcdXCVeHilimWcAZWEGP1J2x5UqRYYHEK
	7U0pcOBibp4Ve4C+YM/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZYi4-0008NK-9b; Fri, 15 May 2020 11:41:00 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZYho-0008AJ-FZ; Fri, 15 May 2020 11:40:45 +0000
IronPort-SDR: 28vGEwlBa0iX4YtKzNR4yjd8QIzU7qfn/KsZ10W2GcvvtYY8dXQhX4eShtmC4+0yeNFE9k/oIK
 o21u+5vDNC2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 04:40:43 -0700
IronPort-SDR: Zxm93dBj9QeuaxwdKrGE0EN+mN8jDYSRw9LLjluNBQVeEX+0HcpZst/qTiBxgupCSun+htzg6Y
 x2dIMorsXzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="287758924"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 15 May 2020 04:40:40 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jZYho-006qhy-8y; Fri, 15 May 2020 14:40:44 +0300
Date: Fri, 15 May 2020 14:40:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v8 2/3] drivers: input: keyboard: Add mtk keypad driver
Message-ID: <20200515114044.GR185537@smile.fi.intel.com>
References: <20200515062007.28346-1-fengping.yu@mediatek.com>
 <20200515062007.28346-3-fengping.yu@mediatek.com>
 <20200515093016.rw5bmvoumgzvkqrc@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515093016.rw5bmvoumgzvkqrc@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_044044_560241_DBBAF608 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fengping Yu <fengping.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 11:30:16AM +0200, Marco Felsch wrote:
> On 20-05-15 14:20, Fengping Yu wrote:

...

> > +	depends on OF && HAVE_CLK
> 
> Please drop those deps and instead use:

+1

> depends on ARCH_MEDIATEK && ARM64

I would go even further
	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST

> There are still some missing deps:
> 
> select CONFIG_REGMAP_MMIO
> select INPUT_MATRIXKMAP

...

> > +#define MTK_KPD_DEBOUNCE_MAX_US		256000 /*256ms */
> 
> Thanks for aligning the defines but the 256ms comment is still useless
> as Andy already said.

Yes, it seems my comments partially (?) have been ignored.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
