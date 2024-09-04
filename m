Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EDFCD37B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWRP+DmAky/7Zd0Khk/Uwr5vFrRXwFpyxg+9PMXcmdk=; b=qnIuZiVkbAf2s2lB4NSyBEyWLb
	wScCtrEnZxm4qZHTOe8QVglsuKxzx7KEL8KA4971qOTWVaLZZaqokIZwvcK+eMHZmZtq76s81/aIl
	kTVD8ihseY1QntAf2LMcjdBW8OlIuAPY4fIHcfagWbH9zKIETHGUsKYbIcAGISLbsmhAnuDaBAkLr
	axH42mQa4qwj8nKQ+EWxENWuPn9bP9CmU6ALp5o9sZywhFC1eft0Gvjq7qCBzwa0XYPH/pnm1Sfum
	74pDkfNNHaGmiESZn8zCCNOMxdyWMl/bs509KM5u5LpI1+8vpdiYnyACtyk4VsxFpny2XXgJdyHJB
	WGlqwHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slpso-00000004W2B-05rV;
	Wed, 04 Sep 2024 13:17:14 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slprq-00000004Vp1-2dU0;
	Wed, 04 Sep 2024 13:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455774; x=1756991774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5RTrK2A/7XPuuwlK3ZUuX4mnuUZD8sPxcvFgKwNLL/4=;
  b=Cwfg2u2oVY6Tg7VeQTxgj0+Zxhiz83qbGywEOMh6OotZMrlVJDmEokcr
   LYN50fTa5cjoL8b52kvB57paIII+mtCKdGCdNbJnnpylr4r2R6k4nlDvv
   VppI7FZ7Kbh5OvR5EvnVvHcJe0GnB6CamYxNtgDLC2unXKJ+cL3eLFSp6
   oVz19oyylJGLEKyc4OK5CvmYhNEAj6VPfski9PoT79iqKJBw35ZONE6mA
   diNPhZ70FAGGeXmgpfYCYxCiR4gCGe66wmj6HR51Eh4l6Md8jWOpXiJvu
   fS+dVIZfiVCwWDGdg7yOt8EryctRx+EZIRS62Urfhga/QxuGKZLq+NSlG
   A==;
X-CSE-ConnectionGUID: 33B4T7KhTEmNtdYv6ynn/g==
X-CSE-MsgGUID: Njdp0oumT1+vuVTCIPv7eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35275477"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35275477"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:15:23 -0700
X-CSE-ConnectionGUID: VaOsEGIpSXuEKg1mjvoXOg==
X-CSE-MsgGUID: aTQ1ZcVKQp+mUqWGC6vE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65608995"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:15:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpqe-000000054Q5-02f2;
	Wed, 04 Sep 2024 16:15:00 +0300
Date: Wed, 4 Sep 2024 16:14:59 +0300
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
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZthdU6UGlM75GJVj@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_061614_771215_25EC86B3 
X-CRM114-Status: GOOD (  16.35  )
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

On Wed, Sep 04, 2024 at 04:09:26PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:

> > +static struct device_node *of_get_child_regulator(struct device_node *parent,
> > +						  const char *prop_name)
> > +{
> > +	struct device_node *regnode = NULL;

> > +	struct device_node *child = NULL;

Btw, redundant assignment here, as child will be assigned anyway AFAIR.

> > +	for_each_child_of_node(parent, child) {
> 
> > +		regnode = of_parse_phandle(child, prop_name, 0);
> > +		if (!regnode) {
> > +			regnode = of_get_child_regulator(child, prop_name);
> > +			if (regnode)
> > +				goto err_node_put;
> > +		} else {
> > +			goto err_node_put;
> > +		}
> 
> I know this is just a move of the existing code, but consider negating the
> conditional and have something like
> 
> 		regnode = of_parse_phandle(child, prop_name, 0);
> 		if (regnode)
> 			goto err_node_put;
> 
> 		regnode = of_get_child_regulator(child, prop_name);
> 		if (regnode)
> 			goto err_node_put;
> 
> > +	}
> > +	return NULL;
> > +
> > +err_node_put:
> > +	of_node_put(child);
> > +	return regnode;
> > +}

-- 
With Best Regards,
Andy Shevchenko



