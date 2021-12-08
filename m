Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD36C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SERgStgERiEYQK8IIZ2wCXuTe5wS4ST2pgv0igD9iY=; b=F6YDtoMKprtl5o
	7UQfOdxyVsOqZVd5GzNT3cjoLhXPYgEjFHmujy7iVIlR4rBNzz1xqxigGocNd2fWYpjb5QwuKKi5G
	0RFQl0DcR/QYwGCmnjOtkv5U4V4k1+sCZAgFejZ52dTQTuXd6zOGK8CQg/lb0+8OKQHCpYEu260FA
	KB4HPyFU5e3o0MuKyTmLK6BCGI40+bEHECsj5GIHPjIcLuthICwERc1tMhZl/0S5fimhE4/vzlj6q
	9I1MOw4G+5zHWet5uiQ+r47XfUTCAobSUdiN+u8X/iHTj6OT7VI2Y055mqvvhlr0M8S8ebbXWzON+
	yWUqhXHkGz6vbjBX5+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muuFu-00C7IY-F5; Wed, 08 Dec 2021 10:32:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muuFg-00C7FR-Mz; Wed, 08 Dec 2021 10:32:47 +0000
X-UUID: 213b942366b44b6f9c295d352565c605-20211208
X-UUID: 213b942366b44b6f9c295d352565c605-20211208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1481719843; Wed, 08 Dec 2021 03:32:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 02:22:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 18:22:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 18:22:36 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rppt@kernel.org>
CC: <akpm@linux-foundation.org>, <arnd@arndb.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux@armlinux.org.uk>,
 <linux@roeck-us.net>, <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>,
 <rmk+kernel@armlinux.org.uk>, <wangkefeng.wang@huawei.com>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm: remove [_text, _stext) from kernel code resource
Date: Wed, 8 Dec 2021 18:22:37 +0800
Message-ID: <20211208102237.19706-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YbB+O80Th2QI8sTl@kernel.org>
References: <YbB+O80Th2QI8sTl@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_023244_782424_0602D972 
X-CRM114-Status: GOOD (  24.97  )
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

> On Wed, Dec 08, 2021 at 10:26:23AM +0800, Mark-PK Tsai wrote:
> > > On Fri, Dec 03, 2021 at 10:14:16PM +0800, Mark-PK Tsai wrote:
> > > > Remove the [_text, _stext) from Kernel Code.
> > > > Although there are some startup code in head.text, they
> > > > are freed to the buddy system after kernel boot.
> > >
> > > Hmm, I don't see it is being freed anywhere. Can you elaborate when and how
> > > the range [_text, _stext) is freed?
> > 
> > arm_memblock_init() reserve [KERNEL_START, KERNEL_END) which are defined as following.
> > 
> > #define KERNEL_START            _stext
> > #define KERNEL_END              _end
> > 
> > free_low_memory_core_early() free all the non-reserved range in lowmem,
> > so the range [_text, _stext) is also freed here.
> 
> Right, I've misread KERNEL_START as if it was _text...
>  
> > >
> > > > And we have memory protection mechanism use this
> > > > which have false alarm when some other IPs doing dma
> > > > if the dma page frame is in the [_text, _stext).
> > > >
> > > > Below are my iomem resource and reserved memory information:
> > > > console:/ # grep Kernel /proc/iomem
> > > >   20208000-219fffff : Kernel code
> > > >   21b00000-21c2e76f : Kernel data
> > > >
> > > > console:/ # cat /sys/kernel/debug/memblock/reserved
> > > > 0: 0x20201000..0x20207fff
> > > > 1: 0x20300000..0x21c2e76f
> > >
> > > What are the addresses of _text and _stext in your configuration?
> > 
> > va	 pa
> > c0008000 20208000 _text
> > c0100000 20300000 _stext
> > 
> > >
> > > What these dumps are supposed to show here?
> > >
> > 
> > Below is the dump info after applied this patch.
> > 
> > console:/ # grep Kernel /proc/iomem
> >   20300000-219fffff : Kernel code
> >   21b00000-21c2e76f : Kernel data
> > 
> > console:/ # cat /sys/kernel/debug/memblock/reserved
> > 0: 0x20201000..0x20207fff
> > 1: 0x20300000..0x21c2e76f
> > 
> > The difference is that Kernel Code resource match the reserved memblock 1
> > which is reserved in arm_memblock_init().
> 
> For that I'd extend the reservation in arm_memblock_init() to include
> [_text, _stext). 
> 
> Even if the code there is not needed after init, at least we'll keep this
> consistent with other architectures.
>  

Extending the reservation in arm_memblock_init() will consume up to SECTION_SIZE
memory for SECTION_SIZE alignment when CONFIG_STRICT_KERNEL_RWX=y.
So we really don't want to extend the reservation because it affect
the low RAM devices.

And arm64_memblock_init() also reserve [_stext, _end) in the recent kernel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
