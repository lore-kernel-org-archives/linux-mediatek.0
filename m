Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2CDF3092B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3yqJTxsIY1lPN4PgWxKVyykkH8+ipNK1w9pI9/GKdU=; b=0bfyx3ogAcc4Rt1QoYDQ5D3+D5
	KdH+ungMR+k9FW7UKKpLZzPQZXHWBw7L6rim5a6L4J5x8jBh6lrYkTTOll3jyZH3ws00Mca8oys7Y
	c5RZB8VKBieYgkwpUAIPNtffCCOTBkUOs5TAhy3rs7dTH3Zp6KRq0KvDkTTlcC2ZgYmPO+zu/No2k
	K6lXaoNvZHrjZtWKhrVLhjC7PIqZ56C50AxvAxi667x+h398o2Ur0eNJfKN6YaXBXC3tVIwHv2C2Y
	zAa76e0n1Ukq0UoXvcb4nAX61ynaNqpnJoy6rUTgLHc9r9CvtdKeuRlQXk4UJNuO8Iczb1YnSqA2e
	DXo4Wxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5sm-00000001Zgv-0Hbw;
	Thu, 05 Mar 2026 10:24:40 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5sj-00000001ZgY-0wEu
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 10:24:38 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a8ebde349so6480617e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 02:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706276; x=1773311076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3yqJTxsIY1lPN4PgWxKVyykkH8+ipNK1w9pI9/GKdU=;
        b=xPqqr+XdKu84GqZg7MRWTqPPcEosybzV3JL4mONsXCkRyJqQd0ns+478QKVECJdOQC
         Q9LOgOp9/wCbokh1yefcBD0ViMjTBj2bXv6T+O6q/QjSqFOz2UxJuLSLoo7WUuNL91EA
         lSB3+U/Z0qOL7WOXNaIq1L+BdWZ8ocoPbCRUM0hvIvFU14Fp60cyiRpTvBuOZ4dIKZcB
         qCVaebST5WDgZK2+ibda4jksiz9TNOKGazsQriVoXeXTPcJnNYIh8qd7qrI8KixO2m1p
         OEBh60xg2njWpUr7DCrhBS7EctgqvtWYZ9wjWU9voubqnrUE9YbCrrKkekREvLPhWRG7
         9D5w==
X-Forwarded-Encrypted: i=1; AJvYcCWS7R36Mm6pw/Y57I65EqScjq9THMC2GuPIxPx7f9nSxKJahaxex8ttrylofp33jV5nUo75yZy5OyAlvhmv7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+TzbShHFIjZQK9vZ1R4YXlek2snkrs71bnjXfz/nYOQrU6HaC
	vmWNDynnSIaWkLr1ddYs8BudSv2AP/SS82srs558dZdJg679XWfHtXpaMzv5hmd7
X-Gm-Gg: ATEYQzwmiUa5qFsl+sHsPkn8T99pAUG1tWSBgN7IFVBT24F+BUqtywaFbF4BSMebXJu
	vbzbcXzVLgRF4+hOmxxtEjFzk1iP7Cgh/iWIdvOMp9aasVeGSNd7gcRAFHMLqI3Pagwq7slJfdN
	Ow7RQbTUsCrYMtgiCmuDg9UqlocFHxK1F/H2fWndCskAdPcYgMEspVpeO8pvSa+Q5d9enNGasHL
	BLPkWVPiOBH7VKppcPjiU0aE8pX9wnipmt3kCg834YIVr61FshcvYG6/xvpoMMYoNB+I5QRf/Bv
	FGk0JVqeflRoDR4CuMVTcUD0PH7GPQL5nrmMlCYhruVRU0S5OJb+np4XHkQctIhtnn12rTnN5pQ
	or36e+EWylRKwLi0R7iS0EmpGySkTVZKlwJVUfd6/NnYue/vzjYRoCPBDuJUmK+063mGDSw+y/p
	IFqWqFeOkizI5tk6f2JX3t/eEfpfq5QAKlvaTmvC95XdSwHV//duFzMgArkfdN
X-Received: by 2002:a05:6122:2508:b0:56a:8e00:5e17 with SMTP id 71dfb90a1353d-56ae75e6818mr2556183e0c.6.1772706275959;
        Thu, 05 Mar 2026 02:24:35 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ab4aad2ebsm17412886e0c.17.2026.03.05.02.24.34
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:24:35 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso393682137.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 02:24:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAPDeND3GrNiu5tu3QiaA4J7SO0CWaKIBpC2seokLRsGgfF48AiwX2UfdmXHsoeOhZp82caNu/UZycxu3lNA==@lists.infradead.org
X-Received: by 2002:a05:6102:3ed5:b0:5f5:320c:4d36 with SMTP id
 ada2fe7eead31-5ffab240223mr2483807137.40.1772706274492; Thu, 05 Mar 2026
 02:24:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772644406.git.geert+renesas@glider.be> <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
 <86v7fa7fdq.wl-maz@kernel.org>
In-Reply-To: <86v7fa7fdq.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 11:24:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
X-Gm-Features: AaiRm50s5nNMGcrhF9lpYz1D5nEmYHga723M3h1qHVdFckZiw7-IBT_v4J6wsk0
Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Antoine Tenart <atenart@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_022437_270014_A4C3E55C 
X-CRM114-Status: GOOD (  29.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Marc,

On Thu, 5 Mar 2026 at 11:13, Marc Zyngier <maz@kernel.org> wrote:
> On Wed, 04 Mar 2026 17:21:58 +0000,
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Replace magic numbers by symbolic DT binding definitions.  This improves
> > readability, and makes it easier to find where the various GIC
> > interrupts types are handled.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -35,6 +35,8 @@
> >  #include <asm/smp_plat.h>
> >  #include <asm/virt.h>
> >
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> >  #include "irq-gic-common.h"
> >
> >  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> > @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> >                       return -EINVAL;
> >
> >               switch (fwspec->param[0]) {
> > -             case 0:                 /* SPI */
> > +             case GIC_SPI:
>
> I'd rather not do that. I use *numeric* values on purpose, because
> that's what the DT *binding* describes, and I have no control over
> what lives in that include file (it gets changed without me being even
> Cc'd).
>
> So I want to stick to the binding, and not to the interpretation of
> it. If you want symbolic values to be used, describe them in the
> binding, have a tool to generate the values from the binding, and use
> that everywhere.

This sounds more like a philosophical debate, so I'd like to defer
to the DT maintainers...

About you not being notified: that can be fixed easily ;-)

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2110,6 +2110,7 @@ F:        arch/arm64/include/asm/arch_gicv3.h
 F:     drivers/irqchip/irq-gic*.[ch]
 F:     include/linux/irqchip/arm-gic*.h
 F:     include/linux/irqchip/arm-vgic-info.h
+F:     include/dt-bindings/interrupt-controller/arm-gic.h

 ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
 M:     Lorenzo Pieralisi <lpieralisi@kernel.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

