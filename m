Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CF9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXFIztz/UECjg83slMqBA0UVregBw6RPi3wleulT+J8=; b=e00DsqCS7tr0+T
	DHQSR8pXbYSJxglKT1TdFIgcRpBkl57WOmOKFbxujiqq0wi6cmEBrBcSJoIMW/U6vTwDo9DDhngj6
	IMear4mroXv2HBNRZrlFGg3xUY23xSEbU3gu2OTZZk/M0aJYTCtA9BobuBx3hPqce74Xo0uqLIgjX
	L65iylk4LgVdJEH0wmCULlykEYNrqaQF7Z8wXzaNhjheUCJkkm9Wb8mp6f45UdQAhLv7iGWZB9sFe
	0tet/kqDa3BKAYsfIjHGQOBThGBlEQGlRMX7SGrTJxq2exrOSzuMADvc8jpnm323vQBRgcRz5PtTc
	8BI4AWlSv7nRh71x5P2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzldu-008NRI-0y; Tue, 21 Dec 2021 20:21:50 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzldh-008NQH-TA; Tue, 21 Dec 2021 20:21:39 +0000
Received: by mail-ed1-x52a.google.com with SMTP id y22so56741365edq.2;
 Tue, 21 Dec 2021 12:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8K5nmxlJ3moTYnp2TseIuUfeNAUPMQOSQ4wASu5v6s8=;
 b=laqbj9GD0uLNNq5kCKvpIiAQcmz/89sGl9QB6HHWb7h5d/npCOql5LBfjZHFAjAMoC
 H89Budy6xZjigY4Wiz2S96X1crUqWQtUsczGowUWmz8unbsVKMUgoOUOSJ4FFVmNgzCt
 O/9dXh/8EEa7RU1wZfDTYrGkVXXesQ1MADbzI7ECsRf5ZsQ+Mcl5GkhIm/sjl7UC1CkA
 yE7ej3ToBij3W17M3hQvwGG8uAKdD7//RnxbS43k2TzKTlnyAONcv+umEnnDP/mDVE8e
 cYDtpNHfqc69IhSHAbGul4h/mTJtG8W/4/vpqSjttPEFjatgDhRKxoJVNhNrhL4omKra
 WnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8K5nmxlJ3moTYnp2TseIuUfeNAUPMQOSQ4wASu5v6s8=;
 b=mPFT18MUsySocPuTWanDEvLT7i0vT5jSlwZPU8kkIPwAr0ZtRbAWqr4Y9F1Vz1PNGl
 KpNw84qwTI/3VnFd5ur8R05M+e3kF8SKCSmH2lK7XkYx4vsaqnUTSXcacMCpK/N6zAKj
 ky2GTChwQtzw8xvuWJxIQQ1kM0i8aB6Ac+ErJMdh+ZOH3ABeRt0xHebk+R5Z7GwG/EcY
 hCcV4RFkJblJ4vrQBoYvFLwSm+bhXJqhHC8Fv1zGF0Oq9jxP9dPCa5Oss7Vh9PQnWSo3
 OMp0AQqrarQfZAVO5TutJpaMPyy41zVRMdoymCoUlemk5QSNVKt5UDvmrBvTIECLOqDG
 J6LA==
X-Gm-Message-State: AOAM533E9VohB43HPpIACUwR2rrfPBzJFQ25VtQd0pqzTm5itgAzJQd3
 wp2I8nMdoYvOKhxlFyJQa/auO20ZZPT9YxqW8qU=
X-Google-Smtp-Source: ABdhPJxEhZ+FjN1dtap+8ml9wu5qTnjkvMVW3qwbOj9hGKAcprejB33+fGknKZwOuEg1/b2Qm3B/22LyKsN/o4Icw1A=
X-Received: by 2002:aa7:db8d:: with SMTP id u13mr4697024edt.111.1640118096382; 
 Tue, 21 Dec 2021 12:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
 <CAHp75VcbaYXfDpc7xE=asSqUspscRoHfqrg-yMtx=uo5UNqxfw@mail.gmail.com>
 <CAMRc=MfWqV8UFWLaJO7JSo7N6MhYVMWdquMDJU7xR5gu8604AQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfWqV8UFWLaJO7JSo7N6MhYVMWdquMDJU7xR5gu8604AQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Dec 2021 22:21:00 +0200
Message-ID: <CAHp75VfhY9zFxC_vDj0OH0Y0ah3RUgEEYO9p_uQsm7Xe63QF8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused local OF node pointers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Marc Zyngier <maz@kernel.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-unisoc@lists.infradead.org, 
 Gregory Fong <gregory.0xf0@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_122138_004968_E5531D0D 
X-CRM114-Status: GOOD (  14.07  )
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

On Tue, Dec 21, 2021 at 9:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Dec 20, 2021 at 4:11 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Dec 20, 2021 at 5:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Mon, Dec 20, 2021 at 2:24 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > -               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> > > > +               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
> > >
> > > This is unrelated though. Can you make it a separate patch?
> >
> > It actually makes use of the local np IIRC.
> > It's related, no?
>
> No, the np pointer is already used elsewhere. You just replace the
> dev->of_node here with np. Rightfully so, but it's not part of this
> commit logically.

I see. Probably I missed that somehow.
Nevertheless, do you want a new version or can you just revert that
particular change?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
