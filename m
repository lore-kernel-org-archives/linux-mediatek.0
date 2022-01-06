Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqoetQsN/x/NE360kme8kHwZKmODR/7IcPO9M8YDZDE=; b=JyLBD5BpZfLIWC
	gA/nWkba/rUW/1ERymcfUQtnxXr83WEKGLfOzhoijBrIV1XPJ9roBA2Ah9YbLKQUHV9ISJtWRbQdd
	6NCiiIbA0dgMaXSXUw9tX/gTZNheDbaW0y1P4hLEl9Yje6hO5666AK3ifrFUVVYwpAaxXNw6X2yRg
	GxPEEecu4QJxBi9xCx4wyq4foXJT5PMt9FdGS9LnuPHnls9I9hDiw1Z+qsDKcqDum9VQhLBs32xY8
	kg7d3ILkOF0fGQ+9FyfO7f3jzruoV6Ej2yLEkQQw61Xfho/oN0O5WFerGcbbC1PSmHZks8zMTJgTi
	fVQLOKC0ws0pK1Hqu2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5OOR-00H6Hf-AS; Thu, 06 Jan 2022 08:45:07 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5OOD-00H6Aj-JH; Thu, 06 Jan 2022 08:44:54 +0000
Received: by mail-yb1-xb29.google.com with SMTP id p15so5358045ybk.10;
 Thu, 06 Jan 2022 00:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oh23BjoKFzAkuG9NnxICbp39CiGWdcw5gpXaXCR0gv4=;
 b=SDoA0JU56MlWxVUqde4e+r/Qk/EhEUwnd157f6jKhWFrQhlnRaGdHmY5Hgt6HE/LtN
 H3JR8g6ajSPTD54T1IFH25bcu/wBh2cnFsigURyxJjOF8EykEgXUvwURqZGEQpkP5QM0
 U31VLkZU3F0DhluyoOCeFJ7wnCssDevX8PF4LVkIiIRpnUdMnrSqTA/FlGRzKi8Cu0OQ
 MTEN2Gwz6tQJlMkoCosohaBGLn+CR6IPpfOF06D8fDH99fyZW6iK6SgCWgfPZU/O/BvU
 PEpdfDuk+9+ctgdfP5iF1FbQuGYsNvIdgHV9DPR7YnV3eZiemvcoWvUB0K6mgIP658KD
 lc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oh23BjoKFzAkuG9NnxICbp39CiGWdcw5gpXaXCR0gv4=;
 b=g7rXNM7eQpgy4ePjIc4J0v5VkVPQ9vxz/mDV9ihh9hOEvePL9RPuA+ju/2f9gPLORG
 eKYCDZig7f01kX7J1GobsWRLJTb0PHu8vbRjr2ST7OsPHC8lMKmSgo+3h8h2rbb1BYVP
 spPaALQCWV7a50U/2sGhLQB4yMvUH0v6p0d7OGQOM52j877dhdxbmduxu8WfWzQ6XmGj
 v8Sdj1CnJM919hkUJuQgJ6eNODcf9ZPjGp0kyKLdSGOmyiOQlM5ZwfCFfz+1Lyld+v73
 K3X1HHRguno56/TzwemCTJ/ZTcb3mre5s9Gy1uKHEao2Ad2gcCGAXOqETZggKs+TI8nd
 BetA==
X-Gm-Message-State: AOAM530voML4OjN/vZYtyh1o7SYLoJ/6bmSqiXbKa259vWElH45eBf64
 R80wumXPDN+axOR7LMdSkpSBjYUzp54tsy7o48A=
X-Google-Smtp-Source: ABdhPJw9vxajmAvvj3b+nKVLj9oHrVmIGPAkG7ay1+DYFjTGWUO3lmz8SjL8jkJOZNrqNJ0ZIDUOCTX4Hf4zjwdy7vQ=
X-Received: by 2002:a25:98c4:: with SMTP id m4mr73638815ybo.613.1641458691689; 
 Thu, 06 Jan 2022 00:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220104163519.21929-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YdZ9rDvYtdu8L8Vb@matsya>
In-Reply-To: <YdZ9rDvYtdu8L8Vb@matsya>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jan 2022 08:44:25 +0000
Message-ID: <CA+V-a8sO0AioGJh23jdFWoN_Qx9rm_3skYcCeyrWZVAuRtuOSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dmaengine: mediatek: mtk-hsdma: Use
 platform_get_irq() to get the interrupt
To: Vinod Koul <vkoul@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 dmaengine <dmaengine@vger.kernel.org>,
 LAK <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_004453_663884_B78B011B 
X-CRM114-Status: GOOD (  24.55  )
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

Hi Vinod,

Thank you for the review.

On Thu, Jan 6, 2022 at 5:27 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 04-01-22, 16:35, Lad Prabhakar wrote:
> > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > allocation of IRQ resources in DT core code, this causes an issue
> > when using hierarchical interrupt domains using "interrupts" property
> > in the node as this bypasses the hierarchical setup and messes up the
> > irq chaining.
> >
> > In preparation for removal of static setup of IRQ resource from DT core
> > code use platform_get_irq().
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > * No change
> > ---
> >  drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
> > index 6ad8afbb95f2..c0fffde7fe08 100644
> > --- a/drivers/dma/mediatek/mtk-hsdma.c
> > +++ b/drivers/dma/mediatek/mtk-hsdma.c
> > @@ -923,13 +923,10 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
> >               return PTR_ERR(hsdma->clk);
> >       }
> >
> > -     res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > -     if (!res) {
> > -             dev_err(&pdev->dev, "No irq resource for %s\n",
> > -                     dev_name(&pdev->dev));
> > -             return -EINVAL;
> > -     }
> > -     hsdma->irq = res->start;
> > +     err = platform_get_irq(pdev, 0);
>
> why not platform_get_irq_optional() here and 3rd patch ?
>
For patches #2 and #3 the driver expects the IRQ to be present
strictly, that is the reason platform_get_irq_optional() isn't used so
that the behavior of the driver is unchanged with this patch.

Cheers,
Prabhakar

> > +     if (err < 0)
> > +             return err;
> > +     hsdma->irq = err;
> >
> >       refcount_set(&hsdma->pc_refcnt, 0);
> >       spin_lock_init(&hsdma->lock);
> > --
> > 2.17.1
>
> --
> ~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
