Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFB1FA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcn3vAQRNrAE/pkchFiZsx/QcZxKnM6OJ25GvSTJfWk=; b=pA7XSGFuaGQWt4JL9dKtjSPEgK
	32oDxn8BU2Y6DpSdVyj/64sb0znBNlYaVRfWhNRAsBbqpl3M25vbUSTus/WtJQE1MFzA0f5dQyB+E
	650NloXtJM4UPAPWzD7uTHSauKRyGOjTnY7k3zzsLlk7uavwLTy/yobBfBoSeuXbqNHjoXMgxtkd6
	TgO3vOg/xNptJcc4u3SxV0cEKU4tMaagMLrQE+4gK5orEWKk34b2Bt7tY6c9ulp6VVR4+edSR2MTG
	4h1uUGVmMAqRn28jrGjg+HEu/M0ZUZSeWTXtKq+e9MEB65LVlJONNccsKybi4vYq6TRf1zI9KtKIB
	u7NJ6lNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWmM-00Cd3A-D9; Mon, 31 Oct 2022 15:32:46 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWmC-00CcyU-4A; Mon, 31 Oct 2022 15:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667230356; x=1698766356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=njbyewzlB0I61UcEx1gvn+c62w1UHRxU4mCpMpRMQrs=;
  b=Rre5HojfDNFCCrlQxXv6b6joFwfoaoHUfkQaZNpuJemeSSzpVjVHIHwd
   C3BLWLXZVHFMBwN0r1EjficBGI4OMxYIHoRETvQUbGQhm2Rsn2i6aBxau
   UCfOGH+ue4UU26ouBLTDBAI/oVGs3ap4qA1EjiUbvI4mHWEytZqsC0IAt
   YBc+WdEK5h31gu4LL57XxQatVbk2xKWqu7uMv2G6fEItCL6uLwgBzG+Ut
   oSMTG2FdCcwIDjYlUhsLFt+8ntLFYhDKyidp2aGKtSlSwlnLn9q30CVan
   l21cmfsmNapGRrQ36TtAoXsctfffA3UEX3Fc4gF8G0nD4KvhR15MCPnZL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310626645"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="310626645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 08:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="611527071"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="611527071"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 31 Oct 2022 08:32:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1opWm2-005Av2-1x;
	Mon, 31 Oct 2022 17:32:26 +0200
Date: Mon, 31 Oct 2022 17:32:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Gene Chen <gene_chen@richtek.com>, Andrew Jeffery <andrew@aj.id.au>,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Message-ID: <Y1/qisszTjUL9ngU@smile.fi.intel.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
 <Y1+NHVS5ZJLFTBke@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1+NHVS5ZJLFTBke@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_083236_239770_F74202C7 
X-CRM114-Status: GOOD (  15.14  )
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

On Mon, Oct 31, 2022 at 08:53:49AM +0000, Lee Jones wrote:
> On Tue, 25 Oct 2022, Andy Shevchenko wrote:
> 
> > On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > > There are several users of LED framework that reimplement the
> > > functionality of led_init_default_state_get(). In order to
> > > deduplicate them move the declaration to the global header
> > > (patch 2) and convert users (patche 3-11).
> > 
> > Dear LED maintainers, is there any news on this series? It's hanging around
> > for almost 2 months now...
> 
> My offer still stands if help is required.

From my point of view the LED subsystem is quite laggish lately (as shown by
this patch series, for instance), which means that _in practice_ the help is
needed, but I haven't got if we have any administrative agreement on that.

Pavel?

-- 
With Best Regards,
Andy Shevchenko



