Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D28DC3DA62
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ho73z9I5NiBU0wesdxPZDVws1RgteUppy4Fw+aIYmBI=; b=BiCAw7WOLExQlUzXMZZWO4PMcr
	67Nb/l2XDZqgqynLjvySyffytvwRgeqEWN+A18T2tWOv8IUQJFff23pRqgNa0or/zJoptwypYGxoG
	zihhbWP/wxcpdNbA4to+nF+zjspU4GK/Efg1pqU0lO+Znu9NePHdTn9+7QzQ+KleqrrtHopO73mje
	wJFpM5nBpurg/1E9dj1e9z5tYj2HHcK6IUHbkgSGAmEP9q7WAsy1pJEn96IMrO9gF5P9EEunk3hHk
	iDWmQsL6ztlHMALymQRJgOCF7k1tTNo9B5Qta4z9yae2traQvKHmVhjkZ/CSSernt2/xOWoUqQhew
	ZsbVl+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8bc-0000000EVY4-1CtG;
	Wed, 17 Jul 2024 17:38:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8bZ-0000000EVX8-13kI
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jul 2024 17:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721237892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ho73z9I5NiBU0wesdxPZDVws1RgteUppy4Fw+aIYmBI=;
	b=gW4VJLLc1gXeWgTFv9cKJWOu9decP9y853pbysyvlIfspsop6aD5bn/oLWB6nKNwgsohL1
	Xyuttm7H4yzZYCMywMjiePMBpZZK32zjJhHt37x9QoLK+g1OzrpqKSX6yJ1+SwZiOlY7gI
	iSnnna6Odhhyv/AjYp4ENzhTq7EVr1s=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-LpNPs6eCMKmdR_gguvlxMQ-1; Wed,
 17 Jul 2024 13:38:09 -0400
X-MC-Unique: LpNPs6eCMKmdR_gguvlxMQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54DE619560B3;
	Wed, 17 Jul 2024 17:38:07 +0000 (UTC)
Received: from [10.22.16.209] (unknown [10.22.16.209])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B6A01955F40;
	Wed, 17 Jul 2024 17:37:58 +0000 (UTC)
Message-ID: <f448f66b-7a91-4281-8f77-159541cbacff@redhat.com>
Date: Wed, 17 Jul 2024 13:37:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] blk-cgroup: Replace u64 sync with spinlock for iostat
 update
To: "tj@kernel.org" <tj@kernel.org>, =?UTF-8?B?Qm95IFd1ICjlkLPli4Poqrwp?=
 <Boy.Wu@mediatek.com>
Cc: "boris@bur.io" <boris@bur.io>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 =?UTF-8?B?SXZlcmxpbiBXYW5nICjnjovoi7PpnJYp?= <Iverlin.Wang@mediatek.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20240716075206.23121-1-boy.wu@mediatek.com>
 <Zpbify32lel9J-5I@slm.duckdns.org>
 <c5bcbcbaeacdb805adc75c26f92ec69f26ad7706.camel@mediatek.com>
 <5560c690cc6de67139a9b2e45c7a11938b70fc58.camel@mediatek.com>
 <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
 <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_103817_411022_E8C4F168 
X-CRM114-Status: GOOD (  14.96  )
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

