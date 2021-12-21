Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAF4C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCXyHjBzj6D+jqpS6xlpnjhp3NFZgDuiCeKgWn/PR30=; b=dDcrC+nW6eDGWx
	xtW5G5v+kxLIekImJTTLZrgPRtQzjlDYz40Slc/WBh3jcJFwbhwveyH/RygPRSq1d6KPHI8UDOY8Q
	dtii4kH6o+M8FjsJQ+h1IXX3B4UaF2s+TGJRXnkn9VvcHSstxHIlToIWsVlzkcW3wtG7G9fKUzt+X
	EEGeiJYVX6ViRZjaTMSu3vrqyFSFaHMbMYuk83ykdF6RSjAa9+USBbnT/FZnHpI7ByKQ75zyK4cUV
	NgJwWEYuAyPhgIDpmKJu3ElJOVl03z3MDrgDcQlHyeNkPy5VUfg58kafTfaurok/AH90mwYUPQ0lc
	ALeY7P+XXbXxIV7HKufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzka2-008Ebg-EQ; Tue, 21 Dec 2021 19:13:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzkZz-008EZE-6Q
 for linux-mediatek@lists.infradead.org; Tue, 21 Dec 2021 19:13:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id y22so56098721edq.2
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Dec 2021 11:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HHM9ApCIOXmvojtjZcgeuKj6BVJ/ehNH8xMBah+fAzM=;
 b=zMD5k9nXWWKR1uoe+HV5h3+ZF+19/vXKLpZJP4wmpVaRDZRrO86G9J/R9FMsVZQRvC
 ggFMAUeeMl/5uCM7WmNaTflOlrxAF/aIpn548633NOCOr8cP/qt3u0n3UgXjqMdHsL41
 VjVVM7vgO9GMi/wxm7yeQdk+Em8CMENKG70PoyXDcfDPkDNtGHlDZOOigI8eiD1mOqR3
 sbgA9blG0YJWWLPD4YkZh3fiO4iz6P/GvFowfz9dBWQ2tyAEAId5MvX5x2tHbaKP3z3r
 /aIdE8egoX1fNuuU+lyoqhIFpcb7bsfxjTcgV6PgJVwIZKIz5ez3Xz7FaqJ++tAeN5o/
 NrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HHM9ApCIOXmvojtjZcgeuKj6BVJ/ehNH8xMBah+fAzM=;
 b=pM9XvilTrzfxBan0m7lJhQ3dWEumAIKNU7+mzKjdPtVLXl161VZQCnghJg7Ym6Ud8L
 VTPt5ws8wRfszjW9M+YDYbA6j828IAio1CSe/X6NkWad+wLAQH9Pu+IKSlbuiyDpuLg6
 39Q2AbD0e1x33MK3Of6XavavBJMfOtk4W7Zu30eE36QZyFJfMu5ZA6/oo6PRSWBpy0Mk
 atRMX4k5ASf8z5fO5RbmJfPe13km5FgBjVPlRCqd6ci5D1mbinKvjjmvfvFmQFilRGEJ
 F/RWiQvO/P0ba/lisV4gFuQwJWZQ7pZiUtPIvex3X4DrMD1hQ4ToPKnDnomOu/MEHeyq
 FbHw==
X-Gm-Message-State: AOAM532DCqgx3IexWjDNUgw5ixazUHRs4GyS9fFcQOLpM/JoPjskljIq
 goaJ3dBPEQPR05G/bCUmLNdCw1jdns3OBpYu/8KZqH43X5E=
X-Google-Smtp-Source: ABdhPJwFaZxo6Y5DO/1AGztX9mo6QB4YplnjxPLSDYX2owZFmHOC2zmdiGz0WhPkFcyqK1wF3M1CeELod5+T/8lTFIk=
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr3766325ejj.636.1640114021119; 
 Tue, 21 Dec 2021 11:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
 <CAHp75VcbaYXfDpc7xE=asSqUspscRoHfqrg-yMtx=uo5UNqxfw@mail.gmail.com>
In-Reply-To: <CAHp75VcbaYXfDpc7xE=asSqUspscRoHfqrg-yMtx=uo5UNqxfw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Dec 2021 20:13:30 +0100
Message-ID: <CAMRc=MfWqV8UFWLaJO7JSo7N6MhYVMWdquMDJU7xR5gu8604AQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused local OF node pointers
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20211221_111343_316556_C80CA8B3 
X-CRM114-Status: GOOD (  13.36  )
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

On Mon, Dec 20, 2021 at 4:11 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Dec 20, 2021 at 5:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Mon, Dec 20, 2021 at 2:24 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > After the commit 448cf90513d9 ("gpio: Get rid of duplicate of_node
> > > assignment in the drivers") the OF node local pointers become unused.
> > > Remove them for good and make compiler happy about.
> > >
> > > Fixes: 448cf90513d9 ("gpio: Get rid of duplicate of_node assignment in the drivers")
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > > -               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> > > +               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
> >
> > This is unrelated though. Can you make it a separate patch?
>
> It actually makes use of the local np IIRC.
> It's related, no?

No, the np pointer is already used elsewhere. You just replace the
dev->of_node here with np. Rightfully so, but it's not part of this
commit logically.

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
