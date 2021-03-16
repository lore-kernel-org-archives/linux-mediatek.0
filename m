Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EECC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 00:40:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB31864EF3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 00:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB31864EF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p7K/NkLfUw1PIbOWcYMKRMkMk4K3uORCZm2OyC1z7hw=; b=KnBDl2C6NgFYdfwtfMA6ASeVc
	CVExkgX6kTLxjKEburMXUgtg8j4NYKYOTam8jt//75OuBriUYQHxyI2R9WvQuzDCFnA7Vi1YanjHJ
	3CUE39CCN3O2LUMLH1rrTovNRPQhtd884+WU+PdSQ1vRGxaCCAyxbDdW/F6p9uWeWztVkzG0iKY7I
	D7oW+oqxNMmOzTgdXwop0JwId0YKZe8nC24FW4is8HnHI3ASa70NQo7OHCWfaMhHhKzZa3EpjyEZp
	r3nKKBJ63qHkiRG7HUquiqbWg7PoMPZ1/6blFSztssLHjNqSrFWV9JgO+NSbkd3bZk9fvka91yrca
	RJNUVdD5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLxlA-00H9Nc-5B; Tue, 16 Mar 2021 00:40:32 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLxl5-00H9N3-VY
 for linux-mediatek@lists.infradead.org; Tue, 16 Mar 2021 00:40:30 +0000
Received: by mail-il1-x12d.google.com with SMTP id c10so11135241ilo.8
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Mar 2021 17:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3EbL30ZKOOeXL4H1TZYLjRw3pggZqctEO1xSA9/mHts=;
 b=GGih0i+gaWiOOV/rY9Kk0Hz4ESEucxOUUu1sRKY07Y/zDeioTnX7ffg8k4f94lddB+
 7OhMSP8N223FQJOWN4ZXjNEK2SOk1GonqrTKrGEVn0ncg7e92fHhMXcfLwxmgD6HSbgm
 ZdqT+HTCPU93tcfXlW7xbWvVbgEASugI+S2DQWLEewl1d5W1qHMRai69emzp74YMzAQd
 7MS9sm37OLvpu3NKDqn/OPJwM8J2BOtTT3YIO7FlypHTE+GYhQU8YpWck6RBD9WQr6eV
 KQH8OzmlvZbDKiPHJLo7hZ/torvC74Rseyfy9oCuvSU51ZaydyovJ16kLUsZS9kyp/K6
 w9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EbL30ZKOOeXL4H1TZYLjRw3pggZqctEO1xSA9/mHts=;
 b=hxyoFuSmYlIhbHBixp6q7NLFtTlmdq1Yqc7pf2U8BYfJHtwx6NEym6AeuuSahQT/rf
 6SDQDBEuz+LhImZX30+rabZbzemn1VgvI4dVLylteVQVMfAVlbSOZ1ukcbRblQJCJ91u
 pVs0JVA9qjG5RGyyQ+DgSvOFSt3h2l7K9ZAmfHVr0Zv6ajB3sbIKBciodw8+aRg1s3F6
 Nnw3qdeda2sYe+oYMFCaRRb9/b+ygdfnpP6iQ7OKKGfaY/ezFxYKhJoZBkhz20DN4A7W
 mrFuH6mxqGVShsIGeEXPoTyw1MOvREbQcpVfKlJzuYJaGBfzKjE+z+LQIXZsOzal29h8
 ydZQ==
X-Gm-Message-State: AOAM533gfFQ3bnSe7xgSHI3Vmufw8X6j5qsRygFRQc6/Ixhvaszmpf5V
 emCwJX11trM4pWybl1gPzTyxLMSR/Tuoay0kwl2GZQPr7QM=
X-Google-Smtp-Source: ABdhPJyxa6wlB/tn5ckNPuhK4wVNcVJk4BAHOIm3WntCpiZ/Z+/AtKagKe9+qA68jaIxz6WRjOEINtWYhIAg1+Ww9wM=
X-Received: by 2002:a05:6e02:12ac:: with SMTP id
 f12mr1696246ilr.103.1615855226213; 
 Mon, 15 Mar 2021 17:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com>
 <20210312103341.GG7027@alpha.franken.de>
In-Reply-To: <20210312103341.GG7027@alpha.franken.de>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Mon, 15 Mar 2021 17:40:15 -0700
Message-ID: <CALCv0x0EiX-RiH79izHymURxos2SZF+J8GZ1N2AQkrFqiKmY0g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: select WEAK_REORDERING_BEYOND_LLSC on MT7621
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org, 
 linux-mips@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_004028_699865_2BFBFA0B 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Thomas,

On Fri, Mar 12, 2021 at 2:34 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sun, Mar 07, 2021 at 11:08:06AM -0800, Ilya Lipnitskiy wrote:
> > Upstream a long-standing OpenWrt patch for RALINK MT7621 SoC. Selecting
> > WEAK_REORDERING_BEYOND_LLSC fixes random kernel hangs. This bug and fix
> > was reported by MediaTek WCN division [0].
> >
> > [0]: https://lists.infradead.org/pipermail/lede-commits/2017-August/004537.html
>
> I don't see the Mediatek WCN reporting there. Looking at the 1004K user
> manual I couldn't find a notice about such behaviour. So this looks
> more like a fix for papering over the real bug by just introducing
> a few more syncs. Could you please point me to where this is
> really documented ?
You may actually be right. After doing some testing we may not need
this change after all. Let me drop this patch for now. FYI, the
following commit may have fixed LL SC issues this change was covering
up: https://lore.kernel.org/lkml/20190613134933.048961704@infradead.org/

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
