Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A572AC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 10:34:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04EF223741
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 10:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04EF223741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rs51bhSqaY3FgxZIM2Twtby6pXUsu05cQli4s0YKZSY=; b=kqlzWcCPxHhGR7v/2f+7ITNzA
	pqe5HAeD29dKJH2+M/MgccE2JcR0KPv4MNDxNnbuV4Mp88MLlYOZ733866vO4os9zKWFBS1n5+9G8
	U9l7Hx7YT11Q/mUYb6r5KJceJ3Hb2nsdgN+vVFNjGeK6VRp4z5oes+sFtsob6yo5OkpiAhWsVL91e
	BD14C+LJfFs9Q+rdsTrJ+OsqgSwuIszt9+2TjUPXQ+Yex1EIlz/eG0jMQF+gZgIOwbdjjDJc+drwN
	meUoHclXpKZEIiD94kprqcQi8MhqniLBg/KfUt8A26dTOh0/C94yQ36YgaNcNmqmxSEM7kaeKVYHf
	1W5/CGNcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqc6-0002bS-NL; Thu, 17 Dec 2020 10:34:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqc3-0002ag-E9; Thu, 17 Dec 2020 10:34:24 +0000
X-UUID: fef82252c20c46a381f1305472e9cd6d-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NJ+Woh3w6z3vlb9GDrGYWFJxOWvffKrwn6YuBZHwOtc=; 
 b=Ppqa+J3vMg1YMA91Ftz9KtwxAUJaoiiFnP8wTshgK0X34nG1coQ+oZlNT88mVpfbxQ3V8Bf7KXY4uqsNYKqS5kdTuhOWhZ8NG8xZOgVweGQGAw6GKw0A/I6FDgHH20KShSDgMiPI+reX8+jpwWC+ImwKF1SupzQkKbzA7I38NRo=;
X-UUID: fef82252c20c46a381f1305472e9cd6d-20201217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1945670683; Thu, 17 Dec 2020 02:28:59 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 02:28:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 18:28:47 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Dec 2020 18:28:47 +0800
Message-ID: <1608200928.31376.37.camel@mtksdccf07>
Subject: Re: [PATCH 1/1] kasan: fix memory leak of kasan quarantine
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Date: Thu, 17 Dec 2020 18:28:48 +0800
In-Reply-To: <1608031683-24967-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
References: <1608031683-24967-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
 <1608031683-24967-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2752E72A10EB865FFDCC2B6C40094E72E1BF4CF53284D1973037E26C5DE696AE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_053423_665411_89DE0AD8 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: wsd_upstream@mediatek.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-15 at 19:28 +0800, Kuan-Ying Lee wrote:
> When cpu is going offline, set q->offline as true
> and interrupt happened. The interrupt may call the
> quarantine_put. But quarantine_put do not free the
> the object. The object will cause memory leak.
> 
> Add qlink_free() to free the object.
> 
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: <stable@vger.kernel.org>    [5.10-]
> ---
>  mm/kasan/quarantine.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> index 0e3f8494628f..cac7c617df72 100644
> --- a/mm/kasan/quarantine.c
> +++ b/mm/kasan/quarantine.c
> @@ -191,6 +191,7 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
>  
>  	q = this_cpu_ptr(&cpu_quarantine);
>  	if (q->offline) {
> +		qlink_free(&info->quarantine_link, cache);
>  		local_irq_restore(flags);
>  		return;
>  	}

Sorry.

Please ignore this patch.

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
