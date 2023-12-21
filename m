Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E924C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFQdCE5wy1vk7xsNVo027n1K1IDU6V0694pXF0JvkQA=; b=Az++8CYcRoBkefkQaBAQiNAc+5
	b/cGycgv/cVQjYG8hgbkyyaj33wZekhfTyCFiTRhDMgpsrZE+B6s8Nxl/1WqCEH51qjmi6NfWk70I
	VoFMz/yUJYcwmLJi3spQyzUKkeNtGN+Mj+oVKZd07sYf8KhuFNHA3WEhityl+IwLeiyGm489u5EPM
	k0+5HRGh4ab1ucjO0CDvid/+nFoCrzIB6tOpVqpHVX760jQQftIXk5n3bZ3Ac0ZVmWyG7rOTlxpiX
	jx672o7nbhb34Zy1Epp4ClyfQYUTYoYhi6MKSMIlJmNOVXaEgcILX/gthnbewn1QRgpYb11QVf9fm
	zG3ZWTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJK5-0031Ip-0c;
	Thu, 21 Dec 2023 13:42:49 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJK1-0031BT-1n;
	Thu, 21 Dec 2023 13:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703166165; x=1734702165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R6miQeV/VuHmO5eVyMe/230bW5y4XCSTO7Hh0DdH/iE=;
  b=CCtEWFc8Sht2Glzp4nUPbjTcGiQjvIZ457oyb8sQMwVepcqYfwApvjGa
   0DXX0PBoZBD7uBC+V8ed6Ww8ovHplFaV+s1hZ3duYrErF8eter290/XIU
   xdGoPd2sbr/JPOeb782qKDDWaK3LklU/j/qOobq2s5nf0Ze9oFzJ88xk+
   Xm73BZARIIGSBrjP5ehZbuCXNTURq7jmeWys5/d/Se0mZ+Kirnu0uIXIc
   M5u0buaoaj2Z/zutTkYB29Oin7qLkAz9Ra9zncNzys2wNpqpWxooMlQ7h
   Kvkgjz5x5vMqeIBMW5becKHcrbpSBwjyZz8FHsV92LnNGQmgG6NuHe2Ro
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="393141730"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="393141730"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="776707125"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="776707125"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:42:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rGJJa-00000007rYy-0CnL;
	Thu, 21 Dec 2023 15:42:18 +0200
Date: Thu, 21 Dec 2023 15:42:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/22] Improve IRQ wake capability reporting and
 update the cros_ec driver to use it
Message-ID: <ZYRAuY1LGdD8_u5K@smile.fi.intel.com>
References: <20231220235459.2965548-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054245_606170_29040F42 
X-CRM114-Status: GOOD (  16.22  )
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

On Wed, Dec 20, 2023 at 04:54:14PM -0700, Mark Hasemeyer wrote:
> Currently the cros_ec driver assumes that its associated interrupt is
> wake capable. This is an incorrect assumption as some Chromebooks use a
> separate wake pin, while others overload the interrupt for wake and IO.
> This patch train updates the driver to query the underlying ACPI/DT data
> to determine whether or not the IRQ should be enabled for wake.
> 
> Both the device tree and ACPI systems have methods for reporting IRQ
> wake capability. In device tree based systems, a node can advertise
> itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
> Interrupt resource descriptors can use the 'SharedAndWake' or
> 'ExclusiveAndWake' share types.
> 
> Some logic is added to the platform, ACPI, and DT subsystems to more
> easily pipe wakeirq information up to the driver.

Just wondering if you used --histogram diff algo when preparing patches.


-- 
With Best Regards,
Andy Shevchenko



