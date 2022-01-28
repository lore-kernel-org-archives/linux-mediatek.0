Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C26BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3p42EO9hFsM1j90ZARGd7mwTTVbK1UXZqkZ6ysV6HI=; b=g5VnXrztAh8BDs
	hib3HnfUBU+v4dxEepybsj5BCqTXZyjCAnIA29JKmLjdYsHRJIxdrObaVkIKWlfrlT6VtZQTSZvVc
	GdnmsQlmiiSz3vZxwIEyvd2DYKuHvbYSpd+MO7/cixCf9UiiN+W0/cztTIPHX5ElU1Wa1WQSGkaWf
	BEY1MPKivZCT1pn8L1p0g45oTH3E6Y43cuzB0wepMI0jHF7zEmU0S3e5q2KD9TaSkFRIn+eea/E3M
	qqOppcd/womwbmc8yvmNqMijsuG5HVCA8aywyilHCk2aiRNB9idW8oAvaRd0GuHByrh7FspQD5RVX
	JC+av8eULTKjxiid+MxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDRSh-002NeK-6E; Fri, 28 Jan 2022 13:38:47 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDREr-002I8T-G4; Fri, 28 Jan 2022 13:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643376269; x=1674912269;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dee8gZqixv/3uVG/nwblVNmvk6RueJi96F9bnNNOp0I=;
 b=Wvwo2FPoIuMSUBSlqdkkj44YrWNVbDO9llmdCB2nFRZILYZyABcnTC+8
 Mbs4R914WRVhTu7Gb951GrF7mhTTCmvpftcGJxS10PEL9hSsfPqzNuG2n
 HL0+yRQFm5Ijn79VC3hrw9LHiBP9XVUMC9D7yonIn/8ivCm9nhUFETPXW
 dHfyZb3q44fedLphgoCCCAsqbIeoq+vYjkRNe+FFu4Bh0+E5wJYWU8eq+
 9MlMPwk4eRHgZGVYjk33xk9I+5nWzOpJDzxQm5ybjUIw/2yEWp5FDoBSR
 UFQs4VZ43UyNtR/epzngeCXMFfvr2xwQd04OFHz3jiZOj/IRx7+OfPVuB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="246892190"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="246892190"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:24:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="625632618"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:24:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nDRDj-00FQOE-Os; Fri, 28 Jan 2022 15:23:19 +0200
Date: Fri, 28 Jan 2022 15:23:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
Message-ID: <YfPuR/Q5//hSQYKG@smile.fi.intel.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
 <20220127111526.3716689-3-mkorpershoek@baylibre.com>
 <YfK4UcuCfF7JfI7H@smile.fi.intel.com> <87v8y4p483.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v8y4p483.fsf@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_052429_629311_7A7B340F 
X-CRM114-Status: GOOD (  11.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 28, 2022 at 11:03:08AM +0100, Mattijs Korpershoek wrote:
> On Thu, Jan 27, 2022 at 17:20, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Jan 27, 2022 at 12:15:25PM +0100, Mattijs Korpershoek wrote:

...

> > Up to you.

> Thank you for your review and your suggestions.

Yes, as I said it you need a new version and consider them good.
Thanks!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
