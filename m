Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DCAC55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 06:58:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEBB22240
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 06:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHKoJdMc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="JQcI1Cnb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEBB22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ptAeuOXODvrdMmYP1Yr39vZ0aJAFmcs5JaoF/vGHLlE=; b=SHKoJdMc2toLST2fvrzkImz2Y
	T3iD/wCbEqlR7V3QS/IERP4Mlh4o4ZPjdVddyN88hVe4SYeNTjbj7lIkYllctZgwoCuZZFCTuZ2CR
	dvKUzlqI13aaGrRXgHfBY+oqdtnmcncOHiAuWOvegB0wR6CRUI7BH8V2aCx0SMiO12AMCztd6Np5G
	o7Ys4Z/4HuZB4dIaEB0LwbiTIoLn60bu7u6O0XIS8BBPMTX9CIPfmlazoNtQJW1YcQIWJm+1e92dq
	Z6ZH9fbT3+NQEiEGBscPabBAuwm80T/On0VuISmtpMrIVRi8kVDB+le8iwT/dB5voogpYz/B5Cw8U
	sChKJggjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYSa-0005cu-TA; Mon, 16 Nov 2020 06:57:56 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYSX-0005c1-Td
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 06:57:55 +0000
Received: by mail-io1-xd44.google.com with SMTP id j12so16287278iow.0
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 22:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7qH3muf0hvm402XiT2YMmzxU2U+fv3PjFMpAPv4904=;
 b=JQcI1CnbTtjDN0N02UdBLejMuwzPaAl6epYNRX2HcrAQHSneRvPa2EhdTQiZQGbLIY
 D2DTCAaL2jB0MbatysmPOhJtFd/gFzfmTgjbwyLTjyut0a12Mf//vIal8LyWoD88AAkx
 tjejDvh205jfSEOREl0cSu6Xm0xv1rl/7yUVBmzL090XZRqWlKzKwAawNXEnbKUImHYj
 I/41KzbdPlAEMTRaBkCiSUEgvjvgAhVdMCaLkskyy+wWAQaZ8QSeLCM9kAFoqIyGUhwj
 S/y3+41N3Nqamsuntq0kD3yduuNoZ71SzkDibi5IfLNGZfrhbdkU0uTsH+nAqpxxa7fz
 9ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7qH3muf0hvm402XiT2YMmzxU2U+fv3PjFMpAPv4904=;
 b=SFQbzJBF40Qr0R6kL0ki8XFNgZQLfXGkFSZCQu48ZnbUdaA0Kif+dqFV4vE+6VBCSm
 z53kE/WzE+zH9+jHHefR12YZTe+G86phQbo+laM27Jh9EommoHxmdwtZCs+NJFD9SqVG
 +u5LHDLWlx6JRbhR5fm1xQsjnYSS/iNNGLKGz0o3nGBj6FUXI6bh3N3IzfAgdiY4w1dd
 xeNnvmUzhmvXur9liYwbv2yNaPDskPy+aVh29TDqp1qWDeKN6mtSS/DP8qM3qCag6TC3
 CjLQ/Qi+V7mxs9M3/cbwP26qFytdV2h1icUvqDpKbqy8C9fT8yZ64RbB/ZI1XOT9IAhr
 Xb8Q==
X-Gm-Message-State: AOAM5318aLjME+7nDFDclVrQIFz1z/v0byJb1Gcld0zY6MLwR5o6xzCP
 gy2cs7T0cYgye05Cyoxy3yatf1sBOgAPi4XK91mS2g==
X-Google-Smtp-Source: ABdhPJwq9Tgjk2eACx8o39dvmuSg61oenlpEGKZSTXbZQzysIe66a0C3qgQ6UxJeCx1tOQ8u2TW7AISXJpoawDlH9m4=
X-Received: by 2002:a6b:7a0b:: with SMTP id h11mr7412410iom.76.1605509868843; 
 Sun, 15 Nov 2020 22:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20201116044121.2457272-1-tzungbi@google.com>
 <CANMq1KDXnLqBu5CBnWCeFEZbqxFRVmoSi=hu_qOtQDnZW6SPbg@mail.gmail.com>
In-Reply-To: <CANMq1KDXnLqBu5CBnWCeFEZbqxFRVmoSi=hu_qOtQDnZW6SPbg@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 16 Nov 2020 14:57:37 +0800
Message-ID: <CA+Px+wXoOB=Kc+7dUS7zePDu-_7bubZhpmTmsDSxUZ6QY8+yUw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: fix sparse errors
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_015754_014731_419CE346 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Nicolas Boichat <drinkcat@google.com>,
 kernel test robot <lkp@intel.com>, Guenter Roeck <groeck@google.com>,
 Pi-Hsun Shih <pihsun@google.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 1:38 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> On Mon, Nov 16, 2020 at 12:41 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > Fixes the following sparse errors:
> >
> > warning: incorrect type in argument 2 (different address spaces)
> >    expected void volatile [noderef] __iomem *addr
> >    got void *addr
> > warning: incorrect type in argument 1 (different address spaces)
> >    expected void *addr
> >    got void [noderef] __iomem *
> > warning: incorrect type in assignment (different address spaces)
> >    expected void [noderef] __iomem *cpu_addr
> >    got void *
> > warning: incorrect type in argument 3 (different address spaces)
> >    expected void *cpu_addr
> >    got void [noderef] __iomem *cpu_addr
>
> Can you also tell us which lines actually fail? Would be easier to
> follow (I ended up digging out the test robot email to understand)

Will separate them to make it clear.

> > @@ -556,8 +556,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
> >
> >         /* Reserved SCP code size */
> >         scp->dram_size = MAX_CODE_SIZE;
> > -       scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
> > -                                          &scp->dma_addr, GFP_KERNEL);
> > +       scp->cpu_addr = (void __iomem *)dma_alloc_coherent(
> > +                                       scp->dev, scp->dram_size,
> > +                                       &scp->dma_addr, GFP_KERNEL);
> >         if (!scp->cpu_addr)
> >                 return -ENOMEM;
> >
>
> This one looks wrong to me. dma_alloc_coherent memory is not normally
> tagged as __iomem. Why is scp->cpu_addr __iomem in the first place?

Did you mean address returns from dma_alloc_coherent() is not normally
a __iomem?

I am wondering if the cpu_addr declaration is somehow misused.
In drivers/remoteproc/mtk_common.h:
> void __iomem *cpu_addr;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
