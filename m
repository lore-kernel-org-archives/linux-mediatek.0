Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC88C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZCy4l7mPY/4KsNs1fyRJ5nej/CNNmMGKSvAsJzaF+I=; b=c9rGPBrG9ss11E
	UH/Pbdmp7Zw4mKDEJQConAtCHRsosow+gBJep6FriiOdGbqwVQgwGTRF1qPta/dTewtPX2bm4hUba
	dsc3voEEoHqvUNQwFJz+Z/1QfaT5nQzj+NsUgtH8oi6ovEtLMv32ThDlNzwuij6LLPP5i76+klZah
	Md01Fm7OBnAZ6a2RsI1uf0aVZoWR5I8fWDAD67qDURpdKPmvVF2NX3NLAzRLvHhI966reIG79iu3t
	chXeJAgNYTYBqcCJZxZXeN+hTOlSiXvqd0YWlwtNGCPRLE3L58hJ5qodzZd840F8/LkoW8FdsW1lQ
	zR49Ji7QjIVcjK55bR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzKKA-0032Yd-GO; Mon, 20 Dec 2021 15:11:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzKJv-0032SC-45; Mon, 20 Dec 2021 15:11:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id j6so18881197edw.12;
 Mon, 20 Dec 2021 07:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBIoGw/e/zcvG+pHiU6S4HSaNOHwibSXXHgdcOqKpt0=;
 b=g5w3zq2NJj7FJNKB6S4eRDs8mFKJE6NotK7FF6GXMEgZ18UwBT107QQbz/ylRJ7XAD
 rxMXVmWZocz1dWweCJ2U+MWs5LfN2YOXXpHQ6R7YVX5Ap6+8XTiet4rQbNbnW3nowwVS
 8N3oMITPRhSHD2f7ULqqZ3trHI9x/5BuskLxk0KwxbygoH3ALIDkpcUmyg5RMTzRvGHh
 yJPWWLUNnGQXmUvhgp+o3fwjdRsRwO37RHPCmyC3K0n8P3fhLxW5ZcrZ8dqdALg1cNZN
 3tFRVXQDd6/az+dttSn69qu74M70HGJj0fpJpn/KayqQWWY0VpUau1OGGvvFa2CIThk3
 G+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBIoGw/e/zcvG+pHiU6S4HSaNOHwibSXXHgdcOqKpt0=;
 b=ulJ6gV2ZnCKTkIgDBMcLNVxcb9TA+gI5/bu+JkeTQxQIBrywrcOqNuV7+bao1ZaltF
 uAs5JdcC1yac/QCFsRXZumSjhBZFvwKyXwk3pCW6Sz0Lbsh66RQ0JVceFtf2UFzIiXBx
 Bg6Ln47m+HbJmSZq9cJaUemWgnHt1iVn0zmQYztEM5tBzeVH7tK6pETBPpOMWLnBWo4k
 QvGvZDcGV+PgZEa7BQ1xogWdWhBpaG7oL9cahWHpA6WD3tWw+Ra7F498MRgHdq829J5T
 R02hmyx/q8gC7JKUARHdeZb315rKfDUcqeHXP7XW95e7yyVbFjuAn11+jBimLa65i7i6
 LUJQ==
X-Gm-Message-State: AOAM532FNrlVh5cEof/lDyzxPes3p8G9A5HSHjpVbia6LLlmbLc3gQEj
 twm054NfXSiDvV1QwBuTECxZXIAgpzrbBW/Hx7g=
X-Google-Smtp-Source: ABdhPJwNPdlFiyq6tdH9hFgzAwymj19tpiQ0KxZM4gqqznfenD0pSWIWIRrWm9wcb1jCZbCyqF5YMjt/cuc4WnfY9lc=
X-Received: by 2002:aa7:c7cd:: with SMTP id o13mr16731637eds.37.1640013075412; 
 Mon, 20 Dec 2021 07:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
In-Reply-To: <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Dec 2021 17:09:15 +0200
Message-ID: <CAHp75VcbaYXfDpc7xE=asSqUspscRoHfqrg-yMtx=uo5UNqxfw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211220_071123_190963_7ADD1444 
X-CRM114-Status: GOOD (  10.89  )
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

On Mon, Dec 20, 2021 at 5:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Mon, Dec 20, 2021 at 2:24 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > After the commit 448cf90513d9 ("gpio: Get rid of duplicate of_node
> > assignment in the drivers") the OF node local pointers become unused.
> > Remove them for good and make compiler happy about.
> >
> > Fixes: 448cf90513d9 ("gpio: Get rid of duplicate of_node assignment in the drivers")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> > -               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> > +               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
>
> This is unrelated though. Can you make it a separate patch?

It actually makes use of the local np IIRC.
It's related, no?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
