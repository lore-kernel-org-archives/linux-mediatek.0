Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21A5C1975A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 22:04:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8278520714
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 22:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bx7BRC+b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1QGfUU91"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8278520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ShWlON4r2DWhdbjmEcHicmrGADBe9ZF7AItRjWEJkuQ=; b=bx7BRC+bP8gEu0
	f1FhVfk3Zqw9ePhJBSYLKVRONtZhqpHPlPGYXr6s8U5INySkDwTkhyY5i3sEXsUUKDiAFL8MoMtfg
	8qv+iDy5Zq6adOR89qBWWO0uqiQfTZGEVPeoK/9vudGsgxoe9P3tDd3/1eqTk1aXnR9BjYpB8Cb8T
	uzTC9v77La8a3qHRtf5OaP+HhSmP6pTpg5AHrM6PuXwy39cAgo7JcoSKWOl9ISkxHO6tSFs2OvcMi
	1PF46x9WxUWhE+yJOLnBvnZP1s5DApr0n6p+jh+2wgJwA5VU7kIombW8VGPd2+jc1pZRNy0JVrXys
	T+Flr8PDc7v+2xMV8Bsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEKJT-00052J-5S; Tue, 17 Mar 2020 22:03:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEKJF-0004qx-O7; Tue, 17 Mar 2020 22:03:39 +0000
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BC4B20714;
 Tue, 17 Mar 2020 22:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584482616;
 bh=NRUE2ckhs8n5Ozlq9QGah87GvPHMhCBA9ESXYy5Zdtg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=1QGfUU91mkGNhqaAE5qkukrE5YGD0RThABDfnFSsg6yyPBnpZ/OoVSS8JJFuWo23r
 ThYXwUFPgcoopP7DR1QbWF1dlJInVWRqKWlMr64DZHN0CZJTsg5h3FzHB7jeKPHdn0
 O36i7OCDqShLa3H4tFGVcqvDcEDogrn3BnfyYFBg=
Date: Tue, 17 Mar 2020 17:03:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 4/5] pci: handled return value of platform_get_irq
 correctly
Message-ID: <20200317220334.GA230141@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313215642.GA202015@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_150337_828858_67321306 
X-CRM114-Status: GOOD (  21.22  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Aman Sharma <amanharitsh123@gmail.com>, linux-kernel@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marc Zyngier <maz@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mans Rullgard <mans@mansr.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 13, 2020 at 04:56:42PM -0500, Bjorn Helgaas wrote:
> On Fri, Mar 13, 2020 at 10:05:58PM +0100, Thomas Gleixner wrote:
> > Bjorn Helgaas <helgaas@kernel.org> writes:
> > > On Thu, Mar 12, 2020 at 10:53:06AM +0100, Marc Gonzalez wrote:
> > >> Last time around, my understanding was that, going forward,
> > >> the best solution was:
> > >> 
> > >> 	virq = platform_get_irq(...)
> > >> 	if (virq <= 0)
> > >> 		return virq ? : -ENODEV;
> > >> 
> > >> i.e. map 0 to -ENODEV, pass other errors as-is, remove the dev_err
> > >> 
> > >> @Bjorn/Lorenzo did you have a change of heart?
> > >
> > > Yes.  In 10006651 (Oct 20, 2017), I thought:
> > >
> > >   irq = platform_get_irq(pdev, 0);
> > >   if (irq <= 0)
> > >     return -ENODEV;
> > >
> > > was fine.  In 11066455 (Aug 7, 2019), I said I thought I was wrong and
> > > that:
> > >
> > >   platform_get_irq() is a generic interface and we have to be able to
> > >   interpret return values consistently.  The overwhelming consensus
> > >   among platform_get_irq() callers is to treat "irq < 0" as an error,
> > >   and I think we should follow suit.
> > >   ...
> > >   I think the best pattern is:
> > >
> > >     irq = platform_get_irq(pdev, i);
> > >     if (irq < 0)
> > >       return irq;
> > 
> > Careful. 0 is not a valid interrupt.
> 
> Should callers of platform_get_irq() check for a 0 return value?
> About 900 of them do not.
> 
> Or should platform_get_irq() return a negative error instead of 0?
> If 0 is not a valid interrupt, I think it would be easier to use the
> interface if we made it so platform_get_irq() could never return 0,
> which I think would also fit the interface documentation better:
> 
>  * Return: IRQ number on success, negative error number on failure.

Trying again -- I'm not quite catching your meaning, Thomas.

If platform_get_irq*() can return 0, but 0 is not a valid IRQ, I think
it's sort of complicated to parse that return value.  Drivers that
require an IRQ would do this:

  irq = platform_get_irq(pdev, i);
  if (irq < 0)
    return irq;
  if (irq == 0)
    return -EINVAL;         # error since driver requires IRQ
  return devm_request_irq(dev, irq, ...);

Drivers that can either use an IRQ or do polling would do this:

  irq = platform_get_irq(pdev, i);
  if (irq <= 0)
    return setup_polling();
  return devm_request_irq(dev, irq, ...);

I think those are sort of ungainly, especially the first.  If we made
it so those functions never returned 0, drivers that need an IRQ could
do this:

  irq = platform_get_irq(pdev, i);
  if (irq < 0)
    return irq;
  return devm_request_irq(dev, irq, ...);

and drivers that support polling could do this:

  irq = platform_get_irq(pdev, i);
  if (irq < 0)
    return setup_polling();
  return devm_request_irq(dev, irq, ...);

That seems a lot easier to get correct, and it matches what most of
the callers already do.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
