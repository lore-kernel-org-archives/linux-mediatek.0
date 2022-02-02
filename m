Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B83EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgkAgkCqdMLdpmyuHvO9sWVZy0YllEfEIHhoDJjiQHU=; b=prTHHY7UO3Hqng
	mCabm9V8RgYO3DWH4+H9HlvzfWmsGYY+U1+ji7zoE9If0Wn8P/M5l0PJKjHGOJdpTgiwVMLq0RwPT
	WO3LSWXwRmaI3ojoRv1KpgNci+bDr3eBDwacrxYWjYJQtet5iQy81242AeIovgIfy9RVO4vvEKu00
	qLmkWJdsnWUQbOdO2AZGmX4FJQOWeafC8d9G1c4cVgPt+YWVfkgZi3VvxHli8YcukVhnCOsngMA4m
	dXmdTfsJq/8hdoRUozDLM+9ADp8iRmEaB9rHBjqcaVPZakFW5LYiNtw5f+RJDVAfMZm8qkb36TNaf
	bQvL4cvsCP5BnAR3VRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGaW-00FfwZ-3w; Wed, 02 Feb 2022 14:26:24 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGZW-00Ffag-Mz; Wed, 02 Feb 2022 14:25:24 +0000
Received: by mail-ua1-f54.google.com with SMTP id b16so19432803uaq.4;
 Wed, 02 Feb 2022 06:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHHkDQZTsE2xhNxSVITPsL9fvc1DhHDBALiEGJ5aodc=;
 b=8FrbVcRBNQsKI+JbbtZR8q8G7Uis8AEFtxLdytUuhthaRBaC059Sq3OOvoLPbv0WvY
 BUmT4NJsPBTubxUDOIKqAulTCpjNACIomHJR3/5+iG2dSJT/6f6XRHZq47VlhoeTKd/a
 g3ESgYrneZFDMUCObeXnIk3o/KSXGRivs0X3/dys2hOa9mSnhN06mMAOl8CAn2mk7eEm
 OC0vYUxJpa6XSRp40vuhxBL+Pb0i1xELhUCkdMfCPkKH9IPOz1LJQq7hnBIOlZszbvDy
 BuWL1LOd+eGRQ1zqRUasIunfBto153c1PLnKCl2xxr0GIeKV7fQu+r+oiWMNdGQZSzOk
 Mu5w==
X-Gm-Message-State: AOAM533rA474JwzLW2Rwo8fi5Ynnj4IErxQT6NYhoBDJSyRSZqtOOlxT
 lUTX0pUVoPrcdD8VpNq07K2YIol2ErsmzA==
X-Google-Smtp-Source: ABdhPJxDNXXy26ZMIUxQ38V0rU/ejtXD/R5YPHiT4iEr/ktZWY372ygmQiQdNYYuz3Y1yyOAWJv2Og==
X-Received: by 2002:ab0:372a:: with SMTP id s10mr11899406uag.86.1643811921255; 
 Wed, 02 Feb 2022 06:25:21 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id 22sm509609vkj.36.2022.02.02.06.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:25:20 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id n15so19443555uaq.5;
 Wed, 02 Feb 2022 06:25:20 -0800 (PST)
X-Received: by 2002:ab0:6cf9:: with SMTP id l25mr12222950uai.122.1643811919950; 
 Wed, 02 Feb 2022 06:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-2-maz@kernel.org>
In-Reply-To: <20220201120310.878267-2-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 15:25:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWaS9YnEELFhW4fdVj_Uo1D0R9sCWKnVDrPnLWN16NB1g@mail.gmail.com>
Message-ID: <CAMuHMdWaS9YnEELFhW4fdVj_Uo1D0R9sCWKnVDrPnLWN16NB1g@mail.gmail.com>
Subject: Re: [PATCH 01/12] genirq: Allow the PM device to originate from irq
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
X-CRM114-CacheID: sfid-20220202_062522_788311_FA502B83 
X-CRM114-Status: GOOD (  20.87  )
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
> As a preparation to moving the reference to the device used for
> runtime power management, add a new 'dev' field to the irqdomain
> structure for that exact purpose.
>
> The irq_chip_pm_{get,put}() helpers are made aware of the dual
> location via a new private helper.
>
> No functional change intended.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
