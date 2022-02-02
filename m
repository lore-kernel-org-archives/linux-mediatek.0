Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E241C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfnL4CyQTOBaJV6cHdb7KhYmFXrPpaT26DmGoxSIH6w=; b=ZXAL4KrKuBL8ef
	jWUfgbfhdi6MmH0VpQFEiwqBpXu6+aO3GPJSN70LD5cWjp9HH8OTtsJWqAjZHb+RQYmmGVTG1fuhI
	J+H+2iJwvujanUfsC4LQZYnyfxgoaO68esBUK7x1htSUX8LNbiJ5j35OMZrmYRmPke2wszD7dtUau
	62jBSP8Ojf54V4YjV9c9uasA+caruhY3cjfQ2UZqXH/wLWV2bOcrpVwcxlCDfM1N3OgVRssIngUBc
	C2mSeIJKOhN0cQ/NVRXH1xcD+NOhmC2YSYWgOfv+hhterFHtvXH/1saJFgukNmZMOII/BpzpBOq5h
	k9kJMtmGvyk+DWjtVyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGfR-00Fi72-EN; Wed, 02 Feb 2022 14:31:29 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGdG-00Fh9k-FM; Wed, 02 Feb 2022 14:29:15 +0000
Received: by mail-ua1-f52.google.com with SMTP id l1so19418421uap.8;
 Wed, 02 Feb 2022 06:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZRyCOx+Er0yiaBLPHzoN2OzH4NMZ0OLZ67W+SG58hjg=;
 b=Ae1KkX6KYDPYytF/zdZN+ULBNZ5iXse3Y9A8J4MQ2xodMkG0zbgyArs/jO1D2Z5xhg
 6f+HeZ/GrRm8Em6DdbVT3sepaAh/2RtdbooO3tQi/jzseLQrMcWaWLpV4QsD9ivFsNMe
 xTlQ49se/IHsqSJLW5gKRF+Jg13Jc1PMfWkr3X/52+Dwfj8xM7EY/6bNZjx8cGzHpjw9
 1jN7h+iBkxxj9Hk+Aby4kwSFSundjPDX9UprurhTN9u1bqgyIGsdUPwYB4z7ZLWNhENU
 dj9FMv8cX/B/kOwJpwIoSimfWo7ZSlDBsCI/tRmz6myIBd7KMx50RJ5NmjSD/NCk6Lwb
 w2jA==
X-Gm-Message-State: AOAM530379kS5wJ0g+XV8abutfy00nWcTq7nbRc5KQ0o4oqu53YS9TCO
 UdYjze7YS/ZY4cDo0P1Wm2gi+qNU11pZAQ==
X-Google-Smtp-Source: ABdhPJylAZ4nHD+FQVQwXQ7fxoHOeEw6/HIIOpseA8oyK0aHT05jZCSX+UN++7fTnLsJce36LqlQeQ==
X-Received: by 2002:ab0:6e92:: with SMTP id b18mr14074936uav.132.1643812152446; 
 Wed, 02 Feb 2022 06:29:12 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id n8sm5615392vke.24.2022.02.02.06.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:29:11 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id e17so19413488uad.9;
 Wed, 02 Feb 2022 06:29:10 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr11148475vse.38.1643812150361; 
 Wed, 02 Feb 2022 06:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-9-maz@kernel.org>
In-Reply-To: <20220201120310.878267-9-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 15:28:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWy+kYMNv+xLT6ybqnMKvaMchBXwXV-NSFNKDAfgPnLhQ@mail.gmail.com>
Message-ID: <CAMuHMdWy+kYMNv+xLT6ybqnMKvaMchBXwXV-NSFNKDAfgPnLhQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: rcar: Move PM device over to irq domain
To: Marc Zyngier <maz@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_062914_575076_69818C58 
X-CRM114-Status: GOOD (  19.01  )
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

On Tue, Feb 1, 2022 at 1:16 PM Marc Zyngier <maz@kernel.org> wrote:
> Move the reference to the device over to the irq domain.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Wake-up still works fine on R-Car M2-W, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
