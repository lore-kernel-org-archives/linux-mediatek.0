Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8469C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 10:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfVDESu9BQGAgxW1ROMaN7pi1Bz1O3OPm87qys5IRvA=; b=WTDvvYqFfsyhr/VnD/F9/majT4
	xS/zu6UPL+kRQ2FoHz/nje62zZVDZVaiJJAV5LRBTCTGGzCJRwE2zuRfLlx1PNMDWH6Gh/HdTp7/m
	27aEYsSzyy1i9vZop3y8lN/P73lr7UqxRF5/7wlJQQzvpgWNDhj9WeMODiNxCMhGUANHTGTA86GR/
	o09gWZBWO4z06qmB4gLCEmSpZixAJqMgDJuFWZL3n43L6STdXXByDoaaXucsHZ1ZGOyZ8l+essx9J
	OocHAS/vTopWU6fMQu6b/mwYmMOhC0zCRzQS6UDBQ9E6pzbgcrt4yaje+YtfgUlKYiV9DQI7lRzcv
	5Fi9IkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouWRP-00HRaG-5i; Mon, 14 Nov 2022 10:11:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouWRB-00HRVb-Rj; Mon, 14 Nov 2022 10:11:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3507560FAF;
	Mon, 14 Nov 2022 10:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B2DC433D6;
	Mon, 14 Nov 2022 10:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668420692;
	bh=QwvAOVq2fJvIwPsgNt5K4VGQpKMoNtnaEe10rICI774=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXIPBygAW4o4Cd6O22Jbnovr6UA54g8AiWNlc2E5/N52DHrjPdi3UAOZRO1NuxBih
	 cRAMsqrkAmeXxsISPxeZ5S6tcu03r4T9ka5UhaUxotBqeXFHTEeJWQIbFq5FNPTUzo
	 bB/gDtRzhAvzcT3TqDe9axGHz/l07p6FjIPC0986OglCfffqO2Q0lbDeM3cqs5K23+
	 0wJ5hW2SGiZEDhlcNIQ7gQSssC7jXJVDT5vnGeY00U26k9AHXP7e/90I3EVpany2q7
	 EOESr8yFzlWmmzeMpjI6WqXpwKTz3X+MOjcSWlHMWPO3COxqVyTugDo7RN6A8EU/Nw
	 hBq4rXhw2p7wQ==
Date: Mon, 14 Nov 2022 10:11:25 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 00/11] leds: deduplicate led_init_default_state_get()
Message-ID: <Y3IUTUr/MXf9RQEP@google.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
 <Y1+NHVS5ZJLFTBke@google.com>
 <Y1/qisszTjUL9ngU@smile.fi.intel.com>
 <Y2pmqBXYq3WQa97u@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2pmqBXYq3WQa97u@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_021133_952046_1A5242CF 
X-CRM114-Status: GOOD (  19.30  )
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

On Tue, 08 Nov 2022, Andy Shevchenko wrote:

> On Mon, Oct 31, 2022 at 05:32:26PM +0200, Andy Shevchenko wrote:
> > On Mon, Oct 31, 2022 at 08:53:49AM +0000, Lee Jones wrote:
> > > On Tue, 25 Oct 2022, Andy Shevchenko wrote:
> > > 
> > > > On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > > > > There are several users of LED framework that reimplement the
> > > > > functionality of led_init_default_state_get(). In order to
> > > > > deduplicate them move the declaration to the global header
> > > > > (patch 2) and convert users (patche 3-11).
> > > > 
> > > > Dear LED maintainers, is there any news on this series? It's hanging around
> > > > for almost 2 months now...
> > > 
> > > My offer still stands if help is required.
> > 
> > From my point of view the LED subsystem is quite laggish lately (as shown by
> > this patch series, for instance), which means that _in practice_ the help is
> > needed, but I haven't got if we have any administrative agreement on that.
> > 
> > Pavel?
> 
> So, Pavel seems quite unresponsive lately... Shall we just move on and take
> maintainership?

I had an off-line conversation with Greg who advised me against that.

-- 
Lee Jones [李琼斯]

