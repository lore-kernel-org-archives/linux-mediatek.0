Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C016C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pq4hHsGE0t+VV4BIXMSVAFuSgUgLuecyJaFxll+jw4=; b=jpgD34U0IxG6wz
	2vCrBXSN669nwKNWvwyWJSezgpuirXMswcHViZTnZyfrjsU8PZrjuAu7fCLMxNH2kdp7ciej/KS40
	nINSphrrvvyhYLty8YfUp83+BX2txdlpgRaLLicMxqNUR+5WkAEy0gLMYkUYTUcjImia7WtfOSNcl
	JvZEDUu0r5j7rcGUxnpZiBb1s+FvobX/GUdw5iHAtye0QOwWgPRIhqTYYgCkLbNmmCYHzqyxkSLBK
	NqlROw1lSzRai5HG83LNIix+2YjlzfKJzO9eaZwEmAmi3ijG1I6o4rO55vLuNqixhib7aJ4SuXPEk
	TMI2wXFGSYQJkA7tPpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mutUS-00BwxD-4V; Wed, 08 Dec 2021 09:43:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mutUE-00Bwvo-G3; Wed, 08 Dec 2021 09:43:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E2247CE2033;
 Wed,  8 Dec 2021 09:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6445C00446;
 Wed,  8 Dec 2021 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638956614;
 bh=7KVwmZP4kb/OUL12BsPtaww8tTdt2wLQUh9C2RS84eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3Ux8Mz5MdK0z6YQ5WyzALFAKVKmQEk0+7u4MYenjEKWSdYay/H+eLFSqkJpThpsd
 bDunlql+anSvbDj8enIYHVUWygu7gb0yIhW8VuaUKBhHQ0cSGVTBz/q6RZxD61C6Tm
 ZVA2ZmG8uOUATKSkIM399mZiH9XyecKC9qUhI8Lt4O8YONu7SD1bcv+5ipJB05m8uZ
 mBJcZ7XF6g1rEOpN52UZyGYDpy+oCY4dx2nUqIzbE+tXg1bu7qNCTq/XZCk2FkZzSR
 x2egKSR4V2pU37yAhQPbjdEdrkJhHr5Vc+ZO05KFmkY6I2LEZb6wFZ53nV/O1KK91d
 +tW5Upq2wb+lw==
Date: Wed, 8 Dec 2021 11:43:23 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: akpm@linux-foundation.org, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux@armlinux.org.uk,
 linux@roeck-us.net, matthias.bgg@gmail.com,
 rmk+kernel@armlinux.org.uk, wangkefeng.wang@huawei.com,
 yj.chiang@mediatek.com
Subject: Re: [PATCH] arm: remove [_text, _stext) from kernel code resource
Message-ID: <YbB+O80Th2QI8sTl@kernel.org>
References: <Ya+EUDVYdBvRa7xI@kernel.org>
 <20211208022623.15103-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211208022623.15103-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_014342_765661_EE189DAF 
X-CRM114-Status: GOOD (  23.80  )
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

On Wed, Dec 08, 2021 at 10:26:23AM +0800, Mark-PK Tsai wrote:
> > On Fri, Dec 03, 2021 at 10:14:16PM +0800, Mark-PK Tsai wrote:
> > > Remove the [_text, _stext) from Kernel Code.
> > > Although there are some startup code in head.text, they
> > > are freed to the buddy system after kernel boot.
> >
> > Hmm, I don't see it is being freed anywhere. Can you elaborate when and how
> > the range [_text, _stext) is freed?
> 
> arm_memblock_init() reserve [KERNEL_START, KERNEL_END) which are defined as following.
> 
> #define KERNEL_START            _stext
> #define KERNEL_END              _end
> 
> free_low_memory_core_early() free all the non-reserved range in lowmem,
> so the range [_text, _stext) is also freed here.

Right, I've misread KERNEL_START as if it was _text...
 
> >
> > > And we have memory protection mechanism use this
> > > which have false alarm when some other IPs doing dma
> > > if the dma page frame is in the [_text, _stext).
> > >
> > > Below are my iomem resource and reserved memory information:
> > > console:/ # grep Kernel /proc/iomem
> > >   20208000-219fffff : Kernel code
> > >   21b00000-21c2e76f : Kernel data
> > >
> > > console:/ # cat /sys/kernel/debug/memblock/reserved
> > > 0: 0x20201000..0x20207fff
> > > 1: 0x20300000..0x21c2e76f
> >
> > What are the addresses of _text and _stext in your configuration?
> 
> va	 pa
> c0008000 20208000 _text
> c0100000 20300000 _stext
> 
> >
> > What these dumps are supposed to show here?
> >
> 
> Below is the dump info after applied this patch.
> 
> console:/ # grep Kernel /proc/iomem
>   20300000-219fffff : Kernel code
>   21b00000-21c2e76f : Kernel data
> 
> console:/ # cat /sys/kernel/debug/memblock/reserved
> 0: 0x20201000..0x20207fff
> 1: 0x20300000..0x21c2e76f
> 
> The difference is that Kernel Code resource match the reserved memblock 1
> which is reserved in arm_memblock_init().

For that I'd extend the reservation in arm_memblock_init() to include
[_text, _stext). 

Even if the code there is not needed after init, at least we'll keep this
consistent with other architectures.
 

-- 
Sincerely yours,
Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
