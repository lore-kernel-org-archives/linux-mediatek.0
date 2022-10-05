Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0411C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIFJGq20SpDBGmpjG+MCg36zVjSe5hxFyEDOdYWXHVo=; b=DXPTC47SfSTxPzJmh3fRmqgLF5
	v/bhF6zD4l8StUsh/sx/aS5RCvLJ+e8FcGpZvPVT+rOhw2BDXs0Lfe3ju89DlDiDXcAQgdx34zsSq
	F9PmoPbYqXWwtv5JFMgRtRb4uMGquoFdQtFbWs6WLZ8fyoDjQsNAm6MQTq05c8A2OZi+II1zTWF0h
	4mhqcwCa37LtM6l2vNmZuJfJNdJzaKWU+syCZI4XgobDvOk96S+hN53WV29v6z5BVM+kTuhpqsUX7
	U1yAdNUdTSoxqLd86nLBykf4SUmrRTujJ+tSx1Z6JyI/BaT/rv8F0aEqOVOylN2LAsVKR5/lhucL7
	9vhFbLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3Ji-00E0z9-7V; Wed, 05 Oct 2022 12:16:02 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3JX-00E0xM-9b; Wed, 05 Oct 2022 12:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664972151; x=1696508151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/0/uca7PMc1JB5EXowgPj8CdkujWBJBOjIoOK0lALU=;
  b=QLGvGPE2sr+Hyp2uSj42to9vFp4Opnd3o9w2cHwxst2qwHAr0GcdhUjN
   4RL5ZbfP/iLELko3StxnTNAoDyzL/E+ztOY8RQ/gFS1cS6+ptvbuhdnta
   ZMhWVdMSacWoY6pe72HPC5fLPsbZsTF051rV8yc8hIZM7qG5ONSC/nA0Y
   81f7FERTNtpLSCrdH6FhDVxiGLd7cWt3LhgKoUjLYeYL+LxEgFZAkTURg
   rg8aheywpjnpjSkg171sCI/w16GXiiiJa0U0UHEPymVzSUmM2aJ1OpkPb
   cjOdHH06837n3O8tNQEdC/OQzC3due/0S9GwIVqniYkz8RFRctbqajMUc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="300743053"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="300743053"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 05:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="799468529"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="799468529"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 05 Oct 2022 05:15:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1og3JP-002eDW-0J;
	Wed, 05 Oct 2022 15:15:43 +0300
Date: Wed, 5 Oct 2022 15:15:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, jic23@kernel.org, lars@metafoo.de,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, szunichen@gmail.com
Subject: Re: [PATCH v13 5/5] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <Yz11bkxz9lK4wOHE@smile.fi.intel.com>
References: <cover.1664991040.git.chiaen_wu@richtek.com>
 <1bcd19dbd09650ddac7b96b0fe2932698be2731e.1664991040.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bcd19dbd09650ddac7b96b0fe2932698be2731e.1664991040.git.chiaen_wu@richtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_051551_403293_79CB1380 
X-CRM114-Status: GOOD (  16.82  )
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

On Wed, Oct 05, 2022 at 07:43:58PM +0800, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.

...

> +config LEDS_MT6370_FLASH
> +	tristate "Flash LED Support for MediaTek MT6370 PMIC"

> +	depends on LEDS_CLASS && OF

Why do you have OF dependency?

> +	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6370
> +	help
> +	  Support 2 channels and torch/strobe mode.
> +	  Say Y here to enable support for
> +	  MT6370_FLASH_LED device.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "leds-mt6370-flash".

-- 
With Best Regards,
Andy Shevchenko



