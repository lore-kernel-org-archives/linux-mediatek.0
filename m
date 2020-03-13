Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F62C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 21:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B77C82074E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 21:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f5SiCojd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGwnI/g5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B77C82074E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cBoGZAfJb4X8yneZBwpr24AHeTBvBaoQWIdnJoo+tgo=; b=f5SiCojdjhj1Jy
	nnzlDbouodqwj7VJoAKfCUU+WWrIn94Scz4opUpIB79HVtkBUtO0Vr+02pD4hV3xJW1dfLu62rGPB
	CtoUIyQrzH6qLlQhF06gRRbcXxLuHT8vsrEK0wwQ7hexsca5OMOwt6Q1SID9RUHkcxq8T7zQYHwCD
	+UBdWT0QoVsF6n25jk+wqVgHbfhTSf3HrdBxZpsq5YPbyLp4/wHPKbjHHkD1paCrn6FpqJtx0ETW3
	S5uaP0Rb+QxvTffTkN4azdGwa/PhdIZFqBskbQ71xyIFLwQ9uW/X+yihvRv/0HITGjM+LMcIWKwTB
	rW3TuWwpJMcYLEDO3c6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCsId-0000Eq-Qa; Fri, 13 Mar 2020 21:56:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCsIT-00005k-As; Fri, 13 Mar 2020 21:56:50 +0000
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52D012074E;
 Fri, 13 Mar 2020 21:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584136604;
 bh=9O3iTubGfZzMntn4/LYM5c2/iBnmaQdlBrLdH9sNka0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=cGwnI/g5mqZKrZocmKyebIRUAXd9e+X/FWCRYP5pMFRVDyg9jjtoGFmEaF7Zyj+Fa
 tH0B7K42/EpeIAb6FNX3DzbuRb9Zsi5ujH7RZ1yIstubErjjVFm+jYNh7Qr3VA2FLZ
 uVllTIs25LDNGiev2L2gK5nLkQrjFRrImlhC7NTM=
Date: Fri, 13 Mar 2020 16:56:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 4/5] pci: handled return value of platform_get_irq
 correctly
Message-ID: <20200313215642.GA202015@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871rpwhsnd.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_145649_397966_842C42C4 
X-CRM114-Status: GOOD (  15.61  )
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

On Fri, Mar 13, 2020 at 10:05:58PM +0100, Thomas Gleixner wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> > On Thu, Mar 12, 2020 at 10:53:06AM +0100, Marc Gonzalez wrote:
> >> Last time around, my understanding was that, going forward,
> >> the best solution was:
> >> 
> >> 	virq = platform_get_irq(...)
> >> 	if (virq <= 0)
> >> 		return virq ? : -ENODEV;
> >> 
> >> i.e. map 0 to -ENODEV, pass other errors as-is, remove the dev_err
> >> 
> >> @Bjorn/Lorenzo did you have a change of heart?
> >
> > Yes.  In 10006651 (Oct 20, 2017), I thought:
> >
> >   irq = platform_get_irq(pdev, 0);
> >   if (irq <= 0)
> >     return -ENODEV;
> >
> > was fine.  In 11066455 (Aug 7, 2019), I said I thought I was wrong and
> > that:
> >
> >   platform_get_irq() is a generic interface and we have to be able to
> >   interpret return values consistently.  The overwhelming consensus
> >   among platform_get_irq() callers is to treat "irq < 0" as an error,
> >   and I think we should follow suit.
> >   ...
> >   I think the best pattern is:
> >
> >     irq = platform_get_irq(pdev, i);
> >     if (irq < 0)
> >       return irq;
> 
> Careful. 0 is not a valid interrupt.

Should callers of platform_get_irq() check for a 0 return value?
About 900 of them do not.

Or should platform_get_irq() return a negative error instead of 0?
If 0 is not a valid interrupt, I think it would be easier to use the
interface if we made it so platform_get_irq() could never return 0,
which I think would also fit the interface documentation better:

 * Return: IRQ number on success, negative error number on failure.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
