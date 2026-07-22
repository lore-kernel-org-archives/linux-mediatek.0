Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D5FC44536
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=; b=ObTVTepsXZvnpA4volc9tHTE3j
	NT+c8lmLDFE9n3kYVQJAvmylHBk6YRiMWFDY1D//CJhlXntCFX3LAiJVyTpskQ3o1DBRSq2i3s/B2
	0T6UzJ6+LbWkJyfGuZgTd7v4qEq1/ut7h9CRPBKMc07ZRH3Z7B0mHHVj2eSTa8MZnUBtubq5HN3kp
	pOGqQVIxsWBcPGmqNU/IPh2mT1MT2ZjJC06mlxrZBNNpI7/N7NzVS2dRzOlgObeYxwOVfRDKloBJp
	+zXisN7s0fS7bdIc0LRBX/v5Z8ycbkx/BQXD9NdammfMK31qHDoegHzQgH4pgV9Q7cUPctLZpeiqF
	LGNDi1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme6X-0000000Cmai-2llP;
	Wed, 22 Jul 2026 21:03:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme6U-0000000CmZx-216U
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 21:03:48 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c1c52d920b8so533566b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 14:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784754224; cv=none;
        d=google.com; s=arc-20260327;
        b=WhAoWGayhV1GtFoqf22WJNPGqUfXcSbiQniTBh9o0JB6V+juysQlehKiAMeptsux38
         6oUYbf/pKW5zzuzMB0hHvGDd552D5+cwLDfAc0AXXXDKCpRTfPIWMPG4H1jbEHh2/NGQ
         OGyLdM3JR4vMVwhZAjLjPk7k08uWqLD3bdR6IrlSPcodLD+K1jyptmLzwi7fXo5i8ITs
         Gxd0e5m4nBcXf17AjUCximAEYGvqDQbF3g3OWQuEGQzAIHiu+KMbvWB7LzFdo+QXxuSh
         +RfKOTAdrwIgEX2o98gbdM2JlncfyOCorZjRFGB5kZKq6jcYznfaUf3vtupbmBUC0s3z
         RUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        fh=8ZgdePB6SqwY10naiB43E2+dX0JqSEqUk6o/iYJ2qKU=;
        b=cBIFCRPAfHeNeXNFCeJYCA6/hZeUvVDQnK9nDYZNE9vdkKfN70xwCQn6zSK9MLmmV1
         5lVTT0K3iq1DnYwdZ6Sxr2qh0eIbiPRMkwLQThV/kj5Wc7amsCzyXfvpkpsym/KErAlj
         k1WH3cYGe4X+MYICtTqvuN5o4kIZRb4Yi0RI9W+DVFZI/MegPop2+aZb1WxGvlZOmOg+
         Or5spcv+n8axIsmKmHakPQ0ozcvGS3EvGLhteD4522dCMUx6iP/PhqgBb4Lt1lurVe9W
         MHxWJcrDlG3UoEIM+m7hPiUA7MyTu2HokhY8RVODEGe/Ahi/qAy+vliGcjv5EYhzrf6C
         2KIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784754224; x=1785359024; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        b=eBWvMy6p2zKtVu897tOS7lTObMGCr2RdrordCXHBQC3Ri7yi/7YT17FNP2It9H7VC9
         SrxukzmINcJGClw2LgerKd31pDs7oUlnRAx2bzoLEGGOVYpjzZZSNGk2kS63lf6i6+aI
         eex8uamwuAUrq9wWu8A2Rk7Kl1x2WZednoE4hORXaaiv82ZROFExrcupCt30dR4nbWgp
         TLK3vdCPjoXLWPpH+rI5kJ0BHVy2ZtP2+gsAqr+L5ELyIaKnnfl0wD2jamkyVn+2+LbA
         /2NQOmh1aNtgeWojqCzTZ5xdvf81zmz43zDR9G60zsYm06ZnKI9gYPhzy8Mgt73FySvl
         /X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754224; x=1785359024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        b=hZ4F8PAH/D+phfmUviC884zaIL3aLS4dRVsaA1Vic+6siZLjENzujBfQ6taWPIdT00
         1yvSs4iLIhy5LODWFf/00EvTZ5a5lsw/ttC87tIq/3qPlXfRTIOcO6xG7UEcF5rxqOzQ
         2BdSF0bOzCaoxu+3jQPApMcyzIo7BlYUVy5/FK7uxy28nMbJWZ6mfmSFKG9MIBCg5eYk
         gT9Acmibblzhm33qk1knbf/X3HMn7+jgdpmI9m+A43pWU8vJ6aQBm6eXe2E8/h9VY842
         ROTot/ztHPbqXZDhRHXEbi3gBUhj9iSEw6OnlxaM2r+dmSu0LeAmtxkRHLax5TSTqDNM
         v/nQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqgik9XiMRu2fOZ3wrK4dI+sZlLDQfGtK2dVKGJnpvJia6H6kEgH83KTldueKNP+tGDbJE4OZ/pNoLuXVuYww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXL/CDXSIiHZQURHc6uLJYA0lyFeeqn+LXc86wBpYfTLadOg67
	zJPGnePkYUjuZKo8xGJ29bc1Mefc69bv7SsC/3vY4XyH1BeFgLDMh5nT07SBJevAqWkpuOnu4Zy
	D5UgLSVWuOXpALYlcy4jjB+Is6XjBCWQ3K5p56Wqz
