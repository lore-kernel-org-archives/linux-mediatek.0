Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E52C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xH/eIxvu4+ajjIqh6Ada3J1EEQaggFRYIaJlXaFYmyY=; b=halemM18J7ZIwJx+ZTpgQHtruh
	WvBDsqPGaYHxtjYZkd2Q3o9wiw4ZrH/zNnoyeROSnAUGy998O6uC3xvOxel3FzvgXb07y4IYLmdt/
	sXSLybPBXSRAVVG/eoSKuYEsMzW6rHObNMunEjfQAuyyOKYtgtg5IZFhOXRUC+Xcn3YkyiTbYoECl
	rXxdcwtLSv9CxjW2nS7J8JdTVu/JZNP9mnHUgeiWSy4rlMIq6wPtmewRDzZxTdc7ZTjK+Tj0w3vGn
	j1eIyVEWt1xAeH23zCCgUqpKuk6yXw0tdSL43jqUV45tjaoXONSdFxLk/uoEQoK/TarvFNs3oYZqd
	dEJBt5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onNY9-006Pw5-32; Tue, 25 Oct 2022 17:17:13 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onNXw-006Prc-HO; Tue, 25 Oct 2022 17:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666718220; x=1698254220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tWI0CC/wYBfwZBoYYtn6VEm9PD6POSQYRocuvbf90tQ=;
  b=KNTClmIZJw5/rmNq4PkS0rmu2ptkWQ59Og0bSK5lcDi4Jl/av4ftD9Gq
   a9UmDGi8MJMFMP5sxlckmO7m7TZVKF97pQ+FD8A6D25A80QcMta8pkqp7
   KpZGjTr/gaOIfYJuWFiAMKAX+shTgUsJY9/Lw8o4XqS4KQbf7w5vr52ZP
   DmfbfzIy+LYxBZ/Y+FOwQ3KRjNeH/IHbLVhK7xlCp2zNapy/zqLjAKR8S
   ctKkeMOvxKIu2rIsHSl7GzMTQf9zg56EmpoSGrHdR9zwxKJmKSZlhgqKO
   64rR5sRPxOjnoyMrO2dfAQQj1jEDpLL4E/+FjDfbpbE6YNX3MJlQxl/oL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="308834491"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="308834491"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 10:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="609646608"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="609646608"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 25 Oct 2022 10:16:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1onNXj-002Aw0-1l;
	Tue, 25 Oct 2022 20:16:47 +0300
Date: Tue, 25 Oct 2022 20:16:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gene Chen <gene_chen@richtek.com>, Andrew Jeffery <andrew@aj.id.au>,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Message-ID: <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_101700_659200_3EAA4EA4 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> There are several users of LED framework that reimplement the
> functionality of led_init_default_state_get(). In order to
> deduplicate them move the declaration to the global header
> (patch 2) and convert users (patche 3-11).

Dear LED maintainers, is there any news on this series? It's hanging around
for almost 2 months now...

> Changelog v3:
> - added tag to patch 11 (Kurt)
> - Cc'ed to Lee, who might help with LED subsystem maintenance
> 
> Changelog v2:
> - added missed patch 2 and hence make it the series
> - appended tag to patch 7
> - new patch 1
> 
> Andy Shevchenko (11):
>   leds: add missing includes and forward declarations in leds.h
>   leds: Move led_init_default_state_get() to the global header
>   leds: an30259a: Get rid of custom led_init_default_state_get()
>   leds: bcm6328: Get rid of custom led_init_default_state_get()
>   leds: bcm6358: Get rid of custom led_init_default_state_get()
>   leds: mt6323: Get rid of custom led_init_default_state_get()
>   leds: mt6360: Get rid of custom led_init_default_state_get()
>   leds: pca955x: Get rid of custom led_init_default_state_get()
>   leds: pm8058: Get rid of custom led_init_default_state_get()
>   leds: syscon: Get rid of custom led_init_default_state_get()
>   net: dsa: hellcreek: Get rid of custom led_init_default_state_get()
> 
>  drivers/leds/flash/leds-mt6360.c           | 38 +++--------------
>  drivers/leds/leds-an30259a.c               | 21 ++--------
>  drivers/leds/leds-bcm6328.c                | 49 +++++++++++-----------
>  drivers/leds/leds-bcm6358.c                | 32 +++++++-------
>  drivers/leds/leds-mt6323.c                 | 30 ++++++-------
>  drivers/leds/leds-pca955x.c                | 26 +++---------
>  drivers/leds/leds-pm8058.c                 | 29 ++++++-------
>  drivers/leds/leds-syscon.c                 | 49 ++++++++++------------
>  drivers/leds/leds.h                        |  1 -
>  drivers/net/dsa/hirschmann/hellcreek_ptp.c | 45 ++++++++++----------
>  include/linux/leds.h                       | 15 ++++---
>  11 files changed, 143 insertions(+), 192 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko



