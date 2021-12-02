Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adABDkxRtbXVT1fkeQJN09b+i0pCmrRIKmEj9rXRtaI=; b=olV9jEOVLxrK5k
	N4U7rSEHlTq83hvvpNWrfWsWsg58TwkqrMjmE2bowgvXkE+4pRFM3fFU515jtryMtPBCMkQh+3UO6
	Dqw9I+Q+gznFRqqXEKGr0j7h13qDK6XpE7NBjRawmkv1QhxEmRKEZ2xRng4ygxeYNQXsqEG3vqv06
	PQohaSs7R+9oIibM1pcpKs0QObybq2Hg7IXeSspGsvjSdBBuiIzcfQwdwfezgJspcc6VerZZy+SUA
	/LhD3z6iTYrNZnG8RamoZpyQzIlTslFdsIKYoYB5dkuae+uieSb3QipOGE8IcoLpSCee3STxkdByq
	j+4T4iMzI9AEZLvvSlRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msizb-00Bktc-Mz; Thu, 02 Dec 2021 10:07:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msizN-00Bkpx-A3; Thu, 02 Dec 2021 10:06:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77CDF142F;
 Thu,  2 Dec 2021 02:06:51 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.65.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A503D3F7D7;
 Thu,  2 Dec 2021 02:06:49 -0800 (PST)
Date: Thu, 2 Dec 2021 10:06:47 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com,
 james.hsu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] arm64: update PAC description for kernel
Message-ID: <Yaiat4ee0igTZDB5@FVFF77S0Q05N>
References: <20211201034014.20048-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201034014.20048-1-Kuan-Ying.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_020653_442945_12C08269 
X-CRM114-Status: GOOD (  21.87  )
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

On Wed, Dec 01, 2021 at 11:40:10AM +0800, Kuan-Ying Lee wrote:
> Remove the paragraph which has nothing to do with the kernel and
> add PAC description related to kernel.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

This looks good to me.

Catalin/Will, did you want to pick this, or do you want Jonathan to do so?

Mark.

> ---
> v1 -> v2:
>   - Remove compiler option description
>   - Add PAC description for kernel
> 
>  Documentation/arm64/pointer-authentication.rst | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/arm64/pointer-authentication.rst b/Documentation/arm64/pointer-authentication.rst
> index f127666ea3a8..e5dad2e40aa8 100644
> --- a/Documentation/arm64/pointer-authentication.rst
> +++ b/Documentation/arm64/pointer-authentication.rst
> @@ -53,11 +53,10 @@ The number of bits that the PAC occupies in a pointer is 55 minus the
>  virtual address size configured by the kernel. For example, with a
>  virtual address size of 48, the PAC is 7 bits wide.
>  
> -Recent versions of GCC can compile code with APIAKey-based return
> -address protection when passed the -msign-return-address option. This
> -uses instructions in the HINT space (unless -march=armv8.3-a or higher
> -is also passed), and such code can run on systems without the pointer
> -authentication extension.
> +When ARM64_PTR_AUTH_KERNEL is selected, the kernel will be compiled
> +with HINT space pointer authentication instructions protecting
> +function returns. Kernels built with this option will work on hardware
> +with or without pointer authentication support.
>  
>  In addition to exec(), keys can also be reinitialized to random values
>  using the PR_PAC_RESET_KEYS prctl. A bitmask of PR_PAC_APIAKEY,
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
