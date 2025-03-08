Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C899C28B2E
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Mar 2025 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USWTb6fbfs9ctXuLN/jteJwX39h1/6zKvhemZZrzqrc=; b=b1pOxRUmZb6i7oQzYxb3fJcOB4
	8xF7qdJnoCLwQrwGMSw1dxSrfJDbQu8e97K+GjSPQ9IgH+p58r5Fa4Ny33pLlxdg6a5uMklf4Lmy9
	YxVDifinGkA4R9wOyf+DfO77siYFa04+EuD230BN1fc6Ws/S/3orI+zCvlgxV74UzPPVP/XztRMXE
	Zv1BK/nvgHS5qAiqgKINM4UcexXpxUyZHZQfqilxZIc5eAdtU4wXlali8UwKTZnyTNdDRQTAn4bMu
	f2d6BlyQCuimZPFS+RSouS5BEOqUuZC0ps6SrTJPZZjw9Sz8WzI6sSjoKSMZpS9uC042GQz9kmaJa
	Zn5VAdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvMR-0000000Gjxp-485X;
	Sat, 08 Mar 2025 14:41:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvMO-0000000Gjwz-24aQ
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Mar 2025 14:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741444861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USWTb6fbfs9ctXuLN/jteJwX39h1/6zKvhemZZrzqrc=;
	b=b7A3nL+bJZlUkldZjeC2UNI+BNBkGednllIDBWoJV2Xbbf+yAtquqhEBI3THZmKbn0TOBY
	VIreAKLqBQ+Xn8yZSBTZlgdMfmUAaIsLycVjhQWf1WEE9gk5lswYJwHkbCG/GGgAdAeIWh
	DFYCQcZu9GmEqodDX5uN//J7UJtZLdE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-01G2DDygO3-hnrdvQxt0gg-1; Sat, 08 Mar 2025 09:41:00 -0500
X-MC-Unique: 01G2DDygO3-hnrdvQxt0gg-1
X-Mimecast-MFC-AGG-ID: 01G2DDygO3-hnrdvQxt0gg_1741444859
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac27ea62032so22419166b.1
        for <linux-mediatek@lists.infradead.org>; Sat, 08 Mar 2025 06:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741444859; x=1742049659;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USWTb6fbfs9ctXuLN/jteJwX39h1/6zKvhemZZrzqrc=;
        b=jKkitkVXAm+GgSyoYaYnwPoCQfF3LeTUgCRwjAna/BWORl8hwiviYpMpI7qlrPs7R/
         ITG9YHjn/b3VLC2idnwTcTh9ZwQ0LBDaWSqM0pKaGlOGtnzhbex8T6mUYxmceOSjwOvs
         4pljmZkhzuHQdmOLhoK8iL9TM51OJC61qFd3X38PIUBWEcVnLKWaqU+H15F+SinVWh/T
         TkO8ORky72sHpKD3Bn1qYmDq4bZVPq9fljX0nDZFQSpJWLWzcM1aF1WiASDfCrhn+5RU
         1js6AhLag7Ss7Et7mUHuchd3l8Ro2iOlvCwO1mN++WzY16L3gBfDP16/ZMaaJX7NDzFf
         20iw==
X-Forwarded-Encrypted: i=1; AJvYcCWUO06pDcILR0JYFl/hp0Z338sGU2ysWYV8F8XlPLXOT9eBK8bCkzO2JqueAle0IR5yiAVhYxbdfMIbcd4v6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi59X6J/fM0+buNZU3K7nyFZLJyZA/W51YQyUNUXDlAX4eBs9c
	srdGOz1NbSFbAP//QAWN6YuFyXh7O2hkD1BuKpRBdPdFDwB88KFqyD8exZk4W37Degha2y6GHlv
	ikP9LX/hB5XPbqXaBMFDBvHvu4X4JKlXcSqlwxVyfSV6buZRfB9+u6aU8Aw4A561jIoYo0A==
X-Gm-Gg: ASbGncteEU5hOGGy78TlQ0+wmrUJj/Sed7I2fpP7zCy5KPN/OuR9hBcR+lggIA2EtoL
	IHMwODDinYPBSqMcor4TTiZaRrFD50REC04EPQ7JQcy1Dx3ILt3vSO4Og6VjNQ8WvJpjIfrK9Zu
	DNq8rile6spZOWTAIVPzW56uYjontCAdTwYWydehCgGv9DVv3V7odTdqF3mhCWGoRrl35Hj6Umj
	jRN52xCccQ3ek0sTnTqINZtcIfwWXOGRLiI8HEN4o17d9Q/90n7G7FRtIvUamd+YwZ1+SfQ8/e2
	MT+cPDHf2r8V
X-Received: by 2002:a17:907:3e82:b0:abf:6f44:bffa with SMTP id a640c23a62f3a-ac252e9e7c4mr968103366b.36.1741444858756;
        Sat, 08 Mar 2025 06:40:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1kymkWxueuBLuXgFuW5FEYCy8fXWaTM8cfTQUCfcHK7lgqp5/vZPe/5nwj4qhwZPGfcHS0w==
X-Received: by 2002:a17:907:3e82:b0:abf:6f44:bffa with SMTP id a640c23a62f3a-ac252e9e7c4mr968098366b.36.1741444858267;
        Sat, 08 Mar 2025 06:40:58 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394859b2sm447048166b.69.2025.03.08.06.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 06:40:57 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 69D1918FA096; Sat, 08 Mar 2025 15:40:51 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Yunsheng Lin <yunshenglin0825@gmail.com>, Yunsheng Lin
 <linyunsheng@huawei.com>, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com
