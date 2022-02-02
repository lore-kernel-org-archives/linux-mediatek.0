Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C87C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNZpGardE9quFsZulUMTg395EB35ejZKUPjeQyf0oME=; b=Q2f/ydjoZB8jTX
	v4b4lvpeoxNRmny+MmPKuyASMdnaFx6lb/Wqwx5KZXTu/eQqh7PUDVWZG0HXQcRtl9ASo7TjigkuO
	5qfYt2vpEcHsG5OkKW6wdVEQ2IqekdpTE5oF4pB2E8+pP4OUqytu1ehGDkbqjod3iZsOigoIchSd6
	v9A+H8+v/3ZBsGugLCNZBklccXCV/a+SCg+xInzuJt0yeA3LEAjahLkgmHbeP3OrscAQFPFQEcgEb
	b+1SIsc49z6U1w3FkJIH3agHdD8ggmZiOcTddg5XrTzxD9amoPWH/NgkWYhAhLREVNLI6abKZnsqV
	VcIxsmG5an0ZfVz/7iSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGeb-00Fhly-IW; Wed, 02 Feb 2022 14:30:37 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGcm-00FgxU-Tu; Wed, 02 Feb 2022 14:28:46 +0000
Received: by mail-ua1-f49.google.com with SMTP id b16so19452360uaq.4;
 Wed, 02 Feb 2022 06:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQbN/IG7k7oQjSkAnXdbQ+TtLAJYx9/TKrsGBZwRqyY=;
 b=a4H1p2f7DHbe6ubV5iXMdw8t3z1Qcer6T6nG8FBqTmrbJe5oprE8FBChiAGu9CSMi1
 3SKbr5RSzXlBpjqvp6GQNWPDygZ4iIycXBXWd58QsBFvbAuQBM0GDNsmdIrYmt1qQWLW
 V6r3eA1FOAPUzUvAyjfwLZDVdC1ydHFAl5DG45PA5LEpfFaYsIPWaUFIbTqJqMDO4BGu
 AE16U7+3uZS3VnLTRsNZV1nXQZfGDpnE4qLRWoZnfH0BCcC8uCUxogKgHagIl+uPtgoK
 5CqUFLlH+fLvk3B8Ix1MupcGGbqTf/tndPBYX4uYIA0T6X3YCK/ZPIcEEXvmo0EGKhQ4
 5jEQ==
X-Gm-Message-State: AOAM532LTwml8EhXatZA3vz9kdHexvwDy4LugrTnCqHt2890mG6Cz1Gn
 JQfz2eFLiC34hAsKVXw//PxkhjG2FS155g==
X-Google-Smtp-Source: ABdhPJzoY3paLTe8Vqir4pafAOXIp4wikRJfaEenuMhGHYJ/+mwKH9iEbUFQ4J/y3VlSs9VdMRgEqg==
X-Received: by 2002:ab0:14f1:: with SMTP id f46mr11525333uae.56.1643812123347; 
 Wed, 02 Feb 2022 06:28:43 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id x20sm4935180vsr.17.2022.02.02.06.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:28:42 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id p7so19435539uao.6;
 Wed, 02 Feb 2022 06:28:42 -0800 (PST)
X-Received: by 2002:a67:b00e:: with SMTP id z14mr11549301vse.57.1643812121840; 
 Wed, 02 Feb 2022 06:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-5-maz@kernel.org>
In-Reply-To: <20220201120310.878267-5-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 15:28:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV91fXfTTK=Jchr-wmatY3kJjke=UkSRCBs42kq5GL43w@mail.gmail.com>
Message-ID: <CAMuHMdV91fXfTTK=Jchr-wmatY3kJjke=UkSRCBs42kq5GL43w@mail.gmail.com>
Subject: Re: [PATCH 04/12] irqchip/renesas-irqc: Move PM device over to irq
 domain
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
X-CRM114-CacheID: sfid-20220202_062845_003541_386B449E 
X-CRM114-Status: GOOD (  19.11  )
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

On Tue, Feb 1, 2022 at 1:15 PM Marc Zyngier <maz@kernel.org> wrote:
> Move the reference to the device over to the irq domain.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Wake-up still works fine on R-Mobile APE6 and R-Car M2-W, so
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
