Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE10C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 02:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5U0/pvX/552WBq46G8XqYXUKGmx6HowBb2fVxMGiq4=; b=HSxU6Kwtw6RUIj
	dY2gbYFw3TOgUPlctgwLQ3bqjUlZQgkYFQ0ksxT9XwYTwP5nj3taq2J2mxdaYNDpFEHGpM+EmDj7B
	a0QvozAEXCPzDHEMuwvwGlANstK7A3zVa3P7AHLhn6qeBDnx77N84W+ICaZ+taGX6TFDdDR/xObRm
	tzPB6fWQCCVeHXpB+MT5qezcxID/XQGr6ceVON28+FjRwGnbnk0rQ9mFOXOGfIb/FbjNwi2rBLdjW
	//YGYkti/L+Q6TWkfWI+V55rt1Q/jALhGhWzjruojiJEX8CI/rs7PeRL+99ceX5/L80MThdyJebG2
	HNLVZF7ud4ZKhTp1fSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxfv9-00Cz97-Dp; Sun, 05 Jun 2022 02:23:15 +0000
Received: from m1322.mail.163.com ([220.181.13.22])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxfuv-00Cyvz-Pd; Sun, 05 Jun 2022 02:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Ou0NC
	Ock2iTr/mjmANBuaCkErVdvPD5EtAZbFlxHnWU=; b=WEJSbHO1wgybIbJp8Ual3
	cQyAJ3bJFkZyS4PBysP7zcDHkJdyo7ABvp8ftMbx16XCCoegZuEG9rtUXXPVj6WC
	nz5yIMAkfXhOjylUGq+FBW95NyUlRoSC2aC1VyhWdl/G7RnsqcRg5kIdDA1thZ94
	HtOFPkU2IFL423PYST2WN4=
Received: from chen45464546$163.com ( [171.221.147.121] ) by
 ajax-webmail-wmsvr22 (Coremail) ; Sun, 5 Jun 2022 10:22:26 +0800 (CST)
X-Originating-IP: [171.221.147.121]
Date: Sun, 5 Jun 2022 10:22:26 +0800 (CST)
From: "Chen Lin" <chen45464546@163.com>
To: "Alexander Duyck" <alexander.duyck@gmail.com>
Cc: "Felix Fietkau" <nbd@nbd.name>, "Jakub Kicinski" <kuba@kernel.org>, 
	"John Crispin" <john@phrozen.org>, 
	"Sean Wang" <sean.wang@mediatek.com>, Mark-MC.Lee@mediatek.com, 
	"David Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, 
	"Paolo Abeni" <pabeni@redhat.com>, matthias.bgg@gmail.com, 
	Netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re:Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem
 alloc interface netdev[napi]_alloc_frag
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <CAKgT0UdR-bdiZXsV_=8yJUS8zjoO6jeBS5bKNWAyxwLCiOP8ZQ@mail.gmail.com>
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
 <1654245968-8067-1-git-send-email-chen45464546@163.com>
 <CAKgT0Uc9vSEJxrev10Uc3P==+tTip7+7W=AF2uE+VB3GVyOTxg@mail.gmail.com>
 <CAKgT0UdR-bdiZXsV_=8yJUS8zjoO6jeBS5bKNWAyxwLCiOP8ZQ@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <31d36b89.adf.18131abbaab.Coremail.chen45464546@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: FsGowAC3ezljE5xiZn4fAA--.30551W
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/xtbCqR0Xnl0Df0HRXwAAsT
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220604_192303_032757_EBB31A8D 
X-CRM114-Status: GOOD (  21.33  )
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

At 2022-06-03 23:33:25, "Alexander Duyck" <alexander.duyck@gmail.com> wrote:
>On Fri, Jun 3, 2022 at 8:25 AM Alexander Duyck
><alexander.duyck@gmail.com> wrote:
>>
>> On Fri, Jun 3, 2022 at 2:03 AM Chen Lin <chen45464546@163.com> wrote:
>> >
>> > When rx_flag == MTK_RX_FLAGS_HWLRO,
>> > rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
>> > netdev_alloc_frag is for alloction of page fragment only.
>> > Reference to other drivers and Documentation/vm/page_frags.rst
>> >
>> > Branch to use alloc_pages when ring->frag_size > PAGE_SIZE.
>> >
>> > Signed-off-by: Chen Lin <chen45464546@163.com>
>> > ---
>> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c |   22 ++++++++++++++++++++--
>> >  1 file changed, 20 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> > index b3b3c07..772d903 100644
>> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> > @@ -1467,7 +1467,16 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>> >                         goto release_desc;
>> >
>> >                 /* alloc new buffer */
>> > -               new_data = napi_alloc_frag(ring->frag_size);
>> > +               if (ring->frag_size <= PAGE_SIZE) {
>> > +                       new_data = napi_alloc_frag(ring->frag_size);
>> > +               } else {
>> > +                       struct page *page;
>> > +                       unsigned int order = get_order(ring->frag_size);
>> > +
>> > +                       page = alloc_pages(GFP_ATOMIC | __GFP_COMP |
>> > +                                           __GFP_NOWARN, order);
>> > +                       new_data = page ? page_address(page) : NULL;
>> > +               }
>> >                 if (unlikely(!new_data)) {
>> >                         netdev->stats.rx_dropped++;
>> >                         goto release_desc;
>> > @@ -1914,7 +1923,16 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>> >                 return -ENOMEM;
>> >
>> >         for (i = 0; i < rx_dma_size; i++) {
>> > -               ring->data[i] = netdev_alloc_frag(ring->frag_size);
>> > +               if (ring->frag_size <= PAGE_SIZE) {
>> > +                       ring->data[i] = netdev_alloc_frag(ring->frag_size);
>> > +               } else {
>> > +                       struct page *page;
>> > +                       unsigned int order = get_order(ring->frag_size);
>> > +
>> > +                       page = alloc_pages(GFP_KERNEL | __GFP_COMP |
>> > +                                           __GFP_NOWARN, order);
>> > +                       ring->data[i] = page ? page_address(page) : NULL;
>> > +               }
>> >                 if (!ring->data[i])
>> >                         return -ENOMEM;
>> >         }
>>
>> Actually I looked closer at this driver. Is it able to receive frames
>> larger than 2K? If not there isn't any point in this change.
>>
>> Based on commit 4fd59792097a ("net: ethernet: mediatek: support
>> setting MTU") it looks like it doesn't, so odds are this patch is not
>> necessary.
>
>I spoke too soon. I had overlooked the LRO part. With that being the
>case you can probably optimize this code to do away with the get_order
>piece entirely, at least during runtime. My main concern is that doing
>that in the fast-path will be expensive so you would be much better
>off doing something like
>get_order(mtk_max_frag_size(MTK_RX_FLAGS_HWLRO)) which would be
>converted into a constant at compile time since everything else would
>be less than 1 page in size.
>
>Also you could then replace alloc_pages with __get_free_pages which
>would take care of the page_address call for you.

Thanks for the tips. I'll try again.
It can also be seen from here it is easy to make mistakes in parameter fragsz.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