Cc: zhangkun09@huawei.com, liuyonglong@huawei.com, fanghaiqing@huawei.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Robin Murphy
 <robin.murphy@arm.com>, Alexander Duyck <alexander.duyck@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Gaurav Batra
 <gbatra@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, IOMMU
 <iommu@lists.linux.dev>, MM <linux-mm@kvack.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next v11 0/4] fix the DMA API misuse problem for
 page_pool
In-Reply-To: <40b33879-509a-4c4a-873b-b5d3573b6e14@gmail.com>
References: <20250307092356.638242-1-linyunsheng@huawei.com>
 <87v7slvsed.fsf@toke.dk> <40b33879-509a-4c4a-873b-b5d3573b6e14@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Sat, 08 Mar 2025 15:40:51 +0100
Message-ID: <875xkj1t70.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WRZK7nD0DCYzQwKjYCtA3I_GcpHLrtEYInRhYNB-P6g_1741444859
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_064104_615304_04FA57C9 
X-CRM114-Status: GOOD (  34.20  )
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

Yunsheng Lin <yunshenglin0825@gmail.com> writes:

> On 3/7/2025 10:15 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>
> ...
>
>>=20
>> You are making this incredibly complicated. You've basically implemented
>> a whole new slab allocator for those page_pool_item objects, and you're
>> tracking every page handed out by the page pool instead of just the ones
>> that are DMA-mapped. None of this is needed.
>  > > I took a stab at implementing the xarray-based tracking first sugges=
ted
>> by Mina[0]:
>
> I did discuss Mina' suggestion with Ilias below in case you didn't
> notice:
> https://lore.kernel.org/all/0ef315df-e8e9-41e8-9ba8-dcb69492c616@huawei.c=
om/

I didn't; thanks for the pointer. See below.

> Anyway, It is great that you take the effort to actually implement
> the idea to have some more concrete comparison here.

:)

>>=20
>> https://git.kernel.org/toke/c/e87e0edf9520
>>=20
>> And, well, it's 50 lines of extra code, none of which are in the fast
>> path.
>
> I wonder what is the overhead for the xarray idea regarding the
> time_bench_page_pool03_slow() testcase before we begin to discuss
> if xarray idea is indeed possible.

Well, just running that benchmark shows no impact:

|                               |      Baseline     |     xarray      |
|                               |   Cycles |     ns | Cycles |     ns |
|-------------------------------+----------+--------+--------+--------|
| no-softirq-page_pool01        |       20 |  5.713 |     19 |  5.516 |
| no-softirq-page_pool02        |       56 | 15.560 |     57 | 15.864 |
| no-softirq-page_pool03        |      225 | 62.763 |    222 | 61.728 |
| tasklet_page_pool01_fast_path |       19 |  5.399 |     19 |  5.505 |
| tasklet_page_pool02_ptr_ring  |       54 | 15.090 |     54 | 15.018 |
| tasklet_page_pool03_slow      |      238 | 66.134 |    239 | 66.498 |

...however, the benchmark doesn't actually do any DMA mapping, so it's
not super surprising that it doesn't show any difference: it's not
exercising any of the xarray code. Your series shows a difference on
this benchmark only because it does the page_pool_item allocation
regardless of whether DMA is used or not.

I guess we should try to come up with a micro-benchmark that does
exercise the DMA code. Or just hack up the xarray patch to do the
tracking regardless, for benchmarking purposes.

>> Jesper has kindly helped with testing that it works for normal packet
>> processing, but I haven't yet verified that it resolves the original
>> crash. Will post the patch to the list once I have verified this (help
>> welcome!).
>
> RFC seems like a good way to show and discuss the basic idea.

Sure, I can send it as an RFC straight away if you prefer. Note that I'm
on my way to netdevconf, though, so will probably have limited time to
pay attention to this for the next week or so.

> I only took a glance at git code above, it seems reusing the
> _pp_mapping_pad for pp_dma_index seems like a wrong direction
> as mentioned in discussion with Ilias above as the field might
> be used when a page is mmap'ed to user space, and reusing that
> field in 'struct page' seems to disable the tcp_zerocopy feature,
> see the below commit from Eric:
> https://github.com/torvalds/linux/commit/577e4432f3ac810049cb7e6b71f4d96e=
c7c6e894
>
> Also, I am not sure if a page_pool owned page can be spliced into the fs
> subsystem yet, but if it does, I am not sure how is reusing the
> page->mapping possible if that page is called in __filemap_add_folio()?
>
> https://elixir.bootlin.com/linux/v6.14-rc5/source/mm/filemap.c#L882

Hmm, so I did look at the mapping field, but concluded using it wouldn't
interfere with anything relevant as long as it's reset back to zero
before the page is returned to the page allocator. However, I definitely
missed the TCP zero-copy thing, and other things as well, it would seem
(cf the discussion you referred to above).

However, I did consider alternatives: AFAICT there should be space in
the pp_magic field (used for the PP_SIGNATURE), so that with a bit of
care we can stick an ID into the upper bits and still avoid ending up
with a value that could look like a valid pointer.

I didn't implement that initially because I wasn't sure it was
necessary, but seeing as it is, I will take another look at it. I have
one or two other ideas if this turns out not to pan out.

-Toke


