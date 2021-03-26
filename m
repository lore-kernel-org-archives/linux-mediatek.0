Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0261EC433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 02:46:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B8B61A36
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 02:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B8B61A36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qm94s5erA0DgrRBefUKw3skHaVon+xRKsYG9MqkghYU=; b=L21gEsablkFNkneavJ3NK3gI4
	/5SQCiFozI56p2YKG1dapMHBkreSvt1JTSdRW88bYisY01nJdnoUsD19h/LgFkCrVNg+0H12segEK
	TO4ZLszQc1ERgDo2M1EXDio885UDMGwP3ucEd8HvydWqOLVIc+S6iuEG9ZM+TbaWVDFNMD+/ZbHFm
	iJw9OyLgIDzd2L8QngB4XxRcD91Rd2IFrk5IGuWmSv2wV1VUxhbrUkTONvqe4WzIBjP+oMcajRbbT
	sUlaL315c5yGhTrzXmYuRc9rItxd+P/rABTUJATDi3jgHtzqFZUg/JDty+yKXZCJveOY7pkSK2go7
	pVXkgydQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPcTv-002dr7-AV; Fri, 26 Mar 2021 02:45:51 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPcTi-002dqO-Gt; Fri, 26 Mar 2021 02:45:41 +0000
Received: by mail-il1-x132.google.com with SMTP id c17so3890498ilj.7;
 Thu, 25 Mar 2021 19:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c3TyjwBJft9+viqfPrXWUpurNVXIQ9MInz6FpBne7QA=;
 b=RIfYo3knm7rJ8Fy8qNuU48hZbeapTu2tF4cGnlZCR9F4ZM5I03eDXqSPCxZswfhI4l
 MwbKKrTK1YKNYgACEJe9pUUNyG5HMN8ryvKud2Fjqah03zduTN5V/1+v67R6vsnRJNMM
 nxMvA3yka48mUXKmlr7P4msktvTVkphxiZIah2a8ahljfjtlWJDfLIWo71A1/WnXAYQV
 lUajAY31CYG3Br2ftZguq4q4SIkHodu3W5vE4URjTyfPVKeI1Pzcgh6EE3CVdIvd3s4v
 +vsLvxgQnGw2SpR/EGq5vS5BiEw6U9sU3y8f+zMcfT+mNIovxWztZKTwmCpC2AT6iTxU
 Ma7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c3TyjwBJft9+viqfPrXWUpurNVXIQ9MInz6FpBne7QA=;
 b=RX+yY+CilKN8pagnXo0KS/QlxlBX+DoREjJcZLes/2cjsHTi/FA/4rYEinF8oO6Yks
 FJaF4tVOGAPRsBZMyd+1DCFK8r6dj47l6Tf002RI36UBZhM4ZFfZW576Dkd/L1vWk/Ay
 j/61gFxYYmYtT5i4SiSjIa8VubheD70A7MP9XJq5dgV6bOFzVsOACY7EpJnFhSSm+zod
 Z086cpCrgX8jkVa+loogVxfwM1EDbK8BsGF/4/x5JIl+gdCN+nvZxwF3X4G8h9be5a+g
 qorLWBjAzQQSsD7iKAO+pqRBrbCVhzX02xOc1P4CoD0Ye0Dq+qiVX47KMFrcZaXVhCQp
 fNfQ==
X-Gm-Message-State: AOAM533WihaCidkcQsLcUqFOR1811mFE6ymIFRA8puSXGrkFCFMptfmV
 cxAo98WKrRz+130fXwo+n8OCyQ4y14WUEAWX5Qjm7pHT/sU=
X-Google-Smtp-Source: ABdhPJw17Oub2hHuFs6ahjRk6K43qQvnSr86/UUcgndqJ+RYESwqNNNP+pspx19ljyZykhlcDwPmFlcnawKA7sCm4Mk=
X-Received: by 2002:a92:c842:: with SMTP id b2mr8936041ilq.179.1616726735262; 
 Thu, 25 Mar 2021 19:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
 <20210325095529.GA5775@alpha.franken.de>
In-Reply-To: <20210325095529.GA5775@alpha.franken.de>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Thu, 25 Mar 2021 19:45:23 -0700
Message-ID: <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Chuanhong Guo <gch981213@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_024539_392187_E703F746 
X-CRM114-Status: GOOD (  20.59  )
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

On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > From: Chuanhong Guo <gch981213@gmail.com>
> >
> > mt7621 has the following memory map:
> > 0x0-0x1c000000: lower 448m memory
> > 0x1c000000-0x2000000: peripheral registers
> > 0x20000000-0x2400000: higher 64m memory
> >
> > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > memory region and isn't suitable for 512m memory detection because
> > it may accidentally read the memory area for peripheral registers.
> >
> > This commit adds memory detection capability for mt7621:
> >   1. Add the highmem area when 512m is detected.
> >   2. Guard memcmp from accessing peripheral registers:
> >      This only happens when a user decided to change kernel load address
> >      to 256m or higher address. Since this is a quite unusual case, we
> >      just skip 512m testing and return 256m as memory size.
> >
> > [...]
>
> I get
>
> WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> The function prom_soc_init() references
> the function __init mt7621_memory_detect().
> This is often because prom_soc_init lacks a __init
> annotation or the annotation of mt7621_memory_detect is wrong.
>
> Can you please fix this ?
Thanks, I will fix it. Having trouble reproducing the error, but I
clearly see the issue. Are you building on a MIPS target or
cross-compiling (I'm cross-compiling and no errors).

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
