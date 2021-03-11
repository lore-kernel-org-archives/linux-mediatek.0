Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D2DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 12:33:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E4764FDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 12:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E4764FDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uBd7aM3nIXdBykF4W+eAS6TcDVh5h+Gdk4t2zgLp6Bk=; b=q7DywdavqZ5ypO9n0VMuz1zZy
	kpKiHy7KwGvR03V6qc0zK381uR7mr1Iar4ZnZx6s1kB2SIPEURugz6CeZsc/d7E07t6vUo0OvoJBX
	YVlujR4vzDlcHrYHN+KNwZSdmc394jZnqresFt296+sAC6Ly2goitBb6mLbsCeauUWzteWnd1Dz3A
	z2JYwHwmXHOyX+DHb2EqttEyK8CuQWqQNiQ0Uo4TbxKfpguEjRvMoQPEs9W+dIY4Mf74bZKpH1i8p
	YC5LQSqF2tdg4Uv12l5oe5xbF9qBdc/DDohMmVlo8Zv78HQMNcJNuFfRvMVeSFqqZ+aPy4UOdBsGJ
	9fUfEAFVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKKUl-0096DI-2s; Thu, 11 Mar 2021 12:32:51 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKKUA-009632-T1
 for linux-mediatek@lists.infradead.org; Thu, 11 Mar 2021 12:32:19 +0000
Received: by mail-qk1-x72a.google.com with SMTP id l132so20343588qke.7
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Mar 2021 04:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7/MPGIZ4WfmL4CRUvFWlovc/8lRT5Q/WOgdo9DvGsk=;
 b=q1H/SxQD3WDk3KLYZMwT6Gf63+upJzj5dCh1F/YNzNXw5uyBTozuGVXrxupcAsUfIz
 7j+gAgISYDyG2F5C7PkLQszFIFP9Mg1Pk84HaCQLRkMKJyxa2LY1Rn5Lpp6aLd0aEyw0
 pBr8pscVWyZww9IlPVkBnPHRacGB6Zu17GRrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7/MPGIZ4WfmL4CRUvFWlovc/8lRT5Q/WOgdo9DvGsk=;
 b=S56I0MI/QJ3kbck9PwVPYhd48hQJYnHDWhi7utQP4XVsPBH9eNi3T6AGT/HE8l3oJN
 naAmlOpfBvwdKNhYcKwz9kS/9PamGl+MKxsZy44n+/yE5+fLFrMaqg1dNm8TEarZbWHu
 uvcB79KQVbfGMjv1g/PNSRbggs36GTOUcdAfcb6t10B9TT/Dlh1BdMYQ3pM19GESxN5E
 FKtO4tRpAGsUmXfuqz0XjOsK40kLpGQSQr3ldouVOlvj8F0lFwGFcO/fMWNkrtYQ3WqO
 vCTXj3wk0sMJtP5Bqd4qHZ4Hyy79z6yWTwyNyZPNduYILJ3IeX6avR69ltznUSHHcn1e
 rJWQ==
X-Gm-Message-State: AOAM533Iw2tGG2MIhqD4eHys6Y6eG0ebo0SGOElqgnwb4M7N5m0ArGlo
 44nJxKVGXjkGQkMmitq5ZbyUbHHrRKVrTTdszmnkxw==
X-Google-Smtp-Source: ABdhPJyqzMhTize0o3im7e/84suA7f3v+q1shYGatAI+5T5rjPbXSF2InfyTmTybfE7igSCyXptOIKTj8WO8ntrhm/s=
X-Received: by 2002:a37:ef09:: with SMTP id j9mr7386300qkk.390.1615465931646; 
 Thu, 11 Mar 2021 04:32:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PX=dz1kt_BphpWr250asLiHFQNeBgNPhuPje==hzkcHWhg@mail.gmail.com>
 <20210311031242.24232-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210311031242.24232-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 11 Mar 2021 21:33:35 +0900
Message-ID: <CAFr9PXmHhB=PT1kRoYYowf2dw2fqa1-LGCD5S52hW9jJtq5Q4w@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/irq-mst: Support polarity configuration
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Daniel Palmer <daniel@thingy.jp>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?B?WUogQ2hpYW5nICjmsZ/oi7HmnbAp?= <yj.chiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_123215_518871_977C807A 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Mark-PK.

On Thu, 11 Mar 2021 at 12:12, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> For a fiq controller, the input edge signal will be convert to level and
> keep the interrupt status until we do EOI operation.
> That means if a rising edge input if trigger the ouput line will keep high
> until we clear the interrupt status.

I think maybe the fiq is always edge triggered?
It seems like it latches on an edge and holds it's output to the GIC
high until it is reset by eoi and then only triggers again on another
edge.
I can experiment to confirm that's what it actually does for the chips I have.

Then it seems like the irq version is almost just a configurable
inverter that passes either the input signal or the inverted input
signal to the GIC.

So maybe fiq should only accept edge type interrupts and irq could
accept either?

>  static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
>  {
> -       if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
> -               return -EINVAL;
> -
> -       if (type == IRQ_TYPE_LEVEL_LOW) {
> +       if (type == IRQ_TYPE_EDGE_FALLING) {
> +               mst_set_irq(data, INTC_REV_POLARITY);
> +               type = IRQ_TYPE_EDGE_RISING;
> +       } else if (type == IRQ_TYPE_LEVEL_LOW) {
>                 mst_set_irq(data, INTC_REV_POLARITY);
>                 type = IRQ_TYPE_LEVEL_HIGH;
>         }

I think this still needs the logic to check that type is something we
can handle (not IRQ_TYPE_EDGE_BOTH) and maybe if the fiq controller
can only do edge interrupts level types should return -EINVAL?

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
