Return-Path: <SRS0=c1Td=72=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D961C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2020 08:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FBC207FF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2020 08:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FrAgWWH+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgrzEr0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FBC207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQXrpzElfpjwly88m92OY//0+vibURos/T0eMzzt5YQ=; b=FrAgWWH+qDYyRa
	dEftop2b3EuPm7Zkyy9mjdXsgSpduxn9xfW69+yJkJm5pvsMqRdtiqB8BZZ7697WDEE9M7lkIImHU
	9dyXR/H04FAUJ+rsSZQpYMom9nwuphTMpSvR2NMWWd+hM8S9FMhrTVdLjLjJemwVqRIgms4p9uKnN
	HriK3RbdkRgyEzOvC+ongnSdHRaz4B4wFIOFRRygTsUOXByT7VutKxvvAzlPNzA7/gbGyI44wsH5A
	h9Mu4cj9/bULfPQA+MY1HL0nNbQkdfkOFrKLV7S/n3eMEQGzpi+UVPs2EcP06JeHYYv8IVxi67Vus
	TmMMmrMK9xDJ+z7AsbAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jk1lI-0002dJ-Jb; Sat, 13 Jun 2020 08:43:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jk1l9-0002Uo-1X; Sat, 13 Jun 2020 08:43:28 +0000
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C8E920882;
 Sat, 13 Jun 2020 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592037805;
 bh=SyRgaHUOm/RP8zZ90+MyAGaRN4cSsWrzzNGHyfuBnCk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BgrzEr0T3JoHmKZPf5JHHJjvygSMZGF5NKn+13GG7QHtIS/IBZ7akYkLuc0TbufY0
 IdI3tEBicGVpmTrhCjhPNSbLdEFx6l03HXU1AMn8ObSGPs2e5kB+GmV2Rt/rdkNQLA
 gC00pV5XYzyrAQW5/CPir6q3bWaJ154iM+O+UJ14=
Received: by mail-lj1-f178.google.com with SMTP id a9so13698113ljn.6;
 Sat, 13 Jun 2020 01:43:25 -0700 (PDT)
X-Gm-Message-State: AOAM53155bsBvM23yD0wMag+BbKOIo0jySC9c18JfJw90bV8ShhxyYBk
 GnDWuVID5hobQbQfZSQ5ZpmL9uFzWWoNpbfxMFg=
X-Google-Smtp-Source: ABdhPJwZ1ylOrBsd6XVZmYSQ3sLMGYqoTKujz2SwyQaUfONmAEP2kaw8s4sWs89ZwT6ZjZ3AWnilqqgnG/azc96C0bc=
X-Received: by 2002:a2e:2a42:: with SMTP id q63mr9000358ljq.265.1592037803689; 
 Sat, 13 Jun 2020 01:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200611095804.22026-1-f.suligoi@asem.it>
In-Reply-To: <20200611095804.22026-1-f.suligoi@asem.it>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 13 Jun 2020 16:43:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTojGRnshstFwqu4xM_txeBOY=uFiWPTpXZPWv2uS6QqQ@mail.gmail.com>
Message-ID: <CAJF2gTTojGRnshstFwqu4xM_txeBOY=uFiWPTpXZPWv2uS6QqQ@mail.gmail.com>
Subject: Re: [PATCH] doc: devicetree: bindings: fix spelling mistake
To: Flavio Suligoi <f.suligoi@asem.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200613_014327_130240_777AC30D 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Acked-by: Guo Ren <guoren@kernel.org>

On Thu, Jun 11, 2020 at 5:58 PM Flavio Suligoi <f.suligoi@asem.it> wrote:
>
> Fix typo: "triger" --> "trigger"
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt | 2 +-
>  .../devicetree/bindings/interrupt-controller/csky,mpintc.txt    | 2 +-
>  Documentation/devicetree/bindings/timer/csky,mptimer.txt        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
> index ba455589f869..e1c49b660d3a 100644
> --- a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
> @@ -12,7 +12,7 @@ Required properties for the top level node:
>     Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
>  - #interrupt-cells : Specifies the number of cells needed to encode an
>     interrupt. Should be 2. The first cell defines the interrupt number,
> -   the second encodes the triger flags encoded as described in
> +   the second encodes the trigger flags encoded as described in
>     Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>  - compatible:
>    - "mediatek,mt7621-gpio" for Mediatek controllers
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> index e13405355166..e6bbcae4d07f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> @@ -10,7 +10,7 @@ Interrupt number definition:
>   16-31  : private  irq, and we use 16 as the co-processor timer.
>   31-1024: common irq for soc ip.
>
> -Interrupt triger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
> +Interrupt trigger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
>   IRQ_TYPE_LEVEL_HIGH (default)
>   IRQ_TYPE_LEVEL_LOW
>   IRQ_TYPE_EDGE_RISING
> diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
> index 15cfec08fbb8..f5c7e99cf52b 100644
> --- a/Documentation/devicetree/bindings/timer/csky,mptimer.txt
> +++ b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
> @@ -8,7 +8,7 @@ regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
>   - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
>   - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
>   - PTIM_CCVR "cr<3, 14>" Current counter value reg.
> - - PTIM_LVR  "cr<6, 14>" Window value reg to triger next event.
> + - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
>
>  ==============================
>  timer node bindings definition
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
