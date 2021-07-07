Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E992C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 12:49:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A0F61C73
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 12:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A0F61C73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLxF7ku1BMtNBnRAdethGAG6aj+q4PQFhcjHxoeZZHU=; b=bA8+mXG0yPJVOu
	wYYHB0IhWuhW6QXTxNZ7hG+iNAqp3hEKezk/tKzYTamUH7/boOpQiy0yAlyAzB51JlOnhcRW6EcZ0
	N/cOSffIjar+toW/Lsm6clpB+P31A/i7KGgOQgzjMjmph4RMJsWAedcjjw35iXra57+f9Ia8luZPN
	97HsKopEOexd/z6aguKtlYxgUK9ZiilihH8lQy4RM08E2PZ/9DDTAfzjCCwCvpYXnwQ8SbpsjS5wY
	B6lMQLsT68x8ySlSccpf3tqiM5pty/Bb5Jkq23qYJwhoPfr/X8NhnxhTKHS2XA7VbMzN5N4ZtbWgR
	Vuqp2a9/dM4V5lq1zLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m16zh-00EoOW-T4; Wed, 07 Jul 2021 12:49:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m16zf-00EoNd-04
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 12:49:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3179338wme.0
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KcVbpDXBwG8roB+TO6DlcPLK7bK4RdgNLVJnHN+TkRQ=;
 b=dcUHXMxSAT5N3+Y3xGrq5MV8c9erhE8rQ0XUEI+GKuiDYs1YBOW2qIhuCu+8elNiL+
 I/lkTy1dyZ+iriIcF9mRlbGIvUnq9DGKi0FuP3hkN8Fr0DanWcNU8n4+km9dnoMZPV1T
 L9V9V+hewOh6ytU4MiHnv6EO7qkhIIgosPDUD6MEpzxg7kHAp9yF6hWbQuqZBd1B+YRN
 y6NqvI851tab8AoZYXCfwEl0pss0NkkUxHASq6cDFLfmTR8y/nnbcMvEqCXXh3QH7p2Z
 no132yLGn3n4QmO3n0iww4WubvtrfLlCLc3BalfjE84kXPEkPtU0UszXJZvgMtdIJGLh
 zRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KcVbpDXBwG8roB+TO6DlcPLK7bK4RdgNLVJnHN+TkRQ=;
 b=eQPgAWGsW/elZe9vfsaFtEByAeosWPMs4/qD0EdnIwUGmfhlIYokN2EluMDOMHdEi4
 bj7a3GKXMw+yMoU0vgnmEwIciy+/h5cBRx3pxWJhXmT8Mcq5A+rr049OuCN5ua0gSmKw
 EEHnhswXLkfJbjYV9SHuBC4Hwp+ZNSv0u35ids4JnMZU8HRsYorI6ZTddge47SF05ckA
 4DGhaazkc7v+//z9NK0FCaE6xsk9vRyY/C5hUdmRQyHVAtib2jCTf2S9xEyv5tXl3DM2
 kZrO+ZanZpcsRYkOBm0AW+YhE+Kf5/bx8Tpbb4LiZ6Ttn+eDOiag07EXluzsirqNBivP
 uedA==
X-Gm-Message-State: AOAM531pasIjuFQvFLg9pNTJCAV78AxPiykejx4SJrD+NQqy5csm5Go/
 TSPZokypGH0nVlgaJJ0kin+Jrg==
X-Google-Smtp-Source: ABdhPJzmzgBouap1ZBo1x9pyM1M5ABuyVzFJFY+tIqKP1eV53QccFWcDSLfvQOMRzmzDu4cTldUSDQ==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr26479925wmq.138.1625662173175; 
 Wed, 07 Jul 2021 05:49:33 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id t22sm5644082wmi.22.2021.07.07.05.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 05:49:32 -0700 (PDT)
Date: Wed, 7 Jul 2021 14:49:32 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip: mtk-sysirq: Skip setting irq-wake
Message-ID: <20210707124932.szw7zud63fl7xn6i@blmsp>
References: <20210707062004.782787-1-msp@baylibre.com>
 <87sg0q77fc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sg0q77fc.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_054935_076360_E21C4270 
X-CRM114-Status: GOOD (  22.71  )
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

Hi Marc,

On Wed, Jul 07, 2021 at 11:19:19AM +0100, Marc Zyngier wrote:
> Hi Markus,
> 
> On Wed, 07 Jul 2021 07:20:04 +0100,
> Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> > 
> > mtk-sysirq doesn't require specific logic to work with wakeup IRQs. To
> > allow registered IRQs to be used as a wakeup-source, add the flag
> > IRQCHIP_SKIP_SET_WAKE.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/irqchip/irq-mtk-sysirq.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
> > index 6ff98b87e5c0..586e52d5442b 100644
> > --- a/drivers/irqchip/irq-mtk-sysirq.c
> > +++ b/drivers/irqchip/irq-mtk-sysirq.c
> > @@ -65,6 +65,7 @@ static struct irq_chip mtk_sysirq_chip = {
> >  	.irq_set_type		= mtk_sysirq_set_type,
> >  	.irq_retrigger		= irq_chip_retrigger_hierarchy,
> >  	.irq_set_affinity	= irq_chip_set_affinity_parent,
> > +	.flags			= IRQCHIP_SKIP_SET_WAKE,
> >  };
> >  
> >  static int mtk_sysirq_domain_translate(struct irq_domain *d,
> 
> Is this a fix? If so, please provide a Fixes: tag matching the commit
> it addresses. Add a Cc stable if this requires backporting.

At least from my point of view I would like to prepare the mtk-sysirq
for powermanagement stuff, so not a fix. There may be some components
trying to use this already but I would consider this more of a feature
as it has probably never worked before.
Currently calls to enable_irq_wake() using IRQs of sysirq will result in
-ENXIO.

Thanks,
Markus

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
