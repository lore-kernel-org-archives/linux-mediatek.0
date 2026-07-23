Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275FDC531CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=; b=k9ckJOuCMGsNMuDk6YqDWqFm3n
	hl7ylPBbYc1NLfsZnyXSeiUSwllOiJNBLqTAP+Ch+zNib8wkQ7VvWPCogWdKiGwTfND4DneY2d2Cy
	TdfPrtpz2THIgqjX9obUDIUgrG+p30cctn0KJW7MSnfrBx0ODhFzn/JDhKnCO9FimiQlTcIwHaz3p
	PIRu0mPgEv3yoxkSIcr20yhIcvXH1QHumC9Q/YMMgUSrBxadx6tQOZG67g2Dz7BBsOV0l3aOL4H9Q
	jvTyG/yNRx2LhgPNmaF1PQTbwdNREfjuDAJc6rCdv2yYxDpbNsMccyzjQ2iNiHI/lvC78EyBj6kcV
	DQKQMQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpX0-0000000DpN0-3O8u;
	Thu, 23 Jul 2026 09:15:54 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpWy-0000000DpM7-2SDH
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 09:15:53 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-848595b338cso431209b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784798152; x=1785402952; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=;
        b=Cy/npQTaRfpvvBm2KGqEnT1HofnJAtTvyz1364nKCvrNc7PdABzlus4ZcuS9b8MnwW
         Z4J9XKN06PGRklt1IhnteEFCgUdVB2qzY/OJQGhbJYGOu2/sBQEyxLhbA6WwSY85M/p/
         jqEjJoDMvXI0XjlydVbhUsqNc6rCetKvUi2XR3CnQBboux0tgJW0El1S3dco7vfTniA2
         GZHBOMHrBrv5tY9MAufPFsar7N5jB7pRBWIgr80kl0I8bY78uns/KVYAOEkeqQPjzFkF
         ti1YuUg2G5FcCgGzghmPfVMXL/KNxQ6CoeFKKJmedCs/dwRQg1XtBdVK7EuVSMfSM5Fi
         AyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798152; x=1785402952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=;
        b=c6Y6WZ5W/o4OyJE3d86M72dIvBUdQZz7QUjRLQ576HDo5kV7HqI7mBFCkUevN4+smG
         Vh7gpxCuK3PNX9edv58Sp4DOzJqq8M6v7aCKR+Mgyj4lDY7O8RogjVrJkOu3g6PGCCAc
         UQY1BHOU6VZRQf2DXKgrWpkyir4ben8UPdQSprrEA3dWo7UQg4rVGWaSWJqrhJAQqXUI
         ludwolfAaw3Fo21NFEzJzjDsfmd2+fxmCtS9v6D1PvTbqL7buOZAc7BwTRNZqTjyVxvt
         BJxO2dkfoSRZWwfoMQ2BV+MZHOnQ3PhP1UZ+5aqozLb6Kz/+13f/RllLzugWaY+wEBXe
         nkOg==
X-Forwarded-Encrypted: i=1; AHgh+RqoDOj9b23jjWHdp3C0U6vnVEYonVWGjTzCRh3ZysqnPd0pg7tWctway8JoNedB03jAAfiFEj+gX+Kh3xOjQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz85KEDtxn2mSOcTTERiwmR/GMZo0Wng4pVQUmQDnsN/qQP0Rq/
	IOalpThWz3hqErVt3eUOQzcqWARr0kxqjbP1MaL2KHJ3a1AzfPT2U3pA
