Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB7FC432BE
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 07:47:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A4EA60E96
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 07:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A4EA60E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0SJhDdbbNR39xTrva7Kmri55b0inREEbWnKNnmaMSo=; b=ggm0okLiZSCvgB
	UAGbQ1KoWLdBdPI+pLH0ur46CAX1zAZBSO6dMVQHmdIG2J2wh/99OWtjPF763C8/FX1YY+4xpKrB1
	i2afHPT1uWl712QWG/4mj2tIFmqV13dwkdVDuiETfsLo8XZJvyuktmZRM8eUgp8421/1jz3+5AFAs
	VM6mGzOiMWq9KPazAddPDHQgbXOsxwfxYjr/b5/5U/QBEKI09CbPWgkZQOUlck3fcwBk3FcGeZoLC
	an+ciFSt+ItscwFB9MpkHcN6GecDV+3dPFvWN46+25+zQqJXUqthsFXwR97TXT5ZZi4jV/9F8UaNZ
	BLAlgkHsBJGROD2n8gJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7CNq-006qZo-5H; Sat, 24 Jul 2021 07:47:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7CNn-006qZF-AF
 for linux-mediatek@lists.infradead.org; Sat, 24 Jul 2021 07:47:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D02E160E93;
 Sat, 24 Jul 2021 07:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627112859;
 bh=83jYqHd7Z3wZAPt5SDx4EmmdLiCWHkDxcjRrWNIZ0kE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dV+JwbWV9suCiexF3CXkLJt4ap8IBg5xYeWS7BVIDBXUtK33/2VPwz9pSvQdHO1A3
 yIrHu3+n1ufzNNfG1igKzqVT1hcEH/iMlQUvkRPrv1HO9FmO4HHM/SaoH5vdLO75Xt
 82aiN+l4G+1Z9Kz8UTGFmXYa8xad5zeGCLzUMdP9E5ezcoOVBqOb4kWVXT59yaFEhG
 i4D04rUrLcpJ7HtUr13dBD0kkYLRCN0WmdAo3q9UC98qSWlbPf0QIr3JtqkWtNqMtA
 QZpyiVT0NIL/r+deATsBXLKcs9QG7X31C5TzhlzS1KQisaBB6aZjXeWW9cy28+fjEQ
 5+UMcZFUNjrJQ==
Date: Sat, 24 Jul 2021 10:47:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH v3] mm/sparse: clarify pgdat_to_phys
Message-ID: <YPvFlagk2Z/4ceS1@kernel.org>
References: <20210723123342.26406-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723123342.26406-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_004739_421231_E009C181 
X-CRM114-Status: GOOD (  19.07  )
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

On Fri, Jul 23, 2021 at 08:33:42PM +0800, Miles Chen wrote:
> Clarify pgdat_to_phys() by testing if
> pgdat == &contig_page_data when CONFIG_NUMA=n.
> 
> We only expect contig_page_data in such case, so we
> use &contig_page_data directly instead of pgdat.
> 
> No functional change intended when CONFIG_BUG_VM=n.
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
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> 
> --
> 
> Change since v1:
> Thanks for Mike's comment, check if pgdat == &contig_page_data,
> so it is clearer that we only expect contig_page_data when
> CONFIG_NUMA=n.
> 
> Change since v2:
> use VM_BUG_ON() to avoid runtime checking when CONFIG_BUG_VM=n
> ---
>  mm/sparse.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 6326cdf36c4f..d13d831f88a5 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -348,7 +348,8 @@ size_t mem_section_usage_size(void)
>  static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
>  {
>  #ifndef CONFIG_NUMA
> -	return __pa_symbol(pgdat);
> +	VM_BUG_ON(pgdat != &contig_page_data);
> +	return __pa_symbol(&contig_page_data);
>  #else
>  	return __pa(pgdat);
>  #endif
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
