Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91084C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/6hqGuL7tdHQDLsHpXHVJkp70IHsdxPldR1MaHdJFw=; b=jZrkP7M70R0E76clvuCTsLaXjW
	SuCRHnXfJIiW/PG2EUxOhk07Kcg4Ftrr/5fNvhQJoxWskJwxbo8Idy/IPQf/y/ctqROrMgafs9ofs
	ljVXOJ3PSZOBOSp6Yn61TxmiEHyi/I2jfXFA6J4bsv1VDMeQgUGVX6noPXVgqS1LpEbb187j3Gtjd
	VEbS66rwupfjZWKsvoS+2xUKq2fvLhwghbPR1KY7Qsfj7aGlRj06+zu4lEjQNKisgzW4cxzU10gZm
	QmaBA8IXUAlUUNCwQFyLelI/9kF9NysEi8eu3vsvqnQO/yRWiNXEXj6FhFfZAx3aYmSYEG5pAs2/v
	Stpzh7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouWuT-0001tc-6z; Mon, 14 Nov 2022 10:41:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouWuH-0001oM-I6; Mon, 14 Nov 2022 10:41:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF2E4B80DAE;
	Mon, 14 Nov 2022 10:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5636C433D6;
	Mon, 14 Nov 2022 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668422494;
	bh=+NWKJ+0AC8Jgz8dRFVwYfGZ7NuudhxZusORMCmUpF6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RF2dcXrTT36pZVRaXF0AlMUvVQGzwdW6CpY5JTYmMjEeLeHr0zVCMkIyvprQJq/Qx
	 UDHD/Y8en3Fp5M8JBUazicfZGksvR7QwVMIDPhMnFVRX8A8A8yHRFZTd4ovPKvaX/J
	 YgOBoVx3JASJQAHv6V7UitYZF7sOkCpAnRy9NvAI=
Date: Mon, 14 Nov 2022 11:41:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Gene Chen <gene_chen@richtek.com>,
	Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
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
Message-ID: <Y3IbW5/yTWE7z0cO@kroah.com>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <Y1gZ/zBtc2KgXlbw@smile.fi.intel.com>
 <Y1+NHVS5ZJLFTBke@google.com>
 <Y1/qisszTjUL9ngU@smile.fi.intel.com>
 <Y2pmqBXYq3WQa97u@smile.fi.intel.com>
 <Y3IUTUr/MXf9RQEP@google.com>
 <Y3IWMe5nGePMAEFv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3IWMe5nGePMAEFv@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_024137_754541_B54F9936 
X-CRM114-Status: GOOD (  21.70  )
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

On Mon, Nov 14, 2022 at 12:19:29PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 14, 2022 at 10:11:25AM +0000, Lee Jones wrote:
> > On Tue, 08 Nov 2022, Andy Shevchenko wrote:
> > > On Mon, Oct 31, 2022 at 05:32:26PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Oct 31, 2022 at 08:53:49AM +0000, Lee Jones wrote:
> > > > > On Tue, 25 Oct 2022, Andy Shevchenko wrote:
> > > > > 
> > > > > > On Tue, Sep 06, 2022 at 04:49:53PM +0300, Andy Shevchenko wrote:
> > > > > > > There are several users of LED framework that reimplement the
> > > > > > > functionality of led_init_default_state_get(). In order to
> > > > > > > deduplicate them move the declaration to the global header
> > > > > > > (patch 2) and convert users (patche 3-11).
> > > > > > 
> > > > > > Dear LED maintainers, is there any news on this series? It's hanging around
> > > > > > for almost 2 months now...
> > > > > 
> > > > > My offer still stands if help is required.
> > > > 
> > > > From my point of view the LED subsystem is quite laggish lately (as shown by
> > > > this patch series, for instance), which means that _in practice_ the help is
> > > > needed, but I haven't got if we have any administrative agreement on that.
> > > > 
> > > > Pavel?
> > > 
> > > So, Pavel seems quite unresponsive lately... Shall we just move on and take
> > > maintainership?
> > 
> > I had an off-line conversation with Greg who advised me against that.
> 
> OK. What the reasonable option we have then?

I thought there is now a new LED maintainer, is that not working out?