X-Gm-Gg: AR+sD13uH2Osuo7PwgJbpl67YfF/kZ/KCTnaeBuBtjnQD/VKFPnQB/7mneWGpCPXNMC
	55sF8L1kpzRB+RO4g2fPRE5RDKJTLm9CsZD2Yh6bORvHcccHZ0zhmJ/z0kPEzCuFloVoymMX607
	eHV6wUnTp+x/qLkI0sIXDgG6REHc7+tp8/6Tx7rEefqdX+hFYld2RxJPSGssh5sFMxkSpt+QI3y
	XEdX2tgXdXhBo+6C3zHpQ3BvDqHpabMPZSzdVdu8TuKDIs8zJdZfew6Zu+H7F1H7SvyKF0xPQdW
	liEbD1Mq7+qTjultIOnPW+HjaIV1d/yKMt6izP6cU+eD4SQW39yh0cvB+e0pDDnnym8HM50=
X-Received: by 2002:a17:907:7245:b0:c12:b227:614b with SMTP id
 a640c23a62f3a-c1c507c5992mr22090766b.27.1784754223030; Wed, 22 Jul 2026
 14:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260722172443.534251-1-akkun11.open@gmail.com>
In-Reply-To: <20260722172443.534251-1-akkun11.open@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Jul 2026 14:03:31 -0700
X-Gm-Features: AUfX_mzKunA_ErzQZrqRUgnl5wCMQPxyOcP43n29TIvcYdToB-p2ggVGLa6Vk7o
Message-ID: <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Ard Biesheuvel <ardb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_140346_539278_83CD4D95 
X-CRM114-Status: GOOD (  26.27  )
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

On Wed, Jul 22, 2026 at 10:25=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmai=
l.com> wrote:
>
> When building with CONFIG_THUMB2_KERNEL=3Dy and Clang, secondary CPUs

Specifically, was LLVM=3D1 or CC=3Dclang or something else used?

> fail to come online with "CPU1: failed to come online". The address
> written to the jump register has bit 0 set, causing the secondary CPU
> to start in Thumb mode.

Ah, yeah missing those is going to be a noticeable perf hit!

>
> secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
> expects to be entered in ARM mode in order to switch to Thumb via the
> standard sequence at that label. Starting in Thumb mode causes the CPU
> to execute ARM instructions as Thumb, resulting in an immediate crash.
>
> Clear bit 0 of the entry address so the CPU always starts in ARM mode.

Thanks for the patch. Any idea why this isn't an issue for
GCC+GAS+BFD? Perhaps there's a difference in the LLVM tools that we
need to address?

There's definitely some difference between clang and GAS here.
https://github.com/llvm/llvm-project/issues/211376

I wonder if perhaps a better machine-agnostic assembler-agnostic
assembler-version-agnostic patch would be something like:

```
diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index f22c50d4bd41..687ee7063a73 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -383,6 +383,7 @@ ENDPROC(__create_page_tables)
 ENTRY(secondary_startup_arm)
  THUMB(        badr    r9, 1f          )       @ Kernel is entered in ARM.
  THUMB(        bx      r9              )       @ If this is a Thumb-2 kern=
el,
+ENDPROC(secondary_startup_arm)
  THUMB(        .thumb                  )       @ switch to Thumb now.
  THUMB(1:                      )
 ENTRY(secondary_startup)
@@ -429,7 +430,6 @@ ARM_BE8(eor r4, r4, r5)                     @
without using a temp reg.
                                                @ (return control reg)
        ret     r12
 ENDPROC(secondary_startup)
-ENDPROC(secondary_startup_arm)

 ENTRY(__secondary_switched)
 #if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)

```

Can you perhaps help test/verify that Akari?


>
> Tested on Lenovo YOGA Tablet 10 (Wi-Fi).
>
> Fixes: 0cda07001a94 ("ARM: mediatek: add smp bringup code")
> Assisted-by: DeepSeek:deepseek-v4-pro
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  arch/arm/mach-mediatek/platsmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/pl=
atsmp.c
> index 6b0943d95555..9a7c65fc3ae1 100644
> --- a/arch/arm/mach-mediatek/platsmp.c
> +++ b/arch/arm/mach-mediatek/platsmp.c
> @@ -124,7 +124,7 @@ static void __init __mtk_smp_prepare_cpus(unsigned in=
t max_cpus, int trustzone)
>          * write the address of slave startup address into the system-wid=
e
>          * jump register
>          */
> -       writel_relaxed(__pa_symbol(secondary_startup_arm),
> +       writel_relaxed(__pa_symbol(secondary_startup_arm) & ~1,
>                         mtk_smp_base + mtk_smp_info->jump_reg);
>  }
>
> --
> 2.54.0
>


--=20
Thanks,
~Nick Desaulniers

