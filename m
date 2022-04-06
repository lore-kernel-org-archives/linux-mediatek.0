Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B182C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWy0GY7iCzqQfVS6GyIIN/jcDdjbHR14JFlh/FiPjJs=; b=IyfJ8/5qSnwaM+
	aeOQHsJwdbhCLgHtXpNIeoebGYb6WY0SRsIQ+HYIJtneclwAZylqOuheWbXmWptvcM6tJJFSaBx8v
	+xeBFE10zG4TS9+3/PGMUYqCPwl+N7Bk2tm+C+zv4bsFfBSoZzdSVSGrgLlKEjusn25L5OWPvNBz9
	wsZHG4BH5AIcQerEiPyZa0/Rgx3W6/KCVXVweoyF/WdAjKuGQYOJ2yhqCUQpZtU5DiIuf910N2cMR
	Bitg0kHRsUE2OYKxiHAj0QvJdvXXZ17lT6f3Mj1N48KeTQvf3izgviA23e1bG71x38gxjMSjPPag9
	fAjFQMTHfVJDXUmaqbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6tG-006c8H-Up; Wed, 06 Apr 2022 14:44:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6pt-006aLQ-EA; Wed, 06 Apr 2022 14:40:47 +0000
X-UUID: 123da6397c8f46d58371ce25554ac5dd-20220406
X-UUID: 123da6397c8f46d58371ce25554ac5dd-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 274345634; Wed, 06 Apr 2022 07:40:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 07:40:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Apr 2022 22:40:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Apr 2022 22:40:28 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <jens.wiklander@linaro.org>
CC: <sumit.garg@linaro.org>, <matthias.bgg@gmail.com>,
 <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: Re: [PATCH v4] tee: make tee_shm_register_kernel_buf vmalloc
 supported
Date: Wed, 6 Apr 2022 22:40:28 +0800
Message-ID: <20220406144028.4203-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAHUa44GDg7hAAFsmeOOkeqi8_1P1Q6jATRdnV9b6S-DhpEEQrA@mail.gmail.com>
References: <CAHUa44GDg7hAAFsmeOOkeqi8_1P1Q6jATRdnV9b6S-DhpEEQrA@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_074041_548436_43032DCB 
X-CRM114-Status: GOOD (  20.51  )
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

> On Fri, Feb 25, 2022 at 4:20 PM Phil Chang <phil.chang@mediatek.com>
> wrote:
>>
>> In some low-memory devices, it's hard to aquire large-orders pages,
>> this patch allowed user using scatter pages to register shm.
>>
>> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
>> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
>> ---
>>  drivers/tee/optee/call.c |  2 +-
>>  drivers/tee/tee_shm.c    | 35 +++++++++++++++++++++++++----------
>>  2 files changed, 26 insertions(+), 11 deletions(-)
>
> Looks good to me. Unfortunately this is too late for the coming merge
> window, so it's going to be the one after that. Meanwhile it will be
> in linux-next.
>
> Thanks,
> Jens

 Hi Jens
   thanks for your review, did I push again wile merge window open ?
   Or just wait ?

 Thanks

>>
>> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
>> index bd49ec934060..2082e632adff 100644
>> --- a/drivers/tee/optee/call.c
>> +++ b/drivers/tee/optee/call.c
>> @@ -362,7 +362,7 @@ int optee_check_mem_type(unsigned long start,
>> size_t num_pages)
>>          * Allow kernel address to register with OP-TEE as kernel
>>          * pages are configured as normal memory only.
>>          */
>> -       if (virt_addr_valid(start))
>> +       if (virt_addr_valid(start) || is_vmalloc_addr((void *)start))
>>                 return 0;
>>
>>         mmap_read_lock(mm);
>> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
>> index f31e29e8f1ca..836872467dc6 100644
>> --- a/drivers/tee/tee_shm.c
>> +++ b/drivers/tee/tee_shm.c
>> @@ -23,21 +23,36 @@ static void shm_put_kernel_pages(struct page
>> **pages, size_t page_count)
>>  static int shm_get_kernel_pages(unsigned long start, size_t
>>  page_count,
>>                                 struct page **pages)
>>  {
>> -       struct kvec *kiov;
>>         size_t n;
>>         int rc;
>>
>> -       kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
>> -       if (!kiov)
>> -               return -ENOMEM;
>> +       if (is_vmalloc_addr((void *)start)) {
>> +               struct page *page;
>>
>> -       for (n = 0; n < page_count; n++) {
>> -               kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
>> -               kiov[n].iov_len = PAGE_SIZE;
>> -       }
>> +               for (n = 0; n < page_count; n++) {
>> +                       page = vmalloc_to_page((void *)(start +
>> PAGE_SIZE * n));
>> +                       if (!page)
>> +                               return -ENOMEM;
>> +
>> +                       get_page(page);
>> +                       pages[n] = page;
>> +               }
>> +               rc = page_count;
>> +       } else {
>> +               struct kvec *kiov;
>> +
>> +               kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
>> +               if (!kiov)
>> +                       return -ENOMEM;
>>
>> -       rc = get_kernel_pages(kiov, page_count, 0, pages);
>> -       kfree(kiov);
>> +               for (n = 0; n < page_count; n++) {
>> +                       kiov[n].iov_base = (void *)(start + n *
>> PAGE_SIZE);
>> +                       kiov[n].iov_len = PAGE_SIZE;
>> +               }
>> +
>> +               rc = get_kernel_pages(kiov, page_count, 0, pages);
>> +               kfree(kiov);
>> +       }
>>
>>         return rc;
>>  }
>> --
>> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
