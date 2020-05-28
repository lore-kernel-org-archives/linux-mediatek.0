Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C1AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 12:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99B5206C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 12:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZmM7X+a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D99B5206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8XKBjr+eWTi6QfQFyN/PlYemTtYwLyLqc3zsP9mzBc=; b=TZmM7X+asUjHnf
	/A0lObXhtNyNYSRrgRN9ADtAHW1aE+kyAiV9Q8O38Osw8FjUgN+ccTv5PqdpoXyG98onDxV8uGZKx
	XWhw9K00BcF2Jvyiqkx68sextVZgxFStlRPuVsyvoSkNuPDP/P73SWascVGOqrYuBxR1rnlTTd9EX
	XdwS4uW23kFdMxjL3Wypm0DjMjkk60+93fIRK2shA6CCR+DisBvqgPLnZrWLFL6lmIVAJM3X9ToGm
	mrPYySE6kaRS7YFyzSFM1Q26i2Lxvlmui7/DIWd7vDiObRF6UixB2YZKVIaqv+aYAeGzksx9vRd9g
	69U5V9bA7p0JBpRbPtPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeHj8-0004p5-7x; Thu, 28 May 2020 12:33:38 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHj4-0004oI-In
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 12:33:36 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jeHiv-0000ic-LM; Thu, 28 May 2020 14:33:25 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jeHiu-0004hf-5T; Thu, 28 May 2020 14:33:24 +0200
Date: Thu, 28 May 2020 14:33:24 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RESEND PATCH v11 2/3] drivers: input: keyboard: Add mtk keypad
 driver
Message-ID: <20200528123324.baoihyrg7rqjtt6r@pengutronix.de>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
 <20200528090144.54033-3-fengping.yu@mediatek.com>
 <20200528102730.GK1634618@smile.fi.intel.com>
 <20200528114558.5decxsun2o65k2fr@pengutronix.de>
 <20200528122248.GL1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528122248.GL1634618@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:31:38 up 195 days,  3:50, 196 users,  load average: 0.17, 0.13,
 0.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_053335_373274_9A3E4BF9 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fengping Yu <fengping.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20-05-28 15:22, Andy Shevchenko wrote:
> On Thu, May 28, 2020 at 01:45:58PM +0200, Marco Felsch wrote:
> > On 20-05-28 13:27, Andy Shevchenko wrote:
> > > On Thu, May 28, 2020 at 05:01:47PM +0800, Fengping Yu wrote:
> 
> ...
> 
> > > > +	select CONFIG_REGMAP_MMIO
> > > 
> > > This is wrong.
> > 
> > Why is this wrong? The driver uses the rmap-mmio functions.
> 
> In Kconfig CONFIG_ prefix is implied.
> 
> There is no CONFIG_CONFIG_REGMAP_MMIO.
> 
> > Thanks for the explanation =)
> 
> Sorry, I think it's obvious...

Damn, you right it is. Bloody automatism mismatch in my brain.

Regards,
  Marco

> 
> > > > +	select INPUT_MATRIXKMAP
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
