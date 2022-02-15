Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B1AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlMAa+Ue6VtuDg7Oc6bvkdGJS5kR5WSLGPG1S5XNdXQ=; b=LjvS8Zt4Y6c9Je
	XPbFnQrDP9TVAmm79rz3O+KMBBglvspo3dvTpH9Ho2XdVRqnY4ZDgVWEIqDXgbVVGkaAkylFG4RZv
	wwBfaXIXb8MCxGS7EaJNMFwF52GtjqMATNlOXHEI5XdLjGK9X89n96B4VOUW3q7U/pk22pCgRAlto
	kmxLkLd0FeiLmvhtZIQ30RGuZWaKb7+xpOT/MhPK6MoTYtGlqSfPkxRF8FXTGjAX6WodyMkyrMfMI
	W2IKw+J6WCkNQW6blL6eS0oO+QbKDJRnAJxpZW1aERYfZNlAkaXxUG/YDS2pjMcv4mmJpqbgv18Vj
	m+/T+LL2Y653Q7u/OEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK10t-003jEo-Uv; Tue, 15 Feb 2022 16:49:15 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK10V-003j79-0y; Tue, 15 Feb 2022 16:48:53 +0000
Received: by mail-il1-x130.google.com with SMTP id e11so14336690ils.3;
 Tue, 15 Feb 2022 08:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xVNa8VSn91ahuDas6Q5c0c7M86VbUIOrBrr7Lsj6DYI=;
 b=PJDVFdbVGvtaA9kJk1qSkNbj2TZJQK5Mesv4NIHxeYbJjjsrvieJhKSRKVXt6TY5qE
 liHaAXttXZkNvNs1PuyLiH5sYg3h7nVrZTs/mbhPPbQIEu98CvEiHYU4MoLF7eZlXo02
 OOV2CBDh3w0126BeK/5eIbxlEmvYr4Xs8bfZaVeS9IX/k9xlrXHL/i7XSE6lOB8CsFou
 f+HwKwGMZLBvxkr1l+9WBL6JIebLLsTnOIXNVGoFQbxPgu3BI93LHZyoT61o3C4xQj+g
 S4onaRA3VmSZqMXHYDDXcsGNiV/OW7jzV3v/escGendjwkt2o8Ko874lbpHrzRnToXht
 Mytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVNa8VSn91ahuDas6Q5c0c7M86VbUIOrBrr7Lsj6DYI=;
 b=eeZu0szPndSsyK+cC0tsa8H+h/TyHvCvkdN5VG15rRTPk3K/JEfEjHhkF1B/M4gE1i
 Mhv37kqCW3yD8aByHkX5rkAlRdryF7lXU3Ek7CFwbpPt5sABADQ6krlmw0KiMeEgbGdR
 YbOkg+uwZV3r7rS29DklDE/IvYiPyA6knNsMm4Xq5HVTghmY54pDnUjDIQ4dOPxsGAYV
 C2qxRQCVt0K1XCUETPFjuwOcHnT5nCVAxpQsywu1HdsnR1t/SQK+ahhZ9EtQVUx8hCTF
 AMiM2sBhxiLLHAq7dmo0VFSU/ABy2kJwYRl6xblFwAAzl7kRJTjk/98/Q7Okk4mbwXQn
 Qa/w==
X-Gm-Message-State: AOAM532Bhg27NrjblMGRnGGJQ6vgzUuwhGUtEF258I2On/U1wyFNU/Q+
 5brch7zscAen0Srfl+jGxnF6DkrQsz2FmWIKvgQ=
X-Google-Smtp-Source: ABdhPJzymnqvOR8CKBiej0duKzd4TqeQtGYPKBaMhp/OB51xLEndFfIOeke7AoujuH13SWODXChgu1WA4elZudT6SiM=
X-Received: by 2002:a05:6e02:1887:: with SMTP id
 o7mr3086428ilu.169.1644943729176; 
 Tue, 15 Feb 2022 08:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20220211001345.3429572-1-gch981213@gmail.com>
In-Reply-To: <20220211001345.3429572-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 16 Feb 2022 00:48:38 +0800
Message-ID: <CAJsYDVLyasPAmgxguqLznORC2SihKHRLrFFw5nHbepJvu0va3Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
To: linux-mips@vger.kernel.org
Cc: Rui Salvaterra <rsalvaterra@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_084851_098308_D89F2ABA 
X-CRM114-Status: GOOD (  20.71  )
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

 Hi!

On Fri, Feb 11, 2022 at 8:14 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> It's reported that current memory detection code occasionally detects
> larger memory under some bootloaders.
> Current memory detection code tests whether address space wraps around
> on KSEG0, which is unreliable because it's cached.
>
> Rewrite memory size detection to perform the same test on KSEG1 instead.
> While at it, this patch also does the following two things:
> 1. use a fixed pattern instead of a random function pointer as the magic
>    value.
> 2. add an additional memory write and a second comparison as part of the
>    test to prevent possible smaller memory detection result due to
>    leftover values in memory.
>
> Fixes: 139c949f7f0a MIPS: ("ralink: mt7621: add memory detection support")

I misplaced a bracket in this Fixes tag.

> Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index d6efffd4dd20..12c8808e0dea 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -22,7 +22,9 @@
>
>  #include "common.h"
>
> -static void *detect_magic __initdata = detect_memory_region;
> +#define MT7621_MEM_TEST_PATTERN         0xaa5555aa
> +
> +static u32 detect_magic __initdata;
>
>  int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
>  {
> @@ -58,24 +60,32 @@ phys_addr_t mips_cpc_default_phys_base(void)
>         panic("Cannot detect cpc address");
>  }
>
> +static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
> +{
> +       void *dm = (void *)KSEG1ADDR(&detect_magic);
> +
> +       if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
> +               return true;
> +       __raw_writel(MT7621_MEM_TEST_PATTERN, dm);
> +       if (__raw_readl(dm) != __raw_readl(dm + size))
> +               return false;
> +       __raw_writel(!MT7621_MEM_TEST_PATTERN, dm);

Someone on Github notified me that this second test pattern is incorrect.
I actually mean to use ~MT7621_MEM_TEST_PATTERN here.

I'll send a v2 fixing both issues.

--
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
