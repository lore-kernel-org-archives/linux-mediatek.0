Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C4AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2z5cRFXIiWX0/OVFjtXxX6Z4kJxEJNaSjp59omYIYh4=; b=QJ1YSoO2iZZqUcTBTrihOcHyfP
	8QrK0veqS51sspyDkb/DdrjalPkTAB5Vk0/UdX45RskJj7sekFUZrz+JEkvww3O/Wpa48wki2WUkU
	1mlSXHPI8MwRSXOe3kkqcybfSLRFAUFonY1wFEmkJku/yBuaF3JL2Qmft6dNxqtmjDk8i0qILxPPU
	IUaAkdQByueDVbWmQGFAl/9kSPLwDFV8fRg+tXa0FCr4N86N+/5ony82T2N49SRiek2bFMXTeDrx7
	aeVAWcy+K+sEVnbpu/js42Ez090AUbxyE86352pkH1buYEqvNbmoypghjTRjCie+XzqJadLIQFXTX
	EDy4Pp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzL6-00581u-2D;
	Wed, 19 Jul 2023 05:03:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzL1-0057y5-3B;
	Wed, 19 Jul 2023 05:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2z5cRFXIiWX0/OVFjtXxX6Z4kJxEJNaSjp59omYIYh4=; b=W97rpZIeCI+XoTQdjBNEpTdtQv
	Z1toQSY90VHA1ZHb3oP8gEDRnk9ImOrwUo7MC/4ehwQz4Is48/ampkp4tyHvJ4we9LdsTl3gHnZmJ
	9HBNh2K6DYGR9kCgofh7PKjZRofj1Ct4NQ4iVGeZY9L7FWSbLNybky8TpVBBdQVo/ewMNK4FPUPm8
	3YONrHthndiB8CHjq99t+yHof4lXyXX4013hJvSfmQC4VWHMZsF/2WQbVfed/lx1hYTaiAxhIcqLL
	y7/aBRFgaFK/cZprV9OmHr2RJaB5V0jUKy6Zv8LrRF+aj7tLqMe7USoR9PB2arw+2tVIzqp3JxvjX
	48w7elvg==;
Received: from mga12.intel.com ([192.55.52.136])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLlA2-00Bagh-0W;
	Tue, 18 Jul 2023 13:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689688482; x=1721224482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ophA10kUFzoNAqizRgztDPJPsGfNIY1vmJXIIYiDlc=;
  b=hc2cSfasEVx85zWdM14gRb9qg3AW54hbGFobRsx8w7e+aNXgnFpXR8aQ
   iGlnbk3CxmdusPoIOdhQ9cUSj9qlq2VWQhWH7of7XkrZ50fUuX92WgTP8
   jwhKgznQWqXIo+CvPS/Yj3IUZvdeZJVOsQ4vNXz0WGoE2xEcMKfbErOf9
   9HYdsF47lfvI24p8I4Has1ybiiyzUuX4zcgrteL6KlGFIjmWN61vsKU2W
   w53WvjBlB+MUQ58o2t4FAshlIemcVohOJji9T/XFHcb3byHvP0RAAgoT4
   yteoKD5zNmt8uL/q01mwIn7z+SoS1Vor4LpG03i38/PDNIB/hddGtFrpa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345803489"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="345803489"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 06:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847708035"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="847708035"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 06:53:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qLl8r-00Fuul-36;
	Tue, 18 Jul 2023 16:53:29 +0300
Date: Tue, 18 Jul 2023 16:53:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sean Wang <sean.wang@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 04/10] pinctrl: intel: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <ZLaZWcyJAnQMK87f@smile.fi.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
 <20230718110451.00001227@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718110451.00001227@Huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145443_020663_6F166BE1 
X-CRM114-Status: GOOD (  13.32  )
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

On Tue, Jul 18, 2023 at 11:04:51AM +0100, Jonathan Cameron wrote:
> On Mon, 17 Jul 2023 20:28:15 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> >  EXPORT_SYMBOL_GPL(intel_pinctrl_resume_noirq);
> 
> Can you check if this is successfully removed?  I think it won't be.
> Not immediately obvious how to tidy that up given these are used
> in a macro called from lots of drivers.

That's what Paul noticed I think with his proposal to export only the ops
variable and make these to be static.

> Maybe just leaving the ifdef is best we can do here.

See above.

-- 
With Best Regards,
Andy Shevchenko



