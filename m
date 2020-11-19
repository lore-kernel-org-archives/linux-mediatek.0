Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50684C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:56:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B501D24698
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VbtW/hTU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X7ZAjI1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B501D24698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SwWl6m7njh7BZnYHyWCOC56g33zmJIfHETj4Z5dVyJI=; b=VbtW/hTUJuIdPd+fOMuFHYPUL
	Zh9pi0Sfq/ybDIZvcqgKvsB688CgeEAjtgubwybZm+rTm9Pev/4vs4LJDjl5qJ5cpNaDfH/v7HfXJ
	e4Pi27RdfdWuISRTiOfs+0391PeA8WmwvJcprSLd2Gj1qevss87LbQ6wfv9FCZxnGuBjAX1kBr7h7
	jyYpV9YYzvZw719ozsKnMuAl5A+5eDcrup7MPWqXEFDz4+DsvtkjNI2ELFGmxzFuQDZTdC7/kYpAE
	6aXm2qxQoTFQ7AUDvkyc4gVObkepgUgCyAwR5hqoV8ynNlx2LhiN0KxVrDCnOWQkjpbdCMsNnJYy/
	XE51AVAYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfkQN-0007Gi-Te; Thu, 19 Nov 2020 13:56:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfkQ3-0007A6-Az; Thu, 19 Nov 2020 13:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LWOlXFpsgc9zSJ4vRGvLpe0n1Bm9CyIcRgP2r0s6WIE=; b=X7ZAjI1Bn4b2pNaffwzcAqmiB+
 +8HG5r81ozlqOLnUqn/NjaS3+OMDoiQASgF2xfUFWgN1RqIo3EPYzRLT8r6wtWXuY+Vgv1DgWL97n
 7fQm/8I8lZ89qQRZAjkPWouIrQtosgFfXgqICk55PPYqeVNi8xrvso/r2nFLvh6PxZbTdjam1LyPR
 suMm8gDfuAWqSnG9L6hsXf5M7TtbUoIliY3oCrVPntU9y93atUFOVHlVPfKX83g+2vwCWER0nrEJu
 PYEFyNiu0kJ6gO9z5Fa65JgG4OJHWxT4yjcPL+93N8za/FhZeTEBvvcuGXF+DLQXR567iPLnuucG4
 oqreJbFg==;
Received: from mga18.intel.com ([134.134.136.126])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfkPz-0005k9-DL; Thu, 19 Nov 2020 13:56:14 +0000
IronPort-SDR: 67mS6Mb4ZOPgdXyrTBhsdo+Eifi0ZW1E9n4yeK3L7NIToveDVMEoKf1eB5COXS6WlR7AqTXm8R
 LaP733XFl0OA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="159062055"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="159062055"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 05:56:03 -0800
IronPort-SDR: nQ5Pp2HkbFiq3GYBNci212BokRNBZNjV8o0SpI2jXmN6rlfNSU26gxrwPladBWPG2lW2WcCxw/
 TStzdtqXjHZw==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="330939080"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 05:55:59 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kfkQm-007xXE-JR; Thu, 19 Nov 2020 15:57:00 +0200
Date: Thu, 19 Nov 2020 15:57:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v15 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20201119135700.GG4077@smile.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-3-dongchun.zhu@mediatek.com>
 <20201023143156.GX4077@smile.fi.intel.com>
 <1605791201.4733.114.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605791201.4733.114.camel@mhfsdcap03>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_135611_937618_D0EEE88B 
X-CRM114-Status: GOOD (  14.67  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 09:06:41PM +0800, Dongchun Zhu wrote:
> On Fri, 2020-10-23 at 17:31 +0300, Andy Shevchenko wrote:
> > On Tue, Oct 13, 2020 at 09:05:03PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OmniVision OV02A10 image sensor.

...

> > > +#define OV02A10_ID_MASK					0xffff
> > 
> > GENMASK()
> > 
> > (And include bits.h for that)
> > 
> 
> It seems could build pass without including bits.h, as DW9768 once used.

The rule of thumb is to include all headers you have direct users for.
Exceptions when you have indirect inclusion that guarantees to provide
others (like bitmap.h implies bits.h, etc).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
