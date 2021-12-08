Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 02:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLPpZNYweggcZjldQkp0fB1V1fRN9K8GNKGHrlIZd0w=; b=fg/9gvtSjRbo4h
	yHqfruxGbmxtKlHu/jzbOD6NvmXF+zjQKz1aS4RFixuJZD1qxqNnKWvfyoCt07OhpBCJSrArtWhWU
	reDhUHEhpPYYnEu9ikl1qM3AVPtiyErzhGqx13sTPBAj/g0D+nVxcJ8mQDxges5D46camm5XmAa8o
	N/OXqEuUFmjQp28SIH0RRWftRWZsmd1sseoMYOcqOCY2f/ej0YKlrxB1Pv9yDanj15XUfr92RhYQK
	0LpjVNXAoQMndZ79ilt+Tw9jcYj/0LFnX2n05JvV+75fU3uOIgUFloIRugn9UeJN3DSzzHFuDHMt0
	LYB4MM4/xXSTWhQIYw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mumfI-00Agl7-52; Wed, 08 Dec 2021 02:26:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mumfD-00Agk9-Nm; Wed, 08 Dec 2021 02:26:38 +0000
X-UUID: 5708fc8db9794601878249352476e52a-20211207
X-UUID: 5708fc8db9794601878249352476e52a-20211207
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 887743112; Tue, 07 Dec 2021 19:26:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 18:26:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 10:26:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 10:26:23 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rppt@kernel.org>
CC: <akpm@linux-foundation.org>, <arnd@arndb.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux@armlinux.org.uk>,
 <linux@roeck-us.net>, <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>,
 <rmk+kernel@armlinux.org.uk>, <wangkefeng.wang@huawei.com>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm: remove [_text, _stext) from kernel code resource
Date: Wed, 8 Dec 2021 10:26:23 +0800
Message-ID: <20211208022623.15103-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Ya+EUDVYdBvRa7xI@kernel.org>
References: <Ya+EUDVYdBvRa7xI@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_182635_808177_B723AE58 
X-CRM114-Status: GOOD (  25.43  )
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

> On Fri, Dec 03, 2021 at 10:14:16PM +0800, Mark-PK Tsai wrote:
> > Remove the [_text, _stext) from Kernel Code.
> > Although there are some startup code in head.text, they
> > are freed to the buddy system after kernel boot.
>
> Hmm, I don't see it is being freed anywhere. Can you elaborate when and how
> the range [_text, _stext) is freed?

arm_memblock_init() reserve [KERNEL_START, KERNEL_END) which are defined as following.

#define KERNEL_START            _stext
#define KERNEL_END              _end

free_low_memory_core_early() free all the non-reserved range in lowmem,
so the range [_text, _stext) is also freed here.

>
> > And we have memory protection mechanism use this
> > which have false alarm when some other IPs doing dma
> > if the dma page frame is in the [_text, _stext).
> >
> > Below are my iomem resource and reserved memory information:
> > console:/ # grep Kernel /proc/iomem
> >   20208000-219fffff : Kernel code
> >   21b00000-21c2e76f : Kernel data
> >
> > console:/ # cat /sys/kernel/debug/memblock/reserved
> > 0: 0x20201000..0x20207fff
> > 1: 0x20300000..0x21c2e76f
>
> What are the addresses of _text and _stext in your configuration?

va	 pa
c0008000 20208000 _text
c0100000 20300000 _stext

>
> What these dumps are supposed to show here?
>

Below is the dump info after applied this patch.

console:/ # grep Kernel /proc/iomem
  20300000-219fffff : Kernel code
  21b00000-21c2e76f : Kernel data

console:/ # cat /sys/kernel/debug/memblock/reserved
0: 0x20201000..0x20207fff
1: 0x20300000..0x21c2e76f

The difference is that Kernel Code resource match the reserved memblock 1
which is reserved in arm_memblock_init().

>
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  arch/arm/kernel/setup.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> > index 284a80c0b6e1..85ffc9501e38 100644
> > --- a/arch/arm/kernel/setup.c
> > +++ b/arch/arm/kernel/setup.c
> > @@ -851,7 +851,7 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
> >  	struct resource *res;
> >  	u64 i;
> >
> > -	kernel_code.start   = virt_to_phys(_text);
> > +	kernel_code.start   = virt_to_phys(_stext);
> >  	kernel_code.end     = virt_to_phys(__init_begin - 1);
> >  	kernel_data.start   = virt_to_phys(_sdata);
> >  	kernel_data.end     = virt_to_phys(_end - 1);
> > --
> > 2.18.0
> >
>
> --
> Sincerely yours,
> Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
