Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE21C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 19:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHCVU5j9WbC2yoOfY9STrhMBPCRwm3/Ywn3qrISgkmg=; b=rCmSeVX9xDGPke
	pF21KrG1cJT09YpkWcfx7mp1J83AW/JFIbgxzd3kUYizzU4xycEEEHncyVtlg7zoeCXiogPp1Hr3b
	5z8jgT7oSFRzFpZgCd3IOaWTVkTTBnrBdfAJpHAfNPYKB7lpKsujtUWzdgWhvJjjYamFlCLDacplc
	CaJ8Vu/QxOx149bbG0aZMJR5IXAagB33e2wl51YFG1ChgB7zQtCvR8/lMYPBMD/OvGMpYmawYoJSL
	Os73GrRLrB3YxNXVvFZTwxARh+SPKQ2ipT92HdtOigRh4eJm9OBwuJspdXxfrpptKwa/I2OQ1ijs0
	jl9uxjyNmgY6dCbHapuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMaj2-00BK55-5Z; Tue, 22 Feb 2022 19:21:28 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMaip-00BK1p-7h; Tue, 22 Feb 2022 19:21:17 +0000
Received: by mail-ua1-f51.google.com with SMTP id w37so280318uad.10;
 Tue, 22 Feb 2022 11:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBvMIb8OT5TkXgxu8ndJKb1NeTk3l6YrJ/QsnvHZQzk=;
 b=c8PgYGj3ZWbQOwKHuoYAX5VApIqQOXclapp4U9ebTi0VXX6vQxhbRUcEck+PWGyHga
 zjU8UcSdmCl5r2riHvjGJxxDHaK/cftmTC8tmju/Gs6XbPYTWFWQVF3/9uscGgHgr+NH
 iDqLJ8nAo54QyJVM68C+dSrs5s8jE4Gw96dg0y+Q1a6M0fQaQMWXKM7ZzC3aDPditn1S
 AsXMLazR6ItxPpiEku/DKLiczGKzYYwze0OJxFlb93iX25EK4LrcLUp/uvCWhgN//de0
 TMk4IRurJR4DcqJP3efQolhCHxr033Dg0RCz5qlzp5H7GyQQe/qsqsRC5RRNQAztntHj
 7Etw==
X-Gm-Message-State: AOAM532epQd4qtFn9y1eftACAqLkWMItvKCA+DY+E+ofPnfW5Q5SewU3
 8ZYA2eUDtj54HBfFt2qyIpiFT3wJM3Ehjg==
X-Google-Smtp-Source: ABdhPJzmvrMKJDQpDR7YwqTiSGR3KPDhU7ITH1RudrB3PDe1wK1rrDxPZGDd/3ofoUNvfANWsqoheQ==
X-Received: by 2002:ab0:5751:0:b0:342:21c2:1b4d with SMTP id
 t17-20020ab05751000000b0034221c21b4dmr6081637uac.2.1645557671559; 
 Tue, 22 Feb 2022 11:21:11 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id y22sm151298vsk.6.2022.02.22.11.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:21:11 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id u10so649038vsu.13;
 Tue, 22 Feb 2022 11:21:11 -0800 (PST)
X-Received: by 2002:a67:e10e:0:b0:31b:956b:70cf with SMTP id
 d14-20020a67e10e000000b0031b956b70cfmr10507511vsl.77.1645557670916; Tue, 22
 Feb 2022 11:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20220222090435.62571-1-tsbogend@alpha.franken.de>
In-Reply-To: <20220222090435.62571-1-tsbogend@alpha.franken.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 20:20:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRHm8B8KdkgVyqrUqn3q=-8VUpikR0eZBFQD46X7YBVg@mail.gmail.com>
Message-ID: <CAMuHMdWRHm8B8KdkgVyqrUqn3q=-8VUpikR0eZBFQD46X7YBVg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Remove TX39XX support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Cercueil <paul@crapouillou.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 dmaengine <dmaengine@vger.kernel.org>, 
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_112115_282943_EED03D04 
X-CRM114-Status: GOOD (  16.19  )
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

On Tue, Feb 22, 2022 at 10:50 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> No (active) developer owns this hardware, so let's remove Linux support.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

My rbt4927 still works fine, so
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
