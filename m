Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB211C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 07:11:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC0F60EAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 07:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EC0F60EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OXKnfuLLhxgUKumLjLtu6Zj3EuYuIkfu0uFisGB3Fg=; b=jeHibC10TsgEnfyPoiV+u01AYC
	TkK4nPybZFo/xlvPujE5Y9WEOUJve16H/L2emJOutI69dzdAhAkdsw14iqxSIcdMOpyC7OkzFUHzA
	zrDV6fJGFWr7p5XU255aGnBkMdK/4rn7EN2woK/gqNatLcY295exszl+zaj/SeY2CGMv6v4ooKuay
	qFx9Q4KK2TiXfIOmnYTPkeMzd0FXc0m8CPxl4hOYo4Lq3fJGGlBtAORk1XYBuuyWyLcylnB+t+/g1
	LclgHxIGdjdG910CEs+ird7jnfgQvxm7wowGooXXDws8tjlQcAFKmX5Y/DSID5yXWPWRDTOpJijx4
	DCgKiYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6pKq-003ePJ-UH; Fri, 23 Jul 2021 07:11:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6pKn-003eOH-7x
 for linux-mediatek@lists.infradead.org; Fri, 23 Jul 2021 07:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627024259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQQEn4AJk4jpfjaQyvDLnuQEm5eCkpcI1tfMEOwcZwY=;
 b=fd0RmUZYBKkSC2ppUrIAGtVVT0yWS/FZ2gS5l3S84tfOsDiSTUM0cCiDNgTrN+tumTXZad
 Kcs4nOUTZeGXi9Yp5LhqkXsPBR4aU4IDeO59Zk1Ifd+DuLBQdYxOlcvu4LY6IEFpS2/7rR
 AVdAnFVOg0Ql0irHH18Qor9XDOd2cqo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-C8puy6NmPouJXbKuNAk64w-1; Fri, 23 Jul 2021 03:10:56 -0400
X-MC-Unique: C8puy6NmPouJXbKuNAk64w-1
Received: by mail-wr1-f72.google.com with SMTP id
 e13-20020a5d500d0000b029015313875da0so253901wrt.2
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Jul 2021 00:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yQQEn4AJk4jpfjaQyvDLnuQEm5eCkpcI1tfMEOwcZwY=;
 b=gcDmqUTl8JjI8NWSSzkfAuwgHBg5Pus5wLu/Svsle3c9aC5uQA1gJA17zXO9wky+fi
 XdtWL6xQf7yOdgjz85yTIjDlVj00Fh1QHWeqIxrUs+QtpF+aY+hRMi310252pRGGiV0u
 oHA11qA376L0U4+leCxuBj9gMkPdC9P79/pPx+zwzZEESXk9U3nshpmrhqxNL5JyfmlF
 lhqOgU3gwGx+87KipSkW2LD8JjQXLcTxN5WQiRstrIQLorXxP8yhlDtvhWcKCLBlStix
 9cQ7tHKkWee35vXVYKL8nnxDVOd1obV1zIhuJAf9iW4hZwimTXCeEkeM/nLPLF6D2hJ6
 tq+w==
X-Gm-Message-State: AOAM532Oqgls3I8mQlXZBsK4Xa+hY3iEPIt91+sP9twIKDzqB3K8iK1o
 tMJguBNx6m67OQ9rPr/IhxWl7rHtZQzdCz1ztFN+g001dWInVPz8eBXGV2hZowoCVAM4Pr9iCfm
 bAhOdRCLpw2FS431h4JA24M78RXCpyIcF
X-Received: by 2002:a1c:5419:: with SMTP id i25mr3030824wmb.71.1627024255018; 
 Fri, 23 Jul 2021 00:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWxbBRVGgAi+ozrhBgrntbx1X/RgUw72RP8WBiXPq3KSVreuWRGEjszp3XAGBZRo8PxJt5BQ==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr3030796wmb.71.1627024254780; 
 Fri, 23 Jul 2021 00:10:54 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id 6sm4458632wmi.3.2021.07.23.00.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 00:10:54 -0700 (PDT)
Subject: Re: [RESEND PATCH v2] mm/sparse: clarify pgdat_to_phys
To: Miles Chen <miles.chen@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
References: <20210723070137.23321-1-miles.chen@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a042906d-7d07-d1af-57d2-ab4cbdc53f36@redhat.com>
Date: Fri, 23 Jul 2021 09:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723070137.23321-1-miles.chen@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_001101_420315_62A267DD 
X-CRM114-Status: GOOD (  25.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23.07.21 09:01, Miles Chen wrote:
> Clarify pgdat_to_phys() by testing if
> pgdat == &contig_page_data when CONFIG_NUMA=n.
> 
> contig_page_data is only available when CONFIG_NUMA=n
> so we have to use #ifndef here.
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
> Comment from Mike [2]:
> "
> I'm not sure a macro is better than a static inline.
> 
> Maybe we'd want to warn if pgdat passed to pgtat_to_phys() is not
> &contig_page_data, e.g something like
> 
> static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> {
> 	if (!IS_ENABLED(CONFIG_NUMA)) {
> 		if (pgdat == &contig_page_data)
> 			return __pa_symbol(&contig_page_data);
> 		else
> 			pr_warn("Unexpected pglist_data pointer!\n");
> 	}
> 
> 	return __pa(pgdat);
> }
> "
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20210615131902.GB47121@C02TD0UTHF1T.local/
> [2] https://lore.kernel.org/patchwork/patch/1452903/#1650759
> 
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 
> ---
> 
> Change since v1:
> Thanks for Mike's comment, check if pgdat == &contig_page_data,
> so it is clearer that we only expect contig_page_data when
> CONFIG_NUMA=n.
> ---
>   mm/sparse.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 6326cdf36c4f..f73ff3c124c5 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -348,10 +348,11 @@ size_t mem_section_usage_size(void)
>   static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
>   {
>   #ifndef CONFIG_NUMA
> -	return __pa_symbol(pgdat);
> -#else
> +	if (pgdat == &contig_page_data)
> +		return __pa_symbol(&contig_page_data);
> +	pr_warn("Unexpected pglist_data pointer!\n");

Shouldn't this rather be a VM_BUG_ON()?

Because it looks like something that should barely happen and we might 
not want to perform runtime checks on each and every system?


-- 
Thanks,

David / dhildenb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
