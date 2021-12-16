Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A70C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qR2rblus/tviVoxScAVSYbObw/qwK7b8oVLYhQdvH+4=; b=vIOWVJopW2wqAo
	8vlr4zr1ObPnOwHiFERYmwm5OMkLBN7VI019BFNCPRuoaNs2qVKpZwlOaOdEPAEm18Gg8JMiirnIW
	dE9aUB661/IMxXMHcwhxxTihKM/u24mPXArlkGBraSLr0ctOmS6x0wzGa6aCFF945BvDazkVqvLgp
	6Q67V6DQigHxj9zudC22O84P6oCJxKNr1aQ528NeibDyDI3qNfHqSlw3NrggYmbe+5bUFJJyfUz1D
	bhfWcFpgHu15LE1F3qZjRYSFP7s2E/Wg6ItsHmWZ0k6AyLyesRCuM6IuhmWV4YvJYW2tllrFiLqzI
	zBgke8hzIELb4Zvn4z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxsT5-006K6N-BE; Thu, 16 Dec 2021 15:14:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxsSq-006K2U-P4; Thu, 16 Dec 2021 15:14:39 +0000
X-UUID: 3cfbe583c12f49349c1ee468485749bc-20211216
X-UUID: 3cfbe583c12f49349c1ee468485749bc-20211216
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1693115015; Thu, 16 Dec 2021 08:14:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 07:14:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 16 Dec 2021 23:14:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Dec 2021 23:14:28 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
CC: <akpm@linux-foundation.org>, <arnd@arndb.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux@armlinux.org.uk>,
 <linux@roeck-us.net>, <matthias.bgg@gmail.com>, <rmk+kernel@armlinux.org.uk>, 
 <rppt@kernel.org>, <wangkefeng.wang@huawei.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] arm: remove [_text, _stext) from kernel code resource
Date: Thu, 16 Dec 2021 23:14:28 +0800
Message-ID: <20211216151428.12765-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211208102237.19706-1-mark-pk.tsai@mediatek.com>
References: <20211208102237.19706-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_071436_848645_121BA6C5 
X-CRM114-Status: GOOD (  29.38  )
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

> > On Wed, Dec 08, 2021 at 10:26:23AM +0800, Mark-PK Tsai wrote:
> > > > On Fri, Dec 03, 2021 at 10:14:16PM +0800, Mark-PK Tsai wrote:
> > > > > Remove the [_text, _stext) from Kernel Code.
> > > > > Although there are some startup code in head.text, they
> > > > > are freed to the buddy system after kernel boot.
> > > >
> > > > Hmm, I don't see it is being freed anywhere. Can you elaborate when and how
> > > > the range [_text, _stext) is freed?
> > > 
> > > arm_memblock_init() reserve [KERNEL_START, KERNEL_END) which are defined as following.
> > > 
> > > #define KERNEL_START            _stext
> > > #define KERNEL_END              _end
> > > 
> > > free_low_memory_core_early() free all the non-reserved range in lowmem,
> > > so the range [_text, _stext) is also freed here.
> > 
> > Right, I've misread KERNEL_START as if it was _text...
> >  
> > > >
> > > > > And we have memory protection mechanism use this
> > > > > which have false alarm when some other IPs doing dma
> > > > > if the dma page frame is in the [_text, _stext).
> > > > >
> > > > > Below are my iomem resource and reserved memory information:
> > > > > console:/ # grep Kernel /proc/iomem
> > > > >   20208000-219fffff : Kernel code
> > > > >   21b00000-21c2e76f : Kernel data
> > > > >
> > > > > console:/ # cat /sys/kernel/debug/memblock/reserved
> > > > > 0: 0x20201000..0x20207fff
> > > > > 1: 0x20300000..0x21c2e76f
> > > >
> > > > What are the addresses of _text and _stext in your configuration?
> > > 
> > > va	 pa
> > > c0008000 20208000 _text
> > > c0100000 20300000 _stext
> > > 
> > > >
> > > > What these dumps are supposed to show here?
> > > >
> > > 
> > > Below is the dump info after applied this patch.
> > > 
> > > console:/ # grep Kernel /proc/iomem
> > >   20300000-219fffff : Kernel code
> > >   21b00000-21c2e76f : Kernel data
> > > 
> > > console:/ # cat /sys/kernel/debug/memblock/reserved
> > > 0: 0x20201000..0x20207fff
> > > 1: 0x20300000..0x21c2e76f
> > > 
> > > The difference is that Kernel Code resource match the reserved memblock 1
> > > which is reserved in arm_memblock_init().
> > 
> > For that I'd extend the reservation in arm_memblock_init() to include
> > [_text, _stext). 
> > 
> > Even if the code there is not needed after init, at least we'll keep this
> > consistent with other architectures.
> >  
> 
> Extending the reservation in arm_memblock_init() will consume up to SECTION_SIZE
> memory for SECTION_SIZE alignment when CONFIG_STRICT_KERNEL_RWX=y.
> So we really don't want to extend the reservation because it affect
> the low RAM devices.
> 
> And arm64_memblock_init() also reserve [_stext, _end) in the recent kernel.

Hi,

Is there anything wrong with this patch?
Either extend the reserved range or remove the head.text from iomem resource
can fix the issue.
So if you have any concern about it please let me know.

Thanks!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
