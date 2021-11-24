Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12361C43219
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 02:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljOiTM9g6qxLaIUISD0y+WaudH3j4IjNDbhbYNuHr1E=; b=PoJsc1SKPQu4kO
	uAoq8oeZo0xafW1tKvO4UvU7z3fCjMQrMRjsl7FwqWDZo2I0NzuvnRv/78lF4qEGI1qnrG0cKJMt7
	r2uIlkLODdd2RXso1Q37K/C+XWRsUmLNsQxglQhlb7tb9hCvhJNNQ027/wgRhZyRXSmt50cZHWEge
	JxK6BVNGohATti9q8p8axf/waTr5o3iNugOLl6tgkS91MjCmIfkkrAePZYKGDqeqxcaOF9bPiIIqm
	fB0xC27oMhv4CTTPMep9mmTAwbjh5DqXGRtWqSJuUPhrKg+8pMek91sXEuPgnAKAqqxXA0MmwtM4h
	7KgfWohwpqg34yzI2I7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mphaw-003o4d-QH; Wed, 24 Nov 2021 02:01:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mphag-003o2K-UL; Wed, 24 Nov 2021 02:00:57 +0000
X-UUID: f90d725ff22f4a46a7527295f8d9f89c-20211123
X-UUID: f90d725ff22f4a46a7527295f8d9f89c-20211123
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 351253479; Tue, 23 Nov 2021 19:00:48 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 18:00:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Nov 2021 10:00:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Nov 2021 10:00:45 +0800
Message-ID: <3de431c5711c0f6475f54e89c3de601e1279752a.camel@mediatek.com>
Subject: Re: [PATCH] kmemleak: fix kmemleak false positive report with HW
 tag-based kasan enable
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Chinwen Chang =?UTF-8?Q?=28=E5=BC=B5=E9=8C=A6=E6=96=87=29?="
 <chinwen.chang@mediatek.com>, Nicholas Tang
 =?UTF-8?Q?=28=E9=84=AD=E7=A7=A6=E8=BC=9D=29?= <nicholas.tang@mediatek.com>,
 Yee Lee =?UTF-8?Q?=28=E6=9D=8E=E5=BB=BA=E8=AA=BC=29?= <Yee.Lee@mediatek.com>, 
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, kasan-dev <kasan-dev@googlegroups.com>, 
 <james.hsu@mediatek.com>, <kuan-ying.lee@mediatek.com>
Date: Wed, 24 Nov 2021 10:00:45 +0800
In-Reply-To: <20211119144359.b70d2fde7631bd14cd9652e3@linux-foundation.org>
References: <20211118054426.4123-1-Kuan-Ying.Lee@mediatek.com>
 <754511d9a0368065768cc3ad8037184d62c3fbd1.camel@mediatek.com>
 <CA+fCnZddknY6XLychkAUkf9eYvEW4z9Oyr8cZb2QfBMDkJ23zg@mail.gmail.com>
 <c5cfd0c41dee93cd923762a6e0d61baea52cec8d.camel@mediatek.com>
 <20211119144359.b70d2fde7631bd14cd9652e3@linux-foundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_180055_016534_051BFBDA 
X-CRM114-Status: GOOD (  17.67  )
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

On Sat, 2021-11-20 at 06:43 +0800, Andrew Morton wrote:
> On Fri, 19 Nov 2021 23:12:55 +0800 Kuan-Ying Lee <
> Kuan-Ying.Lee@mediatek.com> wrote:
> 
> > > > > Call sequence:
> > > > > ptr = kmalloc(size, GFP_KERNEL);
> > > > > page = virt_to_page(ptr);
> > > > > kfree(page_address(page));
> > > > > ptr = kmalloc(size, GFP_KERNEL);
> > > 
> > > How is this call sequence valid? page_address returns the address
> > > of
> > > the start of the page, while kmalloced object could have been
> > > located
> > > in the middle of it.
> > 
> > Thanks for pointing out. I miss the offset.
> > 
> > It should be listed as below.
> > 
> > ptr = kmalloc(size, GFP_KERNEL);
> > page = virt_to_page(ptr);
> > offset = offset_in_page(ptr);
> > kfree(page_address(page) + offset);
> > ptr = kmalloc(size, GFP_KERNEL);
> 
> I updated the changelog to reflect this.

Thanks for updating changelog. :)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
