Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75631D21274
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJ+BdGXQtTmbT+P9cEUt353sOLxGJLpTG39VFrW+Zl8=; b=28d96qGUFtJioFCyV+D/jHQmg1
	aIE+FBGuanHXhHPeEp3fpWUaUDeFsWqbDbNTioHMF8PBSDaVpOAel6pKic1PmhPNNut9n5wY+57kn
	iAtwUqT6YCWCwdrrKkaJKxococoZsbcGxKccp3OZCt9w8dCg7VJCDSCv1xDHqon9c8GYDq/FQXFkC
	Cz7ueV/dO0PEKHFbO+9RlEIlSwMn3jdJtjOMcViTj87upNFLHjkSIJ3n2phs9Iz11LumUYxtlRGoh
	LJhmgGEezjHOeJ0ml3IXLKMhVUiFZdUPD4Oh3g2EaTDPuqzFyEzIPEmP1ZZMCirp6u93KJdGFtB5h
	YkmtEMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Nhn-0000000EVfq-1he0;
	Thu, 17 Oct 2024 10:26:07 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NJ9-0000000ES3O-3jdk;
	Thu, 17 Oct 2024 10:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729159240; x=1760695240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j6dtf+1nsGntL6BOPrfU67/30TxswPd84Ugr4PzJXJU=;
  b=M9z1zxcRY7dhIoPI2MlZ2ffFJpmZ/GGXyAuoqpE3taxzWprC6PEEmZtD
   BzCtZUlmk55RxGOr0hkKb47gwLa7C8b4CaYatdbNUrF9IvCyfsL7MNs+j
   gL5n3THdElHld/V2Z2lkymvmjxgF5hXcR88fRjJOyLL3+BcqmF+mMgtgT
   JrU28Ay9dJQowEbdYUbmwhgUNqxRgExdsb6Cuj0E8Fz2R8UCN7uQPXXpn
   UpYSBKmheywqX72ExY3dHf4PAenIu8bYufSy87coMsZFnBKQOcgc6DypN
   EhebX6Z0hzH2Z0LcDx3W0uJh3bhPc4m2SP2/2xbQNCSR7FuwvU0lBMfUi
   Q==;
X-CSE-ConnectionGUID: wf1kQAtgQt2bgPGA1NfwPA==
X-CSE-MsgGUID: 9xQWIQPnSsGT044oZAgHPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28845184"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28845184"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 03:00:39 -0700
X-CSE-ConnectionGUID: Vd/xbfNLREKHhrzvo/Ki8A==
X-CSE-MsgGUID: pH7o0+e9SXWfNTmMB00Ypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109247908"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 03:00:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t1NJ2-000000044ml-3TYc;
	Thu, 17 Oct 2024 13:00:32 +0300
Date: Thu, 17 Oct 2024 13:00:32 +0300
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
Subject: Re: [PATCH v9 0/7] platform/chrome: Introduce DT hardware prober
Message-ID: <ZxDgQISmr_gn_aDF@smile.fi.intel.com>
References: <20241017094222.1014936-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_030039_966522_F5A632C8 
X-CRM114-Status: GOOD (  19.18  )
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

On Thu, Oct 17, 2024 at 05:34:35PM +0800, Chen-Yu Tsai wrote:

> For the I2C component (touchscreens and trackpads) case from the
> original series, the hardware prober driver finds the particular
> class of device in the device tree, gets its parent I2C adapter,
> and tries to initiate a simple I2C read for each device under that
> I2C bus. When it finds one that responds, it considers that one
> present, marks it as "okay", and returns, letting the driver core
> actually probe the device.
> 
> This works fine in most cases since these components are connected
> via a ribbon cable and always have the same resources. The prober
> will also grab these resources and enable them.
> 
> The other case, selecting a display panel to use based on the SKU ID
> from the firmware, hit a bit of an issue with fixing the OF graph.
> It has been left out since v3.
> 
> Patch 1 adds of_changeset_update_prop_string(), as requested by Rob.
> 
> Patch 2 adds for_each_child_of_node_with_prefix(), as suggested by Andy.

> Patch 3 implements probing the I2C bus for presence of components as
> a hookable helper function in the I2C core.
> 
> Patch 4 implements regulator supply support as a set of simple helpers
> for the I2C component prober.
> 
> Patch 5 implements GPIO support for the I2C component prober simple
> helpers.

Not that I am really a fan of the idea, but I have nothing to counter propose.
Also my big concern about random msleep() calls seems to be addressed in a way
that it's now a caller's problem to supply the (correct) one.

Hence FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
for patches 3,4, and 5.

> Patch 6 adds a ChromeOS specific DT hardware prober. This initial
> version targets the Hana Chromebooks, probing its I2C trackpads and
> touchscreens.
> 
> Patch 7 modifies the Hana device tree and marks the touchscreens
> and trackpads as "fail-needs-probe", ready for the driver to probe.

-- 
With Best Regards,
Andy Shevchenko



