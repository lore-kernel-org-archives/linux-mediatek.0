Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C896BC10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 14:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9983C20663
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 14:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4Yzqw1R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="arv7/+jv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9983C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5w6RC2wsGAkn3uwqKvPB1qDuLBCXWgMej07BW1LQKgE=; b=s4Yzqw1RCP3xVF
	HYQ6JkkhJZ2VMqE9ccYfwzzo9+rG7y4FidznQ1Exg3Wf9vKBiblk3tlbNgpyssFFbBLpy+GKFASNJ
	B3+EoznSBNrjjO/U7k92aqQn1BRhZIDQUqbnpbayYpu3WunghPwQUBvizcGCqWzMzZxtiujI4B53S
	FiZcZo/47ZP15ij8AQMnLL+Cz6YHskjji74i8qzshsyrS4CsApnG8Mr4J9mo7go2/6lEZ4vAY4X6w
	74lxJAxxL5h1njGARJ3oxqWFIkZ+L+sC3zL5GuxYaDoF9Kk8DNiH7nFU1cSlRk12ys5iX1RbYNo67
	3OeTBzPLbjdOwos4741g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCOYQ-0008Fe-4x; Thu, 12 Mar 2020 14:11:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCOYD-0007vj-Dc; Thu, 12 Mar 2020 14:11:06 +0000
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10BBE206E7;
 Thu, 12 Mar 2020 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584022264;
 bh=R/lnE+ckVywNCWcx1gHvO2Mh70J2f5SW32TxuQf+zGI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=arv7/+jvUj9iJWfWlYdgqEG39OScPnVN8+yN/RSHbmQJwGazVMLlVu+Tctn3gdPTX
 FNdntEiwli27ScYUOBN6gfOPY6ZhjBhMcMl/D3RquqPL+Y8s6k9qxCCbZiR8x3ervB
 d5gWiTZ8T/wMs4bdrTy0xx25QCxA3drilWiFDdc0=
Date: Thu, 12 Mar 2020 09:11:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH 4/5] pci: handled return value of platform_get_irq
 correctly
Message-ID: <20200312141102.GA93224@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e413f63-06e3-9613-97dc-ff5968a4f759@free.fr>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_071105_501246_7C9DDCB7 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Aman Sharma <amanharitsh123@gmail.com>, linux-kernel@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marc Zyngier <maz@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mans Rullgard <mans@mansr.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[+cc another Marc]

On Thu, Mar 12, 2020 at 10:53:06AM +0100, Marc Gonzalez wrote:
> On 11/03/2020 20:19, Aman Sharma wrote:
> 
> > diff --git a/drivers/pci/controller/pcie-tango.c b/drivers/pci/controller/pcie-tango.c
> > index 21a208da3f59..18c2c4313eb5 100644
> > --- a/drivers/pci/controller/pcie-tango.c
> > +++ b/drivers/pci/controller/pcie-tango.c
> > @@ -273,9 +273,9 @@ static int tango_pcie_probe(struct platform_device *pdev)
> >  		writel_relaxed(0, pcie->base + SMP8759_ENABLE + offset);
> >  
> >  	virq = platform_get_irq(pdev, 1);
> > -	if (virq <= 0) {
> > +	if (virq < 0) {
> >  		dev_err(dev, "Failed to map IRQ\n");
> > -		return -ENXIO;
> > +		return virq;
> >  	}
> >  
> >  	irq_dom = irq_domain_create_linear(fwnode, MSI_MAX, &dom_ops, pcie);
> 
> Weee, here we go again :-)
> 
> https://patchwork.kernel.org/patch/11066455/
> https://patchwork.kernel.org/patch/10006651/
> 
> Last time around, my understanding was that, going forward,
> the best solution was:
> 
> 	virq = platform_get_irq(...)
> 	if (virq <= 0)
> 		return virq ? : -ENODEV;
> 
> i.e. map 0 to -ENODEV, pass other errors as-is, remove the dev_err
> 
> @Bjorn/Lorenzo did you have a change of heart?

Yes.  In 10006651 (Oct 20, 2017), I thought:

  irq = platform_get_irq(pdev, 0);
  if (irq <= 0)
    return -ENODEV;

was fine.  In 11066455 (Aug 7, 2019), I said I thought I was wrong and
that:

  platform_get_irq() is a generic interface and we have to be able to
  interpret return values consistently.  The overwhelming consensus
  among platform_get_irq() callers is to treat "irq < 0" as an error,
  and I think we should follow suit.
  ...
  I think the best pattern is:

    irq = platform_get_irq(pdev, i);
    if (irq < 0)
      return irq;

I still think what I said in 2019 is the right approach.  I do see
your comment in 10006651 about this pattern:

  if (virq <= 0)
    return virq ? : -ENODEV;

but IMHO it's too complicated for general use.  Admittedly, it's not
*very* complicated, but it's a relatively unusual C idiom and I
stumble over it every time I see it.  If 0 is a special case I think
it should be mapped to a negative error in arch-specific code, which I
think is what Linus T suggested in [1].

I think there's still a large consensus that "irq < 0" is the error
case.  In the tree today we have about 1400 callers of
platform_get_irq() and platform_get_irq_byname() [2].  Of those,
almost 900 check for "irq < 0" [3], while only about 150 check for
"irq <= 0" [4] and about 15 use some variant of a "irq ? : -ENODEV"
pattern.

The bottom line is that in drivers/pci, I'd like to see either a
single style or a compelling argument for why some checks should be
"irq < 0" and others should be "irq <= 0".

[1] https://yarchive.net/comp/linux/zero.html
[2] $ git grep "=.*platform_get_irq" | wc -l
    1422
[3] $ git grep -A4 "=.*platform_get_irq" | grep "<\s*0" | wc -l
    894
[4] $ git grep -A4 "=.*platform_get_irq" | grep "<=\s*0" | wc -l
    151
[5] $ git grep -A4 "=.*platform_get_irq" | grep "return.*?.*:.*;" | wc -l
    15

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
