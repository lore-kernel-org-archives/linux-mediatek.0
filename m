Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58507C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foQ1/0HwCNQSpMC2ZhJON6OX1wyhGGFLINaHnphz3mQ=; b=SCD/0EjzUq3FsWmyrs2II+K6jY
	zcCfbiQNyVdiHxQobeqD8o+qnG7Vd3XEJgbNnLzB2nEh6Zbpe/S2/5X65mN6vME1TGkS4KFIG5CsA
	psUO8naOIx1uHMBVv/zcFS1TJRU98msErwfKqT9z9aPJXNdspu+fee7CkykZFFx1hI/qI22/qhyFY
	TzRDgrPQatT/2ccS3ZbtDeFqIkycV8SbnAMg+JEORgCpbZpmpEC0jLO1Do6Ls05+VbC4er6S0K23d
	BN9+HGYUhwMGWI163SC49GlMNuysMs4e/ES2EHUflPmAkg1msv3oREh3aHkdKjO6x4UuPwRE5d1vu
	3TU1+cfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdum-00Gtbp-M3; Thu, 02 Feb 2023 18:02:28 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNduc-00GtYf-Lp; Thu, 02 Feb 2023 18:02:19 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3D4A87DE;
	Thu,  2 Feb 2023 18:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3D4A87DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1675360932; bh=foQ1/0HwCNQSpMC2ZhJON6OX1wyhGGFLINaHnphz3mQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kJbd0F2rWnluPzLgK38TMaqiIycpVlQWVPBxv1Ywm6Iy3i8ABcGXnwWj/VtHUyGXu
	 TJJDRYuZiiaPKwc7O/ldvE1/aerbMkVu42adh0LD4ub4MR18FloBX9uSDPEm/6+Agm
	 4CWfaYGafUqqIdFHDLbr6eoeEzoJgvPmzb0HDwH9BL2cT0Nw0KuPLf9keCwHw5k/SH
	 DDj2GgsZ1o+/r9V1mFT7GBBjv2K67z03FoEz1UY7/izsPxHSjeVTQ0hzLNMGWk0Emq
	 c1fXgOxS4gRZZHoFkTBh9Yd31cXHfl4F1fb8qR74Xrl7qTrj5amsNpULEy135z99CY
	 y7R01tI/HjX/Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Cc: chinwen.chang@mediatek.com, andrew.yang@mediatek.com, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/doc: Replace isolate_lru_page with folio_isolate_lru
In-Reply-To: <20230131062853.28449-1-Kuan-Ying.Lee@mediatek.com>
References: <20230131062853.28449-1-Kuan-Ying.Lee@mediatek.com>
Date: Thu, 02 Feb 2023 11:02:11 -0700
Message-ID: <87a61wvtcs.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_100218_737270_8C6E3303 
X-CRM114-Status: GOOD (  22.35  )
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

Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> writes:

> Since we introduce folio, replace isolate_lru_page() with
> folio_isolate_lru().
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
>  Documentation/mm/page_migration.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This seems like a good patch to copy to linux-mm - done now.

The patch perhaps is a closer match to what's in linux-next, but it
seems that, if we're going to update this document, we should reflect
the use folios throughout?

Thanks,

jon

> diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
> index 11493bad7112..1f8cc175d770 100644
> --- a/Documentation/mm/page_migration.rst
> +++ b/Documentation/mm/page_migration.rst
> @@ -69,8 +69,8 @@ In kernel use of migrate_pages()
>  
>     Lists of pages to be migrated are generated by scanning over
>     pages and moving them into lists. This is done by
> -   calling isolate_lru_page().
> -   Calling isolate_lru_page() increases the references to the page
> +   calling folio_isolate_lru().
> +   Calling folio_isolate_lru() increases the references to the page
>     so that it cannot vanish while the page migration occurs.
>     It also prevents the swapper or other scans from encountering
>     the page.
> @@ -89,7 +89,7 @@ How migrate_pages() works
>  
>  migrate_pages() does several passes over its list of pages. A page is moved
>  if all references to a page are removable at the time. The page has
> -already been removed from the LRU via isolate_lru_page() and the refcount
> +already been removed from the LRU via folio_isolate_lru() and the refcount
>  is increased so that the page cannot be freed while page migration occurs.
>  
>  Steps:
> -- 
> 2.18.0

