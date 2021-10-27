Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E6FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:46:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BD3060EBD
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BD3060EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUwlzlghj5qoZGKI1l76//YJ7hVJptPST8rqbhhK2nI=; b=z5viZv1B5YhdGj
	IhCjfWbMGtfFxqQRtT9PJCooxikdJvdFqWrJcyAXQwiiOg9kcn8SQhuAt7K1PEk6hH9jmBTOAVctZ
	L+NQz6MnRcqcbN3DlbX1KoCcVoa+FR3kfB8i4onFIfUV3TqBF5yodMkdtXcEsRve/aZLSFJtrELNP
	Akd5xA1eAtU3dGQo4dplGm6TIzG30HbkmCoLxB/K+iWgiFzq2PQg1W+YXYXBiMp4o+0Pr+GgeucEJ
	3focbLQK7OBBSgxA9BPEursqnW/Ep0NIEbjcnFn69GXSMux2fukoNeRiTTF7ZoB//rk4OfykEyB0P
	C3q0pDHNvuXG7/DGb9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfhNZ-004lJn-RT; Wed, 27 Oct 2021 11:46:01 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfhNN-004lI3-5O; Wed, 27 Oct 2021 11:45:50 +0000
Received: by mail-ua1-x933.google.com with SMTP id o26so4344447uab.5;
 Wed, 27 Oct 2021 04:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uQ6LftHs89BQpJKHjqVHxlnnH+4o6qbz+LFIxq6yG6E=;
 b=ogUDxO10xvloKPC+Hf85j94Qvm8ogBBD8/yv+VRUY97lCpB7EzHnFE+dcSM5TyFbm5
 gBWTouwmM401vrqLC3opOT3tpprKbV+GGSckO77pq41779sZCYpDvvxN/8xisVErcpUe
 3C0b/WCr5GfvddDU8yxq9d1nMfndDwrZ8OTK3ykFRik3WUrrr54+j77lY5Xn4V5JArlZ
 N8vwllzP4SjDc4DC/h1faJDScDug8sVAFRK/c4dfBGtrC15eCQJz6595orcEFIlYjPIX
 2GZeg2s5YfOdQo8urEwl5bKFJ8TYdFIkJFGgabGhsENGZPgxqKXnDlB45uQXb8PuOEmY
 EHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uQ6LftHs89BQpJKHjqVHxlnnH+4o6qbz+LFIxq6yG6E=;
 b=uPNK7MJAamEHc3OrVcgR/Fju9FxnBII2CTCWOy63m3w3EKsxs93e8eqj6xLgCYGvna
 avLzoQXi+IMCvvzlD3GedTjF8YXjTYMpg9Kyk50RowBZQTj3nO2I1/8t4v+YHtjDWK79
 MeSwbxYP6OIaA2UJSa0GNV4eOJuh/V8DIibcc+KOXPR2m8/xVOdsMLvd4wnu3kSzf2G1
 rB2OE4OYdGYYluK4M7yJiTckEtJk9bRBmfLLrWR0egBqhTzQ2KBxJPFUs61bg6Q0+OMR
 tsz4Tn3s7cfVmsVeL8q4uvyFXAZq+U8iW9E7L6i4SAW2SFn+hVtlJpaZWjQzokBXOHn4
 4nzw==
X-Gm-Message-State: AOAM533npvkw0nQvA5XB5ZLQ7OlSLsjPMQYEWqqPKtJNPXMaIqLxaW5b
 TMnCBNtt8NRXDtaaGY9Oc5ctAZFyAML4aw7UiUA=
X-Google-Smtp-Source: ABdhPJz8JZLMiE3Wa18RA9pq8ebQfYTD7R+/tz/wvKkGhoLOLkXcVBwDI35Jn6X+cOkDX47JtQW57uxDGsRhExn06wY=
X-Received: by 2002:a67:ec57:: with SMTP id z23mr20876881vso.55.1635335147100; 
 Wed, 27 Oct 2021 04:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635333327.git.siyanteng@loongson.cn>
 <abead7ae64e1a0cc96a09647a5facf30d03381aa.1635333327.git.siyanteng@loongson.cn>
In-Reply-To: <abead7ae64e1a0cc96a09647a5facf30d03381aa.1635333327.git.siyanteng@loongson.cn>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 27 Oct 2021 13:45:35 +0200
Message-ID: <CAMhs-H8m0Un+njhw0nZKUrxzMxqfpj8YwGb==7GAoV=Kq-ey=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: mt7621: Export mips_cm/cpc/gcr_* to modules
To: Yanteng Si <siyanteng01@gmail.com>
Cc: Yanteng Si <siyanteng@loongson.cn>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Rob Herring <robh@kernel.org>, kw@linux.com,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci <linux-pci@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 chenhuacai@kernel.org, sterlingteng@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_044549_233973_B510767C 
X-CRM114-Status: GOOD (  16.91  )
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

Hi,

On Wed, Oct 27, 2021 at 1:32 PM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> modpost complains once these drivers become modules.
>
> ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
>
> Let's just export them.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/kernel/mips-cm.c  | 5 +++++
>  arch/mips/kernel/mips-cpc.c | 1 +
>  2 files changed, 6 insertions(+)

This PATCH has the prefix "PCI: mt7621: " but the changes here are all
mips kernel things. So I guess it is better to have "MIPS: cm/cpc:
export some missing symbols to be able to use them from driver code"
or something similar. I am not the best with words :).

>
> diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
> index 90f1c3df1f0e..b07f20323132 100644
> --- a/arch/mips/kernel/mips-cm.c
> +++ b/arch/mips/kernel/mips-cm.c
> @@ -12,8 +12,11 @@
>  #include <asm/mipsregs.h>
>
>  void __iomem *mips_gcr_base;
> +EXPORT_SYMBOL(mips_gcr_base);

EXPORT_SYMBOL_GPL?

> +
>  void __iomem *mips_cm_l2sync_base;
>  int mips_cm_is64;
> +EXPORT_SYMBOL(mips_cm_is64);
>
>  static char *cm2_tr[8] = {
>         "mem",  "gcr",  "gic",  "mmio",
> @@ -353,6 +356,7 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
>          */
>         mb();
>  }
> +EXPORT_SYMBOL(mips_cm_lock_other);

ditto.

>
>  void mips_cm_unlock_other(void)
>  {
> @@ -369,6 +373,7 @@ void mips_cm_unlock_other(void)
>
>         preempt_enable();
>  }
> +EXPORT_SYMBOL(mips_cm_unlock_other);

ditto.

>
>  void mips_cm_error_report(void)
>  {
> diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
> index 8d2535123f11..dfd3d58fd412 100644
> --- a/arch/mips/kernel/mips-cpc.c
> +++ b/arch/mips/kernel/mips-cpc.c
> @@ -13,6 +13,7 @@
>  #include <asm/mips-cps.h>
>
>  void __iomem *mips_cpc_base;
> +EXPORT_SYMBOL(mips_cpc_base);

ditto.

>
>  static DEFINE_PER_CPU_ALIGNED(spinlock_t, cpc_core_lock);
>
> --
> 2.27.0
>

Thanks,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
