Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0218C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842166141D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842166141D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGnTdKMiLHVuShl9CkSqD7pq7jjMirC8QcRRgV2foyE=; b=0r1BjgjyGjE+Yi
	/PDSq0KOBLJ2gsJs8voX7rlEK2r2c/f0W4DAjY7ytwyUVUyWytjZI9B71JA9/UxUpPK4R7pZitvmo
	/GO8ZL0WMtxoYqemodVOG0QpMw4xKgOgGBI//nqe/5jPTCqBNF/9/WJBf/vbKplmJS4uh2BQUjjCe
	NeupgWZxE3M7ord1J23aUspUFjcW30ynBhx7vhJViqfucQAi4DrSdv68AKP/LpzzcGSzthKrAMUdz
	Pere397YJXoAS/OrZHXcJWD4bQJ1pfWrXRbxB9/mf0WBXz0dBxiFWe0NAq6lU0LiPs78bhAqb/JZ2
	nOjGAxt/ZabKLYDQijqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzIwx-0034Q1-J1; Fri, 02 Jul 2021 13:11:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzIws-0034OZ-0l
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 13:11:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 167E3613B1;
 Fri,  2 Jul 2021 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625231473;
 bh=VTOEMFLCdkiosprAyMGyX32cPkmxfgkO4zvLSKjrATU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FrMCSVMH62c/ElTMpje1nVPi0IB9kFdzijtpw/IWTCM8LK6e2a06g17PKQsOVIhU4
 xmLFfpbF4eEbEJbRdTEdvxacBz2d//2/GdiVTDHjBpDreEhC5Y/xuPW6AGIyek+ozQ
 FF4MgLEu33racYiy2TZoXV/acUHG0dFUIi0rwyjh8q1029TNvoHc6emvI1OuwtTi/M
 CEbZ9ErgwsW9aGiW4wSx+XiHF8M4uQFs/X8CL3bAU7mjiHbLufEm1fyPbzvBXFR3Ir
 k9tPHmohsr6M2GGeDpBfBHUxANVAwLnoNl8wUsZrEsvi1HGL5ZLN3f/1DdWrpFTAW2
 gs6sV9d6JVfjQ==
Date: Fri, 2 Jul 2021 16:11:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH] mm/sparse: clarify pgdat_to_phys
Message-ID: <YN8QaoJuDP9Nr744@kernel.org>
References: <20210630092309.17654-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630092309.17654-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_061114_127915_EDE43245 
X-CRM114-Status: GOOD (  19.52  )
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

On Wed, Jun 30, 2021 at 05:23:09PM +0800, Miles Chen wrote:
> clarify pgdat_to_phys() by wrapping pgdat_to_phys
> with CONFIG_NUMA. (the same config as contig_page_data)
> 
> No functional change intended.
> 
> Comment from Mark [1]:
> "
> ... and I reckon it'd be clearer and more robust to define
> pgdat_to_phys() in the same ifdefs as contig_page_data so
> that these, stay in-sync. e.g. have:
> 
> | #ifdef CONFIG_NUMA
> | #define pgdat_to_phys(x)	virt_to_phys(x)
> | #else /* CONFIG_NUMA */
> |
> | extern struct pglist_data contig_page_data;
> | ...
> | #define pgdat_to_phys(x)	__pa_symbol(&contig_page_data)
> |
> | #endif /* CONIFIG_NUMA */
> "
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  mm/sparse.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 7272f7a1449d..62c21ec28e33 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -344,14 +344,15 @@ size_t mem_section_usage_size(void)
>  	return sizeof(struct mem_section_usage) + usemap_size();
>  }
>  
> -static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> -{
> -#ifndef CONFIG_NUMA
> -	return __pa_symbol(pgdat);
> -#else
> -	return __pa(pgdat);
> -#endif
> -}
> +#ifdef CONFIG_NUMA
> +#define pgdat_to_phys(pgdat) __pa(pgdat)
> +#else /* CONFIG_NUMA */
> +/*
> + * When !CONFIG_NUMA, we only expect pgdat == &contig_page_data,
> + * and use __pa_symbol().
> + */
> +#define pgdat_to_phys(pgdat) __pa_symbol(pgdat)
> +#endif /* CONFIG_NUMA */

I'm not sure a macro is better than a static inline.

Maybe we'd want to warn if pgdat passed to pgtat_to_phys() is not
&contig_page_data, e.g something like

static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
{
	if (!IS_ENABLED(CONFIG_NUMA)) {
		if (pgdat == &contig_page_data)
			return __pa_symbol(&contig_page_data);
		else
			pr_warn("Unexpected pglist_data pointer!\n");
	}
	
	return __pa(pgdat);
}
  
>  #ifdef CONFIG_MEMORY_HOTREMOVE
>  static struct mem_section_usage * __init
> -- 
> 2.18.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
