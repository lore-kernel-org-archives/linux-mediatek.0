Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hx/+cEU+qMvBWTVuqw2PXedH7HY04s3G5t1jXbQ5puI=; b=QR3PAUKYf49Qjk
	MZozKg0g6VtbNTxFE5i3X/IwND/42c4nP2bCWXlLCbUe01+FBx8D5RQDrdXkYO6bPzB3WM1iPtZpn
	mApXPtc+EyyP+wSBFGPYMYKrcRagZ8/K57xHN29veToBAIXECXGUeGaDUqr2SzN9Mf//JA5lU4bmK
	aYTW4yGa5ZhlKAeV6xIltfvEiunjfBQgO2GOrXK6fWG1s1hE9CIEJhEZIEsuoCH89+ifKydVn+SYi
	mSy1hWI6bJCEGBE1mEiTXHmwl48w3erjs/i8chcahQ6X0ltO659cUrcGH3UM/4Wf4LPbSosozrDkv
	2gqr6HntRdBoMIU7UNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGdV-00FhGy-Bm; Wed, 02 Feb 2022 14:29:29 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGbx-00FgZL-7G; Wed, 02 Feb 2022 14:27:54 +0000
Received: by mail-ua1-f41.google.com with SMTP id p7so19430670uao.6;
 Wed, 02 Feb 2022 06:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMuf6Mgi8WTV8TVhhqxvBDCExEnbdcrTWjjU3gY+Vog=;
 b=r6HEExWfg8+8o1UArzDT++UvRq93BsutUM1ha1+1+375pIk412MW1cF3B0zIigmY/U
 sUL9iHhq9WSR2VI3sJMdJkGAPuBoFfBIeTuZehHQ21dSlBYlHJwPHwQuSJ2tXkW9wO4F
 yEkz12ysUTTBbB6yB3ds6lNphCdUbTzgnxKD9KJ67zhp2elcsCsocoD8rj3PwzZGGyEU
 21eWJs2rbKGi960OQLU4uU/a8OhgO8wFdnfywGaMdP5JvoMwQVun6W8pXxiATFBVEZJA
 2U9wphVkRwQdy5/mQdLmm9dEE2ZwP6YsZIkZMTNjIaUWlfLwQ8/Ah/D6pml/tIr/fS1T
 VEsg==
X-Gm-Message-State: AOAM532HfdCIwSb1NuSjRAGH6iEZD6lwJA0A++te++LDarE/FgD1F0IM
 s7IPUM80kea36DHES9Wc8UTOR+Fehir6Pg==
X-Google-Smtp-Source: ABdhPJzWRCV6bypRqpdmOGFcrMKws7yJcFrVmhrfW89YL040YOs13xdxQdr/5mEItLFa6USSA2ZoVw==
X-Received: by 2002:a05:6102:320d:: with SMTP id
 r13mr12318615vsf.42.1643812071661; 
 Wed, 02 Feb 2022 06:27:51 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id v201sm6148926vkv.54.2022.02.02.06.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:27:51 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id u76so19445890uau.3;
 Wed, 02 Feb 2022 06:27:50 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr12318471vsj.5.1643812070591; 
 Wed, 02 Feb 2022 06:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-4-maz@kernel.org>
In-Reply-To: <20220201120310.878267-4-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 15:27:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbM8kvmv0XKP8=rYj-8k5cFt50VP69LeDNX5oHx2e9dw@mail.gmail.com>
Message-ID: <CAMuHMdXbM8kvmv0XKP8=rYj-8k5cFt50VP69LeDNX5oHx2e9dw@mail.gmail.com>
Subject: Re: [PATCH 03/12] irqchip/renesas-intc-gpio: Move PM device over to
 irq domain
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
X-CRM114-CacheID: sfid-20220202_062753_308984_0355B084 
X-CRM114-Status: GOOD (  19.40  )
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

Hi Marc,

On Tue, Feb 1, 2022 at 1:12 PM Marc Zyngier <maz@kernel.org> wrote:
> Move the reference to the device over to the irq domain.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Thanks for your patch!

s/gpio/irqpin/ in the one-line summary?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Wake-up still works fine on R-Mobile A1 and SH-Mobile AG5, so
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
