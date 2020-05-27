Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E872FC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 09:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF6CA21531
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 09:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tlWHQuj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF6CA21531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dJbBIGjxx2HG2dh/ZKbLj5EMFExZ68AOAhdjVzgnA4=; b=tlWHQuj30bPkoo
	XZNETjQkwgyp7VbtQcywSbMaepQxegKU5cfjVUU3GNohPv19TedvwyhSg17du0F5C4MyBRlGUGQ02
	2ttk9LUwm0P8tKHWCTCQ/Qz6yJMzk3q/fyKa2v70YHLP4mEAttjyIqKuLZP4ON14QZFdJ3c6gLxjx
	pxZUsZgW+FntFMFQhL6gXTrbRUJNVb0UrZ7iOWryZz67DoUg5I4Baz0ubLCZPlz7XXC9/53xndjva
	Vt9bk2dt6MvrvP1IFiSQEeyVKIuIIYqMeW1DoX+qVdl5dc/+nTshNz08wYxU8J01A1Ty8opJyEG0k
	w/gq+FpvIMKIjOPnyFkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdsiF-0006dC-7o; Wed, 27 May 2020 09:51:03 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdsi2-0006TY-JI; Wed, 27 May 2020 09:50:51 +0000
IronPort-SDR: 4b/+s7mf5eyEvzHwkVuxqX1X7+CfMrhI2yjLeKoDiYeReYqlLEb7UIUvPr8CtHcncv+DoMMQde
 zPhPK91TN2Ug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 02:50:49 -0700
IronPort-SDR: Mpk22qHSCUEF+iHYmSQxTF0lRMvAwMP0sBMWTJsi4ktcES1nUbOrrFCdkCTNyzUKPAqvhboKdU
 a8eQS2oJ67pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; d="scan'208";a="375978934"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001.fm.intel.com with ESMTP; 27 May 2020 02:50:47 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jdsi2-009By8-Ob; Wed, 27 May 2020 12:50:50 +0300
Date: Wed, 27 May 2020 12:50:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v9 2/3] drivers: input: keyboard: Add mtk keypad driver
Message-ID: <20200527095050.GJ1634618@smile.fi.intel.com>
References: <20200527083137.56566-1-fengping.yu@mediatek.com>
 <20200527083137.56566-3-fengping.yu@mediatek.com>
 <20200527090048.wawdb5qkkhroyjtf@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527090048.wawdb5qkkhroyjtf@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_025050_673502_F3FC5853 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: linux-mediatek@lists.infradead.org, Fengping Yu <fengping.yu@mediatek.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2020 at 11:00:48AM +0200, Marco Felsch wrote:
> On 20-05-27 16:31, Fengping Yu wrote:

> > +	irqnr = platform_get_irq(pdev, 0);
> > +	if (irqnr < 0)
> > +		return -irqnr;
> 		       ^
> 		       irqnr is already negative
> 
> > +	ret = devm_request_threaded_irq(&pdev->dev, irqnr,
> > +					NULL, kpd_irq_handler, 0,
> > +					MTK_KPD_NAME, keypad);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
> > +						irqnr, ret);
> 
> Still not alligned.
> 
> > +		return ret;
> > +	}

And on top, can't we use irq instead of irqnr?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
