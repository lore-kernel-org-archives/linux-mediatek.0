Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Dec 2021 23:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1s2xw0q+ryJSyLAloymILpQ6zM8mDao//E4a7516tk=; b=KKrctbgq9vxddy
	3Nqzod0i7UZTbV8vVnL9F2HNzhp5VlMPJ3R7F43eRjB/gypEiyhTHpJpoOKBJRcMaDfgw/Zf/1n2t
	XGTSvqrf3eIXD+2xXhccdTSO3YEOuFBuPwCzIAE04sa8H+M1pIgcAO6VBmUbWxYtOq6MbVKf5uIv3
	EjB3xVexTPvSKESal0Xo21IXJugxvtzEJMaUn0+SimVNOYysB4zFtPN9NoCQQKJ1wBTGKoSe+k5ek
	bGNB+nIQNUuyxAYwDNMBQ0qKfBtZshKynUEoq5TxYbLLMHLyqNgKS3+BNuqJNAqRSTyC0rKrUswrj
	bYS+ROMrUOOt5K+EdudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1Gp0-00FBRr-Ce; Sat, 25 Dec 2021 23:51:30 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Goo-00FBQA-Sp; Sat, 25 Dec 2021 23:51:20 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id f9so35856632ybq.10;
 Sat, 25 Dec 2021 15:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mab5mMpRybDmvoFxs8lTizsm2eo8VhM1MviNWFKkilM=;
 b=fueTjS1Z1RSllHtzC0ybZBt1a6OdyayQl85pLbdG1o9AIgydmuPrOFqFC0L3LvxOXl
 5foeNBGKeXHj/HpfgE8th+ow9kLSxQReYQ6mZ57GliCp8ldlT3D2VJtjalV6h+U/jqDO
 Ey+eIL628icYfvC7qDca8DjdBnUHYvJOrzMU6BA+2quGVp7WyAMJQ8IQXcYpThhXV7SN
 kwUOLd1AcsSSb5YWm0uO404rV9+0eIDr1AAbIp1IRAATKnhmY/+EDDSsOGxJGojB1gca
 Ckljl7/T/rOU4g+n2BPNaEJ1WbkIUy36KtlKGLYrx8Bdnf94/HHXkcFHfVs+CjOZKs4y
 HHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mab5mMpRybDmvoFxs8lTizsm2eo8VhM1MviNWFKkilM=;
 b=0OuCb36NvZBLf4E8IPBdSi1cM4BdE+0hhipZ1C6nLivkvXdY2TAx8hbQu/IJGiZMId
 A/ZZ07fCCb5ZVPBY4SsuP8fYzjnTwP2CHE+zRm9g7Saz1Eh3bYXs2mK5c69rEpIRSGke
 nQXvzbgV1mRzGQ0aObjNduruQSepiZWFCaaxxakcW9BbOcn3C+lNhSH++AVXxlhXuv0w
 Ru8XktKTrO/O4sDx+kX3UClA0RGk7ef5CSe2FD+5WpIS+aUYrNgEGXkcN8M/hg1PVEWD
 2D9eiDcUel1zV0iDDccRBFnWaUVOTX+UqMtw9TASJe3rHUqWFtPo8j+M20E+Dwn1E89s
 6/xg==
X-Gm-Message-State: AOAM530/XuG9QxfSbwgyeu7pPbls855e60hxnC/fVbkcgpIDwKfC71lO
 DTSzl0YzvmZQUBX2OrQ0pEJN37fqDhUiwfENBE4=
X-Google-Smtp-Source: ABdhPJxaY58w66BUMhpMOlodVvGGr1c4xvmHif1u7BWvphaK7ALNnNzFzgtjxpRUkiSpw1KzFZtZkr1oR9Q6i4LT8jg=
X-Received: by 2002:a25:1004:: with SMTP id 4mr15364823ybq.669.1640476272202; 
 Sat, 25 Dec 2021 15:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20211222161534.1263-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211222161534.1263-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAHp75VfC-1Lt2JZ-e_ReySNQTOwOfBi6JLOjEHUMNEyYk5JVyg@mail.gmail.com>
In-Reply-To: <CAHp75VfC-1Lt2JZ-e_ReySNQTOwOfBi6JLOjEHUMNEyYk5JVyg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 25 Dec 2021 23:50:46 +0000
Message-ID: <CA+V-a8sXwS2FMjgNhLAGcsTT46kAjuh+N4BC78MUFvvptnjjtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: nbpfaxi: Use platform_get_irq_optional()
 to get the interrupt
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 dmaengine <dmaengine@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_155118_961533_E5AD3323 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

Thank you for the review.

On Sat, Dec 25, 2021 at 5:47 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Dec 24, 2021 at 3:14 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > allocation of IRQ resources in DT core code, this causes an issue
> > when using hierarchical interrupt domains using "interrupts" property
> > in the node as this bypasses the hierarchical setup and messes up the
> > irq chaining.
> >
> > In preparation for removal of static setup of IRQ resource from DT core
> > code use platform_get_irq_optional().
> >
> > There are no non-DT users for this driver so interrupt range
> > (irq_res->start-irq_res->end) is no longer required and with DT we will
> > be sure it will be a single IRQ resource for each index.
>
> >         for (i = 0; irqs < ARRAY_SIZE(irqbuf); i++) {
> > -               irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
> > -               if (!irq_res)
> > +               irq = platform_get_irq_optional(pdev, i);
> > +               if (irq == -ENXIO)
> >                         break;
> > -
> > -               for (irq = irq_res->start; irq <= irq_res->end;
> > -                    irq++, irqs++)
> > -                       irqbuf[irqs] = irq;
> > +               if (irq < 0)
> > +                       return irq;
> > +               irqbuf[irqs++] = irq;
> >         }
>
> Same comment as per other patch(es), i.e. consider 0 as no IRQ.
>
Will do.

Cheers,
Prabhakar

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
