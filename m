Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9284BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFyRVkF7OvNxupJz2dF8zanDR60NQ1Atk2NEq5EExUs=; b=zr5VT+Kl7GW5va
	PC9AmycgS9lfrziweD6Zg8ei6vDMMpcSv5nlY5r0cf01NleeC6sVmAkkaGsVs0w6JRCYmrHDnm9BY
	ssvXu65JsveSkhbFcmSdX2G/4wrPJkbDyVQknPPwZtCG8cydi8YiOWO8WbNH2H42bYgh8AvtH1htu
	r03y8sOADoct14fpKZscs6uQUVdFiKzso4Om7e53A0VhUMJVYb8w4GuJFiKcZaKtp47nI4vOBWvZX
	8POObACty3dROJDwZQtZOtM2tNq/nTNtoeM+OhX1KrpCI5CbvoKY2O6NVVQMrybia4iPoUo6vA+sK
	traQQj1icRAIvT04dWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmdD-004FbP-BO; Thu, 16 Dec 2021 09:00:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmcE-004F0e-NE; Thu, 16 Dec 2021 08:59:56 +0000
X-UUID: 1b131fc82b30407d979ff841a0076787-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=H1udBS3aTyDbK3s3oJIROCs2v4Fm/yjfNUh4OxuNKz4=; 
 b=Op0PfH90YkV6I0red8SHQ7d7qOIksVzSaWcqtILkTf78rahYIbNp/WHTpQSEdF/9Zo1KhuxszklzqVqAqpGHIaOV3tSq1+A2JMhPVvzAq57bs/t8UkciXXKedP4Ht23COIlLhWjYQ22TinZMMIK/4FiWyGS8hBIth+26nsmOmuI=;
X-UUID: 1b131fc82b30407d979ff841a0076787-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1445231143; Thu, 16 Dec 2021 01:59:51 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 00:43:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 16 Dec 2021 16:43:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 16:43:17 +0800
Message-ID: <09a2c51d7d71d0b6419b470224466efac4ab6afa.camel@mediatek.com>
Subject: Re: [PATCH 3/3] usb: mtu3: fix list_head check warning
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, "Yuwen
 Ng" <yuwen.ng@mediatek.com>
Date: Thu, 16 Dec 2021 16:43:19 +0800
In-Reply-To: <YbdWiYU+LJHWd4wQ@kroah.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
 <20211209031424.17842-3-chunfeng.yun@mediatek.com>
 <YbdWiYU+LJHWd4wQ@kroah.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_005954_956040_50E53BA7 
X-CRM114-Status: GOOD (  12.80  )
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

On Mon, 2021-12-13 at 15:19 +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 09, 2021 at 11:14:24AM +0800, Chunfeng Yun wrote:
> > This is caused by uninitialization of list_head.
> > 
> > BUG: KASAN: use-after-free in __list_del_entry_valid+0x34/0xe4
> > 
> > Call trace:
> > dump_backtrace+0x0/0x298
> > show_stack+0x24/0x34
> > dump_stack+0x130/0x1a8
> > print_address_description+0x88/0x56c
> > __kasan_report+0x1b8/0x2a0
> > kasan_report+0x14/0x20
> > __asan_load8+0x9c/0xa0
> > __list_del_entry_valid+0x34/0xe4
> > mtu3_req_complete+0x4c/0x300 [mtu3]
> > mtu3_gadget_stop+0x168/0x448 [mtu3]
> > usb_gadget_unregister_driver+0x204/0x3a0
> > unregister_gadget_item+0x44/0xa4
> > 
> > Reported-by: Yuwen Ng <yuwen.ng@mediatek.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/mtu3/mtu3_gadget.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> What commit does this fix?  Should it go to stable kernels?
I add it in next version, thanks
> 
> thanks,
> 
> greg k-h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
