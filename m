Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfNwh8HiNCYw1mt5vpgRiHwHMuWBq8Bs1BJVYPaUJVU=; b=NKC9KUp/JprIbP
	7Ul5eqs3N1EhBedH56smtKZgCFTSh79UhROCw1MVcolWrTlSiRiIqNa2h9PkIbkrkf4P/5O6H04vM
	X/g7x734sYHb6Y1fL0ML3DeDb0ODBVNyUOBpNKlL9DMKfGPs3D1vX8EYtPx+pe8NSARj3XDA0zPrb
	bN4r2gD0OGxUUZq9K7nVcjnOo83WGlX7MWkbjSYp29UAO2csG707CA4VIo7OpT6qSxBE9zEm080gi
	Rv4zs7NpyVWxDwm5GtFzuqAxH/Jm4YhXfdsr/oKtu+TgkA1HeyCyRiUJ6GldvsBJye2BsBOSpk0tj
	Fr/23o6UTc7Jyn3gNcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmVJ-004CNE-CG; Thu, 16 Dec 2021 08:52:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmVF-004CM6-NP; Thu, 16 Dec 2021 08:52:43 +0000
X-UUID: 98de3d6aa752415c9a0b4122c065588e-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+IojS5yeYRx75FMM30KE+W/+YeDH20EiSGjnrXmbJa4=; 
 b=s4gvNvjIopQ3LELm09NUh80VGh8Lh4g7QNvaWaVKBbvSuBjRd2ISLWWLLfpSgadsQux6iGipcQy70E026LQ2P6FgHQUhDF9ep91d//aEZUj4RtkMUwu+RPHEq4+3aDlsH0ndyvt5ylotH7xErFF0IFYDjjZHfxGkoUrfqR8DQzs=;
X-UUID: 98de3d6aa752415c9a0b4122c065588e-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 33329740; Thu, 16 Dec 2021 01:52:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 00:45:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 16:45:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 16:45:39 +0800
Message-ID: <e04620d000dfa009bceeaca0a18d17a6be81f706.camel@mediatek.com>
Subject: Re: [PATCH 1/3] usb: mtu3: fix interval value for intr and isoc
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, "Yuwen
 Ng" <yuwen.ng@mediatek.com>
Date: Thu, 16 Dec 2021 16:45:40 +0800
In-Reply-To: <YbdWmQMck/WGYJ4/@kroah.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
 <YbdWmQMck/WGYJ4/@kroah.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_005241_926749_1C8740F4 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, 2021-12-13 at 15:20 +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 09, 2021 at 11:14:22AM +0800, Chunfeng Yun wrote:
> > Use the Interval value from isoc/intr endpoint descriptor, no need
> > minus one. But the original code doesn't cause transfer error for
> > normal cases, due to the interval is less than the host request.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/mtu3/mtu3_gadget.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> What commit does this fix?
The interval between transfers is less than the Interval value, I add
it in commit massage when send out v2.

Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
