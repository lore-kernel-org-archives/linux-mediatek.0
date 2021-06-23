Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1606EC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 13:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D941861075
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 13:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D941861075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBgTqvDZ61mJsRzqzRn/THSpYoGZWStIhhUX7T3Xlao=; b=QArnbcTh/HMpCQ
	Bd0f4TVHwNH/Pul9Tp9uPXY5gCLLL0DxFG0hBx8x+EsVgANGxcO/OdYPmuJzg31aP5pCFm2M0iqxt
	pOpUrXJ09TdnAXdcncW9OAfQVBlCB8Jvdc3gYjSCPTfvfK1bTEBKbPhqP48arbLS1/JsPXqkUVv/o
	Jfh8ZG5lvOqXNoVA/JC7XWKNGaYwQ5aa9vaHyv/BEcF7pwrCxtAi0X8NSwxfhan4xKqxH6fT3blaD
	Go1eE7dXqgiPp4RNx80Zla8oHb8ylb3tJ1H3CnbdmxNOY3k3WnhAtCbHeLNIUnxazvm3+Pl81QXdV
	7P4bYyc7q+9Xa8eHGFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw3JJ-00Arsz-4j; Wed, 23 Jun 2021 13:52:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw3JG-00Arrq-AE; Wed, 23 Jun 2021 13:52:55 +0000
X-UUID: e6b5aa32c8ae489aad9e459730e177bf-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HAjT4udO57t+rw0LhCJdv0l55D4KZ+MMoREZAkGCEQU=; 
 b=iqPp4rODBvXFQRi6Hf45QHZrtgmeVEWnwTsSApc/hkAorzRi3gxiozi+E4U+jWIrqySvgrWzsPiZ1vls/O4icwTy550PI/3+Q0OEULNZUbQbWavKLUVPxiNZGMkladaCwbU+ZHJkW/TNr96f0AeXo0eKkQV+Hkgrsuub2Teq5U4=;
X-UUID: e6b5aa32c8ae489aad9e459730e177bf-20210623
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 274397688; Wed, 23 Jun 2021 06:52:53 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 06:52:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 21:52:49 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 21:52:49 +0800
Message-ID: <9a77839314b3c33970925b5127182c97914c185d.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] kasan: Add memzero init for unaligned size under
 SLUB debug
From: Yee Lee <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Wed, 23 Jun 2021 21:52:49 +0800
In-Reply-To: <20210623133533.2246-2-yee.lee@mediatek.com>
References: <20210623133533.2246-1-yee.lee@mediatek.com>
 <20210623133533.2246-2-yee.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_065254_407808_08FE70A8 
X-CRM114-Status: GOOD (  17.52  )
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

Sorry not a completed patch.
Please skip this mail.

BR,
Yee

On Wed, 2021-06-23 at 21:35 +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> Issue: when SLUB debug is on, hwtag kasan_unpoison() would overwrite
> the redzone with unaligned object size.
> 
> An additional memzero_explicit() path is added to replacing hwtag
> initialization
> at SLUB deubg mode.
> 
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  mm/kasan/kasan.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index d8faa64614b7..e984a9ac814d 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -387,10 +387,12 @@ static inline void kasan_unpoison(const void
> *addr, size_t size, bool init)
>  
>  	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
>  		return;
> +	#if IS_ENABLED(CONFIG_SLUB_DEBUG)
>  	if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
>  		init = false;
> -		memset((void *)addr, 0, size);
> +		memzero_explicit((void *)addr, size);
>  	}
> +	#endif
>  	size = round_up(size, KASAN_GRANULE_SIZE);
>  	hw_set_mem_tag_range((void *)addr, size, tag, init);
>  }
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
