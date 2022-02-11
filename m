Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B25C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlkBRcQz5WnjVeqQtcwFussm2VbvSH2wr7bt/1HOzXM=; b=kp3xPxYwpQheCa
	udWCN26mPJkwtGAqahTZkdh6BmaG0eUJLRLF0OsAhLSOhJ/CrzM2B+vnQ1SpvsozRQahvQSqlh5p5
	ZWuMLpIgYDTJLmFAfAOLB3WORRRbDTDtj0tHqNn5SuzGOWt5w1ePtrX08zNxMlNDjGn7H/fpH0AXD
	axOsM6bN/GgqQYa1XaJJH7ZkNpS4i7dy3PjIJ9VN4IOgpw/SH+nhMYF0hvyHRV4Tx0n4g0pnbEoI1
	gtj9frNAo5SyjkXVofRTii4Ljegy35BStR6YzQalXlt4SPTyZHCdBKeENY1o5+CQVvXdrEMyRLkwr
	nYJI+m8RBfxUk/OP/knA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIPlj-0060r3-N3; Fri, 11 Feb 2022 06:50:59 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIPlS-0060jr-PT; Fri, 11 Feb 2022 06:50:48 +0000
Received: by mail-vs1-xe36.google.com with SMTP id m24so9157303vsp.7;
 Thu, 10 Feb 2022 22:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OSROPkIHqOIfi3Mx6GPXtGKkcEJ0TQ6U5/02TvsWVjs=;
 b=aI6iirQLDE79NFBohp4tGvHl9CuJHutPPj78yxbu89pb2Pwy6FzthqI52TCGsqnVsi
 nPByOczGUEQLxLF7f1hvq3IXINsb2d9nh0ou1Wta6vGgRAtOfLEzuANmnWkMTOreMtzB
 2c4wtjp2fBfGXIrnZXEJvVtxF8EVqhIj2sM5OgI0b8diZIHQQIyv3wtxvu8+DYJ+UuIK
 r3nQlVWV1kLAAX9S28hNVCmp0jo6g0YdYBkL/Yu79JCSUKNVlGiCKQY1aLtSD9n+jgMo
 mQYD1lmQXYKOeApQjSEv1ygK0HRmSDt6YnYU1IvD4AO0i4+wlymSHKeYyK9EtZ/XFvwZ
 jH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OSROPkIHqOIfi3Mx6GPXtGKkcEJ0TQ6U5/02TvsWVjs=;
 b=QaYljCuCSgGSRBvRPbZqJ9A+xv1DO7+yHON+Fg9vT4FuGuTjshgD3lGnRL2kP4+aqg
 wPh0EU/3iMNBiFMaIhDSMYtCGSQqdBoMwS0b2oBdf7WyyTViuLC+ogB8RblSt4FdyEW7
 dGq3y90zIF4fdEudeZs+JuPy8vFOWCmgcdwuih6L6zVVg3GqK/1d8d4aTcx+YHayzjYn
 sFIMZErhZJunH+F8kPrrImUVmcwPqpF4VOZ8DUp8t63pbqnjlHM0nB8XrTcHPrlTaXF7
 aVvKTw9O3fMdpldZosZZg30/l4VeU47eDE4fj3FG0nYCgvL3jsbllaZ0G+2ouMYPwxj3
 psCw==
X-Gm-Message-State: AOAM533FFovVJCOvcZFHGsqJO1C8lIUSgDnxasiCfZwQTOkXgDtGxUPc
 WENwovHJF7SwuLhJm1emp4hlvWvK2MafImm/XQo=
X-Google-Smtp-Source: ABdhPJzCPF1tTpcQ1FWpqWN/gHplGyCbU2hVnrJ2gUBllwLUgLp6iZnR43b4mmVnWetix67HkzQhNADYz8Oi3+nNfFE=
X-Received: by 2002:a67:10c4:: with SMTP id 187mr85908vsq.1.1644562240863;
 Thu, 10 Feb 2022 22:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20220211001345.3429572-1-gch981213@gmail.com>
In-Reply-To: <20220211001345.3429572-1-gch981213@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 11 Feb 2022 07:50:29 +0100
Message-ID: <CAMhs-H9O=EagT-6296-CMQFBYFfekj2agrH9a8JpHzeC36EiUg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
To: Chuanhong Guo <gch981213@gmail.com>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>, 
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_225042_855203_032978B5 
X-CRM114-Status: GOOD (  14.60  )
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

Hi Guo,

On Fri, Feb 11, 2022 at 4:56 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> It's reported that current memory detection code occasionally detects
> larger memory under some bootloaders.
> Current memory detection code tests whether address space wraps around
> on KSEG0, which is unreliable because it's cached.
>
> Rewrite memory size detection to perform the same test on KSEG1 instead.
> While at it, this patch also does the following two things:
> 1. use a fixed pattern instead of a random function pointer as the magic
>    value.
> 2. add an additional memory write and a second comparison as part of the
>    test to prevent possible smaller memory detection result due to
>    leftover values in memory.
>
> Fixes: 139c949f7f0a MIPS: ("ralink: mt7621: add memory detection support")
> Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)

Thanks! Nothing seems to be broken after these changes, at least for
my boards :)

Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
