Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CEECFC5FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ey5I40X8wpeOFEAWidfFn99884kMSMEyVVAKXuD5Ig=; b=RM1eGIObhEDIU46/AK/lrWxtgk
	1LDwvX1r8gHKXPWpdUrtoT0NDb8Ze8Wssls6jjm5n89/csxmMAgv+/U7zQzNo0jDOYjARBTWj0lYE
	V4Al0jf6uYsaDiDl/n+xaT2H0TRS8EvBeeYc4ovmhTOrM3bZ9Elc+kVCq8jQVNgYCIHosQxRVv9xh
	ywkNEy9fqouIYyR7Mr3sD5Q/udut3vpZxypHjW75KBMi6mpOSk2SaGIGe9+hLtdlPh63LB1HqezPb
	mQI5HXdhUFL+LHrKJ4Cp0SPpFUNDf1dR7cdCckoLzwGF77b+ls1xnssLMYgvU09DBB4kCAzYX2ecY
	1h3Fg8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syysZ-0000000E7Bf-0hzG;
	Thu, 10 Oct 2024 19:31:19 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syv9S-0000000DLhP-3A0b;
	Thu, 10 Oct 2024 15:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728574351; x=1760110351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MP15bS4w3vSqH5JjlnyEj+lJuyt5Y2WkrfBOlfGovZ8=;
  b=hdlIpHYgrQ5JkCQACO2Ob6IQdjxn8egWXqagEB4ep1hdTH/modk9ua6z
   8q8Ffoq3tzp0rWyXhTF2RJUewYxdSVBOBJP8aWI4YD6ktgViumHnJNA2w
   m/632BPozGF7kh0P4/NjzUQdbIXX7gqmlrk9/8iBjv+PKsewEXTkZXkLO
   DlR6NJHDZ8Y2jpvDhsIaqFYkDwANFYxP0XR35TTh3oWFN5xN/ylSxGwra
   0Rg559p0uCUHmbtmA3/nkv63lBDI6VLwM8tRNLKZy/NpUthmHRQdoq+WD
   vUB7fi4u5VmrURzWB8dVJL34I9SCHzo+XRJfLssM9+IXhyKtQK4i50tvW
   Q==;
X-CSE-ConnectionGUID: lJmnlOAhQh+Rx49LJmBgLA==
X-CSE-MsgGUID: IdvR8vWWQEmCtXpvNJpD+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45456269"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="45456269"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:32:30 -0700
X-CSE-ConnectionGUID: 8qbP8zovS+qEoDxs1TzEVw==
X-CSE-MsgGUID: BDJjDco/TJayOTFrgGJreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76828992"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:32:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syv9K-00000001Zwx-1c2G;
	Thu, 10 Oct 2024 18:32:22 +0300
Date: Thu, 10 Oct 2024 18:32:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_083230_955190_39DAC5B0 
X-CRM114-Status: GOOD (  14.38  )
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

On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_touchscreen = {
> > +	.cfg = &(const struct i2c_of_probe_cfg) {
> 
> Perhaps you can introduce something like
> 
> #define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)		\
> 	(struct ...) {					\
> 		.ops = _ops_,				\
> 		.type = #_type_,			\
> 	}
> 
> and use it here as
> 
> 	.cfg = DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),
> 
> > +		.type = "touchscreen"
> 
> Ditto.

This was for leaving trailing comma.

> > +	}
> 
> Ditto.
> 
> > +};
> > +
> > +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
> > +	.ops = &i2c_of_probe_simple_ops,
> > +	.type = "trackpad"
> 
> Leave a comma.
> 
> > +};

...

> > +	.cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> 
> 	.cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> 
> Or even
> 
> #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)			\
> 	DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)

With that also looking at the above

#define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)				\
	DEFINE_I2C_OF_PROBE_CFG(type, NULL)

-- 
With Best Regards,
Andy Shevchenko



