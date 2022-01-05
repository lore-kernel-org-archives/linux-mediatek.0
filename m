Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1EdQ8+sXGPDEqhOWJYab1sg2ilMX6X5r+vxzCgS20Y=; b=rZxdZKOEUrOrID
	M93NwVpkEYOjDNIYrFUh04WKT4bAGmCHF80O2uv5Wzm52VnptO2Y3lsc9HMnKuQZx+NMey/JH/Emd
	a/zRW90QaVkQLYzOGJ62lrdzwVCASN4Fq4g8t6YrpNNGhG2HnySMCxpdrTyvBPPIBObmenutg1m9d
	sm33JPbaodQ8wJVfnDNhdUHnG+H0561mxhggeY9I+t7/TDR7Zk9ijqd4t0XgZcinH2YKOGR9v+bLQ
	4kU2GfnjWU5XYi03z7TALrs6gaN1YYGq70TrCOGJv3YGWvCPAicryIyx24w9fMv+3prA1974KY1xJ
	5tIFlQAaF/rBVk2ZISgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n532M-00EQZc-Pd; Wed, 05 Jan 2022 09:56:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n532B-00EQXt-Dy; Wed, 05 Jan 2022 09:56:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id j6so159610780edw.12;
 Wed, 05 Jan 2022 01:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RGWNPU5ivYAOEbGYuzAwJZhbZHAcd9g2uJCWt0Jxpzs=;
 b=NswvLsYaQaVs9wdePTPnFzWoO4lEtQmSsapmJWlr4U55ZrVwfMmQan7w13S5V3X/YO
 qKLTXOBoqt/oEIrk4p7LVnK4M8YF6fNSXgYApmiYr02+5TOKfOA78cb1nsYePZbWQL+c
 WhgETW+/83FjTm4Hrxua2/sKG0ZA5YVv1ktPZ4FFVUddpIba5IeiXqzqeZGMFb8Bk+lf
 ozw7i2kNOD8flzcq7ROy5aaY6nzpv3Gj35n8/Bx05uFTM3pe4G95Lf7wqv9a2Fqphqsu
 HOe21dPH9ZiZcBrFmcXp9UuZb5yzyBuiuNRYf76KfSJiNEMYIx/rHBtdUO4/YKIIrosY
 YPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RGWNPU5ivYAOEbGYuzAwJZhbZHAcd9g2uJCWt0Jxpzs=;
 b=h1MDZyAmDs5e4ut/wV0RTLIwQqEGu9LLFEZ3Dw9+FAHzsQw9XqEPXNtrYjdv0neBVd
 vpaqkPP5hFYL0GXsUEOkOeCZvKI56wlbXQh6M6UU2ygVBbGfWYS/FMhSpcPOmDjp1+MC
 4FeddviAWhbrz9EswUBpbT3vmQJTIWIc7yMU2+VpNb3iyKkKYhBPMFtP+qSaJWQMSTwr
 3O2Eaij6Znb072SVtd+Foo700LOeG6WjVWfXehA1c+aUb5ShLWhxL4Y7+azsULgvj5vV
 C/yUEPfo0bA7TS7oDuQTk/RMmnp3y/HS0+PtOBvX4st3Cl4w0InjO0qmQobpCFJ0SIm9
 lxug==
X-Gm-Message-State: AOAM530QhOo2ww1tTEFvlQTPgJbCMWLJ/7ERBQkUiz+AHABW3XYquJB1
 8BwJZImepQFR/5pKAffj0Ywmh9ykrHWraYYB6o0=
X-Google-Smtp-Source: ABdhPJysoC/OnM1KOb+MCc9igdPgwVf1rbsY6UARr8DyfsE6K3UZ3DbHTavYY4P98V/vnASQ7NJ2DvoWok7DbxNY3Bw=
X-Received: by 2002:a17:907:6d8d:: with SMTP id
 sb13mr42824929ejc.132.1641376601562; 
 Wed, 05 Jan 2022 01:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220104163519.21929-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jan 2022 11:56:05 +0200
Message-ID: <CAHp75VdUYsGHbhkJoXifTPaY5GbHaiGf4nG1rYpo9=7KhfujDw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dmaengine: Use platform_get_irq*() variants to
 fetch IRQ's
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_015643_504024_EAC63054 
X-CRM114-Status: GOOD (  14.33  )
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

On Tue, Jan 4, 2022 at 6:35 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series aims to drop using platform_get_resource() for IRQ types
> in preparation for removal of static setup of IRQ resource from DT core
> code.
>
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].


All three looks good to me, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (3):
>   dmaengine: nbpfaxi: Use platform_get_irq_optional() to get the
>     interrupt
>   dmaengine: mediatek: mtk-hsdma: Use platform_get_irq() to get the
>     interrupt
>   dmaengine: mediatek-cqdma: Use platform_get_irq() to get the interrupt
>
>  drivers/dma/mediatek/mtk-cqdma.c | 12 ++++--------
>  drivers/dma/mediatek/mtk-hsdma.c | 11 ++++-------
>  drivers/dma/nbpfaxi.c            | 14 ++++++--------
>  3 files changed, 14 insertions(+), 23 deletions(-)
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