On 7/17/24 12:55, tj@kernel.org wrote:
> Hello,
>
> Does something like the following work for you?
>
> Thanks.
>
> diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
> index 37e6cc91d576..ec1d191f5c83 100644
> --- a/block/blk-cgroup.c
> +++ b/block/blk-cgroup.c
> @@ -329,7 +329,6 @@ static struct blkcg_gq *blkg_alloc(struct blkcg *blkcg, struct gendisk *disk,
>   	INIT_WORK(&blkg->async_bio_work, blkg_async_bio_workfn);
>   #endif
>   
> -	u64_stats_init(&blkg->iostat.sync);
>   	for_each_possible_cpu(cpu) {
>   		u64_stats_init(&per_cpu_ptr(blkg->iostat_cpu, cpu)->sync);
>   		per_cpu_ptr(blkg->iostat_cpu, cpu)->blkg = blkg;
> @@ -632,24 +631,26 @@ static void blkg_iostat_set(struct blkg_iostat *dst, struct blkg_iostat *src)
>   static void __blkg_clear_stat(struct blkg_iostat_set *bis)
>   {
>   	struct blkg_iostat cur = {0};
> -	unsigned long flags;
>   
> -	flags = u64_stats_update_begin_irqsave(&bis->sync);
>   	blkg_iostat_set(&bis->cur, &cur);
>   	blkg_iostat_set(&bis->last, &cur);
> -	u64_stats_update_end_irqrestore(&bis->sync, flags);
>   }
>   
>   static void blkg_clear_stat(struct blkcg_gq *blkg)
>   {
> +	unsigned long flags;
>   	int cpu;
>   
> +	raw_spin_lock_irqsave(&blkg_stat_lock, flags);
> +
>   	for_each_possible_cpu(cpu) {
>   		struct blkg_iostat_set *s = per_cpu_ptr(blkg->iostat_cpu, cpu);
>   
>   		__blkg_clear_stat(s);
>   	}
>   	__blkg_clear_stat(&blkg->iostat);
> +
> +	raw_spin_unlock_irqrestore(&blkg_stat_lock, flags);
>   }
>   
>   static int blkcg_reset_stats(struct cgroup_subsys_state *css,
> @@ -998,12 +999,10 @@ static void blkcg_iostat_update(struct blkcg_gq *blkg, struct blkg_iostat *cur,
>   	unsigned long flags;
>   
>   	/* propagate percpu delta to global */
> -	flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
>   	blkg_iostat_set(&delta, cur);
>   	blkg_iostat_sub(&delta, last);
>   	blkg_iostat_add(&blkg->iostat.cur, &delta);
>   	blkg_iostat_add(last, &delta);
> -	u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
>   }
>   
>   static void __blkcg_rstat_flush(struct blkcg *blkcg, int cpu)
> @@ -1134,9 +1133,9 @@ static void blkcg_fill_root_iostats(void)
>   				cpu_dkstats->sectors[STAT_DISCARD] << 9;
>   		}
>   
> -		flags = u64_stats_update_begin_irqsave(&blkg->iostat.sync);
> +		raw_spin_lock_irqsave(&blkg_stat_lock, flags);
>   		blkg_iostat_set(&blkg->iostat.cur, &tmp);
> -		u64_stats_update_end_irqrestore(&blkg->iostat.sync, flags);
> +		raw_spin_unlock_irqrestore(&blkg_stat_lock, flags);
>   	}
>   }
>   
> @@ -1145,7 +1144,6 @@ static void blkcg_print_one_stat(struct blkcg_gq *blkg, struct seq_file *s)
>   	struct blkg_iostat_set *bis = &blkg->iostat;
>   	u64 rbytes, wbytes, rios, wios, dbytes, dios;
>   	const char *dname;
> -	unsigned seq;
>   	int i;
>   
>   	if (!blkg->online)
> @@ -1157,16 +1155,14 @@ static void blkcg_print_one_stat(struct blkcg_gq *blkg, struct seq_file *s)
>   
>   	seq_printf(s, "%s ", dname);
>   
> -	do {
> -		seq = u64_stats_fetch_begin(&bis->sync);
> -
> -		rbytes = bis->cur.bytes[BLKG_IOSTAT_READ];
> -		wbytes = bis->cur.bytes[BLKG_IOSTAT_WRITE];
> -		dbytes = bis->cur.bytes[BLKG_IOSTAT_DISCARD];
> -		rios = bis->cur.ios[BLKG_IOSTAT_READ];
> -		wios = bis->cur.ios[BLKG_IOSTAT_WRITE];
> -		dios = bis->cur.ios[BLKG_IOSTAT_DISCARD];
> -	} while (u64_stats_fetch_retry(&bis->sync, seq));
> +	raw_spin_lock_irq(&blkg_stat_lock);
> +	rbytes = bis->cur.bytes[BLKG_IOSTAT_READ];
> +	wbytes = bis->cur.bytes[BLKG_IOSTAT_WRITE];
> +	dbytes = bis->cur.bytes[BLKG_IOSTAT_DISCARD];
> +	rios = bis->cur.ios[BLKG_IOSTAT_READ];
> +	wios = bis->cur.ios[BLKG_IOSTAT_WRITE];
> +	dios = bis->cur.ios[BLKG_IOSTAT_DISCARD];
> +	raw_spin_unlock_irq(&blkg_stat_lock, flags);
>   
>   	if (rbytes || wbytes || rios || wios) {
>   		seq_printf(s, "rbytes=%llu wbytes=%llu rios=%llu wios=%llu dbytes=%llu dios=%llu",
>
bis->sync is still being used in blk_cgroup_bio_start(). Replacing it 
with a global lock may kill performance. We may have to use a per-cpu 
lock if we want to go this route of eliminating bis->sync.

Cheers,
Longman


