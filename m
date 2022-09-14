Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF65ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blXnTE8a6WKoRc8z4kKhiUfV0NKdEpa+SEJYaOlxE6I=; b=3RNRfkejPz5dytIXXRkxUkiBmN
	jBc8btKz9P1AjzgzikZSYrKi6uIa+DpXsQBo49sadCSvCU6AbaNkHJXWUUKSvTatpTrbPf9dZFfvU
	4Gu6q/qGBjRv/WwNMbZJ2DhBJpAGvugoOrMFbwvCbxqOQXYSbiXSrQ+8C0lyIJtNl08jwTFpqD34I
	1Iq3JcudUmjDg+VaC0QdgcToad7y22GV7QRtxcRLCFjVSaBZ6DkW1T+gokU4gWwftZMrDo425YfPn
	Mqb4Gfs5eoVFQhniAeya+F8aEeWa+J2SIK47FAp7k7c6BK3Y1jEdWas6Ajcr/dYqv9nG3tfAxr0u9
	+h4nTdyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPyx-00FQ0O-My; Wed, 14 Sep 2022 10:51:03 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPyi-00FPi4-Bu; Wed, 14 Sep 2022 10:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663152648; x=1694688648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FJYMs62ascLSw9OHOfFlHvVTgyDpbA2c8qbkQOb1Nks=;
  b=Dl5UCUQxhHxxDO0R2x5/lxZavW9jSK1946MpQBQYltXTeWDQbDT47GzS
   03Lojlid7FJB+mEldh3HM2Fomd1Z5RVSiXJ+PMt7ku+gTskO8k1N+cSpO
   ZuEibLVDZDayjUm1Y2dfEU9DrHkzxDjxzKkpF97X0Kh60pzt6E8gAZ1ua
   sVcKOkuVo3N0jlv1Ge7R1TBdqXCNyMl4jr9heF/D48K4fs4B6cr96n5ms
   gVA0OwPsN7quowIxnm0EwNrfeYeoVjEvE8WiC05G4ApvyKoS2/cvSIU6h
   l8iF2XK5lP1xuHK+jR92R8GvEJM09flizRBQFQIsjKU1+7Se4sBJ8+mbX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="295984878"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="295984878"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 03:50:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="705918476"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 03:50:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oYPyY-002A7j-1g;
	Wed, 14 Sep 2022 13:50:38 +0300
Date: Wed, 14 Sep 2022 13:50:38 +0300
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
Message-ID: <YyGx/t8rLY59HXju@smile.fi.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_035048_433962_A5E6EB8A 
X-CRM114-Status: GOOD (  12.10  )
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

Can this be applied now?

Lee, Pavel, what do you think?

> Changelog v3:
> - added tag to patch 11 (Kurt)
> - Cc'ed to Lee, who might help with LED subsystem maintenance
> 
> Changelog v2:
> - added missed patch 2 and hence make it the series
> - appended tag to patch 7
> - new patch 1

-- 
With Best Regards,
Andy Shevchenko



