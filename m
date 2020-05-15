Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88445C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 14:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557E6207CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 14:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEFsUbvv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557E6207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T07n9KJWVZ1usE9Hco5RSevGEWigxqz9a2QhEbjQnw4=; b=sEFsUbvvjBlajX
	jIWMMOmToD9WQAA+q9TDCIwPytubRmoNKJZKWuCmCZnFP6BU2/kuSHT8ZkeiOcLkiQdby+y6ToCte
	RwJRpgvY44qoykSq1ca3wV/l3y0puzI8qv9+euLqMoVNOZYeYnOFw1+n5A1hr1jCtFmi6TfrYeYfF
	jEQhjICTnlXNAxQFTa6R3pgIh5Ion5ZiKeYPvQxjcatMauGEi5x/+gfV0bNVdVP1Bj119nkeSuZ6l
	SkEcp2e6LOhID8ErwB42kUl3dFlJL3DYmJB2nkWvS57RRaEU7iMU3mgzK4TxzNpoL4A61EfXfzbIo
	/Lm4peTjckYj1OfI7Paw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZbfN-00085b-Kw; Fri, 15 May 2020 14:50:25 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbfB-0007wR-Lc; Fri, 15 May 2020 14:50:15 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id D200D80004AB;
 Fri, 15 May 2020 14:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNFvQdwkClUN; Fri, 15 May 2020 17:50:11 +0300 (MSK)
Date: Fri, 15 May 2020 17:50:07 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/4] serial: 8250_dw: Simplify the ref clock rate
 setting procedure
Message-ID: <20200515145007.xjrx5mminxrh374d@mobilestation>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-4-Sergey.Semin@baikalelectronics.ru>
 <20200515140547.GE1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515140547.GE1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_075014_141716_41D1E203 
X-CRM114-Status: GOOD (  17.20  )
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

On Fri, May 15, 2020 at 05:05:47PM +0300, Andy Shevchenko wrote:
> On Thu, May 07, 2020 at 02:31:34AM +0300, Serge Semin wrote:
> > Really instead of twice checking the clk_round_rate() return value
> > we could do it once, and if it isn't error the clock rate can be changed.
> > By doing so we decrease a number of ret-value tests and remove a weird
> > goto-based construction implemented in the dw8250_set_termios() method.
> 
> >  	rate = clk_round_rate(d->clk, baud * 16);
> > -	if (rate < 0)
> > -		ret = rate;
> 
> > -	else if (rate == 0)
> > -		ret = -ENOENT;
> 
> This case now handled differently.
> I don't think it's good idea to change semantics.
> 
> So, I don't see how this, after leaving the rate==0 case, would be better than
> original one.

Semantic doesn't change. The code does exactly the same as before. If it didn't
I either would have provided a comment about this or just didn't introduce the
change in the first place. I guess you just don't see the whole picture of the
method. Take a look in the code. The ret variable's been used to skip the
"p->uartclk = rate" assignment. That's it. So the (rate == 0) will still be
considered as error condition, which causes the clock rate left unchanged.
Here is the code diff so you wouldn't need to dive deep into the driver
sources:

<	clk_disable_unprepare(d->clk);
<	rate = clk_round_rate(d->clk, baud * 16);
<	if (rate < 0)
<		ret = rate;
<	else if (rate == 0)
<		ret = -ENOENT;
<	else
<		ret = clk_set_rate(d->clk, rate);
<	clk_prepare_enable(d->clk);
<
<	if (ret)
<		goto out;
<
<	p->uartclk = rate;
<
<out:
---
>       clk_disable_unprepare(d->clk);
>       rate = clk_round_rate(d->clk, baud * 16);
>       if (rate > 0) {
>              ret = clk_set_rate(d->clk, rate);
>              if (!ret)
>                      p->uartclk = rate;
>       }
>       clk_prepare_enable(d->clk);

-Sergey

> 
> > -	else
> > +	if (rate > 0) {
> >  		ret = clk_set_rate(d->clk, rate);
> > +		if (!ret)
> > +			p->uartclk = rate;
> > +	}
> >  	clk_prepare_enable(d->clk);
> >  
> > -	if (ret)
> > -		goto out;
> > -
> > -	p->uartclk = rate;
> > -
> > -out:
> >  	p->status &= ~UPSTAT_AUTOCTS;
> >  	if (termios->c_cflag & CRTSCTS)
> >  		p->status |= UPSTAT_AUTOCTS;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
