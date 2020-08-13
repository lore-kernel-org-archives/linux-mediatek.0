Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BBBC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:21:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D80C204FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VL4Q9N6n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D80C204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f8ZDDY6tHVnejvJWEnJU526HHnwBEVnOeR4zwLSAxao=; b=VL4Q9N6njoFBq4So3VWWcmu6h
	PLTqe0BBY8rvyQeqY6fb9DCMPXI4xZa1qBARgchFufheYXmd3KTdT5QlHnQKpg6Ulk6NzAOi8vyXf
	IxfnyY3FEi3KPYDYREXTXiu1/9cEFVXOsNv13a27qmL2mw373ySScZHQtp8bTV0oAgUtp7HLwHGQI
	a9kVW+tHdtR6KD3pSa/O7TbtaX4kfdP+9uaNlTQeXGhjmBE0Zzul2iUR7CQItjOvHOeUnMYsWhWSY
	9x5ZwuLb8/37x9xMvoev0RMt8nkp48EYNANAKEHATFPHL403UHBzwk2IFsViUs7agvyt9ib3zUkyb
	UQe1plqSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k68Ua-0000YR-MU; Thu, 13 Aug 2020 08:21:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k68UW-0000X2-Cm; Thu, 13 Aug 2020 08:21:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 291C61063;
 Thu, 13 Aug 2020 01:21:35 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E13B73F70D;
 Thu, 13 Aug 2020 01:21:32 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] mmap locking API: add mmap_lock_is_contended()
To: Chinwen Chang <chinwen.chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Davidlohr Bueso
 <dbueso@suse.de>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Song Liu <songliubraving@fb.com>,
 Jimmy Assarsson <jimmyassarsson@gmail.com>, Huang Ying <ying.huang@intel.com>
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
 <1597284810-17454-2-git-send-email-chinwen.chang@mediatek.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a28c900c-f3a2-e39f-b5d9-9e6a34d1b168@arm.com>
Date: Thu, 13 Aug 2020 09:21:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597284810-17454-2-git-send-email-chinwen.chang@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_042140_499261_25413CE5 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wsd_upstream@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/08/2020 03:13, Chinwen Chang wrote:
> Add new API to query if someone wants to acquire mmap_lock
> for write attempts.
> 
> Using this instead of rwsem_is_contended makes it more tolerant
> of future changes to the lock type.
> 
> Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   include/linux/mmap_lock.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 0707671..18e7eae 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -87,4 +87,9 @@ static inline void mmap_assert_write_locked(struct mm_struct *mm)
>   	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
>   }
>   
> +static inline int mmap_lock_is_contended(struct mm_struct *mm)
> +{
> +	return rwsem_is_contended(&mm->mmap_lock);
> +}
> +
>   #endif /* _LINUX_MMAP_LOCK_H */
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