X-Gm-Gg: AR+sD13YK35hPBAb21LTPi7vSrrAVjdbNlZIJbkoYs1UgNx01Sl634p+uP7oTbHKQ7I
	keqdbtr6ojcAoPcG34kbBKO2nTjTr6U34KtoClaLKc6ej5MjzmDcA8SBn/fANmJ7HYSNA+UA2ej
	onxZYTpwHmIgvgoGNX/Vwh79+GmdytJg7BgRZ/WVGLMIq5WutZPXy8453ibfMnAC4r3JHXjADnL
	G0jo2q5xSXT+Lo7CEd3XEwvQk1R1PVftUZMurvNA+Eo4gROYP1777SsIz1WW11zuTaQqoHyeKaP
	9vqaq5Vq7SdhLyoqZaGIIJiCDTkKZj3ctOlG8GfhtUga8C4fRZ9OhL1JWeWObPo9hAepFbJWNKm
	JfNzjQLtt2frweZGd3qZqzxU9/xTKFHhz5Jg2jlP8b/qx2yRDric96En+B5syrCSnnmO4xdQHEf
	1Z+Cn4oX6hFMcVbE12P5fUJJHVMiUfgQyxc7HWzT55WxMy
X-Received: by 2002:a05:6a00:3c94:b0:845:4126:222b with SMTP id d2e1a72fcca58-84e2b8bf81fmr2868281b3a.28.1784798151685;
        Thu, 23 Jul 2026 02:15:51 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17600a72sm2738538b3a.58.2026.07.23.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:15:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 18:15:47 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
	Ard Biesheuvel <ardb@google.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
Message-ID: <amHYO1c-5vzqSekt@buffalo-ssd>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_021552_653621_8FF79C47 
X-CRM114-Status: GOOD (  24.12  )
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

Hi Nick,

On Wed, Jul 22, 2026 at 02:03:31PM -0700, Nick Desaulniers wrote:
> On Wed, Jul 22, 2026 at 10:25 AM Akari Tsuyukusa <akkun11.open@gmail.com> wrote:
> >
> > When building with CONFIG_THUMB2_KERNEL=y and Clang, secondary CPUs
> 
> Specifically, was LLVM=1 or CC=clang or something else used?

I used ARCH=arm LLVM=1
config is here:
https://github.com/TeamYogaBlade2/linux/blob/d7633f01ec25209fc6cdde012128b19ac336ab18/arch/arm/configs/lenovo-blade_defconfig

> > secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
> > expects to be entered in ARM mode in order to switch to Thumb via the
> > standard sequence at that label. Starting in Thumb mode causes the CPU
> > to execute ARM instructions as Thumb, resulting in an immediate crash.
> >
> > Clear bit 0 of the entry address so the CPU always starts in ARM mode.
> 
> Thanks for the patch. Any idea why this isn't an issue for
> GCC+GAS+BFD? Perhaps there's a difference in the LLVM tools that we
> need to address?
> 
> There's definitely some difference between clang and GAS here.
> https://github.com/llvm/llvm-project/issues/211376
> 
> I wonder if perhaps a better machine-agnostic assembler-agnostic
> assembler-version-agnostic patch would be something like:
> 
> ```
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index f22c50d4bd41..687ee7063a73 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -383,6 +383,7 @@ ENDPROC(__create_page_tables)
>  ENTRY(secondary_startup_arm)
>   THUMB(        badr    r9, 1f          )       @ Kernel is entered in ARM.
>   THUMB(        bx      r9              )       @ If this is a Thumb-2 kernel,
> +ENDPROC(secondary_startup_arm)
>   THUMB(        .thumb                  )       @ switch to Thumb now.
>   THUMB(1:                      )
>  ENTRY(secondary_startup)
> @@ -429,7 +430,6 @@ ARM_BE8(eor r4, r4, r5)                     @
> without using a temp reg.
>                                                 @ (return control reg)
>         ret     r12
>  ENDPROC(secondary_startup)
> -ENDPROC(secondary_startup_arm)
> 
>  ENTRY(__secondary_switched)
>  #if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)
> 
> ```
> 
> Can you perhaps help test/verify that Akari?

I tested your suggested patch and confirmed that it fixes the issue.

Device: Lenovo YOGA Tablet 10 (Wi-Fi) (MT8125)
Toolchain: Clang/LLVM 22.1.8-2 (cachyos-v3)

Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Can you send your fix as PATCH?
I think your approach is better than mine.

Best Regards,
Akari

