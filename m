Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3B9C7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 20:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQEraxRFSRg5kw0raPB+fjyl8X6mOUom0ZxEyamfu4A=; b=SL4cxSgKAyORsyTnVPqJzJsNEA
	YS/iIy9PZ0QRqwBiQn9yJyo1Z5T/0rPwaszQBc1Lz+hfGKD/SNLMbbGlSZQncjmleTJ46hJ9OVPq3
	FSonThdrXjhKdgPsGHMSA5nslk70EQd9gtBztsAc66Ui27vNYQz7rRd7szwp/rJ0OZLuvtkJpuNCd
	cnIz/9b009KxmE4oN2TPMD/1daNyPjZ8UhMZlQkFWLXmT3eGsEp424hZbtrwMlfweBd1okVS0pecc
	AP17OOb8qDlTBPbjGTNjZ9oqoO2qmcKnwsbSgyLq9RO3vbrULT7BbmL+e885AMRgokcjEU+lrvD49
	Z9mNQ5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zdg-00763k-0P;
	Wed, 07 Jun 2023 20:20:16 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zdd-00763D-37
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 20:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686169213; x=1717705213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wbuPh7uoz71kWZlfYlZFIXDMM491BC7Ay1rgJkxp/uA=;
  b=UTR1T2JyhAv+s4QDKsnFymWoD8kFKuv0JVFKl6bCCW6fj1TZrIeLG0Tq
   KCmXJB4pXzvnBgtBozARzk54KoWNQkh3l2YWzl5crI271Qblr3zdypkGD
   MOHlfImu+RAHRfmTDBR7tO5Pkl7oVcywIV5Kef99V8wYQh9vlwJxpjPZ1
   jJFVjHDa9ncfA6QlaK0aLakdtqi5JrNDyVNtYtfg9EsHJ+XY+7RfSws1S
   4c193J2m3dT6EkJHLlKGR/gKjx5tuY//Dsyo2a9niVqJR5S7LPwEYrFxE
   ylMBzKVpP6hYB2UycLqFsCnGpNjgYWnTdQjS8cpFNdUrppM2jWXhO6W6V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354586468"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="354586468"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="712817834"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="712817834"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 13:20:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1q6zdV-001zlx-0Y;
	Wed, 07 Jun 2023 23:20:05 +0300
Date: Wed, 7 Jun 2023 23:20:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Tony Lindgren <tony@atomide.com>,
	John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <ZIDmdLDNitoSJrUO@smile.fi.intel.com>
References: <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com>
 <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
 <20230605122447.GY14287@atomide.com>
 <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
 <20230605131803.GA14287@atomide.com>
 <CAGXv+5GR9TEaNrj4B21H2iukS2kWW=rtoWkoVnWewVsrbcG0Hw@mail.gmail.com>
 <20230606122059.GC14287@atomide.com>
 <CAGXv+5ERwrFgpWBUBTkoawfyyTHU9w=Owiy-2BbCXHwEpZk1tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5ERwrFgpWBUBTkoawfyyTHU9w=Owiy-2BbCXHwEpZk1tA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132014_025894_89ED509C 
X-CRM114-Status: GOOD (  10.95  )
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

On Wed, Jun 07, 2023 at 12:46:51PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jun 6, 2023 at 8:21 PM Tony Lindgren <tony@atomide.com> wrote:

...

> After a bit more testing, it seems the Bluetooth problem is more like
> an undervolt issue.

Undercurrent I believe.
Just my pedantic 2 cents and electronics engineer by education :-)

> If I have WiFi and BT probe at the same time, Bluetooth
> fails. If they probe separately, everything works fine.

-- 
With Best Regards,
Andy Shevchenko



