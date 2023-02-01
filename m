Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81878C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svd0hoNX7HC1/uFI9rrqGfsTCiHhXc2+NBFfpj04KDs=; b=BCXuvM6p1RpQZNd34lUAyXxaBH
	hit6mlsMF+ggbNgbur6DTU6ohOVwUjOc+R/Fem1rT9cas8lvhatvx+VzOOrV66xjojmE6KoHrqQM1
	H0u/wk0GzrZL/uwkRw2P0GU4WobZis3RSdHPlbdokm90762BOIxn9fZreMMgHheKEmJDwhRiE+SQb
	wTC+pOPhl5WaNEK0QE5Qimvpnhu6ZLz/JOyS7lyTgCgc4WWUOrMsBwZ4JJjl/3rJQGp9NQulVzxwb
	iOAv/OxBuWOkc/GVCs/LziELivaH4cgZEBTWsXQcgxxoHze8uxUhNj2qNOIBYibImLuYbiU5ycCr8
	QbXRKPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN963-00AwIz-WA; Wed, 01 Feb 2023 09:08:04 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN95g-00Avz9-83; Wed, 01 Feb 2023 09:07:41 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0Vag58Zn_1675242449;
Received: from 30.97.48.53(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Vag58Zn_1675242449)
          by smtp.aliyun-inc.com;
          Wed, 01 Feb 2023 17:07:30 +0800
Message-ID: <fa50efda-0229-ca8a-cd4d-99ea73dc3f90@linux.alibaba.com>
Date: Wed, 1 Feb 2023 17:08:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] mm/gup: Add folio to list when folio_isolate_lru()
 succeed
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Cc: chinwen.chang@mediatek.com, andrew.yang@mediatek.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_010740_503937_76FB8D4E 
X-CRM114-Status: GOOD (  13.05  )
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



On 1/31/2023 2:32 PM, Kuan-Ying Lee wrote:
> If we call folio_isolate_lru() successfully, we will get
> return value 0. We need to add this folio to the
> movable_pages_list.
> 
> Fixes: 67e139b02d99 ("mm/gup.c: refactor check_and_migrate_movable_pages()")
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Good catch.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   mm/gup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index f3d2cccb89f8..918c364d01ac 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1914,7 +1914,7 @@ static unsigned long collect_longterm_unpinnable_pages(
>   			drain_allow = false;
>   		}
>   
> -		if (!folio_isolate_lru(folio))
> +		if (folio_isolate_lru(folio))
>   			continue;
>   
>   		list_add_tail(&folio->lru, movable_page_list);

