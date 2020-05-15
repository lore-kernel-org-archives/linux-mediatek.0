Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AD8C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 15:06:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F712075F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 15:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nCckB+IA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F712075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYqYCFoAEW2UHo+RZy4ZsQhZpmg8sS97xtfPfU5qFLE=; b=nCckB+IAMT5P1I
	Aog1f4VZNpb3IXv5KNtEAqSzzoHp1DwQE9x4xOxwHN8NpsFzL7xZD6JdN0Yhih798ixWFOoNBI+4x
	rUzRfmJnBcJSopdxErnk49ggSOepu4yXZ4yxTJ8ms+QHyScuCvfETAsXEavb0uGbNtkyXMOcv7dMT
	SGC8VvLcVke/PqM2kiraiOA7/qmLmTHgwAJMCAm7zJJKPdCXn/v3KDeDcwAmbH+RO1rKpiSgFMX90
	zsNzXXwV5HV8hdFbryqpngorZByZ4JrL87EyV6fTNJCZWJL2jC5fRW7v6m9Fx3OJHWCxvDoaYqLh+
	A/44Ctg4IZBTfHB1vOww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZbuT-0006UH-5t; Fri, 15 May 2020 15:06:01 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbuF-0006KG-If; Fri, 15 May 2020 15:05:48 +0000
IronPort-SDR: 4xaC1kudpJFFgAkHpf713fyW1qgYTCRPIfQ5TcL9q/n7f6B2yIfAu1xhO1zQUl48kPf218XWoU
 W8ZNjE3N/PfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 08:05:46 -0700
IronPort-SDR: EX+/kA0HXNH84sqyToqDVeH2rEi9LIuOqiQ6K0oN24pfAe2f1Rat9eUkw4gWcL3iD9ayQ886Np
 VcYqaY6I9WsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="252057189"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 15 May 2020 08:05:40 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jZbuA-006tTf-Vz; Fri, 15 May 2020 18:05:42 +0300
Date: Fri, 15 May 2020 18:05:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 3/4] serial: 8250_dw: Simplify the ref clock rate
 setting procedure
Message-ID: <20200515150542.GN1634618@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-4-Sergey.Semin@baikalelectronics.ru>
 <20200515140547.GE1634618@smile.fi.intel.com>
 <20200515145007.xjrx5mminxrh374d@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515145007.xjrx5mminxrh374d@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_080547_631659_958FE732 
X-CRM114-Status: GOOD (  20.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Ripard <mripard@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Paul Burton <paulburton@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Long Cheng <long.cheng@mediatek.com>, linux-mediatek@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-mips@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 05:50:07PM +0300, Serge Semin wrote:
> On Fri, May 15, 2020 at 05:05:47PM +0300, Andy Shevchenko wrote:
> > On Thu, May 07, 2020 at 02:31:34AM +0300, Serge Semin wrote:
> > > Really instead of twice checking the clk_round_rate() return value
> > > we could do it once, and if it isn't error the clock rate can be changed.
> > > By doing so we decrease a number of ret-value tests and remove a weird
> > > goto-based construction implemented in the dw8250_set_termios() method.
> > 
> > >  	rate = clk_round_rate(d->clk, baud * 16);
> > > -	if (rate < 0)
> > > -		ret = rate;
> > 
> > > -	else if (rate == 0)
> > > -		ret = -ENOENT;
> > 
> > This case now handled differently.
> > I don't think it's good idea to change semantics.
> > 
> > So, I don't see how this, after leaving the rate==0 case, would be better than
> > original one.
> 
> Semantic doesn't change. The code does exactly the same as before. If it didn't
> I either would have provided a comment about this or just didn't introduce the
> change in the first place. I guess you just don't see the whole picture of the
> method. Take a look in the code. The ret variable's been used to skip the
> "p->uartclk = rate" assignment. That's it. So the (rate == 0) will still be
> considered as error condition, which causes the clock rate left unchanged.
> Here is the code diff so you wouldn't need to dive deep into the driver
> sources:
> 
> <	clk_disable_unprepare(d->clk);
> <	rate = clk_round_rate(d->clk, baud * 16);
> <	if (rate < 0)
> <		ret = rate;
> <	else if (rate == 0)
> <		ret = -ENOENT;
> <	else
> <		ret = clk_set_rate(d->clk, rate);
> <	clk_prepare_enable(d->clk);
> <
> <	if (ret)
> <		goto out;
> <
> <	p->uartclk = rate;
> <
> <out:
> ---
> >       clk_disable_unprepare(d->clk);
> >       rate = clk_round_rate(d->clk, baud * 16);
> >       if (rate > 0) {
> >              ret = clk_set_rate(d->clk, rate);
> >              if (!ret)
> >                      p->uartclk = rate;
> >       }
> >       clk_prepare_enable(d->clk);

Thanks.
Indeed, in the above it looks clear.



-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
