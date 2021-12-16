Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E940C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 08:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lz36Xg0pyamskqN42dIDiYJrqZ1wvobQlbyEPMgQyW8=; b=QCpdpLERtDCt2P
	zhQlw3NAd78KcELHmo3fPjmxRQk5BlufHjJxFRYC9WUOYKQK7vWrviF4Y6kb/c1ol+ZPdLsK4PXrG
	bmmUUxYxNgfJziCpUSRyMmzrb3gcY0tG+inpHPO/5ZINHLe0vMsm5WMkLAKbeh/arTTx+Khbexnzw
	iZjStslhew2jQDN72hmP1sQpzkQI8S1t0E6HlFaqdDlGwy9lIOy1xm/gc0AL2iD3x4dvbKFHc9XLd
	AJ6jWrQ3WQw2uRjaDc7Xc1kPaOfFiNR3d6IwMNXFyim8gei3HeY0IAUJMM50ttcthhGKXLr/7/zQy
	m8VoB648NmpVaIMUzDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmCD-0047im-F6; Thu, 16 Dec 2021 08:33:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmC0-0047fx-6i; Thu, 16 Dec 2021 08:32:50 +0000
X-UUID: fa0547f962fc40cab41cc3a174d30b27-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dmUwalDvL5wMFfVnZd9V2DFI7Cl0Jt//E7VNQ49dQ00=; 
 b=ZmUxca8LvJaqOUf3RUohF2slPBDoKKe89O3ijLciy5//m2Wqljc0caU4mNGfGRNTG1nk0cZ/Pggxb3PbVfm7XNBTNyXj7DfDNn8iscUJiWqYvMp9MTuaOPzuHysL971CQxbtZFLKSjwgUjpNwzza1ImqqdsvRJMRYUYE5aJFjyw=;
X-UUID: fa0547f962fc40cab41cc3a174d30b27-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1937337829; Thu, 16 Dec 2021 01:32:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 00:32:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 16 Dec 2021 16:32:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 16:32:25 +0800
Message-ID: <aff31f9073b7c0a9a5500ded69ddaab27cd5e879.camel@mediatek.com>
Subject: Re: [PATCH 2/3] usb: mtu3: add memory barrier before set GPD's HWO
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, "Yuwen
 Ng" <yuwen.ng@mediatek.com>, <stable@vger.kernel.org>
Date: Thu, 16 Dec 2021 16:32:26 +0800
In-Reply-To: <YbdWI5PD3e6uFz8U@kroah.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
 <20211209031424.17842-2-chunfeng.yun@mediatek.com>
 <YbdWI5PD3e6uFz8U@kroah.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_003248_279181_7C27FF35 
X-CRM114-Status: GOOD (  28.21  )
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

On Mon, 2021-12-13 at 15:18 +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 09, 2021 at 11:14:23AM +0800, Chunfeng Yun wrote:
> > There is a seldom issue that the controller access invalid address
> > and trigger devapc or emimpu violation. That is due to memory
> > access
> > is out of order and cause gpd data is not correct.
> > Make sure GPD is fully written before giving it to HW by setting
> > its
> > HWO.
> > 
> > Fixes: 48e0d3735aa5 ("usb: mtu3: supports new QMU format")
> > Cc: stable@vger.kernel.org
> > Reported-by: Eddie Hung <eddie.hung@mediatek.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/mtu3/mtu3_qmu.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/mtu3/mtu3_qmu.c
> > b/drivers/usb/mtu3/mtu3_qmu.c
> > index 3f414f91b589..34bb5ac67efe 100644
> > --- a/drivers/usb/mtu3/mtu3_qmu.c
> > +++ b/drivers/usb/mtu3/mtu3_qmu.c
> > @@ -273,6 +273,8 @@ static int mtu3_prepare_tx_gpd(struct mtu3_ep
> > *mep, struct mtu3_request *mreq)
> >  			gpd->dw3_info |= cpu_to_le32(GPD_EXT_FLAG_ZLP);
> >  	}
> >  
> > +	/* make sure GPD is fully written before giving it to HW */
> > +	mb();
> 
> So this means you are using mmio for this structure? 
No, it's a noncached memory.

>  If so, shouldn't
> you be using normal io memory read/write calls as well and not just
> "raw" pointers like this:
> 
> >  	gpd->dw0_info |= cpu_to_le32(GPD_FLAGS_IOC | GPD_FLAGS_HWO);
> 
> Are you sure this is ok?
> 
> Sprinkling around mb() calls is almost never the correct solution.
> 
> If you need to ensure that a write succeeds, shouldn't you do a read
> from it afterward?  Many busses require this, doesn't yours?
It works for register access.
Here is noncache memory access, add mb(), just want to prohibite both
the compiler and CPU from reordering read/writes.

> 
> 
> 
> >  
> >  	mreq->gpd = gpd;
> > @@ -306,6 +308,8 @@ static int mtu3_prepare_rx_gpd(struct mtu3_ep
> > *mep, struct mtu3_request *mreq)
> >  	gpd->next_gpd = cpu_to_le32(lower_32_bits(enq_dma));
> >  	ext_addr |= GPD_EXT_NGP(mtu, upper_32_bits(enq_dma));
> >  	gpd->dw3_info = cpu_to_le32(ext_addr);
> > +	/* make sure GPD is fully written before giving it to HW */
> > +	mb();
> 
> Again, mb(); does not ensure that memory-mapped i/o actually hits the
> HW.  Or if it does on your platform, how?
Maybe the comment is misleading, I'll change it, here just want to
prevent reordering of compiler and cpu.
> 
> mb() is a compiler barrier, not a memory write to a bus
> barrier.  Please
> read Documentation/memory-barriers.txt for more details.
Ok, I'll do.

Thanks a lot

> 
> thanks,
> 
> greg k-h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
