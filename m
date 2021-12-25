Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E370C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Dec 2021 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQeW+Ks6CDXgDrVgJ++u9XlMyQM5XFGSHKUKbIVGw3w=; b=BYiYWW9tYxfEFv
	THN2H4dvVYBQ2gzb0hx56hnelHcYiiEUudLGTu9NbqezbLj0gXTaNN6BneHvca3rUD23jWHB3Jera
	mJoI2aK+52cjqY6OATEe+mdHNGxQoOXIvfZJHPqxTD/TF6FuUqQiCIYg04pasd+D0HJfkmOcwAgPg
	wq0SXaikgCOK3gcWSmyVnd2YaJVaxlv67PqelwAznd42FmnV6bfG+ORcparcNcnSgNOZJLWkoNuoq
	GZkinQO2MZfU5d4rPN6yebB8UIrT4jY67Kf7NyvwB+5Dqe7kh4x9ITfpPGKfAcfGF/SSUtcUl3lE9
	Z/IVoc8sjiuxdqHEzM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1B8r-00F1Nd-Hd; Sat, 25 Dec 2021 17:47:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1B8d-00F1Kw-5h; Sat, 25 Dec 2021 17:47:24 +0000
Received: by mail-ed1-x533.google.com with SMTP id o6so44822019edc.4;
 Sat, 25 Dec 2021 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGUNV55wraKWttlHu9LEsxw2TMdFSIetUkp+Aa5vOlw=;
 b=jvMxGG2qz701VH7PS5s1+nb3Z9EUfyfO+MeYE6dw1gHB7kICCA0bZUN9qosVmcpvrD
 Vv2jc+BnVukAgcIKHQAhvF6bZ5nLDjQNTDfJAmG/UBV1vhY+8QZLg9mORq8BGvRRTbML
 JKvGPmuvE3UcRMumC002eUUO7X26fvTPYhdqhC1jApLGt0lhX7hSy7I20913r6/9CtsV
 atUnvumDY17hms6SByBTOgwN5Bzkls9ePsKjDMURaYSqkbH0jmcUXZZDBaBAVJY4EerO
 BuanjrOvfciZZFIVPijfT5OnxsNYbIHd/LXYzM5mXaa2Qr6qwrXM7tRp6ipvYyB3WCek
 316Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGUNV55wraKWttlHu9LEsxw2TMdFSIetUkp+Aa5vOlw=;
 b=1ocKbsNmdOm9D34D16bFRj/JZI3+QCJ3PBjscw9YjQF/qViCZ7fDsck7PYJ0g+4NK2
 kmOSRxp0IRD+qb9M/LtxRSVlVjTIIZzqq/kAhiA3c1uYCK1jFzLxD3Mx6pd6ZsSpyuzr
 cXqmHMw21g9koSZJrWeCpRhiX9N2fR88gM3nY2ZU3F1uQhM2H+rfWs+UX4pYi+/uPuzx
 9OcsWti31gl4fpuoyNPOzXmJUUd1cc/TPRkTid/Z+Vl9JavsRPL9g02drRvDAp+MmoyL
 dHhV5pAX8FNoPC+UgS6l1Oua9v8HnpCzl5uhrUiCagF7JZi+eKCGRkKEHnPoFIYPwFXi
 Beqw==
X-Gm-Message-State: AOAM531LIO3w6c/TCZUgxbLbySomXcZ/6u7ugOPNSv37n3NKJmdgMreB
 4d6e8h3cpmJ2G1YChJtQCckxk9r/TuvJGX2Wy8yPgskbbzw+Aw==
X-Google-Smtp-Source: ABdhPJyidpd9u5ux/81gVytN22NQ9SN65KnC06z6cIHTHqerrI7WWeQin+0FapdM5Hb1MSG1DYvDHJ8AKXbcja9W6Bw=
X-Received: by 2002:a17:907:76d4:: with SMTP id
 kf20mr8680594ejc.44.1640454441883; 
 Sat, 25 Dec 2021 09:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20211222161534.1263-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211222161534.1263-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211222161534.1263-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 25 Dec 2021 19:46:45 +0200
Message-ID: <CAHp75VfC-1Lt2JZ-e_ReySNQTOwOfBi6JLOjEHUMNEyYk5JVyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: nbpfaxi: Use platform_get_irq_optional()
 to get the interrupt
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 dmaengine <dmaengine@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_094723_239558_2108A732 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, Dec 24, 2021 at 3:14 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_optional().
>
> There are no non-DT users for this driver so interrupt range
> (irq_res->start-irq_res->end) is no longer required and with DT we will
> be sure it will be a single IRQ resource for each index.

>         for (i = 0; irqs < ARRAY_SIZE(irqbuf); i++) {
> -               irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
> -               if (!irq_res)
> +               irq = platform_get_irq_optional(pdev, i);
> +               if (irq == -ENXIO)
>                         break;
> -
> -               for (irq = irq_res->start; irq <= irq_res->end;
> -                    irq++, irqs++)
> -                       irqbuf[irqs] = irq;
> +               if (irq < 0)
> +                       return irq;
> +               irqbuf[irqs++] = irq;
>         }

Same comment as per other patch(es), i.e. consider 0 as no IRQ.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
