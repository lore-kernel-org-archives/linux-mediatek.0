Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FBFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Pzf5uBLcez01cLu4ppiHH5ixptyDEbDLzVWQV4qpA4=; b=zfKnp3Um6TZ0R0
	4LuOhuF1ty33MhPlrbDWIp1kwHAQ9Ln6g1thAdWvYK39HA6DXR42BATr/chulTMexzbIM8zckU+TD
	KMd7Xw8MsAdYkv47Ham6uVbQPl4G8UhkDAb5y2riSYZzXOkkxF/8pUo5v43mCq2O1edr1F5czzspv
	Ced84GAfSW/jQGdL1fn2SDAG64Qb36E6zesf1Z8np+9jhjX+g4hFzbPwSno49czNyf4OTrl9iIONA
	s/GV/H8OvcP54T7EKvwCUasHQLtLYEUHTzs/Vq5Jl8hUpAH6/fY3pflU1OlchYXefciQESosyvX+7
	3XiElpsKEsayS9fO/mxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvUZJ-000WBp-RU; Fri, 10 Dec 2021 01:19:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvUZ7-000W9x-4x; Fri, 10 Dec 2021 01:19:14 +0000
X-UUID: d05465a9fb8d4dbda7f044c3872d21c9-20211209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mhsm8jCjmfVJ/4gC6JOmYGvhXbLLDDj8f2KrlI9H3IU=; 
 b=lImAdM4xESUIaVHW1FZtOcW+g1qxAX1dPiqLHbyMOtOCBIMkwTVnH6MlyVXe5KDHESFcRg+RfYqpU0XG3kijSXBUaBMTXEQ42Z8j0gbn/W7/C/2EMScjLkWpVuuuQ/yvwRpzuatgQrdOyrHnmlR2kZuqv7UxG+8Y06NbcqwamyY=;
X-UUID: d05465a9fb8d4dbda7f044c3872d21c9-20211209
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1431485796; Thu, 09 Dec 2021 18:19:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Dec 2021 17:19:06 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 10 Dec 2021 09:19:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 09:19:04 +0800
Message-ID: <2cdc5d2997b4d37f891bf60f476135b1cdfaa810.camel@mediatek.com>
Subject: Re: [PATCH 3/3] usb: mtu3: fix list_head check warning
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, "Yuwen
 Ng" <yuwen.ng@mediatek.com>
Date: Fri, 10 Dec 2021 09:19:05 +0800
In-Reply-To: <b77c0732-460f-cf30-c759-d51d37763894@omp.ru>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
 <20211209031424.17842-3-chunfeng.yun@mediatek.com>
 <b77c0732-460f-cf30-c759-d51d37763894@omp.ru>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_171913_221764_2C1AC3CA 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

On Thu, 2021-12-09 at 12:10 +0300, Sergey Shtylyov wrote:
> Hello!
> 
> On 09.12.2021 6:14, Chunfeng Yun wrote:
> 
> > This is caused by uninitialization of list_head.
> 
>     No such word, suggesting to replace with "not initializing". :-)
Will fix it, thanks

> 
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
> 
> [...]
> 
> MBR, Sergey
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
