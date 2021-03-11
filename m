Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88D1C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 02:40:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ECD564FC0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 02:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ECD564FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w6AgxGUUCynZ46K+14yswM7L3hU91lhUmNdD6tw303k=; b=oS6aB7Ka/u8m5m5YXXHcWJnha
	mX6h5n5wdEAARCZjTtuMj/NkDwOHPtW8JXgNWAEgK0zu1o8C/iHCS1xBAX0F6iXVIBCyeWc0Ls49H
	cpxEybtYGDSZjpAACXDPHrDiZInZX2jdSEte96BGBUFLoGTdrCRX40Fbdw6X3Ad0YiEhc0hcfxEXU
	lkHsB8xOwaLZ6AlWzkH0TfV3/shiBby0yRZwzwWLzO5uoTZlP6tI89Epy+0grwW+HnTpT55f2XKme
	uBLbiudgLACRosPiBaHQQfdNfAI3HaGA/n3+6VbWUlVA7i5VRuBOuJmrXeA3Sh5ZFl/Pbes2YIC9s
	T0j706CbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKBEx-008G04-Cj; Thu, 11 Mar 2021 02:39:55 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKBEm-008Fym-7l; Thu, 11 Mar 2021 02:39:46 +0000
Received: by mail-io1-xd2d.google.com with SMTP id 81so20267793iou.11;
 Wed, 10 Mar 2021 18:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zey6YZH56sG0/UgybfDLXqvfVhV/K5l7tMblValKcY8=;
 b=URbzlaTvQBEsRiwzE06HKEsMuT/D+UMvVLhO5t5/ADgc3QQlD/j9vDU4JNAN+wCN20
 cRyRtmeW64S/bW7iRcbtw0gwMBpSpjvfWu5XUNbQjpjRBaPAQoCAp8s26SoXqPYGiXWo
 bUO9cuCg1KZZctCvW/BxAps/5msoY1hXvIZyvCmtuBfuHH9chR/wmkel/hZQPgXzr/hK
 r4CpbgQa+IREUD5RBEIYaNBqOdYx3VfGAyBiPQAzCtGxudrs4qK8pO7oFcBWq1qsgPtB
 fnJGNyg6268xPFqkUoGMd0oK1oQ0XFSfnNczM0iXQZcCuoGkYdemt3K2sHgLG21a9QTT
 GZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zey6YZH56sG0/UgybfDLXqvfVhV/K5l7tMblValKcY8=;
 b=o0YoYvYTaNFHiwAtmjq+Tbl4yWs9ZpIQATm1tmSOiFvrx7i/VtfS92PIFCTWGyIprg
 W64hkI526QUvY57TpWiU2ejAVfJl1FW1YV9LHUMFJ36wOQOPqa3stIQmK56cKFOM/g2d
 +JXqX6J9pSahJosGG7lbRy1nmPs0xu5FaVasIE7eonH0GE2XdYf/WcFdDu1kF8QaB7rq
 WEMnc03a2XsZvNqCDYf//YYu0v5BbYTQi9s6O9+sdv+0MoKBRYXqN/+BYUjfES4itAwx
 AKN+3MAUoclMCIorJnKHPJGlwuyv3eqYAjc/ziDb594quKIETOs5jJ1HmldvT1PIuVe4
 yQ1Q==
X-Gm-Message-State: AOAM532YXF86tVab5r985Fht9Ynup4iPytaFsIN6CN277nfYT8tu8OVo
 KxM00ci6GaYb4SngsH+LcfY6TDBQ5yF9geYhwcI=
X-Google-Smtp-Source: ABdhPJzeglhviCeDW2QHAhoIus4BFhvOF/qC/o1iQtaVDkQ3mEKFf5ln4brGK2Khg4RJb8kQRL1iZv+qa0c67wGKSAE=
X-Received: by 2002:a6b:5818:: with SMTP id m24mr4577553iob.144.1615430381060; 
 Wed, 10 Mar 2021 18:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
 <20210310211420.649985-3-ilya.lipnitskiy@gmail.com>
 <20210310231026.lhxakeldngkr7prm@skbuf>
In-Reply-To: <20210310231026.lhxakeldngkr7prm@skbuf>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Wed, 10 Mar 2021 18:39:29 -0800
Message-ID: <CALCv0x2f5M6phoGi2PMfmW9igcS3kmMm9Y5fSRi3oKckV4F1yA@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: dsa: mt7530: setup core clock even in TRGMII mode
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_023944_823144_2C44CA62 
X-CRM114-Status: GOOD (  23.47  )
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

Hi Vladimir,

On Wed, Mar 10, 2021 at 3:10 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Hello Ilya,
>
> On Wed, Mar 10, 2021 at 01:14:20PM -0800, Ilya Lipnitskiy wrote:
> > 3f9ef7785a9c ("MIPS: ralink: manage low reset lines") made it so mt7530
> > actually resets the switch on platforms such as mt7621 (where bit 2 is
> > the reset line for the switch). That exposed an issue where the switch
> > would not function properly in TRGMII mode after a reset.
> >
> > Reconfigure core clock in TRGMII mode to fix the issue.
> >
> > Also, disable both core and TRGMII Tx clocks prior to reconfiguring.
> > Previously, only the core clock was disabled, but not TRGMII Tx clock.
> >
> > Tested on Ubiquity ER-X (MT7621) with TRGMII mode enabled.
> >
> > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> > ---
>
> For the networking subsystem there are two git trees, "net" for bugfixes
> and "net-next" for new features, and we specify the target tree using
> git send-email --subject-prefix="PATCH net-next".
>
> I assume you would like the v5.12 kernel to actually be functional on
> the Ubiquiti ER-X switch, so I would recommend keeping this patch
> minimal and splitting it out from the current series, and targeting it
> towards the "net" tree, which will eventually get merged into one of the
> v5.12 rc's and then into the final version. The other patches won't go
> into v5.12 but into v5.13, hence the "next" name.
I think I knew this, but didn't think it through. Thanks for your
guidance. I have submitted a single patch to "net" and that same patch
and two more to "net-next" - hopefully that looks better, but I'm sure
I have more to learn still.

>
> Also add these lines in your .gitconfig:
>
> [core]
>         abbrev = 12
> [pretty]
>         fixes = Fixes: %h (\"%s\")
>
> and run:
>
> git show 3f9ef7785a9c --pretty=fixes
> Fixes: 3f9ef7785a9c ("MIPS: ralink: manage low reset lines")
>
> and paste that "Fixes:" line in the commit message, right above your
> Signed-off-by: tag.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
