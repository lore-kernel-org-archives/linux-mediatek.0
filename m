Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA5AC433E7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 13:52:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB4E2078E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 13:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nr9fJWCU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB4E2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P94/1onCihmQdHL6XHMIRIZjX5VysVxXzsFmOLuqIWo=; b=Nr9fJWCUKb2LG2oEzk4/68e9H
	67/zSkCO8FEUu8fDmzFvCrAFwGXmHH8oE7K/L7sYUCPAaPhFvmJcVZrVKDFXPDjPBCZInKevwia4B
	EOvySo8mOO2wweVjvXqto12c6o/6IDWti075Rb6GfzqUcxW1bQ2Tv6QM5zVBbYWOE+FRmn/G1eTXl
	PpxDEprCQxje9adT45snhauWzNcRQVa6gRKxar9B/LFRzeLL7jly+5mVDHz5g7QZ/6sy8AVAs273E
	KAXq2QVIBldXuo0ON2DvBiUsqxzOKBoRJDqz/RrfXGW90nYSpK+ZN1v38Xrs58a7KTiilM5AOJJOc
	QLLhQuJWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDTB9-00041T-6g; Wed, 02 Sep 2020 13:51:59 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDTB5-0003zv-Ih; Wed, 02 Sep 2020 13:51:56 +0000
IronPort-SDR: 29HWNCLWM7YLzF6CqlnB0Sr1/1SANPAqlDy+oXyIFSTrFIothoos+MmzhqiHko3fKz6/RWjYNo
 P2gQJezEPMyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="145072875"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="145072875"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:51:53 -0700
IronPort-SDR: P+aTxY/oGyABs3yhZTdeYQGh8ec6x91kIgFJPJ9zqoCHy5pgYy5nhSPfel8ln/ldcv36QcTZpe
 2CRDr0PwLsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="331442343"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2020 06:51:48 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kDTAv-00Djiz-EK; Wed, 02 Sep 2020 16:51:45 +0300
Date: Wed, 2 Sep 2020 16:51:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20200902135145.GO1891694@smile.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902134421.GN1891694@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_095155_758526_D10C14F0 
X-CRM114-Status: GOOD (  11.12  )
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

On Wed, Sep 02, 2020 at 04:44:21PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:

> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);

> > +	ret = fwnode_property_read_u32_array(dev_fwnode(dev),

> > +		fwnode_property_read_u32_array(dev_fwnode(dev),

> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",


Btw, can somebody explain, why it's fwnode API and not direct use of device property API?

In all above cases I see no reason why not to use device property API directly.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
